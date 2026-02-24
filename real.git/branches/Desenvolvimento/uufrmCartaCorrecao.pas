unit uufrmCartaCorrecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_frm_principal, uu_modelo_Vazio,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList, System.Actions;

type
  TfrmCartaCorrecao = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    frmCartaCorrecao: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartaCorrecao: TfrmCartaCorrecao;

implementation

{$R *.dfm}

procedure TfrmCartaCorrecao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := Trim(Memo1.Lines.Text);
  close;
end;

procedure TfrmCartaCorrecao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := '';
  close;
end;

end.
