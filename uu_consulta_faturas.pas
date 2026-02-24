unit uu_consulta_faturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio,   Grids, DBGrids, StdCtrls,
  ExtCtrls, Buttons, Mask, DBCtrls,db, ibx.ibquery,
  RxCurrEdit, RxToolEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions;

type
  Tfrm_consulta_faturas = class(Tfrm_modelo_vazio)
    pn_codigo: TPanel;
    bt_pesquisa: TSpeedButton;
    bt_pesq_cliente: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ed_codigo: TMaskEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_desc_cliente: TEdit;
    ed_cod_cliente: TEdit;
    rdgFiltroDatas: TRadioGroup;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    btExibirFaturas: TBitBtn;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    ckbSelecionarTodas: TCheckBox;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label9: TLabel;
    edTotalDebito: TCurrencyEdit;
    Label1: TLabel;
    edTotalSelecionado: TCurrencyEdit;
    procedure DBGridCellClick(Column: TColumn);
    procedure SaveBoolean;
    procedure selecionarTodas();
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridColEnter(Sender: TObject);
    procedure DBGridColExit(Sender: TObject);
    function  validaInformacoes() : boolean;
    procedure ExibirFaturas();
    procedure btExibirFaturasClick(Sender: TObject);
    procedure ckbSelecionarTodasClick(Sender: TObject);
    procedure atualizaTotais();
    procedure  registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);
    procedure Edit1Enter(Sender: TObject);

  private
    { Private declarations }
    FOriginalOptions : TDBGridOptions;
  public
    { Public declarations }
    filtroDasFaturas : string;
  end;

var
  frm_consulta_faturas: Tfrm_consulta_faturas;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_consulta_faturas.ExibirFaturas();
begin
  filtroDasFaturas:='';
  dm.qryConsultaFaturas.Active:=false;
  dm.qryConsultaFaturas.SQL.clear;

  dm.qryConsultaFaturas.SQL.add('select f.*,c.razao_social,c.telefone,c.fax,c.email, c.data_ultima_compra, u1.login as usuario_inclusao, u2.login as usuario_baixa from faturas f');
  dm.qryConsultaFaturas.SQL.add(' inner join clientes c on (c.cod_cli = f.cod_cli)');
  dm.qryConsultaFaturas.SQL.add(' inner join usuarios u1 on (u1.cod_usuario = f.cod_usuario_inclusao)');
  dm.qryConsultaFaturas.SQL.add('   left join usuarios u2 on (u2.cod_usuario = f.cod_usuario_baixa)');

  filtroDasFaturas:=filtroDasFaturas+' where f.cod_cli='+Quotedstr(ed_cod_cliente.Text);
  filtroDasFaturas:=filtroDasFaturas+' and f.status =0';


  if rdgFiltroDatas.ItemIndex <> 0 then
   begin
     case rdgFiltroDatas.ItemIndex of
       1: filtroDasFaturas:=filtroDasFaturas+' and f.data_fatura between '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_inicial.Text)));
       2: filtroDasFaturas:=filtroDasFaturas+' and f.data_vencimento between '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_inicial.Text)));
       3: filtroDasFaturas:=filtroDasFaturas+' and f.data_pagamento between '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_inicial.Text)));
     end;
     filtroDasFaturas:=filtroDasFaturas+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_final.Text)));
   end;

  dm.qryConsultaFaturas.SQL.Add(filtroDasFaturas);
  dm.qryConsultaFaturas.Active:=true;

  if dm.qryConsultaFaturas.IsEmpty then
   begin
     showmessage('Sem faturas existentes deste cliente para os filtros especificados!');
   end
  else
    DBGrid.SetFocus;

  atualizaTotais();
end;

procedure Tfrm_consulta_faturas.DBGridCellClick(Column: TColumn);
begin
  inherited;
   if Self.DBGrid.SelectedField.DataType = ftSmallint then
    SaveBoolean();
   DBGrid.Repaint;

end;

procedure Tfrm_consulta_faturas.SaveBoolean;

begin

 Self.DBGrid.SelectedField.Dataset.Edit;
 if Self.DBGrid.SelectedField.Value = 0 then Self.DBGrid.SelectedField.Value:=1
  else
    Self.DBGrid.SelectedField.Value:=0;

  dm.dbrestaurante.ApplyUpdates([dm.qryConsultaFaturas]);

end;

procedure Tfrm_consulta_faturas.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
  CtrlState : array[0..1] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);

var

 CheckBoxRectangle : TRect;

