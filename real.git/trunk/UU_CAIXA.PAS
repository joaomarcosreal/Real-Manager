unit uu_caixa;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,  Buttons, Grids, DBGrids,
   Mask,   ComCtrls, RDprint,db,   jpeg, RXCtrls,
  XP_Form;


type
  Tfrm_caixa = class(TForm)
    tfXPForm1: TtfXPForm;
    pn_produto: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    ed_quantidade: TFocusEdit;
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    Panel3: TPanel;
    rdp: TRDprint;
    Timer1: TTimer;
    Panel1: TPanel;
    foto: TImage;
    descricao_prod: TLabel;
    lb_preco: TLabel;
    RxLabel1: TRxLabel;
    Panel5: TPanel;
    D30001011: TDBGrid;
    ed_cod_barras: TFocusEdit;
    Label1: TLabel;
    bt_pesq_cod_barras: TSpeedButton;
    Panel4: TPanel;
    Label19: TLabel;
    ed_total_conta: TCurrencyEdit;
    B30001001: TBitBtn;
    Panel6: TPanel;
    lb_nome_fantasia: TLabel;
    lb_caixa: TLabel;
    lb_operador: TLabel;
    lb_data_sistema: TLabel;
    ed_cod_produto: TFocusEdit;
    Label3: TLabel;
    procedure ed_cod_barrasExit(Sender: TObject);
    function  busca_movimento_da_mesa : boolean;

    function  pesquisar_produto : boolean;
    function  verifica_validade_lancamento : boolean;
    function  imprimir_extrato : boolean;
    function  adicionar_produto_conta : boolean;


    function  pesquisa_produto : boolean;

    procedure cor_dos_componentes ;
    procedure ed_cod_barrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ed_cod_barrasEnter(Sender: TObject);

    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);

    procedure Timer1Timer(Sender: TObject);
    procedure bt_pesq_produtoClick(Sender: TObject);
    procedure B30001002KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_pesquisa_garconClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure B30001001Click(Sender: TObject);
    procedure verificar_permissoes;
    function emitir_cupom_fiscal : boolean;
    function registra_item_cupom : boolean;
    procedure ed_cod_barrasChange(Sender: TObject);
    procedure muda_acao(tipo : integer);
    procedure B30001001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function GetStateK (Key: integer): boolean;






  private
    { Private declarations }
  public
    { Public declarations }
    fecha : boolean;
  end;

var
  frm_caixa: Tfrm_caixa;
  tx_serv : double;

implementation

uses uu_data_module, uu_cs_produtos,  uu_frm_principal, UnitDeclaracoes,
  uu_transferir_item, uu_transferir_mesa, uu_cs_garcons, uu_encerramento,
  uu_extrato, uu_recebimentos_parciais, Math;

{$R *.dfm}


procedure Tfrm_caixa.ed_cod_barrasExit(Sender: TObject);
begin
   if  sender is Tedit and ((sender as Tedit).Name='ed_cod_barras') then
   begin

   end;   


