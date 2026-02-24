unit uuAberturaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, DB, ibx.ibquery,
  RxCurrEdit, acbrDevice, RxToolEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, AdvSmoothTouchKeyBoard,
  Vcl.Mask, Vcl.Menus;

type
  TfrmAberturaCaixa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    edValorFundo: TCurrencyEdit;
    Label1: TLabel;
    B30001002: TBitBtn;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    ckbCobrarTaxa: TCheckBox;
    rdTipoCaixa: TRadioGroup;
    ckbCodGarcon: TCheckBox;
    rdTurno: TRadioGroup;
    lbecf: TLabel;
    lbDataEcf: TLabel;
    AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard;
    procedure BitBtn1Click(Sender: TObject);
    procedure gravarAberturaDeCaixa();
    procedure B30001002Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAberturaCaixa: TfrmAberturaCaixa;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmAberturaCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmAberturaCaixa.gravarAberturaDeCaixa();
var
  qryAuxiliarAbertura: TIBQuery;
  codigoCaixa: string;
  dataAbertura: string;
  dataSistema: string;
  horaAbertura: string;
  cobra_servico: integer;
  turno: smallint;
begin

  if rdTurno.ItemIndex = 0 then
    turno := 1
  else
    turno := 2;

  codigoCaixa := dm.geraCodigo('G_CAIXAS', 5);
  horaAbertura := Quotedstr(FormatDateTime('HH:MM:SS', time));
  dataSistema := Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema));

  if (ckbCobrarTaxa.Checked = false) then
  begin

    cobra_servico := 1;
    percentualTaxaServico := StrToFloat(dm.LeIni(2, 'TAXA_SERVICO', 'percentual'));
    dm.tb_parametros.Active := True;
    dm.tb_parametros.Edit;
    dm.tb_parametrosCOBRA_SERVICO.Value := 1;
    dm.tb_parametros.Post;
    if dm.transacao.Active = false then
      dm.transacao.Active := True;
    dm.transacao.Commit;

  end
  else
  begin
    cobra_servico := 0;
    percentualTaxaServico := 0;

    dm.tb_parametros.Active := True;
    dm.tb_parametros.Edit;
    dm.tb_parametrosCOBRA_SERVICO.Value := 0;
    dm.tb_parametros.Post;
    if dm.transacao.Active = false then
      dm.transacao.Active := True;
    dm.transacao.Commit;

  end;

  if (ckbCodGarcon.Checked = false) then
  begin
    dm.gravaini('CAIXA', 'usa_cod_garcon', '1');

    dm.tb_parametros.Active := True;
    dm.tb_parametros.Edit;
    dm.tb_parametrosUSA_COD_GARCON.Value := 1;
    dm.tb_parametros.Post;
    if dm.transacao.Active = false then
      dm.transacao.Active := True;
    dm.transacao.Commit;

  end
  else
  begin
    dm.gravaini('CAIXA', 'usa_cod_garcon', '0');

    dm.tb_parametros.Active := True;
    dm.tb_parametros.Edit;
    dm.tb_parametrosUSA_COD_GARCON.Value := 0;
    dm.tb_parametros.Post;
    if dm.transacao.Active = false then
      dm.transacao.Active := True;
    dm.transacao.Commit;

  end;

  qryAuxiliarAbertura := TIBquery.create(self);
  qryAuxiliarAbertura.database := dm.dbrestaurante;
  qryAuxiliarAbertura.transaction := dm.transacao;
  qryAuxiliarAbertura.Active := False;
  qryAuxiliarAbertura.SQL.Clear;

  qryAuxiliarAbertura.SQL.add('insert into caixas (cod_empresa,codigo,suprimento_inicial,data_abertura,data_sistema,hora_abertura,cod_usuario,nome_usuario,status,numero_caixa,cobra_servico,turno) values');
  qryAuxiliarAbertura.sql.add('(' + Quotedstr(codEmpresa) + ',');
  qryAuxiliarAbertura.sql.add(Quotedstr(codigoCaixa) + ',');
  qryAuxiliarAbertura.sql.add('' + dm.TrocaVirgPPto(trim(FloatToStr(edValorFundo.value))) + ',');
  qryAuxiliarAbertura.sql.add('current_date,');
  qryAuxiliarAbertura.sql.add('' + dataSistema + ',');
  qryAuxiliarAbertura.sql.add('current_time,');
  qryAuxiliarAbertura.sql.add('' + Quotedstr(codigo_usuario) + ',');
  qryAuxiliarAbertura.sql.add('' + Quotedstr(nome_usuario) + ',');
  qryAuxiliarAbertura.sql.add('1,');
  qryAuxiliarAbertura.sql.add('' + Quotedstr(numero_caixa) + ',');
  qryAuxiliarAbertura.sql.add('' + IntToStr(cobra_servico) + ',');
  qryAuxiliarAbertura.sql.add('' + IntToStr(turno) + ')');

  try
    begin
      qryAuxiliarAbertura.ExecSQL;
    end;
  except
    begin
      ShowMessage('Erro ao gravar na tabela de caixas. Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(qryAuxiliarAbertura.SQL, 'Módulo de abertura de caixa', 'Erro ao log de operação', codigo_usuario);
      exit;
    end;
  end;

  ultimoCaixaAberto := codigoCaixa;
  dm.gravaini('CAIXA', 'ultimoCodigo', codigoCaixa);

  dm.gravarSuprimento(codEmpresa, ultimoCaixaAberto, edValorFundo.Value, true);
  dm.tb_parametros.Active := True;
  dm.tb_parametros.Edit;
  if rdTipoCaixa.ItemIndex = 0 then
    dm.tb_parametrosBOATE.Value := 0
  else
    dm.tb_parametrosBOATE.Value := 1;
  dm.tb_parametros.Post;

  dm.transacao.Commit;

  dm.exibe_painel_erro('Abertura de Caixa EFETUADA!', 'Ok', mtInformation);
  close;
end;

procedure TfrmAberturaCaixa.B30001002Click(Sender: TObject);
var
  estado: TACBrECFEstado;
begin
  inherited;
  dm.atualizaDataDoSistema();

  if (data_do_sistema <> Date) then
  begin
    dm.exibe_painel_erro('Data do sistema difere da data do computador. Verifique se' + ' o encerramento do dia já foi efetuado.!', 'Ok');
    exit;
  end;

  gravarAberturaDeCaixa();

end;

procedure TfrmAberturaCaixa.FormActivate(Sender: TObject);
var
  dataEcf: Tdate;
begin
  inherited;

  dm.atualizaDataDoSistema();
  dm.tb_parametros.Refresh;
  // Verifica se a taxa de serviço é configurada para cobrança na abertura do caixa.
  if (selecionarCobrancaNaAberturaDoCaixa = 1) then
  begin
    ckbCobrarTaxa.Visible := true;
//     ckbCobrarTaxa.Checked:=false;
  end
  else
  begin
    ckbCobrarTaxa.Visible := false;
//     ckbCobrarTaxa.Checked:=false;
  end;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'selecionaUsoGarcomNaAbertura')) = 1) then
  begin
    ckbCodGarcon.Visible := True;
