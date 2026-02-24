unit uu_rel_produtosPeriodo;

interface

uses
  Windows, system.DateUtils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, Buttons, ExtCtrls, Ibquery,
  RxToolEdit;

type
  TfrmRelProdutosPeriodo = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    ed_cod_grupo: TMaskEdit;
    Panel2: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edAte: TDateEdit;
    edDe: TDateEdit;

    function verificaValidade() : boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure edDeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutosPeriodo: TfrmRelProdutosPeriodo;
  tipo : smallint;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


function TfrmRelProdutosPeriodo.verificaValidade() : boolean;
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

procedure TfrmRelProdutosPeriodo.emitirRelatorio();
var
  qryProdutosVendidos: TIBQuery;
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;


  qryProdutosVendidos := TIBQuery.Create(Self);
  with qryProdutosVendidos do
  begin
    Name := 'qryProdutos';
    Database := dm.dbrestaurante;
    Transaction := dm.transacao;
    BufferChunks := 1000;
    CachedUpdates := False;
    SQL.Clear;
  end;
  qryProdutosVendidos.Active:=false;
  dm_relatorios.dtProdutos.DataSet := qryProdutosVendidos;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\margemProdutosVendidos.fr3',true);


  qryProdutosVendidos.Active:=false;
  qryProdutosVendidos.SQL.clear;
  qryProdutosVendidos.sql.add('select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_raiz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,');
  qryProdutosVendidos.sql.add('       pm.descricao, pm.quantidade_contagem,pm.valor_unitario, pm.custodigitado as custoUnitario,pm.custoproduto as custoTotal,');
  qryProdutosVendidos.sql.add('       pm.lucroreal as lucroUnitario,pm.lucrototal as lucroTotal, pm.total , pm.percentuallucro, pm.totalvendas, pm.percentualProduto');
  case tipo of
   0:  qryProdutosVendidos.sql.add('       from produtosvendidoscommargemF(');
   1:  qryProdutosVendidos.sql.add('       from produtosvendidoscommargem(');
  end;


  qryProdutosVendidos.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date  ))+','
  +Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date))+','
  +Quotedstr(ed_cod_grupo.text)
  +','+Quotedstr(codEmpresa));
  qryProdutosVendidos.sql.add(','+Quotedstr(FormatDateTime('00:00:00',dm_relatorios.cdsRelProdutosVendidosTempHORA_INICIAL.value )));
  qryProdutosVendidos.sql.add(','+Quotedstr(FormatDateTime('23:59:59',dm_relatorios.cdsRelProdutosVendidosTempHORA_FINAL.Value )));
  qryProdutosVendidos.sql.add('      ) pm ');
  qryProdutosVendidos.sql.add('            inner join r_informacoes_produto ip on (ip.cod_produto = pm.cod_produto) ');
  qryProdutosVendidos.sql.add('             order by cod_g_raiz,cod_g_pai,cod_grupo ');
  dm.adicionaLog(qryProdutosVendidos.SQL.Text);
  qryProdutosVendidos.Active:=true;
//  frm_principal.memo_avisos.Lines := qryProdutosVendidos.SQL;
//  frm_principal.memo_avisos.Visible := True;
  dm_relatorios.dtRelatorioMargemProdutos.DataSet := qryProdutosVendidos;
  dm_relatorios.setPeriodoRelatorio('De  '+ edDe.Text  +'  até  '+edAte.Text );
  dm.adicionaLog(qryProdutosVendidos.SQL.text);
  dm_relatorios.rpt.ShowReport(true);
  FreeAndNil(qryProdutosVendidos )
end;



procedure TfrmRelProdutosPeriodo.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelProdutosPeriodo.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date :=  StartOfTheMonth(Now);
  edAte.Date := Now;
  edDe.SetFocus;

  tipo:=0;
end;

procedure TfrmRelProdutosPeriodo.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   begin
     emitirRelatorio;
   end;
end;

procedure TfrmRelProdutosPeriodo.edDeChange(Sender: TObject);
begin
  inherited;

  if edDe.Text ='01/01/0101' then
   begin
    frmRelProdutosPeriodo.Caption:='(T) Produtos vendidos por Período';
    edDe.Clear;
    tipo:=1;
   end;
end;

end.
