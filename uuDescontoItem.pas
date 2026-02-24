unit uuDescontoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, Buttons, Mask,  
  ExtCtrls;

type
  TfrmDescontoItem = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    edValorDesconto: TCurrencyEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure aplicarDesconto();
  public
    { Public declarations }
  end;

var
  frmDescontoItem: TfrmDescontoItem;

implementation

uses uu_data_module, uu_caixa_restaurante;

{$R *.dfm}



procedure TfrmDescontoItem.aplicarDesconto();
var
 valorDesconto : double;
 valorUnitarioProduto : double;
begin


  if (ComboBox1.ItemIndex = 0) then
   begin
     valorUnitarioProduto:= dm.qry_movimento_mesa.fieldbyname('valor_unitario').value;
     valorDesconto := ( (valorUnitarioProduto * edValorDesconto.value) / 100);
   end
  else
   begin
     valorDesconto := edValorDesconto.Value;
   end;

   dm.aplicaDescontoItem(frm_caixa_restaurante.ed_numero_mesa.Text,dm.qry_movimento_mesa.fieldbyname('cod_movimento').value,valorDesconto); 


end;

procedure TfrmDescontoItem.BitBtn1Click(Sender: TObject);
begin
  inherited;
   aplicarDesconto();
   close();
end;

procedure TfrmDescontoItem.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmDescontoItem.FormActivate(Sender: TObject);
begin
  inherited;
  ComboBox1.SetFocus;
end;

end.
