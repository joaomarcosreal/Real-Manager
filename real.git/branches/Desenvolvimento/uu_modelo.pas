unit UU_MODELO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, comctrls,CheckLst, 
  Mask, DBCtrls,uu_modelo_vazio;

type
  Tfrm_modelo_cadastro = class(Tfrm_modelo_vazio)
    pn_principal: TPanel;
    pn_botoes: TPanel;
    bt_novo: TBitBtn;
    bt_alterar: TBitBtn;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_sair: TBitBtn;
    bt_excluir: TBitBtn;
    bt_consultar: TBitBtn;
    bt_imprimir: TBitBtn;
    pn_codigo: TPanel;
    bt_pesquisa: TSpeedButton;
    ed_codigo: TMaskEdit;
    procedure controla_botoes (botao : TBitBtn);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    Procedure limpa_edits;
    procedure bt_novoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_consultarClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_codigoExit(Sender: TObject);
    procedure ed_codigoEnter(Sender: TObject);
    procedure ed_codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_pesquisaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  frm_modelo_cadastro: Tfrm_modelo_cadastro;

  CNPJAuxiliar : string;

implementation

uses uu_data_module, uu_frm_principal, uu_cs_grupos_fornecedores;

{$R *.dfm}


procedure Tfrm_modelo_cadastro.controla_botoes (botao : TBitBtn);
begin

  if ((botao = bt_novo) or (botao=bt_alterar) or (botao=bt_excluir) or (botao=bt_consultar)) then
  begin
    bt_novo.Enabled:=false;
    bt_consultar.Enabled:=false;
    bt_alterar.Enabled:=false;
    bt_excluir.Enabled:=false;
    bt_cancelar.Enabled:=true;
    if botao = bt_novo then
    bt_gravar.Enabled:=true;
    bt_sair.Enabled:=false;
    bt_imprimir.Enabled :=false;
    pn_principal.Enabled:=true;

  end;

  if botao=bt_gravar then
  begin
     bt_novo.Enabled:=true;
     if bt_alterar.Tag = 0 then
     bt_alterar.Enabled:=true;

     if bt_excluir.Tag = 0 then
       bt_excluir.Enabled:=true;

     bt_gravar.Enabled:=false;
     bt_cancelar.Enabled:=false;
     bt_sair.Enabled:=true;
  end;

  if botao= bt_cancelar then
  begin
     bt_novo.Enabled:=true;

     if bt_alterar.Tag = 0 then
       bt_alterar.Enabled:=true;

     if bt_consultar.Tag = 0 then
         bt_consultar.Enabled:=true;

    if bt_excluir.Tag = 0 then
       bt_excluir.Enabled:=true;

     bt_cancelar.Enabled:=false;
     bt_imprimir.Enabled:=true;

     bt_sair.Enabled:=true;
     bt_gravar.Enabled:=false;

     pn_principal.Enabled:=false;
     bt_imprimir.Enabled:=false;
     if bt_novo.Visible = true then
     bt_novo.SetFocus;
  end;
end;

procedure Tfrm_modelo_cadastro.bt_novoClick(Sender: TObject);
begin
  if not dm.transacao.Active then
  begin
    dm.transacao.Active:=false;
    dm.transacao.Active:=true;
  end;

  evento:=1;
  controla_botoes(bt_novo);
  limpa_edits;
end;

procedure Tfrm_modelo_cadastro.bt_alterarClick(Sender: TObject);
begin
 dm.transacao.active:=false;
 dm.transacao.Active:=true;
 evento:=2;
 controla_botoes(bt_alterar);
 pn_codigo.Enabled:=True;
 ed_codigo.Enabled := true;
 ed_codigo.SetFocus;
end;

procedure Tfrm_modelo_cadastro.bt_excluirClick(Sender: TObject);
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  evento:=3;
  controla_botoes(bt_excluir);
  pn_codigo.Enabled:=True;
  ed_codigo.SetFocus;

