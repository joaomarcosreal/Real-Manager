unit uuRelFichasTecnicas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, AdvGlassButton, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Mask, JvValidateEdit, JvExStdCtrls, JvEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Menus;

type
  TfrmRelFichasTecnicas = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    btImprimir: TAdvGlassButton;
    btSair: TAdvGlassButton;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    rdTipoRelatorio: TRadioGroup;
    rdFiltroProduto: TRadioGroup;
    edParametro: TJvValidateEdit;
    ckbNaoImprimirInsumos: TCheckBox;
    RadioGroup2: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btPesqProdutos: TSpeedButton;
    edCodProduto: TMaskEdit;
    Panel5: TPanel;
    ed_desc_produto: TMaskEdit;
    tmFecharJanela: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmFecharJanelaTimer(Sender: TObject);
  private
    LCodProdutoSelecionado: string;
    procedure gerarRelatorio;

    { Private declarations }
  public
    { Public declarations }
    procedure SetCodProdutoSelecionado(ACodProduto: string);
  end;

var
  frmRelFichasTecnicas: TfrmRelFichasTecnicas;

implementation

uses
  UU_DM_RELATORIOS, uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelFichasTecnicas.FormCreate(Sender: TObject);
begin
  inherited;
  LCodProdutoSelecionado := '';
end;

procedure TfrmRelFichasTecnicas.SetCodProdutoSelecionado(ACodProduto: string);
begin
  LCodProdutoSelecionado := ACodProduto;
end;

procedure TfrmRelFichasTecnicas.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelFichasTecnicas.btImprimirClick(Sender: TObject);
begin
  inherited;
  gerarRelatorio();
end;

procedure TfrmRelFichasTecnicas.FormActivate(Sender: TObject);
begin
  inherited;
  if LCodProdutoSelecionado <> '' then
  begin
    edCodProduto.Text := LCodProdutoSelecionado;
    btImprimir.Click;
    tmFecharJanela.Enabled := true;
  end;
end;

