unit uu_cad_receita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, 
   Grids, DBGrids, ibquery;

type
  Tfrm_cad_receitas = class(Tfrm_modelo_cadastro)
    Label8: TLabel;
    pn_campos: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    edCodigoGrupo: TDBEdit;
    Panel2: TPanel;
    edDescricaoGrupo: TDBEdit;
    edDescricaoReceita: TDBEdit;
    edPessoas: TDBEdit;
    edPeso: TDBEdit;
    edCalorias: TDBEdit;
    edProteinas: TDBEdit;
    edCarboidratos: TDBEdit;
    Panel4: TPanel;
    Label10: TLabel;
    bt_pesq_item_estoque_barras: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    bt_pesq_un_entrada: TSpeedButton;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    BitBtn1: TBitBtn;
    ed_cod_item: TEdit;
    edQtde: TCurrencyEdit;
    ed_cod_un_entrada: TEdit;
    Panel7: TPanel;
    ed_desc_un_entrada: TEdit;
    pn_grade: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    dbg_ficha_tec: TDBGrid;
    Panel6: TPanel;
    DBMemo1: TDBMemo;
    procedure  bt_novoClick(Sender: TObject);
    procedure  ed_codigoExit(Sender: TObject);
    procedure  retornaInformacoes(codReceita : string);
    procedure  retornaIgredientesReceita(codReceita : string);
    function   verificaValidadeIgrediente() : boolean;
    procedure  limpaEditsItem();
    function   verificaValidade() : boolean;
    procedure  gravarInformacoes();
    procedure adicionarIgrediente(CodigoItem : string; descricaoItem : string; codUnidade : string; descricaoUnidade : string; quantidade : double);
    procedure bt_consultarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_receitas: Tfrm_cad_receitas;

implementation

uses uu_data_module, uu_modelo_vazio, uu_entradas;
{$R *.dfm}

procedure Tfrm_cad_receitas.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_campos.Enabled:=true;
  pn_principal.Enabled:=true;
  pn_codigo.Enabled:=false;
  dm.qryReceitas.Active:=true;
  dm.qryReceitas.Append;
  edCodigoGrupo.SetFocus;
  dm.tbReceitasTemp.EmptyTable;
  dm.tbReceitasTemp.Active:=true;

end;

