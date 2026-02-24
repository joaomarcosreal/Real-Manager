unit uuRelRankingProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask, ExtCtrls, Buttons, ibquery,System.DateUtils,
  RxToolEdit;

type
  TfrmRelRankingProdutos = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    cbk_visualizar: TCheckBox;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    ed_cod_grupo: TMaskEdit;
    rdTipoRel: TRadioGroup;
    rdRanking: TRadioGroup;
    edAte: TDateEdit;
    Label4: TLabel;
    edDe: TDateEdit;
    Label3: TLabel;
    function  verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRankingProdutos: TfrmRelRankingProdutos;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


function TfrmRelRankingProdutos.verificaValidade() : boolean;
begin
 Result := false;
  try
   StrToDate(edDe.Text)
  except
     begin
       ShowMessage('Data inicial inválida!');
       edDe.Clear;
       edDe.SetFocus;
       Exit;
     end;
  end;

  try
   StrToDate(edAte .Text)
  except
     begin
       ShowMessage('Data final inválida!');
       edAte .Clear;
       edAte .SetFocus;
       exit;
     end;
  end;


  if edDe.Date > edAte.Date then
   begin
     ShowMessage('Período inválido!');
     edDe.Clear;
     edAte.Clear;
     exit;
   end;

  result:=true;

end;



procedure TfrmRelRankingProdutos.emitirRelatorio();
var
 obsRelatorio : string;
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  dm_relatorios.qryRankingProdutos.Active := false;
  dm_relatorios.qryRankingProdutos.SQL.clear;
  dm_relatorios.qryRankingProdutos.SQL.Add(' select      p.cod_g_raiz, p.desc_g_raiz, ');
  dm_relatorios.qryRankingProdutos.SQL.Add('        p.cod_g_pai, p.desc_g_pai, ');
  dm_relatorios.qryRankingProdutos.SQL.Add('        p.cod_grupo, p.desc_grupo, ');
  dm_relatorios.qryRankingProdutos.SQL.Add('        p.descricao, rk.* ');
  dm_relatorios.qryRankingProdutos.SQL.Add(' from r_ranking_produtos('+Inttostr(rdRanking.ItemIndex)+' , '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date  ))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date  ))+' ) rk ');
  dm_relatorios.qryRankingProdutos.SQL.Add('    inner join r_informacoes_produto p on (p.cod_produto = rk.cod_produto) ');
  dm_relatorios.qryRankingProdutos.SQL.Add('  where p.cod_grupo like '+Quotedstr(ed_cod_grupo.Text+'%'));








  case rdTipoRel.ItemIndex  of
   0: begin
         obsRelatorio := 'Ranking por Quantidade,';
         dm_relatorios.qryRankingProdutos.SQL.Add('  order by rk.ranking ');
         dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relRankingProdutos.fr3',true);
      end;

   1: begin
         obsRelatorio := 'Ranking por Faturamento,';
         dm_relatorios.qryRankingProdutos.SQL.Add('  order by p.cod_g_raiz, p.cod_g_pai, p.cod_grupo, rk.ranking ');
         dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relRankingProdutosAgrupado.fr3',true);
      end;
  end;

  dm.adicionaLog('Ranking de produtos');
  dm.adicionaLog(dm_relatorios.qryRankingProdutos.sql.Text);
  dm_relatorios.qryRankingProdutos.Active := true;



  if ( Trim(ed_cod_grupo.Text) = '' ) then
    obsRelatorio := obsRelatorio + 'Todos os grupos'
  ELSE
    obsRelatorio := obsRelatorio +'APENAS '+ed_desc_grupo.Text;

    dm_relatorios.setObservacaoRelatorio(obsRelatorio);

  dm_relatorios.setPeriodoRelatorio('De  '+ edDe.Text +'  até  '+edAte.Text);
  dm_relatorios.rpt.ShowReport(true);


end;



procedure TfrmRelRankingProdutos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    emitirRelatorio;
end;

procedure TfrmRelRankingProdutos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelRankingProdutos.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date :=  StartOfTheMonth(Now);
  edAte.Date := Now;
  edDe.SetFocus;


end;

end.