end;

procedure Tfrm_modelo_cadastro.bt_gravarClick(Sender: TObject);
begin 
  IF dm.transacao.Active= FALSE then dm.transacao.Active:=true;
  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  controla_botoes(bt_gravar);
  bt_cancelar.Click;
end;

procedure Tfrm_modelo_cadastro.bt_cancelarClick(Sender: TObject);
begin
     evento :=0;
     dm.transacao.Rollback;
     dm.transacao.Active:=false;
     dm.transacao.Active:=true;
     controla_botoes(bt_cancelar);
     limpa_edits;

end;

procedure Tfrm_modelo_cadastro.bt_sairClick(Sender: TObject);
begin
  Close;
end;

Procedure Tfrm_modelo_cadastro.limpa_edits;
var i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin

    if Components[i] is TEdit then
    begin
      case TEdit(Components[i]).Tag of
        0:   TEdit(Components[i]).Text := '';
        1:   TEdit(Components[i]).Text := '0';
        2:   TEdit(Components[i]).Text := '0,00';
        3:   TEdit(Components[i]).Text := '0,000';
      end;
    end;

    if Components[i] is TMaskEdit then
    begin
       TMaskEdit(Components[i]).clear;
    end;





    if Components[i] is TMemo then
      TMemo(Components[i]).Clear;

    if Components[i] is TImage then
      TImage(Components[i]).Picture:=NIL;

    if Components[i] is TPageControl then
      TPageControl(Components[i]).ActivePageIndex:=0;

    if Components[i] is TCheckListBox then
      TCheckListBox(Components[i]).Clear;

    if Components[i] is TComboBox then
      TComboBox(Components[i]).Text:='';

    if Components[i] is TCheckBox then
      TCheckBox(Components[i]).checked:=false;


  end;



end;



procedure Tfrm_modelo_cadastro.bt_novoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF key = vk_escape then close;
end;

procedure Tfrm_modelo_cadastro.FormActivate(Sender: TObject);
var
 x : integer;
begin
  x:=0;
   while x < ComponentCount-1 do
   begin
    if  Components[x].ClassName='TBitBtn' then
     if Components[x] is TBitBtn then
     begin
       if TBitBtn(Components[x]).Tag = -1 then
           TBitBtn(Components[x]).Visible:=false;
       if TBitBtn(Components[x]).Tag <> 0 then
          TBitBtn(Components[x]).Enabled  := false;
     end;

   if Components[x] is TEdit then
     begin

     end;

   if Components[x] is TMaskEdit then
     begin

     end;




   if Components[x] is TComboBox then
     begin
     end;

    x:=x+1;
   end;
end;

procedure Tfrm_modelo_cadastro.FormCreate(Sender: TObject);
begin
  cor_ao_entrar:= clMoneyGreen;
  cor_ao_sair  := clWhite;
  CNPJAuxiliar := '';
end;


procedure Tfrm_modelo_cadastro.bt_consultarClick(Sender: TObject);
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  evento:=4;
  controla_botoes(bt_consultar);
  pn_codigo.Enabled:=True;
  ed_codigo.SetFocus;


end;

procedure Tfrm_modelo_cadastro.bt_imprimirClick(Sender: TObject);
begin
  evento:=5;
  controla_botoes(bt_imprimir);
end;

procedure Tfrm_modelo_cadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if ( (key = VK_F3) and (bt_novo.Enabled=true) )  then
   bt_novo.Click;

 if ( (key = VK_F4) and (bt_consultar.enabled=true) )  then
   bt_consultar.Click;

 if ( (key = VK_F5) and (bt_alterar.enabled=true) )  then
   bt_alterar.Click;

 if ( (key = VK_F6) and (bt_excluir.enabled=true) )  then
   bt_excluir.Click;

 if ( (key = VK_F7) and (bt_gravar.enabled=true) )  then
   bt_gravar.Click;

 if ( (key = VK_F8) and (bt_imprimir.enabled=true) )  then
   bt_imprimir.Click;


 if ( (key = VK_ESCAPE) and (bt_cancelar.enabled=true) )  then
   bt_cancelar.Click

