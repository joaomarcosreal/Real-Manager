unit uuTransformacaoSubmateria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, 
   Grids, DBGrids,ibquery, Data.DB, RxToolEdit, RxCurrEdit;

type
  TfrmTransformacoesSubmateria = class(Tfrm_modelo_cadastro)
    Label1: TLabel;
    pnItem: TPanel;
    btPesqSubmateria: TSpeedButton;
    Label22: TLabel;
    Panel7: TPanel;
    Label21: TLabel;
    edDescricaoSubmateria: TEdit;
    edCodSubmateria: TEdit;
    btAtualizar: TBitBtn;
    edQuantidade: TCurrencyEdit;
    Label2: TLabel;
    Panel4: TPanel;
    dbg_ficha_tec: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    edEstoqueSubmateria: TEdit;
    procedure bt_novoClick(Sender: TObject);
    procedure AtualizaFichaTecnica();
    procedure btAtualizarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    function  verificaValidade() : boolean;
    procedure dbg_ficha_tecDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gravarTransformacao();
    procedure SpeedButton1Click(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransformacoesSubmateria: TfrmTransformacoesSubmateria;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal;

{$R *.dfm}

procedure TfrmTransformacoesSubmateria.bt_novoClick(Sender: TObject);
begin
  inherited;
  edQuantidade.Value :=1;
  pnItem.Enabled:=true;
  pn_codigo.Enabled:=false;
  dm.composicoes_temp.EmptyTable;
  dm.tbComprasTemp.Active:=true;
  bt_gravar.Enabled:=false;
  edCodSubmateria.Enabled:=true;
  edQuantidade.Enabled:=true;
  btAtualizar.Enabled:=true;
  btPesqSubmateria.Enabled:=true;
  edCodSubmateria.SetFocus;



end;

procedure TfrmTransformacoesSubmateria.AtualizaFichaTecnica();
begin

     dm.qryauxiliar2.Active:=false;
     dm.qryauxiliar2.SQL.Clear;


     

     dm.qryauxiliar2.SQL.add(' select cp.cod_produto,cp.cod_produto_baixa,cp.quantidade,cp.unidade, p.descricao,u.parametro,u.descricao as descUnidade from composicoes_produto cp ');
     dm.qryauxiliar2.SQL.add('    inner join produtos p on (p.cod_produto = cp.cod_produto_baixa) ');
     dm.qryauxiliar2.SQL.add('    inner join unidades u on (u.cod_unidade = cp.unidade) ');
     dm.qryauxiliar2.SQL.add('    where cp.cod_produto='+Quotedstr(edCodSubmateria.Text));
     dm.composicoes_temp.EmptyTable;
     dm.qryauxiliar2.Active:=true;
     dm.qryauxiliar2.First;
     dm.composicoes_temp.Active:=true;
     while not dm.qryauxiliar2.Eof do
     begin
       dm.composicoes_temp.Append;
       dm.composicoes_tempcod_item.value:=dm.qryauxiliar2.fieldbyname('cod_produto').value;
       dm.composicoes_tempcod_produto.value:=dm.qryauxiliar2.fieldbyname('cod_produto_baixa').value;
       dm.composicoes_tempquantidade.Value:=( (dm.qryauxiliar2.fieldbyname('quantidade').value / dm.qryauxiliar2.fieldbyname('parametro').value) *  edQuantidade.value) ;
       dm.composicoes_tempdes_unidade.Value:=dm.qryauxiliar2.fieldbyname('descUnidade').value;
       dm.composicoes_tempUnidade.Value:=dm.qryauxiliar2.fieldbyname('unidade').value;
       dm.composicoes_tempdescricao_item.Value:=dm.qryauxiliar2.fieldbyname('descricao').value;
       dm.composicoes_temp.Post;
       dm.composicoes_temp.Refresh;
       dm.composicoes_temp.Refresh;
       dm.qryauxiliar2.Next;
     end;
end;


procedure TfrmTransformacoesSubmateria.btAtualizarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade() = true then
   begin
    AtualizaFichaTecnica();
    edCodSubmateria.Enabled:=false;
    edQuantidade.Enabled:=false;
    btAtualizar.Enabled:=false;
    bt_gravar.Enabled:=true;
    btPesqSubmateria.Enabled:=false;
   end;


end;

procedure TfrmTransformacoesSubmateria.bt_cancelarClick(Sender: TObject);
begin                                                       
  inherited;
  edQuantidade.Value:=1;
  dm.composicoes_temp.EmptyTable;
  dm.composicoes_temp.Active:=false;
  dm.composicoes_temp.Active:=true;
end;

function TfrmTransformacoesSubmateria.verificaValidade() : boolean;
begin

  if ( verificaSeItemEhSubmateria(edCodSubmateria.Text) = false ) then
   begin
     edCodSubmateria.Clear;
     edDescricaoSubmateria.Clear;
     edCodSubmateria.SetFocus;
     ShowMessage('O produto informado não é uma submatéria-prima');
     Result:=false;
   end;


  if (edQuantidade.Value <= 0) then
   begin
     ShowMessage('Quantidade inválida!');
     edQuantidade.Value:=1;
     edQuantidade.SetFocus;
     Result:=false;
   end;


  Result:=true;
end;


procedure TfrmTransformacoesSubmateria.dbg_ficha_tecDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if odd(dm.composicoes_temp.RecNo) then
    dbg_ficha_tec.Canvas.Brush.Color:= clwhite
  else
    dbg_ficha_tec.Canvas.Brush.Color:= clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmTransformacoesSubmateria.gravarTransformacao();
var
 q : TIBquery;
 codTransformacao : string;
begin
  q := TIBquery.create(self);
  q.database:= dm.dbrestaurante;
  q.transaction:= dm.transacao;
  q.active:=false;
  q.sql.clear;

  dm.transacao.Active:=true;


  // grava a transformação


  codTransformacao := inttostr(strToInt(dm.geraCodigo('G_TRANSFORMACOES',5)));
  q.SQL.Add('insert into transformacoes_submateria (codigo,   cod_usuario,    cod_item_submateria,   quantidade) values (');
  q.SQL.add(codTransformacao+',');
  q.SQL.add(Quotedstr(codigo_usuario)+',');
  q.SQL.add(Quotedstr(edCodSubmateria.text)+',');
  q.SQL.Add(dm.TrocaVirgPPto(floattostr(edQuantidade.Value))+')');
  dm.adicionaLog(q.SQL.Text);

  q.ExecSQL;


  // Abate estoque

  dm.transacaoProcedure.Active:=false;
  dm.transacaoProcedure.Active:=true;
  dm.proc_abate_submateria.Active:=false;
  dm.proc_abate_submateria.Params[0].Value:=edCodSubmateria.Text;
  dm.proc_abate_submateria.Params[1].Value:=edQuantidade.Value;
  dm.proc_abate_submateria.Params[2].Value:=DateToStr(data_do_sistema);
  dm.proc_abate_submateria.Params[3].Value:=nome_usuario;



  dm.proc_abate_submateria.ExecProc;
  dm.transacaoProcedure.commit;


  // Atualiza estoque

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.add('  update produtos t ');
  q.SQL.add('   set t.estoque_liquido = t.estoque_liquido + (select un.parametro ');
  q.SQL.add('    from unidades un where un.cod_unidade = t.unidade_entrada) * '+dm.TrocaVirgPPto(floattostr(edQuantidade.Value)));
  q.SQL.add('        where t.cod_produto='+QuotedStr(edCodSubmateria.Text));
  dm.adicionaLog(q.Text);
  q.ExecSQL;


  // Grava ítens da transformação

  dm.composicoes_temp.First;

  while not dm.composicoes_temp.eof do
   begin
     q.Active := false;
     q.SQL.clear;
     q.sql.add('insert into itens_transformacoes (cod_transformacao,cod_submateria,cod_item_baixado,cod_unidade_baixa,quantidade) values (');
     q.sql.add(codTransformacao+',');
     q.sql.add(QuotedStr(edCodSubmateria.Text)+',');
     q.sql.add(QuotedStr(dm.composicoes_tempcod_item.Value)+',');
     q.sql.add(QuotedStr(dm.composicoes_tempUnidade.Value)+',');
     q.SQL.Add( dm.TrocaVirgPPto(FloatToStr(dm.composicoes_tempquantidade.Value))+')');
      dm.adicionaLog(q.Text);
     q.ExecSQL;
     dm.composicoes_temp.Next;
   end;



  dm.transacao.Commit;

  FreeAndNil(q);
end;







procedure TfrmTransformacoesSubmateria.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dm.composicoes_temp.EmptyTable;
  dm.tbComprasTemp.Active:=true;
  bt_gravar.Enabled:=false;
  edCodSubmateria.Enabled:=true;
  edQuantidade.Enabled:=true;
  btAtualizar.Enabled:=true;
  btPesqSubmateria.Enabled:=true;
  
end;

procedure TfrmTransformacoesSubmateria.bt_gravarClick(Sender: TObject);
begin
  if dm.composicoes_temp.IsEmpty then
   begin
     Showmessage('Não existe ficha técnica definida para esta transformação!!');
     exit;
   end
  else
   begin

     if (MessageDlg('Confirma transformação ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
       gravarTransformacao();

       ShowMessage('Transformação realizada com sucesso!');
      end;

   end;
  inherited;

end;

end.
