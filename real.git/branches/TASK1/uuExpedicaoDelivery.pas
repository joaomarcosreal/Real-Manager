unit uuExpedicaoDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ibQuery,
  Menus, Mask, Data.DB, RxToolEdit, Vcl.ActnList, System.Actions, IBX.IBScript,
  uuPedidoDelivery;

type
  TfrmExpedicaoDelivery = class(Tfrm_modelo_vazio)

    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Timer1: TTimer;
    RadioGroup1: TRadioGroup;
    rdFiltro: TRadioGroup;
    rdpOrdem: TRadioGroup;
    PopupMenu1: TPopupMenu;
    AUTORIZAR1: TMenuItem;
    SAIDADOPEDIDO1: TMenuItem;
    RECEBEPEDIDO1: TMenuItem;
    Panel3: TPanel;
    Label2: TLabel;
    rdTipoEntrega: TRadioGroup;
    edDataEntrega: TDateEdit;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    edHoraInicial: TMaskEdit;
    edHoraFinal: TMaskEdit;
    Label1: TLabel;
    Alteraropedido1: TMenuItem;
    EXCLUIROPEDIDO1: TMenuItem;
    N1: TMenuItem;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure btSairClick(Sender: TObject);
   procedure filtraPedidos();
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure rdFiltroClick(Sender: TObject);
    procedure rdpOrdemClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imprimePedidoLocalProducao(codPedido : string; evento: smallint);
    procedure AUTORIZAR1Click(Sender: TObject);
    procedure SAIDADOPEDIDO1Click(Sender: TObject);
    procedure RECEBEPEDIDO1Click(Sender: TObject);
    procedure muda_acao(tipo : integer);
    procedure Label2DblClick(Sender: TObject);
    procedure rdTipoEntregaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

    procedure limpaMesadelivery();
    procedure Alteraropedido1Click(Sender: TObject);
    procedure EXCLUIROPEDIDO1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  procedure retornaDadosDoPedido(codPedido : string);
  public
    { Public declarations }



  end;

var
  frmExpedicaoDelivery: TfrmExpedicaoDelivery;

implementation

uses uu_data_module, uu_frm_principal, uu_encerramento,
  uuSaidaPedidosDelivery, uu_cad_clientes_delivery, uuCadBairros;

{$R *.dfm}

procedure TfrmExpedicaoDelivery.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmExpedicaoDelivery.filtraPedidos();
begin
  inherited;
  dm.transacao.active:=false;
  dm.transacao.Active:=true;
  dm.qryExpedicaoDelivery.Active:=false;
  dm.qryExpedicaoDelivery.sql.clear;
  dm.qryExpedicaoDelivery.sql.add(' select * from pedidos_expedicao_delivery');

  case rdFiltro.ItemIndex of
   0: begin
        dm.qryExpedicaoDelivery.SQL.add(' where data_hora_entrega between ');
        dm.qryExpedicaoDelivery.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema )+' '+FormatDateTime('HH:MM',StrToTime(edHoraInicial .TEXT)))+' and ');
        dm.qryExpedicaoDelivery.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema)+' '+FormatDateTime('HH:MM',StrToTime(edHoraFinal.TEXT)))+'  ');
      end;

   1: begin
        dm.qryExpedicaoDelivery.SQL.add(' where data_hora_entrega between   ');
        dm.qryExpedicaoDelivery.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataEntrega.Date  )+' '+FormatDateTime('HH:MM',StrToTime(edHoraInicial .TEXT)))+' and ');
        dm.qryExpedicaoDelivery.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataEntrega.Date  )+' '+FormatDateTime('HH:MM',StrToTime(edHoraFinal.TEXT)))+'  ');
      end;


   2:  begin
        dm.qryExpedicaoDelivery.SQL .add(' where codigo <> 0');
       end;
  end;


  case rdTipoEntrega.ItemIndex of
   1: begin
         dm.qryExpedicaoDelivery.SQL.add(' and retira_balcao = 1');
      end;

   2: begin
         dm.qryExpedicaoDelivery.SQL.add(' and retira_balcao = 0');
      end;
  end;

  case rdpOrdem.ItemIndex of
   0: begin
        dm.qryExpedicaoDelivery.SQL.adD(' order by codigo');
      end;

   1: begin
        dm.qryExpedicaoDelivery.SQL.adD(' order by nome_cliente');
      end;

   2: begin
        dm.qryExpedicaoDelivery.SQL.adD(' order by entregador');
      end;

   3: begin
        dm.qryExpedicaoDelivery.SQL.adD(' order by minutos_saida asc');
      end;

   4: begin
        dm.qryExpedicaoDelivery.SQL.adD(' order by minutos_saida desc');
      end;
   end;


  dm.adicionaLog(dm.qryExpedicaoDelivery.SQL.Text);
  dm.qryExpedicaoDelivery.Active:=true;
