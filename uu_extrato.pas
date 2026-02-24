unit uu_extrato;

interface

uses
  Windows, Messages, SysUtils, Variants, acbrutil, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, uu_modelo_vazio, IBX.IBQuery,
  IBX.IBDatabase, DB, cxGraphics, cxControls, cxSpinEdit, JvValidateEdit,
  AdvGlassButton, AdvOfficeImage, InformacaoMesaDAO, AeroButtons, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, JvExStdCtrls, JvEdit, cxTextEdit,
  cxMaskEdit;

type
  Tfrm_extrato = class(Tfrm_modelo_vazio)
    pn_fiscal: TPanel;
    dsMesas: TDataSource;
    pnl_desconto: TPanel;
    ckb_desconto: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    lb_mesa: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    edQtdPessoas: TcxSpinEdit;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    lbTotalServicos: TLabel;
    Panel5: TPanel;
    Label13: TLabel;
    lbPagamentosParciais: TLabel;
    Panel6: TPanel;
    Label15: TLabel;
    lbDesconto: TLabel;
    Panel7: TPanel;
    Label7: TLabel;
    lbTotalConta: TLabel;
    edValorDesconto: TJvValidateEdit;
    lbEditDesconto: TLabel;
    btImprimir: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    AdvOfficeImage1: TAdvOfficeImage;
    AdvOfficeImage2: TAdvOfficeImage;
    AdvOfficeImage3: TAdvOfficeImage;
    AdvOfficeImage4: TAdvOfficeImage;
    AdvOfficeImage5: TAdvOfficeImage;
    rdDesconto: TRadioGroup;
    rdPercentual: TRadioButton;
    rdValor: TRadioButton;
    btBesbloquearDesconto: TAeroSpeedButton;
    lbTotalProdutos: TJvValidateEdit;
    Label6: TLabel;
    procedure ed_valor_tx_servKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure IAeverButton2Click(Sender: TObject);
    procedure ed_valor_tx_servEnter(Sender: TObject);
    procedure bt_imprimirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure buscaDadosMesa();
    procedure AcaoImprimir();
    procedure SpeedButton2Click(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure rdTipoDescontoRadioButtonClick(Sender: TObject);
    procedure rdPercentualClick(Sender: TObject);
    procedure rdValorClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btBesbloquearDescontoClick(Sender: TObject);
  private
    procedure calculaDadosDaMesa;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frm_extrato: Tfrm_extrato;

implementation

uses
  uu_data_module, uu_frm_principal, InformacaoMesa;

{$R *.dfm}

procedure Tfrm_extrato.calculaDadosDaMesa();
var
  qtdItens: integer;
  descontoMaximo, valorDescontoCalculado: double;
  LInformacoesMesa: TInformacaoMesa;
  LInformacoesMesaDAO: TInformacaoMesaDAO;
  LQryConsulta: TIBquery;
  Ltransacao: TIBTransaction;
  tipoDesconto: smallint;
begin

  Ltransacao := TIBTransaction.Create(nil);
  LQryConsulta := TIBquery.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');
  Ltransacao.DefaultDatabase := dm.dbrestaurante;

  if rdPercentual.Checked then
  begin
    tipoDesconto := 0;
    valorDescontoCalculado := RoundABNT(((lbTotalProdutos.Value * edValorDesconto.Value) / 100), 2);
  end
  else
  begin
    tipoDesconto := 1;
    valorDescontoCalculado := edValorDesconto.Value;
  end;

  LInformacoesMesa := TInformacaoMesa.Create;
  LInformacoesMesaDAO := TInformacaoMesaDAO.Create;

  try
    Ltransacao.Active := true;
    LQryConsulta.Database := dm.dbrestaurante;
    LQryConsulta.Transaction := Ltransacao;
    LQryConsulta := TIBQuery.Create(Self);
    LQryConsulta.Database := dm.dbrestaurante;
    LQryConsulta.Transaction := Ltransacao;
    LQryConsulta.Active := false;

    LQryConsulta.SQL.clear;

    dm.transacao.Active := false;
    dm.transacao.Active := true;
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('select * from rodapeextrato3(' + Quotedstr(lb_mesa.caption) + ',' + dm.TrocaVirgPPto(Floattostr(percentualTaxaServico)) + ')');
    dm.qryauxiliar.Active := true;

    lbTotalProdutos.value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
    lbTotalServicos.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORTXSERV').Value);
    lbPagamentosParciais.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORPAGO').Value);
    lbDesconto.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORTOTALDESCONTO').Value);
    lbTotalConta.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORRESTANTE').Value);

    LQryConsulta.SQL.Add('select count(*) as ct  from movimento_mesa ms where ms.cod_mesa=' + Quotedstr(lb_mesa.Caption));
    LQryConsulta.Active := true;
    LQryConsulta.FetchAll;
    qtdItens := LQryConsulta.FieldByName('ct').Value;
    descontoMaximo := lbTotalProdutos.Value - 0.01;

    if (edValorDesconto.Value < 0) then
    begin
      raise Exception.Create('Desconto não pode ser negativo!');

    end;

    if valorDescontoCalculado > descontoMaximo then
    begin
      raise Exception.Create('Valor máximo de desconto para essa venda não pode ultrapassar ' + FormatFloat('R$ ###,###,##0.00 ', descontoMaximo));
    end;

    LQryConsulta.Active := false;

    LQryConsulta.SQL.Clear;
    LQryConsulta.SQL.Add('execute procedure distribui_descontos(' + QuotedstR(lb_mesa.Caption) + ',' + Inttostr(tipoDesconto) + ',' + dm.TrocaVirgPPto(Floattostr(edValorDesconto.Value)) + ')');
    ////dm.adicionalog(LQryConsulta.SQL.Text);

    try
      LQryConsulta.ExecSQL;
      Ltransacao.Commit;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao executar desconto! ' + e.Message);
      end;
    end;

    LInformacoesMesa.Mesa := lb_mesa.Caption;
    LInformacoesMesa.hora := Time;
    LInformacoesMesa.codUsuario := codigo_usuario;
    LInformacoesMesa.qtdPessoas := edQtdPessoas.Value;
    LInformacoesMesa.tipoDesconto := tipoDesconto;
    LInformacoesMesa.valorDesconto := edValorDesconto.Value;
    LInformacoesMesaDAO.atualizar(LInformacoesMesa);

    dm.transacao.Active := false;
    dm.transacao.Active := true;
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('select * from rodapeextrato3(' + Quotedstr(lb_mesa.caption) + ',' + dm.TrocaVirgPPto(Floattostr(percentualTaxaServico)) + ')');
    dm.qryauxiliar.Active := true;

    lbTotalProdutos.value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
    lbTotalServicos.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORTXSERV').Value);
    lbPagamentosParciais.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORPAGO').Value);
    lbDesconto.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORTOTALDESCONTO').Value);
    lbTotalConta.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryauxiliar.fieldbyname('VALORRESTANTE').Value);

    edQtdPessoas.SelectAll;

  finally
    LQryConsulta.Active := false;
    Ltransacao.Active := false;
    FreeAndNil(LInformacoesMesa);
    FreeAndNil(LInformacoesMesaDAO);
    FreeAndNil(LQryConsulta);
    FreeAndNil(Ltransacao);

  end;

