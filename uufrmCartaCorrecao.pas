unit uufrmCartaCorrecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, realframework,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_frm_principal, uu_modelo_Vazio, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmCartaCorrecao = class(Tfrm_modelo_vazio)
    frmCartaCorrecao: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel8: TPanel;
    Label22: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label34: TLabel;
    lbChave: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    LChaveParaCorrigir : string;


  public
    { Public declarations }
    procedure SetChaveParaCorrigir(AChave: string);
  end;

var
  frmCartaCorrecao: TfrmCartaCorrecao;

implementation

{$R *.dfm}

uses uu_data_module;

procedure   TfrmCartaCorrecao.SetChaveParaCorrigir(AChave : string);
begin
 LChaveParaCorrigir := AChave;
end;

procedure TfrmCartaCorrecao.BitBtn1Click(Sender: TObject);
var
 LDescricaoDaCCE : string;
 LMensagemEvento : string;
begin
  inherited;

  LDescricaoDaCCE :=   Trim(Memo1.Lines.Text);

  try
    try
      if Length(LDescricaoDaCCE) < 20  then
        raise Exception.Create('Texto da carta de correção deve ter no mínimo 20 caracteres');
      LMensagemEvento:= dm.emitirCartaCorrecao(LChaveParaCorrigir, LDescricaoDaCCE);
      dm.ACBrNFe1.Consultar;

       ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Carta de correção registrada com sucesso!' + sLineBreak + 'Mensagem: ' + LMensagemEvento, 22, true);
       close;

    except
      on E: Exception do
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao registrar a carta de correção:' + sLineBreak + SlineBreak + E.message, 22, true);
    end;
  finally

  end;

end;

procedure TfrmCartaCorrecao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCartaCorrecao.FormActivate(Sender: TObject);
begin
  inherited;
  lbChave.caption := 'Chave: '+LChaveParaCorrigir;
end;

end.

