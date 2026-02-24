unit uu_confirma_extrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, ExtCtrls, StdCtrls, Buttons, Vcl.ActnList,
  System.Actions;

type
  Tfrm_confirma_extrato = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    IAeverButton1: TBitBtn;
    IAeverButton2: TBitBtn;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Panel2: TPanel;
    Memo1: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure IAeverButton1Click(Sender: TObject);
    procedure IAeverButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IAeverButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  procedure setMensagem(mensagem : string; fonte : integer);
  procedure setTitulo(titulo : string);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_confirma_extrato: Tfrm_confirma_extrato;
  op1 : boolean;

implementation

uses uu_frm_principal, Math;

{$R *.dfm}

procedure Tfrm_confirma_extrato.Timer1Timer(Sender: TObject);
begin
  inherited;
 op1:=false;
    Panel1.Color:=clRed;
    Label1.font.Color:=clWhite;
    Memo1.Color:=clBlack;
    Memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure Tfrm_confirma_extrato.Timer2Timer(Sender: TObject);
begin
  inherited;
  Panel1.Color:=clBlack;
  Label1.font.Color:=clYellow;
  Memo1.Color:=clRed;
  Memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;
end;

procedure Tfrm_confirma_extrato.IAeverButton1Click(Sender: TObject);
begin
  inherited;
  string_auxiliar:='S';
  close;
    
end;

procedure Tfrm_confirma_extrato.IAeverButton2Click(Sender: TObject);
begin
  inherited;
  string_auxiliar:='N';
  close;
end;

procedure Tfrm_confirma_extrato.FormActivate(Sender: TObject);
begin
  inherited;
  op1:=true;
  Timer1.Enabled:=true;
  IAeverButton1.SetFocus;
end;

procedure Tfrm_confirma_extrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then IAeverButton1.Click;
end;

procedure Tfrm_confirma_extrato.IAeverButton1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then IAeverButton1.click;
  if key = vk_return then IAeverButton1.Click;
  If key = vk_escape then  IAeverButton2.Click;
end;

procedure Tfrm_confirma_extrato.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #114 then IAeverButton1.Click;
end;


procedure Tfrm_confirma_extrato.setTitulo(titulo : string);
begin
  self.caption:=titulo;
end;

procedure Tfrm_confirma_extrato.setMensagem(mensagem : string; fonte : integer);
begin
  memo1.lines.clear;
  Memo1.Font.Size := fonte;
  memo1.lines.add('');
  memo1.lines.add('');  
  memo1.lines.add(mensagem);
end;

end.

