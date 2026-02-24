unit uuRelRankingProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask, ExtCtrls, Buttons,
  System.DateUtils,
  cxGraphics, cxControls,

  cxCheckComboBox, AdvDateTimePicker,
  AdvGlassButton, cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  PngSpeedButton, Vcl.Menus;

type
  TfrmRelRankingProdutosAntes = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Panel1: TPanel;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    ed_cod_grupo: TMaskEdit;
    rdTipoRel: TRadioGroup;
    rdRanking: TRadioGroup;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    PngSpeedButton1: TPngSpeedButton;
    function verificaValidade(): boolean;
    procedure emitirRelatorio();
    procedure FormActivate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRankingProdutosAntes: TfrmRelRankingProdutosAntes;

implementation

uses
  uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

function TfrmRelRankingProdutosAntes.verificaValidade(): boolean;
begin
  Result := false;

  if edDataInicial.Date > edDataFinal.Date  then
  begin
    ShowMessage('Período inválido!');
    exit;
  end;

  result := true;

end;

procedure TfrmRelRankingProdutosAntes.emitirRelatorio();
var
  obsRelatorio: string;
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  dm_relatorios.qryRankingProdutos.Active := false;
  dm_relatorios.qryRankingProdutos.SQL.clear;
  dm_relatorios.qryRankingProdutos.SQL.Add(' select      p.cod_g_raiz, p.desc_g_raiz, ');
  dm_relatorios.qryRankingProdutos.SQL.Add('        p.cod_g_pai, p.desc_g_pai, ');
  dm_relatorios.qryRankingProdutos.SQL.Add('        p.cod_grupo, p.desc_grupo, ');
  dm_relatorios.qryRankingProdutos.SQL.Add('        p.descricao, rk.* ');
  dm_relatorios.qryRankingProdutos.SQL.Add(' from r_ranking_produtos(' + Inttostr(rdRanking.ItemIndex) + ' , ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ',' +Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)) + ' ) rk ');
  dm_relatorios.qryRankingProdutos.SQL.Add('    inner join r_informacoes_produto p on (p.cod_produto = rk.cod_produto) ');
  dm_relatorios.qryRankingProdutos.SQL.Add('  where p.cod_grupo like ' + Quotedstr(ed_cod_grupo.Text + '%'));



  case rdRanking.ItemIndex of
    0:
      begin
        obsRelatorio := 'Ranking por Quantidade,';
      end;

    1:
      begin
        obsRelatorio := 'Ranking por faturamento';
      end;
  end;

  case rdTipoRel.ItemIndex of
    0:
      begin
        dm_relatorios.qryRankingProdutos.SQL.Add('  order by rk.ranking ');
        dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relRankingProdutos.fr3', true);
      end;

    1:
      begin
        dm_relatorios.qryRankingProdutos.SQL.Add('  order by p.cod_g_raiz, p.cod_g_pai, p.cod_grupo, rk.ranking ');
        dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relRankingProdutosAgrupado.fr3', true);
      end;
  end;

  ////dm.adicionalog('Ranking de produtos');
  ////dm.adicionalog(dm_relatorios.qryRankingProdutos.sql.Text);
  dm_relatorios.qryRankingProdutos.Active := true;

  if (Trim(ed_cod_grupo.Text) = '') then
    obsRelatorio := obsRelatorio + 'Todos os grupos'
  else
    obsRelatorio := obsRelatorio + 'APENAS ' + ed_desc_grupo.Text;

  dm_relatorios.setObservacaoRelatorio(obsRelatorio);

  dm_relatorios.setPeriodoRelatorio('De  ' + edDataInicial.ToString + '  até  ' + edDataFinal.ToString);
  dm_relatorios.rpt.ShowReport(true);

end;

procedure TfrmRelRankingProdutosAntes.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelRankingProdutosAntes.btSelecionarClick(Sender: TObject);
begin
  inherited;


  if verificaValidade then
    emitirRelatorio;
end;

procedure TfrmRelRankingProdutosAntes.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(Now);
  edDataFinal.Date := Now;
  edDataInicial.SetFocus;

end;

procedure TfrmRelRankingProdutosAntes.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
 close;
end;

end.

