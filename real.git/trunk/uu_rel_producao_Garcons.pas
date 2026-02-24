unit uu_rel_producao_Garcons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, DBCtrls, Buttons, Mask,
  ExtCtrls;

type
  TfrmRelProducaoGarcons = class(Tfrm_modelo_rel_datas)
    ckbComissionado: TCheckBox;
    RadioGroup3: TRadioGroup;
    Panel4: TPanel;
    Label3: TLabel;
    bt_pesq_garcon: TSpeedButton;
    Label4: TLabel;
    Panel6: TPanel;
    ed_nome_garcon: TEdit;
    ed_cod_garcon: TEdit;
    RadioGroup2: TRadioGroup;
    Panel3: TPanel;
    Label15: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Label16: TLabel;
    Panel1: TPanel;
    ed_desc_grupo: TEdit;
    ed_cod_grupo: TEdit;
    Panel7: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    procedure ed_cod_grupoChange(Sender: TObject);
    procedure ed_cod_garconChange(Sender: TObject);
    function  verificaValidade : boolean;
    procedure emitirRelatorio;
    procedure bt_imprimirClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmRelProducaoGarcons: TfrmRelProducaoGarcons;

implementation

uses uu_modelo_vazio, UU_DM_RELATORIOS, uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelProducaoGarcons.ed_cod_grupoChange(Sender: TObject);
begin
  inherited;
  if ed_cod_grupo.Text = '' then ed_desc_grupo.Clear;
end;

procedure TfrmRelProducaoGarcons.ed_cod_garconChange(Sender: TObject);
begin
  inherited;
  if ed_Cod_Garcon.Text = '' then ed_Nome_Garcon.Clear;
end;

function TfrmRelProducaoGarcons.verificaValidade : boolean;
begin
  if ( verificaDatas = false) then
   begin
     Result:=false;
     Exit;
   end;

  if (  (trim( ed_cod_grupo.text) <> '') and    (verificaExistenciaGrupo(ed_cod_grupo.Text) = false ) )   then
   begin
    showmessage('Código de grupo inválido');
    ed_cod_grupo.SetFocus;
    Result:=false;
    Exit;
   end;


  if (  (trim( ed_cod_garcon.text) <> '') and    (verificaExistenciaGarconMetre(ed_cod_garcon.Text) = false ) )   then
   begin
    ShowMessage('Código de garçon inválido!');
    Result:=false;
    Exit;
   end;

  result:=true;
end;



procedure TfrmRelProducaoGarcons.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  if verificaValidade = true then
    emitirRelatorio;
end;


procedure TfrmRelProducaoGarcons.emitirRelatorio;
begin

  dm.tb_parametros.Active:=true;
  dm_relatorios.qryProdutosGarcons.Active:=false;
  dm_relatorios.qryProdutosGarcons.SQL.clear;
  dm_relatorios.qryProdutosGarcons.sql.add('     Select mv.cod_garcon,ga.apelido,');
  dm_relatorios.qryProdutosGarcons.sql.add('            p.cod_barras, p.descricao,p.desc_g_raiz,p.desc_g_pai,p.descricao_grupo, p.cod_grupo,');
  dm_relatorios.qryProdutosGarcons.sql.add('            sum(mv.quantidade) as quantidade_vendida,');
  dm_relatorios.qryProdutosGarcons.sql.add('            sum(mv.valor_unitario *  mv.quantidade ) as total_vendido,');
  dm_relatorios.qryProdutosGarcons.sql.add('            (  sum(mv.quantidade) * p.valor_comissao ) as total_comissao');
  dm_relatorios.qryProdutosGarcons.sql.add('      from movimento_venda mv');
  dm_relatorios.qryProdutosGarcons.sql.add('       inner join garcons ga on (ga.cod_garcon = mv.cod_garcon)');
  dm_relatorios.qryProdutosGarcons.sql.add('       inner join v_produtos p on (p.cod_produto = mv.cod_produto)');
  dm_relatorios.qryProdutosGarcons.sql.add('     WHERE MV.data BETWEEN '+dataInicial +' AND '+dataFinal);
  dm_relatorios.qryProdutosGarcons.sql.add(' and mv.cod_garcon like '+Quotedstr(ed_cod_garcon.text+'%') );
  dm_relatorios.qryProdutosGarcons.sql.add(' and p.cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%') );
  if (ckbComissionado.Checked) then
  dm_relatorios.qryProdutosGarcons.sql.add('and p.valor_comissao >0');
  dm_relatorios.qryProdutosGarcons.sql.add('     group by mv.cod_garcon, ga.apelido,');
  dm_relatorios.qryProdutosGarcons.sql.add('           p.cod_barras, p.descricao,p.desc_g_raiz,p.desc_g_pai,p.descricao_grupo, p.cod_grupo,');
  dm_relatorios.qryProdutosGarcons.sql.add('            mv.cod_produto,p.valor_comissao ');
  dm_relatorios.qryProdutosGarcons.sql.add('order by mv.cod_garcon,p.cod_grupo');
  dm.adicionaLog(dm_relatorios.qryProdutosGarcons.SQL.Text);
  dm_relatorios.qryProdutosGarcons.Active:=true;



  if ( ed_data_inicial.Text <> ed_data_final.Text) then
   begin
    dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
   end
  else
   begin
    dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
   end;


  dm_relatorios.rpt.Clear;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relProducaoGarcons.fr3',true);
  dm_relatorios.rpt.ShowReport(true);

//  dm_relatorios.rptProdutosGarcons.Print;
       

end;

end.
