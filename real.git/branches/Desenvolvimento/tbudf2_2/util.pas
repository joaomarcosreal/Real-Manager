{
  TBUDF - Tecnobyte UDF for FireBird

  Author...: Daniel Pereira Guimarães
  E-mail...: tecnobyte@ulbrajp.com.br
  Home-Page: www.ulbrajp.com.br/~tecnobyte

  This library is Open-Source!
}

unit util;

interface

uses
  SysUtils, consts, fb;

function LastDay(const Year, Month: SmallInt): SmallInt;
function PosValue(const AbsValue, Base, Position: byte): integer;
function Trunc32(const X: double): integer;
function Round32(const X: double): integer;
function RoundDouble(const X: double): double;
function PadL(const S, Pad: string; const Len: integer): string;
function PadR(const S, Pad: string; const Len: integer): string;
function Age(const Birth, Today: TDateRec): integer;
function retornaTamanhoParteDecimal(valor : string) : integer;
implementation

function LastDay(const Year, Month: SmallInt): SmallInt;
begin
  if (Month = 2) and IsLeapYear(Year) then
    Result := 29
  else
    Result := MONTH_DAYS[Month];
end;

function PosValue(const AbsValue, Base, Position: byte): integer;
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

function Trunc32(const X: double): integer;
var
  I: int64;
begin
  try
    I := Trunc(X);

    if (I >= Low(integer)) and (I <= High(integer)) then
      Result := integer(I)
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

function Round32(const X: double): integer;
var
  I: int64;
  F: double;
begin
  try
    I := Trunc(X);

    if (I >= Low(integer)) and (I <= High(integer)) then begin
      Result := integer(I);

      F := Frac(X);
      if F <= -0.5 then
        Dec(Result)
      else if F >= 0.5 then
        Inc(Result);

    end else
      Result := 0;

  except
    Result := 0;
  end;
end;

function RoundDouble(const X: double): double;
var
  F: double;
begin
  Result := Int(X);

  F := Frac(X);
  if F <= -0.5 then
    Result := Result - 1
  else if F >= 0.5 then
    Result := Result + 1;
end;

function PadL(const S, Pad: string; const Len: integer): string;
var
  SLen, PadLen, PadCount, I: integer;
begin
  if Len <= 0 then
    Result := ''
  else if Pad = '' then
    Result := S
  else begin
    SLen := Length(S);
    if SLen = Len then
      Result := S
    else if SLen > Len then
      Result := Copy(S, SLen - Len + 1, Len)
    else begin
      Result := S;
      PadLen := Length(Pad);
      PadCount := (Len - SLen) div PadLen;

      for I := 1 to PadCount do
        Result := Pad + Result;

      I := Len - (SLen + PadCount * PadLen);
      if I > 0 then
        Result := Copy(Pad, PadLen - I + 1, PadLen) + Result;
    end;
  end;
end;

function PadR(const S, Pad: string; const Len: integer): string;
var
  SLen, PadLen, PadCount, I: integer;
begin
  if Len <= 0 then
    Result := ''
  else if Pad = '' then
    Result := S
  else begin
    SLen := Length(S);
    if SLen = Len then
      Result := S
    else if SLen > Len then
      Result := Copy(S, 1, Len)
    else begin
      Result := S;
      PadLen := Length(Pad);
      PadCount := (Len - SLen) div PadLen;

      for I := 1 to PadCount do
        Result := Result + Pad;

      I := Len - (SLen + PadCount * PadLen);
      if I > 0 then
        Result := Result + Copy(Pad, 1, I);
    end;
  end;
end;

function Age(const Birth, Today: TDateRec): integer;
begin
  if Today.Year <= Birth.Year then
    Result := 0
  else begin
    Result := Today.Year - Birth.Year;
    if (Today.Month < Birth.Month) or
       ((Today.Month = Birth.Month) and (Today.Day < Birth.Day)) then
      Dec(Result);
  end;
end;



function retornaTamanhoParteDecimal(valor : string) : integer;
var
 posicao : integer;
 str  : string;
begin
 posicao:=Pos(',',valor);
 str:=trim(Copy(valor,posicao+1,20));
 result := StrLen(pchar(str));

end;



end.
