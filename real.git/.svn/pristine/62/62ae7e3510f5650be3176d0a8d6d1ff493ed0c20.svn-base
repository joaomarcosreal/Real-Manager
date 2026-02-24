unit uu_cad_clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ACBrValidador,


  uu_modelo, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls,
  Dialogs, RxLookup;


type
  Tfrm_cad_clientes = class(Tfrm_modelo_cadastro)
    pn_campos: TPanel;
    lb_razao: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    ed_endereco: TDBEdit;
    ed_bairro: TDBEdit;
    ed_cep: TDBEdit;
    ed_telefone: TDBEdit;
    ed_fax: TDBEdit;
    ed_email: TDBEdit;
    ckb_situacao: TDBCheckBox;
    DBMemo1: TDBMemo;
    ed_razao_social: TDBEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ckCNPJ: TRadioButton;
    ckCPF: TRadioButton;
    ed_cnpj: TDBEdit;
    DBEdit1: TDBEdit;
    procedure bt_novoClick(Sender: TObject);


    procedure gravarInformacoes();
    function validaInformacoes() : boolean;
    procedure retornaInformacoes(cod_cliente : string);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure ckCPFClick(Sender: TObject);
    procedure ckCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_clientes: Tfrm_cad_clientes;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal, Math;

{$R *.dfm}

procedure Tfrm_cad_clientes.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qry_tipos_cli.Active:=true;
  pn_principal.Enabled:=true;
  pn_campos.Enabled:=true;
  dm.qry_clientes.Active:=true;
  dm.qry_clientes.Append;
  dm.qry_clientesCREDITO.Value := 0;
  ckCPF.Checked := true;
  dm.qry_clientesCGC_CPF.clear;
  dm.qry_clientesCGC_CPF.EditMask := '999\.999\.999\-99;0';




  dm.qry_clientesSITUACAO.Value:=1;
  ed_razao_social.SetFocus;

end;

function Tfrm_cad_clientes.validaInformacoes() : boolean;
begin


   try
     begin
          frm_principal.validador.Documento := dm.qry_clientesCGC_CPF.Value;

          if ckCNPJ.Checked then
             frm_principal.validador.TipoDocto := docCNPJ
          else
             frm_principal.validador.TipoDocto := docCPF;


          if not frm_principal.validador.Validar then
           begin
             if ckCNPJ.Checked then
               dm.exibe_painel_erro('CNPJ inválido!','')
             else
               dm.exibe_painel_erro('CPF inválido!','');

             Result := false;
             exit;
           end
          else
           begin
             result:= true;
           end;
        end

      except
         begin
           if ckCNPJ.Checked then
             dm.exibe_painel_erro('CNPJ inválido!','')
           else
             dm.exibe_painel_erro('CPF inválido!','');
           result := false;
           exit;
         end;
   end;




 try
    begin
      If ( (dm.qry_clientesCREDITO.Value < 0)) then
       begin
         dm.exibe_painel_erro('Credito inválido!','ok');
         Result := false;
         exit;  
       end;

    end;
 except
 end;




 result:=true;
end;

procedure Tfrm_cad_clientes.gravarInformacoes();
begin
   dm.qry_clientesPRAZO_PAGAMENTO.Value  := 15;

   if (evento = 1) then
   begin

     ed_codigo.Text:=dm.geraCodigo('G_CLIENTES',6);
     dm.qry_clientesCOD_CLI.Value:=ed_codigo.Text;
     dm.qry_clientesDATA_CADASTRO.Value:=data_do_sistema;
     dm.qry_clientesDATA_ULTIMA_COMPRA.Value:=data_do_sistema;
   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_clientes.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_clientes]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do cliente ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_clientes.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_clientes]);

         end;

    end;

end;


procedure Tfrm_cad_clientes.bt_gravarClick(Sender: TObject);
begin

  if (validaInformacoes = true) then
  begin
    gravarInformacoes;
    inherited;
  end;

end;

procedure Tfrm_cad_clientes.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaCliente();
  ed_codigo.Text:=string_auxiliar;
  if verificaExistenciaCliente(ed_codigo.text) then
   retornaInformacoes(ed_codigo.text);

end;

procedure Tfrm_cad_clientes.retornaInformacoes(cod_cliente : string);
begin

  dm.qry_clientes.Cancel;
  dm.qry_clientes.CancelUpdates;
  dm.qry_clientes.Active:=false;
  dm.qry_clientes.Open;

  dm.qry_clientes.Active:=false;
  dm.qry_clientes.SQL.Clear;
  dm.qry_clientes.SQL.add(' select  cli.*');
  dm.qry_clientes.SQL.add('from clientes cli');
  dm.qry_clientes.SQL.Add(' where cli.cod_cli='+Quotedstr(cod_cliente));
  dm.qry_clientes.active:=true;
  dm.qry_clientes.active:=true;
  if (evento = 2)then
    begin
     dm.qry_clientes.Edit;
     pn_campos.Enabled:=true;
    end;

  if ((evento=2) or (evento = 3)) then
    bt_gravar.Enabled:=true;

end;

procedure Tfrm_cad_clientes.ed_codigoExit(Sender: TObject);
begin
  inherited;
 if trim(ed_codigo.Text ) <> '' then
   begin
    try
     ed_codigo.Text:=FormatFloat('000000',StrToFloat(ed_codigo.text));
    except
     begin
       Showmessage('Código de cliente inválido!!');
       exit;
     end;
    end;

   if (verificaExistenciaCliente(ed_codigo.Text)) then
      retornaInformacoes(ed_codigo.text)
   else
    begin
      Showmessage('Código inválido!');
      exit;
    end;

   end;end;

procedure Tfrm_cad_clientes.bt_alterarClick(Sender: TObject);
begin
  inherited;
  dm.qry_clientes.Active:=false;
end;

procedure Tfrm_cad_clientes.ckCPFClick(Sender: TObject);
begin
  inherited;
   dm.qry_clientesCGC_CPF.clear;
  dm.qry_clientesCGC_CPF.EditMask := '999\.999\.999\-99;0';

end;

procedure Tfrm_cad_clientes.ckCNPJClick(Sender: TObject);
begin
  inherited;
  dm.qry_clientesCGC_CPF.Clear;
  dm.qry_clientesCGC_CPF.EditMask := '99\.999\.999\/9999\-99;0'

end;

end.
