unit uu_cad_garcons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadGarcons = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label6: TLabel;
    ed_nome_garcon: TDBEdit;
    pn_metres: TPanel;
    Label8: TLabel;
    ed_cod_metre: TDBEdit;
    bt_pesq_metre: TSpeedButton;
    Label1: TLabel;
    Panel2: TPanel;
    ed_nome_metre: TDBEdit;
    ckb_metre: TDBCheckBox;
    Label2: TLabel;
    procedure ckb_metreClick(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    function  verificaValidade() : boolean;
    procedure GravarAlteracoes();
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure retornaInformacoes(cod_garcon : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGarcons: TfrmCadGarcons;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadGarcons.ckb_metreClick(Sender: TObject);
begin
  inherited;
  if ckb_metre.Checked  then
    pn_metres.Enabled:=false
  else
    pn_metres.Enabled:=true;
end;

procedure TfrmCadGarcons.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qry_garcons.Active:=true;
  dm.qry_garcons.Append;
  dm.qry_garconsMETRE.value:=0;
  ed_codigo.Enabled := true;
  ed_codigo.SetFocus;
end;

procedure TfrmCadGarcons.GravarAlteracoes();
begin
   if (evento = 1) then
   begin
     dm.qry_garconsCOD_GARCON.Value:=ed_codigo.Text;
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin

    if( ckb_metre.Checked ) then
      dm.qry_garconsCOD_METRE.Value:=ed_codigo.Text;

    dm.qry_garconsAPELIDO1.Value:='teste';


    dm.qry_garcons.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_garcons]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do garçom ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_garcons.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_garcons]);
         end;

    end;
end;




procedure TfrmCadGarcons.bt_gravarClick(Sender: TObject);
begin
 if verificaValidade then
 begin
  GravarAlteracoes();
  inherited;
 end;

end;

procedure TfrmCadGarcons.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaMetreGarcon();
  inherited;
  if verificaExistenciaGarconMetre(ed_codigo.Text) then
   begin
     retornaInformacoes(ed_codigo.text);
       case evento of
         2: begin
              dm.qry_garcons.Edit;
              bt_gravar.Enabled:=true;
            end;
         3: begin
              bt_gravar.Enabled:=true;
            end;
        end;
       

   end;

end;

procedure TfrmCadGarcons.retornaInformacoes(cod_garcon : string);
begin
 dm.qry_garcons.Active:=false;
 dm.qry_garcons.sql.clear;
 dm.qry_garcons.SQL.ADD(' select g.cod_garcon, g.apelido, g.metre, g.cod_metre, g2.apelido');
 dm.qry_garcons.SQL.ADD(' from garcons g');
 dm.qry_garcons.SQL.ADD(' inner join garcons g2 on (g2.cod_garcon = g.cod_metre)');
 dm.qry_garcons.sql.add(' where g.cod_garcon='+Quotedstr(cod_garcon));
 dm.qry_garcons.Active:=true;
end;


procedure TfrmCadGarcons.ed_codigoExit(Sender: TObject);
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
         Showmessage('Código de garçon informado não existe!');
         ed_codigo.SetFocus;
         ed_codigo.Clear;
         dm.qry_garcons.Active:=false;
         exit;
       end;
     end;

    if evento <> 1 then
     begin
      if verificaExistenciaGarconMetre(ed_codigo.Text) = false then
       begin
        showMessage('O Garçon / Metre informado não existe!!');
        limpa_edits;
        dm.qry_garcons.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qry_garcons.Edit;
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

function TfrmCadGarcons.verificaValidade() : boolean;
begin

 if ckb_metre.Checked=false then
  begin
    if verificaExistenciaMetre(ed_cod_metre.Text) then
     Result:=true
    else
     begin
       Showmessage('Metre resposável pelo garçon não é válido!');
       Result:=false;
       exit;
     end;
  end;

 if (evento = 1) then
  begin
    try
     begin
      ed_codigo.text:= FormatFloat('000',StrToFloat(ed_codigo.text));
     end;
    except
     begin
      showmessage('Código inválido!');
      ed_codigo.Clear;
      ed_codigo.SetFocus;
      Result:=false;
      exit;
     end;
    end;



    if ( verificaExistenciaGarconMetre(ed_codigo.text) = true ) then
     begin
       showmessage('Código já existente! ');
       ed_codigo.Clear;
       Result:=false;
       exit;
     end;
  end;
  Result:=true;

end;

procedure TfrmCadGarcons.bt_alterarClick(Sender: TObject);
begin
  inherited;
  ed_codigo.Enabled := true;
  ed_codigo.SetFocus;

end;

end.
