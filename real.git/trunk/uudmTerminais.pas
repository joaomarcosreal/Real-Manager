unit uudmTerminais;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmTerminais = class(TDataModule)
    qryTerminal0: TIBQuery;
    qryTerminal1: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTerminais: TdmTerminais;

implementation

uses uu_data_module;

{$R *.dfm}

end.
