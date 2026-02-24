unit uu_pagamento_faturado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, ExtCtrls, Buttons, RxCurrEdit,
  AdvDateTimePicker, uu_frm_principal, RxToolEdit, Vcl.ComCtrls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Mask, Vcl.Menus;

type
  Tfrm_pagamento_faturado = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    ed_cod_cliente: TEdit;
    bt_pesq_cliente: TSpeedButton;
    Label1: TLabel;
    Panel3: TPanel;
    ed_desc_cliente: TEdit;
    lb_nome_fantasia: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel7: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edLimiteTotalClienteFaturado: TCurrencyEdit;
    edLimiteUtilizadolClienteFaturado: TCurrencyEdit;
    edLimiteLivreClienteFaturado: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    edDataVencimento: TAdvDateTimePicker;
    memoObs: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function validaFaturamento(): boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    LPodeFechar: boolean;
  public
    { Public declarations }

    localOrigem: smallint; // 1- Formulario de encerramento, 2 - Delivery
  end;

var
  frm_pagamento_faturado: Tfrm_pagamento_faturado;

implementation

uses
  uu_encerramento, uu_data_module, uu_cad_clientes, uuPedidoDelivery;

{$R *.dfm}

procedure Tfrm_pagamento_faturado.FormCreate(Sender: TObject);
begin
  inherited;
  LPodeFechar := false;
end;

procedure Tfrm_pagamento_faturado.FormActivate(Sender: TObject);
begin
  inherited;
  ed_cod_cliente.SetFocus;
  edDataVencimento.Date := now;
end;

procedure Tfrm_pagamento_faturado.BitBtn2Click(Sender: TObject);
begin
  inherited;
  frm_encerramento.setRetornoForma(false);
  LPodeFechar := true;
  close;
end;

procedure Tfrm_pagamento_faturado.Edit1Exit(Sender: TObject);
begin
  inherited;
  if ((Sender is Tedit and ((Sender as Tedit).Name = 'ed_cod_cliente')) and (Trim(ed_cod_cliente.Text) <> '')) then
  begin
    edDataVencimento.Date := Now + getPrazoCliente(ed_cod_cliente.Text);
  end;
end;

function Tfrm_pagamento_faturado.validaFaturamento(): boolean;
begin
  if (verificaExistenciaCliente(ed_cod_cliente.Text) = false) then
  begin
    Showmessage('O cliente informado não é válido!');
    ed_cod_cliente.Clear;
    ed_desc_cliente.clear;
    ed_cod_cliente.SetFocus;
    Result := false;
    exit;
  end;

  if edDataVencimento.Date < data_do_sistema then
  begin
    ShowMessage('Data de vencimento não pode ser menor que a data atual!');
    result := false;
    exit;
  end;

  if (verificaClienteAtivo(ed_cod_cliente.Text) = false) then
  begin
    dm.exibe_painel_erro('Não é possível gerar fatura para este cliente, pois o cadastro do mesmo encontra-se INATIVO!', '');

    ed_cod_cliente.Clear;
    ed_desc_cliente.clear;
    ed_cod_cliente.SetFocus;
    Result := false;
    exit;
  end;

  case localOrigem of
    1:
      begin
        if (verificaClienteTemCredito(ed_cod_cliente.text, frm_encerramento.getValorFormaPagamento) = false) then
        begin
          dm.exibe_painel_erro('O cliente informado não possui credito  suficiente para efetuar o faturamento!', '');
          ed_cod_cliente.Clear;
          ed_desc_cliente.clear;
          ed_cod_cliente.SetFocus;
          Result := false;
          exit;
        end;
      end;
    2:
      begin
        if (verificaClienteTemCredito(ed_cod_cliente.text, frmPedidosDelivery.getValorFormaPagamento) = false) then
        begin
          dm.exibe_painel_erro('O cliente informado não possui credito  suficiente para efetuar o faturamento!', '');
          ed_cod_cliente.Clear;
          ed_desc_cliente.clear;
          ed_cod_cliente.SetFocus;
          Result := false;
          exit;
        end;
      end;
  end;

  Result := true;
end;

procedure Tfrm_pagamento_faturado.BitBtn1Click(Sender: TObject);
var
  obs: string;
  ct: integer;
begin
  inherited;
  if (validaFaturamento() = true) then
  begin
    for ct := 0 to memoObs.Lines.Count - 1 do
    begin
      obs := obs + memoObs.lines[ct];
    end;

    case localOrigem of
      1:
        begin
          frm_encerramento.setRetornoForma(true);
          frm_encerramento.codClienteFaturado := trim(ed_cod_cliente.Text);
          frm_encerramento.observacaoFaturamento := obs;
          frm_encerramento.dataVencimentoFaturamento := edDataVencimento.Date;
          Close;

        end;

      2:
        begin
          frmPedidosDelivery.setRetornoForma(true);
          frmPedidosDelivery.setCodDiverso(trim(ed_cod_cliente.Text));
          frmPedidosDelivery.setObsDiversa(obs);
          close;
        end;
    end;
    LPodeFechar := true;
  end;

end;

procedure Tfrm_pagamento_faturado.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if LPodeFechar = false then
    CanClose := false
  else
    CanClose := true;

end;

procedure Tfrm_pagamento_faturado.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  if dm.verificaPermissaoAcao('I40001001', true, true) = true then
  begin
    Application.CreateForm(Tfrm_cad_clientes, frm_cad_clientes);
    frm_cad_clientes.showmodal;
    frm_cad_clientes.free;
  end;

end;

end.

