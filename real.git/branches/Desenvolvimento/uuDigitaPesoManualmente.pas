unit uuDigitaPesoManualmente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,   StdCtrls,
  AdvTouchKeyboard, ExtCtrls, RxCurrEdit,Buttons, RxToolEdit;

type
  TfrmDigitaPesoManualmente = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    Label1: TLabel;
    Panel2: TPanel;
    ed_quantidade: TCurrencyEdit;
    procedure FormActivate(Sender: TObject);
    procedure ed_quantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDigitaPesoManualmente: TfrmDigitaPesoManualmente;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmDigitaPesoManualmente.FormActivate(Sender: TObject);
begin
  inherited;
  ed_quantidade.SetFocus;
end;

procedure TfrmDigitaPesoManualmente.ed_quantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key  = VK_RETURN then
   begin
     pesoLidoBalanca := FloatToStr(ed_quantidade.Value);
     Close; 
   end;
end;

end.
