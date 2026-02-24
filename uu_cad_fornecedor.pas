unit uu_cad_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RealFramework, rest.Types, Alcinoe.JSONDoc, Data.db, Dialogs, uu_modelo,
  StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, ACBrValidador, cxGraphics,
  cxControls, cxDBLookupComboBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, PngSpeedButton,
  cxLookupEdit, cxDBLookupEdit;

type
  TfrmCadFornecedores = class(Tfrm_modelo_cadastro)
    pn_campos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel2: TPanel;
    Label11: TLabel;
    Label15: TLabel;
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
    ed_telefone: TDBEdit;
    ed_fax: TDBEdit;
    ed_email: TDBEdit;
    DBMemo1: TDBMemo;
    ckbEstrangeiro: TCheckBox;
    cbPais: TcxLookupComboBox;
    Label19: TLabel;
    cbEstado: TcxLookupComboBox;
    Label20: TLabel;
    cbCidade: TcxLookupComboBox;
    Label22: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    Label5: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    function validaInformacoes(): boolean;
    procedure retornaInformacoes(cod_fornecedor: string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure setCnpjAuxiliar(cnpj: string);
    procedure FormActivate(Sender: TObject);
    procedure ckCNPJClick(Sender: TObject);
    procedure ckCPFClick(Sender: TObject);
    procedure ed_ieKeyPress(Sender: TObject; var Key: Char);
    procedure ckbEstrangeiroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbEstadoClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    procedure GetAPIData(ACNPJ: string);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornecedores: TfrmCadFornecedores;
  cnpjAuxiliar: string;

implementation

uses
  uu_data_module, uu_frm_principal, uu_modelo_vazio, uu_dm_consultas,
  uuDMExpedicaoDelivery;

{$R *.dfm}

procedure TfrmCadFornecedores.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled := true;
  pn_campos.Enabled := true;
  dm.qry_fornecedores.Active := true;
  dm.qry_fornecedores.Append;
  if (trim(cnpjAuxiliar) <> '') then
  begin
    dm.qry_fornecedoresCGC_CPF.Value := cnpjAuxiliar;
    DM.qry_fornecedoresCOMPLEMENTO.Value := 'SEM COMPLEMENTO';
    DM.qry_fornecedoresNUM_ENDERECO.Value := '0';
  end;

  dm_consultas.qryPaises.Active := true;
  dm_consultas.qryCidade.Active := false;
  dm_consultas.qryCidade.SQL.Clear;
  dm_consultas.qryCidade.SQL.Add('      select cd.cod_cidade, cd.codigo_estado, cd.nome  from cidade cd  order by cd.nome');
  dm_consultas.qryCidade.Active := true;
  cbPais.EditValue := '1058';
  cbEstado.EditValue := '005';
  cbCidade.EditValue := '2927408';
//  cbCidade.EditValue := '
  ckbEstrangeiro.Checked := false;
  ckCNPJClick(ckCNPJ);
  ed_cnpj.SetFocus;
//  ed_razao_social.SetFocus;

end;

procedure TfrmCadFornecedores.setCnpjAuxiliar(cnpj: string);
begin
  cnpjAuxiliar := cnpj;
end;

procedure TfrmCadFornecedores.gravarInformacoes();
var
  codParticipante: string;
begin
  if (evento = 1) then
  begin
    ed_codigo.Text := dm.geraCodigo('G_FORNECEDORES_CODIGO', 4);
  end;

  if ((evento = 1) or (evento = 2)) then
  begin
    dm.qry_fornecedoresCOD_FORNECEDOR.Value := ed_codigo.Text;
    dm.qry_fornecedoresRAZAO_SOCIAL.Value := trim(dm.qry_fornecedoresRAZAO_SOCIAL.Value);
    dm.qry_fornecedoresNOME_FANTASIA.Value := trim(dm.qry_fornecedoresNOME_FANTASIA.Value);
    dm.qry_fornecedoresENDERECO.Value := trim(dm.qry_fornecedoresENDERECO.Value);
    dm.qry_fornecedoresBAIRRO.Value := trim(dm.qry_fornecedoresBAIRRO.Value);
    dm.qry_fornecedoresEMAIL.Value := trim(dm.qry_fornecedoresEMAIL.Value);
    dm.qry_fornecedoresDATA_CADASTRO.Value := data_do_sistema;
    dm.qry_fornecedoresDATA_ULTIMA_COMPRA.Value := data_do_sistema;
    dm.qry_fornecedoresCOD_PAIS.Value := cbPais.EditValue;
    dm.qry_fornecedoresCOD_CIDADE.Value := cbCidade.EditValue;
    dm.qry_fornecedoresCOD_ESTADO.Value := cbEstado.EditValue;
    dm.qry_fornecedores.Post;
    dm.transacao.Commit;
  end
  else
  begin
    if (evento = 3) then
      if MessageDlg('Confirma exclusão do fornecedor  ?', mtConfirmation, [mbYes, mbNo], 0) = Mryes then
      begin
        dm.qry_fornecedores.Delete;
        dm.dbrestaurante.ApplyUpdates([dm.qry_fornecedores]);

      end;

  end;

end;

procedure TfrmCadFornecedores.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  if ((ckCNPJ.Checked) and (ckbEstrangeiro.Checked = false)) then
  begin
    GetAPIData(dm.qry_fornecedoresCGC_CPF.Value);
  end;

end;

procedure TfrmCadFornecedores.bt_cancelarClick(Sender: TObject);
begin
  inherited;

  dm.qry_fornecedores.Active := false;
end;

procedure TfrmCadFornecedores.GetAPIData(ACNPJ: string);
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: Tstringlist;
  LURLParam: string;
begin
  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;

  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';
  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';
  LURLParam := ACNPJ;
  Application.CreateForm(TdmExpedicaoDelivery, dmExpedicaoDelivery);

  try

    if dmExpedicaoDelivery.HTTPRequest(teConsultaFornecedor, LURLParam, LHeaders, LBody, LJsonRetorno, 5, 5, ctAPPLICATION_X_WWW_FORM_URLENCODED) then
    begin
      LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
      LJsonALC.LoadFromJSONString(LJsonRetorno.Text, []);
      dm.qry_fornecedoresRAZAO_SOCIAL.Value := Copy(Trim(LJsonALC.childnodes['RES'].childnodes['razao_social'].text), 0, 150);
      dm.qry_fornecedoresNOME_FANTASIA.Value := Copy(Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['nome_fantasia'].Text), 0, 150);
      dm.qry_fornecedoresENDERECO.Value :=Copy(Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['tipo_logradouro'].Text),0,150);
      dm.qry_fornecedoresENDERECO.Value := copy(dm.qry_fornecedoresENDERECO.Value + ' ' + Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['logradouro'].Text),0,150);
      dm.qry_fornecedoresNUM_ENDERECO.Value := Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['numero'].Text);
      dm.qry_fornecedoresCOMPLEMENTO.Value := copy(Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['complemento'].Text), 0, 99);
      dm.qry_fornecedoresCOMPLEMENTO.Value := StringReplace(dm.qry_fornecedoresCOMPLEMENTO.Value, '    ', ' ', [rfReplaceAll]);
      dm.qry_fornecedoresCOMPLEMENTO.Value := StringReplace(dm.qry_fornecedoresCOMPLEMENTO.Value, '   ', ' ', [rfReplaceAll]);
      dm.qry_fornecedoresBAIRRO.Value := Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['bairro'].Text);
      dm.qry_fornecedoresCEP.Value := Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['cep'].Text);
      dm.qry_fornecedoresEMAIL.Value := Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].childnodes['email'].Text);
      dm.qry_fornecedoresEMAIL.Value := Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].GetChildNodeValueText('email', ''));
      dm.qry_fornecedoresTELEFONE.Value := Trim(LJsonALC.childnodes['RES'].childnodes['estabelecimento'].GetChildNodeValueText('telefone1', ''));

      if (LJsonALC.childnodes['RES'].childnodes['estabelecimento'].ChildNodes['inscricoes_estaduais'].ChildNodes.Count > 0) then
      begin
        dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value := LJsonALC.childnodes['RES'].childnodes['estabelecimento'].ChildNodes['inscricoes_estaduais'].ChildNodes[0].GetChildNodeValueText('inscricao_estadual', '');
      end;

    end;

  finally
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LJsonALC);
    FreeAndNil(LHeaders);
    FreeAndNil(LBody);
    FreeAndNil(dmExpedicaoDelivery);
  end;
