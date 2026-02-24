unit uuDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,
  ExtCtrls, AdvTouchKeyboard, RxToolEdit, RxCurrEdit;

type
  TfrmDesconto = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    ckbPercentual: TRadioButton;
    ckbValor: TRadioButton;
    Panel3: TPanel;
    edValorDesconto: TCurrencyEdit;
    Label2: TLabel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    Label3: TLabel;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   procedure setOrigem(o : SmallInt);

  private
    { Private declarations }
    origem : smallint;
  public
    { Public declarations }
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses uu_encerramento, uu_extrato;

{$R *.dfm}

procedure TfrmDesconto.FormActivate(Sender: TObject);
begin
  inherited;
  edValorDesconto.SetFocus;
end;


procedure TfrmDesconto.setOrigem(o : SmallInt);
begin
  origem := o;

end;

procedure TfrmDesconto.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if ( edValorDesconto.value < 0 ) then
   begin
     ShowMessage('Desconto não pode ser negativo!');
     exit;
   end;

  if ( (ckbPercentual.Checked ) and ( edValorDesconto.Value  > 99.99)) then
   begin
     ShowMessage('Desconto não pode ser superior a 99.99');
     exit;
   end;





   if ( origem = 1) then
    begin

      if ( (ckbValor.Checked ) and ( edValorDesconto.value  > frm_extrato.ed_valor_bruto.Value )) then
       begin
         ShowMessage('Desconto não pode ser superior ao subtotal da conta');
         exit;
       end;







      frm_extrato.ed_valor_desconto.Text := FloatToStr(edValorDesconto.Value);
      if ckbPercentual.Checked then
        frm_extrato.ckb_desconto.Checked :=true
      else
        frm_extrato.ckb_desconto.Checked :=false;

    end
   else
    begin

      if ( (ckbValor.Checked ) and ( edValorDesconto.value  > frm_encerramento.ed_valor_bruto.Value )) then
       begin
         ShowMessage('Desconto não pode ser superior ao subtotal da conta');
         exit;
       end;




      frm_encerramento.ed_valor_desconto.Text := FloatToStr(edValorDesconto.Value);
      if ckbPercentual.Checked then
        frm_encerramento.ckb_desconto.Checked :=true
      else
        frm_encerramento.ckb_desconto.Checked :=false;
    end;

   close;


end;

procedure TfrmDesconto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmDesconto.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 38) or (key = 40) then
   begin
    if ckbPercentual.Checked then
     ckbValor.Checked := true
    else
     ckbPercentual.Checked := true;
   end;

end;

end.
