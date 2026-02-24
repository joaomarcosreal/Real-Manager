unit uu_rel_notas_saida_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelSaidasPorFornecedor = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSaidasPorFornecedor: TfrmRelSaidasPorFornecedor;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}





function TfrmRelSaidasPorFornecedor.verificaValidade() : boolean;
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




procedure TfrmRelSaidasPorFornecedor.imprimirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qrySaidas.Active:=false;
  dRelatorios.qrySaidas.sql.Clear;

  dRelatorios.qrySaidas.sql.add('      select s.*, f.razao_social, m.descricao as desc_modelo, c.descricao as desc_cfop ');
  dRelatorios.qrySaidas.sql.add('      from saidas s');
  dRelatorios.qrySaidas.sql.add('        inner join fornecedor f on (f.cod_fornecedor = s.cod_fornecedor)');
  dRelatorios.qrySaidas.sql.add('        inner join modelos_nf m on (m.codigo = s.modelo_nota)');
  dRelatorios.qrySaidas.sql.add('        inner join cfop c on (c.codigo = s.cfop_nota)');
  dRelatorios.qrySaidas.sql.add('     where s.data_saida between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));
  dRelatorios.qrySaidas.SQL.add(' and s.cod_fornecedor like '+Quotedstr(ed_cod_fornecedor.text+'%'));

  IF cknItensNota.Checked  then
    dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeSaidasPorFornecedor.fr3',true)
  else
   dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeSaidasPorFornecedorSemItens.fr3',true);

  case gpOrdem.ItemIndex of
   0 : begin
        dRelatorios.qrySaidas.SQL.Add(' order by s.cfop_nota, s.cod_saida');
       end;

   1 : begin
        dRelatorios.qrySaidas.SQL.Add('order by s.cfop_nota,s.data_saida ');
       end;

   2 : begin
        dRelatorios.qrySaidas.SQL.Add('order by s.cfop_nota,s.cod_fornecedor');
       end;

   3 : begin
        dRelatorios.qrySaidas.SQL.Add('order by s.cfop_nota,s.modelo_nota');
       end;

   4 : begin
        dRelatorios.qrySaidas.SQL.Add('order by s.cfop_nota,e.total_nota ');
       end;
  end;


  dRelatorios.qrySaidas.Active:=true;

  if  not  dRelatorios.qrySaidas.IsEmpty then
   begin
     dRelatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);

     dRelatorios.rpt.ShowReport(true);
     dRelatorios.qrySaidas.Active:=false;
   end
  else
   ShowMessage('Não existem lançamentos de compra para o período e/ou filtros informados');
end;




procedure TfrmRelSaidasPorFornecedor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   imprimirRelatorio();

end;

procedure TfrmRelSaidasPorFornecedor.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelSaidasPorFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edAte.Date:=Date;
  edDe.SetFocus;

end;

end.
