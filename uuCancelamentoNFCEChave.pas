unit uuCancelamentoNFCEChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmCancelamentoNFCEChave = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edChaveNFCE: TEdit;
    edProtocolo: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelamentoNFCEChave: TfrmCancelamentoNFCEChave;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCancelamentoNFCEChave.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCancelamentoNFCEChave.BitBtn1Click(Sender: TObject);
var
 nota, serie : integer;
begin
  inherited;
if ( ( ValidarChaveNFe(edChaveNFCE.Text)) and (trim(edProtocolo.Text) <> '') ) then
 begin
     nota   :=    StrToInt( FormatFloat('000000000000000', StrToFloat( copy(edChaveNFCE.Text  ,26,9))));
     serie  :=    strToInt( FormatFloat('000', StrToFloat( copy(edChaveNFCE.Text,23,3))));

     if (dm.cancelaNFCE(trim(edChaveNFCE.Text),Trim(edProtocolo.Text),   serie,nota,'Duplicidade de Nota') = true) then
      begin
        exibe_painel_erro('Nota cancelada com sucesso','Ok');
      end

  else
   begin
     exibe_painel_erro('Chave ou protocolo inválido!','Ok');

   end;

 end;

 
end;

end.
