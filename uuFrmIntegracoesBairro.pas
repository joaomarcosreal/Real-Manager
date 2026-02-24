unit uuFrmIntegracoesBairro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio,
  Vcl.StdCtrls, cxGraphics, cxControls,
  cxStyles,
  Data.DB, cxGridLevel, cxClasses,
  cxGridDBTableView, cxGrid,
  uuDmIntegracoes, cxDBLookupComboBox, AdvOfficeImage, Vcl.ExtCtrls, JvPageList,
  JvExControls, JvTabBar,


  FireDAC.Comp.Client, uu_data_module, AdvGlassButton,
  PngSpeedButton, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, Vcl.Buttons,
  JvButton, JvTransparentButton, Vcl.Menus, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations, cxLookupEdit, cxDBLookupEdit;

type
  TfrmConfigIntegracoes = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    AdvOfficeImage1: TAdvOfficeImage;
    Panel2: TPanel;
    AdvOfficeImage2: TAdvOfficeImage;
    JvTabBar1: TJvTabBar;
    pgIntegracoes: TJvPageList;
    pgBairros: TJvStandardPage;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    pgFormasDePagamento: TJvStandardPage;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    Panel3: TPanel;
    AdvOfficeImage3: TAdvOfficeImage;
    Panel4: TPanel;
    AdvOfficeImage4: TAdvOfficeImage;
    lkpEmpresa: TcxLookupComboBox;
    Label2: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    pgParametrosEmpresa: TJvStandardPage;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxStyle9: TcxStyle;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    btBairros: TPngSpeedButton;
    Label3: TLabel;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    procedure FormActivate(Sender: TObject);
    procedure lkpEmpresaPropertiesEditValueChanged(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure btBairrosClick(Sender: TObject);
  private
    procedure BuscaDadosIntegracao();
    procedure SalvarAlteracoesIntegracao;
    procedure SalvaConfiguracoesDeBairro;
    procedure SalvaConfiguracoesDeFormasDePagamento;
    procedure SalvarParametrosEmpresa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigIntegracoes: TfrmConfigIntegracoes;

implementation

{$R *.dfm}

uses
  uuCadBairros;

procedure TfrmConfigIntegracoes.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  SalvarAlteracoesIntegracao();
end;

procedure TfrmConfigIntegracoes.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConfigIntegracoes.btBairrosClick(Sender: TObject);
begin
  inherited;
  SalvarAlteracoesIntegracao();
  Application.CreateForm(TfrmCadBairros, frmCadBairros);
  frmCadBairros.ShowModal;
  frmCadBairros.Free;
  BuscaDadosIntegracao();
end;

procedure TfrmConfigIntegracoes.BuscaDadosIntegracao();
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
  plataformaEmpresa: integer;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try
    try

      LSQL.Clear;
      LSQL.Add('select ib.id, ib.nome,ib.cod_bairro_sistema from integracoes_bairro ib order by nome');
      dm.getMemTable(dmIntegracoes.tbIntegraBairros, LSQL.Text);

      LSQL.Clear;
      LSQL.Add('  select fp.id, fp.descricao,nome, coalesce(fp.codigo_pdv,' + Quotedstr('') + ') as codigo_pdv ');
      LSQL.Add('      from integracoes_formas_pagto fp ');
      LSQL.Add(' order by fp.descricao');
      dm.getMemTable(dmIntegracoes.tbIntegraFormasPagto, LSQL.Text);
      ////dm.adicionalog(LSQL.Text);

      LSQL.Clear;
      LSQL.Add('select id, parametro, valor from integracoes_parametros p where p.codigo_plataforma=' + IntToStr(dmIntegracoes.qryConsultaEmpresas.FieldByName('codigo_plataforma').Value));
      dm.getMemTable(dmIntegracoes.tbIntegracoesParametros, LSQL.Text);
      ////dm.adicionalog(LSQL.Text);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao obter configurações de integração!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        ////dm.adicionalog(LSQL.Text);

      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);

  end

end;

