unit uuRelatorioCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, ExtCtrls, Buttons,  
  Grids, DBGrids, DBCtrls, JvExDBGrids, JvDBGrid, Data.DB, RxToolEdit;

type
  TfrmRelatorioCaixa = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edData: TDateEdit;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    lbCaixasEncontrados: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    ckbMiniPrinter: TCheckBox;
    gpOrdemDetalhamento: TRadioGroup;
    Panel7: TPanel;
    rdRelatorioCaixa: TRadioGroup;
    DBCheckBox1: TDBCheckBox;
    procedure pesquisarCaixas();
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure emitirRelatorio();
  public
    { Public declarations }

  end;

var
  frmRelatorioCaixa: TfrmRelatorioCaixa;


implementation

uses uuDmRelatorios, uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelatorioCaixa.pesquisarCaixas();
begin


 dRelatorios.qryCaixas.Active:=false;
 dRelatorios.qryCaixas.SQL.clear;
 dRelatorios.qryCaixas.SQL.Add(' select c.*, cf.descricao  from caixas c ');
 dRelatorios.qryCaixas.SQL.Add('  inner join configuracoes_estacao cf on (c.numero_caixa  = cf.numero_caixa ) ');
 dRelatorios.qryCaixas.SQL.Add(' where c.data_sistema ='+Quotedstr(formatDateTime('DD.MM.YYY',edData.date))+' order by c.codigo');
 dRelatorios.qryCaixas.Active:=true;

 if dRelatorios.qryCaixas.IsEmpty then
  begin
    ShowMessage('Caixas não encontrados para a data informada');
  end
 else
  begin
    dRelatorios.qryCaixas.First;

    while not dRelatorios.qryCaixas.Eof do
     begin

      dRelatorios.qryCaixas.Edit;
      dm.procProcessaCaixa.Active:=false;
      dm.procProcessaCaixa.Params[0].Value:=  dRelatorios.qryCaixas.fieldbyname('codigo').value;
      dm.procProcessaCaixa.ExecProc;

      dRelatorios.qryCaixas.Next;
     end;


     dRelatorios.qryCaixas.Active := false;
     dRelatorios.qryCaixas.Active :=true;

  end;

if dm.transacao.Active = false then
  dm.transacao.Active := true;
dm.transacao.Commit;

 dRelatorios.qryCaixas.Active:=false;
 dRelatorios.qryCaixas.Active:=true;

end;

procedure TfrmRelatorioCaixa.BitBtn3Click(Sender: TObject);
begin
  inherited;
  pesquisarCaixas();
end;



