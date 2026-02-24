unit uuDMRelMovimentacoesEstoque;

interface

uses
  System.SysUtils, System.Classes,

  Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
    TdmRelMovimentacoesEstoque = class(TDataModule)

    qryHistoricosMovEstoque: TFDQuery;
    qryHistoricosMovEstoqueCOD_TIPO: TStringField;
    qryHistoricosMovEstoqueDESCRICAO: TStringField;
    dsqryHistoricosMovEstoque: TDataSource;
    qryHistoricosMovEstoqueTIPO_MOVIMENTACAO: TStringField;
    qryOrigensMovEstoque: TFDQuery;
    dsQryOrigensMovEstoque: TDataSource;
    qryOrigensMovEstoqueCODIGO: TIntegerField;
    qryOrigensMovEstoqueDESCRICAO: TStringField;
    qryOrigensMovEstoqueTIPO_MOVIMENTACAO: TStringField;
    qryRelMovimentacoes: TFDQuery;
    dsQryMovimentacoes: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmRelMovimentacoesEstoque: TdmRelMovimentacoesEstoque;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmRelMovimentacoesEstoque.DataModuleDestroy(Sender: TObject);
begin
  qryHistoricosMovEstoque.Active := false;
  FreeAndNil(qryHistoricosMovEstoque);

  qryOrigensMovEstoque.Active := false;
  FreeAndNil(qryOrigensMovEstoque);

  qryRelMovimentacoes.Active := false;
  FreeAndNil(qryRelMovimentacoes);


end;

end.
