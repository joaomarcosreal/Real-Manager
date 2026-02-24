unit uuParabensRegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmParabensRegistro = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel2: TPanel;
    Label4: TLabel;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Memo2: TMemo;
    q1: TEdit;
    q2: TEdit;
    q3: TEdit;
    q4: TEdit;
    lbExpiracao: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParabensRegistro: TfrmParabensRegistro;

implementation

uses uuRegistroSistema, uu_frm_principal;

{$R *.dfm}

procedure TfrmParabensRegistro.FormActivate(Sender: TObject);
begin
  inherited;
  q1.text:=frmRegistroSistema.q1.Text;
  q2.text:=frmRegistroSistema.q2.Text;
  q3.text:=frmRegistroSistema.q3.Text;
  q4.text:=frmRegistroSistema.q4.Text;
  lbExpiracao.Caption:=FormatDateTime('DD/MM/YYY',Date+diasExpiracaoSistema);

end;

procedure TfrmParabensRegistro.BitBtn1Click(Sender: TObject);
begin
  inherited;
   close;
end;

end.
