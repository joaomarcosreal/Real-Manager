unit uu_rel_compras_por_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask, ExtCtrls, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  PngSpeedButton, cxCheckBox, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, Vcl.ComCtrls, AdvDateTimePicker,
  AdvGlassButton;

type
  TfrmRelEntradasPorItem = class(Tfrm_modelo_vazio)
    Edit5: TEdit;
    Panel1: TPanel;
    Panel9: TPanel;
    Label9: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label10: TLabel;
    ed_cod_item: TMaskEdit;
    Panel10: TPanel;
    ed_desc_item: TMaskEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    Panel4: TPanel;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    Panel3: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edAte: TAdvDateTimePicker;
    edDe: TAdvDateTimePicker;
    RadioGroup1: TRadioGroup;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    procedure imprimirRelatorio();
    function verificaValidade(): boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEntradasPorItem: TfrmRelEntradasPorItem;

implementation

uses
  uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelEntradasPorItem.imprimirRelatorio();
begin
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryComprasItem.Active := false;
  dRelatorios.qryComprasItem.sql.Clear;

  dRelatorios.qryComprasItem.sql.add('     select ie.*,(ie.quantidade * u.parametro) as quantidadeParametro, ');
  dRelatorios.qryComprasItem.sql.add('              (ie.quantidade * ie.valor_unitario) as subtotal, ');
  dRelatorios.qryComprasItem.sql.add('              ((ie.quantidade * ie.valor_unitario) - ie.desconto + ie.valor_ipi  ) as total,');
  dRelatorios.qryComprasItem.sql.add('               u.descricao as unidadeCompra, ');
  dRelatorios.qryComprasItem.sql.add('           en.cod_fornecedor,f.razao_social as nomeFornecedor ,en.data_entrada, ');
  dRelatorios.qryComprasItem.sql.add('           en.nome_usuario_entrada,en.numero_nota,en.data,en.hora, ');
  dRelatorios.qryComprasItem.sql.add('          vi.cod_g_raiz, vi.desc_g_raiz, vi.cod_g_pai, vi.desc_g_pai , vi.cod_grupo, vi.desc_grupo,');
  dRelatorios.qryComprasItem.sql.add('          u2.parametro as parametroUnidadeEntrada, u2.descricao as descUnidadeEntrada,u3.parametro as parametroUnidadeFracao,u3.descricao as descUnidadeFracao,');
  dRelatorios.qryComprasItem.sql.add('          udf_replace(cast((udf_int (ie.estoque_anterior ))     as varchar(7)),' + Quotedstr('.') + ',' + Quotedstr(',') + ')');
  dRelatorios.qryComprasItem.sql.add('                                    ||' + Quotedstr(' ') + '||u2.descricao');
  dRelatorios.qryComprasItem.sql.add('                                    ||' + Quotedstr(' + ') + '||');
  dRelatorios.qryComprasItem.sql.add('                                    cast(udf_frac (ie.estoque_anterior ) as varchar(7))');
  dRelatorios.qryComprasItem.sql.add('                                    ||' + Quotedstr(' ') + '||u3.descricao   as estoqueAnterior,');
  dRelatorios.qryComprasItem.sql.add('          udf_replace(cast((udf_int (ie.estoque_atualizado  ))     as varchar(7)),' + QUotedstr('.') + ',' + Quotedstr(',') + ')');
  dRelatorios.qryComprasItem.sql.add('                                    ||' + Quotedstr(' ') + '||u2.descricao');
  dRelatorios.qryComprasItem.sql.add('                                    ||' + Quotedstr(' + ') + '||');
  dRelatorios.qryComprasItem.sql.add('                                    cast(udf_frac (ie.estoque_atualizado ) as varchar(7))');
  dRelatorios.qryComprasItem.sql.add('                                    ||' + quotedstr(' ') + '||u3.descricao   as estoqueAtualizado');
  dRelatorios.qryComprasItem.sql.add('    from  itens_entrada ie');
  dRelatorios.qryComprasItem.sql.add('    inner join unidades u on  ( u.cod_unidade = ie.cod_unidade)');
  dRelatorios.qryComprasItem.sql.add('    inner join produtos ite on (ite.cod_produto = ie.cod_item)');
  dRelatorios.qryComprasItem.sql.add('    inner join unidades u2 on  ( u2.cod_unidade = ite.unidade_entrada)');
  dRelatorios.qryComprasItem.sql.add('    inner join unidades u3 on  ( u3.cod_unidade = ite.cod_unidade_fracao)');

  dRelatorios.qryComprasItem.sql.add('    inner join entradas en on ( en.cod_entrada = ie.cod_entrada)');
  dRelatorios.qryComprasItem.sql.add('    inner join v_itens_estoque vi on (vi.cod_item = ie.cod_item)');
  dRelatorios.qryComprasItem.sql.add('    inner join fornecedor f on (f.cod_fornecedor = en.cod_fornecedor)');

  dRelatorios.qryComprasItem.sql.add('where  en.data_entrada between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
  dRelatorios.qryComprasItem.SQL.add(' and en.cod_fornecedor like ' + Quotedstr(ed_cod_fornecedor.text + '%'));
  dRelatorios.qryComprasItem.SQL.add(' and  vi.cod_item=' + Quotedstr(ed_cod_item.text));
  dRelatorios.qryComprasItem.sql.add('  order by en.data_entrada desc');

  ////dm.adicionalog(  dRelatorios.qryComprasItem.sql.Text);


  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelatorioDeComprasPorItem.fr3', true);

  dRelatorios.qryComprasItem.Active := true;

  if not dRelatorios.qryComprasItem.IsEmpty then
  begin

    dRelatorios.qryItemMaisBaratoPeriodo.Active := false;
    dRelatorios.qryItemMaisBaratoPeriodo.sql.clear;
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('select ite.*,e.*,f.razao_social');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  from itens_entrada ite');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  inner join entradas e on (e.cod_entrada = ite.cod_entrada)');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  where ite.valor_unitario  = (select min(ite2.valor_unitario) from itens_entrada ite2');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('                               inner join entradas en on (en.cod_entrada  = ite2.cod_entrada)');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('                               where en.data between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('                              and ite2.cod_item = ' + Quotedstr(ed_cod_item.text) + '');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('                              and en.cod_fornecedor    like ' + Quotedstr(ed_cod_fornecedor.text + '%') + ')');
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  and e.data between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  and ite.cod_item = ' + Quotedstr(ed_cod_item.text));
    dRelatorios.qryItemMaisBaratoPeriodo.sql.add('  and e.cod_fornecedor    like ' + Quotedstr(ed_cod_fornecedor.text + '%'));
    dRelatorios.qryItemMaisBaratoPeriodo.Active := true;

    dRelatorios.qryItemMaisCaroPeriodo.Active := false;
    dRelatorios.qryItemMaisCaroPeriodo.sql.clear;
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('select ite.*,e.*,f.razao_social');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  from itens_entrada ite');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  inner join entradas e on (e.cod_entrada = ite.cod_entrada)');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor) ');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  where ite.valor_unitario  = (select max(ite2.valor_unitario) from itens_entrada ite2');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('                               inner join entradas en on (en.cod_entrada  = ite2.cod_entrada)');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('                               where en.data between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('                              and ite2.cod_item = ' + Quotedstr(ed_cod_item.text) + '');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('                              and en.cod_fornecedor    like ' + Quotedstr(ed_cod_fornecedor.text + '%') + ')');
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  and e.data between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  and ite.cod_item = ' + Quotedstr(ed_cod_item.text));
    dRelatorios.qryItemMaisCaroPeriodo.sql.add('  and e.cod_fornecedor    like ' + Quotedstr(ed_cod_fornecedor.text + '%'));
    dRelatorios.qryItemMaisCaroPeriodo.Active := true;

    dRelatorios.setPeriodoRelatorio(FormatDateTime('DD/MM/YYY', edDe.date) + '  ATÉ  ' + FormatDateTime('DD/MM/YYY', edAte.date));
    dRelatorios.setItemSelecionado(ed_desc_item.Text);
    dRelatorios.rpt.ShowReport(true);
    dRelatorios.qryComprasItem.Active := false;
    dRelatorios.qryItemMaisBaratoPeriodo.Active := false;
    dRelatorios.qryItemMaisCaroPeriodo.Active := false;

  end
  else
    ShowMessage('Não existem lançamentos de compra para o período e/ou filtros informados');

