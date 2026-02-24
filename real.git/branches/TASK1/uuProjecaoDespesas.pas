unit uuProjecaoDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, uu_modelo_Vazio, cxStyles, cxCustomData, cxGraphics, cxFilter, acbrutil,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGrid, StdCtrls, Buttons, Menus,
  DBCtrls, ComCtrls, Grids, DBGrids, Mask, ExtCtrls, RxToolEdit, RxCurrEdit,
  Vcl.ActnList, System.Actions;

type
  TfrmProjecaoDespesasRD = class(Tfrm_modelo_vazio)
    pn_principal: TPanel;
    pn_codigo: TPanel;
    bt_pesquisa: TSpeedButton;
    ed_codigo: TMaskEdit;
    DBGrid1: TDBGrid;
    pn_botoes: TPanel;
    bt_novo: TBitBtn;
    bt_alterar: TBitBtn;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_excluir: TBitBtn;
    bt_consultar: TBitBtn;
    Panel2: TPanel;
    Panel1: TPanel;
    pnAlterar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel5: TPanel;
    edProjecaoInicial: TCurrencyEdit;
    edReproJecao: TCurrencyEdit;
    Panel4: TPanel;
    Label3: TLabel;
    edDescGrupo: TEdit;
    edApuracaoReal: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    bt_sair: TBitBtn;
    sv: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Detalhar1: TMenuItem;
    ListagemdeInsumoscomprados1: TMenuItem;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    SpeedButton3: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);

    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

   procedure exibeNotasLancamento(detalhado : boolean);
    procedure Detalhar1Click(Sender: TObject);
    procedure ListagemdeInsumoscomprados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProjecaoDespesasRD: TfrmProjecaoDespesasRD;

implementation

uses uu_data_module, uu_frm_principal, uuProjecaoVendas, uuLancamentosRD,
  UU_DM_RELATORIOS, uuDmRelatorios, uuRelLancamentosNotas;

{$R *.dfm}

procedure TfrmProjecaoDespesasRD.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

       if (Column.Field.FieldName = 'PROJECAO_INICIAL') then
         begin
          DBGrid1.Canvas.Brush.Color:= $0069BE7A;
         end;
       if (Column.Field.FieldName = 'PERC_PROJ_FAT') then
         begin
          DBGrid1.Canvas.Brush.Color:= clSilver;
         end;


       if (Column.Field.FieldName = 'REPROJECAO') then
         begin
          DBGrid1.Canvas.Brush.Color:= $0069BE7A ;
         end;

       if (Column.Field.FieldName = 'PERC_REPROJ_FAT') then
         begin
          DBGrid1.Canvas.Brush.Color:= clsilver ;
         end;

       if (Column.Field.FieldName = 'TOTAL') then
         begin
          DBGrid1.Canvas.Brush.Color:= $0069BE7A ;
         end;

       if (Column.Field.FieldName = 'PERC_FAT_REAL') then
         begin
          DBGrid1.Canvas.Brush.Color:= clsilver ;
         end;




  if dm.qryProjecaoDespesasRDNIVEL.Value = 1  then
   begin
     DBGrid1.Canvas.Font.Style := [fsBold];
     if (Column.Field.FieldName = 'DESCRICAO') then
         begin
          DBGrid1.Canvas.Brush.Color:= $00DF3C37;
         end;

   end
  else
   begin
    if dm.qryProjecaoDespesasRDNIVEL.Value = 2 then
     begin
       DBGrid1.Canvas.Font.Style := [fsBold];
       if (Column.Field.FieldName = 'DESCRICAO') then
         begin
          DBGrid1.Canvas.Brush.Color:= $00A8B649;
         end;


     end

    else
     begin

     if (Column.Field.FieldName = 'DESCRICAO') then
       begin
          if odd(dm.qryProjecaoDespesasRD.RecNo) then
           DBGrid1.Canvas.Brush.Color:= clwhite
          else
           DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
          DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
       end;

     end;


   end;


//  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:=clred; //aqui é definida a cor do fundo
    Font.Color := clWhite;
    Font.Size :=   Font.Size + 2;
    Font.Style:= [fsbold];
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TfrmProjecaoDespesasRD.SpeedButton3Click(Sender: TObject);
var
 dataInicial, dataFinal : TDate;
 mes,ano : smallint;
