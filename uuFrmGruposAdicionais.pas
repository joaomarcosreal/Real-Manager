unit uuFrmGruposAdicionais;

interface

uses
  Winapi.Windows, Winapi.Messages, JvPageList, System.SysUtils, System.Variants,
  RealFramework, URealDatasets, GrupoAdicional,
  GrupoAdicionalController, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Produto, AdvGlassButton, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxCurrencyEdit, Vcl.Menus, cxClasses,
  Vcl.Samples.Spin, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, JvExControls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Buttons, cxCustomData,
  cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations;

type
  TfrmCadastroGruposAdicionais = class(Tfrm_modelo_vazio)
    pgListagem: TJvStandardPage;
    pgProdutos: TJvStandardPage;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel3: TPanel;
    AdvGlassButton4: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Panel1: TPanel;
    AdvGlassButton7: TAdvGlassButton;
    AdvGlassButton8: TAdvGlassButton;
    tbGrupos: TcxGridDBTableView;
    gridGruposLevel1: TcxGridLevel;
    gridGrupos: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    HeaderStl: TcxStyle;
    Panel2: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel5: TPanel;
    AdvGlassButton12: TAdvGlassButton;
    AdvGlassButton13: TAdvGlassButton;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1DESCRICAO: TcxGridDBColumn;
    cxGridDBTableView1VALOR: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    pgCadastro: TJvStandardPage;
    Panel6: TPanel;
    Label2: TLabel;
    Panel8: TPanel;
    AdvGlassButton19: TAdvGlassButton;
    Panel7: TPanel;
    AdvGlassButton15: TAdvGlassButton;
    AdvGlassButton16: TAdvGlassButton;
    edNomeGrupo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edDescricaoGrupo: TEdit;
    rdTipoGrupo: TRadioGroup;
    Alterarprodutosdogrupo1: TMenuItem;
    pgList: TJvPageList;
    lbDescricaoProduto: TLabel;
    rdTipoQtdSelecao: TRadioGroup;
    tbGruposID: TcxGridDBColumn;
    tbGruposNOME: TcxGridDBColumn;
    tbGruposDESCRICAO: TcxGridDBColumn;
    tbGruposQTDMIN: TcxGridDBColumn;
    tbGruposQTDMAX: TcxGridDBColumn;
    tbGruposDESCRICAOTIPO: TcxGridDBColumn;
    pnQuantidades: TPanel;
    edQtdMaxima: TSpinEdit;
    Label6: TLabel;
    edQtdMinima: TSpinEdit;
    Label5: TLabel;
    cxGridDBTableView1QTD: TcxGridDBColumn;
    AdvGlassButton5: TAdvGlassButton;
    cxGridDBTableView1TIPO: TcxGridDBColumn;
    PopupMenu2: TPopupMenu;
    Excluiropcionalobservao1: TMenuItem;
    Excluirgrupo1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AlterarAdicionarprodutos1Click(Sender: TObject);
    procedure AdvGlassButton12Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton13Click(Sender: TObject);
    procedure AdvGlassButton8Click(Sender: TObject);
    procedure AdvGlassButton19Click(Sender: TObject);
    procedure Alterarprodutosdogrupo1Click(Sender: TObject);
    procedure AdvGlassButton16Click(Sender: TObject);
    procedure AdvGlassButton7Click(Sender: TObject);
    procedure pgListagemShow(Sender: TObject);
    procedure rdTipoQtdSelecaoClick(Sender: TObject);
    procedure rdTipoGrupoClick(Sender: TObject);
    procedure AdvGlassButton5Click(Sender: TObject);
    procedure Excluiropcionalobservao1Click(Sender: TObject);
    procedure Excluirgrupo1Click(Sender: TObject);
  private
    FGrupoSelecionado: TGrupoAdicional;
    FProdutoSelecionado: TProduto;
    procedure AlterarProdutosDoGrupo;
    procedure SalvarAlteracoesProdutos;
    procedure selecionarGrupo(AGrupoAdicional: TGrupoAdicional);
    procedure clearFields;
    procedure NovoGrupo;
    procedure Salvar;


    { Private declarations }

  public
    { Public declarations }
    procedure setProdutoSelecionado(AProduto: TProduto);
  end;

var
  frmCadastroGruposAdicionais: TfrmCadastroGruposAdicionais;

implementation

uses
  uuDMGruposAdicionais, uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmCadastroGruposAdicionais.AdvGlassButton12Click(Sender: TObject);
begin
  inherited;
  pgListagem.Show;
end;

