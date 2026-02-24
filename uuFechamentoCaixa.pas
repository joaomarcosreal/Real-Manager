unit uuFechamentoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, RealFramework, Classes, Graphics,
  Controls, Forms, ACBrUtil, Dialogs, uu_modelo_Vazio, StdCtrls, Buttons,
  ExtCtrls, ibx.ibquery, DB, RxMemDS, DBGrids, RxCurrEdit, AdvGlassButton,
  Vcl.DBCGrids, RxToolEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, AdvSmoothTouchKeyBoard, IBX.IBDatabase, Vcl.Grids, Vcl.Mask,
  Vcl.Menus, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TfrmFechamentoCaixa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    tbFormasPagamentoTemp: TRxMemoryData;
    tbFormasPagamentoTempdescricaoForma: TStringField;
    tbFormasPagamentoTempvalorForma: TCurrencyField;
    tbFormasPagamentoTempcodForma: TStringField;
    dsFormasPagtoTemp: TDataSource;
    Panel2: TPanel;
    gp_formas: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    btPesqFormaPagto: TSpeedButton;
    edCodFormaPagamento: Tedit;
    ed_valor_forma: TCurrencyEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label43: TLabel;
    edDescricaoForma: TEdit;
    Panel6: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    Panel5: TPanel;
    btFecharCaixa: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard;
    IBTransaction1: TIBTransaction;
    PopupMenu1: TPopupMenu;
    E1: TMenuItem;
    Label3: TLabel;
    edTotalCaixa: TJvValidateEdit;
    procedure Edit1Exit(Sender: TObject);
    procedure adicionar_pagamento(cod_forma: string; descricao_forma: string; valor: string);
    procedure gravarApuracaoCaixa();
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edCodFormaPagamentoExit(Sender: TObject);
    procedure btFecharCaixaClick(Sender: TObject);
    procedure DBCtrlGrid2Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure E1Click(Sender: TObject);
  private
    procedure CalcularTotal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechamentoCaixa: TfrmFechamentoCaixa;

implementation

uses
  uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

procedure TfrmFechamentoCaixa.Edit1Exit(Sender: TObject);
begin
  inherited;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_valor_forma') and (TRIM(ed_valor_forma.Text) = ''))) then
    btFecharCaixa.SetFocus
  else
  begin
    if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_valor_forma')) and (ed_valor_forma.Value >= 0)) then
    begin
      if (verificaExistenciaFormaDePagamento(edCodFormaPagamento.Text) = true) then
        adicionar_pagamento(edCodFormaPagamento.text, edDescricaoForma.Text, FormatFloat('#0.00', ed_valor_forma.Value))
      else
      begin
        ShowMessage('Forma de Pagamento inválida');
        edCodFormaPagamento.SetFocus;
        edCodFormaPagamento.clear;
      end;
    end;
  end;

end;

procedure TfrmFechamentoCaixa.adicionar_pagamento(cod_forma: string; descricao_forma: string; valor: string);
begin

  if not tbFormasPagamentoTemp.Locate('codForma', cod_forma, []) then
  begin
    tbFormasPagamentoTemp.Append;
    tbFormasPagamentoTempcodForma.Value := cod_forma;
    tbFormasPagamentoTempdescricaoForma.value := descricao_forma;
    tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    tbFormasPagamentoTemp.Post;
  end
  else
  begin
    tbFormasPagamentoTemp.Edit;
    tbFormasPagamentoTempvalorForma.value := tbFormasPagamentoTempvalorForma.Value + StrToFloat(valor);
    tbFormasPagamentoTemp.Post;
  end;

  CalcularTotal;
  ed_valor_forma.Clear;
  edCodFormaPagamento.clear;
  edCodFormaPagamento.Clear;
  edCodFormaPagamento.SetFocus;
  edDescricaoForma.Clear;
end;

procedure TfrmFechamentoCaixa.CalcularTotal();
var
  LTotal: Currency;
begin
  LTotal := 0;
  tbFormasPagamentoTemp.First;
  while not tbFormasPagamentoTemp.Eof do
  begin
    LTotal := LTotal + tbFormasPagamentoTempvalorForma.Value;
    tbFormasPagamentoTemp.Next;
  end;

  edTotalCaixa.Value := LTotal;

end;