begin
  inherited;

  dataInicial := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
 dataFinal :=  EndOfTheMonth(dataInicial);

  mes := StrToInt(FormatDateTime('MM',dataInicial));
  ano := StrToInt(FormatDateTime('YYYY',dataInicial));
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.Clear;
  dm.qryauxiliar.sql.Add('insert into projecoes_despesas_rd (mes, ano, cod_grupo) ');
  dm.qryauxiliar.sql.Add('              select '+IntToStr(mes)+','+Inttostr(ano)+',cod_grupo from r_grupos rg where rg.cod_grupo not in ');
  dm.qryauxiliar.sql.Add('               (select cod_grupo from projecoes_despesas_rd pj where pj.cod_grupo = rg.cod_grupo and pj.mes='+IntToStr(mes)+' and pj.ano = '+Inttostr(ano)+')');
  dm.qryauxiliar.ExecSQL;

  dm.transacao.Active := true;
  dm.transacao.Commit;

  dm.qryProjecaoDespesasRD.Active := false;
  dm.qryProjecaoDespesasRD.sql.clear;





  dm.qryProjecaoDespesasRD.SQL.add('   select rg.resultado,pj.mes, pj.ano,  pj.cod_grupo, rg.nivel,rg.cod_formatado||'+Quotedstr(' - ')+'|| udf_trim(rg.descricao) as descricao, ');
  dm.qryProjecaoDespesasRD.SQL.add('      tg.projecao_inicial,  cast(tg.perc_proj_fat as numeric(10,2)) as PERC_PROJ_FAT ,');
  dm.qryProjecaoDespesasRD.SQL.add('      tg.reprojecao, cast(tg.perc_reproj_fat as numeric(10,2)) AS PERC_REPROJ_FAT,       ');
  dm.qryProjecaoDespesasRD.SQL.add('      tg.total, cast(tg.perc_fat_real  as numeric(10,2)) AS PERC_FAT_REAL,                ');
  dm.qryProjecaoDespesasRD.SQL.add('      (tg.total - tg.reprojecao) as saldo,                                                ');
  dm.qryProjecaoDespesasRD.SQL.add('      cast(TG.PERC_DESP_GERAL as numeric(10,2)) as perc_geral,                            ');
  dm.qryProjecaoDespesasRD.SQL.add('      cast(TG.PERC_DESP_GRUPO_PAI as numeric(10,2)) as perc_grupo_pai,                    ');
  dm.qryProjecaoDespesasRD.SQL.add('      tg.proj_fat_mes,tg.reproj_fat_mes,tg.fat_real_mes,                                   ');
  dm.qryProjecaoDespesasRD.SQL.add('      rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobramento_filho, ');
  dm.qryProjecaoDespesasRD.SQL.add('      cast(pj.ano as varchar(04)) || udf_strzero( cast(pj.mes as varchar(2)),2) as mesano ');

  dm.qryProjecaoDespesasRD.SQL.add('     from projecoes_despesas_rd pj ');


  dm.qryProjecaoDespesasRD.SQL.add(' inner join totais_despesas_grupo(');

  dm.qryProjecaoDespesasRD.SQL.add(Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  )));
  dm.qryProjecaoDespesasRD.sql.Add(','+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )));
  dm.qryProjecaoDespesasRD.sql.Add(') tg on (tg.cod_grupo = pj.cod_grupo) ');
  dm.qryProjecaoDespesasRD.sql.Add('  inner join r_grupos rg on (rg.cod_grupo = tg.cod_grupo) ');
  dm.qryProjecaoDespesasRD.sql.Add(' where pj.mes='+IntToStr(mes)+' and pj.ano = '+Inttostr(ano)+'');
  dm.qryProjecaoDespesasRD.sql.Add('     order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobramento_filho ');

  dm.adicionaLog(dm.qryProjecaoDespesasRD.SQL.Text);

  frm_principal.memo_avisos.Lines := dm.qryProjecaoDespesasRD.SQL;
//  frm_principal.memo_avisos.Visible := true;
  dm.qryProjecaoDespesasRD.Active := true;

end;

procedure TfrmProjecaoDespesasRD.SpeedButton1Click(Sender: TObject);
var
 dataInicial, dataFinal : TDate;
 mes,ano : smallint;
