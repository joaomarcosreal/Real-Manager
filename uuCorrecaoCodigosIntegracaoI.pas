unit uuCorrecaoCodigosIntegracaoI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, RealFramework,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uu_modelo_Vazio, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Generics.Collections, cxCurrencyEdit, AdvGlassButton, Vcl.Menus,
  cxTextEdit, JvPageList, JvExControls, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations;

type
  TfrmCorrecaoCodigosIntegracao = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    frmCorrecaoCodigosIntegracao: TPanel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    PopupMenu1: TPopupMenu;
    Pesquisarprodutoeassociar1: TMenuItem;
    pgOpcoes: TJvPageList;
    pgCodigos: TJvStandardPage;
    pgJson: TJvStandardPage;
    Panel35: TPanel;
    Label4: TLabel;
    PngSpeedButton12: TPngSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1QUANTIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1PRECO: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_ITEM: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    memoJson: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure Pesquisarprodutoeassociar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    LIndicePaginaVisivel: smallint;
    LIdPedido: integer;
    procedure AtualizarCodigos;
    procedure AtualizarJson;


    { Private declarations }
  public
    { Public declarations }
    procedure setPage(Aindex: smallint; AIDPedido: Largeint; LJson: string);
  end;

var
  frmCorrecaoCodigosIntegracao: TfrmCorrecaoCodigosIntegracao;

implementation

uses
  uuDMExpedicaoDelivery, uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure TfrmCorrecaoCodigosIntegracao.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  case LIndicePaginaVisivel of
    0:
      AtualizarCodigos();
    1:
      AtualizarJson();

  end;

  close;
end;

procedure TfrmCorrecaoCodigosIntegracao.AtualizarJson();
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;

  try
    LSQL.clear;
    LSQL.add('update integracoes_pedido set json_pedido=' + Quotedstr(memoJson.text) + ',');
    LSQL.add('JSON_PROCESSADO=0, STATUS_INTEGRACAO_SISTEMA=0 ');
    LSQL.add(' where id=' + Inttostr(LIdPedido));
    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 20);
    ShowRealDialog(frm_principal, tmSucesso, 'Feito!', 'Json do pedido corrigido com sucesso!');
  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmCorrecaoCodigosIntegracao.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;

  close;
end;

procedure TfrmCorrecaoCodigosIntegracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmExpedicaoDelivery.tbCorrecaoCodigos.active := false;
end;

procedure TfrmCorrecaoCodigosIntegracao.FormShow(Sender: TObject);
begin
  inherited;
  case LIndicePaginaVisivel of
    0:
      pgCodigos.Show;
    1:
      pgJson.Show;
  end;
end;

procedure TfrmCorrecaoCodigosIntegracao.Pesquisarprodutoeassociar1Click(Sender: TObject);
begin
  inherited;
  string_aux_cod_barras := '';
  pesquisaProdutosCardapio();
  dmExpedicaoDelivery.tbCorrecaoCodigos.Edit;
  dmExpedicaoDelivery.tbCorrecaoCodigos.fieldbyname('cod_produto').value := string_aux_cod_barras;
  dmExpedicaoDelivery.tbCorrecaoCodigos.post;
end;

procedure TfrmCorrecaoCodigosIntegracao.AtualizarCodigos();
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;

  try
    dmExpedicaoDelivery.tbCorrecaoCodigos.first;
    while not dmExpedicaoDelivery.tbCorrecaoCodigos.eof do
    begin
      LSQL.Clear;
      LSQL.add('update integracoes_produtos_pedido set cod_produto=' + Quotedstr(dmExpedicaoDelivery.tbCorrecaoCodigos.fieldbyname('cod_produto').value));
      LSQL.add(' where id=' + Inttostr(dmExpedicaoDelivery.tbCorrecaoCodigos.fieldbyname('id').value) + ';');
      LListaSQL.add(LSQL.text);
      dmExpedicaoDelivery.tbCorrecaoCodigos.next;
    end;

    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 20);
    ShowRealDialog(frm_principal, tmSucesso, 'Feito!', 'Associações realizadas com sucesso!');

  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmCorrecaoCodigosIntegracao.setPage(Aindex: smallint; AIDPedido: Largeint; LJson: string);
begin
  LIndicePaginaVisivel := Aindex;
  LIdPedido := AIDPedido;
  memoJson.lines.clear;
  memoJson.Lines.add(LJson);
end;

end.

