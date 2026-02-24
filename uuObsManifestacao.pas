unit uuObsManifestacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, AdvGlassButton,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmObservacaoManifesto = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    memoObservacoes: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObservacaoManifesto: TfrmObservacaoManifesto;

implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure TfrmObservacaoManifesto.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  if ( Length(memoObservacoes.Lines.Text) < 20) then
    begin
      dm.exibe_painel_erro('Tamanho do texto de justificativa tem que ser maior que 20 caracteres','Ok');
    end
  else
   begin
    string_auxiliar := memoObservacoes.Lines.Text;
    close;
   end;
end;

procedure TfrmObservacaoManifesto.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := 'sair';
  close;
end;

end.
