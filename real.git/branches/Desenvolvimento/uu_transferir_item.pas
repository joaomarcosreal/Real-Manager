unit uu_transferir_item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  uu_modelo_vazio,
  Dialogs, StdCtrls,   ExtCtrls, Buttons, RxLookup,
  AdvTouchKeyboard;

type
    Tfrm_transferir_item = class(Tfrm_modelo_vazio)
    Panel3: TPanel;
    Panel2: TPanel;
    bt_trasferir: TBitBtn;
    IAeverButton1: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    ed_mesa_destino: Tedit;
    Panel4: TPanel;
    Label4: TLabel;
    cmbMotivo: TRxDBLookupCombo;
    Panel6: TPanel;
    Label5: TLabel;
    memoObs: TMemo;
    Panel1: TPanel;
    Label2: TLabel;
    lbDescricaoProduto: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    lbQtde: TLabel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    procedure bt_trasferirClick(Sender: TObject);
    procedure IAeverButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ed_mesa_destinoExit(Sender: TObject);
    procedure ed_mesa_destinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_trasferirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IAeverButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure transfere_item(obs : string );
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_transferir_item: Tfrm_transferir_item;

implementation

uses uu_data_module, uu_frm_principal,  uu_caixa_restaurante;


{$R *.dfm}

procedure Tfrm_transferir_item.bt_trasferirClick(Sender: TObject);
var
obs : string;
begin
  inherited;
    obs:=obs + memoObs.lines.Text;




if MessageDlg('Confirma transferência  ?',mtConfirmation,[mbYes,mbNo],0) = mryes then
  begin
     transfere_item(obs);
  end;

end;

procedure Tfrm_transferir_item.transfere_item(obs : string );
var
codigo_lancamento : string;
begin
dm.transacao.Active:=true;
  try
    ed_mesa_destino.Text:=FormatFloat('0000',StrToFloat(ed_mesa_destino.text));
  except
   begin
     ShowMessage('Número da mesa inválido!');
     ed_mesa_destino.Clear;
     ed_mesa_destino.SetFocus;
     exit;
   end;
  end;


if ( StrToInt(ed_mesa_destino.Text) > 999 ) then
 begin
   ed_mesa_destino.Clear;
   Showmessage('Número de mesa inválido. Usar numerações até 999');
   ed_mesa_destino.SetFocus;
   ed_mesa_destino.Clear;
   Exit;
 end;


  dm.gravarTransferenciaDeItem(frm_caixa_restaurante.ed_numero_mesa.Text,ed_mesa_destino.Text,cmbMotivo.KeyValue,cmbMotivo.Text,
  dm.qry_movimento_mesa.fieldbyname('cod_barras').value,dm.qry_movimento_mesa.fieldbyname('descricao').value,StrToFloat(lbQtde.Caption)  ,(dm.qry_movimento_mesa.fieldbyname('valor_unitario').value),obs);



  dm.qryauxiliar.active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa='+QuotedStr(ed_mesa_destino.Text));
  dm.qryauxiliar.Active:=true;
  if ((dm.qryauxiliar.IsEmpty) or (dm.qryauxiliar.fieldbyname('novo_cod').IsNull)) then
  begin
    codigo_lancamento:='1';
    codigo_lancamento:=FormatFloat('0000',Strtofloat(codigo_lancamento));
  end
  else
   begin
     codigo_lancamento:=VarToStr(dm.qryauxiliar.fieldbyname('novo_cod').value);
     codigo_lancamento:=IntToStr(   StrToInt(codigo_lancamento)+1  );
     codigo_lancamento:=FormatFloat('0000',Strtofloat(codigo_lancamento));
   end;

  dm.qryauxiliar.Active:=False;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('update movimento_mesa set cod_mesa='+Quotedstr(ed_mesa_destino.Text)+',obs_paf='+Quotedstr('TRANSF. DA MESA '+dm.qry_movimento_mesa.fieldbyname('cod_mesa').value));
  dm.qryauxiliar.sql.add(',cod_movimento='+Quotedstr(codigo_lancamento)+' where cod_mesa='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_mesa').value));
  dm.qryauxiliar.sql.add(' and cod_movimento='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));

  try
   begin
    dm.qryauxiliar.ExecSQL;
    dm.transacao.Commit;
   end;
  except
   begin
    dm.cria_log_de_erros(dm.qryauxiliar.sql,'Caixa ','Erro ao transferir ',codigo_usuario);
    exit;
   end;
  end;
  if (dm.verificaSeAMesaFoiAberta(ed_mesa_destino.Text) = false ) then
   begin
    dm.efetuaAberturaDaMesa(ed_mesa_destino.text);
   end;

   
  Close;
end;

procedure Tfrm_transferir_item.IAeverButton1Click(Sender: TObject);
begin
   Close;
end;




procedure Tfrm_transferir_item.FormActivate(Sender: TObject);
begin

  ed_mesa_destino.SetFocus;

  dm.qryMotivosEstorno.Active:=true;
  cmbMotivo.KeyValue:='001';


end;

procedure Tfrm_transferir_item.ed_mesa_destinoExit(Sender: TObject);
begin



 if  sender is Tedit and ((sender as Tedit).Name='ed_mesa_destino') then
 begin

  if (dm.verificaMesaBalcao(ed_mesa_destino.Text) = true) then
  begin
    ShowMessage('O ítem não pode ser transferido para essa mesa!');
    ed_mesa_destino.clear;
    ed_mesa_destino.SetFocus;
    exit;
  end;

  try
    ed_mesa_destino.Text:=FormatFloat('0000',StrToFloat(ed_mesa_destino.text));
  except
   begin
     ShowMessage('Número da mesa inválido!');
     ed_mesa_destino.Clear;
     ed_mesa_destino.SetFocus;
     exit;
   end;
  end;
 end;


end;

procedure Tfrm_transferir_item.ed_mesa_destinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0)
     end;

   if key=vk_escape then
   begin
     Close;
   end;

end;

procedure Tfrm_transferir_item.bt_trasferirKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_escape then Close;
end;

procedure Tfrm_transferir_item.IAeverButton1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_escape then close;
end;





procedure Tfrm_transferir_item.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.qryMotivosEstorno.Active:=false;
end;

end.

