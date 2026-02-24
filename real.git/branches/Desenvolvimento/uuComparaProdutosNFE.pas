unit uuComparaProdutosNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Mask, DBCtrls,   Menus, ACBrNFeDANFEClass,
  ACBrNFeDANFEFR, ACBrNFe, Data.DB, Vcl.ActnList, System.Actions;

type
  TfrmComparaProdutosNFEFornecedor = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Associar1: TMenuItem;
    rdProdutosExibir: TRadioGroup;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    Panel4: TPanel;
    Panel13: TPanel;
    ed_cod_fornecedor: TEdit;
    ed_razao_social_fornecedor: TEdit;
    rdOrdem: TRadioGroup;
    Panel5: TPanel;
    btPesquisar: TBitBtn;
    btSair: TBitBtn;
    ed_cnpj_fornecedor: TEdit;
    Label3: TLabel;
    VisualizarltimoDANFEdecompra1: TMenuItem;
    lbQtdProdutos: TLabel;
    procedure Associar1Click(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure VisualizarltimoDANFEdecompra1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
  private
    { Private declarations }
    codFornecedorAssociar : string;
    produtosFornecedor : string;



  public
    { Public declarations }
   procedure setCodFornecedorAssociar(codFornecedor : string; AProdutosFornecedor : string);
  end;

var
  frmComparaProdutosNFEFornecedor: TfrmComparaProdutosNFEFornecedor;

implementation

uses uu_data_module, uuAssociaProdutoFornecedor, uu_frm_principal,
  uuCapturaXMLNFE, UU_DM_RELATORIOS;

{$R *.dfm}

procedure TfrmComparaProdutosNFEFornecedor.setCodFornecedorAssociar(codFornecedor : string; AProdutosFornecedor : string);
begin
  ed_cod_fornecedor.Text := codFornecedor;
  ed_cod_fornecedor.OnExit(ed_cod_fornecedor);
  produtosFornecedor := AProdutosFornecedor;
  rdProdutosExibir.ItemIndex := 2;
  btPesquisar.Click;


end;

procedure TfrmComparaProdutosNFEFornecedor.Associar1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmAssociaProdutoFornecedor, frmAssociaProdutoFornecedor);

  frmAssociaProdutoFornecedor.edCfopEntrada.Text := '';
  frmAssociaProdutoFornecedor.edCSTEntrada.Text  := '';
  frmAssociaProdutoFornecedor.rdTipoOperacao.ItemIndex := 0;
  frmAssociaProdutoFornecedor.edFatorConversao.Value   := 1;




  frmAssociaProdutoFornecedor.edNomeFornecedor.Text       := dm.qryComparaProdutosNFERAZAO_SOCIAL.Value;
  frmAssociaProdutoFornecedor.edCnpjFornecedor.Text       := dm.qryComparaProdutosNFECNPJ_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edCodProdFornecedor.Text    := dm.qryComparaProdutosNFECOD_PROD_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edDescProdFornecedor.Text   := dm.qryComparaProdutosNFEDESCRICAO_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edUnidadeFornecedor.Text    := dm.qryComparaProdutosNFEUNIDADE_COMERCIALIZADA.Value;
  frmAssociaProdutoFornecedor.edCFOPFornecedor.Text       := dm.qryComparaProdutosNFECFOP_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edCSTFornecedor.Text        := dm.qryComparaProdutosNFECST_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edNCMFornecedor.Text        := dm.qryComparaProdutosNFENCM.Value;

  if dm.qryComparaProdutosNFECOD_PRODUTO_INTERNO.Value <> null then
   begin

     frmAssociaProdutoFornecedor.ed_cod_item.Text            := dm.qryComparaProdutosNFECOD_PRODUTO_INTERNO.Value;
     frmAssociaProdutoFornecedor.ed_desc_item.Text           := dm.qryComparaProdutosNFEDESCRICAO.Value;
     frmAssociaProdutoFornecedor.ed_unidade_item.Text        := dm.qryComparaProdutosNFEDESCRICAO_UNIDADE.Value;

     frmAssociaProdutoFornecedor.edCfopEntrada.Text := dm.qryComparaProdutosNFECFOP_ENTRADA.Value;
     frmAssociaProdutoFornecedor.edCSTEntrada.Text  := dm.qryComparaProdutosNFECST_ENTRADA.Value;
     frmAssociaProdutoFornecedor.rdTipoOperacao.ItemIndex := dm.qryComparaProdutosNFEOPERACAO.Value -1;
     frmAssociaProdutoFornecedor.edFatorConversao.Value   := dm.qryComparaProdutosNFEFATOR_CONVERSAO.Value;

      

   end;



  frmAssociaProdutoFornecedor.ShowModal;
  btPesquisar.Click;
