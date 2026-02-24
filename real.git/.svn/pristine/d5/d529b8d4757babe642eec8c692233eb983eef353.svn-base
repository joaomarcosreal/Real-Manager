unit uuQtdePessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, RxGIF, ExtCtrls, StdCtrls, Buttons;

type
  TfrmQtdPessoas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    ed_quantidade: TEdit;
    Label2: TLabel;
    lbMesa: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure ed_quantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtdPessoas: TfrmQtdPessoas;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmQtdPessoas.ed_quantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
   begin
     try
       ed_quantidade.Text := FormatFloat('00',StrToInt(ed_quantidade.text));
     except
      begin
        Showmessage('Número de pessoas inválido!');
        ed_quantidade.clear;
        ed_quantidade.Text:='01';
        ed_quantidade.SelectAll;
        ed_quantidade.SetFocus;
        exit;
      end;
     end;
     string_auxiliar := ed_quantidade.Text;
     ed_quantidade.SelectAll;
     Close;
   end;
end;

procedure TfrmQtdPessoas.SpeedButton2Click(Sender: TObject);
var
x : integer;
valor : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is TEdit  ) and     ( (Components[x]as TEdit).Name='ed_quantidade' ) then
          begin

              try
               begin
                 valor := strToInt((Components[x] as TEdit).Text  );
                 valor:= valor +1;
               end;
              except
               valor := 1;
              end;

             (Components[x] as TEdit).Text :=  IntToStr(valor);
          end;
        x:= x+1;
      end;

end;

procedure TfrmQtdPessoas.SpeedButton3Click(Sender: TObject);
var
x : integer;
valor : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is TEdit  ) and     ( (Components[x]as TEdit).Name='ed_quantidade' ) then
          begin

              try
               begin
                 valor := strToInt((Components[x] as TEdit).Text  );
                 valor:= valor -1;
                 if (valor <= 0) then
                  valor:=1;
               end;


              except
               valor := 1;
              end;

             (Components[x] as TEdit).Text :=  IntToStr(valor);
          end;
        x:= x+1;
      end;

end;

procedure TfrmQtdPessoas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
     try
       ed_quantidade.Text := FormatFloat('00',StrToInt(ed_quantidade.text));
     except
      begin
        Showmessage('Número de pessoas inválido!');
        ed_quantidade.clear;
        ed_quantidade.Text:='01';
        ed_quantidade.SelectAll;
        ed_quantidade.SetFocus;
        exit;
      end;
     end;
     string_auxiliar := ed_quantidade.Text;
     ed_quantidade.SelectAll;
     Close;

end;

end.
