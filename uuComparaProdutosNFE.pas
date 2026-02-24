unit uuComparaProdutosNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  IBX.IBQuery, ibx.ibdatabase, DBCtrls, Menus, Data.DB,
  AdvOfficeImage, PngSpeedButton, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions;

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
    ed_cnpj_fornecedor: TEdit;
    Label3: TLabel;
    VisualizarltimoDANFEdecompra1: TMenuItem;
    lbQtdProdutos: TLabel;
    edDescricaoProduto: TEdit;
    Label4: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TEdit;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    ed_desc_grupo: TEdit;
    Panel7: TPanel;
    lbTop: TLabel;
    Panel8: TPanel;
    AdvOfficeImage1: TAdvOfficeImage;
    lbNomeUsuario: TLabel;
    AdvOfficeImage2: TAdvOfficeImage;
    lbNumeroEstacao: TLabel;
    AdvOfficeImage4: TAdvOfficeImage;
    lbDataSistema: TLabel;
    AdvOfficeImage3: TAdvOfficeImage;
    lbHora: TLabel;
    timerHora: TTimer;
    PngSpeedButton1: TPngSpeedButton;
    btPesquisar: TPngSpeedButton;
    procedure Associar1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure VisualizarltimoDANFEdecompra1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerHoraTimer(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    codFornecedorAssociar: string;
    produtosFornecedor: string;
  public
    { Public declarations }
    procedure setCodFornecedorAssociar(codFornecedor: string; AProdutosFornecedor: string);
  end;

var
  frmComparaProdutosNFEFornecedor: TfrmComparaProdutosNFEFornecedor;

implementation

uses
  uu_data_module, uuAssociaProdutoFornecedor, uu_frm_principal;

{$R *.dfm}

procedure TfrmComparaProdutosNFEFornecedor.setCodFornecedorAssociar(codFornecedor: string; AProdutosFornecedor: string);
begin
  ed_cod_fornecedor.Text := codFornecedor;
  ed_cod_fornecedor.OnExit(ed_cod_fornecedor);
  produtosFornecedor := AProdutosFornecedor;
  rdProdutosExibir.ItemIndex := 2;
  btPesquisar.Click;

end;

procedure TfrmComparaProdutosNFEFornecedor.timerHoraTimer(Sender: TObject);
begin
  inherited;
  lbHora.Caption := FormatDateTime('HH:MM:SS', now);
end;

procedure TfrmComparaProdutosNFEFornecedor.Associar1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmAssociaProdutoFornecedor, frmAssociaProdutoFornecedor);

  frmAssociaProdutoFornecedor.edCfopEntrada.Text := '';
  frmAssociaProdutoFornecedor.edCSTEntrada.Text := '';
  frmAssociaProdutoFornecedor.edtFatorConversao.Value := 1;

  frmAssociaProdutoFornecedor.edtNomeFornecedor.Text := dm.qryComparaProdutosNFERAZAO_SOCIAL.Value;
  frmAssociaProdutoFornecedor.edtCnpjFornecedor.Text := dm.qryComparaProdutosNFECNPJ_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edtCodProdFornecedor.Text := dm.qryComparaProdutosNFECOD_PROD_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edtDescProdFornecedor.Text := dm.qryComparaProdutosNFEDESCRICAO_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edtUnidadeComercial.Text := dm.qryComparaProdutosNFEUNIDADE_COMERCIALIZADA.Value;
  frmAssociaProdutoFornecedor.edtCFOPFornecedor.Text := dm.qryComparaProdutosNFECFOP_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edtCSTFornecedor.Text := dm.qryComparaProdutosNFECST_FORNECEDOR.Value;
  frmAssociaProdutoFornecedor.edtNCMFornecedor.Text := dm.qryComparaProdutosNFENCM.Value;

  if dm.qryComparaProdutosNFECOD_PRODUTO_INTERNO.Value <> null then
  begin

    frmAssociaProdutoFornecedor.ed_cod_item.Text := dm.qryComparaProdutosNFECOD_PRODUTO_INTERNO.Value;
    frmAssociaProdutoFornecedor.ed_desc_item.Text := dm.qryComparaProdutosNFEDESCRICAO.Value;
    frmAssociaProdutoFornecedor.ed_unidade_item.Text := dm.qryComparaProdutosNFEDESCRICAO_UNIDADE.Value;

    frmAssociaProdutoFornecedor.edCfopEntrada.Text := dm.qryComparaProdutosNFECFOP_ENTRADA.Value;
    frmAssociaProdutoFornecedor.edCSTEntrada.Text := dm.qryComparaProdutosNFECST_ENTRADA.Value;
    frmAssociaProdutoFornecedor.edtFatorConversao.Value := dm.qryComparaProdutosNFEFATOR_CONVERSAO.Value;

  end;

  frmAssociaProdutoFornecedor.ShowModal;
  btPesquisar.Click;
end;

procedure TfrmComparaProdutosNFEFornecedor.btPesquisarClick(Sender: TObject);
var
  tipoProduto: string;
  fornecedor: string;
