unit uu_rel_compras_por_cfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit;

type
  TfrmRelatorioComprasPorCFOP = class(Tfrm_modelo_vazio)
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
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_cfop_entrada: TSpeedButton;
    ed_cefop_entradas: TMaskEdit;
    Panel7: TPanel;
    ed_descricao_cfop_entradas: TMaskEdit;
    gpOrdem: TRadioGroup;
    procedure BitBtn2Click(Sender: TObject);

    function  verificaValidade() : boolean;
    procedure imprimirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioComprasPorCFOP: TfrmRelatorioComprasPorCFOP;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelatorioComprasPorCFOP.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;



function TfrmRelatorioComprasPorCFOP.verificaValidade() : boolean;
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

procedure TfrmRelatorioComprasPorCFOP.imprimirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryCompras.Active:=false;
  dRelatorios.qryCompras.sql.Clear;


  dRelatorios.qryCompras.sql.add('   select e.*, f.razao_social, m.descricao as desc_modelo, c.descricao as desc_cfop');
  dRelatorios.qryCompras.sql.add('     from entradas e ');
  dRelatorios.qryCompras.sql.add('       inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
  dRelatorios.qryCompras.sql.add('       inner join modelos_nf m on (m.codigo = e.modelo_nota)');
  dRelatorios.qryCompras.sql.add('       inner join cfop c on (c.codigo = e.cfop_nota)');

  dRelatorios.qryCompras.sql.add('     where e.data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));
  dRelatorios.qryCompras.SQL.add(' and e.cod_fornecedor like '+Quotedstr(ed_cod_fornecedor.text+'%'));
  dRelatorios.qryCompras.SQL.add(' and e.cfop_nota like '+Quotedstr(ed_cefop_entradas.text+'%'));

  dRelatorios.qryCompras.SQL.Add(' order by e.cfop_nota');

  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeComprasPorCFOP.fr3',true);

  case gpOrdem.ItemIndex of
   0 : begin
        dRelatorios.qryCompras.SQL.Add(',e.cod_entrada');
       end;

   1 : begin
        dRelatorios.qryCompras.SQL.Add(',e.data_entrada ');
       end;

   2 : begin
        dRelatorios.qryCompras.SQL.Add(',e.cod_fornecedor');
       end;

   3 : begin
        dRelatorios.qryCompras.SQL.Add(',e.modelo_nota');
       end;

   4 : begin
        dRelatorios.qryCompras.SQL.Add(',e.total_nota ');
       end;
  end;


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



procedure TfrmRelatorioComprasPorCFOP.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   imprimirRelatorio();
end;

procedure TfrmRelatorioComprasPorCFOP.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edAte.Date:=Date;
  edDe.SetFocus;

end;

end.
