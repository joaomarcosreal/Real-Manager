unit uuDmConsultaProdutosEstoque;

interface

uses
  System.SysUtils, System.Classes,

  Data.DB,
  FireDAC.Comp.Client;

type
  TdmConsultaProdutos = class(TDataModule)
    dsTbProdutosEstoque: TDataSource;
    dsTbProdutosGeral: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tbProdutosEstoque : TFDMemTable;
    tbProdutosGeral   : TFDMemTable;
  end;

var
  dmConsultaProdutos: TdmConsultaProdutos;

implementation



{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConsultaProdutos.DataModuleCreate(Sender: TObject);
begin
  tbProdutosEstoque := TFDMemTable.Create(Self);
  tbProdutosGeral := TFDMemTable.create(self);

  dsTbProdutosEstoque.DataSet :=  tbProdutosEstoque;
  dsTbProdutosGeral.DataSet   :=  tbProdutosGeral;

end;

procedure TdmConsultaProdutos.DataModuleDestroy(Sender: TObject);
begin
  tbProdutosEstoque.Active := false;
  FreeAndNil(tbProdutosEstoque);
end;

end.