procedure Tfrm_cad_receitas.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;
      try
        ed_codigo.Text:=FormatFloat('00000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de receita inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaReceita(trim(ed_codigo.Text)) = true)
        then
          retornaInformacoes(ed_codigo.text)
        else
          begin
            ShowMessage('Codigo de receita inexistente!!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;

end;


procedure Tfrm_cad_receitas.retornaInformacoes(codReceita : string);
begin
  dm.qryReceitas.Active:=false;
  dm.qryReceitas.SQL.clear;
  dm.qryReceitas.SQL.add('Select r.*, gr.descricao as descricao_grupo   from receitas r ');
  dm.qryReceitas.SQL.add('inner join grupos_receita gr on (gr.cod_grupo_receita = r.cod_grupo_receita)  where r.cod_receita='+Quotedstr(CodReceita));
  dm.qryReceitas.Active:=true;
  retornaIgredientesReceita(codReceita);
  bt_imprimir.Enabled:=true;

      if (evento = 2)then
       begin
        dm.qryReceitas.Edit;
        pn_campos.Enabled:=true;
       end;

      if ((evento=2) or (evento = 3)) then
        bt_gravar.Enabled:=true;

end;

procedure Tfrm_cad_receitas.bt_consultarClick(Sender: TObject);
begin
  inherited;
  pn_campos.Enabled:=true;
end;




procedure Tfrm_cad_receitas.retornaIgredientesReceita(codReceita : string);
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  dm.tbReceitasTemp.Active:=false;
  dm.tbReceitasTemp.EmptyTable;
  dm.tbReceitasTemp.Active:=true;

  q.sql.clear;
  q.sql.add('Select cp.*,ite.descricao_item as descricaoItem, un.descricao as descricaoUnidade from composicoes_receitas cp');
  q.sql.add('  inner join itens_estoque ite on (ite.cod_item = cp.cod_item)');
  q.sql.add('  inner join unidades un on (un.cod_unidade = cp.cod_unidade)');
  q.sql.add(' where cp.cod_receita='+Quotedstr(codReceita));
  q.Active:=true;
  q.First;

  while not q.eof do
  begin
      adicionarIgrediente(q.fieldbyname('cod_item').value,q.fieldbyname('descricaoItem').value,q.fieldbyname('cod_unidade').value,q.fieldbyname('descricaoUnidade').value,q.fieldbyname('quantidade').value);
      q.Next;
  end;
end;

procedure Tfrm_cad_receitas.adicionarIgrediente(CodigoItem : string; descricaoItem : string; codUnidade : string; descricaoUnidade : string; quantidade : double);
begin
 dm.tbReceitasTemp.Append;
 dm.tbReceitasTempcodigoItem.Value:= CodigoItem;
 dm.tbReceitasTempdescricaoItem.Value := descricaoItem;
 dm.tbReceitasTempcodUnidade.Value := codUnidade;
 dm.tbReceitasTempdescricaoUnidade.Value := descricaoUnidade;
 dm.tbReceitasTempquantidade.Value := quantidade;
 dm.tbReceitasTemp.Post;
end;


procedure Tfrm_cad_receitas.bt_cancelarClick(Sender: TObject);
begin
  inherited;
    pn_campos.Enabled:=false;
    dm.qryReceitas.Cancel;
    dm.qryReceitas.Active:=false;
    dm.tbReceitasTemp.EmptyTable;
    dm.tbReceitasTemp.Close;
    dm.tbReceitasTemp.Active:=true; 
end;

procedure Tfrm_cad_receitas.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidadeIgrediente() then
    adicionarIgrediente(ed_cod_item.text,ed_desc_item.Text,ed_cod_un_entrada.Text,ed_desc_un_entrada.Text,edQtde.value);
end;



function Tfrm_cad_receitas.verificaValidadeIgrediente() : boolean;
var
 q : TIBQuery;
begin

  if ( verificaExistenciaItemEstoque(ed_cod_item.Text,1) = false) then
  begin
    showmessage('Código de ítem informado não existe!');
    limpaEditsItem();
    ed_cod_item.SetFocus;
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



  if (edQtde.Value  <= 0) then
  begin
    Showmessage('Quantidade deve ser superior a ZERO!');
    edQtde.SetFocus;
    result:=false;
    exit;
  end;



  Result:=true;
end;

procedure Tfrm_cad_receitas.limpaEditsItem();
begin
  ed_desc_item.clear;
  ed_cod_item.clear;
  ed_desc_un_entrada.clear;
  edQtde.Text:='0,00';
  ed_cod_un_entrada.clear;
end;


function Tfrm_cad_receitas.verificaValidade() : boolean;
begin

  if( ( dm.qryReceitas.FieldByName('cod_grupo_receita').value = null)or  (trim(dm.qryReceitas.FieldByName('COD_GRUPO_RECEITA').value)='')   ) then
  begin
    ShowMessage('Código do grupo inválido!');
    edCodigoGrupo.SetFocus;
    Result:=false;
    exit;
  end; 


  if ( (dm.qryReceitas.FieldByName('pessoas').value <=0) or (  dm.qryReceitas.FieldByName('pessoas').value = null) ) then
  begin
    ShowMessage('Número de pessoas inválido!');
    edPessoas.SetFocus;
    Result:=false;
    exit;
  end;

  if ( (dm.qryReceitas.FieldByName('peso').value <=0) or (  dm.qryReceitas.FieldByName('peso').value = null) ) then
  begin
    ShowMessage('Peso inválido!');
    edPeso.SetFocus;
    Result:=false;
    exit;
  end;

  if ( (dm.qryReceitas.FieldByName('calorias').value <=0) or (  dm.qryReceitas.FieldByName('calorias').value =null) ) then
  begin
    ShowMessage('Número de calorias inválido!');
    edCalorias.SetFocus;
    Result:=false;
    exit;
  end;

  if ( (dm.qryReceitas.FieldByName('proteinas').value <=0) or (  dm.qryReceitas.FieldByName('proteinas').value = null) ) then
  begin
    ShowMessage('Número de proteínas inválido!');
    edProteinas.SetFocus;
    Result:=false;
    exit;
  end;

  if ( (dm.qryReceitas.FieldByName('CARBOIDRATOS').value <=0) or (  dm.qryReceitas.FieldByName('CARBOIDRATOS').value = null) ) then
  begin
    ShowMessage('Número de carboidratos inválido!');
    edCarboidratos.SetFocus;
    Result:=false;
    exit;
  end;

  Result:=TRUE;




end;

procedure Tfrm_cad_receitas.bt_gravarClick(Sender: TObject);
begin
  if ( verificaValidade() ) then
  begin
    gravarInformacoes();
    inherited;
  end;

end;


procedure Tfrm_cad_receitas.gravarInformacoes();
begin
 if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_RECEITAS',5);
     dm.qryReceitasCOD_RECEITA.Value:=ed_codigo.Text;
   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryReceitas.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryReceitas]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão da receita ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryReceitas.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryReceitas]);

         end;

    end
end;


end.