end;

procedure Tfrm_modelo_cadastro.ed_codigoExit(Sender: TObject);
begin
  pn_principal.Repaint;
  If Sender is TEdit then
  begin
   

    if (sender as TEdit).Tag = 1then // Testa se o conteúdo do edit é um número inteiro
     begin
        try
         (sender as TEdit).Text := Inttostr( strToInt( (sender as TEdit).text) );
        except
          showmessage((sender as TEdit).Hint+' não é válido(a)!');
          (sender as TEdit).SetFocus;
          exit;
        end;
    end;


    if (sender as TEdit).Tag = 2 then // Formata edit com duas casas decimais
    begin
     try
      (sender as TEdit).Text := FormatFloat('#0.00',StrToFloat((sender as TMaskEdit).text));
     except
      begin
         showmessage((sender as TEdit).Hint+' não é válido(a)!');
        (sender as TEdit).SetFocus;
        exit;
      end;
     end;
    end;

    if (sender as TEdit).Tag = 3 then // Formata edit com três casas decimais
    begin
     try
      (sender as TEdit).Text := FormatFloat('#0.000',StrToFloat((sender as TEdit).text));
     except                                                                       
      begin
         showmessage((sender as TEdit).Hint+' não é válido(a)!');
        (sender as TEdit).SetFocus;
        exit;
      end;
     end;
    end;

  end;

  If Sender is TMaskEdit then
  begin
    (sender as TMaskEdit).Color := cor_ao_sair;

    if (sender as TMaskEdit).Tag = 10 then
    begin
      if trim ((sender as TMaskEdit).Text) <> '' then
        if dm.testaCgc((sender as TMaskEdit).Text) = false then
         begin
            ShowMessage('CGC Inválido!');
            (sender as TMaskEdit).SetFocus;
            exit;
         end;
    end;

    if (sender as TMaskEdit).Tag = 6 then
      begin
        if length(trim ((sender as TMaskEdit).Text)) <> 10 then
        begin
          ShowMessage('Telefone Inválido!');
          (sender as TMaskEdit).SetFocus;
          exit;
        end;
      end;
  end;

   if Sender is TMemo then
  begin
    (sender as Tmemo).Color:= cor_ao_sair;

  end;

  if  sender is TComboBox then
  begin
   (sender as TComboBox).Color := cor_ao_sair;
  end;

end;

procedure Tfrm_modelo_cadastro.ed_codigoEnter(Sender: TObject);
begin

  If Sender is TMaskEdit then
  begin
    (sender as TMaskEdit).Color := cor_ao_entrar;
  end;

  if Sender is TMemo then
  begin
    (sender as Tmemo).Color:= cor_ao_entrar;

  end;

  if  sender is TComboBox then
  begin
   (sender as TComboBox).DroppedDown:=true;
    sendmessage( (sender as TComboBox).Handle,CB_SHOWDROPDOWN,1,0);
   (sender as TComboBox).Color := cor_ao_entrar;
  end;
  pn_principal.Repaint;
end;

procedure Tfrm_modelo_cadastro.ed_codigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var i: integer;
begin




end;

procedure Tfrm_modelo_cadastro.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
  begin
   if  not ((sender is TMemo)) then
    Perform(WM_NEXTDLGCTL,0,0)
  end;
  if key = vk_escape then
   begin
     bt_cancelar.Click;
   end;


  if key=vk_f2 then
  begin

    if ( (sender is TMaskedit and ((sender as TMaskEdit).Name='ed_codigo')  ))then
     bt_pesquisa.Click;
    inherited;
  end;
 

end;

procedure Tfrm_modelo_cadastro.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  ed_codigo.text:=string_auxiliar;
end;

end.
