unit uu_frm_listagem_prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RDprint, StdCtrls,  ExtCtrls, Buttons, 
  DB, ibx.ibcustomdataset, ibx.Ibquery;

  
    type TAux_item =class
    public
    total_item:  integer;
    total_monetario : real;

  end;

type
  Tfrm_listagem_produtos = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lb: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Label14: TLabel;
    RadioGroup1: TRadioGroup;
    cb_tipo_relatorio: TComboBox;
    ed_cod_grupo: TFocusEdit;
    ed_desc_grupo: TFocusEdit;
    cbk_visualizar: TCheckBox;
    ckb_ficha_tec: TCheckBox;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    rdp: TRDprint;
    procedure cb_tipo_relatorioEnter(Sender: TObject);
    procedure cb_tipo_relatorioExit(Sender: TObject);
    procedure cb_tipo_relatorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_pesq_grupoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imprimir_cabecalho;
    procedure corpo_relatorio;
    procedure bt_imprimirClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure imprime_listagem_grupos();

    procedure  imprime_subgrupos(cod_sub_grupo : string);
    function   imprime_itens(cod_grupo : string) : TAux_item;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_listagem_produtos: Tfrm_listagem_produtos;
  linha : integer;

implementation

uses uu_data_module, uu_cs_grupos_estoque, uu_frm_principal, uu_cad_grupos,
  uu_cs_grupos;

{$R *.dfm}

procedure Tfrm_listagem_produtos.cb_tipo_relatorioEnter(Sender: TObject);
begin
 

 if  sender is TComboBox then
  begin
     (sender as TComboBox).DroppedDown:=true;
     (sender as TComboBox).Color:=cor_foco_edit;
  end;

end;

procedure Tfrm_listagem_produtos.cb_tipo_relatorioExit(Sender: TObject);
begin

  

 if  sender is TComboBox then
  begin
     (sender as TComboBox).DroppedDown:=false;
     (sender as TComboBox).Color:=clWhite;
  end;


   if  sender is TComboBox and ((sender as TComboBox).Name='cb_tipo_relatorio') then
   begin
     If cb_tipo_relatorio.ItemIndex = 0 then ckb_ficha_tec.SetFocus
     else
     ed_cod_grupo.SetFocus;

   end;

   if ( (sender is Tedit and ((sender as Tedit).Name='ed_cod_grupo')) and (cb_tipo_relatorio.ItemIndex=1)) then
    begin
       try
        ed_cod_grupo.Text:=formatfloat('00',StrToFloat(ed_cod_grupo.Text));
       except
        begin
           ShowMessage('Código do grupo inválido!');
           ed_cod_grupo.SetFocus;
           ed_cod_grupo.Clear;
           exit;
        end;
       end;

       dm.qryauxiliar.Active:=false;
       dm.qryauxiliar.SQL.Clear;
       dm.qryauxiliar.SQL.add('select * from GRUPOS where COD_GRUPO='+Quotedstr(ed_cod_grupo.Text));
       dm.qryauxiliar.Active:=true;

       if dm.qryauxiliar.IsEmpty then
       begin
         ShowMessage('Não existe grupo cadastrado com o código informado!');
         ed_cod_grupo.clear;
         ed_desc_grupo.clear;
         ed_cod_grupo.setfocus;
         exit;
       end;
       ed_desc_grupo.Text:=dm.qryauxiliar.fieldbyname('descricao').value;
    end;



end;

procedure Tfrm_listagem_produtos.cb_tipo_relatorioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;


  if key=vk_f2 then
  begin
    if  sender is Tedit and ((sender as Tedit).Name='ed_cod_grupo') then
     begin
       bt_pesq_grupo.Click;
     end;

  end;

  if key=vk_escape then
  begin
   if  not (sender is  TComboBox ) then
    begin
     cb_tipo_relatorio.SetFocus;
     exit;
    end
   else
     Close;
  end;



end;

procedure Tfrm_listagem_produtos.bt_pesq_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cs_GRUPOS,frm_cs_GRUPOS);;
  frm_cs_GRUPOS.showmodal;
  frm_cs_GRUPOS.Free;
  ed_cod_grupo.Text:=string_auxiliar;

