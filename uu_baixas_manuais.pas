unit uu_baixas_manuais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, ExtCtrls, Mask,  
  DBCtrls,  rxCurrEdit, RxToolEdit, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  Tfrm_baixa_manual = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label1: TLabel;
    pn_campos: TPanel;
    Label6: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    pn_informacoes2: TPanel;
    Label7: TLabel;
    ed_desc_item: TEdit;
    bt_pesq_un_saida: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    ed_desc_un_saida: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    edDescricaoTipoBaixaEstoque: TEdit;
    Label3: TLabel;
    btPesqTipoBaixa: TSpeedButton;
    Label17: TLabel;
    Label10: TLabel;
    rdTipoAcerto: TRadioGroup;
    edEstoqueCompletoItem: TEdit;
    Label2: TLabel;
    ed_cod_item: TEdit;
    ed_quantidade: TJvValidateEdit;
    ed_cod_un_saida: TEdit;
    edCodTipoBaixaEstoque: TEdit;
    memo_obs: TMemo;
    procedure nova_baixa;
    procedure gravar_baixa;
    function  valida_informacoes : boolean;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_consultarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frm_baixa_manual: Tfrm_baixa_manual;

implementation

uses uu_data_module,  uu_frm_principal, uu_modelo_vazio;

{$R *.dfm}

procedure Tfrm_baixa_manual.nova_baixa;
begin

  pn_codigo.Enabled:=false;
  pn_campos.Enabled:=true;
  ed_cod_item.SetFocus;
end;



procedure Tfrm_baixa_manual.bt_novoClick(Sender: TObject);
begin
  inherited;
  nova_baixa;
end;


function Tfrm_baixa_manual.valida_informacoes : boolean;
begin

  if (verificaExistenciaItemEstoque(ed_cod_item.text,1) = false) then
   begin
     showmessage('Ítem de estoque não cadastrado!');
     Result:= false;
     exit;
   end;

  if ( verificaExistenciaUnidade(ed_cod_un_saida.Text) = false ) then
   begin
     showmessage('Unidade inválida!!');
     Result:= false;
     exit;

   end;

  if  ( (verificaExistenciaTipoBaixaEstoque(edCodTipoBaixaEstoque.Text) = false)) then
    begin
      showmessage('Histórico de ajuste inválido!');
      result := false;
      exit;
    end;


  Result:=true;
end;


procedure Tfrm_baixa_manual.gravar_baixa;
begin
  dm.transacao.Active:=false;

  if (rdTipoAcerto.ItemIndex = 0 ) then
    begin
      if (MessageDlg('Confirma BAIXA no estoque para o ítem +'+ed_desc_item.Text+' ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
        begin
          ed_codigo.Text:= dm.geraCodigo('G_BAIXAS_ESTOQUE',6);
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.sql.add('insert into baixas_estoque (cod_baixa,cod_tipo,cod_item,cod_unidade');
          dm.qryauxiliar.sql.add(',quantidade,observacoes,data,hora,usuario,id_baixa,estoque_anterior,estoque_atualizado,custo_unitario_item)');
          dm.qryauxiliar.SQL.add(' values (');
          dm.qryauxiliar.sql.Add(''+Quotedstr(ed_codigo.Text)+',');
          dm.qryauxiliar.sql.Add(''+Quotedstr(edCodTipoBaixaEstoque.Text)+',');
          dm.qryauxiliar.sql.Add(''+Quotedstr(ed_cod_item.Text)+',');
          dm.qryauxiliar.sql.Add(''+Quotedstr(ed_cod_un_saida.Text)+',');
          dm.qryauxiliar.sql.Add(''+dm.TrocaVirgPPto(Floattostr(ed_quantidade.value))+',');
          dm.qryauxiliar.sql.Add(''+dm.formatar_memo_sql(memo_obs)+',');
          dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
          dm.qryauxiliar.SQL.Add(''+QuotedStr(FormatDateTime('HH:MM:SS',time))+',');
          dm.qryauxiliar.sql.Add(''+QuotedStr(nome_usuario) +',1,(select estoque_liquido from produtos where cod_produto='+quotedstr(ed_cod_item.Text)+'),');
          dm.qryauxiliar.sql.Add(''+'(select estoque_liquido from produtos where cod_produto='+quotedstr(ed_cod_item.Text)+') - (select parametro from unidades where cod_unidade='+QUotedstr(ed_cod_un_saida.Text)+') * '+dm.TrocaVirgPPto(FloatToStr(ed_quantidade.Value))+',');
          dm.qryauxiliar.sql.Add(''+'(select valor_custo from produtos where cod_produto='+quotedstr(ed_cod_item.Text)+'))');


          dm.qryauxiliar.ExecSQL;
          dm.transacao.Active:=true;
          dm.qryauxiliar.Active:=false;
          dm.qryauxiliar.sql.clear;
          dm.qryauxiliar.sql.add(' update produtos ite set ite.estoque_liquido = ((ite.estoque_liquido) -  (select un.parametro  from unidades un where un.cod_unidade='+Quotedstr(ed_cod_un_saida.Text)+') * '+dm.TrocaVirgPPto(Floattostr(ed_quantidade.Value))+')');
          dm.qryauxiliar.SQL.Add(' where ite.cod_produto='+Quotedstr(ed_cod_item.Text));
          dm.qryauxiliar.ExecSQL;


        end;      
    end
  else
    begin
      if (MessageDlg('Confirma AJUSTE POSITIVO do estoque para o ítem +'+ed_desc_item.Text+' ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
        begin
          dm.transacao.Active:=true;
          dm.qryauxiliar.Active:=false;
          dm.qryauxiliar.sql.clear;
          dm.qryauxiliar.sql.add(' update produtos ite set ite.estoque_liquido = ((ite.estoque_liquido) +  (select un.parametro  from unidades un where un.cod_unidade='+Quotedstr(ed_cod_un_saida.Text)+') * '+ dm.TrocaVirgPPto(Floattostr(ed_quantidade.Value))+')');
          dm.qryauxiliar.SQL.Add(' where ite.cod_produto='+Quotedstr(ed_cod_item.Text));
          dm.qryauxiliar.ExecSQL;

        end;
    end;




  if dm.transacao.Active = false then dm.transacao.Active;
  dm.transacao.Commit;
end;







procedure Tfrm_baixa_manual.bt_gravarClick(Sender: TObject);
begin

 if valida_informacoes then
 begin
    gravar_baixa;
     inherited;
 end;

end;

procedure Tfrm_baixa_manual.bt_consultarClick(Sender: TObject);
begin
  inherited;
  pn_codigo.Enabled:=true;
  pn_campos.Enabled:=false;
  ed_codigo.SetFocus;
end;

end.