end;



procedure TfrmExpedicaoDelivery.retornaDadosDoPedido(codPedido : string);
var
 codigoPedido : string;
 Q : TIBQuery;
 valor : string;
begin
  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;
  q.sql.clear;
  q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
  Q.ExecSQL;

  Q.Active  :=false;
  q.sql.clear;
  q.sql.add('delete from recebimento_parcial where mesa='+Quotedstr(mesaDelivery));
  Q.ExecSQL;



  q.sql.Clear;
  q.sql.add(' insert into movimento_mesa  (cod_mesa,id,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
  q.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
  q.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs)');
  q.sql.add('            select '+Quotedstr(mesaDelivery)+',mv.id,mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa,');
  q.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
  q.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs');
  q.sql.add('                                       from itens_pedido_delivery mv where mv.cod_pedido='+Quotedstr(codPedido));
  try
   begin
    q.ExecSQL;
   end;
  except
      begin
        dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao  gravar itens do pedido do delivery ', codigo_usuario);
        exit;
      end;
  end;
 
  q.Active:=false;
  q.SQL.clear;
  q.SQL.Add(' delete from sabores_pizza_movimento_mesa  where cod_mesa='+Quotedstr(mesaDelivery));
  q.ExecSQL;


  q.Active:=false;
  q.SQL.clear;
  q.SQL.Add('        insert into sabores_pizza_movimento_mesa  (cod_mesa, cod_produto, cod_sabor, valor_unitario_sabor,  ');
  q.SQL.Add('           quantidade,id_mov_mesa,proporcao,descricao) ');
  q.SQL.Add('            select sb.cod_mesa  , sb.cod_produto, sb.cod_sabor, sb.valor_unitario_sabor, sb.quantidade,sb.id_mov_mesa, ');
  q.SQL.Add('                           sb.proporcao,sb.descricao ');
  q.SQL.Add('              from sabores_pizza_pedido_delivery   sb ');
  q.SQL.Add('                     where  sb.cod_pedido ='+Quotedstr(codPedido));
  q.ExecSQL;


  q.Active:=false;
  q.SQL.clear;
  q.sql.Add('  insert into recebimento_parcial (mesa,cod_forma,valor,cod_usuario, cod_cli_faturamento, obs_faturamento)');
  q.sql.Add('      select '+QuotedStr(mesaDelivery)+',  rd.cod_forma, rd.valor, rd.cod_usuario, rd.cod_cli_faturamento, rd.obs_faturamento   from  recebimentos_delivery rd ');
  q.sql.add('      where rd.cod_pedido='+Quotedstr(codPedido));
  q.ExecSQL;

  


  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

end;


procedure TfrmExpedicaoDelivery.FormActivate(Sender: TObject);
begin
  inherited;
  edDataEntrega.Date := data_do_sistema;
  edHoraInicial.Text := '00:00';
  edHoraFinal.Text := '23:59';
  filtraPedidos;
  Timer1.Enabled:=true;
  frmExpedicaoDelivery.Top :=0;
  muda_acao(1);

  frmExpedicaoDelivery.Width := 1027;
  frmExpedicaoDelivery.Height :=755;



end;

procedure TfrmExpedicaoDelivery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_escape then close;
  if key = vk_f5 then
   begin
     filtraPedidos;
   end;

end;

procedure TfrmExpedicaoDelivery.Timer1Timer(Sender: TObject);
begin
  inherited;
{
  filtraPedidos;
  Timer1.Enabled:=false;
  Timer1.Enabled:=true;
  }

end;

procedure TfrmExpedicaoDelivery.rdFiltroClick(Sender: TObject);
begin
  inherited;
  edHoraInicial.Text := '00:00';
  edHoraFinal.Text := '23:59';

  filtraPedidos;
end;

procedure TfrmExpedicaoDelivery.rdpOrdemClick(Sender: TObject);
begin
  inherited;
  filtraPedidos;
end;

procedure TfrmExpedicaoDelivery.BitBtn3Click(Sender: TObject);
begin
  inherited;
  filtraPedidos();
end;

procedure TfrmExpedicaoDelivery.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;



  if odd(dm.qryExpedicaoDelivery.RecNo) then
  DBGrid1.Canvas.Brush.Color:= clwhite
  else
  DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin

    Brush.Color:=clred; //aqui é definida a cor do fundo
    Font.Color := clWhite;