if  sender is TDBGrid then
 begin
    (sender as TDBGrid).Color:=clWhite;
 end;





  if  sender is Tedit and ((sender as Tedit).Name='ed_cod_produto') then
   begin
     try
       ed_cod_produto.Text:=FormatFloat('00000',strtofloat(ed_cod_produto.Text));
     except
      begin
        showmessage('Código de produto inválido!');
        ed_cod_produto.SetFocus;
        ed_cod_produto.Clear;
        exit;
      end;
     end;
     dm.qryauxiliar.Active:=false;
     dm.qryauxiliar.SQL.Clear;
     dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras='+Quotedstr(ed_cod_produto.Text));
     dm.qryauxiliar.Active:=true;

     if dm.qryauxiliar.IsEmpty then
     begin
       ShowMessage('O código informado não pertence a um produto cadastrado!');
       ed_cod_produto.SetFocus;
       ed_cod_produto.Clear;
       exit;
     end;
     foto.picture.LoadFromFile(dm.qryauxiliar.fieldbyname('caminho_foto').value);
     lb_preco.Visible:=true;
     descricao_prod.Visible:=true;

     descricao_prod.Caption:=dm.qryauxiliar.fieldbyname('descricao').value;
     lb_preco.Caption:=FormatFloat('R$ #0.00,',dm.qryauxiliar.fieldbyname('valor_unitario').value);


   end;


   if  sender is Tedit and ((sender as Tedit).Name='ed_quantidade') then
   begin
     try
       StrTofloat(ed_quantidade.Text);
     except
      begin
        showmessage('Quantidade inválida!');
        ed_quantidade.SetFocus;
        ed_quantidade.text:='1,0';
        exit;
      end;
     end;

     if strToFloat(ed_quantidade.Text) >= 100 then
     begin
       if MessageDlg('A Quantidade informada é muito grande!'+#13+#13+'Deseja continuar mesmo assim ?',mtConfirmation,[mbYes,mbNo],0) = MrNo then
        exit
       else
         begin
           ed_quantidade.Clear;
           ed_quantidade.setfocus;
         end;
     end;

   end;


   if  sender is Tedit and ((sender as Tedit).Name='ed_valor_tx_serv') then
   begin
     try
     except
       begin
         ShowMessage('Valor de taxa de serviço inválido!');
       end;
     end;

   end;

   if  sender is Tedit and ((sender as Tedit).Name='ed_valor_desconto') then
   begin
     try
     except
      begin
        ShowMessage('Valor de desconto inválido!');
        exit;
      end;
     end;


   end;

   if  sender is Tedit and ((sender as Tedit).Name='ed_cod_barras') then
   begin
       
     IF TRIM(ed_cod_barras.text) = '' then
     begin
       showmessage('Código inválido!');
       ed_cod_barras.SetFocus;
       exit;
     end;

     dm.qryauxiliar.Active:=false;
     dm.qryauxiliar.SQL.Clear;
     dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras='+Quotedstr(ed_cod_barras.Text));
     dm.qryauxiliar.Active:=true;

     if dm.qryauxiliar.IsEmpty then
     begin
       ShowMessage('O código informado não pertence a um produto cadastrado!');
       ed_cod_produto.Clear;
       ed_cod_barras.clear;
       ed_cod_barras.SetFocus;
       exit;
     end;
     ed_cod_produto.text:=dm.qryauxiliar.fieldbyname('cod_produto').value;

//     ed_descricao_produto.Text:=dm.qryauxiliar.fieldbyname('descricao').value;
//     ed_valor_produto.Text:=FormatFloat('#0.00,',dm.qryauxiliar.fieldbyname('valor_unitario').value);
     foto.picture.LoadFromFile(dm.qryauxiliar.fieldbyname('caminho_foto').value);

     Label3.Visible:=TRUE;
     lb_preco.Visible:=true;
     descricao_prod.Visible:=true;

     descricao_prod.Caption:=dm.qryauxiliar.fieldbyname('descricao').value;
     lb_preco.Caption:=FormatFloat('#0.00,',dm.qryauxiliar.fieldbyname('valor_unitario').value);
   end;
end;


function Tfrm_caixa.busca_movimento_da_mesa : boolean;
var
 valor_bruto : double;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm.qry_movimento_mesa.Active:=false;
  dm.qry_movimento_mesa.sql.clear;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,mv.cod_movimento,mv.cod_produto,produtos.cod_produto,produtos.descricao,mv.quantidade,produtos.valor_unitario,mv.comanda,mv.cod_garcon,mv.numero_caixa,');
  dm.qry_movimento_mesa.SQL.Add(' mv.total  from movimento_mesa mv ,produtos where');
  dm.qry_movimento_mesa.sql.add(' produtos.cod_produto=mv.cod_produto and mv.cod_mesa='+Quotedstr('3000')+' and numero_caixa='+QUotedstr(numero_caixa)+' order by cod_movimento');
  dm.qry_movimento_mesa.Active:=true;
  D30001011.Columns[0].Visible:=false;
  D30001011.Columns[1].Title.Caption:=' ';
  D30001011.Columns[1].Width:=30;
  D30001011.Columns[2].Visible:=false;
  D30001011.Columns[3].Visible:=false;
  D30001011.Columns[4].Title.Caption:='Descrição';
  D30001011.Columns[4].Width:=225;
  D30001011.Columns[5].Title.Caption:='Qtde';
  D30001011.Columns[5].Width:=30;
  D30001011.Columns[6].Title.Caption:='Vl. Unit';
  D30001011.Columns[6].Width:=50;
  D30001011.Columns[7].Visible:=false;
  D30001011.Columns[8].Visible:=false;
  D30001011.Columns[9].Visible:=false;
  D30001011.Columns[10].Visible:=true;
  D30001011.Columns[10].Title.Caption:='Total';
  D30001011.Columns[10].Width:=40;
  valor_bruto:=0;
  dm.qry_movimento_mesa.First;
  while not dm.qry_movimento_mesa.Eof do
  begin
    valor_bruto:=(dm.qry_movimento_mesa.fieldbyname('quantidade').value * dm.qry_movimento_mesa.fieldbyname('valor_unitario').value) +valor_bruto;
    dm.qry_movimento_mesa.Next;
  end;
  ed_total_conta.Value:=valor_bruto;
end;






procedure Tfrm_caixa.ed_cod_barrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If GetStateK (VK_LMENU) And (Key = VK_F4) Then
 fecha := False;

   if key=vk_return
   then
     begin
       if  not ((sender is TMemo) or (sender is Tdbgrid)) then
       Perform(WM_NEXTDLGCTL,0,0)
     end;


//  if  sender is Tedit and ((sender as Tedit).Name='ed_numero_mesa') then


  if (key=vk_escape) then
    begin
      if dm.qry_movimento_mesa.IsEmpty = false then
       begin
          ed_cod_produto.Clear;
          ed_quantidade.text:='1,0';
          ed_cod_barras.CLEAR;
          ed_cod_barras.SetFocus;
          foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'))

      end
    else
      begin
        frm_caixa.Close;
      end;
   end;



  if key=vk_f2 then
  begin
    if  sender is Tedit and ((sender as Tedit).Name='ed_cod_barras') then
      bt_pesq_cod_barras.Click;
  end;

  if key=vk_f3 then
  begin
    if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
    begin
      Application.CreateForm(Tfrm_transferir_item,frm_transferir_item);
      frm_transferir_item.ShowModal;
      frm_transferir_item.Free;
      busca_movimento_da_mesa;

    end;
  end;

  if key=vk_f5 then
  begin
   if dm.qry_movimento_mesa.IsEmpty = false then
    begin
      Application.CreateForm(Tfrm_encerramento,frm_encerramento);
      frm_encerramento.lb_mesa.Caption:='3000';
      frm_encerramento.showmodal;
      frm_encerramento.free;
      busca_movimento_da_mesa;
      muda_acao(tipo_cupom);
    end
   else
    begin
      ShowMessage('Não existe movimento para encerramento!');
    end;

  end;


  if key=vk_f7 then
  begin
     D30001011.SetFocus;

    D30001011.Columns[2].Showing;
    D30001011.SelectedIndex:=2;

  end;

  if key= vk_delete then
  begin
   if  sender is TDBGrid and ((sender as TDBGrid).Name='D30001011') then
    begin
      if messagedlg('Confirma o cancelamento do ítem ?',mtconfirmation,[mbYes,mbNo],0) = Mryes then
       begin
        if tipo_cupom = 1 then
        begin
          case impressora_fiscal of
            1: begin
                 iRetorno := Bematech_FI_CancelaItemGenerico( pchar( formatFloat('000',dm.qry_movimento_mesa.FieldByName('cod_movimento').value)));
                 if frm_Principal.Analisa_iRetorno= false then
                 begin
                   showmessage('Erro ao cancelar ítem do  cupom fiscal!');
                   exit;
                 end;
               end;

            2: begin
                iRetorno := Daruma_FI_CancelaItemGenerico( pchar( formatFloat('000',dm.qry_movimento_mesa.FieldByName('cod_movimento').value)));
                 if Iretorno <> 1 then
                 begin
                   showmessage('Erro ao cancelar ítem do  cupom fiscal!');
                   exit;
                 end;
               end;
          end;
        end;

         dm.qrymax.Active:=false;
         dm.qrymax.SQL.Clear;
         dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa='+quotedstr('3000')+' and cod_movimento='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
         dm.qrymax.ExecSQL;
         IF dm.transacao.Active = false then dm.transacao.Active:=true;
         dm.transacao.Commit;
         busca_movimento_da_mesa;
      end;
    end;

  end;

end;

function Tfrm_caixa.pesquisar_produto : boolean;
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active:=true;

  if dm.qry_consultas.IsEmpty then
   begin
     ShowMessage('Não existem produtos cadastrados!');

     exit;
   end
  else
   begin
     Application.CreateForm(Tfrm_consulta_produtos,frm_consulta_produtos);
     frm_consulta_produtos.ShowModal;
     ed_cod_produto.Text:=string_auxiliar;
     frm_consulta_produtos.Free;
   end;
end;

function Tfrm_caixa.verifica_validade_lancamento : boolean;
begin
     try
       ed_cod_produto.Text:=FormatFloat('00000',strtofloat(ed_cod_produto.Text));
     except
      begin
        showmessage('Código de produto inválido!');
        ed_cod_produto.SetFocus;
        ed_cod_produto.Clear;
        Result:=false;
        exit;
      end;
     end;
     dm.qryauxiliar.Active:=false;
     dm.qryauxiliar.SQL.Clear;
     dm.qryauxiliar.SQL.Add('select * from produtos where cod_produto='+Quotedstr(ed_cod_produto.Text));
     dm.qryauxiliar.Active:=true;

     if dm.qryauxiliar.IsEmpty then
     begin
       ShowMessage('O código informado não pertence a um produto cadastrado!');
       ed_cod_produto.SetFocus;
       ed_cod_produto.Clear;
       Result:=false;

       exit;
     end;
    Result:=true;
end;


function Tfrm_caixa.adicionar_produto_conta : boolean;
var
 codigo_lancamento: string;
 total : double;
begin
  dm.qryauxiliar.active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa='+QuotedStr('3000')+' and numero_caixa='+Quotedstr(numero_caixa));
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
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  total:=StrTofloat(lb_preco.Caption) * StrToFloat(ed_quantidade.Text);
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,numero_caixa,total) values (');
  dm.qryauxiliar.sql.add(''+QuotedStr('3000')+',');
  dm.qryauxiliar.sql.add(''+QuotedStr('000')+',');
  dm.qryauxiliar.sql.add(''+QuotedStr(ed_cod_produto.Text)+',');
  dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(ed_quantidade.Text)+',');
  dm.qryauxiliar.sql.add(''+QuotedStr('000  ')+',');
  dm.qryauxiliar.sql.add(''+Quotedstr(codigo_lancamento)+',');
  dm.qryauxiliar.sql.add(''+QUotedstr(numero_caixa)+',');
  dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(Floattostr(total))+')');

  try
    begin
      dm.qryauxiliar.ExecSQL;
      Result:=true;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de Produtos ','Erro ao excluir produto ',codigo_usuario);
      Result:=false;
      exit;
    end;
  end;

  if dm.transacao.Active= false then  dm.transacao.Active:=true;
  dm.transacao.Commit;
  busca_movimento_da_mesa;

