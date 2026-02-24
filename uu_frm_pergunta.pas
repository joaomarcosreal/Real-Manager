unit uu_frm_pergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls,
  JvControlActions, Vcl.ActnList, AdvGlassButton, JvActionsEngine,
  System.Actions, Vcl.Menus;

type
  TfrmPergunta = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    ActionList1: TActionList;
    ControlAction1: TControlAction;
    Action1: TAction;
    JvControlActionList1: TJvControlActionList;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action28: TAction;
    Action29: TAction;
    Action30: TAction;
    Action31: TAction;
    Action32: TAction;
    Action33: TAction;
    Action34: TAction;
    Action35: TAction;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action39: TAction;
    Action40: TAction;
    Action41: TAction;
    Action42: TAction;
    Action43: TAction;
    Action44: TAction;
    Action45: TAction;
    Action46: TAction;
    Action47: TAction;
    Action48: TAction;
    Action49: TAction;
    Action50: TAction;
    Action51: TAction;
    Action52: TAction;
    Action53: TAction;
    Action54: TAction;
    Action55: TAction;
    Action56: TAction;
    Action57: TAction;
    Action58: TAction;
    pnFundo: TPanel;
    pnTitulo: TPanel;
    lb_mesa: TLabel;
    lblTitulo: TLabel;
    Panel3: TPanel;
    btSim: TAdvGlassButton;
    btNao: TAdvGlassButton;
    Panel2: TPanel;
    Memo1: TMemo;
    tmApaga: TTimer;
    tmAcende: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure btSimClick(Sender: TObject);
    procedure btNaoClick(Sender: TObject);
    procedure btSimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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


end;

procedure TfrmPergunta.btSimClick(Sender: TObject);
begin
  inherited;
  respostaPergunta := true;
  close;
end;

procedure TfrmPergunta.btSimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_return then  btSim.Click;
  If key = vk_escape then  btNao.Click;
end;

procedure TfrmPergunta.btNaoClick(Sender: TObject);
begin
  inherited;
  respostaPergunta :=false;
  close;
  
end;

end.
