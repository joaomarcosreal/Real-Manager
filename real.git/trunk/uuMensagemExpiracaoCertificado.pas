unit uuMensagemExpiracaoCertificado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxGDIPlusClasses, Vcl.Buttons, system.DateUtils, uu_data_module, uu_frm_principal;

type
  TfrmMensagemExpiracaoCertificado = class(TForm)
    Image1: TImage;
    lbTitulo: TLabel;
    lbDiasExpiracao: TLabel;
    Panel1: TPanel;
    memoMensagens: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    edtMensagem: TEdit;
    Image2: TImage;
    Label2: TLabel;
    Label5: TLabel;
    lbExpiracao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }

     podeFechar : boolean;
     dataExpiracao : TDate;
     diasExpiracao: integer;


  public
    { Public declarations }
    procedure setDataexpiracao(Adataexpiracao: Tdate);
  end;

var
  frmMensagemExpiracaoCertificado: TfrmMensagemExpiracaoCertificado;

implementation

{$R *.dfm}

procedure TfrmMensagemExpiracaoCertificado.setDataexpiracao(Adataexpiracao : Tdate);
begin
 dataExpiracao := Adataexpiracao;
 diasExpiracao := DaysBetween(Now,dataExpiracao);
 lbExpiracao.Caption := 'Expiração: '+FormatDateTime('DD/MM/YYY',dataExpiracao);
 lbDiasExpiracao.Caption := Inttostr(diasExpiracao)+' dias';

 dm.adicionaLog('Data de expiração do certificado: '+FormatDateTime('DD/MM/YYY',dataExpiracao));

 if diasExpiracao <= 0 then
  begin
  memoMensagens.Lines.Clear;
  lbTitulo.Caption := 'O seu certificado digital está';
  lbDiasExpiracao.Caption := 'EXPIRADO';
  memoMensagens.Lines.Add('O seu certificado digital expirou. Não é possível emitir e nem fazer download de documentos fiscais.');
  memoMensagens.Lines.Add('');
  memoMensagens.Lines.Add('Entre em contato com a sua certificadora ou escritório de contabilidade!');
   diasExpiracao :=0;
  end;


end;

procedure TfrmMensagemExpiracaoCertificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if podeFechar  then
   begin
     Action := caFree;
   end
  else
   begin

    Action := caNone;
    dm.exibe_painel_erro('Para sair, digite a mensagem conforme as instruções','ok');
    exit;
   end;
end;

procedure TfrmMensagemExpiracaoCertificado.Image2Click(Sender: TObject);
begin
if trim(UpperCase(edtMensagem.Text)) = 'ESTOU CIENTE DO PROBLEMA' then
   begin
     dm.adicionaLog('Usuário: '+nome_usuario +' atesta ter ciência da expiração do certificado digital');
     podeFechar := true;
     Close;
   end
  else
   begin
     dm.exibe_painel_erro('Para sair, digite a mensagem conforme as instruções','ok');

   end;
end;

end.
