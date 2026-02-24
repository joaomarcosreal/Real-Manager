unit uu_transferir_mesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,   ExtCtrls,Buttons, Grids,
  DBGrids, DB, RxMemDS,uu_modelo_vazio,ibquery;

type
  Tfrm_transferir_mesa = class(Tfrm_modelo_vazio)
    tbTransferencia: TRxMemoryData;
    tbTransferenciamesa: TStringField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    pnNumeroMesa: TPanel;
    Label1: TLabel;
    edMesa: TEdit;
    pnl1: TPanel;
    lbl4: TLabel;
    edtMesaDestino: TEdit;
    btn_trasferir: TBitBtn;
    btnIAeverButton1: TBitBtn;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    procedure ed_mesa_destinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure realizaTransferencia(origem : string; destino : string);
    procedure transfereMesa(origem : string; destino : string);
    procedure confirmarTransferencia();

    procedure IAeverButton1Click(Sender: TObject);
    procedure btAdicionarMesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

   procedure  gravarTransferencia(origem : string; destino : string);
    procedure Edit1Exit(Sender: TObject);
    procedure btn_trasferirClick(Sender: TObject);
    procedure btnIAeverButton1Click(Sender: TObject);

  private
    procedure adicionarMesa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_transferir_mesa: Tfrm_transferir_mesa;

implementation

uses uu_data_module, uu_frm_principal, uu_caixa_restaurante, Math;


{$R *.dfm}

procedure Tfrm_transferir_mesa.realizaTransferencia(origem : string; destino : string);
var
 codigo_lancamento : string;
 result : string;
begin


  gravarTransferencia(origem,destino);
  transfereMesa(origem,destino);


  if (dm.verificaSeAMesaFoiAberta(destino) = false ) then
   begin
     dm.efetuaAberturaDaMesa(destino);
   end;


end;


procedure  Tfrm_transferir_mesa.gravarTransferencia(origem : string; destino : string);
var
 q : TIBQuery;
 totalMesaOrigem, totalMesaDestino : double;
 codTransferencia : string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  codTransferencia := dm.geraCodigo('G_TRANSFERENCIAS_MESA',5);
  totalMesaOrigem :=  getValorProdutosMesa(origem);
  totalMesaDestino := getValorProdutosMesa(destino);
  q.SQL.Add('insert into transferencias_mesa (codigo,mesa_origem,mesa_destino,total_mesa_origem,total_mesa_destino,cod_caixa,hora,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU) values(');
  q.SQL.Add(''+Quotedstr(codTransferencia)+',');
  q.SQL.add(''+Quotedstr(origem)+',');
  q.SQL.Add(''+QuotedStr(destino)+',');
  q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(totalMesaOrigem))+',');
  q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(totalMesaDestino))+',');
  q.SQL.add(''+Quotedstr(ultimoCaixaAberto)+',');
  q.SQL.Add(''+Quotedstr(FormatDateTime('hh:mm:ss',Time))+',');
  q.sql.add(QuotedStr(codigo_usuario_responsavel)+',');
  q.sql.add(QuotedStr(nome_usuario_responsavel)+')');


  try
   begin
    q.ExecSQL;
   end
  except
   begin
     ShowMessage('Erro ao logar a transferência!');
   end;
  end;

  q.Active:=false;
  q.SQL.clear;
  q.sql.add('insert into produtos_transferencias_mesa(COD_TRANSFERENCIA,COD_PRODUTO,COD_BARRAS,');
  q.sql.add('       DESCRICAO, QUANTIDADE,VALOR_UNITARIO,TOTAL)');
  q.sql.add('       select '+QuotedStr(codTransferencia)+',mv.cod_produto,cod_barras,p.descricao,mv.quantidade,mv.valor_unitario,(mv.valor_unitario * mv.quantidade)');
  q.sql.add('       from movimento_mesa mv');
  q.sql.add('       inner join produtos p on (p.cod_produto = mv.cod_produto)');
  q.sql.add('       where mv.cod_mesa='+Quotedstr(origem)); 
  try
   begin
    q.ExecSQL;
   end
  except
   begin
     ShowMessage('Erro gravar os produtos transferidos da mesa');

   end;
  end;


  if ( StrToInt(dm.LeIni(1,'TRANSFERENCIA_DE_MESA','imprime_comprovante')) = 1)   then
   begin
     dm.imprimeComprovanteTransferenciaMesa(origem,destino,codTransferencia,totalMesaOrigem,totalMesaDestino);
   end;

  q.Active:=false;
  FreeAndNil(q);
end;


procedure Tfrm_transferir_mesa.transfereMesa(origem : string; destino : string);
var
 codigo_lancamento : string;
