unit RealFramework;

interface

uses
  System.Types, System.classes, vcl.forms, System.SysUtils;

type
  TRespostaDialog = (teSim, teNao, teCancelar, teOk);

  TTipoRelatorioCaixa = (TRParcial, TRFechamento, TRReimpressao);

  TTipoMensagem = (tmConfirmacao, tmErro, tmSucesso, tmAviso, tmConfirmacaoPorPIN, tmConfirmacaoPorPINNumerico);

  TTipoOperacaoCRUD = (tiInclusao, tiAlteracao, tiExclusao);

  TRealDialog = class
  private
    FTitulo: string;
    FMensagem: string;
    FPiscar: Boolean;
    FTamanhoFonte: integer;
    FReposta: TRespostaDialog;
    FTipo: TTipoMensagem;
    procedure SetMensagem(const Value: string);
    procedure SetPiscar(const Value: Boolean);
    procedure SetTamanhoFonte(const Value: integer);
    procedure SetTitulo(const Value: string);                        procedure SetReposta(const Value: TRespostaDialog);
    procedure SetTipo(const Value: TTipoMensagem);
  published
    property Tipo: TTipoMensagem read FTipo write SetTipo;
    property Titulo: string read FTitulo write SetTitulo;
    property Mensagem: string read FMensagem write SetMensagem;
    property TamanhoFonte: integer read FTamanhoFonte write SetTamanhoFonte;
    property Reposta: TRespostaDialog read FReposta write SetReposta;
    property Piscar: Boolean read FPiscar write SetPiscar;
  end;

function IntToBol(AIntNumber: integer): boolean;

function BoolToInt(Abol: boolean): smallint;

function ShowRealDialog(AOwner: TForm; ATipo: TTipoMensagem; ATitulo: string; Amensagem: string; AFonte: integer = 22; APiscar: Boolean = false; ATempo: integer = 4): TRespostaDialog;

implementation

uses
  uuRealDialog;

function ShowRealDialog(AOwner: TForm; ATipo: TTipoMensagem; ATitulo: string; Amensagem: string; AFonte: integer = 22; APiscar: Boolean = false; ATempo: integer = 4): TRespostaDialog;
var
  LRealDialog: TRealDialog;
  LFormParent: TForm;
  LDialogForm: TfrmRealDialog;
begin

  LRealDialog := TRealDialog.Create;

  LDialogForm := TfrmRealDialog.Create(AOwner);
  try
    try
      LRealDialog.Tipo := ATipo;
      LRealDialog.Titulo := ATitulo;
      LRealDialog.Mensagem := Amensagem;
      LRealDialog.TamanhoFonte := AFonte;
      LRealDialog.Piscar := APiscar;

      LDialogForm.setDialog(LRealDialog);
      {
      LFormParent.WindowState := wsNormal;
      LFormParent.Height := AOwner.Height;
      LFormParent.Width := AOwner.Width;
      LFormParent.Color := 0;
      LFormParent.BorderStyle := bsNone;
      LFormParent.Position := poOwnerFormCenter;
      LFormParent.AlphaBlend := true;
      LFormParent.AlphaBlendValue := 128;
      LFormParent.BorderIcons := [];


      LFormParent.showmodal;
      }

      LDialogForm.ShowModal;
//      LFormParent.Close;
      Result := LRealDialog.Reposta;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.message);
      end;

    end;
  finally
    freeAndNil(LRealDialog);
    freeAndNil(LDialogForm);
//    FreeAndNil(LFormParent);

  end;
end;

function IntToBol(AIntNumber: integer): boolean;
begin
  if AIntNumber = 0 then
    result := false
  else
    result := true;
end;

function BoolToInt(Abol: boolean): smallint;
begin
  if Abol = true then
    result := 1
  else
    result := 0;
end;

{ TDialogReal }

procedure TRealDialog.SetMensagem(const Value: string);
begin
  FMensagem := Value;
end;

procedure TRealDialog.SetPiscar(const Value: Boolean);
begin
  FPiscar := Value;
end;

procedure TRealDialog.SetReposta(const Value: TRespostaDialog);
begin
  FReposta := Value;
end;

procedure TRealDialog.SetTamanhoFonte(const Value: integer);
begin
  FTamanhoFonte := Value;
end;

procedure TRealDialog.SetTipo(const Value: TTipoMensagem);
begin
  FTipo := Value;
end;

procedure TRealDialog.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

end.

