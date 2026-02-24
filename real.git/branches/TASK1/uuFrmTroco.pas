unit uuFrmTroco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons;

type
  TfrmPainelTroco = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    Panel2: TPanel;
    pn_troco: TPanel;
    timerFecha: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure timerFechaTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPainelTroco: TfrmPainelTroco;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmPainelTroco.Timer1Timer(Sender: TObject);
begin
  inherited;

    memo1.Color:=clRed;
    memo1.font.Color:=clWhite;
    memo1.Color:=clBlack;
    memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure TfrmPainelTroco.Timer2Timer(Sender: TObject);
begin
  inherited;
memo1.Color:=clBlack;
  memo1.font.Color:=clYellow;
   memo1.Color:=clRed;
  memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;
end;

procedure TfrmPainelTroco.FormActivate(Sender: TObject);
begin
  inherited;

  timerFecha.Interval := StrToInt(dm.LeIni(2, 'CAIXA', 'tempoFormTroco'));

  Timer1.Enabled:=true;
  timerFecha.Enabled := true;

end;

procedure TfrmPainelTroco.timerFechaTimer(Sender: TObject);
begin
  inherited;
  close;
end;

end.

