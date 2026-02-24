unit uu_cad_itens_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, 
   Grids, DBGrids, AdvPageControl, ComCtrls, Menus, Data.DB, RxToolEdit,
  RxCurrEdit;

type
  Tfrm_cad_itens_estoque = class(Tfrm_modelo_cadastro)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    pgControl: TAdvPageControl;
    AdvTabSheet4: TAdvTabSheet;
    pageFicha: TAdvTabSheet;
    pnFichaTecnica: TPanel;
    Panel4: TPanel;
    dbg_ficha_tec: TDBGrid;
    Panel5: TPanel;
    Label20: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label22: TLabel;
    bt_pesq_un_saida: TSpeedButton;
    Label23: TLabel;
    Panel7: TPanel;
    Label21: TLabel;
    ed_desc_item: TEdit;
    Panel10: TPanel;
    Label24: TLabel;
    ed_desc_un_saida: TEdit;
    ed_cod_item: TEdit;
    ed_qtd_item: TCurrencyEdit;
    ed_cod_un_saida: TEdit;
    BitBtn1: TBitBtn;
    pn_informacoes_item: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    bt_pesq_grupo: TSpeedButton;
    bt_pesq_un_entrada: TSpeedButton;
    btPesqUnFracao: TSpeedButton;
    Label7: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    bt_pesq_cst: TSpeedButton;
    Label19: TLabel;
    Label17: TLabel;
    bt_pesq_cfop: TSpeedButton;
    Label34: TLabel;
    Label18: TLabel;
    ed_data_cadastro: TDBEdit;
    ed_data_reposicao: TDBEdit;
    Panel1: TPanel;
    ed_desc_grupo: TDBEdit;
    ed_cod_grupo: TDBEdit;
    ed_descricao_item: TDBEdit;
    ed_cod_un_entrada: TDBEdit;
    Panel2: TPanel;
    ed_desc_un_entrada: TDBEdit;
    ed_qte_minima: TDBEdit;
    ed_qtde_max: TDBEdit;
    ed_valor_compra: TDBEdit;
    ed_estoque_atual: TDBEdit;
    ed_cod_barras: TDBEdit;
    edCodUnFracao: TDBEdit;
    Panel3: TPanel;
    edDescUnFracao: TDBEdit;
    Panel8: TPanel;
    ed_descricao_cst: TDBEdit;
    Panel9: TPanel;
    ed_descricao_cfop: TDBEdit;
    ed_cst: TDBEdit;
    ed_cfop: TDBEdit;
    DBEdit1: TDBEdit;
    ckbSubMateria: TCheckBox;
    PopupMenu1: TPopupMenu;
    Excluirdaficha1: TMenuItem;
    procedure retornaInformacoes(codigo : string);
    procedure gravarInformacoes();
    procedure bt_novoClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure buscaFichaTecnica();
    procedure adicionaItemFichaTecnica();
    procedure excluirItemFichaTecnica();
    procedure gravarFichaTecnica(codigoItem : string);
    procedure setCodgrupoDescricao(grupo : string; descricao : string);
    procedure pesquisar_item;
    procedure bt_pesquisaClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ckbSubMateriaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure Excluirdaficha1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure setaVeioDoCadastro();

  private
    { Private declarations }
    veioDoCadstroDeProdutos : boolean;
    codigoGrupo : string;
    descricaoItem : string;

  public
    { Public declarations }
  end;

var
  frm_cad_itens_estoque: Tfrm_cad_itens_estoque;

implementation

uses uu_data_module, uu_frm_principal, uu_cs_item_estoque,
  ibx.IBQuery,
  uu_modelo_vazio , uu_produtos;

{$R *.dfm}

procedure Tfrm_cad_itens_estoque.bt_novoClick(Sender: TObject);
begin
  inherited;
  pgControl.Enabled:=true;
  pgControl.ActivePageIndex:=0;
  pageFicha.Enabled:=false;
  ckbSubMateria.Checked:=false;
  dm.qry_itens_estoque.Active:=true;
  dm.qry_itens_estoque.Append;
  dm.composicoes_temp.EmptyTable;
  dm.composicoes_temp.Active:=false;
  dm.composicoes_temp.Active:=true;
  if veioDoCadstroDeProdutos then
   begin
    dm.qry_itens_estoqueCOD_GRUPO.Text := codigoGrupo;
    dm.qry_itens_estoqueDESCRICAO_ITEM.Text := descricaoItem;
   end;

   ed_cod_grupo.SetFocus; 