begin
  inherited;

  dataInicial := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
 dataFinal :=  EndOfTheMonth(dataInicial);

  mes := StrToInt(FormatDateTime('MM',dataInicial));
  ano := StrToInt(FormatDateTime('YYYY',dataInicial));


  dm.transacao.Active := true;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('update  projecoes_despesas_rd pj set pj.projecao_inicial=');
  dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(Floattostr(edProjecaoInicial.Value))+', pj.reprojecao=');
  dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(Floattostr(edReproJecao.Value)));
  dm.qryauxiliar.sql.add(' where pj.cod_grupo='+Quotedstr(dm.qryProjecaoDespesasRDCOD_GRUPO.Value));
  dm.qryauxiliar.sql.Add(' and pj.mes='+IntToStr(mes)+' and pj.ano = '+Inttostr(ano)+'');
  dm.qryauxiliar.ExecSQL;
  dm.transacao.Commit;

  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.qryProjecaoDespesasRD.Active := false;
  dm.qryProjecaoDespesasRD.Active := True;
  pnAlterar.Visible := False;
  Panel2.Enabled := true;
  pn_principal.Enabled :=true;

end;

procedure TfrmProjecaoDespesasRD.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    pnAlterar.Visible := False;
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    dm.qryProjecaoDespesasRD.Active := False;
    dm.qryProjecaoDespesasRD.Active := true;
    Panel2.Enabled := true;
    pn_principal.Enabled :=true;

end;

procedure TfrmProjecaoDespesasRD.FormActivate(Sender: TObject);
var
anoAtual :  integer;
i : integer;
begin
  inherited;

  anoAtual := CurrentYear;
  cbAno.Clear;
  for I := 0 to 10 do
     begin
       cbAno.Items.Add(IntToStr(anoAtual-i));
     end;


  cbMes.SetFocus();

end;

procedure TfrmProjecaoDespesasRD.ListagemdeInsumoscomprados1Click(
  Sender: TObject);
var
 dataInicial, dataFinal : TDate;
 codGrupo : string;
begin

  dataInicial := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
 dataFinal :=  EndOfTheMonth(dataInicial);

  codGrupo := dm.qryProjecaoDespesasRD.fieldbyname('cod_grupo').Value;

  dRelatorios.qryRelItensCompraRDGrupo.Active := false;
  dRelatorios.qryRelItensCompraRDGrupo.sql.Clear;
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   select vi.cod_g_raiz,vi.desc_g_raiz, vi.cod_g_pai, vi.desc_g_pai, vi.cod_grupo, vi.desc_grupo,  ');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          ie.cod_item, vi.descricao_item,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          sum(ie.quantidade) as quantidade, ');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          (sum(ie.quantidade * ie.custo_medio) /   sum(ie.quantidade) ) as custo_medio,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('          sum(ie.quantidade * ie.custo_medio) as total');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('             from v_itens_entrada ie');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                inner join contas_a_pagar cpg on (cpg.codigo_entrada = ie.cod_entrada)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                inner join lancamentos_rd lr  on (lr.cod_ct_pagar = cpg.codigo)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                inner join v_itens_estoque vi on (vi.cod_item = ie.cod_item)');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                where  lr.status <> 2  and');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                 lr.data_rd between '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  ) ));
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                   and '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )));
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('                      and vi.cod_grupo starting  '+Quotedstr(codGrupo));
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   group by ie.cod_item, vi.descricao_item,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   vi.cod_g_raiz, vi.desc_g_raiz,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   vi.cod_g_pai, vi.desc_g_pai ,');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   vi.cod_grupo, vi.desc_grupo');
  dRelatorios.qryRelItensCompraRDGrupo.sql.Add('   order by vi.cod_g_raiz,vi.cod_g_pai,vi.cod_grupo, ie.cod_item');
  dm.adicionaLog(dRelatorios.qryRelItensCompraRDGrupo.sql.Text);
  dRelatorios.qryRelItensCompraRDGrupo.Active := true;
  dRelatorios.setPeriodoRelatorio('De  '+ DateToStr(dataInicial)  +'  até  '+DateToStr(dataFinal) );
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relItensCompraRD.fr3',true);
  dRelatorios.rpt.ShowReport(true);


end;

