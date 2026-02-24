unit uuConfirmaAgrupamentoProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  RealFramework, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uu_modelo_Vazio, Vcl.Menus, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, AdvGlassButton;

type
  TfrmConfirmacaoAgrupamentoProdutos = class(Tfrm_modelo_vazio)
    Panel7: TPanel;
    Label1: TLabel;
    PngSpeedButton8: TPngSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    combo: TcxLookupComboBox;
    Label3: TLabel;
    btSalvar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    procedure btSairClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmacaoAgrupamentoProdutos: TfrmConfirmacaoAgrupamentoProdutos;

implementation

uses
  uu_data_module, uuDMCadProdutos, uu_frm_principal;

{$R *.dfm}

procedure TfrmConfirmacaoAgrupamentoProdutos.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConfirmacaoAgrupamentoProdutos.btSalvarClick(Sender: TObject);
var
  LCodProdutoAgrupamento: string;
begin

  if (ShowRealDialog(frm_principal, tmConfirmacaoPorPIN, 'Confirme', 'O agrupamento é irreversível. Tem certeza que deseja fazer isso?', 22, true) = teSim) then
  begin
    LCodProdutoAgrupamento := combo.EditValue;
    dm.AgruparProdutos(dmCadProduto.tbListagemProdutos, LCodProdutoAgrupamento);
    ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Agrupamento realizado!', 22, true);
    close;
  end;

end;

end.

