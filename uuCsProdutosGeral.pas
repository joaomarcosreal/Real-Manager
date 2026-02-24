unit uuCsProdutosGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uu_data_module, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Data.DB, cxGraphics, cxControls,
  cxStyles,
  cxClasses, AdvGlassButton,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxCurrencyEdit,
  cxGridTableView, cxGridCustomView, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations;

type
  TfrmCsProdutosGeral = class(Tform)
    Panel7: TPanel;
    lbTituloConsulta: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edDescricaoProduto: TEdit;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel6: TPanel;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stCabecalho: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSelecionada: TcxStyle;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    procedure edDescricaoProdutoChange(Sender: TObject);
    procedure edDescricaoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    mudouConteudoDoCampo: Boolean;
    LTipoProdutoConsulta: TTipoProduto;
    LPodeFecharFormulario: Boolean;
    procedure filtrarProdutos;
    function validaProdutoSelecionado(AcodProduto: string): Boolean;

    { Private declarations }
  public
    { Public declarations }
    procedure setTipoProdutoConsulta(ATipoProduto: TTipoProduto);
  end;

var
  frmCsProdutosGeral: TfrmCsProdutosGeral;

implementation

uses
  uuDmConsultaProdutosEstoque, uu_frm_principal;

{$R *.dfm}

procedure TfrmCsProdutosGeral.btSairClick(Sender: TObject);
begin
  LPodeFecharFormulario := true;
  string_auxiliar := '';
  Close;
end;

procedure TfrmCsProdutosGeral.btSelecionarClick(Sender: TObject);
var
  LProdutoSelecionado: string;
begin
  string_auxiliar := '';
  string_auxiliar2 := '';
  try
    begin
      LProdutoSelecionado := dmConsultaProdutos.tbProdutosGeral.fieldbyname('cod_produto').Value;


      if (validaProdutoSelecionado(LProdutoSelecionado) = False) then
        raise Exception.Create('Seleção inválida!');
      string_auxiliar := LProdutoSelecionado;
      string_auxiliar2 := dmConsultaProdutos.tbProdutosGeral.fieldbyname('descricao').Value;
      LPodeFecharFormulario := true;
    end;
  except
    begin
      dm.exibe_painel_erro('Seleção inválida!', 'Ok');
      exit;
    end;
  end;
  close;
end;

function TfrmCsProdutosGeral.validaProdutoSelecionado(AcodProduto: string): Boolean;
begin

  if Trim(AcodProduto) = '' then
    Result := false;

  case LTipoProdutoConsulta of
    tProdutoTodos:
      Result := true;
    tProdutoEstoque:
      begin
        if dmConsultaProdutos.tbProdutosGeral.FieldByName('compra').Value = 0 then
        begin
          dm.exibe_painel_erro('O produto selecionado não é um produto de compra/ estoque!', 'Ok');
          Result := false;
          exit;
        end;
      end;
    tProdutoVenda:
      if dmConsultaProdutos.tbProdutosGeral.FieldByName('vende').Value = 0 then
      begin
        dm.exibe_painel_erro('O produto selecionado não é um produto venda!', 'Ok');
        Result := false;
        exit;
      end;

    tSubProduto:
      if dmConsultaProdutos.tbProdutosGeral.FieldByName('submateria').Value = 0 then
      begin
        dm.exibe_painel_erro('O produto selecionado não é um subproduto!', 'Ok');
        Result := false;
        exit;
      end;
  end;
  Result := true;
end;

procedure TfrmCsProdutosGeral.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btSelecionar.Click;
end;

procedure TfrmCsProdutosGeral.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    btSair.Click;
  end;

  if Key = VK_RETURN then
  begin
    if dmConsultaProdutos.tbProdutosGeral.RecordCount > 0 then
      btSelecionar.Click;
  end;
end;