{  ed_cod_garcon.Clear;
  ed_nome_garcon.clear;}
  ed_cod_produto.Clear;
//  ed_descricao_produto.clear;
  ed_quantidade.text:='1,0';
  ed_cod_barras.CLEAR;

  ed_cod_barras.SetFocus;

  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
end;


procedure Tfrm_caixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (Column.Field.FieldName = 'TOTAL')
  then
    begin
{         DBGrid1.Canvas.Brush.Color:= clRed;
         DBGrid1.Canvas.Font.Style:=[fsbold];
         DBGrid1.Canvas.Font.Color:= clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);}
    end;

end;






procedure Tfrm_caixa.FormActivate(Sender: TObject);
begin
//  verificar_permissoes;
  cor_dos_componentes;
   
  lb_nome_fantasia.Caption:=nome_fantasia;
  lb_operador.caption:='OPERADOR(A):  '+nome_completo_usuario;
  lb_caixa.caption:='Caixa nº '+numero_caixa;
  lb_data_sistema.Caption:=Formatdatetime('DD/MM/YYY',data_do_sistema);
  busca_movimento_da_mesa;

  if not  dm.qry_movimento_mesa.IsEmpty then
  begin
    if MessageDlg('Existe uma venda que não foi encerrada. Deseja cancelar a venda?', mtconfirmation,[mbYes,mbNo],0) = Mryes then
    begin
      dm.qryauxiliar.Active:=false;
      dm.qryauxiliar.SQL.Clear;
      dm.qryauxiliar.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr('3000')+' and numero_caixa='+QUotedstr(numero_caixa));
      dm.qryauxiliar.ExecSQL;
      if dm.transacao.Active= false then
       dm.transacao.Active:=true;
      dm.transacao.Commit;
      busca_movimento_da_mesa;
    end;
  end;
