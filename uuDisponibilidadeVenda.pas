unit uuDisponibilidadeVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RealFramework, uuFrmGruposAdicionais, Produto, StrUtils,
  FireDAC.Comp.Client, Data.FmtBcd, System.Generics.Collections, Dialogs,
  uu_modelo_Vazio, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, RxMemDS,
  ImgList, Menus, RxMenus, ibx.ibdatabase, ibx.ibquery, cxGraphics, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxControls, cxStyles, cxClasses,
  cxGrid, cxImageList, cxTextEdit, cxGridCustomView, cxLookAndFeels,
  cxLookAndFeelPainters, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxCurrencyEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Comp.DataSet,
  cxGridTableView, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, FireDAC.Stan.Async, FireDAC.DApt, cxCustomData, cxFilter,
  cxData, dxDateRanges, dxScrollbarAnnotations, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, System.ImageList;

type
  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

type
  TfrmDisponibilidadeVenda = class(Tfrm_modelo_vazio)
    tbGruposTouch: TRxMemoryData;
    tbGruposTouchcodGrupo: TStringField;
    tbGruposTouchdescricao: TStringField;
    tbGruposTouchordem: TIntegerField;
    dsGruposTouch: TDataSource;
    dsProdutos: TDataSource;
    img: TImageList;
    Panel3: TPanel;
    Label15: TLabel;
    tbGruposTouchdisponivel: TSmallintField;
    dsProdutosTabelaTemp: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    NaoEditavel: TcxStyle;
    cxStyle2: TcxStyle;
    cxImageList1: TcxImageList;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1cod_produto: TcxGridDBColumn;
    cxGridDBTableView1vende: TcxGridDBColumn;
    cxGridDBTableView1descricao: TcxGridDBColumn;
    cxGridDBTableView1cod_barras: TcxGridDBColumn;
    cxGridDBTableView1valor_unitario: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    Disponibilizarvenda1: TMenuItem;
    Indisponibilizarvenda1: TMenuItem;
    DefiniropcionaisComplementos1: TMenuItem;
    tbProdutos: TFDMemTable;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    GProdutosTabelaPreco: TFDMemTable;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle3: TcxStyle;
    procedure mostraGrupos();
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure tbProdutosTabelaTempAfterInsert(DataSet: TDataSet);
    procedure tbProdutosBeforeInsert(DataSet: TDataSet);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1vendeCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1vendeGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Disponibilizarvenda1Click(Sender: TObject);
    procedure Indisponibilizarvenda1Click(Sender: TObject);
    procedure DefiniropcionaisComplementos1Click(Sender: TObject);
  private
    GPermiteInserir: Boolean;
    PodeFecharFormulario: Boolean;
//    GProdutosTabelaPreco : TFDMemTable;

    procedure alteraPrecoTabelaPrecos(codigo: integer; valorUnitario: double);
    procedure carregaProdutos;
    procedure CarregaTabelasDePreco;
    procedure FiltraTabelaPrecos;
    procedure DefinirOpcionais;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisponibilidadeVenda: TfrmDisponibilidadeVenda;

implementation

uses
  uu_data_module;

{$R *.dfm}

procedure TfrmDisponibilidadeVenda.mostraGrupos();
begin
  inherited;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.sql.Add('select * from grupos_touch where codigo <> ' + Quotedstr('00') + ' order by descricao');
  dm.qryauxiliar.Active := true;

  tbGruposTouch.Active := false;
  tbGruposTouch.EmptyTable;
  tbGruposTouch.Active := true;

  dm.qryauxiliar.First;

  while not dm.qryauxiliar.Eof do
  begin
    tbGruposTouch.Append;
    tbGruposTouchcodGrupo.Value := dm.qryauxiliar.fieldbyname('codigo').Value;
    tbGruposTouchdescricao.Value := dm.qryauxiliar.fieldbyname('descricao').Value;
    tbGruposTouchordem.Value := dm.qryauxiliar.fieldbyname('ordem').Value;

    dm.qryauxiliar2.Active := false;
    dm.qryauxiliar2.Sql.Clear;
    dm.qryauxiliar2.SQL.add('select cod_produto from produtos p where p.vende=1 and p.cod_grupo_touch=' + Quotedstr(dm.qryauxiliar.fieldbyname('codigo').value));
    dm.qryauxiliar2.Active := true;
    if dm.qryauxiliar2.IsEmpty then
      tbGruposTouchdisponivel.Value := 0
    else
      tbGruposTouchdisponivel.Value := 1;
    dm.qryauxiliar2.Active := false;

    tbGruposTouch.Post;
    dm.qryauxiliar.next;
  end;

  tbGruposTouch.First;

end;

procedure TfrmDisponibilidadeVenda.carregaProdutos;
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;
  try
    LSQL.Add(' select p.cod_produto, coalesce(p.cod_barras,' + Quotedstr('') + ') as cod_barras, p.cod_grupo_touch, p.descricao, p.valor_unitario, ');
    LSQL.Add('   p.vende from produtos p ');
    dm.getMemTable(tbProdutos, LSQL.Text);
  finally
    freeandnil(LSQL);
  end;
