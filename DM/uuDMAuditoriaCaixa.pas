unit uuDmAuditoriaCaixa;

interface

uses
  System.SysUtils, System.Classes, RealFramework, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmAuditoriaCaixas = class(TDataModule)
    dsQryListagemCaixas: TDataSource;
    QryListagemCaixas: TFDQuery;
    dsAuditoriaCaixa: TDataSource;
    tbAuditoriaDeCaixa: TFDMemTable;
    tbAuditoriaDeCaixaID: TLargeintField;
    tbAuditoriaDeCaixaID_AUDITORIA: TLargeintField;
    tbAuditoriaDeCaixaCOD_EMPRESA: TStringField;
    tbAuditoriaDeCaixaCOD_CAIXA: TStringField;
    tbAuditoriaDeCaixaCOD_FORMA: TStringField;
    tbAuditoriaDeCaixaDESCRICAO: TStringField;
    tbAuditoriaDeCaixaTOTAL_SUPRIMENTOS: TFMTBCDField;
    tbAuditoriaDeCaixaTOTAL_SANGRIAS: TFMTBCDField;
    tbAuditoriaDeCaixaTOTAL_RECEBIMENTOS_VENDAS: TFMTBCDField;
    tbAuditoriaDeCaixaTOTAL_RECEBIMENTOS_PENDURAS: TFMTBCDField;
    tbAuditoriaDeCaixaSALDO_SISTEMA: TFMTBCDField;
    tbAuditoriaDeCaixaTOTAL_OPERADOR: TFMTBCDField;
    tbAuditoriaDeCaixaDIFERENCA_OPERADOR: TFMTBCDField;
    tbAuditoriaDeCaixaTOTAL_AUDITORIA: TFMTBCDField;
    tbAuditoriaDeCaixaDIFERENCA_AUDITORIA: TFMTBCDField;
    tbAuditoriaDeCaixaOBS: TStringField;
    qryDetalhamentoFormas: TFDQuery;
    dsQryDetalhamento: TDataSource;
    dsQryVendasCaixa: TDataSource;
    qryVendasCaixa: TFDQuery;
    qryCsHistoricosAuditoria: TFDQuery;
    dsHistoricosAuditoria: TDataSource;
    qryFormasPagamentoAuditoria: TFDQuery;
    dsqryFormasPagamentoAuditoria: TDataSource;
    procedure tbAuditoriaDeCaixaBeforePost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure QryListagemCaixasBeforeInsert(DataSet: TDataSet);
  private
    procedure OpenDataSets;




    { Private declarations }
  public
    { Public declarations }
    function getSQListagemCaixas: string;
    procedure FiltrarDetalhamentoDeRecebimentosCaixa(ACodEmpresa, ACodCaixa: string);
    procedure FiltrarVendasDoCaixa(ACodEmpresa, ACodCaixa: string);
    procedure ReabrirAuditoriaCaixa(ACodEmpresa, ACodCaixa: string);
  end;

var
  dmAuditoriaCaixas: TdmAuditoriaCaixas;

implementation

uses
  uu_data_module, uu_frm_principal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmAuditoriaCaixas.getSQListagemCaixas(): string;
var
  LSQL: TStringlist;
begin
  LSQL := TStringlist.Create;
  try
    LSQL.add(' select                                                                                                                                                         ');
    LSQL.add('       1 as id,                                                                                                                                                 ');
    LSQL.add('       c.cod_empresa,  c.codigo, p.descricao_empresa,                                                                                                           ');
    LSQL.add('       c.nome_usuario,                                                                                                                                          ');
    LSQL.add('       c.data_sistema,                                                                                                                                          ');
    LSQL.add('       cast((c.data_abertura ||' + Quotedstr(' ') + '||c.hora_abertura)as timestamp) abertura,                                                                                     ');
    LSQL.add('       cast((c.data_fechamento ||' + Quotedstr(' ') + '||c.hora_fechamento) as timestamp) fechamento,                                                                              ');
    LSQL.add('       coalesce(u.nome_usuario,' + QuotedStr(' ') + ') as Usuario_Auditoria,                                                                                                       ');
    LSQL.add('       c.data_auditoria,total_recebimentos, c.total_sangrias,total_suprimentos,total_sistema, total_operador,                                                                                   ');
    LSQL.add('       c.diferenca_total, COALESCE(ID_HISTORICO_AUDITORIA,0) as ID_HISTORICO_AUDITORIA,');
    LSQL.add('  OBS_AUDITORIA,HI.DESCRICAO AS HISTORICO,                                                                                                                                      ');
    LSQL.add('       c.diferenca_pagar,                                                                                                                                       ');
    LSQL.add('       coalesce(c.auditado,0) as auditado,                                                                                                                      ');
    LSQL.add('       coalesce(c.sincronizado,0) as sincronizado,                                                                                                              ');
    LSQL.add('       coalesce(c.status, 0) as status,                                                                                                                         ');
    LSQL.add('       coalesce((select count(*) from parciais_caixa pc where pc.cod_caixa = c.codigo and pc.cod_empresa = c.cod_empresa),0) as parciais_impressos             ');
    LSQL.add('       from caixas c                                                                  ');
    LSQL.add('         inner join parametros p on (p.cod_empresa = c.cod_empresa)                   ');
    LSQL.Add('         left join historicos_auditoria_caixa hi on (hi.id = c.ID_HISTORICO_AUDITORIA)');
    LSQL.add('         left join usuarios u on (u.cod_usuario = c.cod_usuario_auditoria)            ');
    LSQL.add('           where 1=1                                                                  ');
    LSQL.add('           :FiltrosAdicionais ');
    LSQL.add('           and c.cod_empresa in (select c2.cod_empresa from selecao_empresas c2)      ');
    LSQL.add('       order by c.data_sistema ');
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TdmAuditoriaCaixas.tbAuditoriaDeCaixaBeforePost(DataSet: TDataSet);
var
  LTotalDiferencaAuditoria: double;
