unit uu_cs_produtos;

interface

uses
  Windows, Messages,db, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils ,
  Dialogs, StdCtrls,  ExtCtrls, DBGrids,
  Buttons, cxGraphics, cxControls,
  cxStyles,
  cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGrid, AdvGlassButton, AdvSmoothTouchKeyBoard, Vcl.Menus,
  JvPageList, JvExControls, Vcl.ActnList, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator,
  cxDBData, System.Actions, cxGridTableView, cxGridCustomView, cxCustomData,
  cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations;

type
  Tfrm_consulta_produtos = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ed_descricao_produto: Tedit;
    Label3: TLabel;
    Panel1: TPanel;
    lbTitulo: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    PopupMenu1: TPopupMenu;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    actExecutaConsulta: TAction;
    Panel5: TPanel;
    JvPageList1: TJvPageList;
    pgTabelaPadrao: TJvStandardPage;
    gridTabelaPadrao: TcxGrid;
    gridTabelaPadraoDBTableView1: TcxGridDBTableView;
    gridTabelaPadraoDBTableView1COD_BARRAS: TcxGridDBColumn;
    s: TcxGridDBColumn;
    gridTabelaPadraoDBTableView1Column2: TcxGridDBColumn;
    gridTabelaPadraoDBTableView1Column1: TcxGridDBColumn;
    gridTabelaPadraoDBTableView1VALOR_UNITARIO: TcxGridDBColumn;
    gridTabelaPadraoLevel1: TcxGridLevel;
    pgTabelaAcessoria: TJvStandardPage;
    gridTabelaAcessoria: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnTeclado: TPanel;
    AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard;
    procedure FormActivate(Sender: TObject);
    procedure ed_descricao_produtoChange(Sender: TObject);



    procedure bt_selecionarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure ed_descricao_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridTabelaPadraoDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridTabelaPadraoDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure gridTabelaPadraoDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actExecutaConsultaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consulta_produtos: Tfrm_consulta_produtos;
  tipo_consulta : integer;

implementation

uses uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

procedure Tfrm_consulta_produtos.FormActivate(Sender: TObject);
begin
  dm.qryConsultaProdutos.Active:=false;
  dm.qryConsultaProdutos.SQL.Clear;

 case dm.getTabelaPrecoAtual.codigo  of
   0: begin
        lbTitulo.Caption := 'Consulta de produtos ( Tabela Padrão )';
        pgTabelaPadrao.show;
      end;
   else
     begin
        lbTitulo.Caption := 'Consulta de produtos ( '+dm.getTabelaPrecoAtual.descricao+ ')';
        pgTabelaAcessoria.show;
     end;
 end;
   actExecutaConsulta.Execute;
   ed_descricao_produto.SetFocus;


end;

procedure Tfrm_consulta_produtos.SpeedButton1Click(Sender: TObject);
begin
//  AdvPopupTouchKeyBoard1.ShowAtXY(self,self.Width + 200 ,self.Top + 300 );
 if pnTeclado.Visible = false  then
  begin
    pnTeclado.Visible := true;
    Panel5.Repaint;
    ed_descricao_produto.SetFocus;
  end
 else
  begin
    pnTeclado.Visible := false;
    Panel5.Repaint;
    ed_descricao_produto.SetFocus;
  end;

end;

procedure Tfrm_consulta_produtos.ed_descricao_produtoChange(
  Sender: TObject);
begin
  actExecutaConsulta.Execute;
end;

procedure Tfrm_consulta_produtos.ed_descricao_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

if key=vk_return then
  begin


    case AnsiIndexStr(UpperCase( (sender as TComponent).Name), ['ed_descricao_produto', 'cxGrid1'])  of
    0 : begin
         case dm.getTabelaPrecoAtual.codigo  of
          0: begin
              pgTabelaPadrao.Show;
              gridTabelaPadrao.SetFocus;
             end;

          1: begin
              pgTabelaAcessoria.Show;
              gridTabelaAcessoria.SetFocus;
             end;
         end;

        end;
     else
        begin
          btSelecionar.Click;
         end;

    end;

  end;

  if key=vk_escape then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao_produto') then
     begin
        btSair .Click;
     end;

     if  sender is TCXgrid and ((sender as TDBGrid).Name='cxGrid1') then
     begin
        ed_descricao_produto.SetFocus;
     end;
  end;


   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_descricao_produto') then
    begin
      if key = vk_up then
       begin
         dm.qryConsultaProdutos.Prior;
       end;

      if key = vk_down then
       begin
         dm.qryConsultaProdutos.Next;
       end;
    end;

end;

procedure Tfrm_consulta_produtos.actExecutaConsultaExecute(Sender: TObject);
var
 filtroTabela : string;