begin


 if (StrToInt(dm.LeIni(1, 'COUVERT', 'lancarAutomaticamente')) = 1) then
  begin
    frm_caixa_restaurante.lancarCouvertAutomatico(origem);
  end;


  dm.qryauxiliar2.Active:=false;                          
  dm.qryauxiliar2.sql.clear;
  dm.qryauxiliar2.SQL.add('select mv.cod_mesa,pr.cod_barras,');
  dm.qryauxiliar2.SQL.add(' mv.cod_produto,pr.cod_produto,');
  dm.qryauxiliar2.SQL.add(' pr.descricao,mv.quantidade as quantidade,');
  dm.qryauxiliar2.SQL.add(' mv.valor_unitario,udf_RoundDec((mv.valor_unitario * mv.quantidade),2) as total, mv.comanda,');
  dm.qryauxiliar2.SQL.add(' mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto');
  dm.qryauxiliar2.SQL.add('  from movimento_mesa mv');
  dm.qryauxiliar2.SQL.add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qryauxiliar2.SQL.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon)');
  dm.qryauxiliar2.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qryauxiliar2.SQL.add('  where mv.cod_mesa='+origem+' order by mv.cod_movimento');
  dm.qryauxiliar2.active:=true;
  dm.qryauxiliar2.first;

  while not dm.qryauxiliar2.Eof do
  begin
    dm.qryauxiliar.active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa='+QuotedStr(destino));
    dm.qryauxiliar.Active:=true;
    if ((dm.qryauxiliar.IsEmpty) or (dm.qryauxiliar.fieldbyname('novo_cod').IsNull)) then
     begin
      codigo_lancamento:='1';
      codigo_lancamento:=FormatFloat('0000',Strtofloat(codigo_lancamento));
     end
    else
     begin
      codigo_lancamento:=VarToStr(dm.qryauxiliar.fieldbyname('novo_cod').value);
      codigo_lancamento:=IntToStr(   StrToInt(codigo_lancamento)+1  );
      codigo_lancamento:=FormatFloat('0000',Strtofloat(codigo_lancamento));
     end;

     dm.qryauxiliar.Active:=False;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.sql.add('update movimento_mesa set cod_mesa='+Quotedstr(destino));
     dm.qryauxiliar.sql.add(',obs_paf='+Quotedstr('TRANSF. DA MESA '+origem  ));
     dm.qryauxiliar.sql.add(',cod_movimento='+Quotedstr(codigo_lancamento)+' where cancelado=0 and cod_mesa='+Quotedstr(origem ));
     dm.qryauxiliar.sql.add(' and cod_movimento='+Quotedstr(dm.qryauxiliar2.fieldbyname('cod_movimento').value));


     try
       begin
         dm.qryauxiliar.ExecSQL;
       end;
     except
       begin
         dm.cria_log_de_erros(dm.qryauxiliar.sql,'Caixa ','Erro ao transferir mesa',codigo_usuario);
         exit;
       end;
     end;

     dm.qryauxiliar.Active:=False;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.sql.add('update movimento_mesa set cod_mesa='+Quotedstr(destino));
     dm.qryauxiliar.sql.add(',cod_movimento='+Quotedstr(codigo_lancamento)+' where cancelado=1 and cod_mesa='+Quotedstr(origem ));
     dm.qryauxiliar.sql.add(' and cod_movimento='+Quotedstr(dm.qryauxiliar2.fieldbyname('cod_movimento').value));
    try
       begin
         dm.qryauxiliar.ExecSQL;
       end;
     except
       begin
         dm.cria_log_de_erros(dm.qryauxiliar.sql,'Caixa ','Erro ao transferir mesa',codigo_usuario);
         exit;
       end;
     end;




    dm.qryauxiliar2.Next;
  end;

  dm.qryauxiliar2.Active:=false;
  dm.qryauxiliar2.sql.clear;
  dm.qryauxiliar2.sql.add('update recebimento_parcial set mesa='+Quotedstr(destino));
  dm.qryauxiliar2.sql.add(' where mesa='+Quotedstr(origem));
  try
   dm.qryauxiliar2.ExecSQL;
  except
   begin
     showmessage('Erro ao transferir recebimentos parciais!');
   end;
  end;

  if ( StrToInt(dm.LeIni(2,'ENCERRAMENTO','bloqueiaMesaAposFechar') ) =1 ) then
  begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('update cartoes set status=1 where cod_cartao='+Quotedstr(origem));
    dm.qryauxiliar.ExecSQL;
  END;


  if dm.transacao.Active= false then dm.transacao.Active:=true;
  dm.transacao.Commit;
  Close;
end;

procedure Tfrm_transferir_mesa.ed_mesa_destinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0)
     end;

   if key=vk_escape then
   begin
     Close;
   end;

end;




procedure Tfrm_transferir_mesa.FormActivate(Sender: TObject);
begin
  if (trim(edMesa.Text) <> '') then
  begin
    tbTransferencia.Active:=false;
    tbTransferencia.EmptyTable;
    tbTransferencia.Active:=true;
    edMesa.SetFocus;
  end;
end;

procedure Tfrm_transferir_mesa.adicionarMesa;
begin
  if( trim(edMesa.Text) <> '' ) then
   begin

     if dm.verificaseExisteMovimentoMesa( trim(edMesa.Text) ) then
      begin
        tbTransferencia.Append;
        tbTransferenciamesa.Value:=Trim(edMesa.Text);
        tbTransferencia.Post;
        edMesa.Clear;
        edMesa.SetFocus;
      end
     else
       begin

         dm.exibe_painel_erro('A Mesa / Cartão informado não possui movimento!','Ok');
         edMesa.SetFocus;
         edMesa.Clear;
         exit;
       end;
   end
  else
   begin

  
   end;

