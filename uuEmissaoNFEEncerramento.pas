unit uuEmissaoNFEEncerramento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmEmissaoNFEEncerramento = class(Tfrm_modelo_vazio)
    Panel5: TPanel;
    Panel6: TPanel;
    memoInformacoesAdicionais: TMemo;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnDadosFornecedor: TPanel;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    Panel3: TPanel;
    ed_razao_social_fornecedor: TEdit;
    Panel13: TPanel;
    ed_cod_fornecedor: TEdit;
    Panel1: TPanel;
    lblTitulo: TLabel;
    function validaInformacoesNFE(): boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmissaoNFEEncerramento: TfrmEmissaoNFEEncerramento;

implementation

{$R *.dfm}

uses
  uu_frm_principal;

procedure TfrmEmissaoNFEEncerramento.BitBtn1Click(Sender: TObject);
begin

  string_auxiliar := ed_cod_fornecedor.Text;

  if (Trim(string_auxiliar) <> '') then
  begin
    if verificaExistenciaFornecedor(string_auxiliar) then
    begin
      string_auxiliar := ed_cod_fornecedor.Text;
      string_auxiliar2 := memoInformacoesAdicionais.Lines.Text;
      close;
    end
    else
    begin
      ShowMessage('Código do cliente informado é inválido!');
      ed_cod_fornecedor.Clear;
      ed_razao_social_fornecedor.Clear;
      ed_cod_fornecedor.SetFocus;
    end;
  end;

end;

procedure TfrmEmissaoNFEEncerramento.BitBtn2Click(Sender: TObject);
begin
  inherited;
  string_auxiliar := '';
  close;
end;

procedure TfrmEmissaoNFEEncerramento.FormShow(Sender: TObject);
begin
  inherited;
  if (trim(ed_razao_social_fornecedor.Text) <> '') then
  begin
    pnDadosFornecedor.Enabled := false;
    memoInformacoesAdicionais.SetFocus;
  end;
end;

function TfrmEmissaoNFEEncerramento.validaInformacoesNFE(): boolean;
begin
  showmessage('');

end;

end.