begin
 if Column.Field.DataType = ftSmallint then
  begin
   Self.DBGrid.Canvas.FillRect(Rect);
   CheckBoxRectangle.Left := Rect.Left + 2;
   CheckBoxRectangle.Right := Rect.Right - 2;
   CheckBoxRectangle.Top := Rect.Top + 2;
   CheckBoxRectangle.Bottom := Rect.Bottom - 2;
   DrawFrameControl(Self.DBGrid.Canvas.Handle,
   CheckBoxRectangle,
   DFC_BUTTON,
   CtrlState[Column.Field.AsInteger]);
  end

 else
  begin

    if State = [] then
     begin
         if dm.qryConsultaFaturas.RecNo mod 2 = 1 then
           DBGrid.Canvas.Brush.Color := clMoneyGreen
         else
           DBGrid.Canvas.Brush.Color := clWhite;
     end;
      DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;




end;

procedure Tfrm_consulta_faturas.DBGridColEnter(Sender: TObject);
begin
  inherited;
if Self.DBGrid.SelectedField.DataType = ftSmallint then
 begin
//  Self.FOriginalOptions := Self.DBGrid.Options;
//  Self.DBGrid.Options := Self.DBGrid.Options - [dgEditing];

 end;
end;

procedure Tfrm_consulta_faturas.DBGridColExit(Sender: TObject);
begin
  inherited;
// if Self.DBGrid.SelectedField.DataType = ftSmallint then
//  Self.DBGrid.Options := Self.FOriginalOptions;
end;



function Tfrm_consulta_faturas.validaInformacoes() : boolean;
begin

  if ( verificaExistenciaCliente(ed_cod_cliente.Text) <> true ) then
   begin
     dm.exibe_painel_erro('Cliente informado não existe!','');
     result:= false;
     ed_cod_cliente.Clear;
     ed_cod_cliente.SetFocus;
     exit;
   end;

  if rdgFiltroDatas.ItemIndex<> 0 then
   begin
    if (verificaDatas(ed_data_inicial.Text,ed_data_final.Text) = false) then
      begin
       ed_data_inicial.SetFocus;
       Result:=false;
       exit;
      end;
   end;
 result:=true;
end;

procedure Tfrm_consulta_faturas.btExibirFaturasClick(Sender: TObject);
begin
  inherited;
  if (validaInformacoes = true) then
   ExibirFaturas();
//RxCalculator1.Execute;
end;


procedure Tfrm_consulta_faturas.selecionarTodas();
var
 q : TIBQuery;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.Clear;

  if ckbSelecionarTodas.Checked then
    q.sql.add('update faturas f set selecao=1')
  else
    q.sql.add('update faturas f set selecao=0 ');

  q.sql.Add(filtroDasFaturas);
  q.ExecSQL;

  if dm.transacao.Active= false then
   dm.transacao.Active:=true;
  dm.transacao.Commit;

  btExibirFaturas.Click;

end;

procedure Tfrm_consulta_faturas.ckbSelecionarTodasClick(Sender: TObject);
begin
  inherited;
  selecionarTodas();
end;


procedure Tfrm_consulta_faturas.atualizaTotais();
begin


  edTotalDebito.Value:=0;
  edTotalSelecionado.Value:=0;

  dm.qryTotaisFaturas.Active:=false;
  dm.qryTotaisFaturas.SQL.clear;
  dm.qryTotaisFaturas.SQL.add('select sum(valor_pago) as total_pago,sum(valor_fatura) as total_faturado,sum(valor_fatura - valor_pago) as total_debito from faturas f');
  dm.qryTotaisFaturas.SQL.add(' inner join clientes c on (c.cod_cli = f.cod_cli)');
  dm.qryTotaisFaturas.SQL.add(' inner join usuarios u1 on (u1.cod_usuario = f.cod_usuario_inclusao)');
  dm.qryTotaisFaturas.SQL.add('   left join usuarios u2 on (u2.cod_usuario = f.cod_usuario_baixa)');
  dm.qryTotaisFaturas.SQL.add(' '+filtroDasFaturas);
  dm.qryTotaisFaturas.Active:=true;

  if  not dm.qryTotaisFaturas.IsEmpty then
   begin


     edTotalDebito.Value:=   dm.qryTotaisFaturas.fieldbyname('total_debito').value;
   end;
end;



procedure Tfrm_consulta_faturas.registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);
var
 tipoForma : integer;
begin
    if (verificaExistenciaFormaPagto(cod_forma) = true) then
  begin
    tipoForma:=dm.verificaTipoFormaPagamento(cod_forma);

  end;
end;






procedure Tfrm_consulta_faturas.Edit1Enter(Sender: TObject);
begin
  inherited;
  dm.qryConsultaFaturas.Active:=false;
end;

end.
