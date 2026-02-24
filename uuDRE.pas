unit uuDRE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RealFramework, uuDMDRE, System.DateUtils, Dialogs,
  uu_modelo_Vazio, cxStyles, cxGraphics, acbrutil, DB, cxClasses, cxControls,
  cxGridDBTableView, cxGrid, StdCtrls, Buttons, Menus, DBCtrls, ComCtrls,
  Mask, ExtCtrls, cxGridLevel, AdvGlassButton,
  cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, AdvDateTimePicker, cxCheckBox,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,
  cxCustomData, cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations,
  dxBarBuiltInMenu, cxPC, sPageControl;

type
  TFrmDRE = class(Tfrm_modelo_vazio)
    pn_principal: TPanel;
    pn_codigo: TPanel;
    bt_pesquisa: TSpeedButton;
    ed_codigo: TMaskEdit;
    pn_botoes: TPanel;
    bt_novo: TBitBtn;
    bt_alterar: TBitBtn;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_excluir: TBitBtn;
    bt_consultar: TBitBtn;
    Panel2: TPanel;
    Panel1: TPanel;
    sv: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Detalhar1: TMenuItem;
    ListagemdeInsumoscomprados1: TMenuItem;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    lbTitulo: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1COD_GRUPO: TcxGridDBColumn;
    cxGrid1DBTableView1GRUPO: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_MES: TcxGridDBColumn;
    cxGrid1DBTableView1CMV_MES: TcxGridDBColumn;
    cxGrid1DBTableView1CMV_MES_ANT: TcxGridDBColumn;
    cxGrid1DBTableView1CMV_ANO_ANT: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_MES_ANTERIOR: TcxGridDBColumn;
    cxGrid1DBTableView1CRE_MES_ANT: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_ANO_ANTERIOR: TcxGridDBColumn;
    cxGrid1DBTableView1CRE_ANO_ANT: TcxGridDBColumn;
    cxGrid1DBTableView1P_DESP_MES: TcxGridDBColumn;
    cxGrid1DBTableView1P_DESP_M_ANTERIOR: TcxGridDBColumn;
    cxGrid1DBTableView1P_DESP_A_ANTERIOR: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    AdvGlassButton3: TAdvGlassButton;
    btImprimirInventario: TAdvGlassButton;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    btSelecionar: TAdvGlassButton;
    GroupBox3: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure exibeNotasLancamento(detalhado: boolean);
    procedure Detalhar1Click(Sender: TObject);
    procedure ListagemdeInsumoscomprados1Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure btImprimirInventarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAnoChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
  private
    procedure gerarNovoDRE;
    procedure getSQLDRE(ALSQL: TStringlist);
    procedure getSQLFaturamentos(ALSQL: TStringlist);
    procedure ConfiguraDatas;
    function ValidarDatas: boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDRE: TFrmDRE;

implementation

uses
  uu_data_module, uu_frm_principal, UU_DM_RELATORIOS, uuDmRelatorios,
  uuRelLancamentosNotas;

{$R *.dfm}

procedure TFrmDRE.gerarNovoDRE;
var
  LSQL: TStringList;
  dataInicial, dataFinal: TDate;
  dataInicialMesAnterior, dataFinalMesAnterior: TDate;
  dataInicialAnoAnterior, dataFinalAnoAnterior: TDate;
  nomeMesAtual, nomeMesAnterior, nomeMesAnoAnterior: string;
  StrData: string;
  LPrimeiroDiaSelecao: integer;
  LUltimoDiaSelecao: integer;
  LUltimoDiaMesAtual: integer;
  LUltimoDiaMesAnterior: integer;
  LUltimoDiaAnoAnterior: integer;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  I: integer;
  LDataTemp: TDate;
begin

  LSQL := TstringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;
  try
    try

      if cbEmpresas.States[0] = cbsChecked then
      begin
        for I := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[I] := cbsChecked;
      end;
      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);

      dataInicial := edDataInicial.Date; //StartOfAMonth(StrToInt(cbAno.text), cbMes.ItemIndex + 1);
      dataFinal := edDataFinal.Date; //  EndOfTheMonth(dataInicial);
      LPrimeiroDiaSelecao := StrToInt(FormatDateTime('DD', dataInicial));
      LUltimoDiaSelecao := StrToInt(FormatDateTime('DD', dataFinal));
      LUltimoDiaMesAtual := StrToInt(FormatDateTime('DD', EndOfTheMonth(dataInicial)));

      LUltimoDiaMesAnterior := StrToInt(FormatDateTime('DD', EndOfTheMonth(IncMonth(dataInicial, -1))));

      // Testa se é fevereiro e se o ano é bissexto.
      if ((FormatDateTime('MM', dataInicial) = '02') and (FormatDateTime('DD', dataFinal) = '29')) then
      begin
