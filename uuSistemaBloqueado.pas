unit uuSistemaBloqueado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, jpeg, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmSistemaBloqueado = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Image1: TImage;
    MEMO: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    memo1: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSistemaBloqueado: TfrmSistemaBloqueado;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmSistemaBloqueado.Timer1Timer(Sender: TObject);
begin
  inherited;
memo1.Color:=clRed;
    memo1.font.Color:=clWhite;
    memo1.Color:=clBlack;
    memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure TfrmSistemaBloqueado.Timer2Timer(Sender: TObject);
begin
  inherited;
 memo1.Color:=clBlack;
  memo1.font.Color:=clYellow;
   memo1.Color:=clRed;
  memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;

end;

procedure TfrmSistemaBloqueado.FormActivate(Sender: TObject);
begin
  inherited;
Timer1.Enabled:=true;
end;

procedure TfrmSistemaBloqueado.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmSistemaBloqueado.BitBtn1Click(Sender: TObject);
begin
  inherited;
  registrarSistema:=true;
  Close
end;

procedure TfrmSistemaBloqueado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_escape then
   application.terminate;
end;

end.
