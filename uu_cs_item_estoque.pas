unit uu_cs_item_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Data.DB,
  cxGraphics, cxControls,
  cxStyles,
  cxGridLevel, cxClasses,
  cxGridCustomTableView, cxGridDBTableView,
  cxGrid, AdvGlassButton, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridTableView, cxGridCustomView, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations;

type
  Tfrm_cs_itens = class(TForm)
    Panel7: TPanel;
    Label5: TLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    edDescricaoProduto: TEdit;
    Label1: TLabel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1ESTOQUE: TcxGridDBColumn;
    cxGrid1DBTableView1DESCUNIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1QUANTIDADE_MINIMA: TcxGridDBColumn;
    cxGrid1DBTableView1FOLGA: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stCabecalho: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSelecionada: TcxStyle;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    procedure ed_parametroChange(Sender: TObject);
    procedure edDescricaoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure edDescricaoProdutoChange(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    mudouConteudoDoCampo: Boolean;
    procedure filtrarProdutos;
  public
    { Public declarations }
  end;

var
  frm_cs_itens: Tfrm_cs_itens;

implementation

uses
  uu_data_module, uu_frm_principal, uuDmConsultaProdutosEstoque;

{$R *.dfm}

procedure Tfrm_cs_itens.edDescricaoProdutoChange(Sender: TObject);
begin
  if (StrToInt(dm.LeIni(2, 'BANCO_DE_DADOS', 'desabilitaConsultasIncrementais')) = 1) then
  begin
    mudouConteudoDoCampo := true;
    filtrarProdutos
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

procedure Tfrm_cs_itens.edDescricaoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_RETURN)) then
  begin
   if ( dmConsultaProdutos.tbProdutosEstoque.IsEmpty = False ) then
     btSelecionar.Click;
  end;

 if (key = VK_ESCAPE) then
  begin
    btSair.Click;
  end;

  if ( (Key = VK_UP) and (dmConsultaProdutos.tbProdutosEstoque.IsEmpty = False))  then

    dmConsultaProdutos.tbProdutosEstoque.Prior;

  if ( (Key = VK_DOWN) and (dmConsultaProdutos.tbProdutosEstoque.IsEmpty = False) )  then
    dmConsultaProdutos.tbProdutosEstoque.Next;


end;

procedure Tfrm_cs_itens.ed_parametroChange(Sender: TObject);
begin
  inherited;
  mudouConteudoDoCampo := True;
end;



procedure Tfrm_cs_itens.filtrarProdutos();
var
  LSQL: TStringList;
begin

  LSQL := TstringList.create;
  try
    try

      LSQL.Add(' select cod_produto, descricao,estoque, descUnidade,quantidade_minima, folga,                     ');
      LSQL.Add('  case                                                                                            ');
      LSQL.Add('   when (folga > 0) then 1                                                                        ');
      LSQL.Add('   else 0                                                                                         ');
      LSQL.Add('  end as flagEstoque                                                                              ');
      LSQL.Add(' from                                                                                             ');
      LSQL.Add('   (                                                                                              ');
      LSQL.Add('	   select p.cod_produto, p.descricao,                                                          ');
      LSQL.Add('			p.quantidade_minima,                                                                   ');
      LSQL.Add('			(udf_roundabnt(  (p.estoque_liquido / u.parametro),3) - p.quantidade_minima) as folga, ');
      LSQL.Add('			udf_roundabnt(  (p.estoque_liquido / u.parametro),3)  as estoque,                      ');
      LSQL.Add('			u.descricao as descUnidade                                                             ');
      LSQL.Add('		from produtos p                                                                            ');
      LSQL.Add('		  inner join unidades u on (u.cod_unidade = p.unidade_entrada)                             ');
      LSQL.Add('		  inner join grupos   g on (g.cod_grupo = p.cod_grupo)                                     ');
      LSQL.Add('		  where p.compra=1 and p.descricao  like ' + QuotedStr('%'+edDescricaoProduto.Text+'%'));
      LSQL.Add('   )                                                                                              ');
      ////dm.adicionalog(LSQL.Text);
      dm.getMemTable(dmConsultaProdutos.tbProdutosEstoque, LSQL.Text);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro realizar consulta!' + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_cs_itens.FormActivate(Sender: TObject);
begin
  edDescricaoProduto.SetFocus;
end;

procedure Tfrm_cs_itens.FormCreate(Sender: TObject);
begin
  dmConsultaProdutos := TdmConsultaProdutos.Create(Self);

end;

procedure Tfrm_cs_itens.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmConsultaProdutos);
end;

procedure Tfrm_cs_itens.btSairClick(Sender: TObject);
begin
  string_auxiliar :='';
  Close;
end;

procedure Tfrm_cs_itens.btSelecionarClick(Sender: TObject);
begin
  try
    begin
      string_auxiliar := dmConsultaProdutos.tbProdutosEstoque.fieldbyname('cod_produto').Value;
    end;
  except
    begin
      dm.exibe_painel_erro('Seleção inválida!', 'Ok');
      exit;
    end;
  end;
  close;

end;

procedure Tfrm_cs_itens.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btSelecionar.Click;
end;

procedure Tfrm_cs_itens.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if (key = VK_ESCAPE) then
  begin
    btSair.Click;
  end;


 if key = VK_RETURN then
  begin
    if dmConsultaProdutos.tbProdutosEstoque.RecordCount > 0 then
      btSelecionar.Click;
  end;

end;

end.

