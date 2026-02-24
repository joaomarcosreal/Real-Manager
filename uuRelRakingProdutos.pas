unit uuRelRakingProdutos;

interface

uses
  Windows, system.DateUtils, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uu_modelo_Vazio, Mask, StdCtrls, Buttons, ExtCtrls,

  cxGraphics, cxControls,
  cxLookAndFeelPainters,
  cxCheckComboBox, AdvGlassButton,

  Data.DB,
  FireDAC.Comp.Client, AdvDateTimePicker, cxCheckBox, cxLookAndFeels,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  PngSpeedButton, Vcl.Menus;

type
  TfrmRelRankingProdutos = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    GroupBox2: TGroupBox;
    ckbTodas: TCheckBox;
    ckbMesas: TCheckBox;
    ckbBalcao: TCheckBox;
    ckbDelivery: TCheckBox;
    GroupBox3: TGroupBox;
    ed_cod_grupo: TMaskEdit;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    ed_desc_grupo: TMaskEdit;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    rdTipoRanking: TRadioGroup;
    rdTipoCombo: TRadioGroup;
    PngSpeedButton1: TPngSpeedButton;
    function verificaValidade(): boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    procedure gerarRelatorio2;
    procedure gerarRelatorio;
    function QuotdSustenido(Astr: string): string;



    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRankingProdutos: TfrmRelRankingProdutos;
  tipo: smallint;

implementation

uses
  uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

function TfrmRelRankingProdutos.verificaValidade(): boolean;
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

  LModalidadeSelecionada := LModalidadeSelecionada or ckbTodas.Checked;
  LModalidadeSelecionada := LModalidadeSelecionada or ckbMesas.Checked;
  LModalidadeSelecionada := LModalidadeSelecionada or ckbBalcao.Checked;
  LModalidadeSelecionada := LModalidadeSelecionada or ckbDelivery.Checked;

  if (LModalidadeSelecionada = false) then
  begin
    exibe_painel_erro('Nenhuma modalidade de venda foi selecionada!', 'Ok');
    Result := false;
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



procedure TfrmRelRankingProdutos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelRankingProdutos.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelRankingProdutos.btSelecionarClick(Sender: TObject);
begin
  inherited;

  if verificaValidade then
  begin
    gerarRelatorio;
  end;

end;

function TfrmRelRankingProdutos.QuotdSustenido(Astr: string): string;
begin
  Astr := Chr(35) + Astr + Chr(35);
  Result := Astr;

end;

procedure TfrmRelRankingProdutos.gerarRelatorio();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LDataInicial, LDataFinal: string;
  LModalidades: string;
  LTotalFaturamento: Currency;
  i: integer;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;

  try

    try
      if cbEmpresas.States[0] = cbsChecked then
      begin
        for i := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[i] := cbsChecked;
      end;

      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      LDataInicial := Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.date));
      LDataFinal := Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.date));

      if ckbTodas.Checked = false then
      begin
        dm_relatorios.setVariavelRelatorio('V_MESAS', 'false');
        dm_relatorios.setVariavelRelatorio('V_BALCAO', 'false');
        dm_relatorios.setVariavelRelatorio('V_DELIVERY', 'false');

        if ckbMesas.Checked then
        begin
          LModalidades := LModalidades + '1,';
          dm_relatorios.setVariavelRelatorio('V_MESAS', 'true');
        end;

        if ckbBalcao.Checked then
        begin
          LModalidades := LModalidades + '2,';
          dm_relatorios.setVariavelRelatorio('V_BALCAO', 'true');
        end;

        if ckbDelivery.Checked then
        begin
          LModalidades := LModalidades + '3';
          dm_relatorios.setVariavelRelatorio('V_DELIVERY', 'true');
        end;
      end
      else
      begin
        dm_relatorios.setVariavelRelatorio('V_MESAS', 'true');
        dm_relatorios.setVariavelRelatorio('V_BALCAO', 'true');
        dm_relatorios.setVariavelRelatorio('V_DELIVERY', 'true');
      end;

      dm_relatorios.setVariavelRelatorio('V_APENAS_COMBOS', 'false');
      dm_relatorios.setVariavelRelatorio('V_TODOS_PRODUTOS', 'false');

      case rdTipoCombo.ItemIndex of
        0:
          begin
            dm_relatorios.setVariavelRelatorio('V_TODOS_PRODUTOS', 'true');
          end;
        1:
          begin
            dm_relatorios.setVariavelRelatorio('V_APENAS_COMBOS', 'true');
          end;
      end;

      if (copy(LModalidades, Length(LModalidades), 1) = ',') then
      begin
        LModalidades := copy(LModalidades, 0, Length(LModalidades) - 1);
      end;

      dm.executaSQL('ALTER SEQUENCE G_RANKING RESTART WITH 0;');
      LSQL.Clear;
      LSQL.Add('         select coalesce(sum(v.valor_bruto),0) as produtos, ');
      LSQL.Add('                coalesce(sum(v.valor_desconto),0) as descontos,');
      LSQL.Add('                coalesce(sum(v.valor_bruto - v.valor_desconto),0) as total');
      LSQL.Add('from vendas v ');