begin
  inherited;
  dm.qryComparaProdutosNFE.Active := false;
  dm.qryComparaProdutosNFE.sql.clear;

  dm.qryComparaProdutosNFE.SQL.add(' select cp.*, p.descricao, f.razao_social, u.descricao as descricao_unidade, g.cod_grupo, coalesce(g.descricao, ' + Quotedstr('NÃO ASSOCIADO') + ') as grupo_associado   from compara_produtos_nfe cp ');
  dm.qryComparaProdutosNFE.SQL.add('  left join produtos p on (p.cod_produto  = cp.cod_produto_interno)   ');
  dm.qryComparaProdutosNFE.SQL.add(' left join unidades u on (u.cod_unidade = p.unidade_entrada)  ');
  dm.qryComparaProdutosNFE.SQL.add(' left join grupos g on (g.cod_grupo = p.cod_grupo) ');
  dm.qryComparaProdutosNFE.SQL.add('  inner join fornecedor f on (f.cgc_cpf = cp.cnpj_fornecedor) ');
  dm.qryComparaProdutosNFE.SQL.add(' where cp.cod_prod_fornecedor is not null');

  if produtosFornecedor <> '' then
  begin
    dm.qryComparaProdutosNFE.SQL.add(' and cp.cod_prod_fornecedor in (' + produtosFornecedor + ')');
  end;

  case rdProdutosExibir.ItemIndex of
    0:
      begin
        dm.qryComparaProdutosNFE.SQL.add(' and cp.cod_prod_fornecedor is not null');
        tipoProduto := '  produtos em geral';

      end;

    1:
      begin
        dm.qryComparaProdutosNFE.SQL.add(' and cp.cod_produto_interno is not null');
        tipoProduto := '  produtos associados';
      end;

    2:
      begin
        dm.qryComparaProdutosNFE.SQL.add(' and cp.cod_produto_interno is null');

        tipoProduto := '  produtos não associados';
      end;
  end;

  if (trim(edDescricaoProduto.Text) <> '') then
  begin
    dm.qryComparaProdutosNFE.SQL.Add(' and ( cp.descricao_fornecedor  like ' + QuotedStr('%' + edDescricaoProduto.Text + '%') + ' ');
    dm.qryComparaProdutosNFE.SQL.Add(' or p.descricao like ' + QuotedStr('%' + edDescricaoProduto.Text + '%') + ' ) ');
  end;

  if (trim(ed_cod_grupo.Text) <> '') then
  begin
    dm.qryComparaProdutosNFE.SQL.Add(' and g.cod_grupo like ' + QuotedStr(ed_cod_grupo.Text + '%') + ' ');
  end;

  if (trim(ed_cod_fornecedor.Text) <> '') then
  begin
    dm.qryComparaProdutosNFE.SQL.add(' and cp.cnpj_fornecedor =' + Quotedstr(ed_cnpj_fornecedor.Text));
    fornecedor := ' do(a) ' + ed_razao_social_fornecedor.Text;
  end
  else
  begin
    fornecedor := ' de todos os fornecedores';
  end;

  case rdOrdem.ItemIndex of
    0:
      begin
        dm.qryComparaProdutosNFE.SQL.add(' order by cp.cod_prod_fornecedor');
      end;

    1:
      begin
        dm.qryComparaProdutosNFE.SQL.add(' order by cp.cod_produto_interno');
      end;

    2:
      begin
        dm.qryComparaProdutosNFE.SQL.add(' order by cp.descricao_fornecedor');
      end;

  end;

 //////dm.adicionalog(dm.qryComparaProdutosNFE.SQL.Text);
  dm.qryComparaProdutosNFE.Active := true;
  dm.qryComparaProdutosNFE.FetchAll;
  lbQtdProdutos.Caption := 'Constam ' + IntToStr(dm.qryComparaProdutosNFE.RecordCount) + tipoProduto + fornecedor;
end;

procedure TfrmComparaProdutosNFEFornecedor.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if odd(dm.qryComparaProdutosNFE.RecNo) then
    DBGrid1.Canvas.Brush.Color := clwhite
  else
    DBGrid1.Canvas.Brush.Color := clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color := clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

  TDbGrid(Sender).Canvas.font.Color := clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clred; //aqui é definida a cor do fundo
      Font.Color := clWhite;
      Font.Size := Font.Size + 2;
      Font.Style := [fsbold];
      FillRect(Rect);
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

end;

procedure TfrmComparaProdutosNFEFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  lbNomeUsuario.Caption := nome_completo_usuario;
  lbNumeroEstacao.Caption := numero_caixa;
  lbDataSistema.Caption := FormatDateTime('DD/MM/YY', data_do_sistema);
  lbHora.Caption := FormatDateTime('HH:MM:SS', now);

  if (StrToInt(dm.LeIni(2, 'BANCO_DE_DADOS', 'desabilitaConsultasIncrementais')) = 0) then
  begin
    btPesquisar.Click;
  end;

end;

procedure TfrmComparaProdutosNFEFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  codFornecedorAssociar := '';
  produtosFornecedor := '';
end;

procedure TfrmComparaProdutosNFEFornecedor.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmComparaProdutosNFEFornecedor.VisualizarltimoDANFEdecompra1Click(Sender: TObject);
var
  ts: TIBTransaction;
  LQuery: TIBQuery;
begin
  inherited;

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  LQuery := TIBQuery.Create(Self);
  LQuery.Database := dm.dbrestaurante;
  LQuery.Transaction := ts;
  LQuery.Active := false;

  try

    LQuery.Active := false;
    LQuery.SQL.Clear;
    LQuery.SQL.Add('select xml_nota from nfe_destinadas  nf where nf.chave_nfe=' + Quotedstr(dm.qryComparaProdutosNFEULTIMA_CHAVE.Value));
    LQuery.Active := true;

    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromString(LQuery.FieldByName('xml_nota').Value, false);
    dm.ACBrNFe1.NotasFiscais.Imprimir;

  finally
    LQuery.Close;
    ts.Active := false;
    FreeAndNil(LQuery);
    FreeAndNil(ts);
  end;

end;

end.

