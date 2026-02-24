unit uuContasAPagarEntradas;

interface

uses
  Windows, Messages, SysUtils, RealFramework, System.Generics.Collections,
  System.DateUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  uu_modelo_Vazio, DBCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  rxcurredit, DB, RxMemDS, ibx.ibquery, RxToolEdit, cxGraphics, cxControls,
  cxCalendar, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  AdvDateTimePicker, Vcl.Samples.Spin, AdvGlassButton, Vcl.Mask, Vcl.Menus,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmContasApagarEntradas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    pnDetalhesConta: TPanel;
    tbParcelas: TRxMemoryData;
    tbParcelasdataVencimento: TDateField;
    tbParcelasvalorParcela: TCurrencyField;
    tbParcelasdescricaoConta: TStringField;
    tbParcelasvalorMulta: TCurrencyField;
    tbParcelasvalorMora: TFloatField;
    tbParcelasvalorDesconto: TFloatField;
    tbParcelasflagMulta: TSmallintField;
    tbParcelasflagMora: TSmallintField;
    tbParcelasflagDesconto: TSmallintField;
    tbParcelasdiasDesconto: TIntegerField;
    dsParcelas: TDataSource;
    tbParcelasnumeroControle: TStringField;
    tbParcelasdiaSemana: TStringField;
    tbParcelasparcela: TStringField;
    Label10: TLabel;
    pnTopo: TPanel;
    Panel6: TPanel;
    Shape1: TShape;
    Label34: TLabel;
    pnDadosFornecedor: TPanel;
    Label23: TLabel;
    Label2: TLabel;
    edNumeroNota: TEdit;
    edNumeroEntrada: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    pnParcelas: TPanel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edDataDoc: TcxDateEdit;
    Label11: TLabel;
    Label9: TLabel;
    btLancar: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    edTotalConta: TCurrencyEdit;
    edDataVencimento: TcxDateEdit;
    edDataRD: TcxDateEdit;
    edNumeroParcelas: TSpinEdit;
    edDiasParcelas: TSpinEdit;
    edObservacoes: TEdit;
    Label12: TLabel;
    edValorAjuste: TCurrencyEdit;
    edValorAjustado: TCurrencyEdit;
    Label13: TLabel;
    pnContaGerencial: TPanel;
    cbContaGerencial: TcxLookupComboBox;
    Label44: TLabel;
    pnDetalhamento: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    cbFornecedor: TcxLookupComboBox;
    ckbRepetirDespesa: TCheckBox;
    cbTempoRepeticao: TComboBox;
    edDataRepeticao: TcxDateEdit;
    Label14: TLabel;

    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSairClick(Sender: TObject);
    procedure btLancarClick(Sender: TObject);
    procedure cbTempoRepeticaoChange(Sender: TObject);
    procedure ckbRepetirDespesaClick(Sender: TObject);
    procedure edDataRepeticaoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edDataRepeticaoPropertiesEditValueChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDataVencimentoPropertiesChange(Sender: TObject);
  private
    { Private declarations }

    LPodeFechar: boolean;
    LCodigoFornecedor: string;
    LVeioDasCompras: boolean;
    LEntradasAvulsas: Boolean;
    LProcessouParcelasDoDanfe: boolean;
    LIniciouProcessamentoParcelas: boolean;

    procedure RecalcularParcelas;
    procedure LancarContasAPagar;
    procedure ConfirmarLancamento;
    procedure ValidarSomaDasParcelas;
    procedure validarGeracaoParcelas;
    procedure ReaJustaForm;
    procedure ConfigurarParaCompras;
    procedure ConfigurarParaDespesas;
    procedure validarLancamentosFinanceiro;

    procedure GerarParcelasDanfe();
    procedure GerarParcelasManuais;

  public
    { Public declarations }
    procedure SetCodigoFornecedor(ACodigo: string);
    procedure setEntradasAVulsas(AEntradaAvulsa: boolean);

  end;

var
  frmContasApagarEntradas: TfrmContasApagarEntradas;

implementation

uses
  uu_data_module, uu_frm_principal, uuDmContasAPagar;

{$R *.dfm}

procedure TfrmContasApagarEntradas.SetCodigoFornecedor(ACodigo: string);
begin
  LCodigoFornecedor := ACodigo;
  cbFornecedor.EditValue := ACodigo;
  ConfigurarParaCompras;
  LVeioDasCompras := true;
end;

