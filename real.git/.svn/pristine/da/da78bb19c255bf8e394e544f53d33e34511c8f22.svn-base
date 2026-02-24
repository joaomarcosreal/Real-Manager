unit uu_modelo_consultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, Mask,uu_modelo_vazio,
  Data.DB;

type
  Tfrm_modelo_pesquisas = class(Tfrm_modelo_vazio)
    Panel3: TPanel;
    ed_parametro: TEdit;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    bt_selecionar: TBitBtn;
    Label1: TLabel;
    bt_cancelar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_cancelarClick(Sender: TObject);
    procedure ed_parametroEnter(Sender: TObject);
    procedure ed_parametroExit(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
    procedure bt_selecionarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    tipo_pesquisa : integer;
  public
    { Public declarations }
    procedure setTipoPesquisa(tipo_pesquisa : integer);
    function  getTipoPesquisa() : integer;
  end;

var
  frm_modelo_pesquisas: Tfrm_modelo_pesquisas;


implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_modelo_pesquisas.FormActivate(Sender: TObject);
begin
  string_auxiliar:='';
  string_auxiliar2:='';
  if ed_parametro.Visible = true then

  if ed_parametro.Visible then
    ed_parametro.SetFocus
  else
    DBGrid1.SetFocus;
  dm.qry_consultas.Active:=false;




end;

procedure Tfrm_modelo_pesquisas.ed_parametroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  IF KEY=VK_F2 THEN
  BEGIN
   IF ( (RadioGroup1.Items.Count) > (RadioGroup1.ItemIndex + 1)) then
     RadioGroup1.ItemIndex:=RadioGroup1.ItemIndex+1
   else
     RadioGroup1.ItemIndex:=0;
  END;

  if Key = VK_RETURN then
  begin
   if  not ((sender is TMemo)) then
    Perform(WM_NEXTDLGCTL,0,0)
  end;

   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_parametro') then
    begin
      if key = vk_up then
       begin
         dm.qry_consultas.Prior;
       end;

      if key = vk_down then
       begin
         dm.qry_consultas.Next;
       end;
    end;
  if  (key = vk_escape)then
  begin
   if ((sender is TDBGrid) and (ed_parametro.Visible))  then
     ed_parametro.SetFocus
   else
     bt_cancelar.Click;
  end;





end;

procedure Tfrm_modelo_pesquisas.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_modelo_pesquisas.bt_cancelarClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_modelo_pesquisas.ed_parametroEnter(Sender: TObject);
begin
  If Sender is TEdit then
  begin
    (sender as TEdit).Color := cor_ao_entrar;
  end;

  If Sender is TMaskEdit then
  begin
    (sender as TMaskEdit).Color := cor_ao_entrar;
  end;

  If Sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := cor_ao_entrar;
  end;


  if  sender is TComboBox then
  begin
   (sender as TComboBox).DroppedDown:=true;
    sendmessage( (sender as TComboBox).Handle,CB_SHOWDROPDOWN,1,0);
   (sender as TComboBox).Color := cor_ao_entrar;
  end;


end;

procedure Tfrm_modelo_pesquisas.ed_parametroExit(Sender: TObject);
begin
  If Sender is TEdit then
  begin
    (sender as TEdit).Color := cor_ao_sair;


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
      (sender as TEdit).Text := FormatFloat('#0.000',StrToFloat((sender as TMaskEdit).text));
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


  If Sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := cor_ao_sair;
  end;

  if  sender is TComboBox then
  begin
   (sender as TComboBox).Color := cor_ao_sair;
  end;




end;

procedure Tfrm_modelo_pesquisas.bt_selecionarClick(Sender: TObject);
begin
TRY
  string_auxiliar:=dm.qry_consultas.FieldS[0].AsString;
  string_auxiliar:=dm.qry_consultas.FieldS[0].AsString;
  string_auxiliar:=dm.qry_consultas.FieldS[0].AsString;
  string_auxiliar2:=dm.qry_consultas.FieldS[1].AsString;
 EXCEPT
 END;
 close;
end;

procedure Tfrm_modelo_pesquisas.ed_parametroChange(Sender: TObject);
begin
  data_do_sistema:=data_do_sistema;
end;


procedure Tfrm_modelo_pesquisas.setTipoPesquisa(tipo_pesquisa : integer);
begin
  self.tipo_pesquisa := tipo_pesquisa
end;

function Tfrm_modelo_pesquisas.getTipoPesquisa() : integer;
begin
  result:= tipo_pesquisa;
end;


procedure Tfrm_modelo_pesquisas.bt_selecionarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = vk_escape then close;
end;

procedure Tfrm_modelo_pesquisas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   dm.qry_consultas.Active:=false;
end;

end.
