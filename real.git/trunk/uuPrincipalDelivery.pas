unit uuPrincipalDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, Vcl.ActnList,
  System.Actions;

type
  TfrmPrincipalDelivery = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure btDeliveryClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalDelivery: TfrmPrincipalDelivery;

implementation

uses uu_cad_clientes_delivery, uuPedidoDelivery, uuExpedicaoDelivery,
  uuCadBairros;

{$R *.dfm}

procedure TfrmPrincipalDelivery.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPrincipalDelivery.btDeliveryClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmPedidosDelivery,frmPedidosDelivery);
  frmPedidosDelivery.ShowModal;
  frmPedidosDelivery.free;
end;

procedure TfrmPrincipalDelivery.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
  frmExpedicaoDelivery.showmodal();
  frmExpedicaoDelivery.free;
end;

procedure TfrmPrincipalDelivery.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Application.createform(TfrmCadBairros,frmCadBairros);
  frmCadBairros.showmodal;
  frmCadBairros.free;

end;

procedure TfrmPrincipalDelivery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = vk_escape then
  close;
end;

end.
