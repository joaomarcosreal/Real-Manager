unit uuDMBaixaContasAssinadas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet;

type
  TdmBaixaContasAssinadas = class(TDataModule)
    qryFaturas: TFDQuery;
    dsQryFaturas: TDataSource;
    qryCsFormasPagamento: TFDQuery;
    dsQryCsFormasPagamento: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure getTabelaFormasPagamento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBaixaContasAssinadas: TdmBaixaContasAssinadas;

implementation

uses
  uu_data_module;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmBaixaContasAssinadas.DataModuleCreate(Sender: TObject);
begin
  getTabelaFormasPagamento;
end;

procedure TdmBaixaContasAssinadas.DataModuleDestroy(Sender: TObject);
begin
  dm.CloseAllDataSets(Self);
end;

procedure TdmBaixaContasAssinadas.getTabelaFormasPagamento();
begin
  qryCsFormasPagamento.Active := false;
  qryCsFormasPagamento.SQL.clear;
  qryCsFormasPagamento.SQL.add(' select fp.cod_forma, fp.descricao, fp.tef, fp.permite_troco ');
  qryCsFormasPagamento.SQL.add('  from formas_pagamento fp ');
  qryCsFormasPagamento.SQL.add('  where fp.desativada =0');
  qryCsFormasPagamento.SQL.add('  and fp.tipo <> 2');
  qryCsFormasPagamento.SQL.add(' order by fp.descricao');
  qryCsFormasPagamento.Active := true;

end;

end.