procedure TfrmCsProdutosGeral.edDescricaoProdutoChange(Sender: TObject);
begin
  if (StrToInt(dm.LeIni(2, 'BANCO_DE_DADOS', 'desabilitaConsultasIncrementais')) = 1) then
  begin
    mudouConteudoDoCampo := true;
    filtrarProdutos;
  end
  else
  begin
    if (Length(edDescricaoProduto.Text) >= 3) then
    begin
      mudouConteudoDoCampo := true;
      filtrarProdutos;
    end;
  end;

end;

procedure TfrmCsProdutosGeral.edDescricaoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_RETURN)) then
  begin
    if (dmConsultaProdutos.tbProdutosGeral.IsEmpty = False) then
    begin
      btSelecionar.Click;
    end;

  end;

  if (Key = VK_ESCAPE) then
  begin
    btSair.Click;
  end;

  if ((Key = VK_UP) and (dmConsultaProdutos.tbProdutosGeral.IsEmpty = False)) then
    dmConsultaProdutos.tbProdutosGeral.Prior;

  if ((Key = VK_DOWN) and (dmConsultaProdutos.tbProdutosGeral.IsEmpty = False)) then
    dmConsultaProdutos.tbProdutosGeral.Next;

end;

procedure TfrmCsProdutosGeral.filtrarProdutos();
var
  LSQL: TStringList;
begin
  btSelecionar.Enabled := False;
  LSQL := TstringList.create;
  try
    try
      LSQL.Clear;
      LSQL.Add('select p.cod_produto, p.descricao, cod_barras, valor_unitario, p.valor_custo,  G.descricao as descricaoGrupo, p.compra, p.vende, p.submateria ');
      LSQL.Add('       from produtos p');
      LSQL.Add('       inner join grupos g on (g.cod_grupo = p.cod_grupo)');
      LSQL.Add('		  where  p.descricao like ' + QuotedStr('%' + edDescricaoProduto.Text + '%'));
      LSQL.Add('		  or  p.cod_barras like ' + QuotedStr('%' + edDescricaoProduto.Text + '%'));

      case LTipoProdutoConsulta of
        tProdutoEstoque:
          LSQL.Add(' and p.compra = 1');
        tProdutoVenda:
          LSQL.Add(' and p.vende  = 1 ');
        tSubProduto:
          LSQL.Add(' and p.submateria = 1');
      end;


      LSQL.Add(' order by p.descricao asc');


      ////dm.adicionalog(LSQL.Text);
      dm.getMemTable(dmConsultaProdutos.tbProdutosGeral, LSQL.Text);
      dmConsultaProdutos.tbProdutosGeral.FetchAll;
      if dmConsultaProdutos.tbProdutosGeral.RecordCount > 0 then
        btSelecionar.Enabled := True;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao consultar produtos ', 'Ok');
        raise Exception.Create('Erro realizar consulta!' + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmCsProdutosGeral.FormActivate(Sender: TObject);
begin

  case LTipoProdutoConsulta of
    tProdutoTodos:
      lbTituloConsulta.caption := 'Consulta de Produtos (Todos os produtos)';
    tProdutoEstoque:
      lbTituloConsulta.caption := 'Consulta de produtos (Produtos de compra / estoque)';
    tProdutoVenda:
      lbTituloConsulta.caption := 'Consulta de produtos (Apenas produtos de venda';
    tSubProduto:
      lbTituloConsulta.caption := 'Consulta de subprodutos';
  end;

  edDescricaoProduto.SetFocus;
  filtrarProdutos();
end;

procedure TfrmCsProdutosGeral.FormCreate(Sender: TObject);
begin
  LTipoProdutoConsulta := tProdutoTodos;
  dmConsultaProdutos := TdmConsultaProdutos.Create(Self);
end;

procedure TfrmCsProdutosGeral.FormDestroy(Sender: TObject);
begin
  dmConsultaProdutos.tbProdutosGeral.Active :=false;
  FreeAndNil(dmConsultaProdutos);
end;

procedure TfrmCsProdutosGeral.setTipoProdutoConsulta(ATipoProduto: TTipoProduto);
begin
  LTipoProdutoConsulta := ATipoProduto;
end;

end.