//     ckbCodGarcon.Checked := false;
  end
  else
  begin
    ckbCodGarcon.Visible := false;
//     ckbCodGarcon.Checked := false;
  end;

  if (dm.tb_parametrosUSA_COD_GARCON.Value = 0) then
    ckbCodGarcon.Checked := true
  else
    ckbCodGarcon.Checked := false;

  if (dm.tb_parametrosCOBRA_SERVICO.Value = 0) then
    ckbCobrarTaxa.Checked := true
  else
    ckbCobrarTaxa.Checked := false;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'selecionaTipoCaixaNaAbertura')) = 1) then
  begin
    rdTipoCaixa.Visible := true;

    if (dm.verificaSeFuncionaComoBoate = false) then
      rdTipoCaixa.ItemIndex := 0
    else
      rdTipoCaixa.ItemIndex := 1;

  end
  else
  begin
    rdTipoCaixa.Visible := false;
    if (dm.verificaSeFuncionaComoBoate = false) then
      rdTipoCaixa.ItemIndex := 0
    else
      rdTipoCaixa.ItemIndex := 1;
  end;

  lbDataEcf.Visible := true;
  lbecf.Visible := true;
  dataEcf := StrToDate(FormatDateTime('DD/MM/YYY', date));
  lbDataEcf.Caption := FormatDateTime('DD/MM/YYY', dataEcf);

end;

procedure TfrmAberturaCaixa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
  begin
    B30001002.Click;

  end;
end;

end.

