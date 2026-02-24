unit uuRelCurvaABCProdutosVendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.DateUtils, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uu_modelo_Vazio, AdvGlassButton, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvValidateEdit, frxDBSet, AdvDateTimePicker, FireDAC.Comp.Client, JvExStdCtrls,
  JvEdit, Vcl.ComCtrls, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons, cxCheckBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCheckComboBox, PngSpeedButton, Vcl.Menus;

type
  TfrmRelCurvaABCProdutosVendidos = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel2: TPanel;
    edPCTA: TJvValidateEdit;
    Label1: TLabel;
    Label2: TLabel;
    edPCTB: TJvValidateEdit;
    Label5: TLabel;
    edPCTC: TJvValidateEdit;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    GroupBox3: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    PngSpeedButton1: TPngSpeedButton;
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    procedure gerarRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCurvaABCProdutosVendidos: TfrmRelCurvaABCProdutosVendidos;

implementation

{$R *.dfm}

uses
  uu_data_module, uu_frm_principal, UU_DM_RELATORIOS;

procedure TfrmRelCurvaABCProdutosVendidos.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelCurvaABCProdutosVendidos.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidadeDatas(ed_data_inicial.Date, ed_data_final.Date) then
  begin
    gerarRelatorio;

  end;
end;

procedure TfrmRelCurvaABCProdutosVendidos.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := StartOfTheMonth(data_do_sistema);
  ed_data_final.Date := EndOfTheMonth(data_do_sistema);
end;

procedure TfrmRelCurvaABCProdutosVendidos.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

procedure TfrmRelCurvaABCProdutosVendidos.gerarRelatorio();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  dtCurvaABCProdutosVendidos: TfrxDBDataset;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  I : integer;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;

  dtCurvaABCProdutosVendidos := TfrxDBDataset.Create(self);
  dtCurvaABCProdutosVendidos.UserName := 'dtCurvaABCVenda';
  dtCurvaABCProdutosVendidos.Name := dtCurvaABCProdutosVendidos.UserName;
  dm_relatorios.setPeriodoRelatorio('De ' + FormatDateTime('DD/MM/YY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YY', ed_data_final.Date));

  try
    try

      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);


      LSQL.Clear;
      LSQL.add(' select r.*, g.descricao as descricaoGrupo from r_curva_abc(' + dm.TrocaVirgPPto(edPCTA.Value) + ',' + dm.TrocaVirgPPto(edPCTB.value) + ',' + dm.TrocaVirgPPto(edPCTC.Value) + ',');
      LSQL.Add(Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.date)));
      LSQL.Add(',' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.date)));
      LSQL.add(',' + Quotedstr('') + ') r');
      LSQL.add(' inner join grupos g on (g.cod_grupo = r.cod_grupo) ');
      dm_relatorios.qryRelCurvaABCProdutosVendidos.SQL.Clear;
      dm_relatorios.qryRelCurvaABCProdutosVendidos.SQL.Add(LSQL.Text);

//       dm.adicionalog(LSQL.Text);
  //     dm.getMemTable(LTbAux, LSQL.Text);
    //   dtCurvaABCProdutosVendidos.DataSet := LTbAux;
//       dm_relatorios.rpt.DataSets.Add(dtCurvaABCProdutosVendidos);
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + '\relatorios\relCurvaABCProdutosVendidos.fr3');
      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);
      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryRelCurvaABCProdutosVendidos.Active := False;


    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro ao gerar o relatório!');
      end;
    end;
  finally
  dm_relatorios.qryRelCurvaABCProdutosVendidos.active := false;
    FreeAndNil(LSQL);
    FreeAndNil(dtCurvaABCProdutosVendidos);
    FreeAndNil(LEmpresasSelecionadas);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmRelCurvaABCProdutosVendidos.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
 close;
end;

end.

