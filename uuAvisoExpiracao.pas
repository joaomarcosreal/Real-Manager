unit uuAvisoExpiracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, jpeg, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmAvisoExpiracao = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    frmAvisoExpiracao: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    memo1: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    lbaviso: TLabel;
    lbExpiracao: TLabel;
    lbaviso1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvisoExpiracao: TfrmAvisoExpiracao;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmAvisoExpiracao.Timer1Timer(Sender: TObject);
begin
  inherited;
memo1.Color:=clRed;
    memo1.font.Color:=clWhite;
    memo1.Color:=clBlack;
    memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure TfrmAvisoExpiracao.Timer2Timer(Sender: TObject);
begin
  inherited;
  memo1.Color:=clBlack;
  memo1.font.Color:=clYellow;
  memo1.Color:=clRed;
  memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;

end;

procedure TfrmAvisoExpiracao.FormActivate(Sender: TObject);
begin
  inherited;
   Timer1.Enabled:=true;
end;

procedure TfrmAvisoExpiracao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmAvisoExpiracao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  registrarSistema:=true;
  Close

end;

end.
