unit uuListagemLancamentosRD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  System.DateUtils, Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask, ExtCtrls,

  cxGraphics, cxControls, cxLookAndFeelPainters,
  cxCheckComboBox,
  AdvDateTimePicker, AdvGlassButton, cxCheckBox, cxLookAndFeels, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelLancamentosRD = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Panel4: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    rdFiltro: TRadioGroup;
    ckbOrdem: TRadioGroup;
    ckbFiltroRD: TCheckBox;
    rdgResumo: TRadioGroup;
    pnFornecedor: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    procedure emitirRelatorio();
    procedure FormActivate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure btSairClick(Sender: TObject);
  private
    procedure verificaValidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelLancamentosRD: TfrmRelLancamentosRD;

implementation

uses
  uu_data_module, uu_frm_principal, UU_DM_RELATORIOS;

{$R *.dfm}

procedure TfrmRelLancamentosRD.verificaValidade;
var
  i: integer;
  LTemEmpresaSelecionada: Boolean;
begin
  try
    try

      if (edDataInicial.Date > edDataFinal.Date) then
      begin
        raise Exception.Create('Período inválido!');
      end;

      if (trim(ed_cod_fornecedor.Text) <> '') then
      begin
        if (verificaExistenciaFornecedor(ed_cod_fornecedor.Text) = false) then
        begin
          ed_cod_fornecedor.Clear;
          ed_nome_fantasia_fornecedor.Clear;
          raise Exception.Create('Fornecedor informado é inválido!');
        end;
      end;

      if cbEmpresas.States[0] = cbsChecked then
      begin
        cbEmpresas.SelectAll
      end;

      for i := 0 to cbEmpresas.Properties.Items.Count - 1 do
      begin
        if cbEmpresas.States[i] = cbsChecked then
          LTemEmpresaSelecionada := True;
      end;

      if (LTemEmpresaSelecionada = false) then
      begin
        raise Exception.Create('Nenhuma empresa foi selecionada!');
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;

  finally

  end;

end;

procedure TfrmRelLancamentosRD.cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
  opcao: TCxCheckBoxState;
  i: integer;
begin
  inherited;
  if ItemIndex = 0 then
  begin
    if cbEmpresas.States[0] = cbsUnchecked then
      opcao := cbsChecked
    else
      opcao := cbsUnchecked;

    for i := 1 to cbEmpresas.Properties.Items.Count - 1 do
      cbEmpresas.States[i] := opcao;
  end;
  cbEmpresas.Refresh;
  cbEmpresas.Repaint;
end;

procedure TfrmRelLancamentosRD.emitirRelatorio();
var
  ordenacao: string;
  filtroExtra: string;
  i: integer;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
begin

  dm.transacao.Active := false;
  dm.transacao.StartTransaction;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;
  try
    try

      if cbEmpresas.States[0] = cbsChecked then
      begin
        for i := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[i] := cbsChecked;
      end;
      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      dm_relatorios.qryRelLancamentosRD.Active := false;
      dm_relatorios.qryRelLancamentosRD.SQL.clear;
      dm_relatorios.qryRelLancamentosRD.SQL.add(' select * from (select coalesce(c.data_vencimento,lr.data_documento) as data_vencimento, ');
      dm_relatorios.qryRelLancamentosRD.SQL.add('   f.razao_social, lr.* from lancamentos_rd lr ');

      dm_relatorios.qryRelLancamentosRD.SQL.add('  left join contas_a_pagar c on (c.codigo = lr.cod_ct_pagar) ');
      dm_relatorios.qryRelLancamentosRD.SQL.add('  inner join fornecedor f on (f.cod_fornecedor = lr.cod_fornecedor) ');

      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        dm_relatorios.qryRelLancamentosRD.SQL.Add('           where c.cod_emp_grupo in (' + LEmpresasSelecionadas.selecionadas + ')');
      end;
      dm_relatorios.qryRelLancamentosRD.SQL.add('  ) lrd ');
      dm_relatorios.rpt.Clear;

      case ckbOrdem.ItemIndex of
        0:
          ordenacao := ', udf_abs(lrd.total),lrd.codigo,lrd.razao_social';
        1:
          ordenacao := ',lrd.razao_social, udf_abs(lrd.total),lrd.codigo';
      end;

      if (trim(ed_cod_fornecedor.Text) <> '') then
        filtroExtra := 'and lrd.cod_fornecedor=' + Quotedstr(ed_cod_fornecedor.Text) + ' ';

      case rdFiltro.ItemIndex of
        0:
          begin
            dm_relatorios.qryRelLancamentosRD.SQL.add('   where lrd.data_lancamento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
            if ckbFiltroRD.Checked then
              dm_relatorios.qryRelLancamentosRD.SQL.add(' and lrd.data_rd  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
            dm_relatorios.qryRelLancamentosRD.SQL.add(filtroExtra);
            dm_relatorios.qryRelLancamentosRD.SQL.add('   order by  lrd.data_lancamento' + ordenacao);

            if rdgResumo.ItemIndex = 0 then
              dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relLancamentosRDporDataLancamento.fr3', true)
            else
              dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relLancamentosRDporDataLancamentoDetalhado.fr3', true)

          end;

        1:
          begin
            dm_relatorios.qryRelLancamentosRD.SQL.add('   where lrd.data_vencimento between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
            dm_relatorios.qryRelLancamentosRD.SQL.add(filtroExtra);
            dm_relatorios.qryRelLancamentosRD.SQL.add('   order by lrd.data_vencimento' + ordenacao);
            if rdgResumo.ItemIndex = 0 then
              dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relLancamentosRDporDataVencimento.fr3', true)
            else
              dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relLancamentosRDporDataVencimentoDetalhado.fr3', true)

          end;

        2:
          begin
            dm_relatorios.qryRelLancamentosRD.SQL.add('   where lrd.data_rd between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
            dm_relatorios.qryRelLancamentosRD.SQL.add(filtroExtra);
            dm_relatorios.qryRelLancamentosRD.SQL.add('   order by lrd.data_rd ' + ordenacao);
            if rdgResumo.ItemIndex = 0 then
              dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relLancamentosRDporDataRD.fr3', true)
            else
              dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relLancamentosRDporDataRDDetalhado.fr3', true)
          end;

      end;

      dm_relatorios.setPeriodoRelatorio('De  ' + FormatDateTime('DD.MM.YYY', edDataInicial.Date) + ' até ' + FormatDateTime('DD.MM.YYY', edDataFinal.Date));
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dm.adicionalog(dm_relatorios.qryRelLancamentosRD.SQL.Text);

      dm_relatorios.qryRelLancamentosRD.Active := true;
      dm_relatorios.rpt.ShowReport(true);

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    FreeAndNil(LEmpresasSelecionadas);
    dm_relatorios.qryRelLancamentosRD.Active := false;
    dm.transacao.Rollback;
  end;

end;

procedure TfrmRelLancamentosRD.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelLancamentosRD.btSelecionarClick(Sender: TObject);
begin
  try
    try
      verificaValidade;
      emitirRelatorio;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;

    end;
  finally

  end;

end;

procedure TfrmRelLancamentosRD.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(Now);
  edDataFinal.Date := EndOfTheMonth(now);

  ed_cod_fornecedor.Clear;
  ed_nome_fantasia_fornecedor.clear;


end;

procedure TfrmRelLancamentosRD.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

end.

