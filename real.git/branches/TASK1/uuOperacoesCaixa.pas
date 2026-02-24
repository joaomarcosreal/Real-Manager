unit uuOperacoesCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls,ACBrTEFDClass, ExtCtrls, Buttons,
  Vcl.ActnList, System.Actions;

type
  TfrmOperacoesDeCaixa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    lbMensagem: TLabel;
    btSangria: TBitBtn;
    btSuprimento: TBitBtn;
    btNFCEcontingencia: TBitBtn;
    btRelParcial: TBitBtn;
    lbContasAssinadas: TBitBtn;
    btFecharCaixa: TBitBtn;
    btFechar: TBitBtn;
    btMudarOperador: TBitBtn;
    btSairDoSistema: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    procedure btSangriaClick(Sender: TObject);
    procedure btFecharCaixaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btRelParcialClick(Sender: TObject);
    procedure btSuprimentoClick(Sender: TObject);
    procedure lbContasAssinadasClick(Sender: TObject);
    procedure btNFCEcontingenciaClick(Sender: TObject);
    procedure btMudarOperadorClick(Sender: TObject);
    procedure btSairDoSistemaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setMensagemOperador(mensagem: string);
    function getMensagemOperador: string;

  end;

var
  frmOperacoesDeCaixa: TfrmOperacoesDeCaixa;

implementation

uses uu_data_module, uuSangria, uuFechamentoCaixa, uu_frm_principal,
  uUSuprimentoExtra, uuBaixaContasAssinadas, uuMemoriaFiscal,
  uuEnvioContingencia, uu_confirma_extrato, uuFrenteCaixa,
  uuReimpressaoDanfeNFCE, uuConsultaInfSat;

{$R *.dfm}

procedure TfrmOperacoesDeCaixa.btSangriaClick(Sender: TObject);
begin
  inherited;
 if dm.verificaPermissaoAcao('I20002008') = true then
  begin
    Application.CreateForm(TfrmSangria,frmSangria);
    frmSangria.Showmodal;
    frmSangria.free;
  end;
end;

procedure TfrmOperacoesDeCaixa.btFecharCaixaClick(Sender: TObject);
begin
  inherited;
  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
   begin
    showmessage('O caixa já se encontra fechado!');
    exit;
   end
  else
   begin

    dm.qryauxiliar.Active :=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.Add('select count(*) from movimento_mesa');
    dm.qryauxiliar.Active :=true;

    if (dm.qryauxiliar.FieldByName('count').Value > 0 )then
     begin
      if (dialogConfirmacao('Existem Mesas abertas',' Existem mesas ainda abertas no sistema. Deseja mesmo fechar o caixa desta forma ?',16) = true ) then
       begin
        Application.CreateForm(TfrmFechamentoCaixa,frmFechamentoCaixa);
        frmFechamentoCaixa.showmodal;
        frmFechamentoCaixa.free;
       end;
     end
    else
     begin
        Application.CreateForm(TfrmFechamentoCaixa,frmFechamentoCaixa);
        frmFechamentoCaixa.showmodal;
        frmFechamentoCaixa.free;
     end;
   end;
  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
   begin
    close;
    dm.gravaini('NFCE','forçarContingenciaOffline','0');
     frm_principal.TrocarOperador := true;
     close;

   end;

end;

procedure TfrmOperacoesDeCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  frm_principal.sairDoSistema := false;
  frm_principal.TrocarOperador := false;
  btSangria .Caption := 'Sangria'#10+'de'+#10+'caixa';
  btSuprimento.Caption := 'Suprimento'#10+'extra'+#10;
  btFecharCaixa.Caption := 'Fechamento'+#10+'do'+#10+'caixa'+'';
  btRelParcial.Caption := 'Parcial'+#10+'do'+#10+' deste caixa'+'';
  btMudarOperador.Caption := 'Trocar '+#10+' operador'+'';
  btRelParcial.Caption := 'Parcial'+#10+'do'+#10+' geral de caixa'+'';
  lbContasAssinadas.Caption := 'Receber'#10+'contas assinadas'+#10;
  btNFCEcontingencia.Caption :='Gerenciamento '+#10'de NFC-e'+#10;
  btFechar.caption := 'Fechar menu'+#10'de operações'+#10;

