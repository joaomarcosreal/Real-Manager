unit uuSelecionaProdutosVendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,
  DB, RxMemDS, ImgList, Menus, RxMenus, System.ImageList, Vcl.ActnList,
  System.Actions;

type
  TfrmSelecionaProdutosVendidos = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    tbGruposTouch: TRxMemoryData;
    tbGruposTouchcodGrupo: TStringField;
    tbGruposTouchdescricao: TStringField;
    tbGruposTouchordem: TIntegerField;
    dsGruposTouch: TDataSource;
    tbProdutos: TRxMemoryData;
    tbProdutosdescricao: TStringField;
    tbProdutospreco: TCurrencyField;
    dsProdutos: TDataSource;
    img: TImageList;
    DBGrid2: TDBGrid;
    tbProdutosvende: TSmallintField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RxPopupMenu1: TRxPopupMenu;
    Operaorealizada1: TMenuItem;
    Operaonorealizda1: TMenuItem;
    Panel3: TPanel;
    Label15: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    tbGruposTouchdisponivel: TSmallintField;
    tbProdutosCFOP: TStringField;
    tbProdutosCST: TStringField;
    tbProdutosNCM: TStringField;
    tbProdutosaliquota: TStringField;
    RetirardoGrupo1: TMenuItem;
    tbProdutoscodGrupo: TStringField;
    tbProdutosCodProduto: TStringField;
    tbProdutosCEST: TStringField;
    tbProdutoscodBarras: TStringField;

    procedure mostraProdutosGrupo(codGrupo : string);                   
    procedure mostraGrupos();
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure Operaonorealizda1Click(Sender: TObject);
    procedure Operaorealizada1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RetirardoGrupo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaProdutosVendidos: TfrmSelecionaProdutosVendidos;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmSelecionaProdutosVendidos.mostraGrupos();
begin
  inherited;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.sql.Add('select * from grupos_touch where codigo <> '+Quotedstr('00')+' order by descricao');
  dm.qryauxiliar.Active := true;

  tbGruposTouch.Active := false;
  tbGruposTouch.EmptyTable;
  tbGruposTouch.Active := true;

  dm.qryauxiliar.First;

  while not dm.qryauxiliar.Eof do
   begin
     tbGruposTouch.Append;
     tbGruposTouchcodGrupo.Value   := dm.qryauxiliar.fieldbyname('codigo').Value;
     tbGruposTouchdescricao.Value  := dm.qryauxiliar.fieldbyname('descricao').Value;
     tbGruposTouchordem.Value      := dm.qryauxiliar.fieldbyname('ordem').Value;


     dm.qryauxiliar2.Active := false;
     dm.qryauxiliar2.Sql.Clear;
     dm.qryauxiliar2.SQL.add('select cod_produto from produtos p where p.vende=1 and p.cod_grupo_touch='+Quotedstr(dm.qryauxiliar.fieldbyname('codigo').value));
     dm.qryauxiliar2.Active := true;
     if dm.qryauxiliar2.IsEmpty then
      tbGruposTouchdisponivel.Value := 0
     else
      tbGruposTouchdisponivel.Value := 1;
     dm.qryauxiliar2.Active := false;




     tbGruposTouch.Post;
     dm.qryauxiliar.next;
   end;

   tbGruposTouch.First;
   mostraProdutosGrupo(tbGruposTouchcodGrupo.value);

end;

procedure TfrmSelecionaProdutosVendidos.mostraProdutosGrupo(codGrupo : string);
begin
  tbProdutos.Active := false;
  tbProdutos.EmptyTable;
  tbProdutos.Active := true;

  dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' select p.cod_produto, coalesce(p.cod_barras,'+Quotedstr('')+') as cod_barras, p.cod_grupo_touch, p.descricao, p.valor_unitario, ');
  dm.qryauxiliar.SQL.Add('   p.vende,coalesce(p.ncm,'+Quotedstr('')+') as ncm, coalesce(p.cest,'+Quotedstr('')+')as cest ,p.cst_saida,p.cfop_saida, al.percentagem from produtos p ');
  dm.qryauxiliar.SQL.Add('    inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota) ');
  dm.qryauxiliar.SQL.Add('   where p.cod_grupo_touch='+Quotedstr(codGrupo));
  dm.adicionaLog(dm.qryauxiliar.SQL.Text);
  dm.qryauxiliar.Active := true;

  dm.qryauxiliar.First;

  while not dm.qryauxiliar.Eof do
   begin
     tbProdutos.Append;
     tbProdutoscodGrupo.Value   := dm.qryauxiliar.fieldbyname('cod_grupo_touch').Value;
     tbProdutoscodProduto.Value := dm.qryauxiliar.fieldbyname('cod_produto').Value;
     tbProdutoscodBarras.Value  := dm.qryauxiliar.fieldbyname('cod_barras').Value;
     tbProdutosdescricao.Value  := dm.qryauxiliar.fieldbyname('descricao').Value;
     tbProdutospreco.Value      := dm.qryauxiliar.fieldbyname('valor_unitario').Value;
     tbProdutosvende.Value      := dm.qryauxiliar.fieldbyname('vende').Value;
     tbProdutosNCM.Value        := dm.qryauxiliar.fieldbyname('ncm').value;
     tbProdutosCEST.Value        := dm.qryauxiliar.fieldbyname('CEST').value;
     tbProdutosCFOP.Value       := dm.qryauxiliar.fieldbyname('cfop_saida').value;


     tbProdutosCST.Value        := dm.qryauxiliar.fieldbyname('cst_saida').value;
     tbProdutosaliquota.Value   := dm.qryauxiliar.fieldbyname('percentagem').value;

     dm.qryauxiliar.Next;
   end;
   tbProdutos.First;
