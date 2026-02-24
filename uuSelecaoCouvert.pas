unit uuSelecaoCouvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmSelecaoCouvert = class(Tfrm_modelo_vazio)
    pnBotoes: TPanel;
    pnPrincipal: TPanel;
    rdgTipoEntrada: TRadioGroup;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btSelecionar: TBitBtn;
    btCancelar: TBitBtn;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCancelarClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecaoCouvert: TfrmSelecaoCouvert;

implementation



{$R *.dfm}

procedure TfrmSelecaoCouvert.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btSelecionar.Click
  else
   begin
     if Key = VK_ESCAPE then btCancelar.Click;
   end;
end;

procedure TfrmSelecaoCouvert.btCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSelecaoCouvert.btSelecionarClick(Sender: TObject);
begin
  inherited;

  Close; 
end;

end.
