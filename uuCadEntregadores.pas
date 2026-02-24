unit uuCadEntregadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, JvDBCheckBox;

type
  TfrmCadEntregadores = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label6: TLabel;
    edNomeEntregador: TDBEdit;
    edValorDiaria: TDBEdit;
    edPecPedido: TDBEdit;
    edComissaoPedido: TDBEdit;
    JvDBCheckBox1: TJvDBCheckBox;
    procedure bt_novoClick(Sender: TObject);
    function  verificaValidade() : boolean;
    procedure GravarAlteracoes();
    procedure bt_gravarClick(Sender: TObject);
    procedure retornaInformacoes(codEntregador : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEntregadores: TfrmCadEntregadores;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadEntregadores.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryEntregadores.Active:=true;
  dm.qryEntregadores.Append;
  ed_codigo.SetFocus;

end;


function TfrmCadEntregadores.verificaValidade() : boolean;
begin

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


    if ( verificaExistenciaEntregador(ed_codigo.text) = true ) then
     begin
       showmessage('Código já existente! ');
       ed_codigo.Clear;
       Result:=false;
       exit;
     end;
  end;
  Result:=true;

end;



procedure TfrmCadEntregadores.GravarAlteracoes();
begin
   if (evento = 1) then
   begin
     dm.qryEntregadoresCODIGO.Value:=ed_codigo.Text;

   end;

  if ( (evento = 1) or (evento = 2)) then
   begin

     if dm.qryEntregadoresVALOR_DIARIA.IsNull then dm.qryEntregadoresVALOR_DIARIA.value:=0;
     if dm.qryEntregadoresPERC_COMISSAO_PEDIDO.IsNull then dm.qryEntregadoresPERC_COMISSAO_PEDIDO.Value:=0;
     if dm.qryEntregadoresCOMISSAO_POR_PEDIDO.IsNull then dm.qryEntregadoresCOMISSAO_POR_PEDIDO.Value :=0;


    dm.qryEntregadores.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryEntregadores]);
   end
  else
   begin
    if ( evento = 3) then
      if MessageDlg('Confirma exclusão do garçom ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
        begin
          dm.qryEntregadores.Delete;
          dm.dbrestaurante.ApplyUpdates([dm.qryEntregadores]);
        end;
   end;

end;



procedure TfrmCadEntregadores.bt_gravarClick(Sender: TObject);
begin

   if verificaValidade then
    begin
      GravarAlteracoes();
      inherited;
    end;
end;



procedure TfrmCadEntregadores.retornaInformacoes(codEntregador : string);
begin
 dm.qryEntregadores.Active:=false;
 dm.qryEntregadores.sql.clear;
 dm.qryEntregadores.sql.add('select * from entregadores  where codigo='+Quotedstr(codEntregador));
 dm.qryEntregadores.Active:=true;
end;



procedure TfrmCadEntregadores.ed_codigoExit(Sender: TObject);
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
         Showmessage('Código inválido!');
         ed_codigo.SetFocus;
         ed_codigo.Clear;
         dm.qryEntregadores.Active:=false;
         exit;
       end;
     end;

    if evento <> 1 then
     begin
      if verificaExistenciaEntregador(ed_codigo.Text) = false then
       begin
        showMessage('O entregador informado não existe!!');
        limpa_edits;
        dm.qryEntregadores.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryEntregadores.Edit;
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

procedure TfrmCadEntregadores.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaEntregador();
  inherited;
  if verificaExistenciaEntregador(ed_codigo.text) then
   begin
     retornaInformacoes(ed_codigo.Text);                           
   end;
end;

end.
