unit uu_cad_clientes_delivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, 
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBLookupComboBox,
  cxCalendar, cxDBEdit, RXDBCtrl, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, RxToolEdit;

type
  TfrmCadClientesDelivery = class(Tfrm_modelo_cadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cmbSexo: TcxDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    edTelefone: TDBEdit;
    edNome: TDBEdit;
    edEndereco: TDBEdit;
    edComplemento: TDBEdit;
    edReferencia1: TDBEdit;
    edReferencia2: TDBEdit;
    edFreqCompra: TDBEdit;
    Label10: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label48: TLabel;
    bt_pesq_bairro: TSpeedButton;
    edDescBairro: TDBEdit;
    edCodBairro: TDBEdit;
    Label11: TLabel;
    edEmail: TDBEdit;
    Label12: TLabel;
    edDtNascimento: TDBDateEdit;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
   procedure gravarInformacoes();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_consultarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure retornaInformacoes(codigo : string);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
  private
    { Private declarations }
    codCliente  : string;
  public
    { Public declarations }
    procedure setCodCliente(codCli : string);
    function  getCodCliente() : string;
    procedure setEvento(ev : smallint);
  end;

var
  frmCadClientesDelivery: TfrmCadClientesDelivery;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal;

{$R *.dfm}




procedure TfrmCadClientesDelivery.setEvento(ev : smallint);
begin
 evento:= ev;
end;


procedure TfrmCadClientesDelivery.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryClientesDelivery.Active:=false;
  dm.qryBairro.Active:=false;
  if (trim(getCodCliente)<> '') then
   begin
     if evento = 1 then
      begin
         bt_novo.Click;
         edTelefone.Text := getCodCliente();
      end;

     if evento = 2 then
      begin
        bt_alterar.Click;
        ed_codigo.Text:=getCodCliente();
        retornaInformacoes(ed_codigo.Text);
        edTelefone.SetFocus;
      end;

   end;

end;

procedure TfrmCadClientesDelivery.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryClientesDelivery.Active:=false;
  dm.qryClientesDelivery.Active:=true;
  dm.qryBairro.Active:=true;
  dm.qryClientesDelivery.Append;
  dm.qryClientesDelivery.FieldByName('FREQ_COMPRA').value :=30;
  edTelefone.SetFocus;

end;

procedure TfrmCadClientesDelivery.bt_gravarClick(Sender: TObject);
begin

  gravarInformacoes();
  inherited;
end;



procedure TfrmCadClientesDelivery.gravarInformacoes();
begin

   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_CLIENTES_DELIVERY',5);
     dm.qryClientesDelivery.FieldByName('codigo').value :=ed_codigo.Text;

   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
       dm.adicionaLog('alterou dados do cliente de  delivery cód '+codCliente);

     if (dm.qryClientesDelivery.FieldByName('celular').value = null )then
            dm.qryClientesDelivery.FieldByName('celular').value:=' ';

     if (dm.qryClientesDelivery.FieldByName('telefone').value = null )then
            dm.qryClientesDelivery.FieldByName('telefone').value:=' ';



     if (dm.qryClientesDelivery.FieldByName('endereco').value = null )then
            dm.qryClientesDelivery.FieldByName('endereco').value:=' ';

     if (dm.qryClientesDelivery.FieldByName('complemento').value = null )then
            dm.qryClientesDelivery.FieldByName('complemento').value:=' ';

     if (dm.qryClientesDelivery.FieldByName('referencia1').value = null )then
            dm.qryClientesDelivery.FieldByName('referencia1').value:=' ';

     if (dm.qryClientesDelivery.FieldByName('referencia2').value = null )then
            dm.qryClientesDelivery.FieldByName('referencia2').value:=' ';

     if (dm.qryClientesDelivery.FieldByName('freq_compra').value = null )then
            dm.qryClientesDelivery.FieldByName('freq_compra').value:=30;





     dm.qryClientesDelivery.FieldByName('telefone').value := trim(dm.qryClientesDelivery.FieldByName('telefone').value);
     dm.qryClientesDelivery.FieldByName('celular').value := trim(dm.qryClientesDelivery.FieldByName('celular').value);
     dm.qryClientesDelivery.FieldByName('nome').value := trim(dm.qryClientesDelivery.FieldByName('nome').value);




    dm.qryClientesDelivery.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryClientesDelivery]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do cliente ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.adicionaLog('excluiu o  cliente de  delivery cód '+codCliente);         
            dm.qryClientesDelivery.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryClientesDelivery]);
         end;
    end;
end;


procedure TfrmCadClientesDelivery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.qryClientesDelivery.Active:=false;
  dm.qryBairro.Active:=false;

end;

procedure TfrmCadClientesDelivery.bt_consultarClick(Sender: TObject);
begin
  inherited;
  ed_codigo.SetFocus;
  dm.qryBairro.Active:=true;
end;

procedure TfrmCadClientesDelivery.ed_codigoExit(Sender: TObject);
begin
  inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;
      try
        ed_codigo.Text:=FormatFloat('00000',StrToFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de Cliente inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaClienteDelivery(trim(ed_codigo.Text)) = true)
       then
         retornaInformacoes(ed_codigo.Text)
        else
          begin
            ShowMessage('O código especificado não é válido!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;
end;


procedure TfrmCadClientesDelivery.retornaInformacoes(codigo : string);
begin
 dm.qryClientesDelivery.Active:=false;
 dm.qryClientesDelivery.sql.clear;
 dm.qryClientesDelivery.sql.add(' select c.*, b.descricao  as DescricaoBairro  from clientes_delivery c');
 dm.qryClientesDelivery.sql.add(' inner join bairro b on (b.codigo = c.cod_bairro) ');
 dm.qryClientesDelivery.sql.add(' where c.codigo='+Quotedstr(codigo));
 dm.qryClientesDelivery .Active:=true;
 if (evento = 2)then
  begin
   dm.qryClientesDelivery.Edit;
  end;

 if ((evento=2) or (evento = 3)) then
  bt_gravar.Enabled:=true;
end;



procedure TfrmCadClientesDelivery.bt_alterarClick(Sender: TObject);
begin
  inherited;
  dm.qryBairro.Active:=true;
  dm.adicionaLog('Tentou alterar cliente do delivery');  
end;

procedure TfrmCadClientesDelivery.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaClienteDelivery();
  ed_codigo.text := string_auxiliar;
  if verificaExistenciaClienteDelivery(string_auxiliar)=false then
    begin
      showmessage('Código de Cliente inválido');
      ed_codigo.clear;
      ed_codigo.SetFocus
    end
  else
   retornaInformacoes(string_auxiliar); 
end;


procedure TfrmCadClientesDelivery.setCodCliente(codCli : string);
begin
 self.codCliente :=codCli;
end;

function TfrmCadClientesDelivery.getCodCliente() : string;
begin

 result:= self.codCliente;
end;









procedure TfrmCadClientesDelivery.bt_excluirClick(Sender: TObject);
begin
  inherited;
  dm.adicionaLog('Tentou excluir cliente do delivery');
end;

end.
