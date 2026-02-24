unit uuRelatorioBaixasManuais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxfilterconsts, RealFramework, Dialogs, uu_modelo_Vazio,
  StdCtrls, Buttons, Mask, ExtCtrls, RxToolEdit, Data.DB, cxGraphics, cxControls,
  cxLookAndFeelPainters, cxCheckComboBox, PngSpeedButton, cxStyles,
  cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxGrid, cxClasses,
  JvPageList, JvExControls, AdvGlassButton, cxCheckBox, cxLookAndFeels,
  cxContainer, cxEdit, cxDataStorage,
  cxNavigator, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridTableView, cxGridCustomView, cxMaskEdit, cxDropDownEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSFillPatterns,
  dxPSEdgePatterns, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, JvExMask, JvSpin,
  cxCustomData, cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations,
  dxPSCompsProvider, dxPSPDFExportCore, dxPSPDFExport, Vcl.Menus;

type
  TfrmRelatorioBaixasManuais = class(Tfrm_modelo_vazio)
    Panel10: TPanel;
    Label9: TLabel;
    Panel4: TPanel;
    Panel2: TPanel;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    gdProdutosMovimentacao: TcxGrid;
    gdProdutosMovimentacaoLevel1: TcxGridLevel;
    gdProdutosMovimentacaoDBTableView1: TcxGridDBTableView;
    gdProdutosMovimentacaoDBTableView1DATA: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1HORA: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1DESCRICAOTIPO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1COD_ITEM: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1DESCRICAOGRUPO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1OPERACAO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1DESCRICAO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1ESTOQUE_ANTERIOR: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1QUANTIDADE: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1ESTOQUE_ATUALIZADO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1UNIDADE: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1CUSTO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1TOTAL: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1USUARIO: TcxGridDBColumn;
    gdProdutosMovimentacaoDBTableView1OBSERVACOES: TcxGridDBColumn;
    Panel1: TPanel;
    btPesquisar: TPngSpeedButton;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicio: TDateEdit;
    edDataFim: TDateEdit;
    edHoraIni: TJvTimeEdit;
    edHoraFim: TJvTimeEdit;
    cxStyleRepository2: TcxStyleRepository;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel7: TPanel;
    ed_desc_grupo: TMaskEdit;
    cxStyle3: TcxStyle;
    procedure FormActivate(Sender: TObject);
    procedure imprimirRelatorio();
    function verificaValidade(): boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure comboPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure cbOrigemPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure btPesquisarClick(Sender: TObject);
    procedure viewSemAgrupamentoColumn5StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxGridDBColumn19StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure pgAgrupadoHistoricoShow(Sender: TObject);
    procedure pgSemAgrupamentoShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioBaixasManuais: TfrmRelatorioBaixasManuais;

implementation

uses
  uuDMRelMovimentacoesEstoque, uu_data_module;

{$R *.dfm}

procedure TfrmRelatorioBaixasManuais.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioBaixasManuais.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    imprimirRelatorio;

end;

procedure TfrmRelatorioBaixasManuais.cbOrigemPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
  opcao: TCxCheckBoxState;
  i: integer;
begin
  inherited;
  {
  if ItemIndex = 0 then
  begin
    if cbOrigem.States[0] = cbsUnchecked then
      opcao := cbsChecked
    else
      opcao := cbsUnchecked;

    for i := 1 to cbOrigem.Properties.Items.Count - 1 do
      cbOrigem.States[i] := opcao;
  end;
  cbOrigem.Refresh;
  cbOrigem.Repaint;
  }
end;

procedure TfrmRelatorioBaixasManuais.comboPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
  opcao: TCxCheckBoxState;
  i: integer;
begin
  inherited;
  {
  if ItemIndex = 0 then
  begin
    if cbHistorico.States[0] = cbsUnchecked then
      opcao := cbsChecked
    else
      opcao := cbsUnchecked;

    for i := 1 to cbHistorico.Properties.Items.Count - 1 do
      cbHistorico.States[i] := opcao;
  end;
  cbHistorico.Refresh;
  cbHistorico.Repaint;
  }
end;

procedure TfrmRelatorioBaixasManuais.cxGridDBColumn19StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  {
    if ARecord.Values[AItem.Index] ='E' then
     AStyle := stEntrada
    else
      AStyle := stSaída;
  }
end;

procedure TfrmRelatorioBaixasManuais.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicio.Date := now;
  edDataFim.Date := Date;
  edDataInicio.SetFocus;
  edHoraIni.Time := StrToTime('00:00:00');
  edHoraFim.time := StrToTime('23:59:59');

end;

procedure TfrmRelatorioBaixasManuais.FormCreate(Sender: TObject);
var
  it: TcxCheckComboBoxItem;
begin

  inherited;
  dmRelMovimentacoesEstoque := TdmRelMovimentacoesEstoque.Create(self);