end;

procedure TfrmCadFornecedores.bt_gravarClick(Sender: TObject);
begin
  if ((evento = 1) or (evento = 2)) then
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

function TfrmCadFornecedores.validaInformacoes(): boolean;
begin

  if evento = 1 then
  begin
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('select cgc_cpf from fornecedor f where f.cgc_cpf=' + Quotedstr(dm.qry_fornecedoresCGC_CPF.Value));
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
    Result := false;
    exit;
  end;

  if trim(ed_nome_fantasia.Text) = '' then
  begin
    showmessage('Nome fantasia inválido!');
    ed_nome_fantasia.SetFocus;
    Result := false;
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
            dm.exibe_painel_erro('CNPJ inválido!', '')
          else
            dm.exibe_painel_erro('CPF inválido!', '');

          Result := false;
          exit;
        end
        else
        begin
          result := true;
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
        dm.exibe_painel_erro('CNPJ inválido!', '')
      else
        dm.exibe_painel_erro('CPF inválido!', '');
      result := false;
      exit;
    end;
  end;

  if not ((dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value = null) or (dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value = '')) then
  begin
    frm_principal.validador.TipoDocto := docInscEst;
    frm_principal.validador.Documento := dm.qry_fornecedoresINSCRICAO_ESTADUAL.Value;
    frm_principal.validador.Complemento := dm_consultas.qryEstadosSIGLA.Value;

    if not frm_principal.validador.Validar then
    begin
      dm.exibe_painel_erro('Inscrição Estadual inválida!', '');
      Result := false;
      exit;
    end
    else
    begin
      result := true;
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

  if ((dm.qry_fornecedoresENDERECO.Value = null) or (trim(dm.qry_fornecedoresENDERECO.Value) = '')) then
  begin
    showmessage('Endereço inválido!');
    result := false;
    exit;
  end;

  if ((dm.qry_fornecedoresCOMPLEMENTO.Value = null) or (trim(dm.qry_fornecedoresCOMPLEMENTO.Value) = '')) then
  begin
    showmessage('Complemento de endereço inválido! Caso não tenha, informe SEM COMPLEMENTO');
    result := false;
    exit;
  end;

  if ((dm.qry_fornecedoresCEP.Value = null) or (trim(dm.qry_fornecedoresCEP.Value) = '')) then
  begin
    showmessage('Cep inválido!');
    result := false;
    exit;
  end
  else
  begin

    if ckbEstrangeiro.Checked = false then
    begin
      frm_principal.validador.TipoDocto := docCEP;
      frm_principal.validador.Documento := dm.qry_fornecedoresCEP.Value;

      if not frm_principal.validador.Validar then
      begin
        if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'CEP não validado. Deseja continuar mesmo assim?') = teSim) then
        begin
          result := true;
        end
        else
        begin
          result := false;
          exit;
        end;
      end;
    end;

  end;

  if verificaExistenciaCidade(cbCidade.EditValue) = false then
  begin
    showmessage('Código de cidade inválido!');
    cbCidade.SetFocus;
    result := false;
    exit;
  end;

  result := true;