procedure TfrmCadastroGruposAdicionais.AdvGlassButton13Click(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a atualização dos adicionais deste grupo?') = teSim) then
  begin
    SalvarAlteracoesProdutos;
  end;
end;

procedure TfrmCadastroGruposAdicionais.AdvGlassButton16Click(Sender: TObject);
begin
  inherited;
  Salvar;

end;

procedure TfrmCadastroGruposAdicionais.Salvar;
var
  LGrupoAdicionalController: TGrupoAdicionalController;
begin
  LGrupoAdicionalController := TGrupoAdicionalController.Create;
  try
    try
      FGrupoSelecionado.CodProduto := FProdutoSelecionado.Codigo;
      FGrupoSelecionado.Nome := edNomeGrupo.Text;
      FGrupoSelecionado.Descricao := edDescricaoGrupo.Text;
      FGrupoSelecionado.QtdeMinima := edQtdMinima.Value;
      FGrupoSelecionado.QtdeMaxima := edQtdMaxima.Value;
      FGrupoSelecionado.Unico := False;
      FGrupoSelecionado.tipo := rdTipoGrupo.ItemIndex;
      if ((FGrupoSelecionado.QtdeMinima = 1) and (FGrupoSelecionado.QtdeMaxima = 1)) then
      begin
        FGrupoSelecionado.Unico := true;
      end;
      case evento of
        1:
          begin
            LGrupoAdicionalController.Cadastrar(FGrupoSelecionado, TRealConnection(dm.fdRestaurante));
            ShowRealDialog(Self, tmSucesso, 'Sucesso!', 'Grupo de complemento cadastrado com sucesso!');

          end;
        2:
          begin
            LGrupoAdicionalController.Atualizar(FGrupoSelecionado, TRealConnection(dm.fdRestaurante));
            ShowRealDialog(Self, tmSucesso, 'Sucesso!', 'Grupo de complemento cadastrado com sucesso!');
          end;

      end;
      clearFields;
      pgListagem.Show;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok', mtError);

      end;
    end;
  finally
    FreeAndNil(LGrupoAdicionalController);
  end;

end;

procedure TfrmCadastroGruposAdicionais.clearFields();
begin
  edNomeGrupo.Text := '';
  edDescricaoGrupo.Text := '';
  edQtdMinima.Value := 1;
  edQtdMaxima.Value := 1;
  rdTipoGrupo.ItemIndex := 0;
end;

procedure TfrmCadastroGruposAdicionais.Excluirgrupo1Click(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão do grupo ?') = teSim) then
  begin
    dmGruposAdicionais.ExcluirGrupoAdicional;
  end;
end;

procedure TfrmCadastroGruposAdicionais.Excluiropcionalobservao1Click(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão do adicional / observação ?') = teSim) then
  begin
    dmGruposAdicionais.ExcluirAdicional;
  end;
end;

procedure TfrmCadastroGruposAdicionais.AdvGlassButton19Click(Sender: TObject);
begin
  inherited;

  try
    try
      string_auxiliar := '';
      pesquisaProdutosCardapio();
      if (trim(string_auxiliar) <> '') then
      begin
        dmGruposAdicionais.AdicionarProdutoAoGrupo(FGrupoSelecionado, string_auxiliar, '');
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao adicionar produto ao grupo!' + sLineBreak + sLineBreak + E.Message, 'Ok', mtError);
      end;

    end;
  finally

  end;

end;

procedure TfrmCadastroGruposAdicionais.AdvGlassButton5Click(Sender: TObject);
begin

  try
    try

      dmGruposAdicionais.AdicionarProdutoAoGrupo(FGrupoSelecionado, '00000', 'Digite aqui a observação que você deseja!');

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao adicionar produto ao grupo!' + sLineBreak + sLineBreak + E.Message, 'Ok', mtError);
      end;

    end;
  finally

  end;
end;

procedure TfrmCadastroGruposAdicionais.AdvGlassButton7Click(Sender: TObject);
begin
  inherited;
  NovoGrupo;
end;

procedure TfrmCadastroGruposAdicionais.NovoGrupo();
begin
  evento := 1;
  clearFields;
  pgCadastro.Show;
  edNomeGrupo.SetFocus;

end;

procedure TfrmCadastroGruposAdicionais.pgListagemShow(Sender: TObject);
begin
  inherited;
  dmGruposAdicionais.ListarGruposDeAdicionais(FProdutoSelecionado.Codigo);
end;

procedure TfrmCadastroGruposAdicionais.rdTipoGrupoClick(Sender: TObject);
begin
  inherited;
  case rdTipoGrupo.ItemIndex of
    2:
      begin
        pnQuantidades.Visible := false;
        edQtdMaxima.Value := 1;
        edQtdMinima.Value := 1;
        rdTipoQtdSelecao.ItemIndex := 0;
      end
  else
    begin
      pnQuantidades.Visible := true;
      edQtdMaxima.Value := 1;
      edQtdMinima.Value := 1;
      rdTipoQtdSelecao.ItemIndex := 1;
    end;

  end;
end;

procedure TfrmCadastroGruposAdicionais.rdTipoQtdSelecaoClick(Sender: TObject);
begin
  inherited;
  if rdTipoQtdSelecao.ItemIndex = 0 then
  begin
    edQtdMinima.Value := 1;
    edQtdMaxima.Value := 1;
    pnQuantidades.Visible := false;

  end
  else
  begin
    edQtdMinima.Value := 1;
    edQtdMaxima.Value := 1;
    pnQuantidades.Visible := true;
  end;
end;

procedure TfrmCadastroGruposAdicionais.AdvGlassButton8Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadastroGruposAdicionais.SalvarAlteracoesProdutos();
begin
  try
    try
      dmGruposAdicionais.qryProdutosGruposAdicionais.ApplyUpdates(0);
      dm.exibe_painel_erro('Atualização concluída!', 'Ok', mtInformation);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao atualizar os produtos ' + sLineBreak + sLineBreak + E.Message, 'Ok', mtError);
      end;
    end;

  finally

  end;

end;

procedure TfrmCadastroGruposAdicionais.AlterarAdicionarprodutos1Click(Sender: TObject);
begin
  inherited;

  selecionarGrupo(FGrupoSelecionado);
  pgCadastro.Show;
end;

procedure TfrmCadastroGruposAdicionais.selecionarGrupo(AGrupoAdicional: TGrupoAdicional);
var
  LGrupoAdicionalController: TGrupoAdicionalController;
begin
  evento := 2;
  FGrupoSelecionado.ID := dmGruposAdicionais.qryGruposAdicionais.FieldByName('id').value;
  LGrupoAdicionalController := TGrupoAdicionalController.Create;
  try
    try
      LGrupoAdicionalController.Get(AGrupoAdicional, TRealConnection(dm.fdRestaurante));
      edNomeGrupo.Text := AGrupoAdicional.Nome;
      edDescricaoGrupo.Text := AGrupoAdicional.Descricao;
      edQtdMinima.Value := AGrupoAdicional.QtdeMinima;
      edQtdMaxima.Value := AGrupoAdicional.QtdeMaxima;
      rdTipoGrupo.ItemIndex := AGrupoAdicional.tipo;
      rdTipoGrupo.OnClick(nil);

      if AGrupoAdicional.Unico then
      begin
        edQtdMinima.Value := 1;
        edQtdMaxima.Value := 1;
        pnQuantidades.Visible := false;
        rdTipoQtdSelecao.ItemIndex := 0;
      end
      else
      begin
        pnQuantidades.Visible := true;
        rdTipoQtdSelecao.ItemIndex := 1;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok', mtError);

      end;
    end;
  finally
    FreeAndNil(LGrupoAdicionalController);
  end;

end;

procedure TfrmCadastroGruposAdicionais.AlterarProdutosDoGrupo();
begin
  dmGruposAdicionais.qryProdutosGruposAdicionais.Active := false;
  FGrupoSelecionado.ID := dmGruposAdicionais.qryGruposAdicionais.FieldByName('id').value;
  dmGruposAdicionais.qryProdutosGruposAdicionais.Params[0].Value := FGrupoSelecionado.ID;
  dmGruposAdicionais.qryProdutosGruposAdicionais.Active := true;
  pgProdutos.Show;
end;

procedure TfrmCadastroGruposAdicionais.Alterarprodutosdogrupo1Click(Sender: TObject);
begin
  inherited;

  selecionarGrupo(FGrupoSelecionado);
  AlterarProdutosDoGrupo();
end;

procedure TfrmCadastroGruposAdicionais.FormActivate(Sender: TObject);
begin
  inherited;
  tbGrupos.DataController.DataSource := dmGruposAdicionais.dsGruposAdicionais;
  lbDescricaoProduto.Caption := FProdutoSelecionado.Descricao;
end;

procedure TfrmCadastroGruposAdicionais.FormCreate(Sender: TObject);
begin
  inherited;
  FGrupoSelecionado := TGrupoAdicional.Create;
  Application.CreateForm(TdmGruposAdicionais, dmGruposAdicionais);

end;

procedure TfrmCadastroGruposAdicionais.setProdutoSelecionado(AProduto: TProduto);
begin
  FProdutoSelecionado := AProduto;
end;

procedure TfrmCadastroGruposAdicionais.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FGrupoSelecionado);

  dmGruposAdicionais.Free;
end;

end.

