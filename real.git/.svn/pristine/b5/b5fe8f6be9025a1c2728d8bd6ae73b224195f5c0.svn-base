unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    function PosValue(AbsValue, Base, Position: byte): integer;
    function udf_TruncDec(X: double; Decimal: SmallInt): double;
    function retornaTamanhoParteDecimal(valor : string) : integer;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.PosValue(AbsValue, Base, Position: byte): integer;
var
  X: integer;
  I: byte;
begin
  if Position = 0 then
    Result := AbsValue
  else begin
    X := Base;
    for I := 2 to Position do
      X := X * Base;

    Result := X * AbsValue;
  end;
end;


function Tform1.retornaTamanhoParteDecimal(valor : string) : integer;
var
 posicao : integer;
 str  : string;
begin
 posicao:=Pos(',',valor);
 str:=trim(Copy(valor,posicao+1,20));
 result := StrLen(pchar(str));

end;



function Tform1.udf_TruncDec(X: double; Decimal: SmallInt): double;
var
  Factor: integer;
  fracao : integer;
begin
  if (retornaTamanhoParteDecimal(Floattostr(x)) <=2) then
   Result:= x
  else
    begin
      if Decimal <= 0 then
          Result := Int(X)
      else
       begin
          Factor := PosValue(1, 10, Decimal);
          Result := Int(X * Factor) / Factor;
       end;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
 x: double;
begin
 x:=  udf_truncdec( (0.120 * 69),2);
 showmessage(VartoStr(x));
 x:=  udf_truncdec( (0.466 * 31.41),2);
 showmessage(VartoStr(x));
 x:=  udf_truncdec( (3 * 2.90),2);
 showmessage(VartoStr(x));


end;

end.
