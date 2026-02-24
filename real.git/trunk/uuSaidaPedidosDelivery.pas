unit uuSaidaPedidosDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, RxGIF, ExtCtrls, Buttons, 
  DBCtrls, ibquery, Vcl.Imaging.GIFImg;

type
  TfrmSaidaPedidosDelivery = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edCodEntregador: TEdit;
    bt_pesq_entregador: TSpeedButton;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    lbNumeroPedido: TLabel;
    Label6: TLabel;
    lbHora: TLabel;
    btNovo: TBitBtn;
    BitBtn1: TBitBtn;
    edNomeEntregador: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure marcaSaidaPedido();
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
    codPedidoSaida : string;
  public
    { Public declarations }
    procedure setCodPedidoSaida(pedidoSaida : string);
  end;

var
  frmSaidaPedidosDelivery: TfrmSaidaPedidosDelivery;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmSaidaPedidosDelivery.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSaidaPedidosDelivery.setCodPedidoSaida(pedidoSaida : string);
begin
  codPedidoSaida := pedidoSaida;
  lbNumeroPedido.Caption:= pedidoSaida;
end;



procedure TfrmSaidaPedidosDelivery.FormCreate(Sender: TObject);
begin
  inherited;
  setCodPedidoSaida('');

end;

procedure TfrmSaidaPedidosDelivery.marcaSaidaPedido();
var
 q: TIBQuery;

begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;
 q.SQL.clear;
 q.sql.add('update pedidos_delivery set cod_entregador='+QuotedStr(edCodEntregador.Text)+',status=2,nome_entregador='+Quotedstr(edNomeEntregador.Text)+',hora_saida=current_timestamp');
 q.SQL.add(' where codigo='+Quotedstr(codPedidoSaida));
 q.ExecSQL;
 if dm.transacao.Active= false then dm.transacao.Active:=true;
 dm.transacao.Commit;
 close;
end;

procedure TfrmSaidaPedidosDelivery.btNovoClick(Sender: TObject);
begin
  inherited;
  marcaSaidaPedido();
end;

end.
