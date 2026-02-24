unit uuMudaNomeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  RealFramework, uuRealDialog, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.Menus, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, AdvGlassButton;

type
  TfrmMudaNomeCliente = class(Tfrm_modelo_vazio)
    Panel30: TPanel;
    lbTitulo: TLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    edNomeCliente: TEdit;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    procedure btSairClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMudaNomeCliente: TfrmMudaNomeCliente;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmMudaNomeCliente.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmMudaNomeCliente.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if (trim(edNomeCliente.text) <> '') then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Tem certeza que deseja mudar os nomes?', 22, true) = teSim) then
    begin
      dm.AgruparNomesClienteMesa(edNomeCliente.Text);
      close;
    end;
  end
  else
    showRealDialog(frm_principal, tmErro, 'Erro', 'Nome inválido!', 22, false);
end;

end.

