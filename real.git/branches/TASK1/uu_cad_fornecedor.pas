unit uu_cad_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls ,ACBrBase, ACBrValidador;

type
  Tfrm_cad_fornecedor = class(Tfrm_modelo_cadastro)
    Label13: TLabel;
    pn_campos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bt_pesq_cidade: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label21: TLabel;
    Panel4: TPanel;
    ed_nome_cidade: TDBEdit;
    Label5: TLabel;
    Label17: TLabel;
    bt_pesq_estado: TSpeedButton;
    Panel2: TPanel;
    ed_nome_estado: TDBEdit;
    Label18: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ed_razao_social: TDBEdit;
    ed_nome_fantasia: TDBEdit;
    ckCNPJ: TRadioButton;
    ckCPF: TRadioButton;
    ed_cnpj: TDBEdit;
    ed_ie: TDBEdit;
    i_municipal: TDBEdit;
    ed_endereco: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ed_bairro: TDBEdit;
    ed_cep: TDBEdit;
    ed_cod_estado: TDBEdit;
    ed_cod_cidade: TDBEdit;
    ed_telefone: TDBEdit;
    ed_fax: TDBEdit;
    ed_email: TDBEdit;
    DBMemo1: TDBMemo;
    ckbEstrangeiro: TCheckBox;
    procedure bt_novoClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);

    function validaInformacoes() : boolean;
    procedure retornaInformacoes(cod_fornecedor : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure setCnpjAuxiliar(cnpj : string);
    procedure FormActivate(Sender: TObject);
    procedure ckCNPJClick(Sender: TObject);
    procedure ckCPFClick(Sender: TObject);
    procedure ed_ieKeyPress(Sender: TObject; var Key: Char);
    procedure ckbEstrangeiroClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_fornecedor: Tfrm_cad_fornecedor;
  cnpjAuxiliar : string;

implementation

uses uu_data_module, uu_frm_principal,
  uu_modelo_vazio;

{$R *.dfm}

procedure Tfrm_cad_fornecedor.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  pn_campos.Enabled:=true;
  dm.qry_fornecedores.Active:=true;
  dm.qry_fornecedores.Append;
  if (trim(cnpjAuxiliar) <> '' ) then
   begin
     dm.qry_fornecedoresCGC_CPF.Value := cnpjAuxiliar;
     DM.qry_fornecedoresCOMPLEMENTO.Value := 'SEM COMPLEMENTO';
     DM.qry_fornecedoresNUM_ENDERECO.Value := '0';
   end;


  ckbEstrangeiro.Checked := false;
  ckCNPJClick(ckCNPJ);
  ed_razao_social.SetFocus;

end;

procedure Tfrm_cad_fornecedor.setCnpjAuxiliar(cnpj : string);
begin
 cnpjAuxiliar := cnpj;
end;

procedure Tfrm_cad_fornecedor.gravarInformacoes();
var
  codParticipante : string;
begin
   if (evento = 1) then
   begin

     ed_codigo.Text:=dm.geraCodigo('G_FORNECEDORES_CODIGO',4);
     dm.qry_fornecedoresCOD_FORNECEDOR.Value:=ed_codigo.Text;
     dm.qry_fornecedoresRAZAO_SOCIAL.Value:=trim(dm.qry_fornecedoresRAZAO_SOCIAL.Value);
     dm.qry_fornecedoresNOME_FANTASIA.Value:=trim(dm.qry_fornecedoresNOME_FANTASIA.Value);
     dm.qry_fornecedoresENDERECO.Value:=trim(dm.qry_fornecedoresENDERECO.Value);
     dm.qry_fornecedoresBAIRRO.Value:=trim(dm.qry_fornecedoresBAIRRO.Value);
     dm.qry_fornecedoresEMAIL.Value:=trim(dm.qry_fornecedoresEMAIL.Value);          


     dm.qry_fornecedoresDATA_CADASTRO.Value:=data_do_sistema;
     dm.qry_fornecedoresDATA_ULTIMA_COMPRA.Value:=data_do_sistema;
   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_fornecedores.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_fornecedores]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do fornecedor  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_fornecedores.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_fornecedores]);

         end;

    end;