end;

procedure Tfrm_transferir_mesa.confirmarTransferencia();
begin
 if (tbTransferencia.IsEmpty = false) then
  begin
   if MessageDlg('Confirma transferência  ?',mtConfirmation,[mbYes,mbNo],0) = mryes then
    begin
      tbTransferencia.First;
      while not tbTransferencia.Eof do
       begin

         realizaTransferencia(tbTransferenciamesa.Value,edtMesaDestino.text );
         tbTransferencia.Next;


      end;

    end;
  end
 else
  begin
    Showmessage('Digite pelo menos UMA MESA/CARTÃO para transferir');
    edMesa.SetFocus;
    exit;
  end;

end;

procedure Tfrm_transferir_mesa.IAeverButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_transferir_mesa.btAdicionarMesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key = vk_escape then close;
end;

procedure Tfrm_transferir_mesa.Edit1Exit(Sender: TObject);
begin
  inherited;


  if ((sender is Tedit and ((sender as Tedit).Name = 'edMesa')) and (trim(edMesa.Text ) <> '')) then
  begin


  try
    StrToInt(edMesa.Text);
   except
    begin
      ShowMessage('Mesa inválida!');
      edMesa.SetFocus;
      edMesa.Clear;
      Exit;
    end;
   end;


  if ( StrToInt(edMesa.Text) > 999 ) then
   begin
     edMesa.Clear;
     ShowMessage('Número de mesa inválido. Usar numerações até 999');
     edMesa.SetFocus;
     edMesa.Clear;
     Exit;
   end;



  if tbTransferencia.Locate('mesa',edMesa.Text,[])  then
   begin
     ShowMessage('Mesa já consta na lista de transferência!');
     edMesa.Clear;
     exit;
   end;


      adicionarMesa();


  end;




  if ((sender is Tedit and ((sender as Tedit).Name = 'edtMesaDestino')) ) then
  begin




   edtMesaDestino.Text:= dm.removeCaracteres(edtMesaDestino.Text);

   if trim(edtMesaDestino.Text) = '' then
    begin
          ShowMessage('Mesa de destino inválida!');
          edtMesaDestino.Clear;
          edtMesaDestino.SetFocus;
          exit;
    end;




    try
      begin
        if trim(edtMesaDestino.Text) = '' then
        begin

          edtMesaDestino.Clear;
          edtMesaDestino.SetFocus;
          exit;
        end
        else
        begin
          edtMesaDestino.Text := formatfloat('0000', Strtofloat(edtMesaDestino.Text));
          edtMesaDestino.Text := formatfloat('0000', Strtofloat(edtMesaDestino.Text));

        end;
      end;
    except
      begin
        showmessage('Número de mesa de destino inválida!');
        edtMesaDestino.Clear;
        edtMesaDestino.SetFocus;
        exit;
      end;
    end;

    if (trim (edtMesaDestino.Text) = '0000') then
     begin
        showmessage('Número de mesa de destino inválida!');
        edtMesaDestino.Clear;
        edtMesaDestino.SetFocus;
        exit;
     end;



  end
 else
  begin

  end;

end;

procedure Tfrm_transferir_mesa.btn_trasferirClick(Sender: TObject);
begin
  inherited;
    if tbTransferencia.Locate('mesa',edtMesaDestino .Text,[])  then
   begin
     ShowMessage('Mesa  de destino não pode ser transferida para ela mesma! ');
     edtMesaDestino.Clear;
     exit;
   end
  else
   begin

       edtMesaDestino.Text:= dm.removeCaracteres(edtMesaDestino.Text);

       if trim(edtMesaDestino.Text) = '' then
        begin
              ShowMessage('Mesa de destino inválida!');
              edtMesaDestino.Clear;
              edtMesaDestino.SetFocus;
              exit;
        end;

        try
          begin
            if trim(edtMesaDestino.Text) = '' then
            begin

              edtMesaDestino.Clear;
              edtMesaDestino.SetFocus;
              exit;
            end
            else
            begin
              edtMesaDestino.Text := formatfloat('0000', Strtofloat(edtMesaDestino.Text));
              edtMesaDestino.Text := formatfloat('0000', Strtofloat(edtMesaDestino.Text));

            end;
          end;
        except
          begin
            showmessage('Número de mesa de destino inválida!');
            edtMesaDestino.Clear;
            edtMesaDestino.SetFocus;
            exit;
          end;
        end;


      if ( StrToInt(edtMesaDestino.Text) > 999 ) then
       begin
         edtMesaDestino.Clear;
         ShowMessage('Número de mesa inválido. Usar numerações até 999');
         edtMesaDestino.SetFocus;
         edtMesaDestino.Clear;
         Exit;
       end;

     confirmarTransferencia();
   end;



end;

procedure Tfrm_transferir_mesa.btnIAeverButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
