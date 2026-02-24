unit uuMensagemTEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, AdvTouchKeyboard,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmMensagemTEF = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    pnSimNao: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    memoInformacoesCartao: TMemo;
    Panel2: TPanel;
    memoMsg: TMemo;
    tecladoTouch: TAdvTouchKeyboard;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    edParametro: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagemTEF: TfrmMensagemTEF;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmMensagemTEF.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   dm.tentarNovamenteCappta :=1;
   pnSimNao.Visible := false;
end;

procedure TfrmMensagemTEF.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   dm.tentarNovamenteCappta :=0;
   pnSimNao.Visible := false;

end;

procedure TfrmMensagemTEF.SpeedButton3Click(Sender: TObject);
var
msgAnterior : string;
begin

  msgAnterior := memoInformacoesCartao.Lines.Text;

  inherited;
  if (trim(edParametro.Text) = '') then
   begin
     memoInformacoesCartao.lines.Clear;
     memoInformacoesCartao.Lines.Add('Parâmetro inválido!');
     Sleep(600);
     memoInformacoesCartao.lines.Clear;
     memoInformacoesCartao.Lines.Add(msgAnterior);


   end
  else
   begin
     dm.parametroRecebidoCappta := trim(edParametro.Text);
     tecladoTouch.Visible := false;

   end;

end;

procedure TfrmMensagemTEF.SpeedButton4Click(Sender: TObject);
begin
  inherited;
     dm.parametroRecebidoCappta := 'CancelarTEF';
     tecladoTouch.Visible := false;

end;

procedure TfrmMensagemTEF.SpeedButton6Click(Sender: TObject);
var
 AcaoCancelamento : integer;
begin
  inherited;
  AcaoCancelamento := 2;
//  dm.clienteCappta.EnviarParametro(' ' ,AcaoCancelamento  );
end;

end.
procedure TfrmMensagemTEF.SpeedButton4Click(Sender: TObject);
begin
  inherited;

end;


