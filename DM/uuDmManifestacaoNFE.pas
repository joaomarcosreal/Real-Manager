unit uuDmManifestacaoNFE;

interface

uses
  System.SysUtils, System.Classes,

  Data.DB,
  FireDAC.Comp.Client, frxExportXLS, frxExportXML,
  frxExportBIFF, frxExportDOCX, frxClass, frxExportPDF, frxDBSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Comp.DataSet, frxExportBaseDialog, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmManifestacaoNFE = class(TDataModule)
    dsManifestacaoNFE: TDataSource;
    tbManifestacaoNFE: TFDMemTable;
    TBExportacao: TFDMemTable;
    dtManifestacaoNFE: TfrxDBDataset;
    rpt: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxBIFFExport1: TfrxBIFFExport;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    tbItensEntradaNFE: TFDMemTable;
    tbItensEntradaNFEordem: TIntegerField;
    tbItensEntradaNFEcodProduto: TStringField;
    tbItensEntradaNFEdescricaoProduto: TStringField;
    tbItensEntradaNFEQuantidade: TFMTBCDField;
    tbItensEntradaNFEPreco: TCurrencyField;
    tbItensEntradaNFECodUnidade: TStringField;
    tbItensEntradaNFEDescricaoUnidade: TStringField;
    tbItensEntradaNFESiglaUnidade: TStringField;
    tbItensEntradaNFEParametroUnidade: TBCDField;
    tbItensEntradaNFECST: TStringField;
    tbItensEntradaNFECFOP: TStringField;
    tbItensEntradaNFEDesconto: TCurrencyField;
    tbItensEntradaNFEOutrasDespesas: TCurrencyField;
    tbItensEntradaNFEBaseICMS: TCurrencyField;
    tbItensEntradaNFEValorICMS: TCurrencyField;
    tbItensEntradaNFEAliquotaICMS: TFMTBCDField;
    tbItensEntradaNFEBaseICMSST: TCurrencyField;
    tbItensEntradaNFEValorICMSST: TCurrencyField;
    tbItensEntradaNFEAliquotaICMSST: TFMTBCDField;
    tbItensEntradaNFEValorIPI: TCurrencyField;
    tbItensEntradaNFEAliquotaIPI: TFMTBCDField;
    dsItensEntradaNFE: TDataSource;
    tbItensEntradaNFETotal: TCurrencyField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure rptGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure setPeriodoRelatorio(periodo : string);
     function  getPeriodoRelatorio() : string;
  end;

var
  dmManifestacaoNFE: TdmManifestacaoNFE;
  periodoRelatorio : string;

implementation

uses
  uu_data_module;

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TdmManifestacaoNFE.DataModuleDestroy(Sender: TObject);
begin
 tbManifestacaoNFE.Active := false;
 TBExportacao.Active := false;
 dm.CloseAllDataSets(Self);


end;

procedure TdmManifestacaoNFE.setPeriodoRelatorio(periodo : string);
begin
  periodoRelatorio := periodo;
end;


function TdmManifestacaoNFE.getPeriodoRelatorio() : string;
begin
 result :=  periodoRelatorio;
end;

procedure TdmManifestacaoNFE.rptGetValue(const VarName: string;
  var Value: Variant);
begin
   if  VarName  = 'PeriodoRelatorio' then
    begin
      Value :=  getPeriodoRelatorio();
    end;

end;

end.
