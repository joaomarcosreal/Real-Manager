unit uuLicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, Mask,onguard,ogutil,
  jpeg;

type
  TfrmLicenca = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edLicenca: TEdit;
    Label7: TLabel;
    Image2: TImage;
    Image3: TImage;
    Label9: TLabel;
    Label10: TLabel;
    edCNPJ: TMaskEdit;
    Label8: TLabel;
    edIdMaquina: TEdit;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    function  verificaLicencaValida() : boolean;
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLicenca: TfrmLicenca;

implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure TfrmLicenca.FormActivate(Sender: TObject);
begin
  inherited;
  edCnpj.Text :=    cnpj;
  edIdMaquina.Text := frm_principal.serial.Modifier;
end;

procedure TfrmLicenca.Image2Click(Sender: TObject);
begin
  inherited;


  if verificaLicencaValida then
   begin
     dm.gravaini('BANCO_DE_DADOS','registro',dm.criptografa(edLicenca.Text,'1320'));
     ShowMessage('Parabéns, licença válida!');
     Close;
   end
  else
   begin
    showmessage('Dados incorretos ou a licença informada não é válida!');
    edLicenca.SetFocus;
    exit;
   end;       
end;

function TfrmLicenca.verificaLicencaValida() : boolean;
var
  HashValue : Longint;
  Code : TCode;
  resultado : string;
begin

 if ( trim(edLicenca.Text) <> '') then
  begin
      HexToBuffer(edLicenca.Text, Code, SizeOf(Code));
      if GetSpecialCodeValue(cKey, Code) <> StringHashElf(edCnpj.Text+edIdMaquina.Text) then
       begin
        exit;
        Result:=false;
       end
      else
       begin
          result:=true;
       end;
  end
 else
   Result := false;

end;


procedure TfrmLicenca.Image3Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
