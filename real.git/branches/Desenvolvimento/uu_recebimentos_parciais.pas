unit uu_recebimentos_parciais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, Mask, 
   Grids, DBGrids, DB,RxCurrEdit, RxMemDS, RxToolEdit, Vcl.ActnList,
  System.Actions;

type
  Tfrm_recebimento_parcial = class(Tfrm_modelo_vazio)
    Panel5: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    lb_mesa: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    bt_pesquisa_forma: TSpeedButton;
    Panel13: TPanel;
    Label43: TLabel;
    edDescricaoForma: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tbRecebimentosParciais: TRxMemoryData;
    tbRecebimentosParciaiscodForma: TStringField;
    tbRecebimentosParciaismesa: TStringField;
    tbRecebimentosParciaisvalor: TCurrencyField;
    tbRecebimentosParciaisdescricaoForma: TStringField;
    dsRecebimentosParciais: TDataSource;
    edCodFormaPagamento: TEdit;
    edValor: TCurrencyEdit;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    edTotalFormas: TCurrencyEdit;
    Label5: TLabel;
    tbRecebimentosParciaisHORA: TStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure adicionarRecebimentoParcial();
    procedure BuscaRecebimentosParciais();
    procedure apagaRecebimentoParcial();
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bt_pesquisa_formaClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_recebimento_parcial: Tfrm_recebimento_parcial;

implementation

uses uu_data_module, uu_frm_principal, uu_cs_formas_pagto;

{$R *.dfm}

procedure Tfrm_recebimento_parcial.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_recebimento_parcial.adicionarRecebimentoParcial();
begin
 dm.qryauxiliar.Active:= false;
 dm.qryauxiliar.sql.clear;
 dm.qryauxiliar.sql.add('insert into recebimento_parcial (mesa,cod_forma,valor,cod_usuario) values (');
 dm.qryauxiliar.SQL.add(''+Quotedstr(lb_mesa.Caption)+',');
 dm.qryauxiliar.SQL.Add(''+Quotedstr(edCodFormaPagamento.Text)+',');
 dm.qryauxiliar.SQL.add(''+dm.TrocaVirgPPto(FloatToStr(edValor.Value))+',');
 dm.qryauxiliar.SQL.Add(''+Quotedstr(codigo_usuario)+')');
 dm.qryauxiliar.ExecSQL;
 dm.transacao.Commit;


 edCodFormaPagamento.Clear;
 edDescricaoForma.Clear;
 edValor.Clear;
 edCodFormaPagamento.SetFocus;
end;


procedure Tfrm_recebimento_parcial.BitBtn1Click(Sender: TObject);
begin
  if (verificaExistenciaFormaPagto(edCodFormaPagamento.Text) = true ) then
   begin
     if ( dm.verificaTipoFormaPagamento(edCodFormaPagamento.Text) <>  2) then
      begin
        adicionarRecebimentoParcial;
        BuscaRecebimentosParciais;
        edCodFormaPagamento.SetFocus;
      end
     else
      showmessage(' Não é possível utlizar pagamento faturado (Pendura) em pagamentos parciais!');
   end;

end;

procedure Tfrm_recebimento_parcial.FormActivate(Sender: TObject);
begin
  inherited;
  BuscaRecebimentosParciais;
end;


procedure Tfrm_recebimento_parcial.BuscaRecebimentosParciais();
var
 totalFormas : double;
begin
  tbRecebimentosParciais.EmptyTable;
  tbRecebimentosParciais.Active :=true;


 dm.transacao.Active:=false;
 dm.transacao.Active :=true;
 dm.qryauxiliar.Active :=false;
 dm.qryauxiliar.sql.Clear;


 dm.qryauxiliar.SQL.add('select r.*,f.descricao from recebimento_parcial r inner join formas_pagamento f on (f.cod_forma = r.cod_forma) where r.mesa='+Quotedstr(lb_mesa.Caption));
 dm.qryauxiliar.Active :=true;
 dm.qryauxiliar.First;
 totalFormas := 0;


 while not dm.qryauxiliar.Eof do
  begin
    tbRecebimentosParciais.Append;
    tbRecebimentosParciaismesa.Value            := dm.qryauxiliar.fieldbyname('mesa').value;
    tbRecebimentosParciaiscodForma.Value        := dm.qryauxiliar.fieldbyname('cod_forma').value;
    tbRecebimentosParciaisdescricaoForma.Value  := dm.qryauxiliar.fieldbyname('descricao').value;
    tbRecebimentosParciaisvalor.Value           := dm.qryauxiliar.fieldbyname('valor').value;
    tbRecebimentosParciaisHORA.Value            := VarToStr(dm.qryauxiliar.fieldbyname('HORA').value);
    tbRecebimentosParciais.Post;
    totalFormas := totalFormas + dm.qryauxiliar.fieldbyname('valor').value;
    dm.qryauxiliar.Next;
  end;

 edTotalFormas.Value := totalFormas;
 dm.qryauxiliar.Active := false;
end;

procedure Tfrm_recebimento_parcial.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_escape then close;
end;

procedure Tfrm_recebimento_parcial.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 bold : boolean;

begin
  inherited;

  if odd(tbRecebimentosParciais.RecNo) then
begin
  DBGrid1.Canvas.Brush.Color:= clwhite;

end
else
 begin
  DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

 end;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

bold :=false;
TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clred; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure Tfrm_recebimento_parcial.Edit1Exit(Sender: TObject);
begin
  inherited;
  actExitFormaPagamentoExecute(Sender);
end;

procedure Tfrm_recebimento_parcial.apagaRecebimentoParcial();
begin
  if tbRecebimentosParciais.IsEmpty = false then
   begin
     if (dm.verificaPermissaoAcao('B20002015') = true) then
     begin
        if  (MessageDlg('Confirma exclusão do recebimento parcial ?', mtConfirmation, [mbYes,mbNo],0) = mryes) then
         begin
          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.add('delete from recebimento_parcial where mesa='+Quotedstr(lb_mesa.Caption)+' and cod_forma='+Quotedstr(tbRecebimentosParciaiscodForma.Value)+' and valor='+dm.TrocaVirgPPto(Floattostr(tbRecebimentosParciaisvalor.Value)));
          dm.qryauxiliar.SQL.Add(' and hora ='+QuotedStr(FormatDateTime('HH:MM:SS',StrToTime(tbRecebimentosParciaisHORA.value))));
          dm.qryauxiliar.ExecSQL;
          dm.transacao.Commit;
          BuscaRecebimentosParciais;
         end;
     end;
   end;
end;

procedure Tfrm_recebimento_parcial.BitBtn4Click(Sender: TObject);
begin
  inherited;
  apagaRecebimentoParcial();
end;

procedure Tfrm_recebimento_parcial.bt_pesquisa_formaClick(Sender: TObject);
begin
  inherited;
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select * from formas_pagamento');
  dm.qryauxiliar.Active:=true;
  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('Não existem formas de pagamento cadastrados!');
    Exit;
  end;
  Application.CreateForm(Tfrm_cs_formas_pagto,frm_cs_formas_pagto);;
  frm_cs_formas_pagto.ShowModal;
  frm_cs_formas_pagto.free;
  edCodFormaPagamento.Text:=string_auxiliar;
end;

procedure Tfrm_recebimento_parcial.BitBtn2Click(Sender: TObject);
begin
  inherited;
  dm.imprimeComprovanteRecebimentoParcial(marca_impressora_nao_fiscal_01,lb_mesa.Caption);
  close; 
end;

end.