end;

procedure TfrmDisponibilidadeVenda.CarregaTabelasDePreco();
var
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;
  try
    try

      LSQL.Add('        select tb.codigo, cod_produto,tp.descricao, tb.valor_unitario  from produtos_tabela_precos tb ');
      LSQL.Add('     inner join tabelas_preco tp on (tp.codigo = tb.cod_tabela) ');
//      FDQuery1.active := false;
//      FDQuery1.sql.clear;
//      FDQuery1.sql.add(LSQL.Text);
//      FDQuery1.active := true;
      dm.getMemTable(GProdutosTabelaPreco, LSQL.Text);
//      dm.getMemTable(FDQuery1 , LSQL.Text);

    except
      on E: Exception do
      begin

        showRealDialog(self, tmErro, 'Erro', 'Erro ao buscar produtos nas tabelas de preço' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;
    end;
  finally
    LSQL.Clear;
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmDisponibilidadeVenda.cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FiltraTabelaPrecos;
end;

procedure TfrmDisponibilidadeVenda.cxGridDBTableView1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key in [VK_UP, VK_DOWN]) then
  begin
    FiltraTabelaPrecos;
  end;

end;

procedure TfrmDisponibilidadeVenda.cxGridDBTableView1vendeCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  inherited;

  if tbProdutos.IsEmpty then
    exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[cxGridDBTableView1vende.Index])), ['0', '1']) of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 3);
//            AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] := '.';

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
  //        AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] := '.';
          end;

      end;

   //   if AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] then


    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmDisponibilidadeVenda.cxGridDBTableView1vendeGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure TfrmDisponibilidadeVenda.FiltraTabelaPrecos();
begin
  GProdutosTabelaPreco.Filtered := false;
  GProdutosTabelaPreco.Filtered := false;
  GProdutosTabelaPreco.Filter := 'cod_produto=' + QuotedStr(tbProdutos.FieldByName('cod_produto').Value);
  GProdutosTabelaPreco.Filtered := true;

end;

procedure TfrmDisponibilidadeVenda.alteraPrecoTabelaPrecos(codigo: integer; valorUnitario: double);
var
  q: TIBQuery;
  ts: TIBTransaction;
begin

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    ts.Active := false;
    ts.Active := true;

    q.Active := false;
    q.SQL.Clear;
    q.SQL.Add('  update produtos_tabela_precos pt set pt.valor_unitario = ' + dm.TrocaVirgPPto(FloatToStr(valorUnitario)) + ' where pt.codigo=' + Inttostr(codigo));
    q.ExecSQL;
    ts.Commit

  finally
    q.Active := false;
    freeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;
end;

procedure TfrmDisponibilidadeVenda.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if Column.FieldName = 'disponivel' then
  begin

    if (trim(Column.Field.AsString) = '1') then
    begin
      DBGrid1.Canvas.Brush.Color := clLime;
      DBGrid1.Canvas.Font.Color := clBlack;

      TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

    end
    else
    begin
      DBGrid1.Canvas.Brush.Color := clRed;
      DBGrid1.Canvas.Font.Color := clBlack;
      TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

    end;

  end;

end;

procedure TfrmDisponibilidadeVenda.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
//  mostraProdutosTabelaPrecos(tbProdutosCodProduto.Value);

  GProdutosTabelaPreco.Filtered := false;
  GProdutosTabelaPreco.Filtered := false;
  GProdutosTabelaPreco.Filter := 'cod_produto=' + QuotedStr(tbProdutos.fieldbyname('cod_produto').Value);
  GProdutosTabelaPreco.Filtered := true;

end;

procedure TfrmDisponibilidadeVenda.DefinirOpcionais();
var
  LProduto: TProduto;
begin
  LProduto := TProduto.Create;

  try
    try
      LProduto.Codigo := tbProdutos.fieldbyname('cod_produto').Value;
      LProduto.Descricao := tbProdutos.fieldbyname('descricao').Value;
      LProduto.Preco := tbProdutos.fieldbyname('valor_unitario').Value;

      Application.CreateForm(TfrmCadastroGruposAdicionais, frmCadastroGruposAdicionais);
      frmCadastroGruposAdicionais.setProdutoSelecionado(LProduto);
      frmCadastroGruposAdicionais.ShowModal;
      frmCadastroGruposAdicionais.Free;

    except
      on E: Exception do
      begin

      end;
    end;
  finally
    FreeAndNil(LProduto);
  end;

end;

procedure TfrmDisponibilidadeVenda.DefiniropcionaisComplementos1Click(Sender: TObject);
begin
  inherited;
  DefinirOpcionais;
end;

procedure TfrmDisponibilidadeVenda.Disponibilizarvenda1Click(Sender: TObject);
begin
  inherited;
  tbProdutos.Edit;
  tbProdutos.fieldbyname('vende').Value := 1;
  tbProdutos.Post;
end;

