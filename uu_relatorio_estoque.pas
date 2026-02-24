unit uu_relatorio_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask, ExtCtrls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, AdvGlassButton, cxCheckBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,
  PngSpeedButton;

type
  TfrmRelatorioEstoqueConferencia = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    SpeedButton3: TSpeedButton;
    Edit4: TEdit;
    SpeedButton4: TSpeedButton;
    Edit5: TEdit;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel1: TPanel;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    gpOrdem: TRadioGroup;
    Panel4: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    GroupBox3: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    PngSpeedButton1: TPngSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioEstoqueConferencia: TfrmRelatorioEstoqueConferencia;

implementation

uses
  uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelatorioEstoqueConferencia.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioEstoqueConferencia.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioEstoqueConferencia.btSelecionarClick(Sender: TObject);
var
  MyClass: TComponent;
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.active := true;
  try
    try

      dRelatorios.qryItensEstoque.Active := false;
      dRelatorios.qryItensEstoque.sql.Clear;

      dRelatorios.qryItensEstoque.SQL.clear;
      dRelatorios.qryItensEstoque.sql.add('select v.*,cast(v.percentual_ideal as numeric(10,2))  as percentual_estoque,r.estoque_atual,r.estoque_reposicao   from v_itens_estoque v ');
      dRelatorios.qryItensEstoque.sql.add('  inner join r_estoque_item r on (r.cod_item = v.cod_item)');
      dRelatorios.qryItensEstoque.SQL.add(' where cod_grupo like ' + Quotedstr(ed_cod_grupo.text + '%'));
      dRelatorios.qryItensEstoque.SQL.add('  order by v.cod_g_raiz,v.cod_g_pai,v.cod_grupo');
      dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelatorioEstoqueConferenciaAgrupado.fr3', true);

      case gpOrdem.ItemIndex of
        0:
          begin
            dRelatorios.qryItensEstoque.SQL.Add(',cod_item')
          end;
        1:
          begin
            dRelatorios.qryItensEstoque.SQL.Add(',descricao_item')
          end;
        2:
          begin
            dRelatorios.qryItensEstoque.SQL.Add(',custo_unitario')
          end;
        3:
          begin
            dRelatorios.qryItensEstoque.SQL.Add(',estoque_total')
          end;
      end;

      dm.adicionaLog(dRelatorios.qryItensEstoque.SQL.Text);
      dRelatorios.qryItensEstoque.Active := true;
      dRelatorios.rpt.ShowReport(true);

    except
      on E: Exception do
      begin
      end;
    end;
  finally
    dRelatorios.qryItensEstoque.Active := false;
    dm.transacao.Commit;
  end;

end;

procedure TfrmRelatorioEstoqueConferencia.FormCreate(Sender: TObject);
begin
  inherited;
 carregaDadosCombo(cbEmpresas, tiEmpresas);
end;

procedure TfrmRelatorioEstoqueConferencia.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
close;
end;

end.

