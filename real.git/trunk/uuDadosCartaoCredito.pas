unit uuDadosCartaoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls;

type
  TfrmDadosCartaoDeCredito = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edNumeroCartao: TEdit;
    Label2: TLabel;
    edNomeOperadora: TEdit;
    Label3: TLabel;
    edValidade: TEdit;
    Label4: TLabel;
    edCodigoCartao: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosCartaoDeCredito: TfrmDadosCartaoDeCredito;

implementation

uses uuPedidoDelivery;

{$R *.dfm}

procedure TfrmDadosCartaoDeCredito.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmDadosCartaoDeCredito.FormActivate(Sender: TObject);
begin
  inherited;
  edNomeOperadora.SetFocus;
end;

procedure TfrmDadosCartaoDeCredito.BitBtn1Click(Sender: TObject);
begin
  inherited;
  frmPedidosDelivery.soperadoraCartao:= edNomeOperadora.Text;
  frmPedidosDelivery.snumeroCartao := edNumeroCartao.Text;
  frmPedidosDelivery.svalidadeCartao := edValidade.Text;
  frmPedidosDelivery.scodigoCartao := edCodigoCartao.Text;
  Close;
end;

end.
