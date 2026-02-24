unit uuFrmEmissaoNFEReferenciada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  RealFramework, ACBrNFeNotasFiscais, pcnConversaoNFE, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrNFe, ACBrBase,
  ACBrUtil, uu_modelo_Vazio, Vcl.Menus, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  AdvGlassButton, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmEmissaoNFReferenciada = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    lblTitulo: TLabel;
    pn_botoes: TPanel;
    Panel2: TPanel;
    btSalvar: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    Panel3: TPanel;
    Panel11: TPanel;
    Shape1: TShape;
    Label34: TLabel;
    Label23: TLabel;
    cbParticipante: TcxLookupComboBox;
    Panel4: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    memoInformacoesAdicionais: TMemo;
    Label1: TLabel;
    edChaveNFE: TEdit;
    Label3: TLabel;
    edEmail: TEdit;
    Label4: TLabel;
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EmitirNota;

    { Private declarations }
  public
    { Public declarations }
    procedure setChaveNFE(AChave: string);
  end;

var
  frmEmissaoNFReferenciada: TfrmEmissaoNFReferenciada;

implementation

uses
  uu_data_module;

{$R *.dfm}

procedure TfrmEmissaoNFReferenciada.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEmissaoNFReferenciada.btSalvarClick(Sender: TObject);
begin
  inherited;
  EmitirNota;
end;

procedure TfrmEmissaoNFReferenciada.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.qryParticipantes.Active := False;
end;

procedure TfrmEmissaoNFReferenciada.FormCreate(Sender: TObject);
begin
  inherited;
  dm.qryParticipantes.Active := False;
  dm.qryParticipantes.Active := true;
end;

procedure TfrmEmissaoNFReferenciada.EmitirNota;
var
  LNota: NotaFiscal;
  LXMLGErado: string;
begin
  try
    try
      if (Trim(edEmail.text) = '') then
        raise Exception.Create('E-mail inválido!');

      dm.ACBrNFe1.NotasFiscais.Clear;
      LNota := dm.ACBrNFe1.NotasFiscais.Add;
      dm.parametrizaAcbrNFE(moNFe, false, true);
      dm.IniciaNotaFiscal(LNota, TOpNotaReferenciada);
      dm.PreencheDadosDadosDoEmitente(LNota);
      dm.PreencheDadosDestinatarioNFE(cbParticipante.EditValue, LNota);
      dm.CopiarProdutosDaNFE(LNota, edchaveNfe.Text);
      dm.RecalcularTotaisNFReferenciada(LNota);
      LNota.nfe.InfAdic.infCpl := memoInformacoesAdicionais.Lines.Text;

      dm.ACBrNFe1.NotasFiscais.GerarNFe;
      LXMLGErado := LNota.GerarXML;
      LNota.Assinar;
      LNota.Validar;
      LXMLGErado := LNota.XML;
      dm.adicionaLog(LXMLGErado);
      if (dm.setFormaEmissaOnlineNFE() = true) then
      begin
        dm.apagaNotaCarregadaACBRdaTabelaDeErros;
        dm.ACBrNFe1.NotasFiscais[0].Imprimir;
        dm.enviaNFEPorEmail(edEmail.Text);
        memoInformacoesAdicionais.Lines.Add(LXMLGErado);
        showRealDialog(self, tmSucesso, 'Sucesso!', 'Nota fiscal emitida corretamente!', 22, false);
        Close;

      end
      else
      begin
        raise Exception.Create('Erro na emissão. Verifique os logs!');
        ;
      end;

    except
      on E: Exception do
      begin
        showRealDialog(self, tmErro, 'Erro', 'Erro ao emitir NF-e ' + sLineBreak + sLineBreak + E.Message, 22, false);
        memoInformacoesAdicionais.Lines.Add(E.Message);
        dm.adicionaLog(LXMLGErado);
        dm.adicionaLog(E.Message);
      end;

    end;

  finally
    dm.ACBrNFe1.NotasFiscais.Clear;
  end;
end;





procedure TfrmEmissaoNFReferenciada.setChaveNFE(AChave: string);
begin
  edchaveNfe.text := AChave;
end;

end.

