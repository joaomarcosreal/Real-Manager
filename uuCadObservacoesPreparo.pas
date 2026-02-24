unit uuCadObservacoesPreparo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, PngSpeedButton;

type
  TfrmCadObsPreparo = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edDescricaoObsPreparo: TDBEdit;
    SpeedButton1: TSpeedButton;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton12: TPngSpeedButton;
    procedure GravarAlteracoes();
    procedure retornaInformacoes(codigo : string);

    procedure bt_novoClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PngSpeedButton12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadObsPreparo: TfrmCadObsPreparo;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}


procedure TfrmCadObsPreparo.GravarAlteracoes();
begin
   if (evento = 1) then
   begin

     dm.qryObservacoesPreparoCOD_OBS.Value:=dm.geraCodigo('G_OBSERVACOES_PREPARO',3);
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryObservacoesPreparo.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryObservacoesPreparo]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão da observação de preparo ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryObservacoesPreparo.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryObservacoesPreparo]);
            dm.transacao.Commit;
            dm.transacao.Active:=false;
            dm.transacao.Active:=true;
         end;
    end;
end;


procedure TfrmCadObsPreparo.PngSpeedButton12Click(Sender: TObject);
begin
  inherited;
  bt_sair.Click;
end;

procedure TfrmCadObsPreparo.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryObservacoesPreparo.Active:=true;
  dm.qryObservacoesPreparo.Append;
  edDescricaoObsPreparo.SetFocus;

end;

procedure TfrmCadObsPreparo.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes;
  inherited;

end;

procedure TfrmCadObsPreparo.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryObservacoesPreparo.Cancel;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

end;

procedure TfrmCadObsPreparo.ed_codigoExit(Sender: TObject);
begin
  inherited;
   if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit
    else
     try
       ed_codigo.Text:=FormatFloat('000',StrToFloat(ed_codigo.text));
     except
       begin
         Showmessage('Código  Inválido!');
         ed_codigo.SetFocus;
         ed_codigo.Clear;
         exit;
       end;
     end;

    if evento <> 1 then
     begin
      if verificaExistenciaObservacaoPreparo(ed_codigo.Text) = false then
       begin
        showMessage('Observação ed preparo não cadastrada!');
        limpa_edits;
        dm.qryObservacoesPreparo.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryObservacoesPreparo.Edit;
              bt_gravar.Enabled:=true;
            end;
         3: begin
              bt_gravar.Enabled:=true;
            end;
        end;
       end;
     end;
   end;
end;

procedure TfrmCadObsPreparo.retornaInformacoes(codigo : string);
begin
 dm.qryObservacoesPreparo.Active:=false;
 dm.qryObservacoesPreparo.sql.clear;
 dm.qryObservacoesPreparo.sql.add('select * from observacoes_padrao where cod_obs='+Quotedstr(codigo));
 dm.qryObservacoesPreparo.Active:=true;
end;

procedure TfrmCadObsPreparo.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaObsPreparo();
  inherited;
end;

procedure TfrmCadObsPreparo.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryObservacoesPreparo.Active:=false;
  dm.qryObservacoesPreparo.SQL.clear;
  dm.qryObservacoesPreparo.sql.add('select * from observacoes_padrao');
end;

procedure TfrmCadObsPreparo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.qryObservacoesPreparo.Close;
end;

end.
