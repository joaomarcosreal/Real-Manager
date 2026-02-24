unit uuParametrosSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, acbrValidador, Vcl.Graphics,System.IOUtils, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, JvExControls,
  JvPageList, AdvGlassButton, JvTabBar, Vcl.StdCtrls, Vcl.ExtCtrls, synautil, synacode,

  PngSpeedButton, Vcl.Mask, cxGraphics, cxControls,

  cxDBLookupComboBox,
  Vcl.Samples.Spin,  AdvDateTimePicker, Data.DB,
  Vcl.DBGrids, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons, Vcl.Grids, cxLookupEdit, cxDBLookupEdit,
  Vcl.Menus;

type
  TfrmParametrosSistema = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    JvTabBar1: TJvTabBar;
    Panel2: TPanel;
    AdvGlassButton1: TAdvGlassButton;
    btImprimir: TAdvGlassButton;
    pgPrincipal: TJvPageList;
    pgDadosEmpresa: TJvStandardPage;
    Label2: TLabel;
    edSenhaCertificado: TEdit;
    Label3: TLabel;
    pgCertificado: TJvStandardPage;
    edLocalArquivoCertificado: TEdit;
    OpenDialog1: TOpenDialog;
    PngSpeedButton1: TPngSpeedButton;
    Label5: TLabel;
    edNumeroSerieCertificado: TEdit;
    edRazoSocial: TEdit;
    Label9: TLabel;
    edNomeFantasia: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edCNPJ: TMaskEdit;
    edIE: TMaskEdit;
    Label12: TLabel;
    edIM: TMaskEdit;
    Label13: TLabel;
    edCEP: TMaskEdit;
    Label14: TLabel;
    cbCidade: TcxLookupComboBox;
    Label15: TLabel;
    Label16: TLabel;
    edEstado: TMaskEdit;
    edLogradouro: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    rdRegimeEmpresa: TRadioGroup;
    pgDataDoSistema: TJvStandardPage;
    edDataDoSistema: TAdvDateTimePicker;
    Label25: TLabel;
    pgNFE: TJvStandardPage;
    Image1: TImage;
    Label4: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edSerieNFE: TMaskEdit;
    edUltimaNFE: TSpinEdit;
    edCartaCorrecaoNFE: TSpinEdit;
    rdgTipoEnvioNFE: TRadioGroup;
    DBGrid1: TDBGrid;
    cxcx: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RadioGroup1: TRadioGroup;
    edCSCProducaoNFCE: TEdit;
    edIDProducao: TEdit;
    edCSCHomologacaoNFCE: TEdit;
    edIDHomologacaoNFCE: TEdit;
    edNumero: TMaskEdit;
    edBairro: TEdit;
    edComplemento: TEdit;
    edTelefone: TMaskEdit;
    edNomeResponsavel: TEdit;
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cbCidadePropertiesEditValueChanged(Sender: TObject);
  private
    procedure getParametros;
    procedure carregaArquivoCertificado;
    procedure salvarInformacoes;
    function validaInformacoes: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametrosSistema: TfrmParametrosSistema;
  certificadoEncodado : string;

implementation

{$R *.dfm}

uses uu_data_module, uu_frm_principal;

procedure TfrmParametrosSistema.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmParametrosSistema.FormActivate(Sender: TObject);
begin
  inherited;
  pgPrincipal.ActivePage := pgDadosEmpresa;
  getParametros();




end;