procedure TfrmFechamentoCaixa.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmFechamentoCaixa.btFecharCaixaClick(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirmação', 'Confirma o fechamento do caixa ?') = teSim) then
  begin
    gravarApuracaoCaixa();
    if (StrToInt(dm.LeIni(2, 'CAIXA', 'impRelFechamento')) = 1) then
    begin
      dm.EmitirRelatorioDeCaixaNaMiniPrinter(codEmpresa, ultimoCaixaAberto, TRFechamento);
    end;

    ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Fechamento de caixa efetuado!');

    Close;
  end;
end;

procedure TfrmFechamentoCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmFechamentoCaixa.gravarApuracaoCaixa();
var
  ts: TIBTransaction;
  q: TIBQuery;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.active := false;

  q.Transaction.Active := false;
  q.Transaction.StartTransaction;

  try
    try
      q.Active := false;
      q.sql.clear;
      q.sql.add('delete from apuracao_caixa ');
      q.sql.add('   where cod_empresa=' + Quotedstr(codEmpresa));
      q.sql.add(' and cod_caixa=' + Quotedstr(ultimoCaixaAberto));
      q.ExecSQL;

      tbFormasPagamentoTemp.First;
      while not tbFormasPagamentoTemp.Eof do
      begin
        q.Active := false;
        q.sql.clear;
        q.sql.add('insert into apuracao_caixa (cod_empresa,cod_caixa,cod_forma,total_operador) values (');
        q.sql.add(Quotedstr(codEmpresa) + ',');
        q.sql.add(Quotedstr(ultimoCaixaAberto) + ',');
        q.sql.add('' + QuotedStr(tbFormasPagamentoTempcodForma.value) + ',');
        q.sql.add('' + dm.TrocaVirgPPto(Floattostr(tbFormasPagamentoTempvalorForma.value)) + ')');
        q.ExecSQL;
        tbFormasPagamentoTemp.Next;
      end;

      q.active := false;
      q.sql.Clear;
      q.sql.Add('execute procedure PROCESSACAIXA(' + Quotedstr(ultimoCaixaAberto) + ',' + Quotedstr(codEmpresa) + ');');
      q.execsql;

      q.Active := false;
      q.sql.clear;
      q.sql.add(' update caixas c set c.status=0,  c.hora_fechamento=current_time,' + 'c.data_fechamento=current_date');
      q.sql.add(' , c.total_sangrias=' + dm.TrocaVirgPPto(FloatTostr(getTotalSangriasCaixa(ultimoCaixaAberto))));
      q.SQL.add(' where c.codigo=' + Quotedstr(ultimoCaixaAberto));
      q.ExecSQL;
      dm.transacao.Commit;

    except
      on E: Exception do
      begin
        if ts.Active then
          ts.Rollback;
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao realizar o fechamento de caixa! ' + sLineBreak + 'Erro: ' + E.Message);

      end;

    end;
  finally
    FreeAndNil(q);
    FreeAndNil(ts);
  end;

end;

procedure TfrmFechamentoCaixa.DBCtrlGrid2Click(Sender: TObject);
begin
  inherited;
  edCodFormaPagamento.Text := dm.tbFormasPagamento.FieldByName('cod_forma').value;
  edDescricaoForma.Text := dm.tbFormasPagamento.FieldByName('descricao').value;
  ed_valor_forma.SetFocus;

end;

procedure TfrmFechamentoCaixa.DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
var
  imgFormaPagto: TImage;
begin
  inherited;
  imgFormaPagto := TImage.Create(self);

  try
    if (dm.tbFormasPagamento.IsEmpty = false) then
    begin
      imgFormaPagto.Tag := strToInt(dm.tbFormasPagamento.FieldByName('cod_forma').Value);
      imgFormaPagto.Picture := nil;

      if (dm.tbFormasPagamento.FieldByName('imagem').Value <> null) and (dm.tbFormasPagamento.FieldByName('imagem').Value <> '') then
      begin
        try
          imgFormaPagto.picture.LoadFromFile(patchAplicacao + 'imagens\formas pagto\' + dm.tbFormasPagamento.FieldByName('imagem').Value);
        except
          ////dm.adicionalog('Erro ao adicionar imagem de forma de pagamento ' + dm.tbFormasPagamento.FieldByName('descricao').Value);
          imgFormaPagto.Picture := nil;
        end;
      end;

      DBCtrlGrid2.Canvas.Draw(31, 0, imgFormaPagto.Picture.Graphic);
      DBCtrlGrid2.Canvas.Pen.Color := 12615680;
      DBCtrlGrid2.Canvas.Font.Size := 16;

      DBCtrlGrid2.Canvas.TextOut(2, 0, Inttostr(StrToInt(dm.tbFormasPagamento.FieldByName('cod_forma').Value)));
      DBCtrlGrid2.Canvas.Font.Size := 14;
      DBCtrlGrid2.Canvas.TextOut(0, 60, PadCenter(dm.tbFormasPagamento.FieldByName('descricao').Value, 14, ' '));
      imgFormaPagto.Repaint;
    end;
  finally
    FreeAndNil(imgFormaPagto);
  end;
end;

procedure TfrmFechamentoCaixa.E1Click(Sender: TObject);
begin
  inherited;
  if (ShowRealDialog(frm_principal, tmConfirmacaoPorPIN, 'Confirme', 'Tem certeza que deseja excluir?', 16, true) = teSim) then
  begin
    tbFormasPagamentoTemp.Delete;
    CalcularTotal;
  end;

end;

procedure TfrmFechamentoCaixa.edCodFormaPagamentoExit(Sender: TObject);
begin
  inherited;
  actExitFormaPagamentoExecute(Sender);
end;

procedure TfrmFechamentoCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  dm.carregarFormasDePagamento(false);
  CalcularTotal;

  if (dm.verificaExistenciaNotasPendentesCancelamento) then
  begin
    dm.exibe_painel_erro('Existem notas fiscais pendentes de cancelamento por erro de conexão.' + sLineBreak + 'O sistema tentará fazer o cancelamento automático.' + sLineBreak + 'Certifique-se que o computador esteja conectado à internet, pois do contrário o processo não será efetuado.' + sLineBreak + ' e não será possível encerrar o dia!', 'Ok');
//      dm.CancelaNotasPendentes();
  //    dm.CancelaNotasPendentesPorSubstituicao();
  end;

  tbFormasPagamentoTemp.Active := false;
  tbFormasPagamentoTemp.EmptyTable;
  tbFormasPagamentoTemp.Active := true;
  edCodFormaPagamento.SetFocus;
end;

procedure TfrmFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_escape then
    close;
end;

procedure TfrmFechamentoCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  dm.carregarFormasDePagamento(true);

  if (dm.verificaNotasContingenciaNoCaixa = true) then
  begin
    dm.exibe_painel_erro('Existem NFC-e(s) em contingência pendentes de envio. Envie as notas e contingência antes de fechar o caixa. '#13#10#13#10 + ' ', 'Ok');
    close;

  end;

end;

end.

