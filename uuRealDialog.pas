unit uuRealDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  acbrutil, Dialogs, ExtCtrls, StdCtrls, Buttons, RealFramework, AdvGlassButton,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  JvComponentBase, JvFormTransparent, JvImageList, dxGDIPlusClasses,
  System.ImageList, Vcl.ImgList, System.Math;

type
  TfrmRealDialog = class(TForm)
    pnFundo: TPanel;
    pnTitulo: TPanel;
    lblTitulo: TLabel;
    pnMemo: TPanel;
    pnImagem: TPanel;
    img: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    memoMensagem: TMemo;
    tmApaga: TTimer;
    tmAcende: TTimer;
    JvImageList1: TJvImageList;
    pnPergunta: TPanel;
    btSim: TAdvGlassButton;
    btNao: TAdvGlassButton;
    pnOk: TPanel;
    btOk: TAdvGlassButton;
    pnPinConfirmacao: TPanel;
    Panel16: TPanel;
    Panel5: TPanel;
    edPinGerado: TEdit;
    Label3: TLabel;
    Panel6: TPanel;
    Label1: TLabel;
    edPinConfirmacao: TEdit;
    procedure btSimClick(Sender: TObject);
    procedure btNaoClick(Sender: TObject);
    procedure btSimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure setTitulo(titulo: string);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure JvTimerList1Events0Timer(Sender: TObject);
    procedure JvTimerList1Events1Timer(Sender: TObject);
    procedure tmApagaTimer(Sender: TObject);
    procedure tmAcendeTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    LCorTema: Integer;
    procedure ApplyTheme(ACorTema: integer; AImagem: string);
    function ConferirPinDigitado: Boolean;
  public
    { Public declarations }
    procedure setDialog(ADialog: TRealDialog);
  end;

var
  frmRealDialog: TfrmRealDialog;
  op1: boolean;
  FRealDialog: TRealDialog;
  FCaminhoImagens: string;

implementation




{$R *.dfm}

procedure TfrmRealDialog.btSimClick(Sender: TObject);
begin
  inherited;

  if FRealDialog.Tipo = tmConfirmacaoPorPIN then
  begin
    if ConferirPinDigitado() = true then
    begin
      FRealDialog.Reposta := teSim;
      close;
    end;
  end
  else
  begin
    FRealDialog.Reposta := teSim;
    close;
  end;

end;

procedure TfrmRealDialog.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  close;

end;

procedure TfrmRealDialog.btNaoClick(Sender: TObject);
begin
  inherited;
  FRealDialog.Reposta := teNao;
  close;
end;

procedure TfrmRealDialog.FormActivate(Sender: TObject);
begin
  Self.BringToFront;
end;

procedure TfrmRealDialog.FormCreate(Sender: TObject);
begin
  FCaminhoImagens := ExtractFilePath(Application.ExeName) + 'imagens\dialogs\';
end;

procedure TfrmRealDialog.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  {
  if ((Key = vk_return) or (Key = VK_F3)) then
  begin
    if FRealDialog.Tipo = tmConfirmacao then
      btSim.Click
    else
    begin
      FRealDialog.Reposta := teOk;

    end;

  end;
  }
  {
  if Key = vk_escape then
  begin
    if FRealDialog.Tipo = tmConfirmacao then
      btNao.Caption
    else
    begin
      FRealDialog.Reposta := teOk;
    end;

  end;
   }

end;

procedure TfrmRealDialog.JvTimerList1Events0Timer(Sender: TObject);
begin
  inherited;
  lblTitulo.Visible := False;
end;

procedure TfrmRealDialog.JvTimerList1Events1Timer(Sender: TObject);
begin
  inherited;
  lblTitulo.Visible := true;
end;

procedure TfrmRealDialog.btSimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Key = vk_return) or (Key = VK_F3)) then
    btSim.Click;
  if Key = vk_escape then
    btNao.Click;

end;

procedure TfrmRealDialog.ApplyTheme(ACorTema: integer; AImagem: string);
begin
  try
    try
      LCorTema := ACorTema;
      pnTitulo.Color := LCorTema;
      self.Color := LCorTema;
      img.Picture.LoadFromFile(FCaminhoImagens + AImagem);
      memoMensagem.Font.Color := ACorTema;
      btOk.BackColor := ACorTema;
      btOk.ForeColor := ACorTema;
      btOk.GlowColor := ACorTema;
      btOk.InnerBorderColor := ACorTema;
      btOk.OuterBorderColor := ACorTema;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao setar tema da caixa de diálogo. ' + sLineBreak + sLineBreak + E.Message);
      end;

    end;
  finally

  end;

end;

procedure TfrmRealDialog.setDialog(ADialog: TRealDialog);
begin

  FRealDialog := ADialog;
  lblTitulo.Caption := ADialog.Titulo;
  memoMensagem.Lines.Text := ADialog.Mensagem;
  memoMensagem.Font.Size := ADialog.TamanhoFonte;
  tmAcende.Enabled := ADialog.Piscar;

  case ADialog.Tipo of
    tmConfirmacao:
      begin
        ApplyTheme($00C08000, 'confirmacao.png');
        pnPergunta.Visible := true;
        pnOk.Visible := false;
      end;
    tmErro:
      begin
        ApplyTheme($00C08000, 'erro.png');
        pnPergunta.Visible := false;
        pnOk.Visible := true;
      end;
    tmSucesso:
      begin
        ApplyTheme($00C08000, 'sucesso.png');
        pnPergunta.Visible := false;
        pnOk.Visible := true;
      end;

    tmAviso:
      begin
        ApplyTheme($00C08000, 'informacao.png');
        pnPergunta.Visible := false;
        pnOk.Visible := true;
      end;

    tmConfirmacaoPorPIN:
      begin
        ApplyTheme($00C08000, 'confirmacao.png');
        pnPergunta.Visible := true;
        pnPinConfirmacao.Visible := true;
        edPinGerado.text := randomName(7);
        pnOk.Visible := false;
      end;

    tmConfirmacaoPorPINNumerico:
      begin
        ApplyTheme($00C08000, 'confirmacao.png');
        pnPergunta.Visible := true;
        pnPinConfirmacao.Visible := true;
        edPinGerado.text := IntToStr(RandomRange(10000, 100000));
        pnOk.Visible := false;
      end;

  end;
end;

function TfrmRealDialog.ConferirPinDigitado(): Boolean;
var
  LPingDigitado: string;
begin
  result := True;
  LPingDigitado := trim(edPinConfirmacao.Text);
  if LPingDigitado <> trim(edPinGerado.Text) then
  begin
    Showmessage('O PIN digitado está incorreto!');
    result := false;
  end;

end;

procedure TfrmRealDialog.setTitulo(titulo: string);
begin
  self.caption := titulo;
end;

procedure TfrmRealDialog.tmAcendeTimer(Sender: TObject);
begin
  inherited;
  tmAcende.Enabled := False;
  pnTitulo.Color := LCorTema;
  lblTitulo.Font.Color := clWhite;
  Application.ProcessMessages;
  tmApaga.Enabled := true;
end;

procedure TfrmRealDialog.tmApagaTimer(Sender: TObject);
begin
  inherited;
  tmApaga.Enabled := False;
  pnTitulo.Color := clWhite;
  lblTitulo.Font.Color := LCorTema;
  Application.ProcessMessages;
  tmAcende.Enabled := true;
end;

end.

