unit uu_cad_reg60M;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmCadReg60M = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    edData: TDBEdit;
    Label1: TLabel;
    lkNumeroSerie: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    btProcessar: TBitBtn;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure retornaInformacoes(codReg : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadReg60M: TfrmCadReg60M;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal,

   uu_listagemRegistros60M;

{$R *.dfm}

procedure TfrmCadReg60M.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryReg60M.Active:=true;
  dm.qryECFS.Active:=true;
  dm.qryReg60M.Append;
  edData.SetFocus;
  btProcessar.Enabled:=false;

end;

procedure TfrmCadReg60M.bt_alterarClick(Sender: TObject);
begin
  inherited;
  dm.qryAliquotas.Active:=true;
end;

procedure TfrmCadReg60M.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryReg60m.Active:=false;
  dm.qryAliquotas.Active:=false;
  dm.qryECFS.Active:=false;
  btProcessar.Enabled:=true;
  bt_imprimir.Enabled:=true;

end;

procedure TfrmCadReg60M.bt_sairClick(Sender: TObject);
begin
  inherited;
  close;
end;



procedure TfrmCadReg60M.gravarInformacoes();
begin
   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_REG60M',8);
     dm.qryReg60MCOD_REG.value:=ed_codigo.Text;
     dm.qryReg60MNUM_ORD.Value:= dm.qryECFSNUMORDEM.Value;
     dm.qryReg60MMODELO.Value:='2D';

   end;



  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryReg60M.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryReg60M]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do registro  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryReg60M.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryReg60M]);

         end;

    end;
end;


procedure TfrmCadReg60M.retornaInformacoes(codReg : string);
begin
  dm.qryAliquotas.Active:=true;
  dm.qryECFS.Active:=true;

  dm.qryReg60m.Active:=false;
  dm.qryReg60m.sql.clear;
  dm.qryReg60m.sql.add('select * from reg60m where cod_reg='+Quotedstr(ed_codigo.Text));
  dm.qryReg60m.Active:=true;

  if (evento = 2)then
  begin
   dm.qryReg60m.Edit;
  end;


 if ((evento=2) or (evento = 3)) then
  bt_gravar.Enabled:=true;
end;


procedure TfrmCadReg60M.ed_codigoExit(Sender: TObject);
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

      if ( verificaExistenciaReg60M(trim(ed_codigo.Text)) = true)
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

procedure TfrmCadReg60M.bt_gravarClick(Sender: TObject);
begin
  gravarInformacoes();
  bt_novo.Click;
  inherited;

end;

procedure TfrmCadReg60M.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaReg60M();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaReg60M(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.Text);

end;

procedure TfrmCadReg60M.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmListDadosRedZ,frmListDadosRedZ);
  frmListDadosRedZ.ShowModal;
  frmListDadosRedZ.Free; 
end;

end.