//      LSQL.Add('where cast((v.data ||' + Quotedstr(' ') + '||v.hora) as timestamp) between ' + LDataInicial + ' and ' + LDataFinal);
      LSQL.Add('where v.data  between ' + LDataInicial + ' and ' + LDataFinal);
      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and v.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')');
      end;
      dm.adicionaLog(LSQL.Text);
      dm.getMemTable(LTbAux, LSQL.Text);
      LTotalFaturamento := LTbAux.FieldByName('total').Value;
      dm_relatorios.setVariavelRelatorio('V_TOTAL_PRODUTOS', FormatFloat('R$ ###,###,##0.00 ', LTbAux.FieldByName('produtos').Value));
      dm_relatorios.setVariavelRelatorio('V_TOTAL_DESCONTOS', FormatFloat('R$ ###,###,##0.00 ', LTbAux.FieldByName('descontos').Value));
      dm_relatorios.setVariavelRelatorio('V_TOTAL', FormatFloat('R$ ###,###,##0.00 ', LTbAux.FieldByName('total').Value));

      LTbAux.Active := false;

      LSQL.Clear;
      LSQL.Add('select gen_id(g_ranking,1) as ranking , rk.* from (');
      LSQL.add('select mv.grupoRaiz,gRaiz.descricao as descGrupoRaiz,  ');
      LSQL.add('	mv.desdobramentoPai,mv.desdobramentoFilho,grupoPai,');
      LSQL.add('	gPai.descricao as descGrupoPai, mv.codGrupo, g.cod_grupo, g.descricao as descGrupo,');
      LSQL.add('	mv.cod_produto, mv.descricao, quantidade,custoMedio,');
      LSQL.add('	precoMedio,subtotal, custoTotal,');
      LSQL.add('	descontos,total,');
      LSQL.add('	margemMedia, margemTotal, markup,');
      LSQL.add('	((total * 100) / (cast(:vpTotalFat as numeric(10,2)) ) ) as percFat,');
      LSQL.add('	case Total    ');
      LSQL.add('		when 0 then 0                                                                                                                                       ');
      LSQL.add('	else                                                                                                                                                    ');
      LSQL.add('	((custoTotal * 100) / Total)                                                                                                                            ');
      LSQL.add('	end as CMV                                                                                                                                              ');
      LSQL.add('                                                                                                                                                          ');
      LSQL.add('                                                                                                                                                          ');
      LSQL.add('	from(                                                                                                                                                   ');
      LSQL.add('			select mv.cod_produto,mv.cod_grupo,mv.descricao,                                                                                                ');
      LSQL.add('				substring(mv.cod_grupo from 1 for 1) as grupoRaiz,                                                                                          ');
      LSQL.add('				substring(mv.cod_grupo from 2 for 2) as desdobramentoPai,                                                                                   ');
      LSQL.add('				substring(mv.cod_grupo from 4 for 3) as desdobramentoFilho,                                                                                 ');
      LSQL.add('				substring(mv.cod_grupo from 1 for 3) as grupoPai,                                                                                           ');
      LSQL.add('				mv.cod_grupo codGrupo,                                                                                                                      ');
      LSQL.add('				quantidade,precoMedio, custoMedio,                                                                                                          ');
      LSQL.add('				udf_roundAbnt ( (quantidade * custoMedio),3) as custoTotal,                                                                                 ');
      LSQL.add('				(precoMedio - custoMedio) as margemMedia,                                                                                                   ');
      LSQL.add('				udf_roundAbnt ( (quantidade * precoMedio),3) as subtotal,                                                                                   ');
      LSQL.add('				descontos,                                                                                                                                  ');
      LSQL.add('				udf_roundAbnt ( ( (quantidade * precoMedio) - descontos ),3) as total,                                                                      ');
      LSQL.add('				udf_roundAbnt( ( ((precoMedio - custoMedio) * quantidade) - descontos)  ,3) as MargemTotal,                                                 ');
      LSQL.add('				( (udf_roundAbnt( ( ((precoMedio - custoMedio) * quantidade) - descontos)  ,3)) / (udf_roundAbnt ( (quantidade * custoMedio),3))) as markup ');
      LSQL.add('                                                                                                                                                          ');
      LSQL.add('				from (                                                                                                                                      ');
      LSQL.add('						SELECT mv.cod_produto,p.descricao, p.cod_grupo,                                                                                     ');
      LSQL.add('								udf_roundabnt(SUM(mv.quantidade),5) as quantidade,                                                                          ');
      LSQL.add('							 udf_roundabnt( (SUM(mv.quantidade * mv.valor_unitario) / SUM(mv.quantidade))   ,5) as precoMedio,');
      LSQL.add('								sum(mv.desconto) as descontos,                                                                                              ');
      LSQL.add('								case  coalesce(avg(mv.custo),0)                                                                                             ');
      LSQL.add('								when 0 then 0.01                                                                                                            ');
      LSQL.add('								else                                                                                                                        ');
      LSQL.add('								coalesce(avg(mv.custo),0)                                                                                                   ');
      LSQL.add('								end    as custoMedio                                                                                                        ');
      LSQL.add('								FROM movimento_venda mv                                                                                                     ');
      LSQL.add('								inner join vendas v on((v.cod_venda = mv.cod_venda) and (v.cod_empresa = mv.cod_empresa) )                                                                       ');
      LSQL.add('								inner join produtos p on (p.cod_produto = mv.cod_produto)                                                                   ');
      LSQL.add('								where v.data  between ' + LDataInicial + '  and ' + LDataFinal);

      case rdTipoCombo.ItemIndex of
        1:
          LSQL.Add(' and coalesce(mv.id_combo,0) <> 0');
      end;

      //      LSQL.add('								where cast((v.data ||' + Quotedstr(' ') + '||v.hora) as timestamp) between ' + LDataInicial + '  and ' + LDataFinal);

      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LSQL.add('								and mv.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')                                                                                       ');
      end;

      if (ckbTodas.Checked = false) then
      begin
        LSQL.add('								and v.tipo_venda in (' + LModalidades + ') ');
      end;

      LSQL.add('								and p.cod_grupo starting with (' + Quotedstr(ed_cod_grupo.Text) + ')                                                                                          ');
      LSQL.add('								group by cod_produto, p.descricao, p.cod_grupo                                                                              ');
      LSQL.add('						) mv                                  ');
      LSQL.add('		) as mv                                                                                                                                             ');
      LSQL.add('		inner join grupos gRaiz on (gRaiz.cod_grupo = grupoRaiz)                                                                                            ');
      LSQL.add('		inner join grupos gPai on  (gPai.cod_grupo = grupoPai)                                                                                              ');
      LSQL.add('		inner join grupos g on     (g.cod_grupo = codGrupo)                                                                                                 ');
      LSQL.add('		order by ');

      case rdTipoRanking.ItemIndex of
        0:
          LSQL.add('quantidade desc');
        1:
          LSQL.add('total desc');
      end;
      LSQL.Add(') rk');

      LSQL.Text := StringReplace(LSQL.Text, ':vpTotalFat', dm.TrocaVirgPPto(Floattostr(LTotalFaturamento)), [rfReplaceAll, rfIgnoreCase]);
      dm.adicionaLog(LSQL.Text);
      dm_relatorios.qryRankingProdutos.SQL.Clear;
      dm_relatorios.qryRankingProdutos.SQL.Add(LSQL.Text);
      dm_relatorios.qryRankingProdutos.Active := true;
      dm.adicionaLog(LSQL.Text);
      dm_relatorios.rpt.Clear;
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelRankingProdutosVendidos.fr3', true);
      dm_relatorios.setPeriodoRelatorio('De  ' + FormatDateTime('DD/MM/YYYY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YYYY', ed_data_final.Date));
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dm_relatorios.setVariavelRelatorio('V_GRUPO_SELECIONADO', ed_desc_grupo.Text);
      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.rpt.Clear;
      dm_relatorios.qryRankingProdutos.Active := false;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gerar relatório' + sLineBreak + sLineBreak + E.Message, 'Ok');
        dm.adicionaLog('Erro ao gerar relatório de produtos vendidos');
        dm.adicionaLog('Erro: ' + E.Message);
        dm.adicionaLog(LSQL.Text);
        raise Exception.Create('Erro ao gerar o relatório!');

      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LEmpresasSelecionadas);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmRelRankingProdutos.gerarRelatorio2();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LDataInicial, LDataFinal: string;
  LModalidades: string;
  LTotalFaturamento: Currency;
  SQL: string;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;

  try

    try

      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      LDataInicial := (FormatDateTime('DD.MM.YYY', ed_data_inicial.date));
      LDataFinal := (FormatDateTime('DD.MM.YYY', ed_data_final.date));

      if ckbTodas.Checked = false then
      begin
        dm_relatorios.setVariavelRelatorio('V_MESAS', 'false');
        dm_relatorios.setVariavelRelatorio('V_BALCAO', 'false');
        dm_relatorios.setVariavelRelatorio('V_DELIVERY', 'false');

        if ckbMesas.Checked then
        begin
          LModalidades := LModalidades + '1,';
          dm_relatorios.setVariavelRelatorio('V_MESAS', 'true');
        end;

        if ckbBalcao.Checked then
        begin
          LModalidades := LModalidades + '2,';
          dm_relatorios.setVariavelRelatorio('V_BALCAO', 'true');
        end;

        if ckbDelivery.Checked then
        begin
          LModalidades := LModalidades + '3';
          dm_relatorios.setVariavelRelatorio('V_DELIVERY', 'true');
        end;
      end
      else
      begin
        dm_relatorios.setVariavelRelatorio('V_MESAS', 'true');
        dm_relatorios.setVariavelRelatorio('V_BALCAO', 'true');
        dm_relatorios.setVariavelRelatorio('V_DELIVERY', 'true');
      end;

      if (copy(LModalidades, Length(LModalidades), 1) = ',') then
      begin
        LModalidades := copy(LModalidades, 0, Length(LModalidades) - 1);
      end;

      LSQL.Clear;

      LSQL.Add('         select coalesce(sum(v.valor_bruto),0) as produtos, ');
      LSQL.Add('                coalesce(sum(v.valor_desconto),0) as descontos,');
      LSQL.Add('                coalesce(sum(v.valor_bruto - v.valor_desconto),0) as total');
      LSQL.Add('from vendas v ');
