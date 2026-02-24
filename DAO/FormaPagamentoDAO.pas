unit FormaPagamentoDAO;

interface

uses
  FormaPagamento, system.SysUtils, System.Classes,

  inifiles,

  Data.DB,
  FireDAC.Comp.Client;

type
  TFormaPagamentoDAO = class
  private
  published
    procedure getDados(AFormaPagamento: TFormaPagamento);
  end;

implementation

uses
  uu_data_module;

{ TFormaPagamentoDAO }

procedure TFormaPagamentoDAO.getDados(AFormaPagamento: TFormaPagamento);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(nil);
  LSQL := TstringList.create;

  try
    try

      LSQL.Clear;
      LSQL.Add('select fp.cod_forma, fp.descricao, fp.rp, fp.tipo, fp.permite_troco, fp.rp, ');
      LSQL.Add('coalesce(fp.imagem,' + Quotedstr('') + ')' + ' as imagem, coalesce(fp.tef,0) as tef, coalesce(fp.desativada,0) as desativada,');
      LSQL.Add('         coalesce(fp.conta_credito,' + QuotedStr('') + ')' + ' as conta_credito');
      LSQL.Add('    from formas_pagamento fp');
      LSQL.Add(' where fp.cod_forma=' + QuotedStr(AFormaPagamento.CodForma));

      dm.getMemTable(LTbAux, LSQL.Text);
      if (LTbAux.IsEmpty = false) then
      begin
        AFormaPagamento.Descricao := LTbAux.FieldByName('descricao').Value;
        if LTbAux.FieldByName('tipo').Value > 1 then
          AFormaPagamento.Faturado := True
        else
          AFormaPagamento.Faturado := false;
        AFormaPagamento.PermiteTroco := dm.IntToBol(LTbAux.FieldByName('permite_troco').Value);
        AFormaPagamento.TipoPagtoNFE := LTbAux.FieldByName('rp').Value;
        AFormaPagamento.CaminhoImagem := LTbAux.FieldByName('imagem').Value;
        AFormaPagamento.Desativada := dm.IntToBol(LTbAux.FieldByName('desativada').Value);
        AFormaPagamento.ContaCredito := LTbAux.FieldByName('conta_credito').Value;

        if LTbAux.FieldByName('tef').Value > 0 then
          AFormaPagamento.isTEF := True
        else
          AFormaPagamento.isTEF := false;

        AFormaPagamento.TipoOperacaoTEF := LTbAux.FieldByName('tef').Value;
        LSQL.Clear;

        LSQL.Add(' select coalesce(count(*),0) as qtdAdquirentes');
        LSQL.Add('from formas_pagamento_configuracoes fc ');
        LSQL.Add('    where fc.cod_forma=' + Quotedstr(AFormaPagamento.CodForma));
        dm.getMemTable(LTbAux, LSQL.Text);
        AFormaPagamento.QtdeAdquirentes := LTbAux.FieldByName('qtdAdquirentes').Value;

      end
      else
      begin
        raise Exception.Create('Forma de pagamento inexistente!');
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao realizar operação! ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

end.