end;

procedure TfrmCadFornecedores.ed_codigoExit(Sender: TObject);
begin
  inherited;
  inherited;

  if (Sender is TMaskEdit and ((Sender as TMaskEdit).Name = 'ed_codigo')) then
  begin
    if Trim(ed_codigo.Text) = '' then
      exit;

    try
      ed_codigo.Text := FormatFloat('0000', StrTOFloat(ed_codigo.text));
    except
      begin
        ShowMessage('Código de Fornecedor inválido!');
        ed_codigo.clear;
        ed_codigo.SetFocus;
        exit;
      end;
    end;

    if (verificaExistenciaFornecedor(trim(ed_codigo.Text)) = true) then
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

procedure TfrmCadFornecedores.retornaInformacoes(cod_fornecedor: string);
begin
  dm.qry_fornecedores.Active := false;
  dm.qry_fornecedores.SQL.clear;
  dm.qry_fornecedores.SQL.Add('select f.*,');
  dm.qry_fornecedores.SQL.Add('  c.nome as nome_cidade,');
  dm.qry_fornecedores.SQL.Add('  es.nome as NomeEstado   ');
  dm.qry_fornecedores.SQL.Add('   from fornecedor f');
  dm.qry_fornecedores.SQL.Add('   left join cidade c on (c.cod_cidade = f.cod_cidade)');
  dm.qry_fornecedores.SQL.Add('   left join estado es on (es.codigo = f.cod_estado)');
  dm.qry_fornecedores.sql.add(' where f.cod_fornecedor=' + Quotedstr(cod_fornecedor));
  dm.qry_fornecedores.active := true;

  cbPais.EditValue := dm.qry_fornecedoresCOD_PAIS.Value;
  cbEstado.EditValue := dm.qry_fornecedoresCOD_ESTADO.Value;
  cbCidade.EditValue := dm.qry_fornecedoresCOD_CIDADE.Value;

  if (evento = 2) then
  begin
    dm.qry_fornecedores.Edit;
    pn_campos.Enabled := true;
  end;

  if ((evento = 2) or (evento = 3)) then
    bt_gravar.Enabled := true;

