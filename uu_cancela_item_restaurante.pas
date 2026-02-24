unit uu_cancela_item_restaurante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, ExtCtrls, Buttons, RxLookup,RxCurrEdit,
    AdvTouchKeyboard, RxToolEdit, Vcl.ActnList, System.Actions, JvActionsEngine,
  JvControlActions, AdvGlassButton, Vcl.Menus, Vcl.Mask;

type
  Tfrm_cancela_item_restaurante = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    cmbMotivo: TRxDBLookupCombo;
    Panel5: TPanel;
    Label1: TLabel;
    edQuantidade: TCurrencyEdit;
    Panel6: TPanel;
    Label5: TLabel;
    memoObs: TMemo;
    Panel3: TPanel;
    Label2: TLabel;
    lbDescricaoProduto: TLabel;
    Label3: TLabel;
    Panel7: TPanel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    Panel9: TPanel;
    btConfirmar: TAdvGlassButton;
    btCancelar: TAdvGlassButton;

    procedure btCancelarClick(Sender: TObject);
    function  verificaPossibilidadeCancelamento() : boolean;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvGlassButton1Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cancela_item_restaurante: Tfrm_cancela_item_restaurante;

implementation

uses uu_data_module,  uuPrototipoCaixaREstaurante;

{$R *.dfm}



procedure Tfrm_cancela_item_restaurante.AdvGlassButton1Click(Sender: TObject);
var
obs : string;
ct : integer;
begin
  inherited;


     obs := memoObs.Lines.Text;

     if (verificaPossibilidadeCancelamento() = true) then
      begin

            frm_caixa_restaurante.apagaItemMovimento(edQuantidade.Value,cmbMotivo.KeyValue,cmbMotivo.Text,obs);




         dm.qryauxiliar.Active := false;
         dm.qryauxiliar.sql.clear;
         dm.qryauxiliar.sql.add('  delete from movimento_mesa where cod_mesa in  (  ');
         dm.qryauxiliar.sql.add('  select cod_mesa from (                              ');
         dm.qryauxiliar.sql.add('       select distinct cod_mesa, count(*) as total_registros, ( select cancelados from (');
         dm.qryauxiliar.sql.add('        select count(*) as cancelados from movimento_mesa ms where ms.cancelado =1         ');
         dm.qryauxiliar.sql.add('               and ms.cod_mesa = m.cod_mesa                                                   ');
         dm.qryauxiliar.sql.add('        )                                                     )                                  ');

         dm.qryauxiliar.sql.add('        from movimento_mesa m  group by m.cod_mesa                                                     ');

         dm.qryauxiliar.sql.add('                 )  where cancelados = total_registros                                                    ');
         dm.qryauxiliar.sql.add('   )                                                                                  ');
         dm.qryauxiliar.ExecSQL;
         IF dm.transacao.Active = FALSE THEN dm.transacao.Active:=TRUE;
         dm.transacao.Commit;


         close;
      end;
end;

procedure Tfrm_cancela_item_restaurante.btCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;



function Tfrm_cancela_item_restaurante.verificaPossibilidadeCancelamento() : boolean;
begin

  if edQuantidade.Value <= 0 then
   begin
      showmessage('Quantidade inválida');
      edQuantidade.SetFocus;
      Result:=false;
      Exit;

   end;

   if( edQuantidade.value > dm.tbMovimentoMesa.FieldByName('quantidade').Value ) then
    begin
      showmessage('A Quantidade é superior à quantidade do lançamento selecionado!');
      edQuantidade.SetFocus;
      Result:=false;
      Exit;
    end;
    Result:=true;
end;


procedure Tfrm_cancela_item_restaurante.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryMotivosEstorno.Active:=true;
  cmbMotivo.KeyValue:='001';

  if edQuantidade.Enabled=false then
   memoObs.SetFocus
  else
   edQuantidade.SetFocus;

end;

procedure Tfrm_cancela_item_restaurante.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key = VK_F5 then
  begin
    btConfirmar.Click;
  end;

 if Key=VK_ESCAPE  then
  begin
    btCancelar.Click;
  end;

end;

procedure Tfrm_cancela_item_restaurante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.qryMotivosEstorno.Active:=false;
end;

end.
