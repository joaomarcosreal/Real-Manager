unit uuRelPedidosPorEntregador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons,
  dateutils, RxCurrEdit, RxToolEdit, Vcl.ActnList, System.Actions;

type
  TfrmRelPedidosEntregador = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel6: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TDateEdit;
    Panel3: TPanel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    edDataFinal: TDateEdit;
    Panel2: TPanel;
    Label48: TLabel;
    bt_pesq_entregador: TSpeedButton;
    edCodEntregador: TEdit;
    Panel7: TPanel;
    edNomeEntregador: TEdit;
    Label4: TLabel;
    rdpAgrupar: TRadioGroup;
    function  verificaValidade() : boolean;
    procedure emitirRelatorio();


    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPedidosEntregador: TfrmRelPedidosEntregador;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


function TfrmRelPedidosEntregador.verificaValidade() : boolean;
begin
  Result:=false;

  try
   begin
     StrToDate(edDataInicial.text);
     StrToDate(edDataFinal.text);

   end;
  except
   begin
      Showmessage('Período de datas inválido');
      edDataInicial.SetFocus;
      result:=false;
      exit;
   end;
  end;

  if (  edDataInicial.Date  > edDataFinal.Date  ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    edDataInicial.SetFocus;
    result:=false;
    exit;
  end;




  result:=true;
end;


procedure TfrmRelPedidosEntregador.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;


procedure TfrmRelPedidosEntregador.emitirRelatorio();
var
combustivel : string;
diaria : string;
percentual_comissao : string;
begin

  combustivel:= '0';
  diaria := '0';
  percentual_comissao :='0';







  dm.transacao.Active:=false;
  dm.transacao.Active:=true;



  case rdpAgrupar.ItemIndex  of
    0: begin
        dm_relatorios.qryPedidosEntregadores.Active:=false;
        dm_relatorios.qryPedidosEntregadores.SQL.clear;
        dm_relatorios.qryPedidosEntregadores.sql.add(' select p.data, p.codigo, c.nome, p.hora_lancamento,   p.hora_saida, p.hora_pagamento, b.descricao, p.data,p.valor_bruto, p.valor_total, p.valor_entrega,e.cod_entregador, e.nome_entregador, e.qtd_pedidos,e.qtd_litros, e.total_gasolina,');
        dm_relatorios.qryPedidosEntregadores.sql.add('  e.dias_trabalhados,e.total_diarias,e.total_pedidos,e.total_comissao,e.total_geral');
        dm_relatorios.qryPedidosEntregadores.sql.add(' from pedidos_delivery  p');
        dm_relatorios.qryPedidosEntregadores.sql.add('  inner join gasolina_entregadores(' +Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+','+combustivel+','+percentual_comissao+','+diaria+') e ');
        dm_relatorios.qryPedidosEntregadores.sql.add('     on (e.cod_entregador = p.cod_entregador)');
        dm_relatorios.qryPedidosEntregadores.sql.add('inner join clientes_delivery c');
        dm_relatorios.qryPedidosEntregadores.sql.add('     on (c.codigo = p.cod_cliente)');
        dm_relatorios.qryPedidosEntregadores.sql.add('  inner join bairro b');
        dm_relatorios.qryPedidosEntregadores.sql.add('     on (b.codigo = c.cod_bairro)');
        dm_relatorios.qryPedidosEntregadores.sql.add('   where p.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
        if ( trim(edCodEntregador.Text) <> '') then
           dm_relatorios.qryPedidosEntregadores.sql.add('   and p.cod_entregador='+Quotedstr(edCodEntregador.Text));
        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioPedidosEntregadores.fr3',true);

       end;

    1: begin
        dm_relatorios.qryPedidosEntregadores.Active:=false;
        dm_relatorios.qryPedidosEntregadores.SQL.clear;
        dm_relatorios.qryPedidosEntregadores.sql.add(' select p.data, p.codigo, c.nome, p.hora_lancamento,   p.hora_saida, p.hora_pagamento, b.descricao, p.data,p.valor_bruto, p.valor_total, p.valor_entrega,e.cod_entregador, e.nome_entregador, e.qtd_pedidos,e.qtd_litros, e.total_gasolina,');
        dm_relatorios.qryPedidosEntregadores.sql.add('  e.dias_trabalhados,e.total_diarias,e.total_pedidos,e.total_comissao,e.total_geral');
        dm_relatorios.qryPedidosEntregadores.sql.add(' from pedidos_delivery  p');
        dm_relatorios.qryPedidosEntregadores.sql.add('  inner join gasolina_entregadores(' +Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+','+combustivel+','+percentual_comissao+','+diaria+') e ');
        dm_relatorios.qryPedidosEntregadores.sql.add('     on (e.cod_entregador = p.cod_entregador)');
        dm_relatorios.qryPedidosEntregadores.sql.add('inner join clientes_delivery c');
        dm_relatorios.qryPedidosEntregadores.sql.add('     on (c.codigo = p.cod_cliente)');
        dm_relatorios.qryPedidosEntregadores.sql.add('  inner join bairro b');
        dm_relatorios.qryPedidosEntregadores.sql.add('     on (b.codigo = c.cod_bairro)');
        dm_relatorios.qryPedidosEntregadores.sql.add('   where p.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
        if ( trim(edCodEntregador.Text) <> '') then
           dm_relatorios.qryPedidosEntregadores.sql.add('   and p.cod_entregador='+Quotedstr(edCodEntregador.Text));
        dm_relatorios.qryPedidosEntregadores.SQL.Add('order by e.cod_entregador, p.valor_entrega');
        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioPedidosEntregadoresAgrupadoPorTaxa.fr3',true);
       end;


  end;


  dm.adicionaLog(dm_relatorios.qryPedidosEntregadores.SQL.Text);
  dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text);

  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;



end;


procedure TfrmRelPedidosEntregador.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := Today;
  edDataFinal.Date := today;
  edDataInicial.SetFocus;

end;

procedure TfrmRelPedidosEntregador.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade  then
    emitirRelatorio;

end;

end.