end;

procedure Tfrm_listagem_produtos.FormActivate(Sender: TObject);
begin
  cb_tipo_relatorio.SetFocus;
end;

procedure Tfrm_listagem_produtos.imprimir_cabecalho;
begin
  dm.tb_parametros.Active:=true;
  rdp.ImpF(linha,1,dm.tb_parametros.fieldbyname('razao_social').Value+' - '+dm.tb_parametros.fieldbyname('nome_fantasia').Value,[negrito]);
  linha:=linha+1;
  rdp.ImpF(linha,1,'Data: '+FormatDateTime('DD/MM/YY',data_do_sistema)+' - Hora: '+formatdatetime('HH:MM',time),[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'Usuário: '+codigo_usuario,[negrito]);
  linha:=linha+3;

  if ckb_ficha_tec.Checked then
   rdp.ImpC(linha,1,dm.Padc('RELATÓRIO DE PRODUTOS',65),[expandido,negrito])
  else
  rdp.Impf(linha,1,dm.Padc('RELATÓRIO DE PRODUTOS',65),[expandido,negrito]);

  linha:=linha+2;
  rdp.impf(linha,1,'Cód',[negrito]);
  rdp.impf(linha,7,'Descrição',[negrito]);
  rdp.impf(linha,39,'Grupo',[negrito]);
  rdp.impf(linha,60,'Vendas',[negrito]);
  rdp.ImpF(linha,67,'Preço',[negrito]);

  linha:=linha+1;
  rdp.impf(linha,1,'-----------------------------------------------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
end;


procedure Tfrm_listagem_produtos.corpo_relatorio;
begin
  rdp.Abrir;
  imprimir_cabecalho;
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.Clear;
  if cb_tipo_relatorio.ItemIndex = 0 then
   dm.qryauxiliar.SQL.Add('select * from GRUPOS order by COD_GRUPO')
  else
   dm.qryauxiliar.SQL.Add('select * from GRUPOS  where COD_GRUPO='+Quotedstr(ed_cod_grupo.Text)+' order by COD_GRUPO');

  dm.qryauxiliar.Active:=true;
  dm.qryauxiliar.first;

  while not dm.qryauxiliar.eof do
  begin
    dm.qryauxiliar2.Active:=false;
    dm.qryauxiliar2.SQL.Clear;
    dm.qryauxiliar2.sql.add('select produtos.* , aliquotas.cod_aliquota,aliquotas.descricao as desc_aliq,');
    dm.qryauxiliar2.sql.add('GRUPOS.COD_GRUPO,GRUPOS.descricao as desc_grupo from produtos,aliquotas,');
    dm.qryauxiliar2.sql.add('GRUPOS where aliquotas.cod_aliquota=produtos.cod_aliquota and');
    dm.qryauxiliar2.sql.add('GRUPOS.COD_GRUPO=produtos.COD_GRUPO  and produtos.COD_GRUPO='+QuotedStr(dm.qryauxiliar.fieldbyname('COD_GRUPO').Value)+' order by produtos.descricao');//cod_produto');
    dm.qryauxiliar2.Active:=true;
    dm.qryauxiliar2.First;

    while not dm.qryauxiliar2.Eof do
    begin
      if linha >= 65 then
      begin
        rdp.Novapagina;
        Linha:=1;
        imprimir_cabecalho;
      end;
      if ckb_ficha_tec.Checked=false then
       begin
        rdp.impf(linha,1,dm.qryauxiliar2.fieldbyname('cod_produto').value,[]);
        rdp.impf(linha,7,dm.qryauxiliar2.fieldbyname('descricao').value,[]);
        rdp.impf(linha,39,dm.qryauxiliar2.fieldbyname('desc_grupo').value,[]);
        rdp.impf(linha,60,Inttostr(dm.qryauxiliar2.fieldbyname('numero_vendas').value),[]);
        rdp.ImpF(linha,67,FormatFloat('R$ #0.00',(dm.qryauxiliar2.fieldbyname('valor_unitario').value) ),[]);
        linha:=linha+1;
       end
      else
      begin
        rdp.impf(linha,1,dm.qryauxiliar2.fieldbyname('cod_produto').value,[negrito]);
        rdp.impf(linha,7,dm.qryauxiliar2.fieldbyname('descricao').value,[negrito]);
        rdp.impf(linha,39,dm.qryauxiliar2.fieldbyname('desc_grupo').value,[negrito]);
        rdp.impf(linha,60,Inttostr(dm.qryauxiliar2.fieldbyname('numero_vendas').value),[negrito]);
        rdp.ImpF(linha,67,FormatFloat('R$ #0.00',(dm.qryauxiliar2.fieldbyname('valor_unitario').value) ),[negrito]);
        linha:=linha+1;

        dm.qryauxiliar3.Active:=false;
        dm.qryauxiliar3.sql.clear;
        dm.qryauxiliar3.SQL.Add('select composicoes_produto.*,itens_estoque.cod_item,itens_estoque.descricao_item,');
        dm.qryauxiliar3.SQL.Add(' unidades.cod_unidade,unidades.descricao,unidades.parametro from composicoes_produto,itens_estoque,unidades where itens_estoque.cod_item=composicoes_produto.cod_item and');
        dm.qryauxiliar3.SQL.Add(' unidades.cod_unidade=composicoes_produto.unidade and composicoes_produto.cod_produto='+QuotedStr(dm.qryauxiliar2.fieldbyname('cod_produto').value));
        dm.qryauxiliar3.Active:=true;
        dm.qryauxiliar3.First;

        while not dm.qryauxiliar3.eof do
        begin
           if linha >= 65 then
            begin
             rdp.Novapagina;
             Linha:=1;
            imprimir_cabecalho;
            end;
            rdp.impf(linha,5,'*'+FormatFloat('#0.00',(dm.qryauxiliar3.fieldbyname('quantidade').value/dm.qryauxiliar3.fieldbyname('parametro').value)),[]);
            rdp.ImpF(linha,15,dm.qryauxiliar3.fieldbyname('descricao').value,[]);
            rdp.ImpF(linha,35,dm.qryauxiliar3.fieldbyname('descricao_item').value,[]);
            linha:=linha+1;
            dm.qryauxiliar3.Next;
        end;
      end;
      dm.qryauxiliar2.next;
    end;
    dm.qryauxiliar.Next;
  end;

  if cbk_visualizar.Checked then
   begin
    rdp.OpcoesPreview.Preview:=true;
    rdp.OpcoesPreview.CaptionPreview:='Listagem de Produtos';
    rdp.OpcoesPreview.Remalina:=true;
    rdp.Fechar;
   end
  else
   begin
     rdp.OpcoesPreview.Preview:=False;
     if rdp.Setup then rdp.Fechar;
   end;

end;


procedure Tfrm_listagem_produtos.bt_imprimirClick(Sender: TObject);
begin
  linha:=1;
//  corpo_relatorio;
  imprime_listagem_grupos;

end;

procedure Tfrm_listagem_produtos.bt_sairClick(Sender: TObject);
begin
  close;
end;


procedure Tfrm_listagem_produtos.imprime_listagem_grupos();
begin
  rdp.Abrir;
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  if cb_tipo_relatorio.ItemIndex = 0 then
     dm.qryauxiliar.sql.add('select * from grupos  where cod_grupo_pai is null order by descricao')
  else
     dm.qryauxiliar.sql.add('select * from grupos where cod_grupo ='+Quotedstr(ed_cod_grupo.Text));
  dm.qryauxiliar.Active:=true;
  linha:=1;
  imprimir_cabecalho;

  while not dm.qryauxiliar.eof do
  begin
     coluna:=1;
     linha:=linha+1;
     rdp.impf(linha,coluna,dm.qryauxiliar.fieldbyname('descricao').value,[negrito]);
     linha:=linha+1;
     imprime_subgrupos(dm.qryauxiliar.fieldbyname('cod_grupo').value);
     linha:=linha+1;
     rdp.impf(linha,1,'-----------------------------------------------------------------------------------------------------------------------------------',[negrito]);
     dm.qryauxiliar.Next;
  end;
  rdp.Fechar;
end;







procedure Tfrm_listagem_produtos.imprime_subgrupos(cod_sub_grupo : string);
var
 q : TIBQuery;
 resumo_itens : TAux_item;
begin
 q:=TIBQuery.Create(frm_principal);
 resumo_itens:= TAux_item.Create;
 q.Database:=dm.dbrestaurante;
 q.Active:=false;
 q.sql.Clear;
 q.SQL.Add('select * from grupos where cod_grupo_pai='+Quotedstr(cod_sub_grupo));
 q.Active:=true;
 coluna:=coluna+2;



 while not q.Eof  do
 begin
   rdp.impf(linha,coluna,q.fieldbyname('descricao').value,[negrito]);
   coluna:=coluna+2;
   linha:=linha+1;
   resumo_itens:=imprime_itens(q.fieldbyname('cod_grupo').value);
   if resumo_itens.total_item > 0 then
    begin
      rdp.impf(linha,coluna+7,'Nº DE ÍTENS: '+Inttostr(resumo_itens.total_item),[negrito]);
      rdp.impf(linha,116,dm.Impdireita(FormatFloat('R$ #0.000',resumo_itens.total_monetario) ,15),[negrito]);
      linha:=linha+1;
    end;

   coluna:=coluna-2;
   imprime_subgrupos(q.fieldbyname('cod_grupo').value);
   coluna:=coluna-2;
   q.Next;
 end;

end;



 function Tfrm_listagem_produtos.imprime_itens(cod_grupo : string) : TAux_item;
var
 q : TIBQuery;
begin
  q:=TIBQuery.Create(Self);
  Result:=  TAux_item.Create;
  Result.total_item:=0;
  Result.total_monetario:=0;

  q.Database:=dm.dbrestaurante;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select p.cod_produto, p.descricao, p.valor_unitario,p.data_cadastro,p.cod_grupo,p.ultima_venda,gp.descricao,al.descricao as aliquota');
  q.sql.add(' from produtos p  inner join grupos gp on (gp.cod_grupo = p.cod_grupo) ');
  q.sql.add(' inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
  q.sql.add('     where p.cod_grupo='+Quotedstr(cod_grupo));
  q.sql.add(' order by p.descricao');


  q.Active:=true;
  q.first;

  while not q.eof do
  begin
    if linha >= 60 then
    begin
      rdp.Novapagina;
      linha:=1;
      imprimir_cabecalho;
    end;
    rdp.impf(linha,coluna,q.fieldbyname('cod_produto').value+'  '+q.fieldbyname('descricao').value+IntTostr(coluna),[]);
    rdp.impf(linha,63,dm.impdireita(FormatFloat('R$ #0.00',StrToFloat(q.fieldbyname('valor_unitario').value)),15) ,[]);
    rdp.impf(linha,80,FormatDateTime('DD/MM/YYY',q.fieldbyname('data_cadastro').value),[]);
    rdp.impf(linha,92,FormatDateTime('DD/MM/YYY',q.fieldbyname('ultima_venda').value),[]);
    rdp.impf(linha,103,q.fieldbyname('aliquota').value,[]);
//    rdp.ImpF(linha,75,q.fieldbyname('unidade_inteira').AsString,[] );

   { if q.fieldbyname('estoque_fracionario').value > 0  then
     begin
        rdp.impf(linha,95,'+ '+dm.impdireita(FormatFloat('#0.00',StrToFloat(q.fieldbyname('estoque_fracionario').value)),4) ,[]);
        rdp.ImpF(linha,107,q.fieldbyname('sigla_frac').AsString,[] );
     end;

    Result.total_item:=Result.total_item+1;
    Result.total_monetario:= Result.total_monetario+q.fieldbyname('estoque_dinheiro').value;
    rdp.impf(linha,116,dm.impdireita(FormatFloat('R$ #0.000',StrToFloat(q.fieldbyname('estoque_dinheiro').value)),15) ,[]);
      }



    linha:=linha+1;
    q.Next;
  end;
end;





end.
