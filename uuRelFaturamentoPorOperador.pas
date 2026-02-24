unit uuRelFaturamentoPorOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,  System.DateUtils, frxDBSet,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, cxGraphics,
  cxControls, cxLookAndFeelPainters,
  AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls, AdvGlassButton,
  cxCheckComboBox,



  FireDAC.Comp.Client, cxCheckBox, cxLookAndFeels, cxContainer, cxEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  Data.DB, FireDAC.Comp.DataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.ComCtrls, JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  Vcl.Buttons, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus;

type
  TfrmRelFaturamentoPorOperador = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    rdTipoRelatorio: TRadioGroup;
    cbFormasPagamento: TcxCheckComboBox;
    cbOperadores: TcxCheckComboBox;
    FDMemTable1: TFDMemTable;
    procedure FormActivate(Sender: TObject);
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
  frmRelFaturamentoPorOperador: TfrmRelFaturamentoPorOperador;

implementation

uses
  uu_frm_principal, uu_data_module, uuDmRelatorios;

{$R *.dfm}

procedure TfrmRelFaturamentoPorOperador.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelFaturamentoPorOperador.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidadeDatas(ed_data_inicial.Date, ed_data_final.Date)  then
   begin
     gerarRelatorio;

   end;

end;

procedure  TfrmRelFaturamentoPorOperador.gerarRelatorio();
var
 LSQL : TStringList;
 LTbAux : TFDMemTable;
 dtFaturamentoOperador : TfrxDBDataset;
 LUsuariosSelecionados, LFormasSelecionadas : TSelecaoComboPesquisa;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  LUsuariosSelecionados := TSelecaoComboPesquisa.Create;
  LFormasSelecionadas   := TSelecaoComboPesquisa.Create;

  dtFaturamentoOperador := TfrxDBDataset.Create(self);
  dtFaturamentoOperador.UserName := 'dtFaturamentoOperador';
  dtFaturamentoOperador.Name     :=  dtFaturamentoOperador.UserName;
  dRelatorios.setPeriodoRelatorio('De '+FormatDateTime('DD/MM/YY',ed_data_inicial.Date)+' até '+FormatDateTime('DD/MM/YY',ed_data_final.Date));

  LSQL.Clear;
  LSQL.Add('Usuários '+cbOperadores.Text);
  LSQL.Add('Formas: '+cbFormasPagamento.Text);
  dRelatorios.setFiltroRelatorio(LSQL.Text);
  LSQL.Clear;





  try
     try
       getSelecaoCombo(cbOperadores,LUsuariosSelecionados,tiUsuariosCaixa);
       getSelecaoCombo(cbFormasPagamento,LFormasSelecionadas, tiFormasPagamento);

       LSQL.Clear;
       LSQL.Add(' select  fp.cod_forma, fp.descricao,  c.cod_usuario, c.nome_usuario, r.data, coalesce(sum(r.valor),0) as total ');
       LSQL.Add('   from recebimentos r                                                                                         ');
       LSQL.Add('     inner join caixas c on (c.codigo  = r.cod_caixa)                                                          ');
       LSQL.Add('     inner join formas_pagamento fp on (fp.cod_forma = r.cod_forma)                                            ');
       LSQL.Add('     inner join usuarios u on (u.cod_usuario = c.cod_usuario)                                                  ');
       LSQL.Add('   where r.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial.date)));
       LSQL.Add('                 and '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final .date)));

       if cbOperadores.States[0] = cbsUnchecked  then
        begin
          LSQL.Add('and c.cod_usuario in ('+LUsuariosSelecionados.selecionadas+')');
        end;

       if cbFormasPagamento.States[0] = cbsUnchecked  then
        begin
          LSQL.Add('and fp.cod_forma in ('+LFormasSelecionadas.selecionadas+')');
        end;


       LSQL.Add('    group by  c.cod_usuario, c.nome_usuario, fp.cod_forma, r.data, fp.descricao                                ');
       LSQL.Add('      order by r.data, c.cod_usuario                                                                           ');

       dm.adicionalog(LSQL.Text);
       dm.getMemTable(LTbAux, LSQL.Text);
       dtFaturamentoOperador.DataSet := LTbAux;
       dRelatorios.rpt.DataSets.Add( dtFaturamentoOperador);

       case rdTipoRelatorio.ItemIndex of
        0: dRelatorios.rpt.LoadFromFile(patchAplicacao+'\relatorios\relFaturamentoPorOperadorLinear.fr3');
        1: dRelatorios.rpt.LoadFromFile(patchAplicacao+'\relatorios\relFaturamentoOperadorAgOperador.fr3');
       end;

       dRelatorios.rpt.ShowReport(true);

     except
      on E: Exception do
       begin
         dm.exibe_painel_erro('Erro ao ','Ok');
         raise Exception.Create('Erro ao gerar o relatório!');
       end;
     end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(dtFaturamentoOperador);
    FreeAndNil(LUsuariosSelecionados);
    FreeAndNil(LFormasSelecionadas);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmRelFaturamentoPorOperador.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date  := StartOfTheMonth(data_do_sistema);
  ed_data_final.Date    := EndOfTheMonth(data_do_sistema);
end;

procedure TfrmRelFaturamentoPorOperador.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbOperadores, tiUsuariosCaixa);
  carregaDadosCombo(cbFormasPagamento, tiFormasPagamento);

end;

end.
