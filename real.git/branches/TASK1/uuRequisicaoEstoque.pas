unit uuRequisicaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, 
   Grids, DBGrids, RXDBCtrl, ibquery, Data.DB, RxCurrEdit, RxToolEdit;

type
  TfrmRequisicaoEstoque = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    frmRequisicaoEstoque: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    edCodDepartamento: TEdit;
    Label3: TLabel;
    btPesqDepartamento: TSpeedButton;
    Panel9: TPanel;
    edDescDepartamento: TDBEdit;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label10: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    bt_pesq_un_entrada: TSpeedButton;
    Label18: TLabel;
    Label41: TLabel;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    edEstoqueCompletoItem: TEdit;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    ed_desc_un_entrada: TEdit;
    BitBtn1: TBitBtn;
    ed_cod_item: TEdit;
    EDIquantidade: TCurrencyEdit;
    ed_cod_un_entrada: TEdit;
    edRequisitadoPor: TEdit;
    Label5: TLabel;
    Panel4: TPanel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label30: TLabel;
    Label1: TLabel;
    edUsuarioEntrada: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label6: TLabel;



procedure adicionaItemCompra(              ordem : string;
                                           codigo : string;
                                           descricao : string;
                                           quantidade : double;
                                           codUnidade : string;
                                           paramUnidade : double;
                                           descUnidade : string) ;
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

   procedure limpaEditsItem();
   function  verificaValidadeLancamentoItemCompra() : boolean;

   procedure atualizaItemEstoque(codItem : string; quantidade : double; parametroUnidCompra : double ; valorUnitario : double; data : string);

  procedure gravarInformacoes();
  procedure gravarItensRequisicao(codRequisicao : string);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmRequisicaoEstoque: TfrmRequisicaoEstoque;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}


procedure TfrmRequisicaoEstoque.adicionaItemCompra(              ordem : string;
                                           codigo : string;
                                           descricao : string;
                                           quantidade : double;
                                           codUnidade : string;
                                           paramUnidade : double;
                                           descUnidade : string) ;

begin

  dm.tbComprasTemp.Append;
  dm.tbComprasTempordem.Value :=ordem;
  dm.tbComprasTempcodigo.value:= codigo;
  dm.tbComprasTempdescricao.value:= descricao;
  dm.tbComprasTempquantidade.value:= quantidade;
  dm.tbComprasTempcodUnidade.value:= codUnidade;
  dm.tbComprasTempparamUnidade.value:= paramUnidade;
  dm.tbComprasTempdescUnidade.value:= descUnidade;
  dm.tbComprasTemp.Post;
  DBGrid1.Refresh;
end;


procedure TfrmRequisicaoEstoque.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if verificaValidadeLancamentoItemCompra() then
   begin
     adicionaItemCompra(FormatFloat('000',dm.tbComprasTemp.RecordCount+1),
                       ed_cod_item.text,
                       ed_desc_item.text,
                       EDIquantidade.value,
                       ed_cod_un_entrada.text,
                       getParametroUnidade(ed_cod_un_entrada.Text),
                       ed_desc_un_entrada.text);
                       limpaEditsItem;
                       ed_cod_item.SetFocus;

   end;


end;

procedure TfrmRequisicaoEstoque.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active:=true;
  edCodDepartamento.SetFocus;

end;

procedure TfrmRequisicaoEstoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if odd(dm.tbComprasTemp.RecNo) then
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
  Font.Size :=   Font.Size + 2;
  Lineto(10,30);
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;



procedure TfrmRequisicaoEstoque.limpaEditsItem();
begin
  ed_desc_item.clear;
  ed_cod_item.clear;

  EDIquantidade.value:=0;
  ed_cod_un_entrada.Clear;
  ed_desc_un_entrada.clear;
end;


procedure TfrmRequisicaoEstoque.atualizaItemEstoque(codItem : string; quantidade : double; parametroUnidCompra : double ; valorUnitario : double; data : string);
var
 novoValorUnitario : double;
 parametroPadraoItem : double;
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  parametroPadraoItem:=getParametroUnidade(getUnidadeEntradaItem(codItem));
  novoValorUnitario:= ( ( parametroPadraoItem * valorUnitario) / parametroUnidCompra);

  q.Active:=false;
  q.sql.clear;
  q.sql.add('update produtos set ');
  q.sql.add(' estoque_liquido        = estoque_liquido - '+dm.TrocaVirgPPto(FloatToStr(quantidade))+' ');
  q.sql.add(' where cod_produto         ='+QUotedstr(codItem));
  q.execsql;

end;




function TfrmRequisicaoEstoque.verificaValidadeLancamentoItemCompra() : boolean;
begin
  if verificaExistenciaItemEstoque(ed_cod_item.Text ,1) = false then
   begin
    showmessage('Código de ítem informado não existe!');
    limpaEditsItem();
    ed_cod_item.Clear;
    result:=false;
    exit;
   end;


  if (verificaExistenciaUnidade(ed_cod_un_entrada.Text) =  false) then
  begin
    showmessage('A unidade informada não é válida!');
    ed_cod_un_entrada.SetFocus;
    Result:=false;
    exit;
  end;

  if (EDIquantidade.Value  <= 0) then
  begin
    Showmessage('Quantidade deve ser superior a ZERO!');
    EDIquantidade.SetFocus;
    result:=false;
    exit;
  end;        

  Result:=true;
