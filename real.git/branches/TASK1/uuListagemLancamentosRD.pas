unit uuListagemLancamentosRD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit;

type
  TfrmRelLancamentosRD = class(Tfrm_modelo_vazio)
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    rdFiltro: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckbOrdem: TRadioGroup;
    pnFornecedor: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    Panel3: TPanel;
    ckbFiltroRD: TCheckBox;
    rdFiltroFornecedor: TRadioGroup;
    Panel1: TPanel;
    rdgResumo: TRadioGroup;


    function verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdFiltroFornecedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelLancamentosRD: TfrmRelLancamentosRD;

implementation

uses UU_DM_RELATORIOS, uuDmRelatorios, uu_dm_consultas, uu_data_module,
  uu_frm_principal;

{$R *.dfm}


function TfrmRelLancamentosRD.verificaValidade() : boolean;
begin
  try
    ed_data_inicial.Text := FormatDateTime('DD/MM/YYY',ed_data_inicial.date);
  except
   begin
     ShowMessage('Data inicial inválida');
     ed_data_inicial.SetFocus;
     result:=false;
     exit;
   end;
  end;



  try
    ed_data_final.Text := FormatDateTime('DD/MM/YYY',ed_data_final.Date );
  except
   begin
     ShowMessage('Data final inválida');
     ed_data_final.SetFocus;
     result:=false;
     exit;
   end;
  end;

  if (  ed_data_inicial.date > ed_data_final.date ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result:=false;
    exit;
  end;

  if (rdFiltroFornecedor.ItemIndex = 1 ) then
   begin

   if ( trim(ed_cod_fornecedor.Text) <>'') then
    begin
      if (verificaExistenciaFornecedor(ed_cod_fornecedor.Text) = false) then
        begin
          ShowMessage('Código de Fornecedor inválido');
          result:=false;
          exit;
        end;
    end
   else
    begin
      Showmessage('Informe o fornecedor desejado!');
      result:= false;
      exit;
    end;

   end;

  result:=true;

end;

procedure TfrmRelLancamentosRD.emitirRelatorio();
var
 ordenacao : string;
 filtroExtra : string;
begin

 dm.transacao.Active := false;
 dm.transacao.Active := true;
 dRelatorios.qryRelLancamentosRD.Active := false;
 dRelatorios.qryRelLancamentosRD.SQL.clear;


 dRelatorios.qryRelLancamentosRD.SQL.add( 'select * from (select coalesce(c.data_vencimento,lr.data_documento) as data_vencimento,  f.razao_social, lr.* from lancamentos_rd lr ');
 dRelatorios.qryRelLancamentosRD.SQL.add('  left join contas_a_pagar c on (c.codigo = lr.cod_ct_pagar) ');
 dRelatorios.qryRelLancamentosRD.SQL.add('  inner join fornecedor f on (f.cod_fornecedor = lr.cod_fornecedor) ');
 dRelatorios.qryRelLancamentosRD.SQL.add('  ) lrd ');
 dRelatorios.rpt.Clear;

 case ckbOrdem.ItemIndex of
  0 : ordenacao := ', udf_abs(lrd.total),lrd.codigo,lrd.razao_social';
  1 : ordenacao := ',lrd.razao_social, udf_abs(lrd.total),lrd.codigo';
 end;

 case rdFiltroFornecedor.ItemIndex of
  1: filtroExtra := 'and lrd.cod_fornecedor='+Quotedstr(ed_cod_fornecedor.Text)+' ';
 end;



 case rdFiltro.ItemIndex of
  0: begin
       dRelatorios.qryRelLancamentosRD.SQL.add('   where lrd.data_lancamento  between '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial .Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final  .Date)));
       if ckbFiltroRD.Checked then
        dRelatorios.qryRelLancamentosRD.SQL.add(' and lrd.data_rd  between '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial .Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final  .Date)));
        dRelatorios.qryRelLancamentosRD.SQL.add(filtroExtra);
       dRelatorios.qryRelLancamentosRD.SQL.add('   order by  lrd.data_lancamento'+ordenacao);

       if rdgResumo.ItemIndex = 0 then
         dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relLancamentosRDporDataLancamento.fr3',true)
       else
         dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relLancamentosRDporDataLancamentoDetalhado.fr3',true)

     end;

  1: begin
       dRelatorios.qryRelLancamentosRD.SQL.add('   where lrd.data_vencimento between '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial .Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final  .Date)));
        dRelatorios.qryRelLancamentosRD.SQL.add(filtroExtra);
       dRelatorios.qryRelLancamentosRD.SQL.add('   order by lrd.data_vencimento'+ordenacao);
       if rdgResumo.ItemIndex = 0 then
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relLancamentosRDporDataVencimento.fr3',true)
       else
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relLancamentosRDporDataVencimentoDetalhado.fr3',true)

     end;


  2: begin
       dRelatorios.qryRelLancamentosRD.SQL.add('   where lrd.data_rd between '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial .Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final  .Date)));
        dRelatorios.qryRelLancamentosRD.SQL.add(filtroExtra);
       dRelatorios.qryRelLancamentosRD.SQL.add('   order by lrd.data_rd '+ordenacao);
       if rdgResumo.ItemIndex = 0 then
         dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relLancamentosRDporDataRD.fr3',true)
       else
         dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relLancamentosRDporDataRDDetalhado.fr3',true)
     end;

 end;


  dRelatorios.setPeriodoRelatorio('De  '+ ed_data_inicial.Text +'  até  '+ed_data_final.Text);

  dm.adicionaLog(dRelatorios.qryRelLancamentosRD.SQL.Text); 
  dRelatorios.qryRelLancamentosRD.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryRelLancamentosRD.Active := false;







end;


procedure TfrmRelLancamentosRD.BitBtn1Click(Sender: TObject);
begin
  inherited;

if verificaValidade then
   begin
     emitirRelatorio;
   end;
end;

procedure TfrmRelLancamentosRD.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelLancamentosRD.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := Date;
  ed_data_final.Date := date;
  ed_cod_fornecedor.Clear;
  ed_nome_fantasia_fornecedor.clear;
  pnFornecedor.Enabled := false;

end;

procedure TfrmRelLancamentosRD.rdFiltroFornecedorClick(Sender: TObject);
begin
  inherited;
  if rdFiltroFornecedor.ItemIndex = 0 then
    begin
      ed_cod_fornecedor.Clear;
      ed_nome_fantasia_fornecedor.clear;
      pnFornecedor.Enabled := false;
    end
  else
   begin
      ed_cod_fornecedor.Clear;
      ed_nome_fantasia_fornecedor.clear;
      pnFornecedor.Enabled := true;

   end;

end;

end.
