unit uu_rel_compras_por_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, Mask, RxToolEdit,
  Vcl.ActnList, System.Actions;

type
  TfrmRelEntradasPorFornecedor = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    gpOrdem: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
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
    cknItensNota: TCheckBox;

    function  verificaValidade() : boolean;
    procedure imprimirRelatorio();

    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEntradasPorFornecedor: TfrmRelEntradasPorFornecedor;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}


function TfrmRelEntradasPorFornecedor.verificaValidade() : boolean;
begin

  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
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

procedure TfrmRelEntradasPorFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edAte.Date:=Date;
  edDe.SetFocus;
end;

procedure TfrmRelEntradasPorFornecedor.imprimirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryCompras.Active:=false;
  dRelatorios.qryCompras.sql.Clear;


  dRelatorios.qryCompras.sql.add('   select e.*, f.razao_social, m.descricao as desc_modelo');
  dRelatorios.qryCompras.sql.add('     from entradas e ');
  dRelatorios.qryCompras.sql.add('       inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
  dRelatorios.qryCompras.sql.add('       inner join modelos_nf m on (m.codigo = e.modelo_nota)');

  dRelatorios.qryCompras.sql.add('     where e.data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));
  dRelatorios.qryCompras.SQL.add(' and e.cod_fornecedor like '+Quotedstr(ed_cod_fornecedor.text+'%'));

  IF cknItensNota.Checked  then
    dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeComprasPorFornecedor.fr3',true)
  else
   dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeComprasPorFornecedorSemItens.fr3',true);

  case gpOrdem.ItemIndex of
   0 : begin
        dRelatorios.qryCompras.SQL.Add(' order by e.cod_entrada');
       end;

   1 : begin
        dRelatorios.qryCompras.SQL.Add('order by e.data_entrada ');
       end;

   2 : begin
        dRelatorios.qryCompras.SQL.Add('order by e.cod_fornecedor');
       end;

   3 : begin
        dRelatorios.qryCompras.SQL.Add('order by e.modelo_nota');
       end;

   4 : begin
        dRelatorios.qryCompras.SQL.Add('order by e.total_nota ');
       end;
  end;




  dm.adicionaLog(dRelatorios.qryCompras.SQL.Text );


  dRelatorios.qryCompras.Active:=true;

  if  not  dRelatorios.qryCompras.IsEmpty then
   begin
     dRelatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);

     dRelatorios.rpt.ShowReport(true);
     dRelatorios.qryCompras.Active:=false;
   end
  else
   ShowMessage('Não existem lançamentos de compra para o período e/ou filtros informados');
end;


procedure TfrmRelEntradasPorFornecedor.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorFornecedor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   imprimirRelatorio();
end;

end.
