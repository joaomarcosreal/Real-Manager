unit uuSangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, DBCtrls, RxLookup,
  ibx.ibquery, RxCurrEdit, RxToolEdit, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, PngSpeedButton, AdvGlassButton, Vcl.Mask,
  Vcl.Menus;

type
  TfrmSangria = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    cbTipoSangria: TRxDBLookupCombo;
    edValorSangria: TCurrencyEdit;
    memoObsSangria: TMemo;
    Label6: TLabel;
    btPesqFormaPagto: TSpeedButton;
    edCodFormaPagamento: Tedit;
    Label13: TLabel;
    Panel3: TPanel;
    edDescFormaPagto: Tedit;
    pnFundo: TPanel;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    Label1: TLabel;
    pnBottom: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    PngSpeedButton2: TPngSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure gravarSangria();
    function verificaValidade(): boolean;
    procedure btCancelarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSangria: TfrmSangria;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmSangria.FormActivate(Sender: TObject);
begin
  inherited;

  dm.qryTiposSangria.Active := false;
  dm.qryTiposSangria.SQL.clear;
  dm.qryTiposSangria.SQL.add('select * from tipos_sangria order by descricao');
  dm.qryTiposSangria.Active := true;
  edCodFormaPagamento.Text := '001';
end;

procedure TfrmSangria.gravarSangria();
var
  qrySangria: TIBQuery;
  codSangria: string;
  ct: integer;
  obs: string;
begin

  for ct := 0 to memoObsSangria.Lines.Count - 1 do
  begin
    obs := obs + memoObsSangria.lines[ct];
  end;

  qrySangria := TIBquery.create(self);
  qrySangria.database := dm.dbrestaurante;
  qrySangria.transaction := dm.transacao;
  qrySangria.Active := False;
  qrySangria.SQL.Clear;
  qrySangria.Active := false;
  qrySangria.sql.Clear;
  codSangria := dm.geraCodigo('G_SANGRIAS', 5);
  qrySangria.SQL.Add('insert into sangrias (codigo,cod_empresa,codigo_tipo,cod_forma,valor,data,cod_usuario,cod_caixa,obs, cod_usuario_autorizou,nome_usuario_autorizou) values ');
  qrySangria.sql.add('(' + Quotedstr(codSangria) + ',');
  qrySangria.sql.add(Quotedstr(codEmpresa) + ',');
  qrySangria.sql.add('' + Quotedstr(VarToStr(cbTipoSangria.KeyValue)) + ',');
  qrySangria.sql.add('' + Quotedstr(edCodFormaPagamento.Text) + ',');
  qrySangria.sql.add('' + dm.TrocaVirgPPto(trim(FloatToStr(edValorSangria.value))) + ',');
  qrySangria.sql.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
  qrySangria.sql.add('' + QuotedStr(codigo_usuario) + ',');
  qrySangria.sql.add('' + QUotedstr(ultimoCaixaAberto) + ',');
  qrySangria.sql.add('' + QUotedstr(obs) + ',');
  qrySangria.sql.add(QuotedStr(codigo_usuario_responsavel) + ',');
  qrySangria.sql.add(QuotedStr(nome_usuario_responsavel) + ')');

  try
    begin
      qrySangria.ExecSQL;
    end;
  except
    begin
      dm.cria_log_de_erros(qrySangria.sql, 'Módulo de caixa', 'Erro ao efetuar sangria', codigo_usuario);
      exit;
    end;
  end;

  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  try
    dm.imprimeComprovanteSangria(marca_impressora_nao_fiscal_01, codSangria);
  except
    ShowMessage('Erro ao imprimir');

  end;

  dm.exibe_painel_erro('Sangria realizada com sucesso!', '');
  close;

end;

procedure TfrmSangria.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSangria.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSangria.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
  begin
    if (MessageDlg('Confirma Sangria ?', mtConfirmation, [mbYes, mbNo], 0) = MrYes) then
      gravarSangria();
  end;
end;

function TfrmSangria.verificaValidade(): boolean;
begin

  if (verificaExistenciaTipoSangria(VarToStr(cbTipoSangria.KeyValue)) = false) then
  begin
    MessageDlg('Tipo de Sangria inválido!', mtError, [mbOk], 0);
    Result := false;
    Exit;
  end;

  if (edValorSangria.value <= 0) then
  begin
    MessageDlg('Valor de Sangria inválido !', mtError, [mbOk], 0);
    Result := false;
    Exit;
  end;

  if (verificaExistenciaFormaPagto(edCodFormaPagamento.Text) = false) then
  begin
    MessageDlg('Forma de pagamento inválida!', mtError, [mbOk], 0);
    edCodFormaPagamento.clear;
    edDescFormaPagto.clear;
    edCodFormaPagamento.setfocus;
    Result := false;
    exit;
  end;

  Result := true;

end;

procedure TfrmSangria.btCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.

