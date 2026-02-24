unit uuDMDRE;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  IBX.IBCustomDataSet, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmDRE = class(TDataModule)
    dtDREComparativo: TfrxDBDataset;
    qryDREComparativo: TFDQuery;
    qryResumoDREComparativo: TFDQuery;
    dtResumoDREComparativo: TfrxDBDataset;
    dtDRE: TfrxDBDataset;
    qryDRE: TFDQuery;
    dtResumoDRE: TfrxDBDataset;
    qryResumoDRE: TFDQuery;
    dsQryDRE: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure closeAllQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDRE: TdmDRE;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDRE.DataModuleDestroy(Sender: TObject);
begin
  closeAllQueries;
end;

procedure TdmDRE.closeAllQueries();
var
  I: Integer;
begin

  for I := 0 to Self.ComponentCount -1 do
   begin
     if (Components[i] is TFDQuery )  then
       (Components[i] as TFDQuery).Active := false;
   end;

end;

end.