end;

procedure TfrmCadFornecedores.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaFornecedor();
  ed_codigo.Text := string_auxiliar;
  if verificaExistenciaFornecedor(ed_codigo.text) then
    retornaInformacoes(ed_codigo.text);
end;

procedure TfrmCadFornecedores.cbEstadoClick(Sender: TObject);
begin
  inherited;

  dm_consultas.qryCidade.Active := false;
  dm_consultas.qryCidade.SQL.Clear;
  dm_consultas.qryCidade.SQL.Add('      select cd.cod_cidade, cd.codigo_estado, cd.nome  from cidade cd where cd.codigo_estado=' + Quotedstr(cbEstado.EditValue) + ' order by cd.nome');
  dm_consultas.qryCidade.Active := true;
  cbCidade.EditValue := dm_consultas.qryCidadeCOD_CIDADE.Value;

end;

procedure TfrmCadFornecedores.ckbEstrangeiroClick(Sender: TObject);
begin
  inherited;

  if (dm.qry_fornecedores.State = dsInsert) or (dm.qry_fornecedores.State = dsEdit) then
  begin
    if ckbEstrangeiro.Checked then
    begin
      dm.qry_fornecedoresCGC_CPF.EditMask := '';
      dm_consultas.qryCidade.Active := false;
      dm_consultas.qryCidade.SQL.Clear;
      dm_consultas.qryCidade.SQL.Add('      select cd.cod_cidade, cd.codigo_estado, cd.nome  from cidade cd where cd.codigo_estado=' + Quotedstr('099') + ' order by cd.nome');
      dm_consultas.qryCidade.Active := true;
      cbCidade.EditValue := '9999999';
      cbEstado.EditValue := '099';
      cbCidade.Enabled := false;
      cbEstado.Enabled := false;

    end
    else
    begin

      dm_consultas.qryCidade.Active := false;
      dm_consultas.qryCidade.SQL.Clear;
      dm_consultas.qryCidade.SQL.Add('      select cd.cod_cidade, cd.codigo_estado, cd.nome  from cidade cd  order by cd.nome');
      dm_consultas.qryCidade.Active := true;
      cbCidade.EditValue := dm_consultas.qryCidadeCOD_CIDADE.Value;
      cbCidade.Enabled := true;
      cbEstado.Enabled := true;

      dm.qry_fornecedoresCGC_CPF.EditMask := '';

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

end;

procedure TfrmCadFornecedores.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedoresCGC_CPF.EditMask := '99\.999\.999\/9999\-99;0';
  if (trim(cnpjAuxiliar) <> '') then
    bt_novo.click;
end;

procedure TfrmCadFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  dm_consultas.qryPaises.Active := true;
  dm_consultas.qryEstados.Active := true;
  dm_consultas.qryCidade.Active := true;
end;

procedure TfrmCadFornecedores.FormDestroy(Sender: TObject);
begin
  inherited;
  dm_consultas.qryPaises.Active := false;
  dm_consultas.qryEstados.Active := false;
  dm_consultas.qryEstados.Active := false;
end;

procedure TfrmCadFornecedores.ckCNPJClick(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedoresCGC_CPF.Clear;
  dm.qry_fornecedoresCGC_CPF.EditMask := '99\.999\.999\/9999\-99;0'
end;

procedure TfrmCadFornecedores.ckCPFClick(Sender: TObject);
begin
  inherited;
  dm.qry_fornecedoresCGC_CPF.clear;
  dm.qry_fornecedoresCGC_CPF.EditMask := '999\.999\.999\-99;0';
end;

procedure TfrmCadFornecedores.ed_ieKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
  begin
    Key := #0;
    showmessage('Este campo só aceita números! Se o contribuinte não possuir inscrição, deixe o campo em branco!');

  end

end;

end.

