unit uu_rel_compras_por_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  system.DateUtils, Dialogs, uu_modelo_Vazio, StdCtrls, Buttons,
  ExtCtrls, Mask,
  AdvDateTimePicker, AdvGlassButton,
  cxGraphics, cxControls, cxLookAndFeelPainters,
  cxCheckComboBox, cxCheckBox, cxLookAndFeels, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, PngSpeedButton;

type
  TfrmRelEntradasPorFornecedor = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Panel1: TPanel;
    gpOrdem: TRadioGroup;
    cknItensNota: TCheckBox;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    pnFornecedor: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    edDataFinal: TAdvDateTimePicker;
    edDataInicial: TAdvDateTimePicker;
    gpTipoEntrada: TRadioGroup;
    PngSpeedButton1: TPngSpeedButton;
    function verificaValidade(): boolean;
    procedure imprimirRelatorio();
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEntradasPorFornecedor: TfrmRelEntradasPorFornecedor;

implementation

uses
  uu_data_module, uu_frm_principal, UU_DM_RELATORIOS;

{$R *.dfm}

function TfrmRelEntradasPorFornecedor.verificaValidade(): boolean;
begin

  if edDataFinal.Date < edDataInicial.Date then
  begin
    showmessage('Período Inválido');
    edDataInicial.SetFocus;
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

  result := true;
end;

procedure TfrmRelEntradasPorFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(Now);
  edDataFinal.Date := Now;
  edDataInicial.SetFocus;
end;

procedure TfrmRelEntradasPorFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

procedure TfrmRelEntradasPorFornecedor.imprimirRelatorio();
var
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  i: integer;
  LSQL: TStringList;
begin

  LSQL := TstringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;

  try
    try

      dm.transacao.Active := false;
      dm.transacao.StartTransaction;
      if cbEmpresas.States[0] = cbsChecked then
      begin
        for i := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[i] := cbsChecked;
      end;
      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);

      LSQL.Clear;
      LSQL.add('   select e.*, f.razao_social, m.descricao as desc_modelo');
      LSQL.add('     from entradas e ');
      LSQL.add('       inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
      LSQL.add('       inner join modelos_nf m on (m.codigo = e.modelo_nota)');
      LSQL.add('     where e.data_entrada between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));

      if (Trim(ed_cod_fornecedor.Text) <> '') then
        LSQL.add(' and e.cod_fornecedor = ' + Quotedstr(ed_cod_fornecedor.text));

      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LSQL.Add('           and e.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')');
      end;


      case gpTipoEntrada.ItemIndex of
       1:  LSQL.Add(' and e.tipo_entrada = 0');
       2:  LSQL.Add(' and e.tipo_entrada = 1');

      end;


      case gpOrdem.ItemIndex of
        0:
          begin
            LSQL.Add(' order by e.cod_entrada');
          end;

        1:
          begin
            LSQL.Add('order by e.data_entrada ');
          end;

        2:
          begin
            LSQL.Add('order by e.cod_fornecedor');
          end;

        3:
          begin
            LSQL.Add('order by e.modelo_nota');
          end;

        4:
          begin
            LSQL.Add('order by e.total_nota ');
          end;
      end;

      dm.adicionaLog(LSQL.Text);
      dm_relatorios.qryCompras.SQL.Clear;
      dm_relatorios.qryCompras.SQL.Add(LSQL.Text);
      dm_relatorios.qryCompras.Active := true;

      dm_relatorios.setVariavelRelatorio('V_EMPRESAS_SELECIONADAS', cbEmpresas.Text);

      if cknItensNota.Checked then
        dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelatorioDeComprasPorFornecedor.fr3', true)
      else
        dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelatorioDeComprasPorFornecedorSemItens.fr3', true);

      if not dm_relatorios.qryCompras.IsEmpty then
      begin
        dm_relatorios.setPeriodoRelatorio(FormatDateTime('DD/MM/YYY', edDataInicial.Date) + '  ATÉ  ' + FormatDateTime('DD/MM/YYY', edDataFinal.Date));
        dm_relatorios.rpt.ShowReport(true);
      end
      else
        dm.exibe_painel_erro('Não existem lançamentos de compra para o período e/ou filtros informados', 'Ok');
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    dm_relatorios.qryCompras.Active := false;
    dm_relatorios.qryItensCompra.Active := false;
    dm.transacao.Rollback;
    FreeAndNil(LEmpresasSelecionadas);
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelEntradasPorFornecedor.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorFornecedor.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorFornecedor.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelEntradasPorFornecedor.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    imprimirRelatorio();
end;

procedure TfrmRelEntradasPorFornecedor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    imprimirRelatorio();
end;

end.

