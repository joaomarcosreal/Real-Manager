unit uuCadBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadBairros = class(Tfrm_modelo_cadastro)
    Label1: TLabel;
    edDescricao: TDBEdit;
    edTxEtrega: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure GravarAlteracoes();
    function  verificaValidade(tipo : smallint) : boolean;
    procedure bt_gravarClick(Sender: TObject);
    procedure ExibeInformacoes(codBairro : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBairros: TfrmCadBairros;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadBairros.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  pn_codigo.Enabled:=false;
  dm.qryBairro.Active:=true;
  dm.qryBairro.Append;
  edDescricao.SetFocus;
end;



procedure TfrmCadBairros.GravarAlteracoes();
var
 codBairro : string;
begin

  if ( (evento = 1) or (evento = 2)) then
   begin

    if evento=1 then
     begin
       codBairro := dm.geraCodigo('G_BAIRRO',4);
       dm.qryBairro.FieldByName('codigo').Value := StrToInt(codBairro);
       codBairro := Inttostr(StrToinT(codBairro));
     end;




    dm.qryBairro.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryBairro]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do bairro ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryBairro.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryBairro]);
         end;

    end;

end;




function TfrmCadBairros.verificaValidade(tipo : smallint) : boolean;
begin
   if ( (evento = 1) or (evento=2) ) then
   begin
     if dm.qryBairro.fieldbyname('descricao').value = '' then
      begin
        Showmessage('Descrição inválida');
        result:=false;
        exit;
      end;

     if dm.qryBairro.fieldbyname('txentrega').value < 0  then
      begin
        Showmessage('Taxa de entrega inválida');
        result:=false;
        exit;
      end;
   end;
   result:=true;
end;




procedure TfrmCadBairros.bt_gravarClick(Sender: TObject);
begin
  if verificaValidade(evento) then
  begin
   GravarAlteracoes();
   inherited;
  end;

end;




procedure TfrmCadBairros.ed_codigoExit(Sender: TObject);
begin
  inherited;
if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit;

    if evento <> 1 then
     begin
      if verificaExistenciaBairro(ed_codigo.Text) = false then
       begin
        showMessage('O Bairro informado não existe!');
        limpa_edits;
        ed_codigo.SetFocus;
        dm.qryBairro.Active:=false;
        exit;
       end
      else
       begin
         exibeInformacoes(ed_codigo.Text);
        case evento of
         2: begin
              pn_principal.Enabled:=true;
              bt_gravar.Enabled:=true;
              edDescricao.SetFocus;
            end;
         3: begin
              bt_gravar.Enabled:=true;
            end;
        end;
       end;

     end;
   end;
end;


procedure TfrmCadBairros.exibeInformacoes(codBairro : string);
begin
 dm.qryBairro.Active:=false;
 dm.qryBairro.sql.clear;
 dm.qryBairro.sql.add('select *  from bairro where codigo='+codBairro);
 dm.qryBairro.active:=true;
end;





procedure TfrmCadBairros.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaBairro;
  inherited;

end;

end.