begin
  try
    LTotalDiferencaAuditoria := tbAuditoriaDeCaixa.FieldByName('TOTAL_AUDITORIA').value - tbAuditoriaDeCaixa.FieldByName('SALDO_SISTEMA').value;
    tbAuditoriaDeCaixa.FieldByName('DIFERENCA_AUDITORIA').value := LTotalDiferencaAuditoria;
  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao atualizar diferença de auditoria!' + sLineBreak + sLineBreak + 'Por favor cancele a auditoria atual e reinicie o processo.');
    end;

  end;

end;

procedure TdmAuditoriaCaixas.DataModuleDestroy(Sender: TObject);
begin
  qryDetalhamentoFormas.Active := false;
  QryListagemCaixas.Active := False;
  qryVendasCaixa.Active := false;
  qryCsHistoricosAuditoria.Active := false;

end;

procedure TdmAuditoriaCaixas.OpenDataSets();
begin
  qryCsHistoricosAuditoria.Active := true;
  qryCsHistoricosAuditoria.first;

end;

procedure TdmAuditoriaCaixas.FiltrarVendasDoCaixa(ACodEmpresa: string; ACodCaixa: string);
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.Create;

  try
    LSQL.add(' select v.cod_empresa,v.cod_venda,v.hora,v.mesa,v.valor_bruto,                     ');
    LSQL.add('        v.valor_txserv,v.valor_desconto,v.valor_total,v.numero_nfce, ');
    LSQL.add('        v.tabela_preco,v.chave_nfce,v.cod_usuario,u.login,v.cod_usuario            ');
    LSQL.add('         from vendas v                                                 ');
    LSQL.add(' inner join usuarios u on (u.cod_usuario = v.cod_usuario)            ');
    LSQL.add('         where                                                         ');
    LSQL.add('            v.cod_empresa=:ACodEmpresa                                 ');
    LSQL.add('           and v.cod_caixa=:ACodCaixa                                  ');
    LSQL.add('      order by v.data_so,hora                                          ');
    LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.Text);

    QryVendasCaixa.Active := false;
    QryVendasCaixa.sql.Clear;
    QryVendasCaixa.sql.Add(LSQL.text);
    QryVendasCaixa.Active := true;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TdmAuditoriaCaixas.ReabrirAuditoriaCaixa(ACodEmpresa: string; ACodCaixa: string);
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.Create;

  try
{
    LSQL.add(' delete from caixas_auditoria ca ');
    LSQL.add('      where  ca.cod_empresa=:ACodEmpresa                                 ');
    LSQL.add('           and ca.cod_caixa=:ACodCaixa                                  ');
    LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.executaSQL(LSQL.Text);
    }

    LSQL.clear;
    LSQL.add(' update caixas c set c.diferenca_total=0, c.auditado=2 ');
    LSQL.add('      where  c.cod_empresa=:ACodEmpresa                                 ');
    LSQL.add('           and c.codigo=:ACodCaixa                                  ');
    LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.executaSQL(LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TdmAuditoriaCaixas.FiltrarDetalhamentoDeRecebimentosCaixa(ACodEmpresa: string; ACodCaixa: string);
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.Create;

  try

    LSQL.add(' select v.cod_venda,v.cod_empresa,v.mesa, v.numero_nfce, v.chave_nfce, v.valor_txserv, r.cod_forma,fp.descricao, v.hora,v.valor_total, r.valor, u.login,');
    LSQL.add(' coalesce(cl.razao_social,' + Quotedstr('') + ') as cliente                                                                                                                ');
    LSQL.add('     from recebimentos r                                                                                                                                ');
    LSQL.add('       inner join vendas v on (v.cod_venda = r.cod_venda)                                                                                               ');
    LSQL.add('       inner join formas_pagamento fp on (fp.cod_forma = r.cod_forma)                                                                                   ');
    LSQL.add('       inner join usuarios u on (u.cod_usuario = v.cod_usuario)                                                                                         ');
    LSQL.add('       left join faturas f on (f.cod_venda = v.cod_venda)                                                                                               ');
    LSQL.add('       left join clientes cl on (cl.cod_cli = f.cod_cli)                                                                                                ');
    LSQL.add('         where                                                         ');
    LSQL.add('            v.cod_empresa=:ACodEmpresa                                 ');
    LSQL.add('           and v.cod_caixa=:ACodCaixa                                  ');
    LSQL.add('      order by v.data_so,hora                                          ');
    LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.Text);

    qryDetalhamentoFormas.Active := false;
    qryDetalhamentoFormas.sql.Clear;
    qryDetalhamentoFormas.sql.Add(LSQL.text);
    qryDetalhamentoFormas.Active := true;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TdmAuditoriaCaixas.QryListagemCaixasBeforeInsert(DataSet: TDataSet);
begin
  raise Exception.Create('Entrou aqui!');
end;

end.

