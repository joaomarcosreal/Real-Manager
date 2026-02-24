unit uuObsManifestacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons;

type
  TfrmObservacaoManifesto = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    memoObservacoes: TMemo;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObservacaoManifesto: TfrmObservacaoManifesto;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmObservacaoManifesto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := memoObservacoes.Lines.Text;
  close;
end;

end.
