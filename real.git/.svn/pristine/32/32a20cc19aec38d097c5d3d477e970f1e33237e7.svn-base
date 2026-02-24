unit uuRelNotasFrete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit;

type
  TfrmRelNotasFrete = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    ed_cod_fornecedor: TMaskEdit;
    Panel6: TPanel;
    ed_nome_fantasia_fornecedor: TMaskEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    function  verificaValidade() : boolean;
    procedure imprimirRelatorio();
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelNotasFrete: TfrmRelNotasFrete;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}



function TfrmRelNotasFrete.verificaValidade() : boolean;
begin

  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
   end;

   if ( trim(ed_cod_fornecedor.Text) <> '') then
    begin
      if (verificaExistenciaFornecedor(ed_cod_fornecedor.Text) = false) then
        begin
          ShowMessage('Código de Fornecedor inválido');
          result:=false;
          exit;
        end;
    end;


  result:=true;
end;







procedure TfrmRelNotasFrete.imprimirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryNotasTransporte.Active :=false;
  dm_relatorios.qryNotasTransporte.sql.clear;

  dm_relatorios.qryNotasTransporte.sql.add('   select nt.*, f.razao_social,  ');
  dm_relatorios.qryNotasTransporte.sql.add('         cf.descricao as descricaoCFOP,');
  dm_relatorios.qryNotasTransporte.sql.add('          cs.descricao as descricaoCST,');
  dm_relatorios.qryNotasTransporte.sql.add('          md.descricao as descricaoModelo');
  dm_relatorios.qryNotasTransporte.sql.add('     from notas_transporte nt');
  dm_relatorios.qryNotasTransporte.sql.add('     inner join fornecedor f on (f.cod_fornecedor = nt.cod_fornecedor)');
  dm_relatorios.qryNotasTransporte.sql.add('     inner join cfop cf on (cf.codigo = nt.cfop)');
  dm_relatorios.qryNotasTransporte.sql.add('     inner join cst cs on (cs.cst = nt.cst_icms)');
  dm_relatorios.qryNotasTransporte.sql.add('     inner join modelos_nf md on (md.codigo = nt.modelo_nota)');
  dm_relatorios.qryNotasTransporte.sql.add('      where nt.data_servico ');
  dm_relatorios.qryNotasTransporte.sql.add('       between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));
  dm_relatorios.qryNotasTransporte.SQL.add(' and nt.cod_fornecedor like '+Quotedstr(ed_cod_fornecedor.text+'%'));

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioNotasTransporte.fr3',true);

  dm_relatorios.qryNotasTransporte.Active:=true;

  if  not  dm_relatorios.qryNotasTransporte.IsEmpty then
   begin
     dm_relatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);

     dm_relatorios.rpt.ShowReport(true);
     dm_relatorios.qryNotasTransporte.Active:=false;
   end
  else
   ShowMessage('Não existem lançamentos para o período e/ou filtros informados');
end;







procedure TfrmRelNotasFrete.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelNotasFrete.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   imprimirRelatorio();

end;

end.