//        LDataTemp := IncYear(dataInicial, -1);
        LUltimoDiaAnoAnterior := 28
      end
      else
        LUltimoDiaAnoAnterior := StrToInt(FormatDateTime('DD', EndOfTheMonth(IncYear(dataInicial, -1))));

      if LUltimoDiaSelecao = LUltimoDiaMesAtual then
      begin
        StrData := formatDateTime('DD', edDataInicial.date) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncMonth(dataInicial, -1)));
        dataInicialMesAnterior := StrToDate(StrData);
        dataFinalMesAnterior := EndOfTheMonth(IncMonth(dataInicial, -1));

      end
      else
      begin
        StrData := FormatFloat('00', LPrimeiroDiaSelecao) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncMonth(dataInicial, -1)));
        dataInicialMesAnterior := StrToDate(StrData);

        if (LUltimoDiaSelecao > LUltimoDiaMesAnterior) then
        begin
          StrData := FormatFloat('00', LUltimoDiaMesAnterior) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncMonth(dataInicial, -1)));
          dataFinalMesAnterior := StrToDate(StrData);
        end
        else
        begin
          StrData := FormatFloat('00', LUltimoDiaSelecao) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncMonth(dataInicial, -1)));
          dataFinalMesAnterior := StrToDate(StrData);
        end;

      end;

      if LUltimoDiaSelecao = LUltimoDiaAnoAnterior then
      begin
        StrData := formatDateTime('DD', edDataInicial.date) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncYear(dataInicial, -1)));
        dataInicialAnoAnterior := StrToDate(StrData);
        dataFinalAnoAnterior := EndOfTheMonth(IncYear(dataInicial, -1));
      end
      else
      begin
        StrData := FormatFloat('00', LPrimeiroDiaSelecao) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncYear(dataInicial, -1)));
        dataInicialAnoAnterior := StrToDate(StrData);

        if (LUltimoDiaSelecao > LUltimoDiaAnoAnterior) then
        begin
          if ((FormatDateTime('MM', dataInicial) = '02') and (FormatDateTime('DD', dataFinal) = '29')) then
          begin
            StrData := FormatFloat('00', 28) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncYear(dataInicial, -1)));
            dataFinalAnoAnterior := StrToDate(StrData);
          end
          else
          begin
            StrData := FormatFloat('00', LUltimoDiaMesAnterior) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncYear(dataInicial, -1)));
            dataFinalAnoAnterior := StrToDate(StrData);
          end;

        end
        else
        begin
          StrData := FormatFloat('00', LUltimoDiaSelecao) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncYear(dataInicial, -1)));
          dataFinalAnoAnterior := StrToDate(StrData);
        end;

      end;

