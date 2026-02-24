unit uu_rel_compras_por_grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelEntradasPorGrupo = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
    Panel9: TPanel;
    Label9: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Label10: TLabel;
    ed_cod_grupo: TMaskEdit;
    Panel10: TPanel;
    ed_desc_grupo: TMaskEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gpOrdem: TRadioGroup;
    procedure imprimirRelatorio();
    function  verificaValidade() : boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEntradasPorGrupo: TfrmRelEntradasPorGrupo;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelEntradasPorGrupo.imprimirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryComprasPorGrupo.Active:=false;
  dRelatorios.qryComprasPorGrupo.sql.Clear;

          dRelatorios.qryComprasPorGrupo.sql.add('select cp.*, ');
        dRelatorios.qryComprasPorGrupo.sql.add('  (  (subtotal - cp.desconto + cp.ipi + cp.outras) / cp.quantidade) as custo_medio,');
        dRelatorios.qryComprasPorGrupo.sql.add('  (  (subtotal - cp.desconto + cp.ipi + cp.outras) ) as total from (');
        dRelatorios.qryComprasPorGrupo.sql.add('   select ie.cod_item, vi.descricao_item,  ');
        dRelatorios.qryComprasPorGrupo.sql.add('           avg(ie.valor_unitario) as preco_medio,');
        dRelatorios.qryComprasPorGrupo.sql.add('           sum(quantidade) as quantidade,');
        dRelatorios.qryComprasPorGrupo.sql.add('           sum(ie.quantidade * ie.valor_unitario) as subtotal,');
        dRelatorios.qryComprasPorGrupo.sql.add('           sum(ie.desconto) as desconto,');
        dRelatorios.qryComprasPorGrupo.sql.add('           sum(ie.valor_ipi) as ipi,');
        dRelatorios.qryComprasPorGrupo.sql.add('           sum(ie.outras_despesas) outras,');
        dRelatorios.qryComprasPorGrupo.sql.add('           u.descricao as UnidadeEstoqueAnterior,');
        dRelatorios.qryComprasPorGrupo.sql.add('           vi.cod_g_raiz,');
        dRelatorios.qryComprasPorGrupo.sql.add('           vi.desc_g_raiz,');
        dRelatorios.qryComprasPorGrupo.sql.add('           vi.cod_g_pai,');
        dRelatorios.qryComprasPorGrupo.sql.add('           vi.desc_g_pai,');
        dRelatorios.qryComprasPorGrupo.sql.add('           vi.cod_grupo,');
        dRelatorios.qryComprasPorGrupo.sql.add('           vi.desc_grupo');
        dRelatorios.qryComprasPorGrupo.sql.add('     from  itens_entrada ie');
        dRelatorios.qryComprasPorGrupo.sql.add('     inner join unidades u on  ( u.cod_unidade = ie.cod_unidade_estoque_anterior)');
        dRelatorios.qryComprasPorGrupo.sql.add('     inner join entradas en on ( en.cod_entrada = ie.cod_entrada)');
        dRelatorios.qryComprasPorGrupo.sql.add('   inner join v_itens_estoque vi on (vi.cod_item = ie.cod_item)');
        dRelatorios.qryComprasPorGrupo.sql.add('  where en.data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));
        dRelatorios.qryComprasPorGrupo.SQL.add(' and en.cod_fornecedor like '+Quotedstr(ed_cod_fornecedor.text+'%'));
        dRelatorios.qryComprasPorGrupo.SQL.add(' and  vi.cod_grupo like  '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.qryComprasPorGrupo.sql.add('   group by ie.cod_item, vi.descricao_item, vi.cod_g_raiz, vi.desc_g_raiz, vi.cod_g_pai, vi.desc_g_pai , vi.cod_grupo, vi.desc_grupo, u.descricao');
        dRelatorios.qryComprasPorGrupo.sql.add('   order by vi.cod_g_raiz,vi.cod_g_pai,vi.cod_grupo, ie.cod_item) as cp');
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeComprasPorGrupoSintetico.fr3',true);

  ////dm.adicionalog(dRelatorios.qryComprasPorGrupo.SQL.Text);
  dRelatorios.qryComprasPorGrupo.Active:=true;



  if  not  dRelatorios.qryComprasPorGrupo.IsEmpty then
   begin
     dRelatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);
     dRelatorios.rpt.ShowReport(true);
     dRelatorios.qryComprasPorGrupo.Active:=false;
   end
  else
   ShowMessage('Não existem lançamentos de compra para o período e/ou filtros informados');
end;



function TfrmRelEntradasPorGrupo.verificaValidade() : boolean;
begin

  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
    result:=false;
    exit;
   end;


   if ( trim(ed_cod_fornecedor.Text) <> '') then
    begin
      if (verificaExistenciaFornecedor(ed_cod_fornecedor.Text) = false) then
        begin
          ShowMessage('Código de Fornecedor inválido');
          result:=false;
          exit;
        end;
    end;


  result:=true;
end;


procedure TfrmRelEntradasPorGrupo.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   imprimirRelatorio();

end;

procedure TfrmRelEntradasPorGrupo.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorGrupo.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edAte.Date:=Date;
  edDe.SetFocus;

end;

end.
