unit uuRelRankingClientesDelivery;

interface

uses
  Winapi.Windows, Winapi.Messages,System.DateUtils,  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.Samples.Spin,
  Vcl.Mask, RxToolEdit, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ActnList,
  System.Actions, uu_data_module, UU_DM_RELATORIOS ;

type
  TfrmRankingClientesDelivery = class(Tfrm_modelo_vazio)
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label2: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TDateEdit;
    Panel3: TPanel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    edDataFinal: TDateEdit;
    spinRank: TSpinEdit;
    Label3: TLabel;
    rdTipoRelatorio: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function verificaValidade: boolean;
    procedure emitirRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRankingClientesDelivery: TfrmRankingClientesDelivery;

implementation

{$R *.dfm}

uses uu_frm_principal;


function TfrmRankingClientesDelivery.verificaValidade() : boolean;
begin
  Result:=false;

  try
   begin
     StrToDate(edDataInicial.text);
     StrToDate(edDataFinal.text);

   end;
  except
   begin
      Showmessage('Período de datas inválido');
      edDataInicial.SetFocus;
      result:=false;
      exit;
   end;
  end;

  if (  edDataInicial.Date  > edDataFinal.Date  ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    edDataInicial.SetFocus;
    result:=false;
    exit;
  end;




  result:=true;
end;


procedure TfrmRankingClientesDelivery.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(today);
  edDataFinal.Date := today;
  edDataInicial.SetFocus;
end;

procedure TfrmRankingClientesDelivery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm_relatorios.qryRankClientesDelivery.Active := false;
end;

procedure TfrmRankingClientesDelivery.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade  then
    emitirRelatorio;
end;

procedure TfrmRankingClientesDelivery.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRankingClientesDelivery.emitirRelatorio();
var
 dataInicial : string;
 dataFinal : string;
 linhas : string;
 tipoRelatorio : smallint;

begin

  tipoRelatorio := rdTipoRelatorio.ItemIndex;

  dataInicial := Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date));
  dataFinal   := Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date));
  linhas := Inttostr(spinRank.Value);

  dm.transacao.Active := false;
  dm.transacao.Active := true;

  dm_relatorios.qryRankClientesDelivery.Active := false;
  dm_relatorios.qryRankClientesDelivery.SQL.Clear;
  dm_relatorios.qryRankClientesDelivery.sql.Add(' select * from r_ranking_clientes_delivery('+dataInicial+','+dataFinal+','+linhas+','+Inttostr(tipoRelatorio)+')');
  dm_relatorios.qryRankClientesDelivery.Active := true;

  if tipoRelatorio = 0 then
   begin
     dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relRankingClientesDelivery.fr3',true)
   end
  else
   begin
    dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relRankingClientesDeliveryPorQtdePedido.fr3',true)
   end;

  dm.adicionaLog(dm_relatorios.qryRankClientesDelivery.Text);
  dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;




end;

end.
