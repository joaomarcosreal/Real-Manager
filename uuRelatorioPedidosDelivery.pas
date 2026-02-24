unit uuRelatorioPedidosDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, Buttons, Mask, ExtCtrls,
  RealFramework, system.DateUtils, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, RxToolEdit, Vcl.Menus;

type
  TfrmRelPedidosDeliveryPorCliente = class(Tfrm_modelo_rel_datas)
    RadioGroup2: TRadioGroup;
    Panel3: TPanel;
    Panel1: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    btPesqClienteDelivery: TSpeedButton;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel4: TPanel;
    edDataFinal: TDateEdit;
    edDataInicial: TDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    edCodCliDelivery: TEdit;
    edNomeClienteDelivery: TEdit;
    procedure edCodCliDeliveryChange(Sender: TObject);
    procedure emitirRelatorio();
    function verificavalidade(): boolean;
    procedure bt_imprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    procedure ValidaDatas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPedidosDeliveryPorCliente: TfrmRelPedidosDeliveryPorCliente;

implementation

uses
  uu_modelo_vazio, uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelPedidosDeliveryPorCliente.edCodCliDeliveryChange(Sender: TObject);
begin
  inherited;
  if TRIM(edCodCliDelivery.TEXT) = '' then
    edNomeClienteDelivery.Clear;
end;

procedure TfrmRelPedidosDeliveryPorCliente.ValidaDatas();
begin

  try
    StrToDate(DateToStr(edDataInicial.Date));
    StrToDate(DateToStr(edDataFinal.Date));
    if edDataFinal.Date < edDataInicial.Date then
      raise Exception.Create('Período inválido');
  finally

  end;

end;

function TfrmRelPedidosDeliveryPorCliente.verificavalidade(): boolean;
begin

  try
    try

      try
        ValidaDatas;
      except
        raise Exception.Create('Período inválido!');
      end;

      if (trim(edCodCliDelivery.Text) <> '') then
      begin
        if (verificaExistenciaClienteDelivery(edCodCliDelivery.Text) = false) then
        begin
          ShowMessage('Cliente informado não existe!');
          Result := false;
          exit;
        end;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, false);
        result := false;
      end;
    end;
  finally

  end;

end;

procedure TfrmRelPedidosDeliveryPorCliente.emitirRelatorio();
begin
  dm.transacao.active := false;
  dm.transacao.Active := true;
  dm_relatorios.qryClientesPedidosDelivery.Active := false;
  dm_relatorios.qryClientesPedidosDelivery.sql.clear;

//  if (trim(edCodCliDelivery.text) <> '') then
//    dm_relatorios.qryClientesPedidosDelivery.sql.add('select * from clientes_delivery where codigo='+Quotedstr(edCodCliDelivery.Text))
//  else
//  dm_relatorios.qryClientesPedidosDelivery.sql.add('select * from clientes_delivery ');
//  dm_relatorios.qryClientesPedidosDelivery.Active:=true;
  // Query dos pedidos
  dm_relatorios.qryPedidosClientesDelivery.Active := false;
  dm_relatorios.qryPedidosClientesDelivery.SQL.clear;
  dm_relatorios.qryPedidosClientesDelivery.SQL.add(' select cl.codigo as cod_cli, cl.nome, cl.telefone,  p.codigo, p.data,p.hora,p.valor_entrega, p.valor_total,c');
  dm_relatorios.qryPedidosClientesDelivery.SQL.add('.nome_usuario  from pedidos_delivery p');
  dm_relatorios.qryPedidosClientesDelivery.SQL.add(' inner join caixas c on  (c.codigo =  p.cod_caixa)');
  dm_relatorios.qryPedidosClientesDelivery.SQL.add('  inner join clientes_delivery  cl  on (cl.codigo  = p.cod_cliente)');

  dm_relatorios.qryPedidosClientesDelivery.sql.add(' where p.data between ' + QuotedStr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)));
  dm_relatorios.qryPedidosClientesDelivery.sql.add(' and ' + QuotedStr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
  if (trim(edCodCliDelivery.text) <> '') then
    dm_relatorios.qryPedidosClientesDelivery.sql.add(' and p.cod_cliente =' + Quotedstr(edCodCliDelivery.Text));

  dm_relatorios.qryPedidosClientesDelivery.SQL.add('order by p.data desc');
  dm_relatorios.qryPedidosClientesDelivery.Active := true;
  dm.adicionaLog(dm_relatorios.qryPedidosClientesDelivery.SQL.Text);

  dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relPedidosClienteDelivery.fr3', true);
  dm_relatorios.setPeriodoRelatorio('De  ' + edDataInicial.Text + '  até  ' + edDataFinal.Text);
  dm_relatorios.rpt.ShowReport(true);

end;

procedure TfrmRelPedidosDeliveryPorCliente.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  if verificavalidade then
  begin
    emitirRelatorio();
  end;
end;

procedure TfrmRelPedidosDeliveryPorCliente.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(Now);
  edDataFinal.Date := Now;
  edDataInicial.SetFocus;
end;

procedure TfrmRelPedidosDeliveryPorCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dm_relatorios.qryClientesPedidosDelivery.Active := false;
  dm_relatorios.qryPedidosClientesDelivery.Active := false;
  dm_relatorios.qryItensPedidoDelivery.Active := false;
end;

end.

