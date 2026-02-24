unit uuRelInsumosProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  system.DateUtils, System.Classes, Vcl.Graphics, uu_modelo_Vazio, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxCheckBox, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Mask, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, Vcl.StdCtrls, Vcl.ComCtrls, AdvDateTimePicker,
  Vcl.ExtCtrls, AdvGlassButton, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons;

type
  TfrmRelInsumosProducao = class(Tfrm_modelo_vazio)
    xbotao_pesquisa: TSpeedButton;
    AAEdit1: TEdit;
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel3: TPanel;
    Label1: TLabel;
    ed_desc_grupo: TMaskEdit;
    rdOrdem: TRadioGroup;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    rdTipoData: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    procedure gerarRelatorio;
    function verificaValidade: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelInsumosProducao: TfrmRelInsumosProducao;

implementation

uses
  UU_DM_RELATORIOS, uu_frm_principal, uu_data_module;


{$R *.dfm}

procedure TfrmRelInsumosProducao.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelInsumosProducao.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
  begin
    gerarRelatorio;
  end;
end;

procedure TfrmRelInsumosProducao.cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
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

function TfrmRelInsumosProducao.verificaValidade(): boolean;
var
  LModalidadeSelecionada: Boolean;
  LTemEmpresaSelecionada: Boolean;
  I: integer;
begin
  Result := False;
  LModalidadeSelecionada := false;
  LTemEmpresaSelecionada := False;

  if (ed_data_inicial.Date > ed_data_final.Date) then
  begin
    dm.exibe_painel_erro('Período inválido!', 'Ok');
    result := false;
    exit;
  end;

  if cbEmpresas.States[0] = cbsChecked then
  begin
    cbEmpresas.SelectAll
  end;

  for I := 0 to cbEmpresas.Properties.Items.Count - 1 do
  begin
    if cbEmpresas.States[I] = cbsChecked then
      LTemEmpresaSelecionada := True;
  end;

  if (LTemEmpresaSelecionada = false) then
  begin
    exibe_painel_erro('Nenhuma empresa foi selecionada!', 'Ok');
    Result := false;
    exit;
  end;

  result := true
end;

procedure TfrmRelInsumosProducao.gerarRelatorio();
var
  LSQL: Tstringlist;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LDataInicial, LDataFinal: string;
  LFiltroPeriodo: string;
begin

  LSQL := TStringList.Create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;

  try
    try
      LDataInicial := Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.date));
      LDataFinal := Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.date));

      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      LSQL.add('                                                                                        ');
      LSQL.add(' select                                                                                 ');
      LSQL.add(' 	ins.cod_produto,                                                                      ');
      LSQL.add(' 	p.descricao,                                                                          ');
      LSQL.add(' 	gp.cod_grupo_raiz,                                                                    ');
      LSQL.add(' 	gp.desc_grupo_raiz,                                                                   ');
      LSQL.add(' 	gp.cod_grupo_pai,                                                                     ');
      LSQL.add(' gp.desdobramento_pai,                                                                  ');
      LSQL.add(' 	gp.desc_grupo_pai,                                                                    ');
      LSQL.add(' 	gp.cod_grupo,                                                                         ');
      LSQL.add(' 	gp.desdobramento_filho,                                                               ');
      LSQL.add(' 	gp.descricao as descGrupo,                                                            ');
      LSQL.add(' 	u.descricao as unidade,                                                               ');
      LSQL.add(' 	ins.qtdEstimada,                                                                      ');
      LSQL.add(' 	ins.qtdRetirada,                                                                      ');
      LSQL.add(' 	ins.qtdUtilizada,                                                                     ');
      LSQL.add(' 	ins.qtdPerda,                                                                         ');
      LSQL.add(' 	ins.qtdSobra,                                                                         ');
      LSQL.add(' 	ins.desvioQuantidade,                                                                 ');
      LSQL.add(' 	ins.custoMedio,                                                                       ');
      LSQL.add(' 	(ins.qtdUtilizada * ins.custoMedio) as custoUtilizado,                                ');
      LSQL.add(' 	(ins.qtdPerda * ins.custoMedio) as custoPerdas,                                       ');
      LSQL.add(' 	( (ins.qtdPerda + ins.qtdUtilizada) * ins.custoMedio) as custoTotal                   ');
      LSQL.add('                                                                                        ');
      LSQL.add(' 	from                                                                                  ');
      LSQL.add(' 		(                                                                                 ');
      LSQL.add(' 		select p.cod_produto,                                                             ');
      LSQL.add(' 				sum(p.qtde_calculada) as qtdEstimada,                                     ');
      LSQL.add(' 				sum(p.qtde_retirada)  as qtdRetirada,                                     ');
      LSQL.add(' 				sum(p.qtde_utilizada) as qtdUtilizada,                                    ');
      LSQL.add(' 				sum(p.qtde_perda) as qtdPerda,                                            ');
      LSQL.add(' 				sum(p.qtde_sobra) as qtdSobra,                                            ');
      LSQL.add(' 				avg(p.desvio_quantidade) as desvioQuantidade,                             ');
      LSQL.add(' 				avg(p.custo_unitario) as custoMedio                                       ');
      LSQL.add(' 			from producoes_lista_insumos p                                                ');
      LSQL.add(' 			inner join producoes_subprodutos pd on (pd.id = p.id_producao)                ');

      case rdTipoData.ItemIndex of
        0:
          begin
            LSQL.add(' 				where cast(pd.data_processamento as date) ');
          end;
        1:
          begin
            LSQL.add(' 				where pd.data ');
          end;
      end;
      LSQL.add(' 				 between :vpDataInicial and :vpDataFinal ');

      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and v.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')');
      end;



      LSQL.add(' 			group by p.cod_produto                                                        ');
      LSQL.add(' 		) ins                                                                             ');
      LSQL.add(' 	inner join produtos p on (p.cod_produto = ins.cod_produto)                            ');
      LSQL.add(' 	inner join unidades u on (u.cod_unidade = p.unidade_entrada)                          ');
      LSQL.add(' 	inner join r_grupos gp on (gp.cod_grupo = p.cod_grupo)                                ');
      LSQL.add('								where p.cod_grupo starting with (' + Quotedstr(ed_cod_grupo.Text) + ')                                                                                          ');
      LSQL.add('                                                                                        ');
      LSQL.add(' 	order by gp.cod_grupo_raiz, gp.desdobramento_pai, gp.desdobramento_filho, gp.descricao');

      LSQL.Text := StringReplace(LSQL.Text, ':vpDataInicial', LDataInicial, [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataFinal', LDataFinal, [rfReplaceAll]);

      dm.adicionaLog(LSQL.Text);

      dm_relatorios.qryRelInsumosProducao.active := false;
      dm_relatorios.qryRelInsumosProducao.sql.clear;
      dm_relatorios.qryRelInsumosProducao.sql.add(LSQL.Text);

      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relInsumosProducao.fr3', true);
      LFiltroPeriodo := 'De  ' + FormatDateTime('DD/MM/YYYY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YYYY', ed_data_final.Date);
      dm_relatorios.setPeriodoRelatorio(LFiltroPeriodo);

      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dm_relatorios.setVariavelRelatorio('V_GRUPO_SELECIONADO', ed_desc_grupo.Text);

      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryRelInsumosProducao.Active := false;

    except
      on E: Exception do
      begin

      end;

    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelInsumosProducao.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := StartOfTheMonth(Now);
  ed_data_final.Date := Now;
  ed_data_inicial.SetFocus;

end;

procedure TfrmRelInsumosProducao.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

end.

