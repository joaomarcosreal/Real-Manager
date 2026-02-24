unit uuListagemTabelasPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls, frxDBSet,
  Vcl.ExtCtrls,
  cxGraphics, cxControls,
  cxLookAndFeelPainters,
  cxCheckComboBox, AdvGlassButton,


  FireDAC.Comp.Client, cxCheckBox, cxLookAndFeels, cxContainer, cxEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  Data.DB, FireDAC.Comp.DataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, Vcl.Buttons,
  Vcl.Menus, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type

 


  TfrmListagemTabelasPreco = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    cbkExibirPercentuais: TCheckBox;
    cbTabelaPreco: TcxCheckComboBox;
    Label1: TLabel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    FDMemTable1: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
  private

    procedure gerarRelatorio;











    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemTabelasPreco: TfrmListagemTabelasPreco;
  tbTabelaDePrecos : TFDMemTable;

implementation

uses
  uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmListagemTabelasPreco.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure  TfrmListagemTabelasPreco.gerarRelatorio();
var
 LSQL : TStringList;
 LTbAux : TFDMemTable;
 LTabelasSelecionadas : TSelecaoComboPesquisa;
 LArquivoRelatorio : string;
 dtCardapio: TfrxDBDataset; 
begin
  LTbAux := TFDMemTable.Create(Self);
  LTabelasSelecionadas := TSelecaoComboPesquisa.Create;
  dtCardapio := TfrxDBDataset.Create(self); 
  dtCardapio.Name     := 'dtCardapio';
  dtCardapio.UserName :='dtCardapio';
  
  LSQL := TstringList.create;
  LTabelasSelecionadas.selecionadas := '';
  LTabelasSelecionadas.qtd :=0;
 



  try
     try
        LSQL.add(' select * from (                                                                                                                                             ');
        LSQL.add('                                                                                                                                                             ');
        LSQL.add('   select p.cod_produto as CodProdutoSistema, p.cod_barras as codCardapio,0 as CodtabelaPreco,                                                               ');
        LSQL.add(' 		 tbp.descricao as NomeTabela, p.cod_barras as codProdutoTabela, p.descricao, p.valor_unitario as PrecoTabela,                                         ');
        LSQL.add(' 		 g.descricao as NomeGrupo, 0 as perc                                                                                                                  ');
        LSQL.add(' 		  from produtos p                                                                                                                                     ');
        LSQL.add(' 			inner join grupos_touch g on (g.codigo = p.cod_grupo_touch)                                                                                       ');
        LSQL.add(' 			inner join tabelas_preco tbp on (tbp.codigo =0)                                                                                                   ');
        LSQL.add(' 		  where p.vende=1                                                                                                                                     ');
        LSQL.add(' 	union all                                                                                                                                                 ');
        LSQL.add('   select p.cod_produto as CodProdutoSistema, p.cod_barras, ptp.cod_tabela as CodtabelaPreco,                                                                ');
        LSQL.add(' 		 tbp.descricao as NomeTabela, ptp.codigo as codProdutoTabela, p.descricao,                                                                            ');
        LSQL.add(' 		 ptp.valor_unitario  as PrecoTabela, g.descricao as NomeGrupo, udf_roundabnt( ((  (ptp.valor_unitario * 100) / p.valor_unitario ) -100 ) ,3 ) as perc ');
        LSQL.add(' 			from produtos_tabela_precos ptp                                                                                                                   ');
        LSQL.add(' 			  inner join tabelas_preco tbp on (tbp.codigo = ptp.cod_tabela)                                                                                   ');
        LSQL.add(' 			  inner join produtos p on (p.cod_produto = ptp.cod_produto)                                                                                      ');
        LSQL.add(' 			  inner join grupos_touch g on (g.codigo = p.cod_grupo_touch)                                                                                     ');
        LSQL.add(' 			  where p.vende=1 and ptp.valor_unitario > 0                                                                                                      ');
        LSQL.add(' 			  )');

        if cbTabelaPreco.States[0] = cbsChecked   then
         begin
          LTabelasSelecionadas.qtd := cbTabelaPreco.Properties.Items.Count -1;
         end
        else
         begin
           getSelecaoCombo(cbTabelaPreco,LTabelasSelecionadas,tiTabelaPrecos);
           LSQL.Add(' where  CodtabelaPreco in ('+LTabelasSelecionadas.selecionadas +')');
         end;


        dtCardapio.DataSet := LTbAux; 
        dRelatorios.rpt.DataSets.Add( dtCardapio );
        dm.getMemTable(LTbAux, LSQL.Text);

        if LTabelasSelecionadas.qtd > 3 then
          LArquivoRelatorio := 'relCardapioTabelasH'
        else
          LArquivoRelatorio := 'relCardapioTabelasV';

        if cbkExibirPercentuais.Checked  then
          LArquivoRelatorio := LArquivoRelatorio + 'Percentuais.fr3'
        else
         LArquivoRelatorio := LArquivoRelatorio + '.fr3';





        dRelatorios.rpt.LoadFromFile(patchAplicacao+'\relatorios\'+LArquivoRelatorio);
        dRelatorios.rpt.ShowReport(true);

     except
      on E: Exception do
       begin
         dm.exibe_painel_erro('Erro ao ','Ok');
         raise Exception.Create('Erro ao realizar operação');
       end;
     end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    dtCardapio.Close;
    FreeAndNil(dtCardapio); 
    FreeAndNil(LTbAux);

  end;
end;





procedure TfrmListagemTabelasPreco.btSelecionarClick(Sender: TObject);
begin
  inherited;
   gerarRelatorio;
end;

                                    
procedure TfrmListagemTabelasPreco.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbTabelaPreco,tiTabelaPrecos);
end;



  


end.
