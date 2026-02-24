unit uuDmAtualizaBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmAtualizaBase = class(TDataModule)
    qryGrupos: TFDQuery;
    updQryGrupos: TFDUpdateSQL;
    tsAtualizacao: TFDTransaction;
    qryProdutos: TFDQuery;
    updQryProdutos: TFDUpdateSQL;
    qryGruposAdicionais: TFDQuery;
    updGruposAdicionais: TFDUpdateSQL;
    qryProdutosGruposAdicionais: TFDQuery;
    updProdutosGruposAdicionais: TFDUpdateSQL;
    qryGruposTouch: TFDQuery;
    updGruposTouch: TFDUpdateSQL;
    qryUsuarios: TFDQuery;
    updUsuarios: TFDUpdateSQL;
    qryPermissoes: TFDQuery;
    updPermissoes: TFDUpdateSQL;
    qryModulos: TFDQuery;
    updModulos: TFDUpdateSQL;
  private

    { Private declarations }
  public
    { Public declarations }
    procedure CommitChanges;
  end;

var
  dmAtualizaBase: TdmAtualizaBase;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmAtualizaBase.CommitChanges();
var
  Lerros: integer;
begin
  Lerros := 0;
  try
    try
      Lerros := dmAtualizaBase.qryGrupos.applyupdates;
      Lerros := dmAtualizaBase.qryProdutos.applyupdates;
      Lerros := dmAtualizaBase.qryGruposAdicionais.applyupdates;
      Lerros := dmAtualizaBase.qryProdutosGruposAdicionais.applyupdates;
      Lerros := dmAtualizaBase.qryModulos.applyupdates;
     Lerros := dmAtualizaBase.qryUsuarios.applyupdates;
      Lerros := dmAtualizaBase.qryPermissoes.ApplyUpdates;
      Lerros  := dmAtualizaBase.qryGruposTouch.ApplyUpdates;

      if Lerros > 0 then
        raise Exception.Create('Eror ao commitar alterações!');

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao commitar alterações!' + sLineBreak + E.Message);
      end;

    end;
  finally

  end;

end;

end.