//  dmRelMovimentacoesEstoque.qryHistoricosMovEstoque.Active := true;
//  dmRelMovimentacoesEstoque.qryOrigensMovEstoque.Active := true;

  {
  cbHistorico.EditValue := -1;
  cbOrigem.EditValue := -1;

  cbHistorico.Properties.Items.Clear;
  dmRelMovimentacoesEstoque.qryHistoricosMovEstoque.First;
  while not dmRelMovimentacoesEstoque.qryHistoricosMovEstoque.eof do
  begin
    it := cbHistorico.Properties.Items.Add;
    it.Tag := strToInt(dmRelMovimentacoesEstoque.qryHistoricosMovEstoqueCOD_TIPO.Value);
    it.Description := dmRelMovimentacoesEstoque.qryHistoricosMovEstoqueDESCRICAO.Value;
    cbHistorico.States[it.Index] := cbsChecked;
    dmRelMovimentacoesEstoque.qryHistoricosMovEstoque.Next;
  end;

  cbOrigem.Properties.Items.Clear;
  dmRelMovimentacoesEstoque.qryOrigensMovEstoque.First;
  while not dmRelMovimentacoesEstoque.qryOrigensMovEstoque.eof do
  begin
    it := cbOrigem.Properties.Items.Add;
    it.Tag := dmRelMovimentacoesEstoque.qryOrigensMovEstoqueCODIGO.Value;
    it.Description := dmRelMovimentacoesEstoque.qryOrigensMovEstoqueDESCRICAO.Value;
    cbOrigem.States[it.Index] := cbsChecked;
    dmRelMovimentacoesEstoque.qryOrigensMovEstoque.Next;
  end;

  edHoraIni.Time := StrToTime('00:00:00');
  edHoraFim.Time := StrToTime('23:59:59');


//   combo.StatesItems := true;

 }
end;

procedure TfrmRelatorioBaixasManuais.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmRelMovimentacoesEstoque);
end;

procedure TfrmRelatorioBaixasManuais.imprimirRelatorio();
var
  filtro: string;
  idBaixa: string;
  i: integer;
begin
  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Text := 'Relatório de movimentação de estoque'+sLineBreak+edDataInicio.Text+' até '+edDataFim.Text;
  dxComponentPrinter1Link1.Preview();

end;

procedure TfrmRelatorioBaixasManuais.pgAgrupadoHistoricoShow(Sender: TObject);
begin
  inherited;
//  dxComponentPrinter1Link1.Component := cxGrid1;
end;

