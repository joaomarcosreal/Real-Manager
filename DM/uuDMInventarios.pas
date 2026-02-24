unit uuDMInventarios;

interface

uses
  System.SysUtils, System.Classes, uu_data_module, FireDAC.Stan.Param,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmInventarios = class(TDataModule)
    qryHistoricosInventarios: TFDQuery;
    dsQryHistoricosInventario: TDataSource;
    tbItensInventarioTemp: TFDMemTable;
    tbItensInventarioTempCOD_PRODUTO: TStringField;
    qryCsProdutos: TFDQuery;
    tbItensInventarioTempDESCRICAO: TStringField;
    tbItensInventarioTempQTDE_APURADA: TBCDField;
    tbItensInventarioTempAJUSTE: TBCDField;
    tbItensInventarioTempCOD_UNIDADE: TStringField;
    dsItensIventario: TDataSource;
    tbItensInventarioTempDESC_UNIDADE: TStringField;
    tbItensInventarioTempTOTAL_AJUSTE: TCurrencyField;
    tbItensInventarioTempCUSTO: TCurrencyField;
    dsQryCsProdutos: TDataSource;
    tbItensInventarioTempQTDE_SISTEMA: TBCDField;
    tbItensInventarioTempTOTAL_ESTOQUE: TCurrencyField;
    qryInventarios: TFDQuery;
    qryInventariosCODIGO: TLargeintField;
    qryInventariosDATA_INVENTARIO: TDateField;
    qryInventariosDATA_SISTEMA: TDateField;
    qryInventariosCOD_HISTORICO: TIntegerField;
    qryInventariosCOD_USUARIO: TStringField;
    qryInventariosNOME_USUARIO: TStringField;
    qryInventariosTOTAL_PERDAS: TBCDField;
    qryInventariosTOTAL_INVENTARIO: TBCDField;
    qryInventariosCOD_EMPRESA: TIntegerField;
    qryInventariosOBS: TStringField;
    qryItensInventario: TFDQuery;
    qryItensInventarioCODIGO: TLargeintField;
    qryItensInventarioCOD_INVENTARIO: TLargeintField;
    qryItensInventarioCOD_PRODUTO: TStringField;
    qryItensInventarioESTOQUE_SISTEMA: TFMTBCDField;
    qryItensInventarioESTOQUE_APURADO: TFMTBCDField;
    qryItensInventarioCOD_UNIDADE: TStringField;
    qryItensInventarioCUSTO: TBCDField;
    qryItensInventarioAJUSTE: TBCDField;
    qryItensInventarioTOTAL_INVENTARIO: TBCDField;
    qryInventariosDATA_HORA_SO: TSQLTimeStampField;
    qryInventariosTOTAL_SOBRAS: TBCDField;
    qryCsProdutosPorGrupo: TFDQuery;
    qryHistoricosBaixaEstoque: TFDQuery;
    qryHistoricosBaixaEstoqueCOD_TIPO: TStringField;
    qryHistoricosBaixaEstoqueDESCRICAO: TStringField;
    dsQryHistoricosBaixaEstoque: TDataSource;
    qryUnidadesMedidaProduto: TFDQuery;
    dsQryUnidadeMedidaProduto: TDataSource;
    qryUnidadesMedidaProdutoCOD_UNIDADE: TStringField;
    qryUnidadesMedidaProdutoDESCRICAO: TStringField;
    qryUnidadesMedidaProdutoSIGLA: TStringField;
    qryUnidadesMedidaProdutoPARAMETRO: TBCDField;
    qryUnidadesMedidaProdutoCOD_PADRAO: TStringField;
    dsTbItensBaixaTemp: TDataSource;
    tbItensBaixaTemp: TFDMemTable;
    tbItensBaixaTempCOD_PRODUTO: TStringField;
    tbItensBaixaTempDESCRICAO: TStringField;
    tbItensBaixaTempQTDE_APURADA: TBCDField;
    tbItensBaixaTempTOTAL_ESTOQUE: TCurrencyField;
    tbItensBaixaTempCOD_UNIDADE_BAIXA: TStringField;
    tbItensBaixaTempDESC_UNIDADE_BAIXA: TStringField;
    tbItensBaixaTempCUSTO: TFloatField;
    qryItensBaixaEstoque: TFDQuery;
    qryCsProdutosCOD_PRODUTO: TStringField;
    qryCsProdutosDESCRICAO: TStringField;
    qryCsProdutosESTOQUE_ATUAL: TFMTBCDField;
    qryCsProdutosVALOR_CUSTO: TBCDField;
    qryCsProdutosVALOR_ESTOQUE: TFMTBCDField;
    qryCsProdutosCOD_UNIDADE: TStringField;
    qryCsProdutosDESCRICAO_UNIDADE: TStringField;
    qryCsProdutosGRUPO: TStringField;
    qryCsProdutosPorGrupoCOD_PRODUTO: TStringField;
    qryCsProdutosPorGrupoDESCRICAO: TStringField;
    qryCsProdutosPorGrupoESTOQUE_ATUAL: TFMTBCDField;
    qryCsProdutosPorGrupoVALOR_CUSTO: TBCDField;
    qryCsProdutosPorGrupoVALOR_ESTOQUE: TFMTBCDField;
    qryCsProdutosPorGrupoCOD_UNIDADE: TStringField;
    qryCsProdutosPorGrupoDESCRICAO_UNIDADE: TStringField;
    qryCsProdutosPorGrupoGRUPO: TStringField;
    tbItensInventarioTempsel: TBooleanField;
    qryItensBaixaEstoqueCOD_BAIXA: TStringField;
    qryItensBaixaEstoqueCOD_TIPO: TStringField;
    qryItensBaixaEstoqueCOD_ITEM: TStringField;
    qryItensBaixaEstoqueCOD_UNIDADE: TStringField;
    qryItensBaixaEstoqueQUANTIDADE: TFMTBCDField;
    qryItensBaixaEstoqueDATA: TDateField;
    qryItensBaixaEstoqueHORA: TTimeField;
    qryItensBaixaEstoqueOBSERVACOES: TStringField;
    qryItensBaixaEstoqueUSUARIO: TStringField;
    qryItensBaixaEstoqueESTOQUE_ANTERIOR: TBCDField;
    qryItensBaixaEstoqueESTOQUE_ATUALIZADO: TBCDField;
    qryItensBaixaEstoqueCUSTO_UNITARIO_ITEM: TBCDField;
    qryItensBaixaEstoqueID: TLargeintField;
    qryItensBaixaEstoqueDATA_SO: TSQLTimeStampField;
    qryItensBaixaEstoqueCOD_ORIGEM: TSmallintField;
    qryItensBaixaEstoqueTIPO_MOVIMENTACAO: TSmallintField;
    qryItensBaixaEstoqueID_PRODUCAO: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbItensInventarioTempBeforePost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private







    { Private declarations }
  public
    { Public declarations }
    procedure calculaTotaisInventario(lbTotalSobras, lbTotalFaltas, lbTotalInventarios: TLabel);
    function getParametroUnidade(ACodUnidade: string): integer;
    procedure AtualizaEstoqueProduto(ACodProduto: string; AQuantidadeBaixa: Double);
    function getEstoqueAtualProduto(AcodProduto: string): integer;
    procedure apagaItensSelecionados;
  end;

