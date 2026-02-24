unit uuLeituraBarrasPesoRestaurante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, jpeg, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Menus;

type
  TfrmLerPesoRestauranteBarras = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    edCodigoBarras: TEdit;
    Timer1: TTimer;
    procedure edCodigoBarrasChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLerPesoRestauranteBarras: TfrmLerPesoRestauranteBarras;

implementation

uses uuPrototipoCaixaREstaurante;

{$R *.dfm}

procedure TfrmLerPesoRestauranteBarras.edCodigoBarrasChange(Sender: TObject);
var
 strPreco : string;
begin


   IF (Length(TRIM(edCodigoBarras.Text)) = 13) then
    begin

     strPreco := copy(edCodigoBarras.text,8,6);
     strPreco := IntToStr(StrToInt(strPreco));
     strPreco := copy(strPreco,0,Length(strPreco)-1);

     case Length(strPreco) of
      3: begin
           strPreco := copy(strPreco,0,1)+','+copy(strPreco,2,2);
         end;

      4: begin
           strPreco := copy(strPreco,0,2)+','+copy(strPreco,3,2);
         end;

      5: begin
           strPreco := copy(strPreco,0,3)+','+copy(strPreco,4,2);
         end;
     end;


     edCodigoBarras.Clear;
     frm_caixa_restaurante.ed_valor_produto.Text := strPreco;
     close;
    end;

end;

procedure TfrmLerPesoRestauranteBarras.Button1Click(Sender: TObject);
begin
  inherited;
  ShowMessage(IntToStr(Length(edCodigoBarras.text)));
end;

end.
