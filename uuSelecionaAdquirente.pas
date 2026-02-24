unit uuSelecionaAdquirente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Recebimento, uu_modelo_Vazio,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxStyles,
  uu_data_module,
  Data.DB, cxGridLevel, cxClasses,
  cxGridCustomTableView, cxGridDBTableView,
  cxGrid, AdvGlassButton, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridTableView, cxGridCustomView, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.Buttons, AdvSmoothTouchKeyBoard,
  cxCustomData, cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations,
  Vcl.Menus;

type
  TfrmSelecionaAdquirente = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    lblTitulo: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edNSUOperacao: TEdit;
    Label1: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    cxstyl1: TcxStyle;
    btConfirmar: TAdvGlassButton;
    AdvSmoothTouchKeyBoard2: TAdvSmoothTouchKeyBoard;
    procedure btConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNSUOperacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    LRecebimento: TRecebimento;
    function validarRedeSelecionada: Boolean;
    procedure FiltrarAdquirentes(ACodForma: string);
    procedure FormCreate(Sender: TObject);
    procedure selecionaRedeAtual;
  published
    procedure setRecebimento(ARecebimento: TRecebimento);
    { Public declarations }

  end;

var
  frmSelecionaAdquirente: TfrmSelecionaAdquirente;

implementation






{$R *.dfm}

procedure TfrmSelecionaAdquirente.btConfirmarClick(Sender: TObject);
begin
  inherited;
  if validarRedeSelecionada then
  begin
    Close;
  end;
end;

function TfrmSelecionaAdquirente.validarRedeSelecionada(): Boolean;
begin
  result := false;

  try

    if (Trim(edNSUOperacao.Text) = '') then
    begin

      dm.exibe_painel_erro('NSU da operação não informado!' + sLineBreak + sLineBreak + 'Digite o NSU da transação para continuar.', 'Ok');
      edNSUOperacao.SetFocus;
      result := false;
      exit;
    end;

    LRecebimento.NSU := Trim(edNSUOperacao.Text);
    Result := true;
  finally

  end;

end;

procedure TfrmSelecionaAdquirente.setRecebimento(ARecebimento: TRecebimento);
begin
  Self.LRecebimento := ARecebimento;
end;

procedure TfrmSelecionaAdquirente.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  selecionaRedeAtual;
end;

procedure TfrmSelecionaAdquirente.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    selecionaRedeAtual;
    edNSUOperacao.SetFocus;
  end;
end;

procedure TfrmSelecionaAdquirente.selecionaRedeAtual();
begin
  LRecebimento.IdConfiguracaoPagamento := dm.tbAdquirentesTemp.FieldByName('id').Value;
  LRecebimento.NomeRedeAdquirente      := dm.tbAdquirentesTemp.FieldByName('adquirente').Value;
end;

procedure TfrmSelecionaAdquirente.edNSUOperacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    btConfirmar.Click;
  end;
end;

procedure TfrmSelecionaAdquirente.FiltrarAdquirentes(ACodForma: string);
var
  LSQL: TStringList;
begin
  LSQL := TstringList.create;

  try
    try
      LSQL.Add('    select fc.id, ad.nome as adquirente');
      LSQL.Add('                 from formas_pagamento_configuracoes fc');
      LSQL.Add('                    inner join adquirentes ad on (ad.id = fc.id_adquirente)');
      LSQL.Add('                     where fc.cod_forma=' + Quotedstr(ACodForma));
      LSQL.Add('                     order by fc.cod_forma, fc.id_adquirente');
      dm.getMemTable(dm.tbAdquirentesTemp, LSQL.Text);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar configurações de adquirentes para a forma de pagamento selecionada ', 'Ok');
        raise Exception.Create('Erro ao realizar operação');
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmSelecionaAdquirente.FormActivate(Sender: TObject);
begin
  inherited;
  FiltrarAdquirentes(LRecebimento.FormaPagamento.CodForma);
end;

procedure TfrmSelecionaAdquirente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if validarRedeSelecionada then
  begin
    Action := caFree;
  end
  else
    Action := caNone;

end;

procedure TfrmSelecionaAdquirente.FormCreate(Sender: TObject);
begin
  inherited;
//  LOperacaoAtual.IdConfiguracao := -1;
end;

end.

