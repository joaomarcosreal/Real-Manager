unit uu_manutencao_grupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls,
  StdCtrls, Buttons;

type
  Tfrm_painel_erros = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_painel_erros: Tfrm_painel_erros;

implementation



{$R *.dfm}

procedure Tfrm_painel_erros.Timer1Timer(Sender: TObject);
begin

    memo1.Color:=clRed;
    memo1.font.Color:=clWhite;
    memo1.Color:=clBlack;
    memo1.Font.Color:=clYellow;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;
end;

procedure Tfrm_painel_erros.Timer2Timer(Sender: TObject);
begin
 memo1.Color:=clBlack;
  memo1.font.Color:=clYellow;
   memo1.Color:=clRed;
  memo1.Font.Color:=clWhite;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;

end;

procedure Tfrm_painel_erros.FormActivate(Sender: TObject);
begin
Timer1.Enabled:=true;
BitBtn1.SetFocus;

end;

procedure Tfrm_painel_erros.Panel2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_painel_erros.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

end.