procedure TfrmParametrosSistema.getParametros();
begin


  certificadoEncodado 					:= '';
  dm.transacao.Active 					:= false;
  dm.transacao.Active 					:= true;
  dm.tb_parametros.Active 				:= true;
  dm.qryCidade.Active := true;

  edDataDoSistema.Date            := dm.tb_parametrosDATA_SISTEMA.Value ;
  edRazoSocial.Text         			:= dm.tb_parametrosRAZAO_SOCIAL.Value;
  edNomeFantasia.Text       			:= dm.tb_parametrosNOME_FANTASIA.Value;
  edCNPJ.Text               			:= dm.tb_parametrosCNPJ.Value;
  edIE.Text                 			:= dm.tb_parametrosIE.value;
  edIM.Text                 			:= dm.tb_parametrosIM.Value;
  edCEP.Text                			:= dm.tb_parametrosCEP.Value;
  edEstado.Text             			:= dm.tb_parametrosUF.Value;
  edLogradouro.Text         			:= dm.tb_parametrosLOGRADOURO.Text;
  edNumero.Text             			:= dm.tb_parametrosNUMERO.Text;
  edBairro.Text             			:= dm.tb_parametrosBAIRRO.Text;
  edComplemento.Text        			:= dm.tb_parametrosCOMPLEMENTO.Value;
  edTelefone.Text           			:= dm.tb_parametrosTELEFONE_EMPRESA.Value;
  edNomeResponsavel.Text    			:= dm.tb_parametrosCONTATO.Value;
  rdRegimeEmpresa.ItemIndex 		    	:= dm.tb_parametrosREGIME_TRIBUTACAO.Value;

  edNumeroSerieCertificado.Text     	:= dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
  edSenhaCertificado.Text           	:= dm.tb_parametrosSENHA_CERTIFICADO.Value;
  edCSCProducaoNFCE.Text            	:= dm.tb_parametrosCSC_NFCE.Value;
  edIDProducao.Text                 	:= dm.tb_parametrosID_CSC_NFCE.Text;
  edCSCHomologacaoNFCE.Text         	:= dm.tb_parametrosCSC_NFCE_HOMOLOGACAO.Text;
  edIDHomologacaoNFCE.Text          	:= dm.tb_parametrosID_CSC_NFCE_HOMOLOGACAO.Text;

  edSerieNFE.Text                   	:= Inttostr( dm.tb_parametrosSERIE_NFE.Value);
  edUltimaNFE.Value                 	:= dm.tb_parametrosNUMERO_NFE.Value;
  edCartaCorrecaoNFE.Value          	:= dm.tb_parametrosNUMERO_CARTA_CORRECAO_NFE.Value;
  rdgTipoEnvioNFE.ItemIndex         	:= dm.tb_parametrosTIPO_ENVIO_NFE.Value;
  cbCidade.EditValue := dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value;
  edEstado.Text      := dm.tb_parametrosUF.Value;


  dm.qryConfigPDVS.Active := true;
end;


procedure TfrmParametrosSistema.salvarInformacoes();
begin
   try
     dm.tb_parametros.Edit;
     dm.tb_parametrosRAZAO_SOCIAL.Value                 :=  edRazoSocial.Text;
     dm.tb_parametrosNOME_FANTASIA.Value                :=  edNomeFantasia.Text;
     dm.tb_parametrosCNPJ.Value                         :=  edCNPJ.Text;
     dm.tb_parametrosIE.value                           :=  edIE.Text;
     dm.tb_parametrosIM.Value                           :=  edIM.Text;
     dm.tb_parametrosCEP.Value                          :=  edCEP.Text;
     dm.tb_parametrosUF.Value                           :=  edEstado.Text;
     dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value           :=  cbCidade.EditValue;
//     dm.tb_parametrosCOD_CIDADE.Value                   :=  cbCidade.EditValue;
     dm.tb_parametrosLOGRADOURO.Text                    :=  edLogradouro.Text;
     dm.tb_parametrosNUMERO.Text                        :=  edNumero.Text;
     dm.tb_parametrosBAIRRO.Text                        :=  edBairro.Text;
     dm.tb_parametrosCOMPLEMENTO.Value                  :=  edComplemento.Text;
     dm.tb_parametrosTELEFONE_EMPRESA.Value             :=  edTelefone.Text;
     dm.tb_parametrosCONTATO.Value                      :=  edNomeResponsavel.Text;
     dm.tb_parametrosREGIME_TRIBUTACAO.Value            :=  rdRegimeEmpresa.ItemIndex;


     if ( trim(certificadoEncodado) <> '' ) then
      begin
        dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value        :=  edNumeroSerieCertificado.Text;
        dm.tb_parametrosSENHA_CERTIFICADO.Value            :=  edSenhaCertificado.Text;
        dm.tb_parametrosPFX_CERTIFICADO.Value              := certificadoEncodado;
      end;


     dm.tb_parametrosCSC_NFCE.Value                     :=  edCSCProducaoNFCE.Text;
     dm.tb_parametrosID_CSC_NFCE.Text                   :=  edIDProducao.Text;
     dm.tb_parametrosCSC_NFCE_HOMOLOGACAO.Text          :=  edCSCHomologacaoNFCE.Text;
     dm.tb_parametrosID_CSC_NFCE_HOMOLOGACAO.Text       :=  edIDHomologacaoNFCE.Text;

     dm.tb_parametrosSERIE_NFE.Value                    :=  StrToInt(edSerieNFE.Text);
     dm.tb_parametrosNUMERO_NFE.Value                   :=  edUltimaNFE.Value;
     dm.tb_parametrosNUMERO_CARTA_CORRECAO_NFE.Value    :=  edCartaCorrecaoNFE.Value;
     dm.tb_parametrosTIPO_ENVIO_NFE.Value               :=  rdgTipoEnvioNFE.ItemIndex;
     dm.tb_parametrosDATA_SISTEMA.Value                 := edDataDoSistema.Date;

     dm.tb_parametros.Post;

     if dm.qryConfigPDVS.State = dsEdit  then
      dm.qryConfigPDVS.Post;


     dm.transacao.Commit;
     dm.transacao.Active := false;
     dm.transacao.Active := true;
   finally
     dm.qryCidade.Active := false;
     dm.transacao.Active := false;
   end;