end;

procedure Tfrm_cad_itens_estoque.gravarInformacoes();
begin

   if (evento = 1) then
   begin

     ed_codigo.Text:=dm.geraCodigo('G_ITENS_ESTOQUE',5);
     dm.qry_itens_estoque.FieldByName('cod_item').Value:=ed_codigo.Text;


      if veioDoCadstroDeProdutos then
      frm_produtos.setCodItemCadastrado(ed_codigo.Text);


     if((dm.qry_itens_estoque.FieldByName('barras').Value = null) or (trim(dm.qry_itens_estoque.FieldByName('barras').Value)='') ) then
       dm.qry_itens_estoque.FieldByName('barras').Value:= dm.qry_itens_estoque.FieldByName('cod_item').Value;

     dm.qry_itens_estoque.FieldByName('data_cadastro').Value:=data_do_sistema;
     dm.qry_itens_estoque.FieldByName('data_ultima_reposicao').Value:=data_do_sistema;

   end;


  if ( (evento = 1) or (evento = 2)) then
   begin

      if veioDoCadstroDeProdutos then
      frm_produtos.setCodItemCadastrado(ed_codigo.Text);

    if ckbSubMateria.Checked = true then
     begin
       dm.qry_itens_estoqueSUBMATERIA.Value:=1;
     end
     else
      dm.qry_itens_estoqueSUBMATERIA.Value:=0;
    dm.qry_itens_estoque.Post;

    dm.dbrestaurante.ApplyUpdates([dm.qry_itens_estoque]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do ítem  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_itens_estoque.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_itens_estoque]);
         end;
    end;

    if ckbSubMateria.Checked = true then
     begin
       gravarFichaTecnica(dm.qry_itens_estoque.FieldByName('cod_item').Value);
     end;



end;