end;


procedure Tfrm_cad_fornecedor.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedores.Cancel;
  dm.qry_fornecedores.Active:=false;
end;

procedure Tfrm_cad_fornecedor.bt_gravarClick(Sender: TObject);
begin
  if ( (evento = 1) or (evento = 2)) then
   begin
     if validaInformacoes then
       begin
        gravarInformacoes();
        inherited;
       end
   end
  else
   begin
    gravarInformacoes;
    inherited;
   end;


end;


function Tfrm_cad_fornecedor.validaInformacoes() : boolean;
begin

  if evento = 1  then
   begin
    dm.qryauxiliar.Active :=false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('select cgc_cpf from fornecedor f where f.cgc_cpf='+Quotedstr(dm.qry_fornecedoresCGC_CPF.Value));
    dm.qryauxiliar.Active := true;
    dm.qryauxiliar.FetchAll;

    if (dm.qryauxiliar.IsEmpty = false) then
     begin
       dm.qryauxiliar.Active := false;
       showmessage('Já existe um fornecedor / cliente com o CNPJ ou CPF informado!');
       Result := false;
       exit;
     end;
      dm.qryauxiliar.Active := false;
   end;






  if trim(ed_razao_social.Text) = '' then
   begin
     Showmessage('Razão social invalida!');
     ed_razao_social.SetFocus;
     Result:=false;
     exit;
   end;


  if trim(ed_nome_fantasia.Text) = '' then
   begin
     showmessage('Nome fantasia inválido!');
     ed_nome_fantasia.SetFocus;
     Result:=false;
     exit;
   end;



   try
     begin
          frm_principal.validador.Documento := dm.qry_fornecedoresCGC_CPF.Value;

          if ckCNPJ.Checked then
             frm_principal.validador.TipoDocto := docCNPJ
          else
             frm_principal.validador.TipoDocto := docCPF;

          if ckbEstrangeiro.Checked = false then
           begin
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
          else
           begin
             Result := true;
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


   if not ((dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value = null) or (dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value = '') ) then
    begin
       frm_principal.validador.TipoDocto   :=  docInscEst;
       frm_principal.validador.Documento   :=  dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value;
       frm_principal.validador.Complemento :=  getUFEstado(dm.qry_fornecedoresCOD_ESTADO.Value);
       

       if not frm_principal.validador.Validar then
         begin
           dm.exibe_painel_erro('Inscrição Estadual inválida!','');
           Result := false;
           exit;
         end
       else
         begin
           result:= true;
         end;
    end;





   try
     begin
       dm.qry_fornecedoresNUM_ENDERECO.Value := Inttostr(StrToInt(dm.qry_fornecedoresNUM_ENDERECO.Value));
     end;
   except
    begin
      showmessage('Número do endereço do fornecedor inválido. Se não possuir, digitar o número 0');
      result := false;
      exit;
    end;
   end;


    if ( (dm.qry_fornecedoresENDERECO.Value = null) or ( trim(dm.qry_fornecedoresENDERECO.Value) = '' ))  then
    begin
      showmessage('Endereço inválido!');
      result := false;
      exit;
    end;



    if ( (dm.qry_fornecedoresCOMPLEMENTO.Value = null) or ( trim(dm.qry_fornecedoresCOMPLEMENTO.Value) = '' ))  then
    begin
      showmessage('Complemento de endereço inválido! Caso não tenha, informe SEM COMPLEMENTO');
      result := false;
      exit;
    end;


   if ( (dm.qry_fornecedoresCEP.Value = null) or ( trim(dm.qry_fornecedoresCEP.Value) = '' ))  then
    begin
      showmessage('Cep inválido!');
      result := false;
      exit;
    end
   else
    begin

    if ckbEstrangeiro.Checked = false  then
     begin
        frm_principal.validador.TipoDocto := docCEP;
        frm_principal.validador.Documento := dm.qry_fornecedoresCEP.Value;

        if not frm_principal.validador.Validar then
         begin
           showmessage('Cep inválido!');
          result := false;
          exit;

         end;
     end;


    end;



  if verificaExistenciaCidade(ed_cod_cidade.Text)=false then
   begin
     showmessage('Código de cidade inválido!');
     ed_cod_cidade.SetFocus;
     result:=false;
     exit;
   end;




 result:=true;