procedure TfrmContasApagarEntradas.validarGeracaoParcelas();
begin
  try

    if (edValorAjuste.Value > 0) and (abs(edValorAjuste.Value) >= abs(edTotalConta.value)) then
      raise Exception.Create('Valor absoluto do ajuste não pode ser maior ou igual valor da despesa!');

  finally

  end;

end;

procedure TfrmContasApagarEntradas.GerarParcelasDanfe();
var
  AQtdeParcelas: Integer;
  AVencimentoInicial: TDate;
  LParcelaAtual: integer;
begin

  if ((LVeioDasCompras = true) and (LEntradasAvulsas = false) and (LProcessouParcelasDoDanfe = false)) then
  begin
    AQtdeParcelas := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup.Count;
    if (AQtdeParcelas > 0) then
    begin

      tbParcelas.EmptyTable;
      tbParcelas.Active := true;
      edTotalConta.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.fat.vLiq;
      edValorAjustado.value := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.fat.vLiq;
      AQtdeParcelas := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup.Count;

      for LParcelaAtual := 0 to AQtdeParcelas - 1 do
      begin
        tbParcelas.Append;
        tbParcelasdataVencimento.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup[LParcelaAtual].dVenc;
        tbParcelasnumeroControle.Value := FormatFloat('00', (LParcelaAtual + 1)) + '/' + Formatfloat('00', AQtdeParcelas);
        tbParcelasdescricaoConta.Value := 'Parcela ' + tbParcelasnumeroControle.Value;
        tbParcelasparcela.Value := tbParcelasnumeroControle.Value;
        tbParcelasvalorParcela.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup[LParcelaAtual].vDup;
        tbParcelasdiaSemana.Value := dm.GetNomeDiaDaSemana(tbParcelasdataVencimento.Value);
        tbParcelas.Post;
      end;
      edDataVencimento.EditValue := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup[0].dVenc;
      edNumeroParcelas.Value := AQtdeParcelas;
      LProcessouParcelasDoDanfe := true;
    end
   else
    begin
      LProcessouParcelasDoDanfe := true;
    end;
  end;

end;

procedure TfrmContasApagarEntradas.GerarParcelasManuais;
var
  q: TIBQuery;
  i: integer;
  dataInicio: string;
  diasUteis: smallint;
  ct: integer;
  valorParcelas: double;
  diferencaParcelas: double;
  LDiasEntreParcelas, LQtdParcelas: integer;
  LGerarPorData: boolean;
  LDataAtual: TDate;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  LGerarPorData := false;

  dataInicio := Quotedstr(FormatDateTime('DD.MM.YYY', edDataVencimento.Date));
  diasUteis := 0;

  if ckbRepetirDespesa.Checked = false then
  begin
    LDiasEntreParcelas := edDiasParcelas.value;
    LQtdParcelas := edNumeroParcelas.Value;
    valorParcelas := StrToFloat(formatFloat('0.00', (edValorAjustado.value / edNumeroParcelas.value)));
    diferencaParcelas := edValorAjustado.Value - (valorParcelas * edNumeroParcelas.Value);
  end
  else
  begin
    LGerarPorData := true;
  end;

  tbParcelas.EmptyTable;
  tbParcelas.Active := true;

  if (LGerarPorData = false) then
  begin
    q.Active := false;
    q.sql.clear;

    q.sql.add('select gp.*,udf_dayname(gp.datavencimento) as nomeDia from gera_parcelas(' + dataInicio + ',' + FloatToStr(LQtdParcelas) + ',' + FloatToStr(LDiasEntreParcelas) + ',' + IntToStr(diasUteis) + ') gp');
    q.Active := true;
    q.First;

    ct := 1;

    while not q.Eof do
    begin
      tbParcelas.Append;
      tbParcelasdataVencimento.Value := q.fieldbyname('DATAVENCIMENTO').VALUE;
      tbParcelasnumeroControle.Value := formatfloat('00', ct) + ' / ' + FloatToStr(LQtdParcelas);
      tbParcelasdescricaoConta.Value := formatfloat('00', ct) + ' / ' + FloatToStr(LQtdParcelas);
      tbParcelasparcela.Value := formatfloat('00', ct) + '/' + formatfloat('00', LQtdParcelas);
      tbParcelasdiaSemana.Value := dm.GetNomeDiaDaSemana(q.fieldbyname('DATAVENCIMENTO').VALUE);
      if ct = 1 then
        tbParcelasvalorParcela.Value := valorParcelas + diferencaParcelas
      else
        tbParcelasvalorParcela.Value := valorParcelas;

      tbParcelas.Post;
      ct := ct + 1;
      q.next;
    end;

  end
  else
  begin
    LDataAtual := edDataVencimento.EditValue;
    while LDataAtual <= edDataRepeticao.EditValue do
    begin
      tbParcelas.Append;
      tbParcelasdataVencimento.Value := LDataAtual;