end;


procedure TfrmRequisicaoEstoque.gravarInformacoes();
var
 codigoRequisicao : string;
 codDepartamento : string;
 respRequisicao : string;
begin

  codDepartamento := edCodDepartamento.Text;
  respRequisicao  :=  edRequisitadoPor.Text;


  if (evento = 1) then
   begin
    codigoRequisicao :=  dm.geraCodigo('G_REQUISICAO_ESTOQUE',8);
    codigoRequisicao := inttostr(strToInt(codigoRequisicao));
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('insert into requisicoes_estoque (codigo, data_requisicao, data_baixa, cod_departamento, resp_requisicao, usuario_requisitou, status) values (');
    dm.qryauxiliar.SQL.Add(codigoRequisicao+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
    dm.qryauxiliar.SQL.Add(''+codDepartamento+',');
    dm.qryauxiliar.SQL.Add(''+QuotedStr(respRequisicao)+',');
    dm.qryauxiliar.SQL.Add(''+QuotedStr(nome_usuario)+',');
    dm.qryauxiliar.SQL.Add(''+'1)');

    try
     begin
       dm.qryauxiliar.ExecSQL;
     end;
    except
      begin
        dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de Produtos ','Erro incluir produto ',codigo_usuario);
        exit;
      end;
    end;
    gravarItensRequisicao(codigoRequisicao);

    showmessage('Requisição efetuada com sucesso!');
   end;
end;








procedure TfrmRequisicaoEstoque.gravarItensRequisicao(codRequisicao : string);
var
 q : TIBQuery;
 ordem : integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.sql.Add('delete from ITENS_REQUISICAO_ESTOQUE where cod_requisicao='+codRequisicao);
  q.ExecSQL;
  q.Active:=false;
  q.SQL.Clear;

  dm.tbComprasTemp.First;
  ordem :=1;
  while not dm.tbComprasTemp.Eof do
  begin
    q.sql.clear;
    q.SQL.Add('insert into ITENS_REQUISICAO_ESTOQUE ( ');
    q.SQL.Add('    COD_REQUISICAO, ');
    q.SQL.Add('    COD_ITEM, ');
    q.SQL.Add('    QUANTIDADE,  ');
    q.SQL.Add('    COD_UNIDADE,    ');
    q.SQL.Add('    DESCRICAO_UNIDADE, ');
    q.SQL.Add('    ESTOQUE_ANTERIOR,');
    q.SQL.Add('    COD_UNIDADE_ESTOQUE_ANTERIOR,');
    q.SQL.Add('    ESTOQUE_ATUALIZADO,');
    q.SQL.Add('    DESCRICAO_ITEM,');
    q.SQL.Add('    ORDEM) values (');
    q.SQL.Add(''+codRequisicao+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempcodigo.Value)+',');
    q.SQL.Add('' +dm.TrocaVirgPPto(dm.tbComprasTempquantidade.AsString)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempcodUnidade.Value)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempdescUnidade.Value)+',');
    q.sql.add('' +dm.TrocaVirgPPto(floattostr(getEstoqueAtualItemEstoque(dm.tbComprasTempcodigo.Value)))+',');
    q.sql.add('' +Quotedstr(getUnidadeEntradaItem(dm.tbComprasTempcodigo.Value)  )+',');


    if ( evento = 1 ) then
     begin
       atualizaItemEstoque(dm.tbComprasTempcodigo.Value,( dm.tbComprasTempquantidade.value * dm.tbComprasTempparamUnidade.value) ,
                           dm.tbComprasTempparamUnidade.value,0,FormaTdateTime('DD.MM.YYY',data_do_sistema));
     end;


    q.sql.add('' +dm.TrocaVirgPPto(floattostr(getEstoqueAtualItemEstoque(dm.tbComprasTempcodigo.Value)))  +',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempdescricao.AsString )+',');
    q.sql.add('' +Quotedstr(IntToStr(ordem))+')');

    try
     begin
       q.ExecSQL;
     end;
    except
      begin
        dm.cria_log_de_erros(q.sql,'Requisicao de estoque ','Erro incluir produto na requisicao',codigo_usuario);
        exit;
      end;
    end;


    ordem := ordem+1;
    dm.tbComprasTemp.next;
  end;
end;




procedure TfrmRequisicaoEstoque.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  limpaEditsItem;
  edCodDepartamento.Clear;
  edDescDepartamento.Clear;
  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active:=true;

end;

procedure TfrmRequisicaoEstoque.bt_gravarClick(Sender: TObject);
begin

  gravarInformacoes();

  inherited;

end;

end.
