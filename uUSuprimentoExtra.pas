unit uUSuprimentoExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RealFramework, Dialogs, uu_modelo_Vazio, StdCtrls,
  RxCurrEdit, Buttons, ExtCtrls, RxToolEdit, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, PngSpeedButton, AdvGlassButton, Vcl.Mask,
  Vcl.Menus;

type
  TfrmSuprimentoExtra = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    edvalorSuprimento: TCurrencyEdit;
    Label1: TLabel;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    pnBottom: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    pnFundo: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private


    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSuprimentoExtra: TfrmSuprimentoExtra;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmSuprimentoExtra.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSuprimentoExtra.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSuprimentoExtra.btSelecionarClick(Sender: TObject);
begin
  if (edvalorSuprimento.Value <= 0) then
  begin
    ShowRealDialog(frm_principal, tmErro, 'Erro', 'Valor inválido!');
    edvalorSuprimento.SetFocus;
  end
  else
  begin
    if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Confirma o suprimento extra ?') = teSim) then
    begin
      dm.gravarSuprimento(codEmpresa, ultimoCaixaAberto, edvalorSuprimento.Value, false);
      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Suprimento efetuado com sucesso!');
      close;
    end;
  end;

end;

procedure TfrmSuprimentoExtra.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