//      tbParcelasnumeroControle.Value := formatfloat('00', ct) + ' / ' + FloatToStr(LQtdParcelas);
//      tbParcelasdescricaoConta.Value := formatfloat('00', ct) + ' / ' + FloatToStr(LQtdParcelas);
  //    tbParcelasparcela.Value := formatfloat('00', ct) + '/' + formatfloat('00', LQtdParcelas);
      tbParcelasdiaSemana.Value := dm.GetNomeDiaDaSemana(LDataAtual);
      tbParcelasvalorParcela.Value := edTotalConta.Value;
      tbParcelas.Post;

      case cbTempoRepeticao.ItemIndex of
        0:
          LDataAtual := IncDay(LDataAtual, 7);

        1:
          LDataAtual := IncDay(LDataAtual, 15);
        2:
          LDataAtual := IncMonth(LDataAtual, 1);
        3:
          LDataAtual := IncYear(LDataAtual, 1);
      end;

    end;
  end;

  if LQtdParcelas > 1 then
  begin
    pnParcelas.Visible := true;
  end;

  tbParcelas.First;
  btLancar.Enabled := true;
end;

procedure TfrmContasApagarEntradas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if tbParcelas.Active = false then
    exit;

  if odd(tbParcelas.RecNo) then
    DBGrid1.Canvas.Brush.Color := clwhite
  else
    DBGrid1.Canvas.Brush.Color := clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color := clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

  TDbGrid(Sender).Canvas.font.Color := clBlack; //aqui é definida a cor da fonte


end;

procedure TfrmContasApagarEntradas.btLancarClick(Sender: TObject);
begin
  inherited;
  ConfirmarLancamento();
  dmContasAPagar.setLancouTitulo(true);

end;

procedure TfrmContasApagarEntradas.btSairClick(Sender: TObject);
begin
  inherited;
  if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Deseja mesmo abandonar o lançamento?') = teSim) then
  begin
    LPodeFechar := true;
    close;
  end
  else
    LPodeFechar := false;
end;

procedure TfrmContasApagarEntradas.cbTempoRepeticaoChange(Sender: TObject);
begin
  inherited;
  GerarParcelasManuais;
end;

procedure TfrmContasApagarEntradas.ckbRepetirDespesaClick(Sender: TObject);
begin
  inherited;
  if ckbRepetirDespesa.Checked then
  begin
    edNumeroParcelas.Enabled := false;
    edNumeroParcelas.Value := 1;
    edDiasParcelas.value := 1;
  end;
  GerarParcelasManuais;

end;

procedure TfrmContasApagarEntradas.validarLancamentosFinanceiro();
begin
  if (LVeioDasCompras = false) then
  begin

    if ((cbContaGerencial.EditValue = null)) then
      raise Exception.Create('Grupo gerencial inválido! Selecione um grupo gerencial analítico. (6 dígitos. Ex: 1.01.005)');

    if (Length(trim(cbContaGerencial.EditValue)) <> 6) then
      raise Exception.Create('Grupo gerencial inválido! Selecione um grupo gerencial analítico. (6 dígitos. Ex: 1.01.005)');
  end;

  if (edValorAjustado.Value <= 0) then
    raise Exception.Create('Valor da despesa é inválido!');

  if cbFornecedor.EditValue = null then
    raise Exception.Create('Forncedor informado é inválido!');

end;

procedure TfrmContasApagarEntradas.ConfirmarLancamento();
begin
  try
    try
      validarGeracaoParcelas;
      ValidarSomaDasParcelas;
      validarLancamentosFinanceiro();

      if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Confirma o lançamento?') = teSim) then
      begin
        btLancar.Enabled := false;
        LancarContasAPagar;
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Lançamento efetuado com sucesso!');
        LPodeFechar := true;
        close;
      end
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', e.message);
      end;
    end;
  finally

  end;

end;

procedure TfrmContasApagarEntradas.ValidarSomaDasParcelas;
var
  LSomaDasParcelas: real;
  LValorTotalConta: real;