//    Font.Size :=   Font.Size + 2;
    Lineto(10,30);
    Font.Style:= [fsbold];
    FillRect(Rect);
 end;
 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

 if dm.qryExpedicaoDelivery.IsEmpty = false then
  begin
   try
    begin
      if Column.FieldName = 'TEMPO_SAIDA' then
        begin
          if (Column.Field.Value = 'AG. LIBERACAO') then
            begin
              DBGrid1 .Canvas.Brush.Color := clRED;
              DBGrid1 .DefaultDrawColumnCell(Rect, DataCol, Column, State);
             end;

          if (Column.Field.Value = 'NÃO SAIU') then
            begin
             DBGrid1 .Canvas.Brush.Color := clSkyBlue;
             DBGrid1 .DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
          if ( copy(Column.Field.Value,0,4)='Saiu') then
           begin
            DBGrid1 .Canvas.Brush.Color := clMoneyGreen;
            DBGrid1 .DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;

        end;
    end;
   except
   end;
  end;

end;

procedure TfrmExpedicaoDelivery.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
 q : TIBQuery;
 hint : string;
 formatacao : string;
 tamStr : integer;

begin
  inherited;

 if dm.qryExpedicaoDelivery.IsEmpty = false then
  begin
     q := TIBQuery.create(self);
     Q.Database := dm.dbrestaurante;
     q.Transaction := dm.transacao;
     q.Active:=false;
     q.SQL.clear;
     q.sql.Add('select r.*,f.descricao from recebimentos_delivery r ');
     q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)');
     q.SQL.add('where r.cod_pedido='+Quotedstr(dm.qryExpedicaoDelivery.fieldbyname('codigo').value));
     q.sql.add(' order by r.cod_forma');
     q.Active:=true;
     q.first;

     hint:='Pedido '+dm.qryExpedicaoDelivery.fieldbyname('codigo').value+
            #13+#13+
            'Formas de Pagamento : ';
            q.first;
     while not q.Eof do
       begin
         hint:=hint+#13;
         {
         formatacao:='#####******************%%%%%%%%%%%%%%';
         formatacao:=   dm.organizarCupom(formatacao,+q.Fieldbyname('cod_forma').value,'#');
         formatacao :=  dm.organizarCupom(formatacao,q.Fieldbyname('descricao').value,'*');
         formatacao:= dm.organizarCupom(formatacao ,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,FormatFloat('R$ ###,###,##0.00 ', q.Fieldbyname('valor').value   )),'%');
          }
        formatacao:=formatoRodapeExtrato;
        formatacao:=dm.organizarCupom(formatacao,q.Fieldbyname('descricao').value ,'#');
        formatacao:=dm.organizarCupom(formatacao,'','*');
        formatacao:=dm.organizarCupom(formatacao,'','%');
        tamStr :=alinhamentoDireitaTotal- length(trim(formatacao));
        formatacao:= trim(formatacao)+dm.alinha_valor_a_direita(tamStr,FormatFloat('R$ ###,###,##0.00 ', (q.Fieldbyname('valor').value) ));



         hint :=hint + formatacao;
         if ( trim(q.fieldbyname('numerocartao').value) <> '') then
           begin
             hint:= hint+#13+'   Operadora: '+q.fieldbyname('operadoracartao').value;
             hint:= hint+#13+'   Nº cartão: '+q.fieldbyname('numerocartao').value;
             hint:= hint+#13+'   Validade : '+q.fieldbyname('validadecartao').value;
             hint:= hint+#13+'   Cod. Seg.: '+q.fieldbyname('codigocartao').value;
           end;
         q.next;
       end;

     hint := hint + #13#13#13 +'Endereço: '+ trim(dm.qryExpedicaoDelivery.fieldbyname('endereco').value);
     hint := hint + #13 +'Bairro:   '+ trim(dm.qryExpedicaoDelivery.fieldbyname('bairro').value);

     DBGrid1.Hint:= hint;
     q.Active:=false;
     FreeAndNil(q);

  end;

end;





procedure TfrmExpedicaoDelivery.EXCLUIROPEDIDO1Click(Sender: TObject);
begin
  inherited;

 if (dm.verificaPermissaoAcao('B20003002') = true) then
  begin
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setCodPedidoSelecionado(dm.qryExpedicaoDelivery.fieldbyname('codigo').value);
    frmPedidosDelivery.setEvento(3);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    SpeedButton1.Click;
  end

end;

procedure TfrmExpedicaoDelivery.imprimePedidoLocalProducao(codPedido : string; evento: smallint);