end;

procedure TfrmSelecionaProdutosVendidos.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;


    if Column.FieldName = 'disponivel' then
   begin


     if ( trim(Column.Field.AsString) = '1' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clLime;
        DBGrid1.Canvas.Font.Color := clBlack;

        TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

      end
     else
      begin
        DBGrid1.Canvas.Brush.Color := clRed;
        DBGrid1.Canvas.Font.Color := clBlack;
        TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

      end;

   end;




end;

procedure TfrmSelecionaProdutosVendidos.DBGrid2DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if tbProdutos  .IsEmpty then
   exit;



  if Column.FieldName = 'codGrupo' then
   begin


     if ( trim(Column.Field.AsString) = '' ) then
      begin
        DBGrid2.Canvas.Brush.Color := clred;
        DBGrid2.Canvas.Font.Color := clwhite;
        DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      end;
   end;

   if Column.FieldName = 'vende' then
   begin
     if ( StrToInt(Column.Field.AsString) = 1 ) then
      begin
        img.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top+1,0);
      end
     else
      begin
        img.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top+1,1);
      end;

    end
   else
    begin

    end;




end;

procedure TfrmSelecionaProdutosVendidos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  mostraProdutosGrupo(tbGruposTouchcodGrupo.Value);
end;

procedure TfrmSelecionaProdutosVendidos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  tbProdutos.First;

  while not tbProdutos.Eof do
   begin
     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.SQL.clear;
     dm.qryauxiliar.sql.Add('update produtos p set p.vende='+Inttostr(tbProdutosvende.Value)+',');
     dm.qryauxiliar.sql.add(' p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(tbProdutospreco.Value ))+',');
     dm.qryauxiliar.sql.add(' p.ncm='+Quotedstr(tbProdutosNCM.Value)+',');
     dm.qryauxiliar.sql.add(' p.cod_barras= udf_strzero('+Quotedstr(tbProdutoscodBarras.Value)+',5),');
     dm.qryauxiliar.sql.add(' p.cest='+Quotedstr(tbProdutosCEST.Value)+',');
     dm.qryauxiliar.sql.add(' p.cod_grupo_touch='+Quotedstr(tbProdutoscodGrupo.Value)+',');
     dm.qryauxiliar.sql.add(' p.descricao='+Quotedstr(tbProdutosdescricao  .Value));

     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(tbProdutoscodProduto.Value));
     dm.adicionaLog(dm.qryauxiliar.SQL.Text);
     dm.qryauxiliar.ExecSQL;
     tbProdutos.Next;
   end;

  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  mostraGrupos();
  mostraProdutosGrupo(tbGruposTouchcodGrupo.Value);
end;

procedure TfrmSelecionaProdutosVendidos.Operaonorealizda1Click(
  Sender: TObject);
begin
  inherited;
    tbProdutos.Edit;
    tbProdutosvende.Value := 1;
    tbProdutos.Post;

end;

procedure TfrmSelecionaProdutosVendidos.Operaorealizada1Click(
  Sender: TObject);
begin
  inherited;
    tbProdutos.Edit;
    tbProdutosvende.Value := 0;
    tbProdutos.Post;

end;

procedure TfrmSelecionaProdutosVendidos.BitBtn4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSelecionaProdutosVendidos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  tbProdutos.First;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.Add('update produtos p set p.vende='+Inttostr(1)+' ');
  dm.qryauxiliar.SQL.Add(' where p.cod_grupo_touch='+Quotedstr(tbGruposTouchcodGrupo.Value));
  dm.qryauxiliar.ExecSQL;

  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  mostraGrupos();

end;

procedure TfrmSelecionaProdutosVendidos.BitBtn3Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  tbProdutos.First;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.Add('update produtos p set p.vende='+Inttostr(0)+'');
  dm.qryauxiliar.SQL.Add(' where p.cod_grupo_touch='+Quotedstr(tbGruposTouchcodGrupo.Value));
  dm.qryauxiliar.ExecSQL;

  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  mostraGrupos();
end;

procedure TfrmSelecionaProdutosVendidos.FormActivate(Sender: TObject);
begin
  inherited;
  mostraGrupos();

end;

procedure TfrmSelecionaProdutosVendidos.RetirardoGrupo1Click(
  Sender: TObject);
begin
  inherited;


 if ( dialogConfirmacao('Confirmação ','Confirma remoção do produto ?',20) = true ) then
   begin
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.add('update produtos p set p.cod_grupo_touch='+Quotedstr('')+' where p.cod_produto='+Quotedstr(tbProdutosCodProduto.Value) );
    dm.qryauxiliar.ExecSQL;
    dm.transacao.commit;
    tbProdutos.Delete;
    DBGrid1.Refresh;
   end;

end;

end.
