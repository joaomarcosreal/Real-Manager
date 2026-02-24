unit uuPainelAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dxGDIPlusClasses;

type
  TfrmPainelAguarde = class(TForm)
    Panel1: TPanel;
    lbTempo: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
    lbMensagem: TLabel;
    lbTentativas: TLabel;
    procedure timerFecharTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPainelAguarde: TfrmPainelAguarde;

implementation

{$R *.dfm}

uses uu_data_module;

procedure TfrmPainelAguarde.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  frmPainelAguarde.Destroy;
  frmPainelAguarde:=Nil;
end;

procedure TfrmPainelAguarde.timerFecharTimer(Sender: TObject);
begin
  ////dm.adicionalog('entrou '+Memo1.Lines.Text);
  if (dm.tempoFormMensagens <=0) or (dm.podeFecharFormMensagens) then
   begin

     if (dm.podeFecharFormMensagens = true) and (dm.tempoFormMensagens > 3) then
      begin
         Sleep(1000);
         dm.tempoFormMensagens := dm.tempoFormMensagens -1;
         lbTempo.Caption := IntToStr(dm.tempoFormMensagens);
         Application.ProcessMessages();
         Sleep(1000);
         dm.tempoFormMensagens := dm.tempoFormMensagens -1;
         lbTempo.Caption := IntToStr(dm.tempoFormMensagens);
         Application.ProcessMessages();

        Sleep(1000);
        dm.tempoFormMensagens := dm.tempoFormMensagens -1;
        lbTempo.Caption := IntToStr(dm.tempoFormMensagens);
        Application.ProcessMessages();

      end
     else
      begin
        close;
      end;

   end
  else
   begin
     dm.tempoFormMensagens := dm.tempoFormMensagens -1;
     lbTempo.Caption := IntToStr(dm.tempoFormMensagens);
     Application.ProcessMessages;

   end;

end;

end.
