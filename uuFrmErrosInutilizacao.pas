unit uuFrmErrosInutilizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, AdvGlassButton,
  JvExControls, Data.DB, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons, Vcl.Grids, Vcl.Menus;

type
  TfrmErrosInutilizacao = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    btSair: TAdvGlassButton;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    ckb: TCheckBox;
    lbQtdNotasErro: TLabel;
    PopupMenu1: TPopupMenu;
    M1: TMenuItem;
    M2: TMenuItem;
    N1: TMenuItem;
    S1: TMenuItem;
    M3: TMenuItem;
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ExecutaOpcao(AOpcao: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErrosInutilizacao: TfrmErrosInutilizacao;

implementation

{$R *.dfm}

uses
  uu_data_module;

procedure TfrmErrosInutilizacao.btSairClick(Sender: TObject);
begin
  inherited;
  if ckb.Checked then
  begin
    dm.qryErrosInutilizacao.Active := false;
    close;
  end
  else
  begin
    dm.exibe_painel_erro('Confirme ciência do erro antes de sair!', 'Ok');
  end;
end;

procedure TfrmErrosInutilizacao.FormActivate(Sender: TObject);
begin
  inherited;
  lbQtdNotasErro.Caption := IntToStr(dm.qryErrosInutilizacao.RecordCount) + ' numerações com pendências de inutilização';
//  ckb.Caption := 'Confirmo que tenho ciência e '+sLineBreak+'já contactei à Real Softwares para comunicar.';

end;

procedure TfrmErrosInutilizacao.ExecutaOpcao(AOpcao: Integer);
var
  LID: integer;
begin
  inherited;
  LID := dm.qryErrosInutilizacao.FieldByName('id').value;
  dm.MarcarNumeracaoNFE(LID, AOpcao);
end;

end.