procedure TfrmConfigIntegracoes.SalvarAlteracoesIntegracao();
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);
  try

    try
      SalvaConfiguracoesDeBairro();
      SalvaConfiguracoesDeFormasDePagamento();
      SalvarParametrosEmpresa;
      Showmessage('Atualização concluída!');
    except
      on E: Exception do
      begin

//        dm.exibe_painel_erro('Erro ao salvar configurações de integração!'+sLineBreak+sLineBreak+E.Message ,'Ok');
        ////dm.adicionalog(e.Message);
        ///
        exit;

      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);

  end

end;

procedure TfrmConfigIntegracoes.SalvaConfiguracoesDeBairro();
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try

    try
      dmIntegracoes.tbIntegraBairros.First;
      while not dmIntegracoes.tbIntegraBairros.Eof do
      begin
        LSQL.Clear;

        if ((dmIntegracoes.tbIntegraBairros.FieldByName('cod_bairro_sistema').Value <> null)) then
        begin
          LSQL.Clear;
          LSQL.Add('update INTEGRACOES_BAIRRO b set b.cod_bairro_sistema=' + Inttostr(dmIntegracoes.tbIntegraBairros.FieldByName('cod_bairro_sistema').Value));
          LSQL.Add(' where id=' + Inttostr(dmIntegracoes.tbIntegraBairros.FieldByName('id').Value));
          dm.executaSQL(LSQL.Text);
        end;

        dmIntegracoes.tbIntegraBairros.Next;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao salvar configurações de bairros!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        ////dm.adicionalog(LSQL.Text);
        exit;
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);

  end

end;

procedure TfrmConfigIntegracoes.SalvaConfiguracoesDeFormasDePagamento();
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try

    try
      dmIntegracoes.tbIntegraFormasPagto.First;
      while not dmIntegracoes.tbIntegraFormasPagto.Eof do
      begin
        LSQL.Clear;

        if ((dmIntegracoes.tbIntegraFormasPagto.FieldByName('codigo_pdv').Value <> null)) then
        begin
          LSQL.Clear;
          LSQL.Add('update INTEGRACOES_FORMAS_PAGTO f set f.codigo_pdv=' + Quotedstr(dmIntegracoes.tbIntegraFormasPagto.FieldByName('codigo_pdv').Value));
          LSQL.Add(' where id=' + Inttostr(dmIntegracoes.tbIntegraFormasPagto.FieldByName('id').Value));
          dm.executaSQL(LSQL.Text);
        end;

        dmIntegracoes.tbIntegraFormasPagto.Next;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao salvar configurações de formas de pagamento!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        ////dm.adicionalog(LSQL.Text);
        exit;
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);

  end

end;

procedure TfrmConfigIntegracoes.SalvarParametrosEmpresa();
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try

    try
      dmIntegracoes.tbIntegracoesParametros.First;
      while not dmIntegracoes.tbIntegracoesParametros.Eof do
      begin
        LSQL.Clear;
        LSQL.Add('update INTEGRACOES_PARAMETROS p set p.valor=' + Quotedstr(dmIntegracoes.tbIntegracoesParametros.FieldByName('valor').Value));
        LSQL.Add(' where id=' + Inttostr(dmIntegracoes.tbIntegracoesParametros.FieldByName('id').Value));
        dm.executaSQL(LSQL.Text);
        dmIntegracoes.tbIntegracoesParametros.Next;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao salvar configurações de parâmetrps!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        ////dm.adicionalog(LSQL.Text);
        exit;
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);

  end

end;

procedure TfrmConfigIntegracoes.Button1Click(Sender: TObject);
begin
  inherited;
  SalvarAlteracoesIntegracao;
end;

procedure TfrmConfigIntegracoes.FormActivate(Sender: TObject);
begin
  inherited;

  lkpEmpresa.EditValue := dmIntegracoes.qryConsultaEmpresas.FieldByName('id').Value;
end;

procedure TfrmConfigIntegracoes.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdmIntegracoes, dmIntegracoes);
end;

procedure TfrmConfigIntegracoes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmIntegracoes);
end;

procedure TfrmConfigIntegracoes.lkpEmpresaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  BuscaDadosIntegracao();
end;

end.