begin
  dm.qryConsultaProdutos.Active := false;
  dm.qryConsultaProdutos.SQL.Clear;

  case dm.getTabelaPrecoAtual.codigo  of
   0: begin
      filtroTabela :=' select p.cod_produto, p.cod_barras,p.valor_unitario, p.valor_unitario as precoPadrao, p.estoque_liquido  as quantidade'
                     + ' from produtos p where p.vende=1';
      end;
   else
     begin
      filtroTabela :=' select p.cod_produto, p.cod_barras, tb.valor_unitario, p.valor_unitario as precoPadrao, p.estoque_liquido  as quantidade'
                     + ' from produtos_tabela_precos tb '
                     + ' inner join produtos p on (p.cod_produto = tb.cod_produto)'
                     +'  where p.vende=1 and tb.cod_tabela='+Inttostr(dm.getTabelaPrecoAtual.codigo);

     end;
 end;

    dm.qryConsultaProdutos.SQL.add(' select b.cod_produto,b.cod_barras, b.valor_unitario, b.PrecoPadrao, b.cod_grupo_raiz, b.desc_grupo_raiz,b.cod_grupo_pai, b.desc_grupo_pai as grupo, b.cod_grupo, b.desc_grupo,b.descricao, b.quantidade, b.qtdFracao,                       ');
    dm.qryConsultaProdutos.SQL.add(' 	  case                                                                                                                                                                                                                                   ');
    dm.qryConsultaProdutos.SQL.add(' 		   when b.qtdFracao <> 0 then  EstoqueInteiro ||'+Quotedstr(' + ')+'||EstoqueFracionado                                                                                                                                                  ');
    dm.qryConsultaProdutos.SQL.add(' 		   else                                                                                                                                                                                                                              ');
    dm.qryConsultaProdutos.SQL.add(' 			 EstoqueInteiro                                                                                                                                                                                                                  ');
    dm.qryConsultaProdutos.SQL.add(' 	  end as estoque                                                                                                                                                                                                                         ');
    dm.qryConsultaProdutos.SQL.add('                                                                                                                                                                                                                                             ');
    dm.qryConsultaProdutos.SQL.add('  from (                                                                                                                                                                                                                                     ');
    dm.qryConsultaProdutos.SQL.add(' 	 select t.cod_produto, t.cod_barras, t.valor_unitario, t.precoPadrao, rg.cod_grupo_raiz, rg.desc_grupo_raiz,rg.cod_grupo_pai,rg.desc_grupo_pai,rg.cod_grupo, trim(rg.descricao) desc_grupo,p.descricao, t.quantidade,                    ');
    dm.qryConsultaProdutos.SQL.add(' 			   udf_replace(cast(cast( (  udf_int (t.quantidade  / un2.parametro)) as numeric(10,5))  as varchar(15)),'+Quotedstr('.')+','+Quotedstr(',')+')||'+Quotedstr(' ')+'||un2.descricao as EstoqueInteiro,                                        ');
    dm.qryConsultaProdutos.SQL.add(' 			   udf_replace(cast(cast((( udf_frac(t.quantidade  / un2.parametro) * un2.parametro)/un3.parametro) as numeric(10,2)) as varchar(15)),'+Quotedstr('.')+','+Quotedstr(',')+')  ||'+Quotedstr(' ')+'||un3.descricao EstoqueFracionado,         ');        dm.qryConsultaProdutos.SQL.add(' 				udf_int (t.quantidade  / un2.parametro) as qtdInteira,                                                                                                                                                                       ');
    dm.qryConsultaProdutos.SQL.add(' 			   ((udf_frac(t.quantidade  / un2.parametro) * un2.parametro)/un3.parametro) as qtdFracao                                                                                                                                        ');
    dm.qryConsultaProdutos.SQL.add(' 	                                                                                                                                                                                                                                         ');
    dm.qryConsultaProdutos.SQL.add(' 		   from (                                                                                                                                                                                                                            ');
    dm.qryConsultaProdutos.SQL.add(filtroTabela);
    dm.qryConsultaProdutos.SQL.add(' 					) t                                                                                                                                                                                                                      ');
    dm.qryConsultaProdutos.SQL.add(' 			inner join produtos p on (p.cod_produto = t.cod_produto )                                                                                                                                                                        ');
    dm.qryConsultaProdutos.SQL.add(' 			inner join unidades un2 on (un2.cod_unidade = p.unidade_entrada)                                                                                                                                                                 ');
    dm.qryConsultaProdutos.SQL.add(' 			inner join unidades un3 on (un3.cod_unidade = p.cod_unidade_fracao)                                                                                                                                                              ');
    dm.qryConsultaProdutos.SQL.add(' 			inner join r_grupos rg on (rg.cod_grupo = p.cod_grupo)                                                                                                                                                                           ');
    dm.qryConsultaProdutos.SQL.add(' 			) b                                                                                                                                                                                                                              ');
    dm.qryConsultaProdutos.SQL.Add('      where b.descricao like '+Quotedstr('%'+ed_descricao_produto.Text+'%'));
    dm.qryConsultaProdutos.SQL.Add('      or b.cod_barras like '+Quotedstr('%'+ed_descricao_produto.Text+'%'));
    dm.qryConsultaProdutos.SQL.add(' 			order by  b.descricao,  b.cod_grupo_raiz, b.cod_grupo_pai, b.cod_grupo ');



   //////dm.adicionalog(dm.qryConsultaProdutos.SQL.Text);
   dm.qryConsultaProdutos.Active:=true;

end;

procedure Tfrm_consulta_produtos.btSairClick(Sender: TObject);
begin

    string_auxiliar:='';
  close;
end;

procedure Tfrm_consulta_produtos.btSelecionarClick(Sender: TObject);
begin
  try
   begin
    string_auxiliar:=dm.qryConsultaProdutos.fieldbyname('cod_produto').Value;
    string_aux_cod_barras:=dm.qryConsultaProdutos.fieldbyname('cod_barras').Value;
   end;
  except
   begin
     showmessage('Seleção inválida!');
     ed_descricao_produto.SetFocus;
     exit;
   end;
  end;
  close;
end;

procedure Tfrm_consulta_produtos.bt_selecionarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_escape then
 begin
   btSair.Click;

 end;


end;




procedure Tfrm_consulta_produtos.gridTabelaPadraoDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btSelecionar.Click;
end;

procedure Tfrm_consulta_produtos.gridTabelaPadraoDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Selected then
  begin
    ACanvas.Brush.Color := 12615680;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure Tfrm_consulta_produtos.gridTabelaPadraoDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN  then
    btSelecionar.Click ;

  if key = VK_ESCAPE  then
    ed_descricao_produto.SetFocus;
end;

end.



