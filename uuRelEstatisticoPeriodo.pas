unit uuRelEstatisticoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, System.DateUtils,
  AdvDateTimePicker,
  cxGraphics, cxControls, cxLookAndFeelPainters,
  cxTimeEdit,
  AdvGlassButton,
  cxCheckComboBox, cxLookAndFeels, cxContainer, cxEdit, cxCheckBox,
  cxDropDownEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.ComCtrls,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  PngSpeedButton, Vcl.Menus;

type
  TfrmRelEstatisticoPeriodo = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    pnn: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    ckbSegunda: TCheckBox;
    ckbTerca: TCheckBox;
    ckbQuarta: TCheckBox;
    ckbQuinta: TCheckBox;
    ckbSexta: TCheckBox;
    ckbDomingo: TCheckBox;
    ckbSabado: TCheckBox;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    rdOrdem: TRadioGroup;
    Label1: TLabel;
    ckbTodos: TCheckBox;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    rdTipoOrdem: TRadioGroup;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    edHoraFinal: TcxTimeEdit;
    edHoraInicial: TcxTimeEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton2: TPngSpeedButton;
    function verificaValidade(): boolean;
    procedure emitirRelatorio();
    procedure FormActivate(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstatisticoPeriodo: TfrmRelEstatisticoPeriodo;

implementation

uses
  UU_DM_RELATORIOS, uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

procedure TfrmRelEstatisticoPeriodo.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEstatisticoPeriodo.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
  begin
    emitirRelatorio;
  end;
end;

procedure TfrmRelEstatisticoPeriodo.cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
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

procedure TfrmRelEstatisticoPeriodo.ckbTodosClick(Sender: TObject);
begin
  inherited;
  if ckbTodos.Checked then
  begin
    ckbSegunda.Checked := true;
    ckbTerca.Checked := true;
    ckbQuarta.Checked := true;
    ckbQuinta.Checked := true;
    ckbSexta.Checked := true;
    ckbSabado.Checked := true;
    ckbDomingo.Checked := true;
  end
  else
  begin
    ckbSegunda.Checked := false;
    ckbTerca.Checked := false;
    ckbQuarta.Checked := false;
    ckbQuinta.Checked := false;
    ckbSexta.Checked := false;
    ckbSabado.Checked := false;
    ckbDomingo.Checked := false;
  end;
end;

function TfrmRelEstatisticoPeriodo.verificaValidade(): boolean;
begin

  if (ed_data_inicial.date > ed_data_final.date) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result := false;
    exit;
  end;

  result := true;

end;

procedure TfrmRelEstatisticoPeriodo.emitirRelatorio();
var
  dias: string;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LFiltroEmpresas: string;
  i: integer;
begin
  inherited;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;
  LFiltroEmpresas := '-1';

  try
    try

      if cbEmpresas.States[0] = cbsChecked then
      begin
        for i := 0 to cbEmpresas.Properties.Items.Count -1  do
          cbEmpresas.States[i] := cbsChecked;
      end;

      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      LFiltroEmpresas := LEmpresasSelecionadas.selecionadas;

      LFiltroEmpresas := Quotedstr('(' + LFiltroEmpresas + ')');
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dias := '-1';
      dm.transacao.Active := false;
      dm.transacao.Active := true;
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relEstatisticoVendasPeriodo.fr3', true);

      if ckbDomingo.Checked then
        dias := dias + ',0';

      if ckbSegunda.Checked then
        dias := dias + ',1';

      if ckbTerca.Checked then
        dias := dias + ',2';

      if ckbQuarta.Checked then
        dias := dias + ',3';

      if ckbQuinta.Checked then
        dias := dias + ',4';

      if ckbSexta.Checked then
        dias := dias + ',5';

      if ckbSabado.Checked then
        dias := dias + ',6';

      dm_relatorios.qryRelEstatisticaVendas.Active := false;
      dm_relatorios.qryRelEstatisticaVendas.SQL.clear;
      dm_relatorios.qryRelEstatisticaVendas.sql.Add('select * from r_estatistico_vendas(' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.date)) + ',' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.date)) + ',' + Quotedstr(FormatDateTime('HH:MM:SS', edHoraInicial.Time)) + ',' + Quotedstr(FormatDateTime('HH:MM:SS', edHoraFinal.Time)) + ',' + Quotedstr(dias) + ',' + LFiltroEmpresas + ')');

      dm.adicionaLog(dm_relatorios.qryRelEstatisticaVendas.sql.Text);

      case rdOrdem.ItemIndex of
        0:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' order by data');
        1:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' order by dia,data');
        2:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' order by total_geral');
        3:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' order by total_mesas');
        4:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' order by total_balcao');
        5:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' order by delivery');
      end;

      case rdTipoOrdem.ItemIndex of
        0:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' asc');
        1:
          dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' desc');
      end;


 // ////dm.adicionalog(dm_relatorios.qryRelEstatisticaVendas.SQL.Text);
      dm_relatorios.qryRelEstatisticaVendas.Active := true;
  //dm_relatorios.qryRelEstatisticaVendas.SQL.Add(' where f.data is not null ');


      dm_relatorios.setDiaDaSemanaRelatorio(0, ckbDomingo.Checked);
      dm_relatorios.setDiaDaSemanaRelatorio(1, ckbSegunda.Checked);
      dm_relatorios.setDiaDaSemanaRelatorio(2, ckbTerca.Checked);
      dm_relatorios.setDiaDaSemanaRelatorio(3, ckbQuarta.Checked);
      dm_relatorios.setDiaDaSemanaRelatorio(4, ckbQuinta.Checked);
      dm_relatorios.setDiaDaSemanaRelatorio(5, ckbSexta.Checked);
      dm_relatorios.setDiaDaSemanaRelatorio(6, ckbSabado.Checked);




   {

  case rdOrdem.ItemIndex of

   0: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by data ');
      end;

   1: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by total_produtos ');
      end;

   2: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by total_geral ');
      end;

   3: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by total_produtos_mesa ');
      end;

   4: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by total_produtos_delivery ');
      end;

   5: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by total_produtos_balcao ');
      end;

   6: begin
        dm_relatorios.qryRelEstatisticaVendas.SQL.add(' order by ndia ');
      end;
 end;


 case rdTipoOrdem.ItemIndex of
  0:    dm_relatorios.qryRelEstatisticaVendas.SQL.add(' asc ');
  1:    dm_relatorios.qryRelEstatisticaVendas.SQL.add(' desc ');
 end;

   }
      dm.adicionalog(dm_relatorios.qryRelEstatisticaVendas.SQL.Text);

      dm_relatorios.setPeriodoRelatorio('De ' + FormatDateTime('DD/MM/YY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YY', ed_data_final.Date) + '     ( Das ' + FormatDateTime('HH:MM:SS', edHoraInicial.Time) + ' às ' + FormatDateTime('HH:MM:SS', edHoraFinal.Time) + ' )');

      dm_relatorios.qryRelEstatisticaVendas.Active := true;
      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryRelEstatisticaVendas.Active := false;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gerar o relatório ' + sLineBreak + sLineBreak + E.Message, 'Ok');

      end;

    end;
  finally
    FreeAndNil(LEmpresasSelecionadas);
  end;
end;

procedure TfrmRelEstatisticoPeriodo.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := StartOfTheMonth(data_do_sistema);
  ed_data_final.Date := EndOfTheMonth(data_do_sistema);
  edHoraInicial.Time := StrToTime('00:00:00');
  edHoraFinal.Time := strtoTime('23:59:59');
  ed_data_inicial.SetFocus;
end;

procedure TfrmRelEstatisticoPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

procedure TfrmRelEstatisticoPeriodo.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