var
  dmInventarios: TdmInventarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TdmInventarios.DataModuleCreate(Sender: TObject);
begin
  qryCsProdutos.Active := true;
  qryHistoricosInventarios.Active := true;
  qryHistoricosInventarios.First;
  qryCsProdutos.First;

end;

procedure TdmInventarios.DataModuleDestroy(Sender: TObject);
begin
  qryCsProdutos.Active := false;
  qryHistoricosInventarios.Active := false;
end;

procedure TdmInventarios.calculaTotaisInventario(lbTotalSobras: Tlabel; lbTotalFaltas: Tlabel; lbTotalInventarios: TLabel);
var
  totalInventario, totalSobras, totalFaltas: double;
  bookmark: TBookmark;
begin
  totalSobras := 0;
  totalFaltas := 0;
  totalInventario := 0;

  bookmark := dmInventarios.tbItensInventarioTemp.GetBookmark;

  dmInventarios.tbItensInventarioTemp.DisableControls;
  dmInventarios.tbItensInventarioTemp.first;

  while not dmInventarios.tbItensInventarioTemp.Eof do
  begin
    if dmInventarios.tbItensInventarioTempTOTAL_AJUSTE.Value > 0 then
      totalSobras := totalSobras + dmInventarios.tbItensInventarioTempTOTAL_AJUSTE.Value
    else
      totalFaltas := totalFaltas + dmInventarios.tbItensInventarioTempTOTAL_AJUSTE.Value;

    totalInventario := totalInventario + dmInventarios.tbItensInventarioTempTOTAL_ESTOQUE.Value;
    dmInventarios.tbItensInventarioTemp.Next;
  end;

  lbTotalSobras.Caption := FormatFloat('R$ ###,###,##0.00 ', totalSobras);
  lbTotalFaltas.Caption := FormatFloat('R$ ###,###,##0.00 ', totalFaltas);
  lbTotalInventarios.Caption := FormatFloat('R$ ###,###,##0.00 ', totalInventario);

  dmInventarios.tbItensInventarioTemp.GotoBookmark(bookmark);

  dmInventarios.tbItensInventarioTemp.EnableControls;