procedure TfrmRelatorioCaixa.emitirRelatorio();
begin
  inherited;

  dm_relatorios.qryProdutosVendidosCaixa.Active:=false;

    // Seleção de Produtos vendidos
  dm_relatorios.qryProdutosVendidosCaixa.Active:=false;
  dm_relatorios.qryProdutosVendidosCaixa.SQL.clear;
  dm_relatorios.qryProdutosVendidosCaixa.sql.add('select  pm.*, udf_roundabnt ( (pm.quantidade_real  * pm.valor_unitario),2) as tot,');
  dm_relatorios.qryProdutosVendidosCaixa.sql.add('       ip.cod_barras,ip.cod_g_raiz,ip.desc_g_raiz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo');


  // Seleção de Estornos
  dm_relatorios.qryEstornosCaixa.Active:=false;
  dm_relatorios.qryEstornosCaixa.SQL.clear;
  dm_relatorios.qryEstornosCaixa.SQL.add(' select  es.*, (es.valor_unitario * es.quantidade) as total, c.data_sistema');
  dm_relatorios.qryEstornosCaixa.SQL.Add('    from estornos es');
  dm_relatorios.qryEstornosCaixa.SQL.Add('  inner join caixas c on (c.codigo = es.cod_caixa)');
  dm_relatorios.qryEstornosCaixa.SQL.add(' where c.data_sistema='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));



  // Seleção de Transferências de Produtos
  dm_relatorios.qryTransferenciasProdutos.Active:=false;
  dm_relatorios.qryTransferenciasProdutos.SQL.clear;
  dm_relatorios.qryTransferenciasProdutos.SQL.add('select  tf.*, (tf.valor_unitario * tf.quantidade) as total, c.data_sistema');
  dm_relatorios.qryTransferenciasProdutos.SQL.add('  from  transferencias_produto tf');
  dm_relatorios.qryTransferenciasProdutos.SQL.Add('  inner join caixas c on (c.codigo = tf.cod_caixa)');
  dm_relatorios.qryTransferenciasProdutos.SQL.add(' where c.data_sistema='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));


  dm_relatorios.qryTransferenciasMesa.Active:=false;
  dm_relatorios.qryTransferenciasMesa.sql.Clear;
  dm_relatorios.qryTransferenciasMesa.SQL.Add('select tm.* from transferencias_mesa tm ');
  dm_relatorios.qryTransferenciasMesa.SQL.Add('  inner join caixas c on (c.codigo = tm.cod_caixa)');
  dm_relatorios.qryTransferenciasMesa.SQL.add(' where c.data_sistema='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));

  dm_relatorios.qryEstornosMesa.Active:=false;
  dm_relatorios.qryEstornosMesa.sql.Clear;
  dm_relatorios.qryEstornosMesa.SQL.Add('select em.* from estornos_mesa em ');
  dm_relatorios.qryEstornosMesa.SQL.Add('  inner join caixas c on (c.codigo = em.cod_caixa)');
  dm_relatorios.qryEstornosMesa.SQL.add(' where c.data_sistema='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));




  dm_relatorios.qryVendas.Active:=false;
  dm_relatorios.qryVendas.SQL.clear;
  dm_relatorios.qryVendas.sql.Add(' select v.cod_venda as codigoVenda,v.* from vendas v');
  dm_relatorios.qryVendas.SQL.Add('  inner join caixas c on (c.codigo = v.cod_caixa)');
  dm_relatorios.qryVendas.SQL.add(' where c.data_sistema='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));


  dm_relatorios.qrySangrias.Active :=false;
  dm_relatorios.qrySangrias.SQL.clear;
  dm_relatorios.qrySangrias.SQL.Add('select s.codigo,s.data,tp.descricao,s.valor, s.codigo_tipo, s.obs, s.cod_caixa,s.cod_usuario_autorizou,s.nome_usuario_autorizou');
  dm_relatorios.qrySangrias.SQL.Add('   from sangrias s ');
  dm_relatorios.qrySangrias.SQL.Add(' inner join tipos_sangria tp on (tp.codigo = s.codigo_tipo)');
  dm_relatorios.qrySangrias.SQL.add(' where s.data='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));




  //Seleção dos Recebimentos

  dm_relatorios.qryResumoCaixa.Active:=false;
  dm_relatorios.qryResumoCaixa.sql.clear;
  dm_relatorios.qryResumoCaixa.sql.add('  select ap.cod_forma,fp.descricao,  sum(ap.total_sistema) as TotalSistema ,sum(ap.total_operador) as TotalOperador,');
  dm_relatorios.qryResumoCaixa.sql.add('  sum(ap.total_suprimentos) as TotalEntradas,sum(ap.total_sangrias) as TotalSangrias,');
  dm_relatorios.qryResumoCaixa.sql.add('       sum(ap.diferenca) as TotalDiferenca, cx.data_sistema ');
  dm_relatorios.qryResumoCaixa.sql.add('   from apuracao_caixa ap');
  dm_relatorios.qryResumoCaixa.sql.add('   inner join caixas cx on (cx.codigo = ap.cod_caixa)');
  dm_relatorios.qryResumoCaixa.sql.add('   inner join formas_pagamento fp on (fp.cod_forma = ap.cod_forma)');
  dm_relatorios.qryResumoCaixa.sql.add('   where cx.data_sistema='+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text))));



  dm_relatorios.qryResumoChurrascaria.Active:=false;
  dm_relatorios.qryResumoChurrascaria.sql.clear;






  if rdRelatorioCaixa.ItemIndex = 0 then
   begin
     dm_relatorios.qryProdutosVendidosCaixa.sql.add('       from produtosvendidosCaixa('+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text)))+','+Quotedstr('')+','+Quotedstr('')+') pm ');
     dm_relatorios.qryResumoChurrascaria.sql.add('select * from  medias_caixa('+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text)))+','+Quotedstr('')+')');

     dm_relatorios.setNomeOperador('TODOS OS OPERADORES');
     dm_relatorios.setNumeroCaixa('');
   end
  else
   begin

        dm_relatorios.qryProdutosVendidosCaixa.sql.add('       from produtosvendidosCaixa('+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text)))+','+Quotedstr('')+','+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value)+') pm ');

     // Filtro de Estornos
     dm_relatorios.qryEstornosCaixa.SQL.add('             and es.cod_caixa='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

     // Filtro de Transferências
     dm_relatorios.qryTransferenciasProdutos.SQL.add('    and tf.cod_caixa='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

     //Filtro de transferências de mesa
     dm_relatorios.qryTransferenciasMesa.SQL.add('   and tm.cod_caixa='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

     // Filtro de Estornos de Mesa
     dm_relatorios.qryEstornosMesa.SQL.add('   and em.cod_caixa='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

     //Filtro de Detalhamento de vendas
     dm_relatorios.qryVendas.sql.add(' and v.cod_caixa='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

     // Sangrias

     dm_relatorios.qrySangrias.SQL.add(' and s.cod_caixa='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

     //Resumo de Recebimentos
     dm_relatorios.qryResumoCaixa.sql.add('  and cx.codigo='+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));


     //Resumo de churrascaria
     dm_relatorios.qryResumoChurrascaria.sql.add('select * from  medias_caixa('+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text)))+','+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value)+')');



     dm_relatorios.setNomeOperador(dRelatorios.qryCaixas.fieldbyname('nome_usuario').value);
     dm_relatorios.setNumeroCaixa(dRelatorios.qryCaixas.fieldbyname('codigo').value);

   end;


  case gpOrdemDetalhamento.ItemIndex of
   0 : begin
         dm_relatorios.qryVendas.SQL.add(' order by  v.mesa');
       end;
   1: begin
         dm_relatorios.qryVendas.SQL.add(' order by  v.cod_venda');
       end;
  end;


  dm_relatorios.qryIndicadoresCaixa.Active:=false;
  dm_relatorios.qryIndicadoresCaixa.SQL.Clear;


  case rdRelatorioCaixa.ItemIndex of
   0 : begin
          dm_relatorios.qryIndicadoresCaixa.sql.Add('select * from resumo_caixa('+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text)))+','+QuotedStr('')+')');
       end;
   1: begin
         dm_relatorios.qryIndicadoresCaixa.sql.add('select * from  resumo_caixa('+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(edData.Text)))+','+Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value)+')');
      end;
  end;

  dm_relatorios.qryIndicadoresCaixa.Active:=true;









  dm_relatorios.qryProdutosVendidosCaixa.sql.add('       inner join r_informacoes_produto ip on (ip.cod_produto = pm.cod_produto) order by ip.cod_grupo');

  dm_relatorios.qryEstornosMesa.SQL.add(' order by em.codigo');
  dm_relatorios.qryTransferenciasMesa.SQL.add(' order by tm.codigo');
  dm_relatorios.qryTransferenciasProdutos.SQL.add(' order by tf.codigo');
  dm_relatorios.qryEstornosCaixa.sql.add(' order by es.codigo');





  dm_relatorios.qryEstornosCaixa.Active:=true;
  dm_relatorios.qryTransferenciasProdutos.Active:=true;

  dm_relatorios.qryResumoCaixa.sql.add('   group by ap.cod_forma,fp.descricao,  cx.data_sistema');
  dm_relatorios.qryResumoCaixa.sql.add('   order by ap.cod_forma');
  dm_relatorios.qryResumoCaixa.Active:=true;


  dm_relatorios.qryResumoChurrascaria.Active:=true;



  dm.adicionaLog('Relatório dos produtos vendidos no caixa ');
  dm.adicionaLog(dm_relatorios.qryProdutosVendidosCaixa.SQL.Text);

  dm_relatorios.qryProdutosVendidosCaixa.Active:=true;
  dm_relatorios.dtRelatorioMargemProdutos.DataSet := dm_relatorios.qryProdutosVendidosCaixa;






  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioDeCaixa2.fr3',true);





  dm_relatorios.setPeriodoRelatorio('Data: '+edData.Text);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryProdutosVendidosCaixa.Close;
