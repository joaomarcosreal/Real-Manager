unit uuConfiguracoesReplicacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, vcl.Clipbrd,
  RealFramework, uuDmConfiguracaoReplicacao, uu_data_module, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxCheckBox, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCheckComboBox, Vcl.StdCtrls,
  Vcl.Buttons, PngSpeedButton,
  cxDBLookupComboBox, cxCustomListBox, cxCheckListBox, JvPageList,
  JvExControls, Vcl.Menus, AdvGlassButton, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations, cxLookupEdit, cxDBLookupEdit;

type
  TfrmConfiguracaoReplicacao = class(Tfrm_modelo_vazio)
    cxstylrpstry1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    cxStyle1: TcxStyle;
    popFieldProp: TPopupMenu;
    A1: TMenuItem;
    A2: TMenuItem;
    popCopiar: TPopupMenu;
    M1: TMenuItem;
    Panel3: TPanel;
    pgSchemas: TJvPageList;
    pgListaSchema: TJvStandardPage;
    Panel29: TPanel;
    Panel30: TPanel;
    Label15: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    pgNovoSchema: TJvStandardPage;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    edNomeSchema: TEdit;
    Label2: TLabel;
    pgAdicionarTabela: TJvStandardPage;
    Panel2: TPanel;
    pgList: TJvPageList;
    pgFieldsSelect: TJvStandardPage;
    Panel6: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    Panel8: TPanel;
    Label4: TLabel;
    cbTableName: TcxLookupComboBox;
    ckFieldList: TcxCheckListBox;
    ckbSelecionarTodos: TcxCheckBox;
    Panel12: TPanel;
    btGerarSQLSelect: TPngSpeedButton;
    pgScriptsDelete: TJvStandardPage;
    Panel21: TPanel;
    Panel22: TPanel;
    Label11: TLabel;
    Panel23: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Panel24: TPanel;
    PngSpeedButton6: TPngSpeedButton;
    PngSpeedButton7: TPngSpeedButton;
    memoScriptBeforeDelete: TMemo;
    memoScriptAfterDelete: TMemo;
    pgScriptsInsertOrUp: TJvStandardPage;
    Panel17: TPanel;
    Panel18: TPanel;
    Label8: TLabel;
    Panel19: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Panel20: TPanel;
    PngSpeedButton4: TPngSpeedButton;
    PngSpeedButton5: TPngSpeedButton;
    memoScriptBeforeInsertOrUp: TMemo;
    memoScriptAfterInsertOrUp: TMemo;
    pgFieldExtraParams: TJvStandardPage;
    Panel13: TPanel;
    Panel14: TPanel;
    Label5: TLabel;
    Panel15: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Panel16: TPanel;
    PngSpeedButton1: TPngSpeedButton;
    memoExtraFieldParam: TMemo;
    edAliasName: TEdit;
    pgSelectSQL: TJvStandardPage;
    Panel9: TPanel;
    Panel10: TPanel;
    Label16: TLabel;
    Panel11: TPanel;
    memoSQLSelect: TMemo;
    Panel25: TPanel;
    PngSpeedButton2: TPngSpeedButton;
    PngSpeedButton3: TPngSpeedButton;
    pgVirtualFields: TJvStandardPage;
    Panel26: TPanel;
    Panel27: TPanel;
    Label17: TLabel;
    Panel28: TPanel;
    Label18: TLabel;
    Panel31: TPanel;
    PngSpeedButton8: TPngSpeedButton;
    memoVirtualFields: TMemo;
    Panel1: TPanel;
    btSalvarSchema: TAdvGlassButton;
    pgCancelarSchema: TAdvGlassButton;
    popListaSchemas: TPopupMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    D1: TMenuItem;
    C1: TMenuItem;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure cbTableNamePropertiesCloseUp(Sender: TObject);
    procedure btGerarSQLSelectClick(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure PngSpeedButton6Click(Sender: TObject);
    procedure PngSpeedButton4Click(Sender: TObject);
    procedure PngSpeedButton5Click(Sender: TObject);
    procedure PngSpeedButton8Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure PngSpeedButton7Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure btSalvarSchemaClick(Sender: TObject);
    procedure pgCancelarSchemaClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
  private
    procedure BuscarCampos(ATabela: string);
    procedure GenerateSelectSQL(ALSQL: TStringlist);
    procedure ShowFieldExtraParams(AFieldName: string);
    procedure FilterFieldParams(AFieldName: string);
    procedure ClearAllMemos;
    procedure GerarSQLSelecao;
    procedure GerarListaDeServidores;
    procedure BuscarServers;
    procedure SalvarSchema(ANome: string);
    procedure DeleteSchema(AID: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracaoReplicacao: TfrmConfiguracaoReplicacao;
  dmConfiguracaoReplicacao: TdmConfiguracaoReplicacao;

implementation


  {$R *.dfm}

procedure TfrmConfiguracaoReplicacao.cbTableNamePropertiesCloseUp(Sender: TObject);
begin
  inherited;
  BuscarCampos(cbTableName.EditValue);
  ClearAllMemos;
end;

procedure TfrmConfiguracaoReplicacao.ckbSelecionarTodosClick(Sender: TObject);
var
  I: integer;
  LOption: boolean;
begin
  inherited;
  if ckbSelecionarTodos.Checked then
  begin
    LOption := true;
    ckbSelecionarTodos.caption := 'Desmarcar todos';
  end
  else
  begin
    LOption := false;
    ckbSelecionarTodos.caption := 'Marcar todos';
  end;

  for I := 0 to ckFieldList.Items.Count - 1 do
    ckFieldList.Items[I].Checked := LOption;

end;

procedure TfrmConfiguracaoReplicacao.FormCreate(Sender: TObject);
begin
  inherited;
  DmConfiguracaoReplicacao := TDmConfiguracaoReplicacao.create(self);
end;

procedure TfrmConfiguracaoReplicacao.FormDestroy(Sender: TObject);
begin
  inherited;
  DmConfiguracaoReplicacao.free;
end;

procedure TfrmConfiguracaoReplicacao.GenerateSelectSQL(ALSQL: TStringlist);
var
  I: integer;
  LFieldName: string;
  LFieldSQL: string;
begin

  ALSQL.clear;
  ALSQL.Add('select ');
  ALSQL.Add(memoVirtualFields.Text);

  for I := 0 to ckFieldList.Items.Count - 1 do
  begin
    if ckFieldList.Items[I].Checked then
    begin
      LFieldName := ckFieldList.Items[I].Text;
      FilterFieldParams(LFieldName);

      if (trim(DmConfiguracaoReplicacao.tbFieldPropertiesExtraParams.Value) <> '') then
      begin
        LFieldSQL := DmConfiguracaoReplicacao.tbFieldPropertiesExtraParams.Value;
        LFieldSQL := StringReplace(LFieldSQL, '#', LFieldName, [rfReplaceAll])
      end
      else
        LFieldSQL := LFieldName;

      if (trim(DmConfiguracaoReplicacao.tbFieldPropertiesAlias.Value) <> '') then
        LFieldSQL := LFieldSQL + ' as ' + DmConfiguracaoReplicacao.tbFieldPropertiesAlias.Value;

      ALSQL.Add(LFieldSQL + ',');
    end;
  end;
  ALSQL[ALSQL.Count - 1] := StringReplace(ALSQL[ALSQL.Count - 1], ',', '', [rfReplaceAll]);

  ALSQL.Add(' from ' + cbTableName.EditValue);

end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmConfiguracaoReplicacao.tbFieldProperties.Edit;
  dmConfiguracaoReplicacao.tbFieldPropertiesAlias.Text := edAliasName.Text;
  dmConfiguracaoReplicacao.tbFieldPropertiesExtraParams.Value := memoExtraFieldParam.Text;
  dmConfiguracaoReplicacao.tbFieldProperties.Post;
  dmConfiguracaoReplicacao.tbFieldProperties.Filtered := false;
  pgFieldsSelect.Show;

end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  pgFieldsSelect.Show;
end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton4Click(Sender: TObject);
begin
  inherited;
  pgFieldsSelect.show;
end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton5Click(Sender: TObject);
begin
  inherited;
  pgScriptsDelete.Show;
end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton6Click(Sender: TObject);
begin
  inherited;
  pgScriptsInsertOrUp.Show;
end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton7Click(Sender: TObject);
begin
  inherited;
  pgSelectSQL.Show;
end;

procedure TfrmConfiguracaoReplicacao.PngSpeedButton8Click(Sender: TObject);
begin
  inherited;
  pgFieldsSelect.Show;
end;

procedure TfrmConfiguracaoReplicacao.A1Click(Sender: TObject);
var
  LFieldName: string;
begin
  inherited;
  LFieldName := ckFieldList.Items[ckFieldList.ItemIndex].Text;
  ShowFieldExtraParams(LFieldName);
end;

procedure TfrmConfiguracaoReplicacao.A2Click(Sender: TObject);
begin
  inherited;
  pgVirtualFields.Show;
end;

procedure TfrmConfiguracaoReplicacao.btGerarSQLSelectClick(Sender: TObject);
begin
  GerarSQLSelecao();
  pgScriptsInsertOrUp.Show;
end;

procedure TfrmConfiguracaoReplicacao.btSalvarSchemaClick(Sender: TObject);
begin
  inherited;

  try
    try
      SalvarSchema(edNomeSchema.Text);
      ShowRealDialog(Self, tmSucesso, 'Sucesso', 'Schema cadastrado!');
      edNomeSchema.clear;
      pgListaSchema.Show;

    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', E.message);
      end;
    end;
  finally

  end;

end;

procedure TfrmConfiguracaoReplicacao.SalvarSchema(ANome: string);
var
  LSQL: Tstringlist;
begin

  if Trim(ANome) = '' then
    raise Exception.Create('Nome de Schema inválido!');

  LSQL := TStringList.Create;
  try
    try
      LSQL.Add('insert into REPLICATION_SCHEMAS (name) values (' + Quotedstr(ANome) + ')');
      dm.executaSQL(LSQL.Text);
      dmConfiguracaoReplicacao.RefreshSchemas;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmConfiguracaoReplicacao.DeleteSchema(AID: integer);
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.Create;
  try
    try
      if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão do schema ?', 22, true) = teSim) then
      begin
        LSQL.Add(' delete from  REPLICATION_SCHEMAS where id=' + Inttostr(AID));
        dm.executaSQL(LSQL.Text);
        dmConfiguracaoReplicacao.RefreshSchemas;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmConfiguracaoReplicacao.E1Click(Sender: TObject);
begin
  inherited;
  if dmConfiguracaoReplicacao.qrySchemas.IsEmpty = False then
  begin
    DeleteSchema(dmConfiguracaoReplicacao.qrySchemas.fieldbyname('id').value);
  end;
end;

procedure TfrmConfiguracaoReplicacao.GerarListaDeServidores;
begin

end;

procedure TfrmConfiguracaoReplicacao.GerarSQLSelecao();
var
  LSQL: TStringList;
begin
  inherited;
  LSQL := TStringList.Create;

  try
    try

      memoSQLSelect.Lines.Clear;
      GenerateSelectSQL(LSQL);
      memoSQLSelect.Lines.Add(LSQL.Text);
      pgSelectSQL.Show;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar SQL de seleção! ' + sLineBreak + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmConfiguracaoReplicacao.M1Click(Sender: TObject);
begin
  inherited;

  Clipboard.AsText := memoSQLSelect.Lines.Text;
end;

procedure TfrmConfiguracaoReplicacao.N1Click(Sender: TObject);
begin
  inherited;
  edNomeSchema.clear;
  pgNovoSchema.Show;
end;

procedure TfrmConfiguracaoReplicacao.pgCancelarSchemaClick(Sender: TObject);
begin
  inherited;
  edNomeSchema.clear;
  pgListaSchema.Show;
end;

procedure TfrmConfiguracaoReplicacao.FilterFieldParams(AFieldName: string);
begin
  dmConfiguracaoReplicacao.tbFieldProperties.Filtered := true;
  dmConfiguracaoReplicacao.tbFieldProperties.Filter := 'FieldName = ' + Quotedstr(AFieldName);
end;

procedure TfrmConfiguracaoReplicacao.ShowFieldExtraParams(AFieldName: string);
begin
  FilterFieldParams(AFieldName);
  edAliasName.Text := dmConfiguracaoReplicacao.tbFieldPropertiesAlias.value;
  memoExtraFieldParam.Text := dmConfiguracaoReplicacao.tbFieldPropertiesExtraParams.Value;
  pgFieldExtraParams.Show;

end;

procedure TfrmConfiguracaoReplicacao.BuscarServers();
var
  LSQL: TStringList;
begin
  inherited;

  LSQL := TStringList.Create;

  try

    try
    except
      on E: Exception do
      begin

      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmConfiguracaoReplicacao.C1Click(Sender: TObject);
begin
  inherited;
  pgAdicionarTabela.Show;
end;

procedure TfrmConfiguracaoReplicacao.BuscarCampos(ATabela: string);
var
  ALista: TStringList;
  i: integer;
begin
  inherited;
  dmConfiguracaoReplicacao.tbFieldProperties.Active := false;
  dmConfiguracaoReplicacao.tbFieldProperties.Active := true;
  ckbSelecionarTodos.caption := 'Marcar todos';
  ckbSelecionarTodos.Checked := false;
  ALista := TStringList.create;
  try
    try
      DmConfiguracaoReplicacao.GetTableFieldNames(ATabela, ALista);
      ckFieldList.items.Clear;
      for i := 0 to ALista.Count - 1 do
      begin
        ckFieldList.AddItem(ALista[i]);
        dmConfiguracaoReplicacao.tbFieldProperties.Append;
        dmConfiguracaoReplicacao.tbFieldPropertiesFieldName.Value := ALista[i];
        dmConfiguracaoReplicacao.tbFieldPropertiesExtraParams.Value := '';
        dmConfiguracaoReplicacao.tbFieldPropertiesAlias.Value := '';
        dmConfiguracaoReplicacao.tbFieldProperties.Post;

      end;

    except
      on E: Exception do
      begin

      end;

    end;
  finally
    FreeAndNil(ALista);
  end;
end;

procedure TfrmConfiguracaoReplicacao.ClearAllMemos();
begin
  memoSQLSelect.clear;
  memoExtraFieldParam.clear;
  memoScriptBeforeInsertOrUp.Clear;
  memoScriptAfterInsertOrUp.clear;
  memoScriptBeforeDelete.Clear;
  memoScriptAfterDelete.Clear;
  memoVirtualFields.Clear;

end;

end.

