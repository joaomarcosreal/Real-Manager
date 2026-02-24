unit uuFrmReajusteSaboresPizza;

interface

uses
  Winapi.Windows, Winapi.Messages, JclStrings, System.SysUtils, System.Variants,
  RealFramework, System.Generics.Collections, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio,
  Vcl.Clipbrd, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxStyles,
  Data.DB, cxGridLevel, cxClasses, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, AdvGlassButton, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxCurrencyEdit, cxGridTableView, cxGridCustomView, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Buttons, dxBarBuiltInMenu,
  Vcl.Menus, cxGridCustomPopupMenu, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations;

type
  TfrmReajusteSaboresPizza = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    pnDataHora: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    sabor: TcxGridDBColumn;
    grupo: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxstyl1: TcxStyle;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    edNomeDoSabor: TEdit;
    Label1: TLabel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    C2: TMenuItem;
    C3: TMenuItem;
    procedure cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edNomeDoSaborChange(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
  private
    procedure exibirSaboresCadadastrados;
    procedure inverteEstilo;
    procedure SalvarAlteracoes;
    function copiaCodigoIntegracao(AParceiro: integer): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReajusteSaboresPizza: TfrmReajusteSaboresPizza;
  descricaoSaborAnterior: string;
  estiloAtual: TcxStyle;

implementation

uses
  uu_data_module;

{$R *.dfm}

procedure TfrmReajusteSaboresPizza.SalvarAlteracoes;
var
  LSQL: TStringList;
  ct: integer;
  LListaSQL: TList<string>;
begin

  LSQL := TStringList.Create;
  LListaSQL := TList<string>.Create;
  LListaSQL.Clear;

  try
    dm.tbSaboresPizzaReajuste.First;
    dm.tbSaboresPizzaReajuste.DisableControls;

    while not dm.tbSaboresPizzaReajuste.Eof do
    begin
      LSQL.Clear;
      LSQL.Add('update produtos p set p.valor_unitario=' + dm.TrocaVirgPPto(FloatTostr(dm.tbSaboresPizzaReajuste.FieldByName('valor_unitario').Value)) + ' where p.cod_produto=' + Quotedstr(dm.tbSaboresPizzaReajuste.FieldByName('cod_produto').Value) + ';');
      LListaSQL.Add(LSQL.Text);
      dm.tbSaboresPizzaReajuste.Next;
    end;

    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 50);

  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
    dm.tbSaboresPizzaReajuste.EnableControls;
  end;

end;

procedure TfrmReajusteSaboresPizza.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma reajuste dos valores ?') = teSim) then
  begin
    SalvarAlteracoes;
    ShowMessage('Reajuste efetuado!');
  end;

end;

procedure TfrmReajusteSaboresPizza.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmReajusteSaboresPizza.C1Click(Sender: TObject);
begin
  inherited;
  copiaCodigoIntegracao(1);

end;

procedure TfrmReajusteSaboresPizza.C2Click(Sender: TObject);
begin
  inherited;
  copiaCodigoIntegracao(2);
end;

procedure TfrmReajusteSaboresPizza.cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if UpperCase(ARecord.Values[sabor.Index]) <> descricaoSaborAnterior then
  begin
    inverteEstilo;
    descricaoSaborAnterior := UpperCase(ARecord.Values[sabor.Index]);
  end;
  AStyle := estiloAtual;

end;

procedure TfrmReajusteSaboresPizza.edNomeDoSaborChange(Sender: TObject);
begin
  inherited;
  exibirSaboresCadadastrados;
end;

procedure TfrmReajusteSaboresPizza.exibirSaboresCadadastrados;
begin
  estiloAtual := cxStyle6;
  descricaoSaborAnterior := '';
  dm.getMemTable(dm.tbSaboresPizzaReajuste, ' select * from R_SABORES_PIZZA_REAJUSTE where descricao like ' + QuotedStr(edNomeDoSabor.Text) + '||' + QuotedStr('%'));
end;

procedure TfrmReajusteSaboresPizza.FormActivate(Sender: TObject);
begin
  inherited;
  exibirSaboresCadadastrados;
end;

procedure TfrmReajusteSaboresPizza.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.tbSaboresPizzaReajuste.Active := false;
end;

procedure TfrmReajusteSaboresPizza.inverteEstilo;
begin
  if estiloAtual = cxStyle6 then
    estiloAtual := cxStyle7
  else
    estiloAtual := cxStyle6

end;

function TfrmReajusteSaboresPizza.copiaCodigoIntegracao(AParceiro: integer): string;
var
  LIndiceTamanho: integer;
  LTamanho: string;
begin
  LIndiceTamanho := 0;
  LTamanho := uppercase(trim(DM.tbSaboresPizzaReajuste.fieldbyname('tamanho').value));
  LIndiceTamanho := StrIndex(LTamanho, ['PEQUENA', 'MEDIA', 'GRANDE', 'FAMILIA'], false);
  result := 'SAB_' + DM.tbSaboresPizzaReajuste.fieldbyname('codigo').value;

  case LIndiceTamanho of
    0:
      LTamanho := 'PEQ';
    1:
      LTamanho := 'MED';
    2:
      LTamanho := 'GDE';
    3:
      LTamanho := 'FAM';
  end;

  case AParceiro of
    2:
      begin
        result := 'PIZZA_' + LTamanho + '_SAB_' + DM.tbSaboresPizzaReajuste.fieldbyname('codigo').value;
      end;
  end;

  Clipboard.AsText := Result;
  ShowRealDialog(frmReajusteSaboresPizza, tmSucesso, 'Ok', 'Código de integração copiado!' + sLineBreak + 'Código: ' + Result);
end;

end.