end;

procedure Tfrm_caixa.ed_cod_barrasEnter(Sender: TObject);
begin

if  sender is Tedit and ((( sender as Tedit).Name='ed_numero_mesa')  or  ((sender as Tedit).Name='ed_cod_garcon')  or ((sender as Tedit).Name='ed_cod_produto') ) then
  begin
     
  end;


if  sender is TDBGrid then
 begin
    (sender as TDBGrid).Color:=cor_foco_edit;
 end;


end;

function Tfrm_caixa.imprimir_extrato : boolean;
begin
  case tipo_impressora of
    1: begin

       end;
    2: begin

       end;
    3: begin

       end;

  end;

end;



procedure Tfrm_caixa.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin


 {
  if gdSelected in State then
  begin
    With (Sender as TDbGrid).Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
    end;
  end;
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, Field, State);

}

  if gdSelected in State then
  begin
    With (Sender as TDbGrid).Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
    end;
  end;
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, Field, State);





end;



procedure Tfrm_caixa.Timer1Timer(Sender: TObject);
begin
//  lb_hora.Caption:=FormatDateTime('HH:MM:SS',time);
//  lbhora.Caption:=FormatDateTime('HH:MM:SS',time);
end;

function Tfrm_caixa.pesquisa_produto : boolean;
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active:=true;

  if dm.qry_consultas.IsEmpty then
   begin
     ShowMessage('Não existem produtos cadastrados!');
     exit;
   end
  else
   begin
     Application.CreateForm(Tfrm_consulta_produtos,frm_consulta_produtos);
     frm_consulta_produtos.ShowModal;
     ed_cod_barras.text:= string_aux_cod_barras;