var
 q : Tibquery;
begin
  inherited;

  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  q.sql.Clear;
  q.sql.add(' insert into movimento_mesa  (cod_mesa,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
  q.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
  q.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores)');
  q.sql.add('            select '+Quotedstr(mesaDelivery)+',mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa, ');
  q.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
  q.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores');
  q.sql.add('                                       from itens_pedido_delivery mv where mv.cod_pedido='+Quotedstr(codPedido));
  try
   begin
    q.ExecSQL;
   end;
  except
      begin
        dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao  gravar itens do pedido do delivery ', codigo_usuario);
        exit;
      end;
  end;



  dm.qry_movimento_mesa.Active := false;
  dm.qry_movimento_mesa.sql.clear;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
  dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
  dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
  if (arredondamento = 1 ) then
    dm.qry_movimento_mesa.sql.add('udf_truncdec((mv.valor_unitario * mv.quantidade),3) as total')
  else
    dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),3) as total ');

  dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id, impresso,observacoes,sabores,tipo_massa');
  dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
  dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
  dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qry_movimento_mesa.SQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery) + ' order by mv.cod_movimento');
  dm.qry_movimento_mesa.Active := true;

  dm.qry_movimento_mesa.First;
  while not dm.qry_movimento_mesa.Eof do
   begin
    if dm.verificaProdutoImprimeLocalProducao(dm.qry_movimento_mesa.fieldbyname('cod_produto').value) then
    begin
         dm.enviaProdutoParaFilaImpressao(garcomDelivery,
         dm.qry_movimento_mesa.fieldbyname('cod_barras').value,
         mesaDelivery,
         dm.qry_movimento_mesa.fieldbyname('quantidade').value,
         dm.qry_movimento_mesa.fieldbyname('observacoes').value,
         dm.qry_movimento_mesa.fieldbyname('sabores').value,
         '1',-1,
         IntToStr(dm.qry_movimento_mesa.fieldbyname('id').value),
         dm.qry_movimento_mesa.fieldbyname('tipo_massa').value
         );
    end;


    dm.qry_movimento_mesa.Next;
   end;

   dm.ImprimeFilaDeImpressao(true,codPedido,evento);

   q.Active:=false;
   FreeAndNil(q);

end;





procedure TfrmExpedicaoDelivery.Alteraropedido1Click(Sender: TObject);
begin
  inherited;
 if (dm.verificaPermissaoAcao('B20003001') = true) then
  begin
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setCodPedidoSelecionado(dm.qryExpedicaoDelivery.fieldbyname('codigo').value);
    frmPedidosDelivery.setEvento(2);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    SpeedButton1.Click;
  end;

end;

procedure TfrmExpedicaoDelivery.AUTORIZAR1Click(Sender: TObject);
var
 q : Tibquery;
 codPedido : string;
 alterado : boolean;
begin
  inherited;

  codPedido:= dm.qryExpedicaoDelivery.fieldbyname('codigo').value;

  if ( verificaStatusPedidoDelivery(dm.qryExpedicaoDelivery.fieldbyname('codigo').value) = 0 ) then
   begin
    if (MessageDlg('Confirma a autorização de preparo para o pedido selecionado  ?',mtConfirmation,[mbYes,mbOK],0) = mrYes) then
      begin
        limpaMesadelivery();
        q := TIBQuery.create(self);
        Q.Database := dm.dbrestaurante;
        q.Transaction := dm.transacao;

        q.Active:=false;
        q.SQL.clear;
        q.SQL.add('select * from pedidos_delivery  where codigo='+Quotedstr(codPedido));
        q.Active:=true;

        if q.FieldByName('alterado').Value =0 then
          imprimePedidoLocalProducao(codPedido,1)
        else
          imprimePedidoLocalProducao(codPedido,2);

        dm.transacao.Active:=true;



        q.Active:=false;
        q.Active:=true;



        dm.imprimePreConta(mesaDelivery, marca_impressora_fiscal,1,1,
        q.FieldByName('valor_bruto').value,
        0,0,0, 0,
        q.FieldByName('valor_total').value,
        0,
        q.FieldByName('valor_troco').value,
        q.FieldByName('codigo').value,
        q.FieldByName('valor_entrega').value,
        q.FieldByName('codigo').value,'','',1);

        q.Active:=false;


        q.SQL.clear;
        q.SQL.add('update pedidos_delivery set status=1 where codigo='+quotedstr(codPedido));
        q.ExecSQL;

        dm.transacao.Commit;
        FreeAndNil(q);

        limpaMesadelivery();
        dm.qryExpedicaoDelivery.Active:=false;
        dm.qryExpedicaoDelivery.Active:=true;
      end;

     end
    else
      begin
        showmessage('Pedido não se encontra aguardando autorização de preparo!');
      end;


