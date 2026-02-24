unit uuTestes;

interface

uses
  Winapi.Windows, System.Generics.Collections, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, uu_data_module, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, JvActionsEngine, JvControlActions,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  Vcl.ActnList, System.Actions, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  Data.DB, FireDAC.Comp.Client, acbrutil, Vcl.Mask, JvExMask, JvToolEdit,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmTestes = class(Tfrm_modelo_vazio)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    edArquivoCSV: TJvFilenameEdit;
    DBGrid1: TDBGrid;
    Button3: TButton;
    RelatorioComparativoAnual: TFDQuery;
    DSQryDRE: TDataSource;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    function AlignStringToRight(const InputStr: string; TotalWidth: Integer): string;
    function AlignStringToLeft(const InputStr: string; TotalWidth: Integer): string;
    procedure GetSQLDreComparativo(ALSQL: TStringList);
    procedure EscreveToTaisDosMeses(ARelatorio: TFlexCelReport);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}

procedure TfrmTestes.Button1Click(Sender: TObject);
var
  Memtb: TFDMemTable;
  LSQL: TStringList;
  LSplitedText, LTexto: Tstringlist;
  I: integer;
  LNCM, LDescricao: string;
  LListaSQL: TList<string>;
  CODIGO, SUBGRUPO, NOME_GRUPO, NOME_SUBGRUPO, COD_BARRAS: string;
  STATUS, DESCRICAO_PRODUTO, PRECO_COMPRA: string;
  PRECO_VENDA, NCM, CEST, UNIDADE: string;
begin
  inherited;
  LSplitedText := Tstringlist.create;
  LTexto := TStringList.Create;
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;

  try
    LTexto.LoadFromFile(edArquivoCSV.Text);

    for I := 0 to LTexto.Count - 1 do
    begin
      LSplitedText.Delimiter := ';';
      LSplitedText.StrictDelimiter := true;
      LSplitedText.DelimitedText := LTexto[I];

      CODIGO := LSplitedText[0];
      SUBGRUPO := LSplitedText[1];
      NOME_SUBGRUPO := LSplitedText[2];
      COD_BARRAS := LSplitedText[3];
      STATUS := LSplitedText[4];
      DESCRICAO_PRODUTO := LSplitedText[5];
      PRECO_COMPRA := LSplitedText[6];
      PRECO_VENDA := LSplitedText[7];
      NCM := LSplitedText[8];
      CEST := LSplitedText[9];
      UNIDADE := LSplitedText[10];
      NOME_GRUPO := LSplitedText[11];

      LSQL.clear;
      LSQL.add(' insert into PRODUTOS_TRAPICHE (');
      LSQL.add(' CODIGO,SUBGRUPO,NOME_SUBGRUPO, ');
      LSQL.add(' COD_BARRAS,STATUS,DESCRICAO_PRODUTO,');
      LSQL.add(' PRECO_COMPRA,PRECO_VENDA,NCM,CEST,UNIDADE,NOME_GRUPO) values (');
      LSQL.add(CODIGO + ',' + SUBGRUPO + ',' + QuotedStr(NOME_SUBGRUPO) + ',');
      LSQL.add(Quotedstr(COD_BARRAS) + ',' + STATUS + ',' + Quotedstr(DESCRICAO_PRODUTO) + ',');
      LSQL.add(dm.TrocaVirgPPto(PRECO_COMPRA) + ',' + dm.TrocaVirgPPto(PRECO_VENDA) + ',');
      LSQL.add(QUotedstr(NCM) + ',' + Quotedstr(CEST) + ',' + Quotedstr(UNIDADE) + ',' + QUotedstr(NOME_GRUPO) + ');');

       {
      CODIGO := SUBGRUPO := NOME_SUBGRUPO := COD_BARRAS := STATUS := DESCRICAO_PRODUTO := PRECO_COMPRA := PRECO_VENDA := NCM := CEST := UNIDADE := LSQL.clear;
      LSQL.add('insert into ncm (ncm,descricao) values (');
      LSQL.Add(Quotedstr(LNCM) + ',');
      LSQL.Add(Quotedstr(TiraAcentos(UpperCase(LDescricao))) + ');');
      }
      LListaSQL.Add(LSQL.Text);

    end;

    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
    showmessage('Tabela de NCMs atualizada!');

  finally
    FreeAndNil(LSplitedText);
    FreeAndNil(LTexto);
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
  end;

end;

function TfrmTestes.AlignStringToLeft(const InputStr: string; TotalWidth: Integer): string;
begin
  Result := InputStr.PadLeft(TotalWidth);
end;

function TfrmTestes.AlignStringToRight(const InputStr: string; TotalWidth: Integer): string;
begin
  Result := Format('%*s', [-TotalWidth, InputStr]);
end;

