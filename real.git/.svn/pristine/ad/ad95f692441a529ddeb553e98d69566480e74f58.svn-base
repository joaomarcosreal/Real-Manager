 unit uuSelecaoTamanhoPizza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls,
  AdvTouchKeyboard, jpeg, Vcl.ActnList, System.Actions, IBX.IBScript;

type
  TfrmSelecaoTamanhoPizza = class(Tfrm_modelo_vazio)
    Panel4: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Panel3: TPanel;
    Image3: TImage;
    Label3: TLabel;
    Panel5: TPanel;
    Image5: TImage;
    Label5: TLabel;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    Label6: TLabel;
    pnTeclado: TPanel;
    btFecharTeclado: TSpeedButton;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure btTecladoVirtualClick(Sender: TObject);
    procedure btFecharTecladoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    podeFechar : boolean;
  public
    { Public declarations }
  end;

var
  frmSelecaoTamanhoPizza: TfrmSelecaoTamanhoPizza;
  tecladoAberto : boolean;  

implementation

uses uu_data_module, uu_frm_principal, uu_obs_lancamento_caixa;

{$R *.dfm}

procedure TfrmSelecaoTamanhoPizza.BitBtn1Click(Sender: TObject);
var
 t: string;
begin
  inherited;


end;

procedure TfrmSelecaoTamanhoPizza.BitBtn2Click(Sender: TObject);
begin
  inherited;
//   dm.tbSaboresPizzaTemptamanho.Value:= null;
  close;
end;

procedure TfrmSelecaoTamanhoPizza.Image1Click(Sender: TObject);
begin
  inherited;
  Panel1.Color := clwhite;
  Panel2.Color := clwhite;
  Panel3.Color := clwhite;
  Panel5.Color := clwhite;

  Panel1.Color := clMoneyGreen;


 dm.tbSaboresPizzaTemptamanho.Value:='1';
 dm.tbSaboresPizzaTempproporcao.Value := 1;



end;

procedure TfrmSelecaoTamanhoPizza.Image2Click(Sender: TObject);
begin
  inherited;

  Panel1.Color := clwhite;
  Panel2.Color := clwhite;
  Panel3.Color := clwhite;
  Panel5.Color := clwhite;

  Panel2.Color := clMoneyGreen;
  dm.tbSaboresPizzaTemptamanho.Value:='1/2';
  dm.tbSaboresPizzaTempproporcao.Value := 0.5;



end;

procedure TfrmSelecaoTamanhoPizza.Image3Click(Sender: TObject);
begin
  inherited;

  Panel1.Color := clwhite;
  Panel2.Color := clwhite;
  Panel3.Color := clwhite;
  Panel5.Color := clwhite;

  Panel3.Color := clMoneyGreen;
  dm.tbSaboresPizzaTemptamanho.Value:='1/3';

  if dm.tbSaboresPizzaTemp.RecordCount = 0  then
    dm.tbSaboresPizzaTempproporcao.Value := 0.334
  else
    dm.tbSaboresPizzaTempproporcao.Value := 0.333;


end;

procedure TfrmSelecaoTamanhoPizza.Image4Click(Sender: TObject);
begin
  inherited;

  Panel1.Color := clwhite;
  Panel2.Color := clwhite;
  Panel3.Color := clwhite;
  Panel5.Color := clwhite;

  Panel5.Color := clMoneyGreen;
  dm.tbSaboresPizzaTemptamanho.Value:='1/4';
  dm.tbSaboresPizzaTempproporcao.Value := 0.25;


end;

procedure TfrmSelecaoTamanhoPizza.btTecladoVirtualClick(Sender: TObject);
begin
  inherited;
  if not tecladoAberto then
   begin
    pnTeclado.Top := 0;
    pnTeclado.Left := 4;
    pnTeclado.Visible := true;
    tecladoAberto :=true;
   end
  else
   begin
    pnTeclado.Visible := false;
    tecladoAberto := false;
   end;

end;

procedure TfrmSelecaoTamanhoPizza.btFecharTecladoClick(Sender: TObject);
begin
  inherited;
  pnTeclado.Visible :=false;
  tecladoAberto:=false;

end;

procedure TfrmSelecaoTamanhoPizza.FormActivate(Sender: TObject);
begin
  inherited;
  btFecharTeclado.Caption :='Fechar '+#10+'o'+#10+'Teclado'+#10+' virtual';
  podeFechar := false;

  panel1.Color := clMoneyGreen;
 dm.tbSaboresPizzaTemptamanho.Value:='1';  
end;

procedure TfrmSelecaoTamanhoPizza.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  podeFechar := True;
  close;
end;

procedure TfrmSelecaoTamanhoPizza.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frm_principal.obsSaborPizza:='';
  Application.CreateForm(Tfrm_obs_lancamento_caixa,frm_obs_lancamento_caixa);
  frm_obs_lancamento_caixa.showmodal;
  frm_obs_lancamento_caixa.free;

  

end;

procedure TfrmSelecaoTamanhoPizza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if podeFechar = false then
    Action := caNone;

end;

end.
