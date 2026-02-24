unit uuRelConferenciaLivroEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit;

type
  TfrmRelConfLivrosEntradaXSistema = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    function  verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelConfLivrosEntradaXSistema: TfrmRelConfLivrosEntradaXSistema;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

function TfrmRelConfLivrosEntradaXSistema.verificaValidade() : boolean;
begin


  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
    result:=false;
    exit;
   end;



  result:=true;
end;






procedure TfrmRelConfLivrosEntradaXSistema.emitirRelatorio();
begin

  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  dm_relatorios.qryConfLVFSEntradas.Active :=false;
  dm_relatorios.qryConfLVFSEntradas.SQL.Clear;
  dm_relatorios.qryConfLVFSEntradas.SQL.add('select * from  compara_livro_entradas('+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date))+')');
  dm_relatorios.qryConfLVFSEntradas.Active :=true;

  if dm_relatorios.qryConfLVFSEntradas.IsEmpty then
    ShowMessage('Sem movimento para o período especificado!!')
  else
   begin
    dm_relatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);   
    dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioConfLFVEntradas1.fr3',true);
    dm_relatorios.rpt.ShowReport(true);
   end;

  dm_relatorios.qryConfLVFSEntradas.Active:=false;



end;


procedure TfrmRelConfLivrosEntradaXSistema.BitBtn1Click(Sender: TObject);
begin
  inherited;
 if verificaValidade then
  emitirRelatorio;

end;

procedure TfrmRelConfLivrosEntradaXSistema.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
