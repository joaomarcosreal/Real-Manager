unit uuMenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, Vcl.ActnList,
  System.Actions;

type
  TfrmMenuFiscal = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    btLeituraX: TBitBtn;
    btLMFS: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    btLMFC: TBitBtn;
    btnEspelhoMFD: TBitBtn;
    btnTabProdutos: TBitBtn;
    btnEstoque: TBitBtn;
    btnMovimentoPorECF: TBitBtn;
    btnMeiosPagto: TBitBtn;
    btnIdPAFECF: TBitBtn;
    btnVendasPeriodo: TBitBtn;
    btnConfiguracoesPAF: TBitBtn;
    btn1: TBitBtn;
    btnTabIndiceTec: TBitBtn;
    btReducaoZ: TBitBtn;
    ckbNFE: TCheckBox;
    procedure btLeituraXClick(Sender: TObject);
    procedure btLMFSClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btLMFCClick(Sender: TObject);
    procedure btnEspelhoMFDClick(Sender: TObject);
    procedure btReducaoZClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuFiscal: TfrmMenuFiscal;

implementation

uses uu_frm_principal, uuMemoriaFiscal, uuEspelhoMFD, uu_data_module;

{$R *.dfm}

procedure TfrmMenuFiscal.btLeituraXClick(Sender: TObject);
begin
  inherited;
  frm_principal.leituraX;
end;

procedure TfrmMenuFiscal.btLMFSClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TfrmLeituraMF, frmLeituraMF);
  frmLeituraMF.setSimplificada(true);
  frmLeituraMF.showmodal;
  frmLeituraMF.free;




end;

procedure TfrmMenuFiscal.btnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmMenuFiscal.btLMFCClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TfrmLeituraMF, frmLeituraMF);
  frmLeituraMF.setSimplificada(false);
  frmLeituraMF.showmodal;
  frmLeituraMF.free;

end;

procedure TfrmMenuFiscal.btnEspelhoMFDClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmEspelhoMFD, frmEspelhoMFD);
  frmEspelhoMFD.showmodal;
  frmEspelhoMFD.free;

  
end;

procedure TfrmMenuFiscal.btReducaoZClick(Sender: TObject);
var
  dataImpressora : TDate;

begin
  inherited;
  frm_principal.ReducaoZ;

end;

procedure TfrmMenuFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_principal.setNFE55VendaAtual(ckbNFE.Checked);
end;

end.
