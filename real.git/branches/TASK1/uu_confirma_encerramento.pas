unit uu_confirma_encerramento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,  Buttons;

type
  Tfrm_confirma_encerramento = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    IAeverButton1: TBitBtn;
    IAeverButton2: TBitBtn;
    Timer3: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure IAeverButton1Click(Sender: TObject);
    procedure IAeverButton2Click(Sender: TObject);
    procedure IAeverButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_confirma_encerramento: Tfrm_confirma_encerramento;
  op1 : boolean;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure Tfrm_confirma_encerramento.Timer1Timer(Sender: TObject);
begin
    op1:=false;
    Panel1.Color:=clRed;
    Label1.font.Color:=clWhite;
    Memo1.Color:=clBlack;
    Memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure Tfrm_confirma_encerramento.FormActivate(Sender: TObject);
begin
  op1:=true;
  Memo1.SetFocus;
  Timer1.Enabled:=true;
end;

procedure Tfrm_confirma_encerramento.Button1Click(Sender: TObject);
begin
    op1:=false;
    Panel1.Color:=clRed;
    Label1.font.Color:=clWhite;
    Memo1.Color:=clBlack;
    Memo1.Font.Color:=clYellow;

end;

procedure Tfrm_confirma_encerramento.Timer2Timer(Sender: TObject);
begin
  Panel1.Color:=clBlack;
  Label1.font.Color:=clYellow;
  Memo1.Color:=clRed;
  Memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;


end;

procedure Tfrm_confirma_encerramento.IAeverButton1Click(Sender: TObject);
begin
  encerrar_dia:=true;
  close;
end;

procedure Tfrm_confirma_encerramento.IAeverButton2Click(Sender: TObject);
begin
  encerrar_dia:=false;
  Close;
end;

procedure Tfrm_confirma_encerramento.IAeverButton1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_f3 then IAeverButton1.click;
  If key = vk_escape then  IAeverButton2.Click;

end;

procedure Tfrm_confirma_encerramento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #114 then IAeverButton1.Click;
end;

end.
