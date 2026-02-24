unit uuDmControleInventarios;

interface

uses
  System.SysUtils, System.Classes,

  Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmControleInventarios = class(TDataModule)
    qryHistoricosInventarios: TFDQuery;
    qryHistoricosInventariosCODIGO: TStringField;
    qryHistoricosInventariosDESCRICAO: TStringField;
    dsQryHistoricosInventario: TDataSource;
    QryConsultaInventario: TFDQuery;
    dsConsultaInventarios: TDataSource;
    QryConsultaInventarioCODIGO: TLargeintField;
    QryConsultaInventarioDATA_INVENTARIO: TDateField;
    QryConsultaInventarioHORA: TTimeField;
    QryConsultaInventarioCOD_HISTORICO: TIntegerField;
    QryConsultaInventarioDESCRICAO_HISTORICO: TStringField;
    QryConsultaInventarioNOME_USUARIO: TStringField;
    QryConsultaInventarioTOTAL_SOBRAS: TBCDField;
    QryConsultaInventarioTOTAL_PERDAS: TBCDField;
    QryConsultaInventarioTOTAL_INVENTARIO: TBCDField;
    QryConsultaInventarioOBS: TStringField;
    qryHistoricosBaixaEstoque: TFDQuery;
    dsQryHistoricosBaixaEstoque: TDataSource;
    qryHistoricosBaixaEstoqueCOD_TIPO: TStringField;
    qryHistoricosBaixaEstoqueDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControleInventarios: TdmControleInventarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
