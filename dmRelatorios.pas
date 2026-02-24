unit dmRelatorios;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, DB, ibx.ibcustomdataset, ibx.ibquery,
  frxExportMail, frxExportImage, frxExportText, frxExportCSV, frxExportPDF,
  frxExportHTML, frxExportXLS, frxExportXML, frxExportRTF;

type
  TDataModule1 = class(TDataModule)
    ExportaWord: TfrxRTFExport;
    exportaXML: TfrxXMLExport;
    exportaXLS: TfrxXLSExport;
    exportaHtml: TfrxHTMLExport;
    ExportaPDF: TfrxPDFExport;
    rpt: TfrxReport;
    exportaCSV: TfrxCSVExport;
    exportaTxt: TfrxSimpleTextExport;
    exPortaGif: TfrxGIFExport;
    exportaJPG: TfrxJPEGExport;
    exportaBMP: TfrxBMPExport;
    exportaEmail: TfrxMailExport;
    qryParametros: TIBQuery;
    dtParametros: TfrxDBDataset;
    qryProdutos: TIBQuery;
    dtProdutos: TfrxDBDataset;
    frxReport1: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses uu_data_module;

{$R *.dfm}

end.