//      StrData := formatDateTime('DD', edDataInicial.date) + '/' + FormatDateTime('MM/YYY', StartOfTheMonth(IncYear(dataInicial, -1)));
//      dataInicialAnoAnterior := StrToDate(StrData);
//      dataFinalAnoAnterior := EndOfTheMonth(IncYear(dataInicial, -1));

      nomeMesAtual := UpperCase(FormatDateTime('MMM', dataInicial)) + ' / ' + FormatDateTime('YYY', dataInicial);
      nomeMesAnterior := UpperCase(FormatDateTime('MMM', dataInicialMesAnterior)) + ' / ' + FormatDateTime('YYY', dataInicialMesAnterior);
      nomeMesAnoAnterior := UpperCase(FormatDateTime('MMM', dataInicialAnoAnterior)) + ' / ' + FormatDateTime('YYY', dataInicialAnoAnterior);

      LSQL.Clear;
      getSQLFaturamentos(LSQL);

      LSQL.Text := StringReplace(LSQL.Text, ':vpdata1', Quotedstr(FormatDateTime('DD.MM.YYY', dataInicial)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata2', Quotedstr(FormatDateTime('DD.MM.YYY', dataFinal)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata3', Quotedstr(FormatDateTime('DD.MM.YYY', dataInicialMesAnterior)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata4', Quotedstr(FormatDateTime('DD.MM.YYY', dataFinalMesAnterior)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata5', Quotedstr(FormatDateTime('DD.MM.YYY', dataInicialAnoAnterior)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata6', Quotedstr(FormatDateTime('DD.MM.YYY', dataFinalAnoAnterior)), [rfReplaceAll]);

      dm.adicionaLog(LSQL.Text);

      dmDRE.qryResumoDRE.Active := false;
      dmDRE.qryResumoDRE.SQL.Clear;
      dmDRE.qryResumoDRE.SQL.Add(LSQL.Text);
      dmDRE.qryResumoDRE.Active := true;

      LSQL.clear;
      getSQLDRE(LSQL);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata1', Quotedstr(FormatDateTime('DD.MM.YYY', dataInicial)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata2', Quotedstr(FormatDateTime('DD.MM.YYY', dataFinal)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata3', Quotedstr(FormatDateTime('DD.MM.YYY', dataInicialMesAnterior)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata4', Quotedstr(FormatDateTime('DD.MM.YYY', dataFinalMesAnterior)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata5', Quotedstr(FormatDateTime('DD.MM.YYY', dataInicialAnoAnterior)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpdata6', Quotedstr(FormatDateTime('DD.MM.YYY', dataFinalAnoAnterior)), [rfReplaceAll]);

      LSQL.Text := StringReplace(LSQL.Text, ':fat1', dm.TrocaVirgPPto(dmDRE.qryResumoDRE.FieldByName('fat_mes_atual').Value), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':fat2', dm.TrocaVirgPPto(dmDRE.qryResumoDRE.FieldByName('fat_mes_anterior').Value), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':fat3', dm.TrocaVirgPPto(dmDRE.qryResumoDRE.FieldByName('fat_ano_anterior').Value), [rfReplaceAll]);
      dm.adicionaLog(LSQL.Text);

      dmDRE.qryDRE.Active := false;
      dmDRE.qryDRE.SQL.Clear;
      dmDRE.qryDRE.SQL.Add(LSQL.Text);
      dmDRE.qryDRE.Active := true;

      dm_relatorios.rpt.Clear;

      dm_relatorios.setVariavelRelatorio('V_NOME_MES_ATUAL', nomeMesAtual);
      dm_relatorios.setVariavelRelatorio('V_NOME_MES_ANTERIOR', nomeMesAnterior);
      dm_relatorios.setVariavelRelatorio('V_NOME_MES_ANO_ANTERIOR', nomeMesAnoAnterior);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gerar o DRE: ' + E.Message, 'Ok');
        raise Exception.Create('Erro ao gerar o DRE: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TFrmDRE.getSQLDRE(ALSQL: TStringlist);
begin



  ALSQL.add(' select cod_grupo,grupo, total_mes,                                                                                                                                             ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('          udf_roundabnt(((total_mes * 100) /:fat1),3) as CMV_MES,                                                                                                               ');
  ALSQL.add('          udf_roundabnt(((total_mes_anterior * 100) / :fat2),3) as CMV_MES_ANT,                                                                                                 ');
  ALSQL.add('          udf_roundabnt(((total_ano_anterior * 100) / :fat3),3) as CMV_ANO_ANT,                                                                                                 ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('          total_mes_anterior,                                                                                                                                                   ');
  ALSQL.add('          case total_mes                                                                                                                                                        ');
  ALSQL.add('             when  0  then                                                                                                                                                      ');
  ALSQL.add('              0                                                                                                                                                                 ');
  ALSQL.add('            else                                                                                                                                                                ');
  ALSQL.add('             udf_roundabnt( ( ( ( (total_mes - total_mes_anterior) * 100) / case  coalesce(total_mes_anterior,1) when 0 then 100 else coalesce(total_mes_anterior,1) end  )),3) ');
  ALSQL.add('          end as cre_mes_ant,                                                                                                                                                   ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('          total_ano_anterior,                                                                                                                                                   ');
  ALSQL.add('          case total_mes                                                                                                                                                        ');
  ALSQL.add('             when  0  then                                                                                                                                                      ');
  ALSQL.add('              0                                                                                                                                                                 ');
  ALSQL.add('            else                                                                                                                                                                ');
  ALSQL.add('             udf_roundabnt( ( ( ( (total_mes -total_ano_anterior) * 100) / case coalesce(total_ano_anterior,1) when 0 then 100 else coalesce(total_ano_anterior,1) end  )),3)   ');
  ALSQL.add('          end as cre_ano_ant ,                                                                                                                                                  ');
  ALSQL.add('        case total_despesas_mes                                                                                                                                                 ');
  ALSQL.add('           when  0  then                                                                                                                                                        ');
  ALSQL.add('            0                                                                                                                                                                   ');
  ALSQL.add('          else                                                                                                                                                                  ');
  ALSQL.add('           udf_roundabnt( ( ( ( (total_mes ) * 100) / coalesce(total_despesas_mes,1) )),3)                                                                                      ');
  ALSQL.add('        end as P_DESP_MES,                                                                                                                                                      ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('        case total_despesas_mes_anterior                                                                                                                                        ');
  ALSQL.add('           when  0  then                                                                                                                                                        ');
  ALSQL.add('            100                                                                                                                                                                 ');
  ALSQL.add('          else                                                                                                                                                                  ');
  ALSQL.add('           udf_roundabnt( ( ( ( (total_mes_anterior ) * 100) / coalesce(total_despesas_mes_anterior,1) )),3)                                                                    ');
  ALSQL.add('        end as P_DESP_M_ANTERIOR,                                                                                                                                               ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('      case total_despesas_ano_anterior                                                                                                                                          ');
  ALSQL.add('           when  0  then                                                                                                                                                        ');
  ALSQL.add('            100                                                                                                                                                                 ');
  ALSQL.add('          else                                                                                                                                                                  ');
  ALSQL.add('           udf_roundabnt( ( ( ( (total_ano_anterior ) * 100) / coalesce(total_despesas_ano_anterior,1) )),3)                                                                    ');
  ALSQL.add('        end as P_DESP_A_ANTERIOR                                                                                                                                                ');
  ALSQL.add('    from (                                                                                                                                                                      ');
  ALSQL.add('             select r.cod_formatado cod_grupo, r.descricao as grupo,                                                                                                            ');
  ALSQL.add('                       (select coalesce(sum(itr.valor),0)                                                                                                                       ');
  ALSQL.add('                          from itens_lancamento_rd itr                                                                                                                          ');
  ALSQL.add('                               inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                                                    ');
  ALSQL.add('                               inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                                                    ');
  ALSQL.add('                                 where                                                                                                                                          ');
  ALSQL.add('                                 cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                                       ');
  ALSQL.add('                                 lr.data_rd between :vpdata1 and :vpdata2                                                                                                       ');
  ALSQL.add('                                  and itr.cod_grupo starting with (r.cod_grupo)                                                                                                 ');
  ALSQL.add('                              ) as total_mes,                                                                                                                                   ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('                       (select coalesce(sum(itr.valor),0)                                                                                                                       ');
  ALSQL.add('                          from itens_lancamento_rd itr                                                                                                                          ');
  ALSQL.add('                               inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                                                    ');
  ALSQL.add('                               inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                                                    ');
  ALSQL.add('                                 where                                                                                                                                          ');
  ALSQL.add('                                 cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                                       ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('                                 lr.data_rd between  :vpdata3 and :vpdata4                                                                                                      ');
  ALSQL.add('                                  and itr.cod_grupo  starting with (r.cod_grupo)                                                                                                ');
  ALSQL.add('                              ) as total_mes_anterior,                                                                                                                          ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('             (select coalesce(sum(itr.valor),0)                                                                                                                                 ');
  ALSQL.add('                          from itens_lancamento_rd itr                                                                                                                          ');
  ALSQL.add('                               inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                                                    ');
  ALSQL.add('                               inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                                                    ');
  ALSQL.add('                                 where                                                                                                                                          ');
  ALSQL.add('                                 cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                                       ');
  ALSQL.add('                                  lr.data_rd between  :vpdata5 and :vpdata6                                                                                                     ');
  ALSQL.add('                                  and itr.cod_grupo starting with (r.cod_grupo)                                                                                                 ');
  ALSQL.add('                              ) as total_ano_anterior,                                                                                                                          ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('             (select sum(lr.total)                                                                                                                                              ');
  ALSQL.add('                 from lancamentos_rd lr                                                                                                                                         ');
  ALSQL.add('                 inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                                                                  ');
  ALSQL.add('                 where                                                                                                                                                          ');
  ALSQL.add('                  cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                                                      ');
  ALSQL.add('                 lr.data_rd between :vpdata1 and :vpdata2                                                                                                                       ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('              ) as total_despesas_mes,                                                                                                                                          ');
  ALSQL.add('             (select sum(lr.total)                                                                                                                                              ');
  ALSQL.add('                 from lancamentos_rd lr                                                                                                                                         ');
  ALSQL.add('              inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                                                                     ');
  ALSQL.add('                 where                                                                                                                                                          ');
  ALSQL.add('                  cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                                                      ');
  ALSQL.add('                  lr.data_rd between :vpdata3 and :vpdata4                                                                                                                      ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('              ) as total_despesas_mes_anterior,                                                                                                                                 ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('             (select sum(lr.total)                                                                                                                                              ');
  ALSQL.add('                 from lancamentos_rd lr                                                                                                                                         ');
  ALSQL.add('                   inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                                                                ');
  ALSQL.add('                   where                                                                                                                                                        ');
  ALSQL.add('                    cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                                                    ');
  ALSQL.add('                    lr.data_rd between :vpdata5 and :vpdata6                                                                                                                    ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('              ) as total_despesas_ano_anterior                                                                                                                                  ');
  ALSQL.add('                                                                                                                                                                                ');
  ALSQL.add('                from r_grupos_rd r  where r.mostra_rd = 1                                                                                                                       ');
  ALSQL.add('               )                                                                                                                                                                ');

  dm.adicionaLog(ALSQL.Text);
end;

procedure TFrmDRE.getSQLFaturamentos(ALSQL: TStringlist);
begin
  ALSQL.add('select res.*,                                                                                                                    ');
  ALSQL.add('        case res_mes_anterior                                                                                                  ');
  ALSQL.add('                when 0 then 100                                                                                                ');
  ALSQL.add('                else                                                                                                           ');
  ALSQL.add('                   udf_roundabnt( ( ( ( (res_mes_atual - res_mes_anterior) * 100) / coalesce(res_mes_anterior,1) )),3)         ');
  ALSQL.add('              end as CRES_RES_MES_ANT,                                                                                         ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('      case res_ano_anterior                                                                                                    ');
  ALSQL.add('                when 0 then 100                                                                                                ');
  ALSQL.add('                else                                                                                                           ');
  ALSQL.add('                   udf_roundabnt( ( ( ( (res_mes_atual - res_ano_anterior) * 100) / coalesce(res_ano_anterior,1) )),3)         ');
  ALSQL.add('              end as CRES_RES_ANO_ANT,                                                                                         ');
  ALSQL.add('        case fat_mes_atual                                                                                                     ');
  ALSQL.add('                when 0 then 100                                                                                                ');
  ALSQL.add('                else                                                                                                           ');
  ALSQL.add('                   udf_roundabnt( ( ( ( (desp_mes_atual) * 100) / coalesce(fat_mes_atual,1) )),3)                              ');
  ALSQL.add('              end as PERC_FAT_DESP_MES_ATUAL,                                                                                  ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('       case fat_mes_anterior                                                                                                   ');
  ALSQL.add('                when 0 then 100                                                                                                ');
  ALSQL.add('                else                                                                                                           ');
  ALSQL.add('                   udf_roundabnt( ( ( ( (desp_mes_anterior) * 100) / coalesce(fat_mes_anterior,1) )),3)                        ');
  ALSQL.add('              end as PERC_FAT_DESP_MES_ANTERIOR,                                                                               ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('       case fat_ano_anterior                                                                                                   ');
  ALSQL.add('                when 0 then 100                                                                                                ');
  ALSQL.add('                else                                                                                                           ');
  ALSQL.add('                   udf_roundabnt( ( ( ( (desp_ano_anterior) * 100) / coalesce(fat_ano_anterior,1) )),3)                        ');
  ALSQL.add('              end as PERC_FAT_DESP_ANO_ANTERIOR                                                                                ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('    from                                                                                                                       ');
  ALSQL.add('  (                                                                                                                            ');
  ALSQL.add('  select fat_mes_atual,desp_mes_atual,                                                                                         ');
  ALSQL.add('       (fat_mes_atual - desp_mes_atual) as res_mes_atual,                                                                      ');
  ALSQL.add('       udf_roundabnt(( ( (fat_mes_atual - desp_mes_atual) * 100) / fat_mes_atual),3) as res_perc_mes_atual,                    ');
  ALSQL.add('       fat_mes_anterior, desp_mes_anterior,                                                                                    ');
  ALSQL.add('      (fat_mes_anterior - desp_mes_anterior) as res_mes_anterior,                                                              ');
  ALSQL.add('      udf_roundabnt(( ( (fat_mes_anterior - desp_mes_anterior) * 100) / fat_mes_anterior),3) as res_perc_mes_anterior,         ');
  ALSQL.add('  fat_ano_anterior, desp_ano_anterior,                                                                                         ');
  ALSQL.add('      (fat_ano_anterior - desp_ano_anterior) as res_ano_anterior,                                                              ');
  ALSQL.add('      udf_roundabnt(( ( (fat_ano_anterior - desp_ano_anterior) * 100) / fat_ano_anterior),3) as res_perc_ano_anterior,         ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('             case fat_mes_anterior                                                                                             ');
  ALSQL.add('               when 0 then 100                                                                                                 ');
  ALSQL.add('               else                                                                                                            ');
  ALSQL.add('                  udf_roundabnt( ( ( ( (fat_mes_atual - fat_mes_anterior) * 100) / coalesce(fat_mes_anterior,1) )),3)          ');
  ALSQL.add('             end as CRESC_FAT_MES_ANT,                                                                                         ');
  ALSQL.add('            case fat_ano_anterior                                                                                              ');
  ALSQL.add('               when 0 then 100                                                                                                 ');
  ALSQL.add('               else                                                                                                            ');
  ALSQL.add('                  udf_roundabnt( ( ( ( (fat_mes_atual - fat_ano_anterior) * 100) / coalesce(fat_ano_anterior,1) )),3)          ');
  ALSQL.add('             end as CRESC_FAT_AN_ANTERIOR,                                                                                     ');
  ALSQL.add('            case desp_mes_anterior                                                                                             ');
  ALSQL.add('               when 0 then 100                                                                                                 ');
  ALSQL.add('               else                                                                                                            ');
  ALSQL.add('                  udf_roundabnt( ( ( ( (desp_mes_atual - desp_mes_anterior) * 100) / coalesce(desp_mes_anterior,1) )),3)       ');
  ALSQL.add('             end as CRESC_DESP_MES_ANTERIOR,                                                                                   ');
  ALSQL.add('            case desp_ano_anterior                                                                                             ');
  ALSQL.add('               when 0 then 100                                                                                                 ');
  ALSQL.add('               else                                                                                                            ');
  ALSQL.add('                  udf_roundabnt( ( ( ( (desp_mes_atual - desp_ano_anterior) * 100) / coalesce(desp_ano_anterior,1) )),3)       ');
  ALSQL.add('         end as CRESC_DESP_ANO_ANTERIOR                                                                                        ');
  ALSQL.add('       from                                                                                                                    ');
  ALSQL.add('       (                                                                                                                       ');
  ALSQL.add('        select first 1                                                                                                         ');
  ALSQL.add('        (select coalesce(sum(rec.valor),0.1)                                                                                   ');
  ALSQL.add('            from recebimentos rec                                                                                              ');
  ALSQL.add('              where                                                                                                            ');
  ALSQL.add('       rec.cod_empresa in (select se.cod_empresa from selecao_empresas se) and                                                 ');
  ALSQL.add('              rec.data between :vpdata1 and :vpdata2) as fat_mes_atual,                                                        ');
  ALSQL.add('        (select coalesce(sum(rec.valor),0.1)                                                                                   ');
  ALSQL.add('            from recebimentos rec                                                                                              ');
  ALSQL.add('              where                                                                                                            ');
  ALSQL.add('       rec.cod_empresa in (select se.cod_empresa from selecao_empresas se) and                                                 ');
  ALSQL.add('              rec.data between :vpdata3 and :vpdata4) as fat_mes_anterior,                                                     ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('        (select coalesce(sum(rec.valor),0.1)                                                                                   ');
  ALSQL.add('            from recebimentos rec                                                                                              ');
  ALSQL.add('              where                                                                                                            ');
  ALSQL.add('       rec.cod_empresa in (select se.cod_empresa from selecao_empresas se) and                                                 ');
  ALSQL.add('              rec.data between :vpdata5 and :vpdata6) as fat_ano_anterior,                                                     ');
  ALSQL.add('      (select coalesce(sum(itr.valor ),0.1)                                                                                    ');
  ALSQL.add('  from itens_lancamento_rd itr                                                                                                 ');
  ALSQL.add('       inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                           ');
  ALSQL.add('       inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                           ');
  ALSQL.add('       where                                                                                                                   ');
  ALSQL.add('       cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                ');
  ALSQL.add('       lr.data_rd between :vpdata1 and :vpdata2) as desp_mes_atual,                                                            ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('      (select coalesce(sum(itr.valor ),0.1)                                                                                    ');
  ALSQL.add('  from itens_lancamento_rd itr                                                                                                 ');
  ALSQL.add('       inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                           ');
  ALSQL.add('       inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                           ');
  ALSQL.add('       where                                                                                                                   ');
  ALSQL.add('       cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                ');
  ALSQL.add('       lr.data_rd between :vpdata3 and :vpdata4) as desp_mes_anterior,                                                         ');
  ALSQL.add('                                                                                                                               ');
  ALSQL.add('      (select coalesce(sum(itr.valor ),0.1)                                                                                    ');
  ALSQL.add('  from itens_lancamento_rd itr                                                                                                 ');
  ALSQL.add('       inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                           ');
  ALSQL.add('       inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar)                                                           ');
  ALSQL.add('       where                                                                                                                   ');
  ALSQL.add('       cp.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se) and                                                ');
  ALSQL.add('       lr.data_rd between :vpdata5 and :vpdata6) as desp_ano_anterior                                                          ');
  ALSQL.add('           from parametros p                                                                                                   ');
  ALSQL.add('        )) res                                                                                                                 ');
  ALSQL.add('                                                                                                                               ');

  dm.adicionaLog(ALSQL.Text);
end;

procedure TFrmDRE.FormActivate(Sender: TObject);
begin
  inherited;
  carregaComboAnos(cbAno);
  carregaComboMeses(cbMes);
  cbMes.SetFocus();
  ConfiguraDatas;

end;

procedure TFrmDRE.FormCreate(Sender: TObject);
begin
  inherited;
  dmDRE := TdmDRE.Create(self);
  carregaDadosCombo(cbEmpresas, tiEmpresas);
  ;
end;

procedure TFrmDRE.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmDRE);
end;

procedure TFrmDRE.ListagemdeInsumoscomprados1Click(Sender: TObject);
var
  dataInicial, dataFinal: TDate;
  codGrupo: string;
begin

  dataInicial := StartOfAMonth(StrToInt(cbAno.text), cbMes.ItemIndex + 1);
  dataFinal := EndOfTheMonth(dataInicial);

  codGrupo := trim(RemoveStrings(dmDRE.qryDRE.fieldbyname('cod_grupo').Value, ['.']));
  dRelatorios.qryRelItensCompraRDGrupo.Active := false;
  dRelatorios.qryRelItensCompraRDGrupo.sql.Clear;
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   select vi.cod_g_raiz,vi.desc_g_raiz, vi.cod_g_pai, vi.desc_g_pai, vi.cod_grupo, vi.desc_grupo,  ');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          ie.cod_item, vi.descricao_item,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          sum(ie.quantidade) as quantidade, ');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          (sum( (ie.quantidade * ie.custo_medio) + ie.outras_despesas - ie.desconto ) /   sum(ie.quantidade) ) as custo_medio,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          sum( (ie.quantidade * ie.custo_medio) + ie.outras_despesas - ie.desconto ) as total');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('             from v_itens_entrada ie');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                inner join contas_a_pagar cpg on (cpg.codigo_entrada = ie.cod_entrada)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                inner join lancamentos_rd lr  on (lr.cod_ct_pagar = cpg.codigo)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                inner join v_itens_estoque vi on (vi.cod_item = ie.cod_item)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                where cpg.cod_emp_grupo in (select se.cod_empresa from selecao_empresas se)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                and  lr.status <> 2  and');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                 lr.data_rd between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', dataInicial)));
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                   and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', dataFinal)));
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                      and vi.cod_grupo starting  ' + Quotedstr(codGrupo));
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   group by ie.cod_item, vi.descricao_item,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   vi.cod_g_raiz, vi.desc_g_raiz,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   vi.cod_g_pai, vi.desc_g_pai ,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   vi.cod_grupo, vi.desc_grupo');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   order by vi.cod_g_raiz,vi.cod_g_pai,vi.cod_grupo, ie.cod_item');
  dm.adicionaLog(dRelatorios.qryRelItensCompraRDGrupo.sql.Text);
  dRelatorios.qryRelItensCompraRDGrupo.Active := true;
  dRelatorios.setPeriodoRelatorio('De  ' + DateToStr(dataInicial) + '  até  ' + DateToStr(dataFinal));
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relItensCompraRD.fr3', true);
  dRelatorios.rpt.ShowReport(true);

end;

procedure TFrmDRE.ConfiguraDatas();
begin
  edDataInicial.Date := StartOfAMonth(StrToInt(cbAno.text), cbMes.ItemIndex + 1);
  edDataFinal.Date := EndOfTheMonth(edDataInicial.Date);

end;

procedure TFrmDRE.BitBtn2Click(Sender: TObject);
begin
  inherited;
//  sv.Execute;
//  if sv.FileName <> '' then
//  begin
//    if FilesExists(sv.FileName) then
//    begin
//
//      if (MessageBox(0, 'Arquivo já existe, deseja sobrescrevê-lo ?', 'Sobrescrever arquivo ?', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
//      begin
//        DeleteFile(sv.FileName);
//        dm.ExportaDatasetExcel(dm.qryProjecaoDespesasRD, sv.FileName);
//        Showmessage(' Arquivo salvo com sucesso!');
//      end;
//    end
//    else
//    begin
//      dm.ExportaDatasetExcel(dm.qryProjecaoDespesasRD, sv.FileName);
//      Showmessage(' Arquivo salvo com sucesso!');
//    end;
//  end;

end;

procedure TFrmDRE.btImprimirInventarioClick(Sender: TObject);
begin
  inherited;
  if ValidarDatas then
  begin
    gerarNovoDRE;
    dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relDRE.fr3', true);
    dm_relatorios.rpt.ShowReport(true);
    dmDRE.qryDRE.Active := false;
    dmDRE.qryResumoDRE.Active := false;
  end;

end;

procedure TFrmDRE.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if ValidarDatas then
  begin
    gerarNovoDRE;
  end;
end;

function TFrmDRE.ValidarDatas(): boolean;
var
  LMesInicial, LMesFinal: integer;
begin
  result := false;
  if edDataInicial.date > edDataFinal.date then
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Data inicial não pode ser maior que data final!', 22, false);
    result := false;
    exit;
  end;

  LMesInicial := StrToInt(formatDateTime('MM', edDataInicial.date));
  LMesFinal := StrToInt(formatDateTime('MM', edDataFInal.date));

  if LMesInicial <> LMesFinal then
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Intervalo de dadas escolhido deve ser no mesmo mês!', 22, false);
    result := false;
    exit;
  end;

  result := true;

end;

procedure TFrmDRE.Button1Click(Sender: TObject);
begin
  inherited;
  gerarNovoDRE;
end;

procedure TFrmDRE.cbAnoChange(Sender: TObject);
begin
  inherited;
  ConfiguraDatas;
end;

procedure TFrmDRE.cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
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

procedure TFrmDRE.cbMesChange(Sender: TObject);
begin
  inherited;
  ConfiguraDatas;
end;

procedure TFrmDRE.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmDRE.exibeNotasLancamento(detalhado: boolean);
var
  codGrupo: string;
  dataInicial, dataFinal: TDate;
begin
  inherited;

  dataInicial := edDataInicial.Date;  //StartOfAMonth(StrToInt(cbAno.text), cbMes.ItemIndex + 1);
  dataFinal := edDataFinal.Date;

  codGrupo := dm.qryProjecaoDespesasRD.fieldbyname('cod_grupo').Value;

  dRelatorios.qryNotasRDPeriodo.Active := false;
  dRelatorios.qryNotasRDPeriodo.sql.clear;

  dRelatorios.qryNotasRDPeriodo.sql.Add('select n.codigo, n.cod_fornecedor, f.razao_social, n.num_doc,n.data_documento,n.data_lancamento, n.data_rd,c.data_vencimento,  n.observacoes,  n.total as total_nota,  ( select sum(itr.valor) from itens_lancamento_rd');
  dRelatorios.qryNotasRDPeriodo.sql.Add('             itr where (itr.cod_lanc_rd  = n.codigo) and (itr.cod_grupo starting ' + QuotedstR(codGrupo) + ')');
  dRelatorios.qryNotasRDPeriodo.sql.Add('             ) as total_lancamentos');
  dRelatorios.qryNotasRDPeriodo.sql.Add(' from (');
  dRelatorios.qryNotasRDPeriodo.sql.Add('select * from  lancamentos_rd lr where');
  dRelatorios.qryNotasRDPeriodo.sql.Add('  lr.codigo in ( select distinct itr.cod_lanc_rd   from itens_lancamento_rd itr');
  dRelatorios.qryNotasRDPeriodo.sql.Add('                 where itr.cod_grupo starting  ' + Quotedstr(codGrupo) + ' )');
  dRelatorios.qryNotasRDPeriodo.sql.Add('                 and  lr.data_rd between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', dataInicial)) + '  and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', dataFinal)));
  dRelatorios.qryNotasRDPeriodo.sql.Add('        )  n');
  dRelatorios.qryNotasRDPeriodo.sql.Add('        inner join fornecedor f on (f.cod_fornecedor = n.cod_fornecedor)');
  dRelatorios.qryNotasRDPeriodo.sql.Add('        left join contas_a_pagar c on (c.codigo = n.cod_ct_pagar)');
  dRelatorios.qryNotasRDPeriodo.sql.Add('     order by n.data_rd,f.razao_social, n.total');
  dRelatorios.qryNotasRDPeriodo.Active := true;

  if (detalhado = false) then
    dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relNotasRDperiodo.fr3', true)
  else
    dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relNotasRDperiodoItens.fr3', true);

  dRelatorios.setPeriodoRelatorio('De  ' + DateToStr(dataInicial) + '  até  ' + DateToStr(dataFinal));
  dRelatorios.setFiltroRelatorio(trim(dm.qryProjecaoDespesasRD.fieldbyname('descricao').Value));
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryNotasRDPeriodo.Active := false;

end;

procedure TFrmDRE.Detalhar1Click(Sender: TObject);
var
  dataInicial, dataFinal: TDate;
  mes, ano: smallint;
begin
  inherited;

  dataInicial := StartOfAMonth(StrToInt(cbAno.text), cbMes.ItemIndex + 1);
  dataFinal := EndOfTheMonth(dataInicial);

  application.CreateForm(TfrmRelLancamentosNotasRD, frmRelLancamentosNotasRD);
  frmRelLancamentosNotasRD.ed_data_inicial.Date := dataInicial;
  frmRelLancamentosNotasRD.ed_data_final.Date := dataFinal;
  frmRelLancamentosNotasRD.ShowModal;
  frmRelLancamentosNotasRD.Free;

end;

end.

