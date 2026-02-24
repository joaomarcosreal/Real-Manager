unit uuCadUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadUnidades = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    edDescricaoUnidade: TDBEdit;
    Label1: TLabel;
    edParametro: TDBEdit;
    Label2: TLabel;
    edSigla: TDBEdit;
    Label3: TLabel;
    edCodUnPadrao: TDBEdit;
    Label4: TLabel;
    btPesqUnPadrao: TSpeedButton;
    Panel2: TPanel;
    edDescUnPadrao: TDBEdit;
    Label5: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure retornaInformacoes(codigo : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
   function   verificaValidade() : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidades: TfrmCadUnidades;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal;

{$R *.dfm}

procedure TfrmCadUnidades.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryUnidades.Active:=false;
  dm.qryUnidades.Active:=true;
  dm.qryUnidades.Append;
  edDescricaoUnidade.SetFocus;
end;


procedure TfrmCadUnidades.retornaInformacoes(codigo : string);
begin

 dm.qryUnidades.Active:=false;
 dm.qryUnidades.sql.clear;
 dm.qryUnidades.sql.add('select u1.*,u2.descricao as descricaoUnidadePadrao');
 dm.qryUnidades.sql.add(' from unidades u1');
 dm.qryUnidades.sql.add('  inner join unidades u2 on (u2.cod_unidade = u1.cod_padrao)');
 dm.qryUnidades.sql.add(' where u1.cod_unidade='+QUotedstr(codigo));
 dm.qryUnidades.Active:=true;

 if (evento = 2)then
  begin
   dm.qryUnidades.Edit;
  end;


 if ((evento=2) or (evento = 3)) then
  bt_gravar.Enabled:=true;
end;

procedure TfrmCadUnidades.gravarInformacoes();
begin

   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_UNIDADES',2);
     dm.qryUnidades.FieldByName('cod_unidade').Value:=ed_codigo.Text;

   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryUnidades.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryUnidades]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão da unidade ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryUnidades.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryUnidades]);

         end;

    end;

end;


procedure TfrmCadUnidades.ed_codigoExit(Sender: TObject);
begin
  inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('00',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de unidade inválida!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaUnidade(trim(ed_codigo.Text)) = true)
        then
           retornaInformacoes(ed_codigo.Text)
        else
          begin
            ShowMessage('Codigo de unidade nexistente!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;

end;

procedure TfrmCadUnidades.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaUnidadeEntrada();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaUnidade(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.Text);

end;

procedure TfrmCadUnidades.bt_gravarClick(Sender: TObject);
begin

  if (verificaValidade() = true) then
  begin
    gravarInformacoes();
    inherited;
  end;
end;

function TfrmCadUnidades.verificaValidade() : boolean;
begin
 Result:=true;
 if (verificaExistenciaUnidade(edCodUnPadrao.Text) = false) then
 begin
   showmessage('Código de unidade fracionária inválida!');
   Result:=false;
 end;



end;

end.
