unit uuRelatorioEstoqueReposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, ExtCtrls, Buttons, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, PngSpeedButton, cxCheckBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,
  AdvGlassButton;

type
  TfrmRelatorioEstoqueReposicao = class(Tfrm_modelo_vazio)
    Edit3: TEdit;
    Panel4: TPanel;
    Panel1: TPanel;
    gpOrdem: TRadioGroup;
    ckAgrupar: TCheckBox;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    GroupBox3: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    procedure GerarRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioEstoqueReposicao: TfrmRelatorioEstoqueReposicao;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelatorioEstoqueReposicao.GerarRelatorio();
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryItensEstoque.Active:=false;
  dRelatorios.qryItensEstoque.sql.Clear;


  if ckAgrupar.Checked then
   begin
     dRelatorios.qryItensEstoque.SQL.clear;
     dRelatorios.qryItensEstoque.sql.add('select v.*,cast(v.percentual_ideal as numeric(10,2))  as percentual_estoque,r.estoque_atual,r.estoque_reposicao   from v_itens_estoque v ');
     dRelatorios.qryItensEstoque.sql.add('  inner join r_estoque_item r on (r.cod_item = v.cod_item) ');
     dRelatorios.qryItensEstoque.SQL.add(' where v.estoque_total <= v.estoque_minimo and  cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
     dRelatorios.qryItensEstoque.SQL.add('  order by v.cod_g_raiz,v.cod_g_pai,v.cod_grupo');



     dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioEstoqueReposicaoAgrupado.fr3',true);

     case gpOrdem.ItemIndex of
       0 : begin
            dRelatorios.qryItensEstoque.SQL.Add(',cod_item')
           end;
       1 : begin
            dRelatorios.qryItensEstoque.SQL.Add(',descricao_item')
           end;
       2 : begin
            dRelatorios.qryItensEstoque.SQL.Add(',custo_unitario')
           end;
       3 : begin
            dRelatorios.qryItensEstoque.SQL.Add(',estoque_total')
           end;
     end
   end
  else
    begin
      dRelatorios.qryItensEstoque.SQL.clear;
      dRelatorios.qryItensEstoque.sql.add('select v.*,cast(v.percentual_ideal as numeric(10,2))  as percentual_estoque,r.estoque_atual,r.estoque_reposicao   from v_itens_estoque v ');
      dRelatorios.qryItensEstoque.sql.add('  inner join r_estoque_item r on (r.cod_item = v.cod_item)');
      dRelatorios.qryItensEstoque.SQL.add(' where v.estoque_total <= v.estoque_minimo and  cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
      dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioEstoqueReposicao.fr3',true);





      case gpOrdem.ItemIndex of
        0 : begin
             dRelatorios.qryItensEstoque.SQL.Add('order by cod_item')
            end;
        1 : begin
             dRelatorios.qryItensEstoque.SQL.Add('order by descricao_item')
            end;
        2 : begin
             dRelatorios.qryItensEstoque.SQL.Add('order by custo_unitario')
            end;
        3 : begin
             dRelatorios.qryItensEstoque.SQL.Add('order by estoque_total')
            end;
      end;

    end;


  dRelatorios.qryItensEstoque.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryItensEstoque.Active:=false;


end;

procedure TfrmRelatorioEstoqueReposicao.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmRelatorioEstoqueReposicao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioEstoqueReposicao.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioEstoqueReposicao.btSelecionarClick(Sender: TObject);
begin
  inherited;
  GerarRelatorio;
end;

end.