procedure TfrmRelFichasTecnicas.gerarRelatorio();
begin
  dm_relatorios.qryRelFichasTecnicas.sql.clear;
  dm_relatorios.qryRelFichasTecnicas.sql.add('	 select * from (                                                                                                                                          ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('																															                                  ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		select cod_produto as vpCodigoProduto,  cod_produto, rendimento,unidade, cod_grupo_raiz,desc_grupo_raiz,desdobramento_pai,desdobramento_filho,        ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('	cod_grupo_pai,desc_grupo_pai, codgrupo, cod_formatado,                                                                                                    ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			 descricaoGrupo, descricao, valor_unitario,                                                                                                       ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			  custo, udf_roundabnt( (custo / NULLIF(rendimento, 0)),3) as custoUnidadeEstoque, ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('       (valor_unitario - (custo / NULLIF(rendimento, 0)) ) as margem,  ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('       (valor_unitario / NULLIF((custo / NULLIF(rendimento, 0)), 0)) as markup,  ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			  (( (custo / NULLIF(rendimento, 0)) * 100) / NULLIF(valor_unitario, 0)) as cmv                                                                                                         ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		 from                                                                                                                                                 ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		 (                                                                                                                                                    ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		 select p.cod_produto,  ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('       iif(udf_roundabnt(p.rendimento,5) < 0.01, 1, udf_roundabnt(p.rendimento,5)) as rendimento , ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('       p.unidade_entrada,u.descricao as unidade, p.cod_grupo, trim(g.cod_formatado) as cod_formatado ,                    ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('	g.cod_grupo_raiz, trim(g.desc_grupo_raiz) as desc_grupo_raiz, g.cod_grupo_pai, trim(g.desc_grupo_pai)  as desc_grupo_pai                                  ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('				,g.cod_grupo as codGrupo, g.desdobramento_pai,                                                                                                ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('	g.desdobramento_filho, trim(g.descricao) as descricaoGrupo, p.descricao,                                                                                  ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		   case p.valor_unitario                                                                                                                              ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			when  0 then 1                                                                                                                                    ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			 else                                                                                                                                             ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			   p.valor_unitario                                                                                                                               ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		   end as valor_unitario,                                                                                                                             ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			(select sum(custo_baixa) from calcula_custo_produto_novo(p.cod_produto,  p.cod_produto, p.rendimento) ) as custo                                             ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('		   from  produtos p                                                                                                                                   ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			 inner join r_grupos g on (g.cod_grupo  = p.cod_grupo)                                                                                            ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			 inner join unidades u on (u.cod_unidade = p.unidade_entrada)                                                                                     ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('			 where  coalesce((select count(*) from composicoes_produto cp where cp.cod_produto = p.cod_produto),0) > 0                                        ');

  case rdTipoRelatorio.ItemIndex of
    1:
      dm_relatorios.qryRelFichasTecnicas.sql.add(' and p.vende=1 ');
  end;

  dm_relatorios.qryRelFichasTecnicas.sql.add('                                                                                                                          ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('      )                                                                                                                   ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('                                                                                                                          ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('     ) ');
  dm_relatorios.qryRelFichasTecnicas.sql.add('         where codGrupo starting with ' + Quotedstr(ed_cod_grupo.Text));

  if (trim(edCodProduto.Text) <> '') then
  begin
    dm_relatorios.qryRelFichasTecnicas.sql.add(' and ( (cod_produto=' + Quotedstr(Trim(edCodProduto.Text)) + ')');
    dm_relatorios.qryRelFichasTecnicas.sql.add('  or                                      ');
    dm_relatorios.qryRelFichasTecnicas.sql.add('   (cod_produto  in (select                 ');
    dm_relatorios.qryRelFichasTecnicas.sql.add('    cp.cod_produto                        ');
    dm_relatorios.qryRelFichasTecnicas.sql.add('      from composicoes_produto cp         ');
    dm_relatorios.qryRelFichasTecnicas.sql.add('       where cp.cod_produto_baixa=' + Quotedstr(Trim(edCodProduto.Text)) + ')))');
  end;

  case rdFiltroProduto.ItemIndex of
    1:
      dm_relatorios.qryRelFichasTecnicas.sql.add('  and cmv <=' + dm.TrocaVirgPPto(edParametro.Value));
    2:
      dm_relatorios.qryRelFichasTecnicas.sql.add('  and cmv >=' + dm.TrocaVirgPPto(edParametro.Value));
    3:
      dm_relatorios.qryRelFichasTecnicas.sql.add('  and markup <=' + dm.TrocaVirgPPto(edParametro.Value));
    4:
      dm_relatorios.qryRelFichasTecnicas.sql.add('  and markup >=' + dm.TrocaVirgPPto(edParametro.Value));
  end;

  dm_relatorios.qryRelFichasTecnicas.sql.add(' order by cod_grupo_raiz asc , desdobramento_pai asc ,desdobramento_filho asc , descricao');

  try

    try
      dm.adicionalog(dm_relatorios.qryRelFichasTecnicas.SQL.Text);
      dm_relatorios.qryRelFichasTecnicas.Active := true;
      dm_relatorios.qryRelFichasTecnicas.Active := True;
      ;
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relFichasTecnicas.fr3', true);

      dm_relatorios.setImprimirDetalhes(not ckbNaoImprimirInsumos.Checked);

      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryRelFichasTecnicas.Active := false;
      dm_relatorios.qryItensFichaTecnica.Active := false;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gerar o relatório! ' + sLineBreak + sLineBreak + e.Message, 'Ok');
      end;
    end;
  finally
  end;

end;

procedure TfrmRelFichasTecnicas.tmFecharJanelaTimer(Sender: TObject);
begin
  inherited;
  close;
end;

end.