procedure TfrmProjecaoDespesasRD.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if (dm.qryProjecaoDespesasRDNIVEL.Value = 3) then
   begin
    Panel2.Enabled := false;
    pn_principal.Enabled := False;
    pnAlterar.Visible := true;
    edDescGrupo.Text := Trim(dm.qryProjecaoDespesasRDDESCRICAO.Value);
    edApuracaoReal.Value := dm.qryProjecaoDespesasRDTOTAL.Value;
    edProjecaoInicial.Value := dm.qryProjecaoDespesasRDPROJECAO_INICIAL.Value;
    edReproJecao.Value := dm.qryProjecaoDespesasRDREPROJECAO.Value; 
    edProjecaoInicial.SetFocus;
   end
  else
   begin
    ShowMessage('Só é permitida a alteração de valores em grupos analíticos '+#13+#10+'Os grupos sintéticos são atualizados automaticamente.');
   end;

end;

procedure TfrmProjecaoDespesasRD.bt_sairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmProjecaoDespesasRD.BitBtn2Click(Sender: TObject);
begin
  inherited;
  {
  Application.CreateForm(TfrmLancamentosRD,frmLancamentosRD);
  frmLancamentosRD.showmodal;
  frmLancamentosRD.free;
  dm.qryProjecaoDespesasRD.Active := False;
  dm.qryProjecaoDespesasRD.Active := true;
   }

 sv.Execute;
if sv.FileName <> '' then
  begin
   if FilesExists(sv.FileName) then
   begin

    if (MessageBox(0, 'Arquivo já existe, deseja sobrescrevê-lo ?', 'Sobrescrever arquivo ?', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
      begin
       DeleteFile(sv.FileName);
       dm.ExportaDatasetExcel(dm.qryProjecaoDespesasRD,sv.FileName);
       Showmessage(' Arquivo salvo com sucesso!');
      end;
   end
  else
    begin
       dm.ExportaDatasetExcel(dm.qryProjecaoDespesasRD,sv.FileName);
       Showmessage(' Arquivo salvo com sucesso!');
    end;
  end;
   
  

end;

procedure TfrmProjecaoDespesasRD.BitBtn1Click(Sender: TObject);
var
 dataInicial, dataFinal : TDate;
 mes,ano : smallint;
begin
  inherited;


  dataInicial := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
 dataFinal :=  EndOfTheMonth(dataInicial);

  mes := StrToInt(FormatDateTime('MM',dataInicial));
  ano := StrToInt(FormatDateTime('YYYY',dataInicial));
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm_relatorios.qryProjecaoRD.Active := false;
  dm_relatorios.qryProjecaoRD.sql.clear;

  dm_relatorios.rpt.Clear;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relEstatisticoVendasPeriodo.fr3',true);

  dm_relatorios.rpt.Clear;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relRdNovo.fr3',true);
  dm_relatorios.setPeriodoRelatorio(UpperCase( 'MÊS:  '+FormatDateTime('MMMM',dataInicial) +'/'+FormatDateTime('YYY',dataInicial)));


  dm_relatorios.qryProjecaoRD.SQL.add('     select rg.resultado,rg.cod_grupo_raiz, g1.descricao as desc_raiz,');
  dm_relatorios.qryProjecaoRD.SQL.add('            rg.desdobramento_pai, rg.cod_grupo_pai, g2.descricao as desc_pai,');
  dm_relatorios.qryProjecaoRD.SQL.add('        rg.desdobramento_filho ,   pj.cod_grupo,');
  dm_relatorios.qryProjecaoRD.SQL.add('        rg.nivel,udf_trim(rg.descricao) as descricao,');
  dm_relatorios.qryProjecaoRD.SQL.add('        tg.projecao_inicial,  cast(tg.perc_proj_fat as numeric(10,2)) as PERC_PROJ_FAT ,');
  dm_relatorios.qryProjecaoRD.SQL.add('        tg.reprojecao, cast(tg.perc_reproj_fat as numeric(10,2)) AS PERC_REPROJ_FAT,');
  dm_relatorios.qryProjecaoRD.SQL.add('        tg.total, cast(tg.perc_fat_real  as numeric(10,2)) AS PERC_FAT_REAL,');
  dm_relatorios.qryProjecaoRD.SQL.add('        (tg.total - tg.reprojecao) as saldo,');
  dm_relatorios.qryProjecaoRD.SQL.add('        cast(TG.PERC_DESP_GERAL as numeric(10,2)) as perc_geral,');
  dm_relatorios.qryProjecaoRD.SQL.add('        cast(TG.PERC_DESP_GRUPO_PAI as numeric(10,2)) as perc_grupo_pai,');
  dm_relatorios.qryProjecaoRD.SQL.add('        tg.proj_fat_mes,tg.reproj_fat_mes,tg.fat_real_mes');
  dm_relatorios.qryProjecaoRD.SQL.add('       from projecoes_despesas_rd pj');
  dm_relatorios.qryProjecaoRD.SQL.add('   inner join totais_despesas_grupo( ');

  dm_relatorios.qryProjecaoRD.SQL.add(Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  )));
  dm_relatorios.qryProjecaoRD.sql.Add(','+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )));
  dm_relatorios.qryProjecaoRD.sql.Add(') tg on (tg.cod_grupo = pj.cod_grupo) ');
  dm_relatorios.qryProjecaoRD.sql.Add('  inner join r_grupos rg on (rg.cod_grupo = tg.cod_grupo) ');
  dm_relatorios.qryProjecaoRD.sql.Add('   inner join grupos g1 on (g1.cod_grupo = rg.cod_grupo_raiz   )   ');
  dm_relatorios.qryProjecaoRD.sql.Add('   inner join grupos g2 on (g2.cod_grupo = rg.cod_grupo_pai)       ');

  dm_relatorios.qryProjecaoRD.sql.Add(' where pj.mes='+IntToStr(mes)+' and pj.ano = '+Inttostr(ano)+' and rg.nivel =3   and rg.resultado =1 ');
  dm_relatorios.qryProjecaoRD.sql.Add('     order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobramento_filho ');
  dm_relatorios.qryProjecaoRD.Active := true;
  dm_relatorios.rpt.PrepareReport(TRUE);
  dm_relatorios.rpt.ShowReport(true);

   SpeedButton3.Click;