//      LSQL.Add('where cast((v.data ||' + Quotedstr(' ') + '||v.hora) as timestamp) between ' + LDataInicial + ' and ' + LDataFinal);
      LSQL.Add('where v.data  between ' + Quotedstr(LDataInicial) + ' and ' + Quotedstr(LDataFinal));
      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and v.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')');
      end;
      dm.adicionaLog(LSQL.Text);
      dm.getMemTable(LTbAux, LSQL.Text);
      LTotalFaturamento := LTbAux.FieldByName('total').Value;
      dm_relatorios.setVariavelRelatorio('V_TOTAL_PRODUTOS', FormatFloat('R$ ###,###,##0.00 ', LTbAux.FieldByName('produtos').Value));
      dm_relatorios.setVariavelRelatorio('V_TOTAL_DESCONTOS', FormatFloat('R$ ###,###,##0.00 ', LTbAux.FieldByName('descontos').Value));
      dm_relatorios.setVariavelRelatorio('V_TOTAL', FormatFloat('R$ ###,###,##0.00 ', LTbAux.FieldByName('total').Value));
      LTbAux.Active := false;

      SQL := SQL + sLineBreak + ('select gen_id(g_ranking,1) as ranking , rk.* from (');
      SQL := SQL + sLineBreak + ('select mv.grupoRaiz,gRaiz.descricao as descGrupoRaiz,  ');
      SQL := SQL + sLineBreak + ('	mv.desdobramentoPai,mv.desdobramentoFilho,grupoPai,');
      SQL := SQL + sLineBreak + ('	gPai.descricao as descGrupoPai, mv.codGrupo, g.cod_grupo, g.descricao as descGrupo,');
      SQL := SQL + sLineBreak + ('	mv.cod_produto, mv.descricao, quantidade,custoMedio,');
      SQL := SQL + sLineBreak + ('	precoMedio,subtotal, custoTotal,');
      SQL := SQL + sLineBreak + ('	descontos,total,');
      SQL := SQL + sLineBreak + ('	margemMedia, margemTotal, markup,');
      SQL := SQL + sLineBreak + ('	((total * 100) / (cast(:vpTotalFat as numeric(10,2)) ) ) as percFat,');
      SQL := SQL + sLineBreak + ('	case Total    ');
      SQL := SQL + sLineBreak + ('		when 0 then 0                                                                                                                                       ');
      SQL := SQL + sLineBreak + ('	else                                                                                                                                                    ');
      SQL := SQL + sLineBreak + ('	((custoTotal * 100) / Total)                                                                                                                            ');
      SQL := SQL + sLineBreak + ('	end as CMV                                                                                                                                              ');
      SQL := SQL + sLineBreak + ('                                                                                                                                                          ');
      SQL := SQL + sLineBreak + ('                                                                                                                                                          ');
      SQL := SQL + sLineBreak + ('	from(                                                                                                                                                   ');
      SQL := SQL + sLineBreak + ('			select mv.cod_produto,mv.cod_grupo,mv.descricao,                                                                                                ');
      SQL := SQL + sLineBreak + ('				substring(mv.cod_grupo from 1 for 1) as grupoRaiz,                                                                                          ');
      SQL := SQL + sLineBreak + ('				substring(mv.cod_grupo from 2 for 2) as desdobramentoPai,                                                                                   ');
      SQL := SQL + sLineBreak + ('				substring(mv.cod_grupo from 4 for 3) as desdobramentoFilho,                                                                                 ');
      SQL := SQL + sLineBreak + ('				substring(mv.cod_grupo from 1 for 3) as grupoPai,                                                                                           ');
      SQL := SQL + sLineBreak + ('				mv.cod_grupo codGrupo,                                                                                                                      ');
      SQL := SQL + sLineBreak + ('				quantidade,precoMedio, custoMedio,                                                                                                          ');
      SQL := SQL + sLineBreak + ('				udf_roundAbnt ( (quantidade * custoMedio),3) as custoTotal,                                                                                 ');
      SQL := SQL + sLineBreak + ('				(precoMedio - custoMedio) as margemMedia,                                                                                                   ');
      SQL := SQL + sLineBreak + ('				udf_roundAbnt ( (quantidade * precoMedio),3) as subtotal,                                                                                   ');
      SQL := SQL + sLineBreak + ('				descontos,                                                                                                                                  ');
      SQL := SQL + sLineBreak + ('				udf_roundAbnt ( ( (quantidade * precoMedio) - descontos ),3) as total,                                                                      ');
      SQL := SQL + sLineBreak + ('				udf_roundAbnt( ( ((precoMedio - custoMedio) * quantidade) - descontos)  ,3) as MargemTotal,                                                 ');
      SQL := SQL + sLineBreak + ('				( (udf_roundAbnt( ( ((precoMedio - custoMedio) * quantidade) - descontos)  ,3)) / (udf_roundAbnt ( (quantidade * custoMedio),3))) as markup ');
      SQL := SQL + sLineBreak + ('                                                                                                                                                          ');
      SQL := SQL + sLineBreak + ('				from (                                                                                                                                      ');
      SQL := SQL + sLineBreak + ('						SELECT mv.cod_produto,p.descricao, p.cod_grupo,                                                                                     ');
      SQL := SQL + sLineBreak + ('								udf_roundabnt(SUM(mv.quantidade),5) as quantidade,                                                                          ');
      SQL := SQL + sLineBreak + ('							 udf_roundabnt( (SUM(mv.quantidade * mv.valor_unitario) / SUM(mv.quantidade))   ,5) as precoMedio,');
      SQL := SQL + sLineBreak + ('								sum(mv.desconto) as descontos,                                                                                              ');
      SQL := SQL + sLineBreak + ('								case  coalesce(avg(mv.custo),0)                                                                                             ');
      SQL := SQL + sLineBreak + ('								when 0 then 0.01                                                                                                            ');
      SQL := SQL + sLineBreak + ('								else                                                                                                                        ');
      SQL := SQL + sLineBreak + ('								coalesce(avg(mv.custo),0)                                                                                                   ');
      SQL := SQL + sLineBreak + ('								end    as custoMedio                                                                                                        ');
      SQL := SQL + sLineBreak + ('								FROM movimento_venda mv                                                                                                     ');
      SQL := SQL + sLineBreak + ('								inner join vendas v on((v.cod_venda = mv.cod_venda) and (v.cod_empresa = mv.cod_empresa) )                                                                       ');
      SQL := SQL + sLineBreak + ('								inner join produtos p on (p.cod_produto = mv.cod_produto)                                                                   ');
      SQL := SQL + sLineBreak + ('								where v.data  between :vpDataInical  and :vpDataFinal  ');

      case rdTipoCombo.ItemIndex of
        1:
          SQL := SQL + sLineBreak + (' and coalesce(mv.id_combo,0) <> 0');
      end;

      //     SQL := SQL('								where cast((v.data ||' + Quotedstr(' ') + '||v.hora) as timestamp) between ' + LDataInicial + '  and ' + LDataFinal);

      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        SQL := SQL + sLineBreak + ('								and mv.cod_empresa in (:vpEmpresasSelecionadas )                                                                                       ');
      end;

      if (ckbTodas.Checked = false) then
      begin
        SQL := SQL + sLineBreak + ('								and v.tipo_venda in (:vpModalidadesVenda) ');
      end;

      SQL := SQL + sLineBreak + ('								and p.cod_grupo starting with (:vpCodGrupo)                                                                                          ');
      SQL := SQL + sLineBreak + ('								group by cod_produto, p.descricao, p.cod_grupo                                                                              ');
      SQL := SQL + sLineBreak + ('						) mv                                  ');
      SQL := SQL + sLineBreak + ('		) as mv                                                                                                                                             ');
      SQL := SQL + sLineBreak + ('		inner join grupos gRaiz on (gRaiz.cod_grupo = grupoRaiz)                                                                                            ');
      SQL := SQL + sLineBreak + ('		inner join grupos gPai on  (gPai.cod_grupo = grupoPai)                                                                                              ');
      SQL := SQL + sLineBreak + ('		inner join grupos g on     (g.cod_grupo = codGrupo)                                                                                                 ');
      SQL := SQL + sLineBreak + ('		order by ');

      case rdTipoRanking.ItemIndex of
        0:
          SQL := SQL + sLineBreak + ('quantidade desc');
        1:
          SQL := SQL + sLineBreak + ('total desc');
      end;

      SQL := SQL + sLineBreak + (') rk');

      SQL := StringReplace(SQL, ':vpTotalFat', dm.TrocaVirgPPto(Floattostr(LTotalFaturamento)), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, ':vpCodGrupo', QuotdSustenido(ed_cod_grupo.Text), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, ':vpModalidadesVenda', (LModalidades), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, ':vpEmpresasSelecionadas', (LEmpresasSelecionadas.selecionadas), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, ':vpDataInical', QuotdSustenido((LDataInicial)), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, ':vpDataFinal', QuotdSustenido(LDataFinal), [rfReplaceAll, rfIgnoreCase]);
      dm_relatorios.qryRankingProdutos.SQL.clear;
      dm_relatorios.qryRankingProdutos.SQL.Add('select * R_RANKING_PRODUTOS (' + SQL + ')');
      dm.adicionaLog(dm_relatorios.qryRankingProdutos.SQL.Text);
      dm_relatorios.qryRankingProdutos.Active := True;

      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\uuRelProdutosVendidos.fr3', true);
      dm_relatorios.setPeriodoRelatorio('De  ' + FormatDateTime('DD/MM/YYYY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YYYY', ed_data_final.Date));
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dm_relatorios.setVariavelRelatorio('V_GRUPO_SELECIONADO', ed_desc_grupo.Text);

      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryRankingProdutos.Active := false;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gerar relatório' + sLineBreak + sLineBreak + E.Message, 'Ok');
        dm.adicionaLog('Erro ao gerar relatório de produtos vendidos');
        dm.adicionaLog('Erro: ' + E.Message);
        dm.adicionaLog(LSQL.Text);
        raise Exception.Create('Erro ao gerar o relatório!');

      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LEmpresasSelecionadas);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmRelRankingProdutos.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelRankingProdutos.cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
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

procedure TfrmRelRankingProdutos.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := StartOfTheMonth(Now);
  ed_data_final.Date := Now;
  ed_data_inicial.SetFocus;
  tipo := 0;
end;

procedure TfrmRelRankingProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

end.

