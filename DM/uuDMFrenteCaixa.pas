unit uuDMFrenteCaixa;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase;

type
  TdmFrenteCaixa = class(TDataModule)
    qryGruposTouch: TIBQuery;
    tsGruposTouch: TIBTransaction;
    qryProdutosTouch: TIBQuery;
    dsGruposTouch: TDataSource;
    dsProdutosTouch: TDataSource;
    qryProdutosTouchCOD_PRODUTO: TIBStringField;
    qryProdutosTouchCOD_BARRAS: TIBStringField;
    qryProdutosTouchCOD_GRUPO_TOUCH: TIBStringField;
    qryProdutosTouchDESCRICAO: TIBStringField;
    qryProdutosTouchVALOR_UNITARIO: TIBBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFrenteCaixa: TdmFrenteCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