//     ed_cod_produto.Text:=string_auxiliar;

     frm_consulta_produtos.Free;
   end;
end;


procedure Tfrm_caixa.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;

procedure Tfrm_caixa.cor_dos_componentes ;
 var
  X : integer;
begin
  for x:=0 to ComponentCount-1 do if
   Components[x].ClassName='TFocusEdit' then TFocusEdit(Components[x]).FocusColor:=cor_foco_edit;

end;


procedure Tfrm_caixa.B30001002KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
  begin
     
    dm.qry_movimento_mesa.Active:=false;
    ed_cod_produto.clear;
//    ed_descricao_produto.Clear;
//    ed_valor_produto.Clear;
    ed_quantidade.clear;

//      ed_nome_garcon.Clear;

     
  end;
end;

procedure Tfrm_caixa.bt_pesquisa_garconClick(Sender: TObject);
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from garcons order by apelido');
  dm.qry_consultas.Active:=true;
  if dm.qry_consultas.IsEmpty then
   begin
    ShowMessage('Não existem garçons cadastrados!');
    exit;
   end
  else
   begin
     Application.CreateForm(Tfrm_cs_garcons,frm_cs_garcons);
     frm_cs_garcons.ShowModal;
     frm_cs_garcons.free;


   end;





end;



procedure Tfrm_caixa.DBGrid1CellClick(Column: TColumn);
begin
   
  D30001011.SetFocus;
   
end;

procedure Tfrm_caixa.B30001001Click(Sender: TObject);


begin
  if verifica_validade_lancamento  = true then
  begin
     case (tipo_cupom) of
      1: begin
           tipo_comprovante:=StrtoInt(dm.LeIni(1,'ENCERRAMENTO','tipo_comprovante'));
           if tipo_comprovante = 1  then
            begin

              if dm.qry_movimento_mesa.IsEmpty then
                if dm.iniciar_cupom_fiscal(marca_impressora_fiscal,modelo_impressora_fiscal) <> 'OK' then exit;

                   if registra_item_cupom = false then
                     exit
                   else
                     begin
                    end;
            end;

            adicionar_produto_conta;
            lb_preco.Visible:=false;
            Label3.Visible:=FALSE;
            descricao_prod.Visible:=false;

         end;
      2: begin
           adicionar_produto_conta;
           lb_preco.Visible:=false;
           Label3.Visible:=FALSE;
           descricao_prod.Visible:=false;

         end;

     end;



  end;




end;






procedure Tfrm_caixa.verificar_permissoes;
var
 modulo,submodulo : string;
 x : integer;
