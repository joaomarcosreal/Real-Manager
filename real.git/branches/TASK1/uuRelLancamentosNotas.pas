unit uuRelLancamentosNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons, RxToolEdit;

type
  TfrmRelLancamentosNotasRD = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rdTipo: TRadioGroup;

    procedure exibeNotasLancamento(detalhado : boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelLancamentosNotasRD: TfrmRelLancamentosNotasRD;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelLancamentosNotasRD.exibeNotasLancamento(detalhado : boolean);
var
 codGrupo : string;
 dataInicial, dataFinal : TDate;
begin
  inherited;

  dataInicial := ed_data_inicial.Date;
  dataFinal   :=  ed_data_final.Date;
  codGrupo := dm.qryProjecaoDespesasRD.fieldbyname('cod_grupo').Value;

  dRelatorios.qryNotasRDPeriodo.Active :=false;
  dRelatorios.qryNotasRDPeriodo.sql.clear;


  dRelatorios.qryNotasRDPeriodo.sql.Add('select n.codigo, n.cod_fornecedor, f.razao_social, n.num_doc,n.data_documento,n.data_lancamento, n.data_rd,c.data_vencimento,  n.observacoes,  n.total as total_nota,  ( select sum(itr.valor) from itens_lancamento_rd');
  dRelatorios.qryNotasRDPeriodo.sql.Add('             itr where (itr.cod_lanc_rd  = n.codigo) and (itr.cod_grupo starting '+QuotedstR(codGrupo) +')');
  dRelatorios.qryNotasRDPeriodo.sql.Add('             ) as total_lancamentos');
  dRelatorios.qryNotasRDPeriodo.sql.Add(' from (');
  dRelatorios.qryNotasRDPeriodo.sql.Add('select * from  lancamentos_rd lr where');
  dRelatorios.qryNotasRDPeriodo.sql.Add('  lr.codigo in ( select distinct itr.cod_lanc_rd   from itens_lancamento_rd itr');
  dRelatorios.qryNotasRDPeriodo.sql.Add('                 where itr.cod_grupo starting  '+Quotedstr(codGrupo)+ ' )');
  dRelatorios.qryNotasRDPeriodo.sql.Add('                 and  lr.data_rd between '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  ))+'  and '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )) );
  dRelatorios.qryNotasRDPeriodo.sql.Add('        )  n');
  dRelatorios.qryNotasRDPeriodo.sql.Add('        inner join fornecedor f on (f.cod_fornecedor = n.cod_fornecedor)');
  dRelatorios.qryNotasRDPeriodo.sql.Add('        left join contas_a_pagar c on (c.codigo = n.cod_ct_pagar)');
  dRelatorios.qryNotasRDPeriodo.sql.Add('     order by n.data_rd,f.razao_social, n.total');

  dm.adicionaLog(dRelatorios.qryNotasRDPeriodo.sql.Text); 
  dRelatorios.qryNotasRDPeriodo.Active := true;

  if (detalhado = false) then
    dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNotasRDperiodo.fr3',true)
  else
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNotasRDperiodoItens.fr3',true);


  dRelatorios.setPeriodoRelatorio('De  '+ DateToStr(dataInicial)  +'  até  '+DateToStr(dataFinal) );
  dRelatorios.setFiltroRelatorio(trim(dm.qryProjecaoDespesasRD.fieldbyname('descricao').Value));
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryNotasRDPeriodo.Active := false;


end;


procedure TfrmRelLancamentosNotasRD.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if ( rdTipo.ItemIndex = 0) then
    exibeNotasLancamento(false)
  else
    exibeNotasLancamento(true); 

end;

procedure TfrmRelLancamentosNotasRD.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