end;

procedure TfrmProjecaoDespesasRD.exibeNotasLancamento(detalhado : boolean);
var
 codGrupo : string;
 dataInicial, dataFinal : TDate;
begin
  inherited;


  dataInicial := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
 dataFinal :=  EndOfTheMonth(dataInicial);

  codGrupo := dm.qryProjecaoDespesasRD.fieldbyname('cod_grupo').Value;

  dRelatorios.qryNotasRDPeriodo.Active :=false;
  dRelatorios.qryNotasRDPeriodo.sql.clear;


  dRelatorios.qryNotasRDPeriodo.sql.Add('select n.codigo, n.cod_fornecedor, f.razao_social, n.num_doc,n.data_documento,n.data_lancamento, n.data_rd,c.data_vencimento,  n.observacoes,  n.total as total_nota,  ( select sum(itr.valor) from itens_lancamento_rd');
  dRelatorios.qryNotasRDPeriodo.sql.Add('             itr where (itr.cod_lanc_rd  = n.codigo) and (itr.cod_grupo starting '+QuotedstR(codGrupo) +')');
  dRelatorios.qryNotasRDPeriodo.sql.Add('             ) as total_lancamentos');
  dRelatorios.qryNotasRDPeriodo.sql.Add(' from (');
  dRelatorios.qryNotasRDPeriodo.sql.Add('select * from  lancamentos_rd lr where');
  dRelatorios.qryNotasRDPeriodo.sql.Add('  lr.codigo in ( select distinct itr.cod_lanc_rd   from itens_lancamento_rd itr');
  dRelatorios.qryNotasRDPeriodo.sql.Add('                 where itr.cod_grupo starting  '+Quotedstr(codGrupo)+ ' )');
  dRelatorios.qryNotasRDPeriodo.sql.Add('                 and  lr.data_rd between '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  ))+'  and '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )) );
  dRelatorios.qryNotasRDPeriodo.sql.Add('        )  n');
  dRelatorios.qryNotasRDPeriodo.sql.Add('        inner join fornecedor f on (f.cod_fornecedor = n.cod_fornecedor)');
  dRelatorios.qryNotasRDPeriodo.sql.Add('        left join contas_a_pagar c on (c.codigo = n.cod_ct_pagar)');
  dRelatorios.qryNotasRDPeriodo.sql.Add('     order by n.data_rd,f.razao_social, n.total');
  dRelatorios.qryNotasRDPeriodo.Active := true;

  if (detalhado = false) then
    dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNotasRDperiodo.fr3',true)
  else
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNotasRDperiodoItens.fr3',true);


  dRelatorios.setPeriodoRelatorio('De  '+ DateToStr(dataInicial)  +'  até  '+DateToStr(dataFinal) );
  dRelatorios.setFiltroRelatorio(trim(dm.qryProjecaoDespesasRD.fieldbyname('descricao').Value));
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryNotasRDPeriodo.Active := false;


end;

procedure TfrmProjecaoDespesasRD.Detalhar1Click(Sender: TObject);
var
 dataInicial, dataFinal : TDate;
 mes,ano : smallint;
begin
  inherited;

  dataInicial := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
 dataFinal :=  EndOfTheMonth(dataInicial);

   application.CreateForm(TfrmRelLancamentosNotasRD, frmRelLancamentosNotasRD);
  frmRelLancamentosNotasRD.ed_data_inicial.Date := dataInicial;
  frmRelLancamentosNotasRD.ed_data_final.Date := dataFinal;
  frmRelLancamentosNotasRD.ShowModal;
  frmRelLancamentosNotasRD.Free;

end;

end.


