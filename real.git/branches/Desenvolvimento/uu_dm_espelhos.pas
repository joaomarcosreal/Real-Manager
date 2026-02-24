unit uu_dm_espelhos;

interface

uses
  SysUtils, Classes, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, IBCustomDataSet, IBQuery, ppModule, raCodMod, ppBands,
  ppSubRpt, ppStrtch, ppRegion, ppCtrls, ppVar, ppPrnabl, ppCache;

type
  Tdm_espelhos_cadastro = class(TDataModule)
    qryEspelhoEntradas: TIBQuery;
    qryEspelhoItEntradas: TIBQuery;
    dsEspelhoEntradas: TDataSource;
    dsEspelhoItEntras: TDataSource;
    rptEspelhoEntradas: TppReport;
    ppEspelhoEntradas: TppDBPipeline;
    qryEspelhoEntradasCOD_ENTRADA: TIBStringField;
    qryEspelhoEntradasCOD_FORNECEDOR: TIBStringField;
    qryEspelhoEntradasCOD_TIPO_ENTRADA: TIBStringField;
    qryEspelhoEntradasCOD_TIPO_DOC: TIBStringField;
    qryEspelhoEntradasNUMERO_DOC: TIBStringField;
    qryEspelhoEntradasSERIE: TIBStringField;
    qryEspelhoEntradasVALOR_TOTAL_DOC: TIBBCDField;
    qryEspelhoEntradasDT_EMISSAO: TDateField;
    qryEspelhoEntradasDT_ENTRADA: TDateField;
    qryEspelhoEntradasCOD_USUARIO: TIBStringField;
    qryEspelhoEntradasQTDE_ITENS: TSmallintField;
    qryEspelhoEntradasDATA: TDateField;
    qryEspelhoEntradasHORA: TTimeField;
    qryEspelhoEntradasRAZAO_SOCIAL: TIBStringField;
    qryEspelhoEntradasNOME_FANTASIA: TIBStringField;
    qryEspelhoEntradasDESC_TP_DOC: TIBStringField;
    qryEspelhoEntradasDESCRICAO_TP_ENTRADA: TIBStringField;
    qryEspelhoEntradasLOGIN: TIBStringField;
    ppEspelhoItEntradas: TppDBPipeline;
    qryEspelhoItEntradasCOD_ENTRADA: TIBStringField;
    qryEspelhoItEntradasCOD_ITEM: TIBStringField;
    qryEspelhoItEntradasQUANTIDADE: TIBBCDField;
    qryEspelhoItEntradasCOD_UNIDADE: TIBStringField;
    qryEspelhoItEntradasVALOR_UNITARIO: TIBBCDField;
    qryEspelhoItEntradasBARRAS: TIBStringField;
    qryEspelhoItEntradasDESCRICAO_ITEM: TIBStringField;
    qryEspelhoItEntradasDESC_UNIDADE: TIBStringField;
    qryEspelhoItEntradasTotal: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel59: TppLabel;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppSystemVariable22: TppSystemVariable;
    ppSystemVariable23: TppSystemVariable;
    ppLabel60: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel62: TppLabel;
    ppDBText107: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppRegion1: TppRegion;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape11: TppShape;
    ppShape17: TppShape;
    ppLabel61: TppLabel;
    ppShape15: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppDBCalc1: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    raCodeModule2: TraCodeModule;
    procedure qryEspelhoItEntradasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_espelhos_cadastro: Tdm_espelhos_cadastro;

implementation

uses uu_data_module, UU_DM_RELATORIOS;

{$R *.dfm}

procedure Tdm_espelhos_cadastro.qryEspelhoItEntradasCalcFields(
  DataSet: TDataSet);
begin
 qryEspelhoItEntradasTotal.Value := qryEspelhoItEntradasQUANTIDADE.value * qryEspelhoItEntradasVALOR_UNITARIO.Value;
end;

end.
