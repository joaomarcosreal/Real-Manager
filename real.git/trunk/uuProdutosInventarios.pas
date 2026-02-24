unit uuProdutosInventarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, AdvGlassButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, System.Actions, Vcl.Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uuDMInventarios, CurvyControls, JvExStdCtrls, JvEdit,
  JvValidateEdit;

type
  TfrmAdicionaProdutoIventario = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    edEstoqueAtual: TCurvyEdit;
    Label3: TLabel;
    edCustoUnitarioAtual: TCurvyEdit;
    Label7: TLabel;
    edValorEstoqueAtual: TCurvyEdit;
    Label4: TLabel;
    CurvyEdit2: TJvValidateEdit;
    edCustoUnitarioNovo: TJvValidateEdit;
    procedure AdvGlassButton4Click(Sender: TObject);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionaProdutoIventario: TfrmAdicionaProdutoIventario;

implementation

{$R *.dfm}

procedure TfrmAdicionaProdutoIventario.AdvGlassButton4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmAdicionaProdutoIventario.cxLookupComboBox1PropertiesChange(
  Sender: TObject);
begin
  inherited;
{
  edEstoqueAtual.Text        := FormatFloat('###,###,##0.000',dmInventarios.qryCsProdutos.FieldByName('estoque_atual').Value) + ' '+dmInventarios.qryCsProdutos.FieldByName('descricao_unidade').Value;
  edCustoUnitarioAtual.Text  := FormatFloat('R$ ###,###,##0.000',dmInventarios.qryCsProdutos.FieldByName('valor_custo').Value);
  edValorEstoqueAtual.Text   := FormatFloat('R$ ###,###,##0.000',dmInventarios.qryCsProdutos.FieldByName('valor_estoque').Value);
  edCustoUnitarioNovo.Text   := FormatFloat('R$ ###,###,##0.000',dmInventarios.qryCsProdutos.FieldByName('valor_custo').Value);
 }
end;

end.
