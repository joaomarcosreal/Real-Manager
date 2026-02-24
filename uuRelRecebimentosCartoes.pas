unit uuRelRecebimentosCartoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.DateUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uu_modelo_Vazio, cxGraphics, cxControls,
  cxLookAndFeelPainters,
  cxCheckComboBox, Vcl.StdCtrls,
  AdvDateTimePicker, Vcl.ExtCtrls, AdvGlassButton, cxCheckBox, cxLookAndFeels,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, Vcl.Buttons,
  Vcl.Menus;

type
  TfrmRelRecebimentosCartoes = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    GroupBox3: TGroupBox;
    cbFormasPagamento: TcxCheckComboBox;
    GroupBox4: TGroupBox;
    cbAdquirentes: TcxCheckComboBox;
    rdTipoData: TRadioGroup;
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure gerarRelatorio;
    procedure verificaValidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRecebimentosCartoes: TfrmRelRecebimentosCartoes;

implementation

{$R *.dfm}

uses
  uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

procedure TfrmRelRecebimentosCartoes.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelRecebimentosCartoes.btSelecionarClick(Sender: TObject);
begin
  inherited;

  try
    try
      verificaValidade;
      gerarRelatorio;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao tentar gerar o relatório ' + sLineBreak + sLineBreak + E.Message, 'Ok');
      end;

    end;
  finally

  end;

end;

procedure TfrmRelRecebimentosCartoes.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(Now);
  edDataFinal.Date := Now;
  edDataInicial.SetFocus;
end;

procedure TfrmRelRecebimentosCartoes.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
  carregaDadosCombo(cbAdquirentes, tiAdquirentes);
  carregaDadosCombo(cbFormasPagamento, tiFormasPagamento);
  end;

procedure TfrmRelRecebimentosCartoes.gerarRelatorio();
var
  LSQL: TStringList;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LAdquirentesSelecionas: TSelecaoComboPesquisa;
  LFormasPagamentoSelecionadas: TSelecaoComboPesquisa;
  I: integer;
