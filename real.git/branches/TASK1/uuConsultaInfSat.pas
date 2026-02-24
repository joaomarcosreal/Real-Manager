unit uuConsultaInfSat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmConsultaInfSat = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaInfSat: TfrmConsultaInfSat;

implementation

{$R *.dfm}

uses uu_data_module, uu_frm_principal;

procedure TfrmConsultaInfSat.BitBtn1Click(Sender: TObject);
Var
  NomeArquivo: String ;
begin
  nomeArquivo:=  patchAplicacao+'logs\SAT\'+FormatDateTime('YYY',Date)+'_'+FormatDateTime('MM',date)+'_'+FormatDateTime('DD',Date)+'.log';
  dm.sat.ExtrairLogs( NomeArquivo );
  memo1.Lines.Clear;
  Memo1.Lines.LoadFromFile(NomeArquivo);
  SendMessage(Memo1.Handle, EM_LINESCROLL, 0, memo1.lines.count );
end;

procedure TfrmConsultaInfSat.BitBtn3Click(Sender: TObject);
begin
  dm.sat.ConsultarStatusOperacional;
  Memo1.Lines.Clear;
 with dm.sat.Status do
  begin
    Memo1.Lines.Add('NSERIE.........: '+NSERIE);
    Memo1.Lines.Add('LAN_MAC........: '+LAN_MAC);
    Memo1.Lines.Add('STATUS_LAN.....: '+StatusLanToStr(STATUS_LAN));
    Memo1.Lines.Add('NIVEL_BATERIA..: '+NivelBateriaToStr(NIVEL_BATERIA));
    Memo1.Lines.Add('MT_TOTAL.......: '+MT_TOTAL);
    Memo1.Lines.Add('MT_USADA.......: '+MT_USADA);
    Memo1.Lines.Add('DH_ATUAL.......: '+DateTimeToStr(DH_ATUAL));
    Memo1.Lines.Add('VER_SB.........: '+VER_SB);
    Memo1.Lines.Add('VER_LAYOUT.....: '+VER_LAYOUT);
    Memo1.Lines.Add('ULTIMO_CFe.....: '+ULTIMO_CFe);
    Memo1.Lines.Add('LISTA_INICIAL..: '+LISTA_INICIAL);
    Memo1.Lines.Add('LISTA_FINAL....: '+LISTA_FINAL);
    Memo1.Lines.Add('DH_CFe.........: '+DateTimeToStr(DH_CFe));
    Memo1.Lines.Add('DH_ULTIMA......: '+DateTimeToStr(DH_CFe));
    Memo1.Lines.Add('CERT_EMISSAO...: '+DateToStr(CERT_EMISSAO));
    Memo1.Lines.Add('CERT_VENCIMENTO: '+DateToStr(CERT_VENCIMENTO));
    Memo1.Lines.Add('ESTADO_OPERACAO: '+EstadoOperacaoToStr(ESTADO_OPERACAO));
  end;

end;

procedure TfrmConsultaInfSat.BitBtn4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaInfSat.FormActivate(Sender: TObject);
begin
  inherited;
   dm.inicializarSAT();
end;

end.
