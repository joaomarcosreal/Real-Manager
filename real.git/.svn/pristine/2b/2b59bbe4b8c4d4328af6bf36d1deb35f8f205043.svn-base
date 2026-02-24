unit uuPainelAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmPainelAguarde = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Panel1: TPanel;
    timerFechar: TTimer;
    lbTempo: TLabel;
    Memo1: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TfrmPainelAguarde.Timer1Timer(Sender: TObject);
begin
    memo1.Color:=clRed;
    memo1.font.Color:=clWhite;
    memo1.Color:=clBlack;
    memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure TfrmPainelAguarde.Timer2Timer(Sender: TObject);
begin
  memo1.Color:=clBlack;
  memo1.font.Color:=clYellow;
  memo1.Color:=clRed;
  memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;

end;

procedure TfrmPainelAguarde.timerFecharTimer(Sender: TObject);
begin
  dm.adicionaLog('entrou '+Memo1.Lines.Text);
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
     Memo1.Lines.Count
   end;

end;

procedure TfrmPainelAguarde.FormActivate(Sender: TObject);
begin
  Timer1.Enabled:=true;
//  frmPainelAguarde.timerFechar.Enabled := true;

end;

end.
