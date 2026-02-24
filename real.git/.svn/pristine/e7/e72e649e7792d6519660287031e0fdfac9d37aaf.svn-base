unit uuSelecionaClienteNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSelecionaClienteNFE = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_cod_fornecedor: TEdit;
    ed_razao_social_fornecedor: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaClienteNFE: TfrmSelecionaClienteNFE;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmSelecionaClienteNFE.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if verificaExistenciaFornecedor(ed_cod_fornecedor.Text) then
   begin
     string_auxiliar := ed_cod_fornecedor.Text;
     Close;
   end
  else
   begin
     ShowMessage('Cliente inexistente!');
     ed_cod_fornecedor.Clear;
     ed_razao_social_fornecedor.Clear;
   end;

end;

procedure TfrmSelecionaClienteNFE.BitBtn2Click(Sender: TObject);
begin
  inherited;
   string_auxiliar:='';
   Close;
end;

end.