end;

procedure TfrmRelatorioCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if (ckbMiniPrinter.Checked   = false) then
   begin
      emitirRelatorio();
   end
  else
   begin
     if (rdRelatorioCaixa.ItemIndex = 1) then
      begin
//        dm.imprimeRelatorioCaixa(marca_impressora_fiscal,ultimoCaixaAberto);

        if localDeEmissaoDeExtrato = 1 then
         begin
          dm.imprimeRelatorioCaixa(marca_impressora_fiscal,dRelatorios.qryCaixas.fieldbyname('codigo').value);
         end
        else
         begin
          dm.imprimeRelatorioCaixa(marca_impressora_nao_fiscal_01,dRelatorios.qryCaixas.fieldbyname('codigo').value);
         end;

      end
    else
     begin
       ShowMessage('Impressão na mini-printer só pode ser feita individualmente para cada caixa');
       exit;
     end;

   end;


end;

procedure TfrmRelatorioCaixa.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioCaixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var
  iCheck : integer;
  rRect: TRect;

begin
  inherited;

   if Column.FieldName = 'SELECIONADO' then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    iCheck := 0;
    if dRelatorios.qryCaixasSELECIONADO.Value = 1 then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(DBGrid1.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;

end;

procedure TfrmRelatorioCaixa.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then 
     DBCheckBox1.Visible := False
end;

procedure TfrmRelatorioCaixa.DBGrid1CellClick(Column: TColumn);
begin
  inherited;

   if Column.FieldName = 'SELECIONADO' then
  begin

  end;

end;

procedure TfrmRelatorioCaixa.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

    dRelatorios.qryCaixas.Edit;
    if (dRelatorios.qryCaixasSELECIONADO.Value = 0) then
       dRelatorios.qryCaixasSELECIONADO.Value := 1
    else
       dRelatorios.qryCaixasSELECIONADO.Value := 0;
    dRelatorios.qryCaixas.Post;
    dRelatorios.qryCaixas.Active := false;
    dRelatorios.qryCaixas.Active := true;
end;

end.
