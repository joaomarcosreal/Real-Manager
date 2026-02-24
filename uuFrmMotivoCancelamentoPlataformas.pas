unit uuFrmMotivoCancelamentoPlataformas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, JvActionsEngine, uu_frm_principal, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  AdvGlassButton;

type
  TfrmConfirmaCancelamentoPlataformas = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    cbMotivo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    memoObs: TMemo;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmaCancelamentoPlataformas: TfrmConfirmaCancelamentoPlataformas;

implementation

{$R *.dfm}

procedure TfrmConfirmaCancelamentoPlataformas.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := Inttostr(cbMotivo.ItemIndex + 501);
  string_auxiliar2 := memoObs.Text;
  close;
end;

procedure TfrmConfirmaCancelamentoPlataformas.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := '';
  string_auxiliar2 := '';
  close;

end;

procedure TfrmConfirmaCancelamentoPlataformas.FormActivate(Sender: TObject);
begin
  inherited;
  string_auxiliar := '';
  string_auxiliar2 :='';
end;

end.