end;

procedure Tfrm_extrato.Edit1Exit(Sender: TObject);
begin
  inherited;
  calculaDadosDaMesa();
end;

procedure Tfrm_extrato.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_f3) then
  begin
    btImprimir.Click;
  end;
end;

procedure Tfrm_extrato.buscaDadosMesa();
var
  LInformacoesMesa: TInformacaoMesa;
  LinformacoesMesaDAO: TInformacaoMesaDAO;
  tipoDesconto: smallint;
begin

  LInformacoesMesa := TInformacaoMesa.Create();
  LinformacoesMesaDAO := TInformacaoMesaDAO.Create();

  try
    LInformacoesMesa.Mesa := lb_mesa.Caption;
    LinformacoesMesaDAO.getInformacoes(LInformacoesMesa);
    edQtdPessoas.Value := LInformacoesMesa.qtdPessoas;
    if LInformacoesMesa.tipoDesconto = 0 then
      rdPercentual.Checked := true
    else
      rdValor.Checked := true;
    edValorDesconto.Value := LInformacoesMesa.valorDesconto;

    ////dm.adicionalog('O sistema trouxe '+FormatFloat('#0.00',edValorDesconto.value )+' de desconto da mesa '+lb_mesa.Caption);

  finally
    FreeAndNil(LInformacoesMesa);
    FreeAndNil(LinformacoesMesaDAO);
  end;

  calculaDadosDaMesa();
