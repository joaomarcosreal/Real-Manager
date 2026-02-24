unit uuDmCadUnidadesMedida;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmCadUnidadesMedida = class(TDataModule)
    qryUnidadesMedida: TFDQuery;
    dsUnidadesMedida: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadUnidadesMedida: TdmCadUnidadesMedida;

implementation

uses
  uu_data_module;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadUnidadesMedida.DataModuleDestroy(Sender: TObject);
begin
  qryUnidadesMedida.Active := false;
end;

end.