end;

procedure Tfrm_cad_fornecedor.ed_codigoExit(Sender: TObject);
begin
  inherited;
inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('0000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de Fornecedor inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaFornecedor(trim(ed_codigo.Text)) = true)
        then
           retornaInformacoes(ed_codigo.Text)
        else
          begin
            ShowMessage('Codigo inexistente!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;


end;


procedure Tfrm_cad_fornecedor.retornaInformacoes(cod_fornecedor : string);
begin
  dm.qry_fornecedores.Active:=false;
  dm.qry_fornecedores.SQL.clear;
   dm.qry_fornecedores.SQL.Add('select f.*,');
  dm.qry_fornecedores.SQL.Add('  c.nome as nome_cidade,');
  dm.qry_fornecedores.SQL.Add('  es.nome as NomeEstado   ');
  dm.qry_fornecedores.SQL.Add('   from fornecedor f');
  dm.qry_fornecedores.SQL.Add('   left join cidade c on (c.cod_cidade = f.cod_cidade)');
  dm.qry_fornecedores.SQL.Add('   left join estado es on (es.codigo = f.cod_estado)');
  dm.qry_fornecedores.sql.add(' where f.cod_fornecedor='+Quotedstr(cod_fornecedor));




  dm.qry_fornecedores.active:=true;
      if (evento = 2)then
       begin
        dm.qry_fornecedores.Edit;
        pn_campos.Enabled:=true;
       end;


      if ((evento=2) or (evento = 3)) then
        bt_gravar.Enabled:=true;


end;

procedure Tfrm_cad_fornecedor.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaFornecedor();
  ed_codigo.Text:=string_auxiliar;
  if verificaExistenciaFornecedor(ed_codigo.text) then
   retornaInformacoes(ed_codigo.text);
end;

procedure Tfrm_cad_fornecedor.ckbEstrangeiroClick(Sender: TObject);
begin
  inherited;
  if ckbEstrangeiro.Checked  then
   begin
        dm.qry_fornecedoresCGC_CPF.EditMask := '';
   end
  else
   begin
     if ckCPF.Checked then
      begin
        dm.qry_fornecedoresCGC_CPF.clear;
        dm.qry_fornecedoresCGC_CPF.EditMask := '999\.999\.999\-99;0';
      end
     else
      begin
        dm.qry_fornecedoresCGC_CPF.Clear;
        dm.qry_fornecedoresCGC_CPF.EditMask := '99\.999\.999\/9999\-99;0'
      end;


   end;


end;

procedure Tfrm_cad_fornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedoresCGC_CPF.EditMask := '99\.999\.999\/9999\-99;0';
  if  (trim(cnpjAuxiliar) <> '') then
   bt_novo.click;
end;

procedure Tfrm_cad_fornecedor.ckCNPJClick(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedoresCGC_CPF.Clear;
  dm.qry_fornecedoresCGC_CPF.EditMask := '99\.999\.999\/9999\-99;0'
end;

procedure Tfrm_cad_fornecedor.ckCPFClick(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedoresCGC_CPF.clear;
  dm.qry_fornecedoresCGC_CPF.EditMask := '999\.999\.999\-99;0';
end;

procedure Tfrm_cad_fornecedor.ed_ieKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not (Key in['0'..'9',Chr(8)]) then
 BEGIN
  Key:= #0;
  showmessage('Este campo só aceita números! Se o contribuinte não possuir inscrição, deixe o campo em branco!');

 END

end;

end.
