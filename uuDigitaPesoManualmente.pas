unit uuDigitaPesoManualmente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RealFramework, Dialogs, uu_modelo_Vazio, StdCtrls,
  ExtCtrls, RxCurrEdit, Buttons, RxToolEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, AdvSmoothTouchKeyBoard,
  Vcl.ComCtrls, AdvDateTimePicker, Vcl.Menus, Vcl.Mask;

type
  TfrmDigitaPesoManualmente = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    ed_quantidade: TCurrencyEdit;
    Panel8: TPanel;
    lbTitulo: TLabel;
    Panel1: TPanel;
    AdvSmoothTouchKeyBoard2: TAdvSmoothTouchKeyBoard;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ed_quantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    LPermiteQuantidadeFrancionaria: boolean;
    LPodeFecharFormulario: boolean;


    { Private declarations }
  public
    { Public declarations }
        procedure setTituloMensagem(Atitulo: string);
    procedure PermitirQuantidadeFracionaria(APermite: boolean);
  end;

var
  frmDigitaPesoManualmente: TfrmDigitaPesoManualmente;

implementation

uses
  uu_frm_principal;

{$R *.dfm}

procedure TfrmDigitaPesoManualmente.FormCreate(Sender: TObject);
begin
  inherited;
  LPermiteQuantidadeFrancionaria := true;
  LPodeFecharFormulario := false;
end;

procedure TfrmDigitaPesoManualmente.FormActivate(Sender: TObject);
begin
  inherited;
  ed_quantidade.SetFocus;
end;

procedure TfrmDigitaPesoManualmente.ed_quantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin

    try
      pesoLidoBalanca := FloatToStr(ed_quantidade.Value);

      if LPermiteQuantidadeFrancionaria = false then
        StrToInt(pesoLidoBalanca);

      if ed_quantidade.Value <= 0 then
        raise Exception.Create('Peso inválido!');

      if ed_quantidade.Value >= 5 then
      begin
        if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'A quantidade parece ser alta. Tem certeza desta quantidade?') = teSim) then
          LPodeFecharFormulario := true
        else
          LPodeFecharFormulario := false;
      end;
      LPodeFecharFormulario := true;
      close;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Quantidade inválida!');
      end;
    end;

  end;
end;

procedure TfrmDigitaPesoManualmente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := LPodeFecharFormulario;
end;

procedure TfrmDigitaPesoManualmente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) or ((Key = VK_F4) and (ssAlt in Shift)) then
    Key := 0; // Anula a ação padrão das teclas Esc e Alt+F4
end;

procedure TfrmDigitaPesoManualmente.setTituloMensagem(Atitulo: string);
begin
  lbTitulo.Caption := Atitulo;
end;

procedure TfrmDigitaPesoManualmente.PermitirQuantidadeFracionaria(APermite: boolean);
begin
  LPermiteQuantidadeFrancionaria := APermite;

end;

end.
                                                          ₢