procedure TfrmRelatorioBaixasManuais.pgSemAgrupamentoShow(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1Link1.Component := gdProdutosMovimentacao;
end;

procedure TfrmRelatorioBaixasManuais.btPesquisarClick(Sender: TObject);
var
//  origensSelecionadas: string;
//  historicosSelecionados: string;
  i: integer;
  LSQL: TStringList;
begin
  inherited;

  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try
      dmRelMovimentacoesEstoque.qryRelMovimentacoes.Active := false;
      {
      origensSelecionadas := '-1';
      for i := 1 to cbOrigem.Properties.Items.Count - 1 do
      begin
        if cbOrigem.States[i] = cbsChecked then
          origensSelecionadas := origensSelecionadas + ',' + Inttostr(cbOrigem.Properties.Items[i].Tag);
      end;

      historicosSelecionados := '-1';
      for i := 1 to cbHistorico.Properties.Items.Count - 1 do
      begin
        if cbHistorico.States[i] = cbsChecked then
          historicosSelecionados := historicosSelecionados + ',' + Quotedstr(FormatFloat('000', cbHistorico.Properties.Items[i].Tag));
      end;
      }

      LSQL.add(' select cod_baixa,                                                                      ');
      LSQL.add(' 	   cast(b.data_so as date) as data,                                                   ');
      LSQL.add(' 	   cast(b.hora as time) as hora,                                                      ');
      LSQL.add(' 	   b.cod_tipo, tpbaixa.descricao as descricaoTipo,                                    ');
      LSQL.add(' 	   cod_item,                                                                          ');
      LSQL.add(' 	   p.cod_grupo,                                                                       ');
      LSQL.add(' 	   trim(rg.descricao) as descricaoGrupo,                                              ');
      LSQL.add(' 	   case b.tipo_movimentacao                                                           ');
      LSQL.add(' 		when 0 then ' + Quotedstr('Saída'));
      LSQL.add(' 		when 1 then ' + Quotedstr('Entrada'));
      LSQL.add(' 	   end as operacao,                                                                   ');
      LSQL.add(' 	   p.descricao,                                                                       ');
      LSQL.add(' 	   udf_roundabnt((b.estoque_anterior / u.parametro),5) estoque_anterior ,             ');
      LSQL.add(' 	   case b.tipo_movimentacao                                                           ');
      LSQL.add(' 		when 0 then  udf_roundabnt(( (b.quantidade * -1)/ u.parametro ),5)                ');
      LSQL.add(' 		when 1 then  udf_roundabnt(( (b.quantidade)/ u.parametro ),5)                     ');
      LSQL.add(' 	   end  as quantidade,                                                                ');
      LSQL.add(' 	   udf_roundabnt((b.estoque_atualizado / u.parametro),5) estoque_atualizado,          ');
      LSQL.add(' 	   u.descricao as Unidade,                                                            ');
      LSQL.add(' 	   b.custo_unitario_item as custo,                                                    ');
      LSQL.add(' 	   (udf_roundabnt(( (b.quantidade)/ u.parametro),5) * b.custo_unitario_item) as total,');
      LSQL.add(' 	   b.usuario,b.observacoes                                                            ');
      LSQL.add('                                                                                        ');
      LSQL.add('   from baixas_estoque b                                                                ');
      LSQL.add('    inner join produtos p on (p.cod_produto = b.cod_item)                               ');
      LSQL.add('    inner join r_grupos rg on (rg.cod_grupo = p.cod_grupo)                              ');
      LSQL.add('    inner join unidades u on (u.cod_unidade = p.unidade_entrada)                        ');
      LSQL.add('    inner join unidades uBaixa on (uBaixa.cod_unidade = b.cod_unidade)                  ');
      LSQL.add('    inner join tipos_baixa tpBaixa on (tpBaixa.cod_tipo = b.cod_tipo)                   ');
      LSQL.add('                                                                                        ');
      LSQL.Add('                                                                                                                                                                                                                                                            ');
      LSQL.Add('					   where b.data_so between ');
      LSQL.Add(Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicio.date) + ' ' + TimeToStr(edHoraIni.Time)));
      LSQL.Add('  and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFim.date) + ' ' + TimeToStr(edHoraFim.Time)));

      {
      case rdTipoOrigem.ItemIndex of
        0:
          LSQL.Add('	and b.tipo_movimentacao = 0');
        1:
          LSQL.Add('	and b.tipo_movimentacao = 1 ');
      end;
          }
      if trim(ed_cod_grupo.Text) <> '' then
      begin
        LSQL.Add(' and rg.cod_grupo like +' + QuotedStr('%' + ed_cod_grupo.Text));
      end;

      {
      if trim(ed_cod_item.Text) <> '' then
      begin
        LSQL.Add(' and b.cod_item = +' + QuotedStr(ed_cod_item.Text));
      end;
         }
//      LSQL.Add(' and b.cod_origem in (' + origensSelecionadas + ')');
  //    LSQL.Add(' and b.cod_tipo in (' + historicosSelecionados + ')');

      dmRelMovimentacoesEstoque.qryRelMovimentacoes.SQL.Clear;
      dmRelMovimentacoesEstoque.qryRelMovimentacoes.SQL.Add(LSQL.Text);
      dm.adicionaLog(LSQL.Text);
      dmRelMovimentacoesEstoque.qryRelMovimentacoes.Active := true;

    except
      on E: Exception do
      begin
        showRealDialog(self, tmErro, 'Erro', 'Erro ao gerar o relatório!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
   {
  case rdTipoAgrupamento.ItemIndex of
    0:
      gdProdutosMovimentacaoLevel1.GridView := viewSemAgrupamento;
    1:
      gdProdutosMovimentacaoLevel1.GridView := viewAgrupamentoOrigem;
    2:
      gdProdutosMovimentacaoLevel1.GridView := viewAgrupamentoHistorico;
    3:
      gdProdutosMovimentacaoLevel1.GridView := viewAgrupamentoAmbos;
  end;

  dmRelMovimentacoesEstoque.qryRelMovimentacoes.Prepare;
  }
  dm.adicionalog(dmRelMovimentacoesEstoque.qryRelMovimentacoes.SQL.Text);

end;

function TfrmRelatorioBaixasManuais.verificaValidade(): boolean;
begin

  if edDataFim.Date < edDataInicio.Date then
  begin
    showmessage('Período Inválido');
    edDataInicio.SetFocus;
  end;

{   if ( trim(edCodTipoBaixaEstoque.Text) <> '') then
    begin
      if (verificaExistenciaTipoBaixaEstoque(edCodTipoBaixaEstoque.Text) = false) then
        begin
          ShowMessage('Código de tipo de baixa inválido!');
          edCodTipoBaixaEstoque.SetFocus;
          edCodTipoBaixaEstoque.Clear;
          result:=false;
          exit;
        end;
    end;
 }
 {
  if (trim(ed_cod_grupo.Text) <> '') then
  begin
    if (verificaExistenciaGrupo(ed_cod_grupo.Text) = false) then
    begin
      ShowMessage('Código de grupo inválido!');
      ed_cod_grupo.SetFocus;
      ed_cod_grupo.Clear;
      result := false;
      exit;
    end;
  end;
  }
  {
  if (trim(ed_cod_item.Text) <> '') then
  begin
    if (verificaExistenciaItemEstoque(ed_cod_item.Text, 1) = false) then
    begin
      ShowMessage('Código de ítem inválido!');
      ed_cod_item.SetFocus;
      ed_cod_item.Clear;
      result := false;
      exit;
    end;
  end;
   }
  result := true;
end;

procedure TfrmRelatorioBaixasManuais.viewSemAgrupamentoColumn5StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;

{    if ARecord.Values[AItem.Index] ='E' then
     AStyle := stEntrada
    else
      AStyle := stSaída;
 }


end;

end.