end;

procedure TfrmParametrosSistema.PngSpeedButton1Click(Sender: TObject);
var
 extensao : string;
begin
  inherited;
   OpenDialog1.Execute();
   if OpenDialog1.FileName <> ''  then
    begin
       extensao :=  TPath.GetExtension(OpenDialog1.FileName);
     case AnsiIndexStr(extensao , ['.pfx', '.p12']) of
      0: begin
          carregaArquivoCertificado();
         end;
      1: begin
          carregaArquivoCertificado();
         end
      else
       begin
         dm.exibe_painel_erro('O arquivo selecionado não é um certificado digital!','Ok');
       end;
      end
    end;
end;

procedure TfrmParametrosSistema.btImprimirClick(Sender: TObject);
begin
  inherited;

  if validaInformacoes  then
   begin
    salvarInformacoes();
    dm.exibe_painel_erro('Alteração efetuada com sucesso! '+sLineBreak+sLineBreak +' O sistema vai se auto-reiniciar para que as alterações façam efeito.  ','Ok');
    Close;
   end;

end;

function TfrmParametrosSistema.validaInformacoes() : boolean;
begin



 if trim(edCNPJ.Text) <> '00000000000000' then
  begin
    frm_principal.validador.TipoDocto   := docCNPJ;
    frm_principal.validador.Documento   := edCNPJ.Text;
    if not frm_principal.validador.Validar then
     begin
       dm.exibe_painel_erro('CNPJ inválido!','Ok');
       result := false;
      exit;
     end;
   end;




  if trim(edIE.Text) <> ''  then
  begin
    frm_principal.validador.TipoDocto   := docInscEst;
    frm_principal.validador.Documento   := edIE.Text;
    frm_principal.validador.Complemento := edEstado.Text;
    if not frm_principal.validador.Validar then
     begin
       dm.exibe_painel_erro('Inscrição estadual inválida!','Ok');
       result := false;
       exit;
     end;
  end;



  frm_principal.validador.TipoDocto   := docCEP;
  frm_principal.validador.Documento   := edCEP.Text;
  frm_principal.validador.Complemento := edEstado.Text;
  frm_principal.validador.Validar;
  if not frm_principal.validador.Validar then
   begin
     dm.exibe_painel_erro('CEP inválido!','Ok');
     result := false;
     exit;
   end;




  if edDataDoSistema.Date < (dm.tb_parametrosDATA_SISTEMA.Value -1)  then
   begin
     dm.exibe_painel_erro('A data do sistema não pode ser inferior a dois dias da última data armazenada no banco de dados!', 'Ok');
     Result := false;
     exit;
   end;



 result := true;



end;

procedure TfrmParametrosSistema.carregaArquivoCertificado();
var
 vFile: TFileStream;


begin
  vFile := TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
  try
    certificadoEncodado := EncodeBase64(ReadStrFromStream(vFile, vFile.Size));
  finally
    vFile.Free;
  end;

  dm.ACBrNFe1.Configuracoes.Certificados.ArquivoPFX  := OpenDialog1.FileName;
  dm.ACBrNFe1.Configuracoes.Certificados.Senha       := edSenhaCertificado.Text;
  dm.ACBrNFe1.SSL.CarregarCertificado;


  if copy(dm.ACBrNFe1.SSL.CertCNPJ,0,8) <> copy(edCNPJ.Text,0,8)  then
   begin
     dm.exibe_painel_erro('CNPJ do certificado selecionado é diferente do CNPJ informado nos parâmetros da empresa.'
      +sLineBreak+sLineBreak+'O certificado selecionado percente a '+dm.ACBrNFe1.SSL.CertRazaoSocial,'Ok');
     certificadoEncodado:= '';
   end;


   if dm.ACBrNFe1.SSL.CertDataVenc <= Now  then
    begin
      dm.exibe_painel_erro('Certificado selecionado expirou em '+FormatDateTime('DD/MM/YYY',dm.ACBrNFe1.SSL.CertDataVenc),'Ok');
      certificadoEncodado:= '';
    end;



  edNumeroSerieCertificado.Text :=   dm.ACBrNFe1.SSL.CertNumeroSerie;
  ////dm.adicionalog('Base 64 do certificado digital:');
  ////dm.adicionalog(certificadoEncodado);
end;


procedure TfrmParametrosSistema.cbCidadePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
   dm.qryCidade.Locate('cod_cidade',cbCidade.EditValue,[loCaseInsensitive, loPartialKey]);
   edEstado.Text := dm.qryCidadeUF.Value ;

end;

end.
