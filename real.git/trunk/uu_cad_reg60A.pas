unit uu_cad_reg60A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadReg60A = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edData: TDBEdit;
    Label3: TLabel;
    edValorAcumulado: TDBEdit;
    Label4: TLabel;
    lkAliquota: TDBLookupComboBox;
    lkNumeroSerie: TDBLookupComboBox;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    function verificaValidade() : boolean;
    procedure gravarInformacoes();
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure retornaInformacoes(codReg : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadReg60A: TfrmCadReg60A;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal;

{$R *.dfm}

procedure TfrmCadReg60A.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryReg60A.Active:=true;
  dm.qryAliquotas.Active:=true;
  dm.qryECFS.Active:=true;
  dm.qryReg60A.Append;
  edData.SetFocus;
  
end;

procedure TfrmCadReg60A.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryReg60A.Active:=false;
  dm.qryAliquotas.Active:=false;
  dm.qryECFS.Active:=false;
end;

procedure TfrmCadReg60A.bt_sairClick(Sender: TObject);
begin
  inherited;
  close;
end;

function TfrmCadReg60A.verificaValidade() : boolean;
begin


  Result:=true;
end;

procedure TfrmCadReg60A.gravarInformacoes();
begin
   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_REG60A',8);
//     dm.qryReg60ACOD_REG.value:=ed_codigo.Text;
   end;



  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryReg60A.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryReg60A]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do registro  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryReg60A.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryReg60A]);

         end;

    end;
end;


procedure TfrmCadReg60A.bt_gravarClick(Sender: TObject);
begin
  if verificaValidade then
   begin
     gravarInformacoes();
     inherited;
   end;

end;

procedure TfrmCadReg60A.bt_alterarClick(Sender: TObject);
begin
  dm.qryAliquotas.Active:=true;
  inherited;
end;

procedure TfrmCadReg60A.retornaInformacoes(codReg : string);
begin
  dm.qryAliquotas.Active:=true;
  dm.qryECFS.Active:=true;

  dm.qryReg60A.Active:=false;
  dm.qryReg60A.sql.clear;
  dm.qryReg60A.sql.add('select * from reg60a where cod_reg='+Quotedstr(ed_codigo.Text));
  dm.qryReg60A.Active:=true;

  if (evento = 2)then
  begin
   dm.qryReg60A.Edit;
  end;


 if ((evento=2) or (evento = 3)) then
  bt_gravar.Enabled:=true;
end;

procedure TfrmCadReg60A.ed_codigoExit(Sender: TObject);
begin
  inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('00000000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de registro inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaReg60A(trim(ed_codigo.Text)) = true)
        then
           retornaInformacoes(ed_codigo.Text)
        else
          begin
            ShowMessage('Codigo de registro inexistente!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;
end;

procedure TfrmCadReg60A.bt_pesquisaClick(Sender: TObject);
begin
   inherited;
  pesquisaReg60M();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaReg60A(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.Text);
end;

end.