procedure Tfrm_cad_itens_estoque.retornaInformacoes(codigo : string);
begin
 dm.qry_itens_estoque.Active:=false;
 dm.qry_itens_estoque.sql.clear;
 dm.qry_itens_estoque.sql.add(' select  it.* , gp.descricao as desc_grupo,  un.descricao as desc_unidade,  un.parametro, (it.estoque_liquido / un.parametro) as estoque,un2.descricao as descUnidadeFracao, cf.descricao as descricaoCFOP,ct.descricao as descricaoCST');
 dm.qry_itens_estoque.sql.add('    from itens_estoque it');
 dm.qry_itens_estoque.sql.add('   inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
 dm.qry_itens_estoque.sql.add('   inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
 dm.qry_itens_estoque.sql.add('   inner join unidades un2 on (un2.cod_unidade = it.cod_unidade_fracao)');
 dm.qry_itens_estoque.sql.add('   inner join cfop cf  on (cf.codigo = it.cfop)');
 dm.qry_itens_estoque.sql.add('   inner join cst ct on (ct.cst = it.cst)');

 dm.qry_itens_estoque.SQL.Add(' where cod_item='+Quotedstr(codigo));
 dm.qry_itens_estoque.Active:=true;
 dm.composicoes_temp.EmptyTable;
 


 if (evento = 2)then
  begin
   dm.qry_itens_estoque.Edit;
  end;

 if ((evento=2) or (evento = 3)) then
  begin
     if dm.qry_itens_estoqueSUBMATERIA.value = 1 then
      begin
        pageFicha.Enabled:=True;        
        ckbSubMateria.Checked :=true;
        buscaFichaTecnica();
      end
     else
       ckbSubMateria.Checked :=false;

    bt_gravar.Enabled:=true;
  end;
end;


procedure Tfrm_cad_itens_estoque.bt_gravarClick(Sender: TObject);
begin
  gravarInformacoes;
 inherited;

end;

procedure Tfrm_cad_itens_estoque.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qry_itens_estoque.Active:=false;
  dm.composicoes_temp.EmptyTable;
  dm.composicoes_temp.Active:=false;
  pageFicha.Enabled:=false;
  ckbSubMateria.Checked:=false;
  pgControl.ActivePageIndex:=0;

end;



procedure Tfrm_cad_itens_estoque.pesquisar_item;
begin
    string_auxiliar:='';
    Application.CreateForm(Tfrm_cs_itens,frm_cs_itens);
    frm_cs_itens.ShowModal;
    frm_cs_itens.Free;
    ed_codigo.Text:=string_auxiliar;

end;

procedure Tfrm_cad_itens_estoque.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaItemEstoque();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaItemEstoque(ed_codigo.Text,1) then
    retornaInformacoes(ed_codigo.Text);
end;

procedure Tfrm_cad_itens_estoque.ed_codigoExit(Sender: TObject);
begin
  inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('00000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de ítem inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaItemEstoque(trim(ed_codigo.Text),1) = true)
        then
           retornaInformacoes(ed_codigo.Text)
        else
          begin
            ShowMessage('Codigo de ítem inexistente!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;

end;

procedure Tfrm_cad_itens_estoque.FormActivate(Sender: TObject);
begin
  inherited;
  pageFicha.Enabled:=false;

end;

procedure Tfrm_cad_itens_estoque.ckbSubMateriaClick(Sender: TObject);
begin
  inherited;
  if ckbSubMateria.Checked = false then
   pageFicha.Enabled:=false
  else
   pageFicha.Enabled:=True;
end;



procedure Tfrm_cad_itens_estoque.buscaFichaTecnica();
begin

     dm.qryauxiliar2.Active:=false;
     dm.qryauxiliar2.SQL.Clear;
     dm.qryauxiliar2.SQL.add('select COMPOSICOES_SUBMATERIAS.*,unidades.* , itens_estoque.cod_item,itens_estoque.descricao_item');
     dm.qryauxiliar2.SQL.add('from COMPOSICOES_SUBMATERIAS,itens_estoque,unidades');
     dm.qryauxiliar2.SQL.add(' where unidades.cod_unidade=COMPOSICOES_SUBMATERIAS.unidade  and');
     dm.qryauxiliar2.SQL.add(' itens_estoque.cod_item=COMPOSICOES_SUBMATERIAS.cod_item and COMPOSICOES_SUBMATERIAS.cod_item_submateria='+Quotedstr(ed_codigo.Text));
     dm.qryauxiliar2.SQL.add(' order by COMPOSICOES_SUBMATERIAS.cod_item_submateria ,COMPOSICOES_SUBMATERIAS.cod_item');
     dm.composicoes_temp.EmptyTable;
     dm.qryauxiliar2.Active:=true;
     dm.qryauxiliar2.First;
     dm.composicoes_temp.Active:=true;
     while not dm.qryauxiliar2.Eof do
     begin
       dm.composicoes_temp.Append;
       dm.composicoes_tempcod_item.value:=dm.qryauxiliar2.fieldbyname('cod_item').value;
       dm.composicoes_tempcod_produto.value:=dm.qryauxiliar2.fieldbyname('cod_item_submateria').value;
       dm.composicoes_tempquantidade.Value:=(dm.qryauxiliar2.fieldbyname('quantidade').value / dm.qryauxiliar2.fieldbyname('parametro').value) ;
       dm.composicoes_tempdes_unidade.Value:=dm.qryauxiliar2.fieldbyname('descricao').value;
       dm.composicoes_tempUnidade.Value:=dm.qryauxiliar2.fieldbyname('unidade').value;
       dm.composicoes_tempdescricao_item.Value:=dm.qryauxiliar2.fieldbyname('descricao_item').value;
       dm.composicoes_temp.Post;
       dm.composicoes_temp.Refresh;
       dm.composicoes_temp.Refresh;
       dm.qryauxiliar2.Next;
     end;
end;




procedure Tfrm_cad_itens_estoque.adicionaItemFichaTecnica();
begin
   if dm.composicoes_temp.Locate('cod_item',ed_cod_item.Text,[])  then
   begin
     if MessageDlg('O ítem informado já consta na composição da sub-matéria. Deseja atualizar o valor para este ítem ?',mtConfirmation,[mbYes,mbno],0) = mryes then
       begin
         dm.composicoes_temp.Delete;
       end
     else
       begin
         ed_cod_item.Clear;
         ed_desc_item.Clear;
         dbg_ficha_tec.Refresh;
         ed_cod_un_saida.Clear;
         ed_desc_un_saida.clear;
         ed_qtd_item.clear;
         ed_cod_item.SetFocus;
         exit;
       end;
   end;
  dm.composicoes_temp.Append;
//  dm.composicoes_tempcod_produto.Value:= ed_codigo.Text;
  dm.composicoes_tempcod_item.Value:=ed_cod_item.text;
  dm.composicoes_tempquantidade.Value:=ed_qtd_item.Value;
  dm.composicoes_tempdescricao_item.Text:=ed_desc_item.Text;
  dm.composicoes_tempUnidade.Text:=ed_cod_un_saida.text;
  dm.composicoes_tempdes_unidade.Text:=ed_desc_un_saida.Text;
  dm.composicoes_temp.Post;
  dm.composicoes_temp.Refresh;
  dm.composicoes_temp.Refresh;
  ed_cod_item.Clear;
  ed_desc_item.Clear;
  dbg_ficha_tec.Refresh;
  ed_cod_un_saida.Clear;
  ed_desc_un_saida.clear;
  ed_cod_un_saida.Clear;
  ed_cod_item.SetFocus;
end;




procedure Tfrm_cad_itens_estoque.gravarFichaTecnica(codigoItem : string);
var
 parametro,quantidade : double;
 parametro_saida : double;
begin

      parametro:=0;
      quantidade:=0;
      dm.qryauxiliar.Active:=false;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.SQL.add('delete from composicoes_submaterias where cod_item_submateria='+quotedstr(codigoItem));
      dm.qryauxiliar.ExecSQL;
      dm.composicoes_temp.First;
      while  not  dm.composicoes_temp.Eof do
       begin
         dm.qry_consultas.Active:=false;
         dm.qry_consultas.sql.clear;
         dm.qry_consultas.SQL.Add('select * from unidades where cod_unidade='+Quotedstr(dm.composicoes_tempUnidade.Value));
         dm.qry_consultas.Active:=true;
         parametro:=dm.qry_consultas.fieldbyname('parametro').Value;
         quantidade:=dm.composicoes_tempquantidade.Value * dm.qry_consultas.fieldbyname('parametro').Value;
         dm.qryauxiliar.Active:=false;
         dm.qryauxiliar.SQL.clear;

         dm.qryauxiliar.SQL.Add('insert into composicoes_submaterias (cod_item_submateria,cod_item,quantidade,cod_c_custo,unidade) values (');
         dm.qryauxiliar.SQL.Add(''+Quotedstr(codigoItem)+',');
         dm.qryauxiliar.SQL.Add(''+QuotedStr(dm.composicoes_tempcod_item.Value)+',');
         dm.qryauxiliar.SQL.Add(''+Quotedstr(dm.TrocaVirgPPto(FloatToStr(quantidade)))+',');
         dm.qryauxiliar.SQL.Add(''+QuotedStr(dm.composicoes_tempcod_c_custo.Value)+',');
         dm.qryauxiliar.SQL.Add(''+QuotedStr(dm.composicoes_tempUnidade.Value)+')');
         try
           begin
            dm.qryauxiliar.ExecSQL;
           end;
         except
           begin
            dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de Produtos ','Erro incluir item de matéria prima',codigo_usuario);
            exit;
           end;
         end;
        dm.composicoes_temp.Next;
       end;
end;




procedure Tfrm_cad_itens_estoque.BitBtn1Click(Sender: TObject);
begin
  inherited;
  adicionaItemFichaTecnica();
  ed_qtd_item.Value:=1;
end;

procedure Tfrm_cad_itens_estoque.bt_alterarClick(Sender: TObject);
begin
  inherited;
  pgControl.Enabled :=true;
end;

procedure Tfrm_cad_itens_estoque.Excluirdaficha1Click(Sender: TObject);
begin
  inherited;
  excluirItemFichaTecnica();
end;


procedure Tfrm_cad_itens_estoque.excluirItemFichaTecnica();
begin
  dm.composicoes_temp.Delete;
end;

procedure Tfrm_cad_itens_estoque.FormCreate(Sender: TObject);
begin
  inherited;
  veioDoCadstroDeProdutos := false;
end;


procedure Tfrm_cad_itens_estoque.setCodgrupoDescricao(grupo : string; descricao : string);
begin
  codigoGrupo := grupo;
  descricaoItem := descricao;
end;

procedure Tfrm_cad_itens_estoque.setaVeioDoCadastro();
begin
  veioDoCadstroDeProdutos :=true;
end;


end.procedure Tfrm_cad_itens_estoque.ed_codigoExit(Sender: TObject);
begin
  inherited;

end;