begin

  try
    try
      LSomaDasParcelas := 0;
      LValorTotalConta := 0;
      LValorTotalConta := edValorAjustado.value;
      tbParcelas.First;
      LSomaDasParcelas := 0;

      while not tbParcelas.Eof do
      begin
        LSomaDasParcelas := LSomaDasParcelas + tbParcelasvalorParcela.Value;
        tbParcelas.Next;
      end;

      if ckbRepetirDespesa.Checked = false then
      begin
        if (FloatToCurr(LSomaDasParcelas) <> FloatToCurr(LValorTotalConta)) then
        begin
          raise Exception.Create('Valor da soma das parcelas não é equivalente ao total do lançamento!');
        end;
      end;

    except
      on E: Exception do
      begin
        raise Exception.create(E.Message);
      end;

    end;
  finally

  end;
end;

procedure TfrmContasApagarEntradas.RecalcularParcelas;
begin
  try
    validarGeracaoParcelas;
    GerarParcelasManuais;

  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', e.message);
    end;
  end;

end;

procedure TfrmContasApagarEntradas.edDataRepeticaoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  GerarParcelasManuais;

end;

procedure TfrmContasApagarEntradas.edDataVencimentoPropertiesChange(Sender: TObject);
begin
  inherited;
  if ((LVeioDasCompras = true) and (LEntradasAvulsas = false)) then
  begin
    if (LProcessouParcelasDoDanfe = true) then
    begin
      RecalcularParcelas;
    end;

  end
  else
    RecalcularParcelas;

end;

procedure TfrmContasApagarEntradas.Edit1Exit(Sender: TObject);
begin
  inherited;
  if ((Sender as TWinControl).Name = 'edValorAjuste') or ((Sender as TWinControl).Name = 'edTotalConta') or ((Sender as TWinControl).Name = 'edDataVencimento') then
  begin
    try
      validarGeracaoParcelas;
      edValorAjustado.Value := edTotalConta.Value + edValorAjuste.value;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', e.message);
      end;
    end;
  end;

end;

procedure TfrmContasApagarEntradas.ReaJustaForm();
begin

end;

procedure TfrmContasApagarEntradas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := LPodeFechar;
end;

procedure TfrmContasApagarEntradas.FormCreate(Sender: TObject);
begin
  inherited;
  LIniciouProcessamentoParcelas := false;
  LPodeFechar := false;
  LVeioDasCompras := false;
  LEntradasAvulsas := false;
  LProcessouParcelasDoDanfe := false;
  dmContasAPagar.setLancouTitulo(false);
  ConfigurarParaDespesas;
end;

procedure TfrmContasApagarEntradas.setEntradasAVulsas(AEntradaAvulsa: boolean);
begin
  LEntradasAvulsas := AEntradaAvulsa;
end;

procedure TfrmContasApagarEntradas.LancarContasAPagar();
var
  LCodigoTitulo: string;
  LCodPrimeiroTitulo: string;
  LSQL: TStringList;
  LListaSQL: TList<string>;
