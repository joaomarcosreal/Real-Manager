unit uuCadCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadCidade = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    edDescricaoCidade: TDBEdit;
    Label1: TLabel;
    Panel13: TPanel;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);

    procedure GravarAlteracoes();
    procedure retornaInformacoes(codigo : string);    
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCidade: TfrmCadCidade;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadCidade.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryCidade.Active:=false;
  dm.qryCidade.Active:=true;
  dm.qryCidade.Append;

  ed_codigo.SetFocus;
end;

procedure TfrmCadCidade.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryCidade.Cancel;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

end;

procedure TfrmCadCidade.GravarAlteracoes();
begin
   if (evento = 1) then
   begin
     dm.qryCidade.FieldByName('COD_CIDADE').VALUE := ed_codigo.Text;
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryCidade.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryCidade]);
   end
  else
    begin

    end;
end;


procedure TfrmCadCidade.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes();
  inherited;
end;

procedure TfrmCadCidade.retornaInformacoes(codigo : string);
begin
 dm.qryCidade.Active:=false;
 dm.qryCidade.sql.clear;
 dm.qryCidade.sql.add(' select ci.cod_cidade,ci.nome,ci.codigo_estado,es.nome as NomeEstado from cidade ci');
 dm.qryCidade.sql.add('  inner join estado es on (es.codigo = ci.codigo_estado) where ci.cod_cidade='+QUotedstr(codigo));
 dm.qryCidade.Active := true;
end;


procedure TfrmCadCidade.ed_codigoExit(Sender: TObject);
begin
  inherited;
   if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit

    else
     try
       ed_codigo.Text:=FormatFloat('00000',StrToFloat(ed_codigo.text));
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
      if verificaExistenciaCidade(ed_codigo.Text) = false then
       begin
        showMessage('Cidade não cadastrada !');
        limpa_edits;
        dm.qryCidade.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryCidade.Edit;
              bt_gravar.Enabled:=true;
            end;
        end;
       end;

     end;
   end;

end;

procedure TfrmCadCidade.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaCidade;
  inherited;

end;

end.
