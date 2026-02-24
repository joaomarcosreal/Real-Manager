unit uuCadUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uu_modelo_Vazio, Dialogs, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, URealDatasets, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlassButton, JvPageList, JvExControls, RxToolEdit, RxCurrEdit,
  UnidadeMedidaController, UnidadeMedida, Vcl.Menus, cxCustomData, cxFilter,
  cxData, dxDateRanges, dxScrollbarAnnotations, Vcl.Mask;

type
  TfrmCadUnidades = class(Tfrm_modelo_vazio)
    JvPageList1: TJvPageList;
    pgListagem: TJvStandardPage;
    Panel3: TPanel;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    pgCadastro: TJvStandardPage;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edDescricao: TEdit;
    edSigla: TEdit;
    edValor: TCurrencyEdit;
    Panel2: TPanel;
    btVoltar: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxGrid1DBTableView1COD_UNIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1SIGLA: TcxGridDBColumn;
    cxGrid1DBTableView1PARAMETRO: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    PopupMenu1: TPopupMenu;
    Alterarunidade1: TMenuItem;
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton4Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Alterarunidade1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    LUnidadeSelecionada: TUnidadeMedida;
    procedure Salvar;
    procedure NovaUnidade;
    procedure AtualizaLista;
    procedure SelecionaUnidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidades: TfrmCadUnidades;

implementation

uses
  uu_data_module, uuDmCadUnidadesMedida;

{$R *.dfm}

procedure TfrmCadUnidades.AdvGlassButton1Click(Sender: TObject);
begin
  Salvar;
end;

procedure TfrmCadUnidades.btVoltarClick(Sender: TObject);
begin
  inherited;
  pgListagem.Show;
end;

procedure TfrmCadUnidades.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SelecionaUnidade;
end;

procedure TfrmCadUnidades.FormActivate(Sender: TObject);
begin
  inherited;
  dmCadUnidadesMedida := TdmCadUnidadesMedida.Create(self);
  dmCadUnidadesMedida.qryUnidadesMedida.Active := false;
  dmCadUnidadesMedida.qryUnidadesMedida.Active := True;

end;

procedure TfrmCadUnidades.FormCreate(Sender: TObject);
begin
  inherited;
  LUnidadeSelecionada := TUnidadeMedida.Create;

end;

procedure TfrmCadUnidades.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmCadUnidadesMedida);
  FreeAndNil(LUnidadeSelecionada);
end;

procedure TfrmCadUnidades.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadUnidades.AdvGlassButton4Click(Sender: TObject);
begin
  inherited;
  NovaUnidade;
end;

procedure TfrmCadUnidades.Alterarunidade1Click(Sender: TObject);
begin
  inherited;
  SelecionaUnidade;
end;

procedure TfrmCadUnidades.SelecionaUnidade();
var
  LUnidadeMedidaController: TUnidadeMedidaController;
begin

  LUnidadeMedidaController := TUnidadeMedidaController.Create;

  try
    try
      evento := 2;
      LUnidadeSelecionada.Codigo := dmCadUnidadesMedida.qryUnidadesMedida.FieldByName('cod_unidade').Value;
      LUnidadeMedidaController.Read(LUnidadeSelecionada, TRealConnection(dm.fdRestaurante));
      edDescricao.Text := LUnidadeSelecionada.Descricao;
      edSigla.Text := LUnidadeSelecionada.Sigla;
      edValor.Value := LUnidadeSelecionada.valor;
      pgCadastro.Show;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro:' + sLineBreak + sLineBreak + E.Message, 'Ok', mtError);
      end;
    end;
  finally
    FreeAndNil(LUnidadeMedidaController);
  end;
end;

procedure TfrmCadUnidades.NovaUnidade();
begin
  evento := 1;
  pgCadastro.Show;
end;

procedure TfrmCadUnidades.AtualizaLista();
begin
  dmCadUnidadesMedida.qryUnidadesMedida.Active := false;
  dmCadUnidadesMedida.qryUnidadesMedida.Active := true;
end;

procedure TfrmCadUnidades.Salvar;
var
  LUnidadeMedida: TUnidadeMedida;
  LUnidadeMedidaController: TUnidadeMedidaController;
begin
  LUnidadeMedida := TUnidadeMedida.Create;
  LUnidadeMedidaController := TUnidadeMedidaController.Create;

  try
    try
      LUnidadeMedida.Descricao := edDescricao.Text;
      LUnidadeMedida.valor := StrToInt(Floattostr(edValor.Value));
      LUnidadeMedida.Sigla := edSigla.Text;

      case evento of
        1:
          begin

            LUnidadeMedidaController.CreateNew(LUnidadeMedida, TRealConnection(dm.fdRestaurante));
            dm.exibe_painel_erro('Unidade cadastrada com sucesso!', 'Ok', mtInformation);
            btVoltar.Click;
          end;
        2:
          begin
            LUnidadeMedida.Codigo := LUnidadeSelecionada.Codigo;
            LUnidadeMedidaController.Update(LUnidadeMedida, TRealConnection(dm.fdRestaurante));
            dm.exibe_painel_erro('Unidade atualizada com sucesso!', 'Ok', mtInformation);
            btVoltar.Click;
          end;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro:' + sLineBreak + sLineBreak + E.Message, 'Ok', mtError);
      end;
    end;
  finally
    FreeAndNil(LUnidadeMedida);
    FreeAndNil(LUnidadeMedidaController);
  end;
end;

end.

