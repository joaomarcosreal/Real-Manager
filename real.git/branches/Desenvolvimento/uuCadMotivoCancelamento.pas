unit uuCadMotivoCancelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadMotivosCancelamento = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDescricaoMotivoEstorno: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure GravarAlteracoes();
    procedure retornaInformacoes(codigo : string);
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotivosCancelamento: TfrmCadMotivosCancelamento;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadMotivosCancelamento.GravarAlteracoes();
begin
   if (evento = 1) then
   begin
     dm.qryMotivosEstornoCODIGO.Value:=dm.geraCodigo('G_MOTIVOS_CANCELAMENTO',3);
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryMotivosEstorno.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryMotivosEstorno]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do Motivo de cancelamento informado ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryMotivosEstorno.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryMotivosEstorno]);
            dm.transacao.Commit;
            dm.transacao.Active:=false;
            dm.transacao.Active:=true;
         end;

    end;
end;



procedure TfrmCadMotivosCancelamento.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryMotivosEstorno.Active:=false;
  dm.qryMotivosEstorno.SQL.clear;
  dm.qryMotivosEstorno.sql.add('select * from motivos_estornos  order by codigo');



end;

procedure TfrmCadMotivosCancelamento.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryMotivosEstorno.Active:=true;
  dm.qryMotivosEstorno.Append;
  edDescricaoMotivoEstorno.SetFocus;
end;

procedure TfrmCadMotivosCancelamento.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryMotivosEstorno.Cancel;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

end;

procedure TfrmCadMotivosCancelamento.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes;
  inherited;
end;

procedure TfrmCadMotivosCancelamento.ed_codigoExit(Sender: TObject);
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
      if verificaExistenciaMotivoEstorno(ed_codigo.Text) = false then
       begin
        showMessage('Motivo de estorno não cadastrado!');
        limpa_edits;
        dm.qryMotivosEstorno.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryMotivosEstorno.Edit;
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

procedure TfrmCadMotivosCancelamento.retornaInformacoes(codigo : string);
begin
 dm.qryMotivosEstorno.Active:=false;
 dm.qryMotivosEstorno.sql.clear;
 dm.qryMotivosEstorno.sql.add('select * from motivos_estornos where codigo='+Quotedstr(codigo));
 dm.qryMotivosEstorno.Active:=true;
end;


procedure TfrmCadMotivosCancelamento.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaMotivoEstorno();
  inherited;
end;

procedure TfrmCadMotivosCancelamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.qryMotivosEstorno.Close;
end;

end.