end;

procedure TfrmComparaProdutosNFEFornecedor.btPesquisarClick(Sender: TObject);
var
 tipoProduto : string;
 fornecedor  : string;
begin
  inherited;
  dm.qryComparaProdutosNFE.Active := false;
  dm.qryComparaProdutosNFE.sql.clear;


  dm.qryComparaProdutosNFE.SQL.add(' select cp.*, p.descricao, f.razao_social, u.descricao as descricao_unidade  from compara_produtos_nfe cp  ');
  dm.qryComparaProdutosNFE.SQL.add('  left join produtos p on (p.cod_produto  = cp.cod_produto_interno)   ');
  dm.qryComparaProdutosNFE.SQL.add( ' left join unidades u on (u.cod_unidade = p.unidade_entrada)  ');
  dm.qryComparaProdutosNFE.SQL.add( '  inner join fornecedor f on (f.cgc_cpf = cp.cnpj_fornecedor) ');
  dm.qryComparaProdutosNFE.SQL.add( ' where cp.cod_prod_fornecedor is not null');

  if produtosFornecedor <> ''  then
   begin
    dm.qryComparaProdutosNFE.SQL.add( ' and cp.cod_prod_fornecedor in ('+produtosFornecedor+')');
   end;

  case rdProdutosExibir.ItemIndex of
   0: begin
         dm.qryComparaProdutosNFE.SQL.add( ' and cp.cod_prod_fornecedor is not null');
         tipoProduto := '  produtos em geral';

      end;

   1: begin
       dm.qryComparaProdutosNFE.SQL.add( ' and cp.cod_produto_interno is not null');
       tipoProduto := '  produtos associados';
      end;

   2: begin
         dm.qryComparaProdutosNFE.SQL.add( ' and cp.cod_produto_interno is null');


        tipoProduto := '  produtos não associados';
      end;
 end;

 if (trim(ed_cod_fornecedor.Text) <> '') then
  begin
        dm.qryComparaProdutosNFE.SQL.add( ' and cp.cnpj_fornecedor ='+Quotedstr(ed_cnpj_fornecedor.Text));
        fornecedor := ' do(a) '+ed_razao_social_fornecedor.Text;
  end
 else
  begin
    fornecedor := ' de todos os fornecedores';
  end;


  case rdOrdem.ItemIndex of
   0: begin
         dm.qryComparaProdutosNFE.SQL.add( ' order by cp.cod_prod_fornecedor');
      end;

   1: begin
       dm.qryComparaProdutosNFE.SQL.add( ' order by cp.cod_produto_interno');
      end;

   2: begin
        dm.qryComparaProdutosNFE.SQL.add( ' order by cp.descricao_fornecedor');
      end;


 end;

 dm.adicionaLog(dm.qryComparaProdutosNFE.SQL.Text);
 dm.qryComparaProdutosNFE.Active := true;
 dm.qryComparaProdutosNFE.FetchAll;
 lbQtdProdutos.Caption :='Constam '+ IntToStr(dm.qryComparaProdutosNFE.RecordCount)+tipoProduto+fornecedor;


end;

procedure TfrmComparaProdutosNFEFornecedor.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmComparaProdutosNFEFornecedor.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if odd(dm.qryComparaProdutosNFE.RecNo) then
  DBGrid1.Canvas.Brush.Color:= clwhite
  else
  DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:=clred; //aqui é definida a cor do fundo
    Font.Color := clWhite;
    Font.Size :=   Font.Size + 2;
    Font.Style:= [fsbold];
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TfrmComparaProdutosNFEFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  btPesquisar.Click;
end;

procedure TfrmComparaProdutosNFEFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  codFornecedorAssociar :='';
  produtosFornecedor := '';
end;

procedure TfrmComparaProdutosNFEFornecedor.VisualizarltimoDANFEdecompra1Click(
  Sender: TObject);
begin
  inherited;
  dm.ACBrNFe1.NotasFiscais.Clear;
//  dm_relatorios.ACBrNFeDANFEFR1  .FastFile :=patchAplicacao+'DANFePaisagem.fr3';
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(patchXMLEntradas+dm.qryComparaProdutosNFEULTIMA_CHAVE.Value+'-nfe.xml',False);
  dm.ACBrNFe1.NotasFiscais.Imprimir;

end;

end.