end;

procedure Tfrm_extrato.ed_valor_tx_servKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if not ((Sender is TMemo)) then
      Perform(WM_NEXTDLGCTL, 0, 0)
  end;
  if Key = vk_escape then
  begin
    Close;
  end;

end;

procedure Tfrm_extrato.FormActivate(Sender: TObject);
begin
  inherited;
  buscaDadosMesa();
  if (dm.verificaPermissaoAcao('B20002016', false, false) = false) then
  begin
    edValorDesconto.Visible := false;
    rdDesconto.Visible := false;
    lbEditDesconto.Visible := false;
    rdPercentual.Visible := false;
    rdValor.Visible := false;
  end;

end;

procedure Tfrm_extrato.AcaoImprimir();
begin
  calculaDadosDaMesa();
  dm.apagaExtratosEmitidos(lb_mesa.Caption);
  dm.insereExtratosEmitidos(lb_mesa.Caption);
  dm.InsereChavesMovimento(numero_caixa, lb_mesa.Caption);
  calculaDadosDaMesa();
  dm.ImprimeComprovanteMesa(tcPreConta, lb_mesa.Caption, '', false);
  close;
end;

procedure Tfrm_extrato.IAeverButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_extrato.rdPercentualClick(Sender: TObject);
begin
  inherited;
  calculaDadosDaMesa();

end;

procedure Tfrm_extrato.rdValorClick(Sender: TObject);
begin
  inherited;
  calculaDadosDaMesa();
end;

procedure Tfrm_extrato.rdTipoDescontoRadioButtonClick(Sender: TObject);
begin
  inherited;
  calculaDadosDaMesa();
end;

procedure Tfrm_extrato.ed_valor_tx_servEnter(Sender: TObject);
begin
  if Sender is TCheckBox then
  begin
    (Sender as TCheckBox).Color := cor_foco_edit;
  end;
end;

procedure Tfrm_extrato.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  close();
end;

procedure Tfrm_extrato.btBesbloquearDescontoClick(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B20002016', true, true) = true) then
  begin
    edValorDesconto.Visible := true;
    rdDesconto.Visible := true;
    lbEditDesconto.Visible := true;
    rdPercentual.Visible := true;
    rdValor.Visible := true;
    btBesbloquearDesconto.Visible := false;
  end;

end;

procedure Tfrm_extrato.btImprimirClick(Sender: TObject);
begin
  inherited;
  AcaoImprimir();
end;

procedure Tfrm_extrato.bt_imprimirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    close;

end;

procedure Tfrm_extrato.SpeedButton2Click(Sender: TObject);
var
  x: integer;
  valor: integer;
begin
  inherited;
  x := 0;
  while ((x < ComponentCount - 1)) do
  begin
    if (Components[x] is Tedit) and ((Components[x] as Tedit).Name = 'ed_n_pessoas') then
    begin

      try
        begin
          valor := strToInt((Components[x] as Tedit).Text);
          valor := valor + 1;
        end;
      except
        valor := 1;
      end;

      (Components[x] as Tedit).Text := IntToStr(valor);
    end;
    x := x + 1;
  end;

end;

end.