procedure TfrmDisponibilidadeVenda.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
//  mostraProdutosGrupo(tbGruposTouchcodGrupo.Value);
//  mostraProdutosTabelaPrecos(tbProdutosCodProduto.Value);

  tbProdutos.Filtered := false;
  tbProdutos.Filtered := false;
  tbProdutos.Filter := 'cod_grupo_touch=' + Quotedstr(tbGruposTouchcodGrupo.Value);
  tbProdutos.Filtered := true;
  tbProdutos.First;

  if tbProdutos.RecordCount > 0 then
  begin
    FiltraTabelaPrecos;
  end;

end;

procedure TfrmDisponibilidadeVenda.BitBtn1Click(Sender: TObject);
var
  LTamanho: integer;
  LSQLInsert: TStringList;
  LListaSQL: TList<string>;
  LCodBarras: string;
begin
  inherited;

  LSQLInsert := TStringList.Create;
  LListaSQL := TList<string>.Create;

  LListaSQL.Clear;
  LSQLInsert.Clear;
  tbProdutos.Filtered := False;
  GProdutosTabelaPreco.Filtered := false;
  GProdutosTabelaPreco.Filter := '';
  tbProdutos.Filter := '';
  GProdutosTabelaPreco.DisableControls;
  tbProdutos.DisableControls;

  try
    try

      tbProdutos.First;
      while not tbProdutos.Eof do
      begin
        LSQLInsert.Clear;
        LSQLInsert.add('update produtos p set p.vende=' + Inttostr(tbProdutos.FieldByName('vende').value) + ',');
        LSQLInsert.add(' p.valor_unitario=' + dm.TrocaVirgPPto(FloatToStr(tbProdutos.FieldByName('valor_unitario').Value)) + ',');
        LSQLInsert.add(' p.descricao=' + Quotedstr(tbProdutos.FieldByName('descricao').value));
        LSQLInsert.add(' where p.cod_produto=' + Quotedstr(tbProdutos.FieldByName('cod_produto').value) + ';');
        LListaSQL.Add(LSQLInsert.Text);
        tbProdutos.Next;
      end;

      GProdutosTabelaPreco.First;
      while not GProdutosTabelaPreco.Eof do
      begin
        LSQLInsert.Clear;
        LSQLInsert.Add('update produtos_tabela_precos p set p.valor_unitario=' + dm.TrocaVirgPPto(FloatToStr(GProdutosTabelaPreco.FieldByName('valor_unitario').value)) + '');
        LSQLInsert.Add(' where p.codigo=' + Inttostr(GProdutosTabelaPreco.FieldByName('codigo').value) + ';');
        LListaSQL.Add(LSQLInsert.Text);
        GProdutosTabelaPreco.Next;
      end;

      LListaSQL.add('execute procedure RECRIAR_TABELAS_PRECO;');
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 80);
      showRealDialog(self, tmSucesso, 'Sucesso', 'Alterações efetuadas com sucesso!!', 22, false);
    except
      on E: Exception do
      begin
        showRealDialog(self, tmErro, 'Erro', 'Erro ao gravar alterações!' + sLineBreak + sLineBreak + E.Message, 22, false);
        raise Exception.Create(e.message);
      end;

    end;
  finally
    FreeAndNil(LSQLInsert);
    FreeAndNil(LListaSQL);
    tbProdutos.EnableControls;
    GProdutosTabelaPreco.EnableControls;
    carregaProdutos;
    CarregaTabelasDePreco;
    mostraGrupos();
  end;

end;

procedure TfrmDisponibilidadeVenda.BitBtn4Click(Sender: TObject);
begin
  inherited;
  PodeFecharFormulario := True;
  close;
end;

procedure TfrmDisponibilidadeVenda.FormActivate(Sender: TObject);
begin
  inherited;
  mostraGrupos();
  carregaProdutos;
  CarregaTabelasDePreco;
  FiltraTabelaPrecos;
end;

procedure TfrmDisponibilidadeVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if PodeFecharFormulario then
  begin
    Action := caFree;
    tbGruposTouch.Active := false;
    GProdutosTabelaPreco.Active := False;
    tbProdutos.Active := false;
    FreeAndNil(tbProdutos);
    FreeAndNil(GProdutosTabelaPreco);
    FreeAndNil(tbGruposTouch);
  end
  else
  begin
    Action := caNone;

    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'As alterações estão em andamento.' + sLineBreak + sLineBreak + ' Tem certeza que deseja sair ?') = teSim) then
    begin
      Action := caFree;
    end;
  end;
end;

procedure TfrmDisponibilidadeVenda.Indisponibilizarvenda1Click(Sender: TObject);
begin
  inherited;
  tbProdutos.Edit;
  tbProdutos.fieldbyname('vende').Value := 0;
  tbProdutos.Post;
end;

procedure TfrmDisponibilidadeVenda.tbProdutosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (GPermiteInserir = False) then
    Abort;

end;

procedure TfrmDisponibilidadeVenda.tbProdutosTabelaTempAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if (GPermiteInserir = False) then
    Abort;

end;

end.