end;

procedure TfrmRelEntradasPorItem.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

function TfrmRelEntradasPorItem.verificaValidade(): boolean;
begin

  if edAte.Date < edDe.Date then
  begin
    showmessage('Período Inválido');
    edDe.SetFocus;
    result := false;
    exit;
  end;

  if (trim(ed_cod_fornecedor.Text) <> '') then
  begin
    if (verificaExistenciaFornecedor(ed_cod_fornecedor.Text) = false) then
    begin
      ShowMessage('Código de Fornecedor inválido');
      result := false;
      exit;
    end;
  end;

  if (trim(ed_cod_item.text) = '') then
  begin
    showmessage('Informe o ítem que deseja consultar!');
    ed_cod_item.setfocus;
    Result := false;
    exit;
  end
  else
  begin
    if verificaExistenciaItemEstoque(ed_cod_item.text, 1) = false then
    begin
      Showmessage('Ítem inválido');
      ed_cod_item.SetFocus;
      Result := false;
      Exit;
    end;

  end;

  result := true;
end;

procedure TfrmRelEntradasPorItem.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorItem.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorItem.btSelecionarClick(Sender: TObject);
begin
  inherited;
   if verificaValidade then
   imprimirRelatorio();

end;

procedure TfrmRelEntradasPorItem.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date := StrToDate('01/' + FormatDateTime('MM', date) + '/' + FormatDateTime('YYY', date));
  edAte.Date := Date;
  ed_cod_item.SetFocus;
  edDe.SetFocus;

  frmRelEntradasPorItem.Repaint;

end;

procedure TfrmRelEntradasPorItem.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

end.

