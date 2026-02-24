unit uuCadGuarnicoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmCadGuarnicoes = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label6: TLabel;
    edDescGuarnicao: TDBEdit;
    procedure GravarAlteracoes();
    procedure retornaInformacoes(codGuarnicao : string);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGuarnicoes: TfrmCadGuarnicoes;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}



procedure TfrmCadGuarnicoes.GravarAlteracoes();
begin
  if (evento = 1) then
   begin
     dm.qryGuarnicoesCODIGO.Value:=dm.geraCodigo('G_GUARNICOES',2);
   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryGuarnicoes.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryGuarnicoes]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão da guarnição?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryGuarnicoes.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryGuarnicoes]);
         end;

    end;
end;


procedure TfrmCadGuarnicoes.bt_gravarClick(Sender: TObject);
begin
  if (trim(dm.qryGuarnicoesDESCRICAO.Value) <> '') then
   begin
     GravarAlteracoes;
     inherited;
   end
  else
   begin
     ShowMessage('Descrição inválida!');
     edDescGuarnicao.SetFocus;
   end;
end;




procedure TfrmCadGuarnicoes.retornaInformacoes(codGuarnicao : string);
begin
 dm.qryGuarnicoes.Active:=false;
 dm.qryGuarnicoes.sql.clear;
 dm.qryGuarnicoes.SQL.ADD(' select * from guarnicoes');
 dm.qryGuarnicoes.sql.add(' where codigo='+Quotedstr(codGuarnicao));
 dm.qryGuarnicoes.Active:=true;
end;


procedure TfrmCadGuarnicoes.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryGuarnicoes.Active:=true;
  dm.qryGuarnicoes.Append;
  edDescGuarnicao.SetFocus;

end;

procedure TfrmCadGuarnicoes.ed_codigoExit(Sender: TObject);
begin
  inherited;
 if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit
    else
     try
       ed_codigo.Text:=FormatFloat('00',StrToFloat(ed_codigo.text));
     except
       begin
         Showmessage('Código de guarnição inválido!');
         ed_codigo.SetFocus;
         ed_codigo.Clear;
         dm.qryGuarnicoes.Active:=false;
         exit;
       end;
     end;

    if evento <> 1 then
     begin
      if verificaExistenciaGuarnicao(ed_codigo.Text) = false then
       begin
        showMessage('A guarnição informada não existe !');
        limpa_edits;
        dm.qryGuarnicoes.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryGuarnicoes.Edit;
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

procedure TfrmCadGuarnicoes.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaGuarnicao();
end;

end.