end;

procedure TfrmOperacoesDeCaixa.btFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmOperacoesDeCaixa.btRelParcialClick(Sender: TObject);
begin
  inherited;
 if dm.verificaPermissaoAcao('I20001006') = true then
  begin
    dm.emtirRelatorioParcialDeCaixa();
  end;
end;

procedure TfrmOperacoesDeCaixa.btSuprimentoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmSuprimentoExtra,frmSuprimentoExtra);
  frmSuprimentoExtra.ShowModal;
  frmSuprimentoExtra.Free;
end;

procedure TfrmOperacoesDeCaixa.lbContasAssinadasClick(Sender: TObject);
begin
  inherited;
 if dm.verificaPermissaoAcao('I20001014') = true then
  begin
   Application.CreateForm(TfrmBaixaFaturas,frmBaixaFaturas);
   frmBaixaFaturas.ShowModal;
   frmBaixaFaturas.free;
  end;
end;

procedure TfrmOperacoesDeCaixa.btNFCEcontingenciaClick(Sender: TObject);
begin
  inherited;
 if dm.verificaPermissaoAcao('I20001009') = true then
  begin
    Application.CreateForm(TfrmEnvioContingencia, frmEnvioContingencia);
    frmEnvioContingencia.ShowModal;
    frmEnvioContingencia.free;
  end;
end;

procedure TfrmOperacoesDeCaixa.btMudarOperadorClick(Sender: TObject);
begin
  inherited;

  string_auxiliar:= '';
  Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
  frm_confirma_extrato.setTitulo('Confirmação');
  frm_confirma_extrato.setMensagem('Confirma troca do operador   ?',18);
  frm_confirma_extrato.ShowModal;
  frm_confirma_extrato.free;
  if string_auxiliar = 'S' then
   begin
     frm_principal.TrocarOperador := true;
     close;
   end;

end;

procedure TfrmOperacoesDeCaixa.btSairDoSistemaClick(Sender: TObject);
begin
  inherited;
  string_auxiliar:= '';
  Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
  frm_confirma_extrato.setTitulo('Confirmação');
  frm_confirma_extrato.setMensagem('Tem certeza que deseja sair do sistema   ?',18);
  frm_confirma_extrato.ShowModal;
  frm_confirma_extrato.free;
  if string_auxiliar = 'S' then
   begin
     frmFrenteCaixa.permiteFecharForm := true;
     frm_principal.sairDoSistema := true;
     close;
   end;

end;

procedure TfrmOperacoesDeCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
 if dm.verificaPermissaoAcao('I20001013') = true then
  begin
    dm.AbreGaveta(1,1);
  end;
end;


procedure TfrmOperacoesDeCaixa.setMensagemOperador (mensagem : string);
begin
  lbMensagem.Caption := mensagem;
end;


function TfrmOperacoesDeCaixa.getMensagemOperador() : string;
begin
 result := lbMensagem.Caption;

end;

procedure TfrmOperacoesDeCaixa.BitBtn2Click(Sender: TObject);
begin
  inherited;
//  if  dm.getEstadoSimuladoECF   <> tpsLivre then
//    raise Exception.Create('Estado do Simulador ECF deve ser Livre');
  dm.setOperacaoADMTEF(true);
  dm.autenticaTEF();
  dm.setNumeroTransacaoTef(-1);
  dm.setEstadoSimuladoECF(tpsLivre);
  dm.ACBrTEFD1.ADM(gpTefDial);

end;

procedure TfrmOperacoesDeCaixa.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmConsultaInfSat, frmConsultaInfSat);
  frmConsultaInfSat.ShowModal;
  frmConsultaInfSat.Free;
end;

end.