begin
  LSQL := TstringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;
  LAdquirentesSelecionas := TSelecaoComboPesquisa.Create;
  LFormasPagamentoSelecionadas := TSelecaoComboPesquisa.Create;

  try
    try
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', 'Todas');
      dm_relatorios.setVariavelRelatorio('V_FORMAS_PAGAMENTO_SELECIONADAS', 'Todas');
      dm_relatorios.setVariavelRelatorio('V_ADQUIRENTES_SELECIONADAS', 'Todas');
      dm_relatorios.setVariavelRelatorio('V_TIPO_OPERACAO_CREDITO_SELECIONADAS', 'Todas');

      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      getSelecaoCombo(cbFormasPagamento, LFormasPagamentoSelecionadas, tiFormasPagamento);
      getSelecaoCombo(cbAdquirentes, LAdquirentesSelecionas, tiAdquirentes);

      LSQL.add('select * from (                                                                                                 ');
      LSQL.add('   select  v.data_so as data_transacao, v.cod_empresa,                                                         ');
      LSQL.add('		   r.cod_usuario,                                                                                          ');
      LSQL.add('		   u.login,                                                                                                ');
      LSQL.add('		   r.cod_caixa,                                                                                            ');
      LSQL.add('		   v.data as dataSistema,                                                                                  ');
      LSQL.add('		   v.hora,                                                                                                 ');
      LSQL.add('		   fp.cod_forma,                                                                                           ');
      LSQL.add('		   fp.descricao as forma,                                                                                  ');
      LSQL.add('		   fpc.id_adquirente,                                                                                      ');
      LSQL.add('		   ad.nome  as adquirente,                                                                                 ');
      LSQL.add('		   r.nsu, r.autorizacao_tef,                                                                               ');
      LSQL.add('		   cast(udf_incday(r.data,fpc.prazo) as date) as data_recebimento,                                         ');
      LSQL.add('		   r.valor as valorTransacao,                                                                              ');
      LSQL.add('		   fpc.taxa as pctTaxa,                                                                                    ');
      LSQL.add('		  udf_roundabnt((r.valor * udf_roundabnt(fpc.taxa, 4) /100 ),2) as taxa,                                   ');
      LSQL.add('		  (r.valor - (udf_roundabnt((r.valor * udf_roundabnt(fpc.taxa, 4) /100 ),2))) valorReceber, CB.conta,      ');
      LSQL.add('		  cb.descricao as descricaoConta                                                                           ');
      LSQL.add('	  from recebimentos r                                                                                        ');
      LSQL.add('		inner join formas_pagamento fp on (fp.cod_forma = r.cod_forma)                                             ');
      LSQL.add('		inner join formas_pagamento_configuracoes fpc on (fpc.id = r.id_config_pagamento)                          ');
      LSQL.add('		inner join adquirentes ad on (ad.id = fpc.id_adquirente)                                                   ');
      LSQL.add('		inner join contas_bancarias cb on (cb.id = fpc.id_conta_banco)                                             ');
      LSQL.add('		inner join usuarios u on (u.cod_usuario = r.cod_usuario)                                                   ');
      LSQL.add('		inner join vendas v on (v.cod_venda = r.cod_venda)                                                         ');

      LSQL.add(' 		and r.cod_forma <> ' + Quotedstr('001'));

      LSQL.add('                                                                                       ');

      case rdTipoData.ItemIndex of
        0:
          begin
            LSQL.add(' 		 ) where data_recebimento between :vpDataInicial and :vpDataFinal               ');
            dm_relatorios.setVariavelRelatorio('V_TIPO_DATA_SELECIONADA', 'Por data de recebimento (crédito na conta)');
          end;
        1:
          begin
            LSQL.add(' 		 ) where data_transacao between :vpDataInicial and :vpDataFinal               ');
            dm_relatorios.setVariavelRelatorio('V_TIPO_DATA_SELECIONADA', 'Por data da transação (data da venda)');
          end;
      end;
      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')');
        dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      end;

      if cbFormasPagamento.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and  cod_forma in (' + LFormasPagamentoSelecionadas.selecionadas + ')');
        dm_relatorios.setVariavelRelatorio('V_FORMAS_PAGAMENTO_SELECIONADAS', cbFormasPagamento.Text);
      end;

      if cbAdquirentes.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and  id_adquirente in (' + LAdquirentesSelecionas.selecionadas + ')');
        dm_relatorios.setVariavelRelatorio('V_ADQUIRENTES_SELECIONADAS', cbAdquirentes.Text);
      end;

      LSQL.add('                                                                                       ');
      LSQL.add(' 		order by conta,data_recebimento,adquirente,cod_forma                                          ');

      LSQL.Text := StringReplace(LSQL.Text, ':vpDataInicial', QuotedStr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataFinal', QuotedStr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)), [rfReplaceAll, rfIgnoreCase]);

      dm_relatorios.qryRelRecebimentosCartoes.Active := false;
      dm_relatorios.qryRelRecebimentosCartoes.SQL.Clear;

      dm_relatorios.qryRelRecebimentosCartoes.SQL.Add(LSQL.Text);
      dm.adicionaLog(LSQL.Text);
      dm_relatorios.qryRelRecebimentosCartoes.Active := True;
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relRecebimentosCartoes.fr3', true);

      dm_relatorios.setPeriodoRelatorio('De  ' + FormatDateTime('DD/MM/YYYY', edDataInicial.Date) + ' até ' + FormatDateTime('DD/MM/YYYY', edDataFinal.Date));
      dm_relatorios.rpt.ShowReport(true);
    except
      on E: Exception do
      begin
        raise Exception.Create(e.Message);

      end;
    end;
  finally
    LEmpresasSelecionadas.Free;
    LAdquirentesSelecionas.Free;
    LFormasPagamentoSelecionadas.Free;
    FreeAndNil(LSQL);
    dm_relatorios.qryRelRecebimentosCartoes.Active := false;
  end;
end;

procedure TfrmRelRecebimentosCartoes.verificaValidade();
begin
  try
    if (edDataInicial.Date > edDataFinal.Date) then
    begin
      raise Exception.Create('Período inválido!');
    end;

  finally

  end;

end;

end.