end;

procedure TdmInventarios.tbItensInventarioTempBeforePost(DataSet: TDataSet);
begin
  dmInventarios.tbItensInventarioTempAJUSTE.Value := dmInventarios.tbItensInventarioTempQTDE_APURADA.Value - dmInventarios.tbItensInventarioTempQTDE_SISTEMA.Value;
  dmInventarios.tbItensInventarioTempTOTAL_AJUSTE.Value := dmInventarios.tbItensInventarioTempAJUSTE.Value * dmInventarios.tbItensInventarioTempCUSTO.Value;
  dmInventarios.tbItensInventarioTempTOTAL_ESTOQUE.Value := dmInventarios.tbItensInventarioTempQTDE_APURADA.Value * dmInventarios.tbItensInventarioTempCUSTO.Value;
end;

function TdmInventarios.getEstoqueAtualProduto(AcodProduto: string): integer;
var
  Q: TFDQuery;
begin

  Q := TFDQuery.Create(Self);
  Q.Connection := dm.fdRestaurante;

  try
    Q.SQL.Clear;

    Q.SQL.Add(' select estoque_liquido from produtos p where p.cod_produto=:vpProduto   ');
    Q.ParamByName('vpProduto').Value := AcodProduto;
    Q.Active := true;
    Result := Q.FieldByName('estoque_liquido').Value;

  finally
    Q.Active := false;
    FreeAndNil(Q);
  end;
end;

function TdmInventarios.getParametroUnidade(ACodUnidade: string): integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(Self);
  Q.Connection := dm.fdRestaurante;
  try
    Q.SQL.Clear;

    Q.SQL.Add(' select parametro from unidades where cod_unidade=:vpUnidade');

    Q.ParamByName('vpUnidade').Value := ACodUnidade;
    Q.Active := true;
    Result := Q.FieldByName('parametro').Value;
  finally
    Q.Active := false;
    FreeAndNil(Q);
  end;
end;

procedure TdmInventarios.AtualizaEstoqueProduto(ACodProduto: string; AQuantidadeBaixa: Double);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(Self);
  Q.Connection := dm.fdRestaurante;
  try
    Q.SQL.Clear;

    Q.SQL.Add(' update produtos set estoque_liquido = estoque_liquido - ' + dm.TrocaVirgPPto(FloatToStr(AQuantidadeBaixa)) + ' where cod_produto= ' + Quotedstr(ACodProduto));
    Q.ExecSQL;
  finally
    Q.Active := false;
    FreeAndNil(Q);
  end;
end;

procedure TdmInventarios.apagaItensSelecionados();
begin
  tbItensInventarioTemp.DisableControls;
  tbItensInventarioTemp.First;

  while not tbItensInventarioTemp.Eof do
  begin
    if tbItensInventarioTempsel.Value = true then
     begin
      tbItensInventarioTemp.Delete;
      tbItensInventarioTemp.First;
     end;
    tbItensInventarioTemp.Next;
  end;
  tbItensInventarioTemp.EnableControls;

end;

end.