begin
  LSQL := TStringList.Create();
  LListaSQL := TList<string>.Create;

  try
    try
      LCodPrimeiroTitulo := dm.geraCodigo('G_CONTAS_A_PAGAR', 6);
      LCodigoTitulo := LCodPrimeiroTitulo;

      tbParcelas.First;
      while not tbParcelas.Eof do
      begin
        if tbParcelas.RecNo > 1 then
          LCodigoTitulo := dm.geraCodigo('G_CONTAS_A_PAGAR', 6);

        LSQL.Clear;
        LSQL.Add('insert into contas_a_pagar (');
        LSQL.Add('    CODIGO,cod_conta,cod_emp_grupo,COD_FORNECEDOR,DESCRICAO_CONTA,PARCELA,data_entrada, data_lancamento,');
        LSQL.Add('    DATA_VENCIMENTO,DATA_COMPETENCIA, VALOR,');
        LSQL.Add('    USUARIO_INCLUSAO,USUARIO_BAIXA,CODIGO_ENTRADA,COD_PRIMEIRO_TITULO,NUMERO_NOTA_FISCAL) values (');
        LSQL.Add('' + Quotedstr(LCodigoTitulo) + ',');

        if (LVeioDasCompras) then
        begin
          LSQL.Add('null,');
        end
        else
        begin
          LSQL.Add(Quotedstr(cbContaGerencial.EditValue) + ',');
        end;

        LSQL.Add('' + Quotedstr(codEmpresa) + ',');
        LSQL.Add('' + Quotedstr(cbFornecedor.EditValue) + ',');
        LSQL.Add(QUotedstr(edObservacoes.text) + ' ,');
        LSQL.Add('' + Quotedstr(tbParcelasparcela.Value) + ',');
        LSQL.Add('current_date,');
        LSQL.Add('current_date,');
        if (ckbRepetirDespesa.Checked) then
        begin
          LSQL.Add('' + Quotedstr(FormatDateTime('DD.MM.YYY', tbParcelasdataVencimento.Value)) + ',');
          LSQL.Add('' + Quotedstr(FormatDateTime('DD.MM.YYY', tbParcelasdataVencimento.Value)) + ',');
        end
        else
        begin
          LSQL.Add('' + Quotedstr(FormatDateTime('DD.MM.YYY', tbParcelasdataVencimento.Value)) + ',');
          LSQL.Add('' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataRD.EditValue)) + ',');
        end;

        LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(tbParcelasvalorParcela.Value)) + ',');
        LSQL.Add('' + Quotedstr(nome_usuario) + ',');
        LSQL.Add('' + Quotedstr('') + ',');
        LSQL.Add('' + Quotedstr(edNumeroEntrada.Text) + ',');
        LSQL.Add('' + Quotedstr(LCodPrimeiroTitulo) + ',');
        LSQL.Add('' + Quotedstr(edNumeroNota.Text) + ');');
        LListaSQL.add(LSQL.text);
        tbParcelas.Next;
      end;
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
    except
      on E: exception do
      begin
        raise Exception.Create('Erro ao lançar contas à pagar: ' + sLineBreak + sLineBreak + 'Erro: ' + E.message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
  end;

end;

procedure TfrmContasApagarEntradas.ConfigurarParaCompras;
begin
  pnContaGerencial.Visible := false;
  pnDadosFornecedor.Enabled := false;
  cbFornecedor.Properties.ReadOnly := true;
  cbFornecedor.Enabled := true;
  cbFornecedor.Style.Color := $00CDCDC9;
  edNumeroNota.Enabled := False;
  edNumeroNota.Color := $00CDCDC9;
  edNumeroNota.ReadOnly := true;
  edDataDoc.Enabled := true;
  edDataDoc.Properties.ReadOnly := true;
  edDataDoc.Style.color := $00CDCDC9;
  edNumeroEntrada.Color := $00CDCDC9;
  edTotalConta.Color := $00CDCDC9;
  edTotalConta.ReadOnly := true;
  edNumeroEntrada.ReadOnly := True;
  edNumeroEntrada.Enabled := false;
  edValorAjuste.Enabled := true;
  edValorAjuste.ReadOnly := false;
  edValorAjuste.Color := clWhite;
  Self.Height := Self.Height - (pnDetalhamento.Height + pnContaGerencial.Height);
  RecalcularParcelas;
//  edValorAjuste.SetFocus;

end;

procedure TfrmContasApagarEntradas.ConfigurarParaDespesas;
begin
  edDataDoc.EditValue := Date;
  edDataVencimento.EditValue := Date;
  edDataRD.EditValue := Date;
  cbFornecedor.Properties.ReadOnly := false;
  cbFornecedor.Enabled := True;
  cbFornecedor.Style.Color := clWhite;
  edNumeroNota.Enabled := true;
  edNumeroNota.Color := clWhite;
  edNumeroNota.ReadOnly := false;
  edDataDoc.Enabled := true;
  edDataDoc.Style.color := clWhite;
  edNumeroEntrada.Color := $00CDCDC9;
  edNumeroEntrada.ReadOnly := True;
  edNumeroEntrada.Enabled := false;
  edTotalConta.Color := clWhite;
  edTotalConta.ReadOnly := false;
  edTotalConta.Enabled := true;
  edValorAjuste.ReadOnly := true;
  edValorAjuste.Color := $00CDCDC9;
  pnContaGerencial.Visible := True;

  edDataRepeticao.Date := IncMonth(now, 1);

end;

procedure TfrmContasApagarEntradas.edDataRepeticaoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  RecalcularParcelas;
end;

procedure TfrmContasApagarEntradas.FormActivate(Sender: TObject);
begin
  inherited;
  if LVeioDasCompras then
  begin
    GerarParcelasDanfe;
    edValorAjuste.SetFocus;
  end;
end;

end.

