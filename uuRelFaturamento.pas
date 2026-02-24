unit uuRelFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, cxCheckBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, AdvGlassButton, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, Vcl.ComCtrls, AdvDateTimePicker, Vcl.Menus;

type
  TfrmRelatorioFaturamentoDiarioPeriodoAnalitico = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    GroupBox1: TGroupBox;
    cbFormasPagamento: TcxCheckComboBox;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    rdTipoRelatorio: TRadioGroup;
    GroupBox3: TGroupBox;
    ckbTodos: TCheckBox;
    ckbECF: TCheckBox;
    ckbNFCE: TCheckBox;
    ckbNFE: TCheckBox;
    ckbSAT: TCheckBox;
    ckbAvulso: TCheckBox;
    rdgTipoVenda: TRadioGroup;
    function verificaValidade(): boolean;
    procedure emitirRelatorio();
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
  private
    function FiltroPorTipoDocumento: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioFaturamentoDiarioPeriodoAnalitico: TfrmRelatorioFaturamentoDiarioPeriodoAnalitico;

implementation

uses
  uu_data_module, UU_DM_RELATORIOS, uu_frm_principal, DateUtils;

{$R *.dfm}

function TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.verificaValidade(): boolean;
begin
  Result := false;

  if (ed_data_inicial.Date > ed_data_final.Date) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result := false;
    exit;
  end;

  result := true;
end;

function TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.FiltroPorTipoDocumento(): string;
begin
  if ckbTodos.checked then
    result := ''
  else
  begin
    Result := '(-1';

    if ckbECF.checked then
      result := result + ',1';

    if ckbNFCE.checked then
      result := result + ',2';

    if ckbNFE.checked then
      result := result + ',3';

    if ckbSAT.checked then
      result := result + ',4';

    if ckbAvulso.checked then
      result := result + ',0';
    Result := result + ')';

    result := 'and v.modelo_comprovante in ' + Result;

  end;

end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.emitirRelatorio();
var
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LFormasSelecionadas: TSelecaoComboPesquisa;
  L: integer;
  LTiposDocumento: string;
  I: integer;
begin
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;
  LFormasSelecionadas := TSelecaoComboPesquisa.Create;

  try

    try
      LTiposDocumento := FiltroPorTipoDocumento;
      if cbEmpresas.States[0] = cbsChecked then
      begin
        for I := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[I] := cbsChecked;
      end;
      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      getSelecaoCombo(cbFormasPagamento, LFormasSelecionadas, tiFormasPagamento);

      dm.transacao.Active := false;
      dm.transacao.Active := true;
      dm_relatorios.qryRelFaturamento.Active := false;
      dm_relatorios.qryRelFaturamento.SQL.clear;

      case rdTipoRelatorio.ItemIndex of
        0:
          begin
            dm_relatorios.qryRelFaturamento.sql.add('select r.cod_forma, sum(r.valor) as total, upper(f.descricao) as Descricao from  recebimentos r');
          end;
        1:
          begin
            dm_relatorios.qryRelFaturamento.sql.add('  select r.cod_forma, r.data, udf_month(r.data)||' + Quotedstr('/') + '||udf_year(r.data) as mes , upper(udf_monthname(r.data))||' + Quotedstr('/') + '||udf_year(r.data) as NomeMes, sum(r.valor) as total, upper(f.descricao) as Descricao from  recebimentos r');
          end;
      end;

      dm_relatorios.qryRelFaturamento.sql.add('   inner join formas_pagamento f on (f.cod_forma =  r.cod_forma)');
      dm_relatorios.qryRelFaturamento.sql.add('     inner join vendas v on (v.cod_venda = r.cod_venda and v.cod_empresa = r.cod_empresa ) ');
      dm_relatorios.qryRelFaturamento.sql.add('   where r.data between ' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.Date)));
      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        dm_relatorios.qryRelFaturamento.sql.add('           and r.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')');
      end;
      dm_relatorios.qryRelFaturamento.sql.add('   and r.cod_forma  in (' + LFormasSelecionadas.selecionadas + ')');

      case rdgTipoVenda.ItemIndex of
        0:
          begin

          end;

        1:
          begin
            dm_relatorios.qryRelFaturamento.sql.add(' and v.tipo_venda = 1 ');
          end;

        2:
          begin
            dm_relatorios.qryRelFaturamento.sql.add(' and v.tipo_venda = 2 ');
          end;

        3:
          begin
            dm_relatorios.qryRelFaturamento.sql.add(' and v.tipo_venda = 3 ');
          end;

      end;

      if (trim(LTiposDocumento) <> '') then
        dm_relatorios.qryRelFaturamento.sql.add(LTiposDocumento);

      case rdTipoRelatorio.ItemIndex of
        0:
          begin
            dm_relatorios.qryRelFaturamento.sql.add('   group by r.cod_forma,f.descricao');
            dm_relatorios.qryRelFaturamento.sql.add('   order by r.cod_forma');
          end;
        1:
          begin
            dm_relatorios.qryRelFaturamento.sql.add('   group by r.data,r.cod_forma,f.descricao');
            dm_relatorios.qryRelFaturamento.sql.add('   order by r.data,r.cod_forma');
          end;
      end;
      dm.adicionalog(dm_relatorios.qryRelFaturamento.SQL.Text);


      dm_relatorios.qryRelFaturamento.Active := true;
      dm_relatorios.setPeriodoRelatorio('De  ' + FormatDateTime('DD/MM/YYY', ed_data_inicial.Date) + '  até  ' + FormatDateTime('DD/MM/YYY', ed_data_final.Date));
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dm_relatorios.setVariavelRelatorio('V_FORMAS_PAGAMENTO_SELECIONADAS', cbFormasPagamento.Text);

      case rdTipoRelatorio.ItemIndex of
        0:
          dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelFaturamentoResumido.fr3', true);
        1:
          dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelatorioFaturamentoDiarioPorPeriodo.fr3', true);
      end;

      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryParametros.Active := true;
      dm_relatorios.qryRelFaturamento.Active := false;
    except

    end;
  finally
    FreeAndNil(LEmpresasSelecionadas);
    FreeAndNil(LFormasSelecionadas);
  end;

end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.SetFocus;
  ed_data_inicial.Date := StartOfTheMonth(today);
  ed_data_final.Date := today;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.FormCreate(Sender: TObject);
begin
//  dm.carregarFormasDePagamento (true);
  carregaDadosCombo(cbFormasPagamento, tiFormasPagamento);
  carregaDadosCombo(cbEmpresas, tiEmpresas);
  cbFormasPagamento.SelectAll;
  inherited;

end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    emitirRelatorio;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.ckbTodosClick(Sender: TObject);
begin
  inherited;

  ckbAvulso.Checked := ckbTodos.Checked;
  ckbNFE.checked := ckbTodos.Checked;
  ckbNFCE.checked := ckbTodos.Checked;
  ;
  ckbSAT.checked := ckbTodos.Checked;
  ckbAVulso.checked := ckbTodos.Checked;
  ckbECF.checked := ckbTodos.Checked;

end;

end.