end;


procedure TfrmExpedicaoDelivery.limpaMesadelivery();
var
 q : TIBquery;
begin

 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.sql.clear;
 q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;

 Q.active:=false;
 q.sql.clear;
 q.sql.add('delete from recebimento_parcial where mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;



 dm.transacao.Commit;
 dm.transacao.Active:=false;
 dm.transacao.Active:=true;

 Q.Active:=false;
 FreeAndNil(q);

end;


procedure TfrmExpedicaoDelivery.SAIDADOPEDIDO1Click(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:=false;
{  if ( verificaStatusPedidoDelivery(dm.qryExpedicaoDelivery.fieldbyname('codigo').value) = 1 ) then
   begin
 }    Application.CreateForm(TfrmSaidaPedidosDelivery,frmSaidaPedidosDelivery);
     frmSaidaPedidosDelivery.setCodPedidoSaida(dm.qryExpedicaoDelivery.fieldbyname('codigo').value);
     frmSaidaPedidosDelivery.ShowModal;
     frmSaidaPedidosDelivery.Free;
     {
   end
  else
   begin
     showmessage('Saída do pedido já foi efetuada!');
   end;
      }

  Timer1.Enabled:=true;
  filtraPedidos;

end;



procedure TfrmExpedicaoDelivery.RECEBEPEDIDO1Click(Sender: TObject);
var
 codigo : string;
 descontoPedido : double;
begin
  inherited;

  descontoPedido :=dm.qryExpedicaoDelivery.fieldbyname('valor_desconto').value;

  IF (StrToInt(dm.LeIni(2,'CAIXA','permiteEncerrarContas')) = 0) THEN
    begin
      showmessage('Não é possível encerrar contas nesta estação!');
    end
  else
   begin
//    tipo_cupom:=1;
    codigo:=dm.qryExpedicaoDelivery.fieldbyname('codigo').value;


  if ( verificaStatusPedidoDelivery(dm.qryExpedicaoDelivery.fieldbyname('codigo').value) = 2 ) then
     begin
       limpaMesadelivery();
       retornaDadosDoPedido(codigo);
       Application.CreateForm(Tfrm_encerramento, frm_encerramento);
       Timer1.Enabled:=false;

       frm_encerramento.btDesconto.Enabled := false;
       frm_encerramento.lb_mesa.caption := mesaDelivery;
       frm_encerramento.setCodPedidoDelivery(codigo);
       frm_encerramento.ckb_desconto.Checked := false;
       frm_encerramento.ed_valor_desconto.Text := FloatToStr(descontoPedido );
       frm_encerramento.showmodal;
       frm_encerramento.free;

//       dm.CancelaNotasPendentes();
//       dm.CancelaNotasPendentesPorSubstituicao();

     end
    else
     begin
      showmessage('Ainda não foi feita a saída deste pedido. o recebimento só é possível após a saída do pedido por um entregador.');
     end;




    Timer1.Enabled:=true;
    filtraPedidos;






  end;

  muda_acao(1); 
end;

procedure TfrmExpedicaoDelivery.muda_acao(tipo : integer);
begin
  case tipo of
    1: begin
         tipo_cupom:=1;
         Label2.Font.Color := clLime;

       end;
    2: begin

         tipo_cupom :=2;
                 Label2.Font.Color := clRed;
       end;
  end;

end;


procedure TfrmExpedicaoDelivery.Label2DblClick(Sender: TObject);
begin
  inherited;


   if tipo_cupom = 1 then
    muda_acao(2)
   else
    muda_acao(1);
end;

procedure TfrmExpedicaoDelivery.rdTipoEntregaClick(Sender: TObject);
begin
  inherited;
  filtraPedidos;
end;

procedure TfrmExpedicaoDelivery.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  filtraPedidos();
end;

procedure TfrmExpedicaoDelivery.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setEvento(1);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    SpeedButton1.Click;
end;

procedure TfrmExpedicaoDelivery.SpeedButton3Click(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setEvento(4);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
end;

procedure TfrmExpedicaoDelivery.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
  frmCadClientesDelivery.ShowModal;
  frmCadClientesDelivery.Free;
end;

procedure TfrmExpedicaoDelivery.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadBairros, frmCadBairros);
  frmCadBairros.ShowModal;
  frmCadBairros.Free;
end;

procedure TfrmExpedicaoDelivery.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