procedure TfrmTestes.Button2Click(Sender: TObject);
var
  Linha, LStr, LForma, Loperador, Lsistema, Ldiferenca: string;
begin
  Memo1.Lines.Clear;
  LStr := '    + Suprimento(fundo de troco):';

//  Linha := LStr := PadRightA(LStr, 36, '.');
//  LStr := PadLeft('R$ 12.325,12', 12, '.');
  Linha := Linha + LStr;
  Memo1.Lines.Add(Linha);
  LStr := '    + Produtos:';
  LStr := PadRightA(LStr, 36, '.');
  Linha := LStr;
  LStr := PadLeft('R$ 922,25', 12, '.');
  Linha := Linha + LStr;
  Memo1.Lines.Add(Linha);

  {
  Memo1.Lines.Clear;
  LForma := AlignStringToRight('Forma de pagto', 18);
  Loperador := AlignStringToLeft('|Sistema', 10);
  Lsistema := AlignStringToLeft('|Operad.', 10);
  Ldiferenca := AlignStringToLeft('|Dif.', 10);
  Linha := LForma + Lsistema + Loperador + Ldiferenca;
  Memo1.Lines.Add(Linha);
  LForma := AlignStringToRight('Dinheiro', 18);
  Loperador := AlignStringToLeft('4.365,11', 10);
  Lsistema := AlignStringToLeft('245,22', 10);
  Ldiferenca := AlignStringToLeft('45,22', 10);
  Linha := LForma + Lsistema + Loperador + Ldiferenca;
  Memo1.Lines.Add(Linha);

  LForma := AlignStringToRight('Débito', 18);
  Loperador := AlignStringToLeft('4.365,11', 10);
  Lsistema := AlignStringToLeft('18.125,22', 10);
  Ldiferenca := AlignStringToLeft('00,22', 10);
  Linha := LForma + Lsistema + Loperador + Ldiferenca;
  Memo1.Lines.Add(Linha);

  LForma := AlignStringToRight('Crédito', 18);
  Loperador := AlignStringToLeft('14.365,11', 10);
  Lsistema := AlignStringToLeft('22.134,22', 10);
  Ldiferenca := AlignStringToLeft('00,12', 10);
  Linha := LForma + Lsistema + Loperador + Ldiferenca;
  Memo1.Lines.Add(Linha);
  }
end;

procedure TfrmTestes.Button3Click(Sender: TObject);
var
  LSQL: TStringlist;
begin
  inherited;
  LSQL := TStringlist.create;

  try
    GetSQLDreComparativo(LSQL);
    dm.adicionaLog(LSQL.text);
    RelatorioComparativoAnual.Active := false;
    RelatorioComparativoAnual.SQL.clear;
    RelatorioComparativoAnual.SQL.add(LSQL.Text);
    RelatorioComparativoAnual.Active := true;
  finally
    FreeAndNil(LSQL);
  end;

end;

// Função para preencher a direita com espaços
function PadRight(const S: string; Len: Integer): string;
begin
  Result := S + StringOfChar(' ', Len - Length(S));
end;

// Função para preencher a esquerda com espaços
function PadLeft(const S: string; Len: Integer): string;
begin
  Result := StringOfChar(' ', Len - Length(S)) + S;
end;

procedure TfrmTestes.Button4Click(Sender: TObject);
var
  Relatorio: TFlexCelReport;
begin
  // Criar o relatório
  Relatorio := TFlexCelReport.Create(True);
  try
    // Dizer qual é o arquivo modelo
//    Relatorio.SetTemplate();

    // Conectar a query com o relatório


    if not SaveDialog1.Execute then
      exit;
    Relatorio.AddTable('RelatorioComparativoAnual', RelatorioComparativoAnual);
    EscreveToTaisDosMeses(Relatorio);
                                    {
    Relatorio.SetValue('TOTAL_JANEIRO', RelatorioComparativoAnual.FieldByName('TOTAL_JANEIRO').AsFloat);
    Relatorio.SetValue('FATURAMENTO_JANEIRO', RelatorioComparativoAnual.FieldByName('FATURAMENTO_JANEIRO').AsFloat);
    Relatorio.SetValue('RESULTADO_JANEIRO', RelatorioComparativoAnual.FieldByName('RESULTADO_JANEIRO').AsFloat);
    Relatorio.SetValue('PERCENTUAL_RESULTADO_JANEIRO', RelatorioComparativoAnual.FieldByName('PERCENTUAL_RESULTADO_JANEIRO').AsFloat);
                                     }
    // Gerar o relatório


    Relatorio.Run('c:\restaurante\modelord.xlsx', SaveDialog1.FileName + '.xlsx');

    // Salvar com outro nome
//    Relatorio.SaveAs('C:\relatorio_pronto.xlsx');

    ShowMessage('Relatório gerado com sucesso!');
  finally
    Relatorio.Free;
  end;
