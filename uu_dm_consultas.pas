unit uu_dm_consultas;

interface

uses
  SysUtils, Classes, DB, ibx.ibcustomdataset, ibx.ibquery, IBX.IBDatabase;

type
  Tdm_consultas = class(TDataModule)
    qryTiposClientes: TIBQuery;
    dsTiposClientes: TDataSource;
    qryUnidades: TIBQuery;
    qryUnidadesCOD_UNIDADE: TIBStringField;
    qryUnidadesDESCRICAO: TIBStringField;
    qryUnidadesSIGLA: TIBStringField;
    qryUnidadesPARAMETRO: TIBBCDField;
    qryUnidadesCOD_PADRAO: TIBStringField;
    dsUnidades: TDataSource;
    qryInsumos: TIBQuery;
    dsInsumos: TDataSource;
    tsConsultas: TIBTransaction;
    qryInsumosCOD_PRODUTO: TIBStringField;
    qryInsumosDESCRICAO: TIBStringField;
    qryInsumosGRUPO: TIBStringField;
    qryUnidadeCompra: TIBQuery;
    dsUnidadeCompra: TDataSource;
    qryUnidadeFracao: TIBQuery;
    dsUnidadeFracao: TDataSource;
    qryUnidadeCompraCOD_UNIDADE: TIBStringField;
    qryUnidadeCompraDESCRICAO: TIBStringField;
    qryUnidadeCompraSIGLA: TIBStringField;
    qryUnidadeCompraPARAMETRO: TIBBCDField;
    qryUnidadeCompraCOD_PADRAO: TIBStringField;
    qryUnidadeFracaoCOD_UNIDADE: TIBStringField;
    qryUnidadeFracaoDESCRICAO: TIBStringField;
    qryUnidadeFracaoSIGLA: TIBStringField;
    qryUnidadeFracaoPARAMETRO: TIBBCDField;
    qryUnidadeFracaoCOD_PADRAO: TIBStringField;
    qryGruposTree: TIBQuery;
    dsGruposTree: TDataSource;
    qryGruposTreeDESCRICAO: TIBStringField;
    qryGruposTreeCOD_GRUPO: TIBStringField;
    qryGruposTreeCOD_GRUPO_PAI: TIBStringField;
    qryPaises: TIBQuery;
    dsQryPaises: TDataSource;
    qryPaisesCODPAIS: TIBStringField;
    qryPaisesNOMPAIS: TIBStringField;
    qryEstados: TIBQuery;
    dsQryEstados: TDataSource;
    qryEstadosCODIGO: TIBStringField;
    qryEstadosNOME: TIBStringField;
    qryEstadosSIGLA: TIBStringField;
    qryCidade: TIBQuery;
    dsQryCidade: TDataSource;
    qryCidadeCOD_CIDADE: TIBStringField;
    qryCidadeCODIGO_ESTADO: TIBStringField;
    qryCidadeNOME: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_consultas: Tdm_consultas;

implementation



{$R *.dfm}

end.
