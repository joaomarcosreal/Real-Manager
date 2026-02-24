unit uuRegistroSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, ExtCtrls, Buttons, ogutil,ibx.ibquery,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, cxCheckBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, Vcl.Menus;

type
  TfrmRegistroSistema = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edCnpj: TMaskEdit;
    edLicenca: TEdit;
    edIdMaquina: TEdit;
    edEstacao: TEdit;
    edProduto: TEdit;
    edData: TMaskEdit;
    edHora: TMaskEdit;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    q1: TEdit;
    q2: TEdit;
    q3: TEdit;
    q4: TEdit;
    procedure FormActivate(Sender: TObject);
    function  ValidaSerial() : boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistroSistema: TfrmRegistroSistema;

implementation

uses uu_frm_principal;

{$R *.dfm}



procedure TfrmRegistroSistema.FormActivate(Sender: TObject);
begin
  inherited;
//  edEmpresa.Text := razao_social;
  edCnpj.Text :=    cnpj;
  edLicenca.Text :=  licenca;
//  edIdMaquina.Text := frm_principal.serial.Modifier;
  edEstacao.Text := FormatFloat('000',numeroEstacao);
  edData.Text := FormatDateTime('DD/MM/YYY',date);
  edHora.Text := FormatDateTime('HH:MM:SS',time);

end;

function TfrmRegistroSistema.validaSerial() : boolean;
var
 HashValue : Longint;
 Code : TCode;
resultado : string;

begin

  {
    HexToBuffer(q2.text, Code, SizeOf(Code));
    if GetSpecialCodeValue(cKey, Code) <> StringHashElf(edLicenca.Text+edData.Text+edHora.Text) then
    begin
     Result:=false;
     exit;
    end;


    HexToBuffer(q3.text, Code, SizeOf(Code));
    if GetSpecialCodeValue(cKey, Code) <> StringHashElf(edIdMaquina.text+edHora.Text+edData.text) then
    begin
     Result:=false;
     exit;
    end;


    HexToBuffer(q4.text, Code, SizeOf(Code));
    if GetSpecialCodeValue(cKey, Code) <> StringHashElf(edHora.Text+edData.text+edCnpj.Text) then
    begin
     Result:=false;
     exit;
    end;
           }
    result:=true;
end;





procedure TfrmRegistroSistema.BitBtn1Click(Sender: TObject);
var
 serial : string;
 Work : TCode;
 status : TCodeStatus;
 q : TIBQuery;

begin
  inherited;
  {
  dm.transacaoAuxiliar.Active:=false;
  dm.transacaoAuxiliar.Active:=true;
  q:=TIBquery.create(frmRegistroSistema);
  q.database:=dm.dbrestaurante;
  q.transaction:=dm.transacaoAuxiliar;
  q.Active:=False;


  sistemaRegistrado:=false;
  if ValidaSerial = true then
   begin
     serial:=q1.Text;
     if HexToBuffer(serial, Work, SizeOf(Work)) then
      begin
        dm.gravaini('BANCO_DE_DADOS','release_'+codEmpresa ,dm.criptografa(serial,'1320'));
        status := frm_principal.serial.CheckCode(true);
        case Status of
          ogValidCode:
           begin
            q.Active:=false;
            q.SQL.Add('update parametros set ultimahora=current_timestamp');
            q.ExecSQL;
            if dm.transacaoAuxiliar.Active = false then dm.transacaoAuxiliar.Active:=true;
            dm.transacaoAuxiliar.Commit;

            FreeAndNil(q);

            diasExpiracaoSistema := frm_principal.serial.GetValue;
            Application.CreateForm(TfrmParabensRegistro,frmParabensRegistro);
            frmParabensRegistro.ShowModal;
            frmParabensRegistro.Free;
            sistemaRegistrado:=true;
            Close;
           end;
          ogInvalidCode:
           begin
              dm.exibe_painel_erro('Serial Inválido!','Continuar');
           end;
          ogPastEndDate:
           begin
             dm.exibe_painel_erro('Serial já expirou!','Continuar');
           end;
          ogDayCountUsed:
           begin
             dm.exibe_painel_erro('Serial já expirou!','Continuar');
           end;
        end;
      end;
   end
  else
   begin
     dm.exibe_painel_erro('Serial Inválido!','Continuar');
   end;
   }
end;

procedure TfrmRegistroSistema.BitBtn2Click(Sender: TObject);
begin
  inherited;
  sistemaRegistrado:=false;
  close;
end;

end.
