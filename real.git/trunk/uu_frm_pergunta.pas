unit uu_frm_pergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPergunta = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPergunta: TfrmPergunta;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmPergunta.Timer1Timer(Sender: TObject);
begin
  inherited;

    memo1.Color:=clRed;
    memo1.font.Color:=clWhite;
    memo1.Color:=clBlack;
    memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;

end;

procedure TfrmPergunta.Timer2Timer(Sender: TObject);
begin
  inherited;
memo1.Color:=clBlack;
  memo1.font.Color:=clYellow;
   memo1.Color:=clRed;
  memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;

end;

procedure TfrmPergunta.BitBtn1Click(Sender: TObject);
begin
  inherited;
  respostaPergunta := true;
  close;
end;

procedure TfrmPergunta.BitBtn2Click(Sender: TObject);
begin
  inherited;
  respostaPergunta :=false;
  close;
  
end;

procedure TfrmPergunta.FormActivate(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:=true;
  BitBtn1.SetFocus;
end;

end.