begin
   x:=0;
   while x < ComponentCount-1 do
   begin


    if  Components[x].ClassName='TDBGrid'
     then
      begin
         modulo:=Trim(copy(TDBGrid(Components[x]).Name,2,5));
         submodulo:=Trim(copy(TDBGrid(Components[x]).Name,7,15));
         if dm.verifica_permissao(modulo,submodulo,codigo_usuario,false)=false
         then
           begin
             TDBGrid(Components[x]).Visible:=false;
           end
         else
           TDBGrid(Components[x]).Visible:=true;

      end;


    if  Components[x].ClassName='TGroupBox'
     then
      begin
         modulo:=Trim(copy(TGroupBox(Components[x]).Name,2,5));
         submodulo:=Trim(copy(TGroupBox(Components[x]).Name,7,15));
         if dm.verifica_permissao(modulo,submodulo,codigo_usuario,false)=false
         then
           begin
             TGroupBox(Components[x]).Visible:=false;

           end
         else
           TGroupBox(Components[x]).Visible:=true;
      end;


    x:=x+1;
   end;
end;



function Tfrm_caixa.emitir_cupom_fiscal : boolean;
var
 Str_Informacao: String;
begin
    if dm.qry_movimento_mesa.IsEmpty = false then
   begin
     Result:=true;
     exit;
   end;

   Result:=true;
   if (dm.iniciar_cupom_fiscal(marca_impressora_fiscal,modelo_impressora_fiscal) = 'OK') then
     Result:=true
   else
     Result:=false;
end;


function Tfrm_caixa.registra_item_cupom : boolean;
var
 cCodigo,cDescricao,cAliquota,cTipoQtde,cQtde,cValor,cTipoDesconto,cValorDesc : string;
 iCasasDecimais : integer;
 descricao_maior : string;
 qtde : double;
begin
  dm.qryauxiliar2.Active:=false;
  dm.qryauxiliar2.sql.clear;
  dm.qryauxiliar2.sql.add('select produtos.cod_produto,produtos.valor_unitario,produtos.descricao,produtos.cod_aliquota,aliquotas.cod_aliquota,aliquotas.parametro from produtos, aliquotas where aliquotas.cod_aliquota=produtos.cod_aliquota and produtos.cod_produto='+Quotedstr(ed_cod_produto.text));
  dm.qryauxiliar2.active:=true;
  cCodigo:=ed_cod_produto.text;
  cDescricao:=dm.qryauxiliar2.fieldbyname('descricao').Value;
  cAliquota:=Trim(dm.qryauxiliar2.fieldbyname('parametro').Value);
  cTipoQtde:='F';
  iCasasDecimais:=2;
  qtde:=Strtofloat(ed_quantidade.Text);
  cQtde:=Formatfloat('#0.000',qtde);
  cValor:=formatfloat('#0.00',dm.qryauxiliar2.fieldbyname('valor_unitario').value);
  cTipoDesconto:='$';
  cValorDesc:='0,00'; //formatfloat('#0.00',StrToFloat(ed_valor_desconto.Text));
  cDescricao:=TRIM(dm.qryauxiliar2.fieldbyname('descricao').Value);

 if ( dm.registra_item_cupom_fiscal(marca_impressora_fiscal,modelo_impressora_fiscal,cCodigo ,cDescricao ,
                                                 cAliquota ,
                                                 cTipoQtde ,
                                                 cQtde ,
                                                 iCasasDecimais,
                                                 cValor,
                                                 cTipoDesconto ,
                                                 cValorDesc  )  ) = 'OK' then
   Result:=true
 else
  Result:=false;
end;





procedure Tfrm_caixa.ed_cod_barrasChange(Sender: TObject);
begin

  if ((trim(ed_cod_barras.Text) ='010101') and (dm.qry_movimento_mesa.IsEmpty) ) then
  begin
   if tipo_cupom = 1 then
    muda_acao(2)
   else
    muda_acao(1);
   ed_cod_barras.Clear;
  end;

end;

procedure Tfrm_caixa.muda_acao(tipo : integer);
begin
  case tipo of
    1: begin
         tipo_cupom:=1;
         lb_nome_fantasia.Caption:=nome_fantasia;
       end;
    2: begin
         tipo_cupom:=2;
         lb_nome_fantasia.Caption:=razao_social;
       end;
  end;


end;

procedure Tfrm_caixa.B30001001KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
  begin

        ed_cod_produto.Clear;
//        ed_descricao_produto.clear;
//        ed_valor_produto.Text:='0,00';
        ed_quantidade.text:='1,0';
        ed_cod_barras.CLEAR;
        ed_cod_barras.SetFocus;
        foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
  end;
end;

procedure Tfrm_caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not fecha Then
  Action := caNone Else
  Action := caFree;
  tipo_cupom:=1;

end;

Function Tfrm_caixa.GetStateK (Key: integer): boolean;
begin
Result := Odd (GetKeyState (Key));
end;











end.