end;

procedure TfrmTestes.EscreveToTaisDosMeses(ARelatorio: TFlexCelReport);
const
  Meses: array[1..12] of string = ('JANEIRO', 'FEVEREIRO', 'MARCO', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO', 'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');
var
  i: Integer;
  Mes: string;
begin
  for i := 1 to 12 do
  begin
    Mes := Meses[i];
    ARelatorio.SetValue('DESPESAS_' + Mes, RelatorioComparativoAnual.FieldByName('DESPESAS_' + Mes).AsCurrency);
    ARelatorio.SetValue('FATURAMENTO_' + Mes, RelatorioComparativoAnual.FieldByName('FATURAMENTO_' + Mes).AsCurrency );
    ARelatorio.SetValue('RESULTADO_' + Mes, RelatorioComparativoAnual.FieldByName('RESULTADO_' + Mes).AsCurrency);
    ARelatorio.SetValue('PERCENTUAL_RESULTADO_' + Mes, RelatorioComparativoAnual.FieldByName('PERCENTUAL_RESULTADO_' + Mes).AsFloat);
  end;
end;

procedure TfrmTestes.GetSQLDreComparativo(ALSQL: TStringList);
begin

  ALSQL.Clear;
  ALSQL.Add('select');
  ALSQL.Add('    rg.cod_formatado,');
  ALSQL.Add('    t.COD_GRUPO,');
  ALSQL.Add('    t.DESCRICAO,');
  ALSQL.Add('    -- Janeiro (Mês 1)');
  ALSQL.Add('    max(case when t.MES = 1 then t.TOTAL end) as TOTAL_JANEIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 1 THEN t.FATURAMENTO END) as FATURAMENTO_JANEIRO,');
  ALSQL.Add('    max(case when t.MES = 1 then t.CMV end) as CMV_JANEIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 1 THEN t.TOTAL_DESPESAS END) as DESPESAS_JANEIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 1 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_JANEIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 1 THEN t.RESULTADO END) as RESULTADO_JANEIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 1 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_JANEIRO,');
  ALSQL.Add('    -- Fevereiro (Mês 2)');
  ALSQL.Add('    max(case when t.MES = 2 then t.TOTAL end) as TOTAL_FEVEREIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 2 THEN t.FATURAMENTO END) as FATURAMENTO_FEVEREIRO,');
  ALSQL.Add('    max(case when t.MES = 2 then t.CMV end) as CMV_FEVEREIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 2 THEN t.TOTAL_DESPESAS END) as DESPESAS_FEVEREIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 2 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_FEVEREIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 2 THEN t.RESULTADO END) as RESULTADO_FEVEREIRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 2 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_FEVEREIRO,');
  ALSQL.Add('    -- Março (Mês 3)');
  ALSQL.Add('    max(case when t.MES = 3 then t.TOTAL end) as TOTAL_MARCO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 3 THEN t.FATURAMENTO END) as FATURAMENTO_MARCO,');
  ALSQL.Add('    max(case when t.MES = 3 then t.CMV end) as CMV_MARCO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 3 THEN t.TOTAL_DESPESAS END) as DESPESAS_MARCO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 3 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_MARCO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 3 THEN t.RESULTADO END) as RESULTADO_MARCO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 3 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_MARCO,');
  ALSQL.Add('    -- Abril (Mês 4)');
  ALSQL.Add('    max(case when t.MES = 4 then t.TOTAL end) as TOTAL_ABRIL,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 4 THEN t.FATURAMENTO END) as FATURAMENTO_ABRIL,');
  ALSQL.Add('    max(case when t.MES = 4 then t.CMV end) as CMV_ABRIL,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 4 THEN t.TOTAL_DESPESAS END) as DESPESAS_ABRIL,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 4 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_ABRIL,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 4 THEN t.RESULTADO END) as RESULTADO_ABRIL,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 4 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_ABRIL,');
  ALSQL.Add('    -- Maio (Mês 5)');
  ALSQL.Add('    max(case when t.MES = 5 then t.TOTAL end) as TOTAL_MAIO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 5 THEN t.FATURAMENTO END) as FATURAMENTO_MAIO,');
  ALSQL.Add('    max(case when t.MES = 5 then t.CMV end) as CMV_MAIO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 5 THEN t.TOTAL_DESPESAS END) as DESPESAS_MAIO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 5 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_MAIO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 5 THEN t.RESULTADO END) as RESULTADO_MAIO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 5 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_MAIO,');
  ALSQL.Add('    -- Junho (Mês 6)');
  ALSQL.Add('    max(case when t.MES = 6 then t.TOTAL end) as TOTAL_JUNHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 6 THEN t.FATURAMENTO END) as FATURAMENTO_JUNHO,');
  ALSQL.Add('    max(case when t.MES = 6 then t.CMV end) as CMV_JUNHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 6 THEN t.TOTAL_DESPESAS END) as DESPESAS_JUNHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 6 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_JUNHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 6 THEN t.RESULTADO END) as RESULTADO_JUNHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 6 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_JUNHO,');
  ALSQL.Add('    -- Julho (Mês 7)');
  ALSQL.Add('    max(case when t.MES = 7 then t.TOTAL end) as TOTAL_JULHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 7 THEN t.FATURAMENTO END) as FATURAMENTO_JULHO,');
  ALSQL.Add('    max(case when t.MES = 7 then t.CMV end) as CMV_JULHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 7 THEN t.TOTAL_DESPESAS END) as DESPESAS_JULHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 7 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_JULHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 7 THEN t.RESULTADO END) as RESULTADO_JULHO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 7 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_JULHO,');
  ALSQL.Add('    -- Agosto (Mês 8)');
  ALSQL.Add('    max(case when t.MES = 8 then t.TOTAL end) as TOTAL_AGOSTO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 8 THEN t.FATURAMENTO END) as FATURAMENTO_AGOSTO,');
  ALSQL.Add('    max(case when t.MES = 8 then t.CMV end) as CMV_AGOSTO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 8 THEN t.TOTAL_DESPESAS END) as DESPESAS_AGOSTO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 8 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_AGOSTO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 8 THEN t.RESULTADO END) as RESULTADO_AGOSTO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 8 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_AGOSTO,');
  ALSQL.Add('    -- Setembro (Mês 9)');
  ALSQL.Add('    max(case when t.MES = 9 then t.TOTAL end) as TOTAL_SETEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 9 THEN t.FATURAMENTO END) as FATURAMENTO_SETEMBRO,');
  ALSQL.Add('    max(case when t.MES = 9 then t.CMV end) as CMV_SETEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 9 THEN t.TOTAL_DESPESAS END) as DESPESAS_SETEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 9 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_SETEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 9 THEN t.RESULTADO END) as RESULTADO_SETEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 9 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_SETEMBRO,');
  ALSQL.Add('    -- Outubro (Mês 10)');
  ALSQL.Add('    max(case when t.MES = 10 then t.TOTAL end) as TOTAL_OUTUBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 10 THEN t.FATURAMENTO END) as FATURAMENTO_OUTUBRO,');
  ALSQL.Add('    max(case when t.MES = 10 then t.CMV end) as CMV_OUTUBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 10 THEN t.TOTAL_DESPESAS END) as DESPESAS_OUTUBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 10 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_OUTUBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 10 THEN t.RESULTADO END) as RESULTADO_OUTUBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 10 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_OUTUBRO,');
  ALSQL.Add('    -- Novembro (Mês 11)');
  ALSQL.Add('    max(case when t.MES = 11 then t.TOTAL end) as TOTAL_NOVEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 11 THEN t.FATURAMENTO END) as FATURAMENTO_NOVEMBRO,');
  ALSQL.Add('    max(case when t.MES = 11 then t.CMV end) as CMV_NOVEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 11 THEN t.TOTAL_DESPESAS END) as DESPESAS_NOVEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 11 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_NOVEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 11 THEN t.RESULTADO END) as RESULTADO_NOVEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 11 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_NOVEMBRO,');
  ALSQL.Add('    -- Dezembro (Mês 12)');
  ALSQL.Add('    max(case when t.MES = 12 then t.TOTAL end) as TOTAL_DEZEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 12 THEN t.FATURAMENTO END) as FATURAMENTO_DEZEMBRO,');
  ALSQL.Add('    max(case when t.MES = 12 then t.CMV end) as CMV_DEZEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 12 THEN t.TOTAL_DESPESAS END) as DESPESAS_DEZEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 12 THEN t.PERCENTUAL_DESPESAS END) as PERCENTUAL_DESPESAS_DEZEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 12 THEN t.RESULTADO END) as RESULTADO_DEZEMBRO,');
  ALSQL.Add('    MAX(CASE WHEN t.MES = 12 THEN t.PERCENTUAL_RESULTADO END) as PERCENTUAL_RESULTADO_DEZEMBRO');
  ALSQL.Add('from TMP_FATURAMENTO_MENSAL t');
  ALSQL.Add(' inner join r_grupos rg on (rg.cod_grupo = t.cod_grupo)');
  ALSQL.Add('where t.MES <= 12');
  ALSQL.Add('group by rg.cod_grupo_raiz, rg.desdobramento_pai, rg.desdobramento_filho, rg.cod_formatado, t.COD_GRUPO, t.DESCRICAO');
  ALSQL.Add('ORDER BY rg.cod_grupo_raiz, rg.desdobramento_pai, rg.desdobramento_filho, rg.cod_formatado, t.cod_grupo, t.descricao');
end;

end.

