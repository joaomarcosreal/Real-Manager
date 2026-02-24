unit uuRelComprasRefCruzada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, System.DateUtils,  JvToolEdit,
  uuDmRelatorios, JvExMask, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.Mask, Vcl.Menus;

type
  TfrmRelComprasRefCruzada = class(Tfrm_modelo_vazio)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    edDataInicial: TJvDateEdit;
    edDataFinal: TJvDateEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComprasRefCruzada: TfrmRelComprasRefCruzada;

implementation
    uses uu_frm_principal;
{$R *.dfm}

procedure TfrmRelComprasRefCruzada.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
  edDataFinal.Date :=  EndOfTheMonth(edDataInicial.date);

  dRelatorios.qryComprasRefCruzada.Active := false;
  dRelatorios.qryComprasRefCruzada.SQL.Clear;
  dRelatorios.qryComprasRefCruzada.SQL.Add('select * from r_compras_ref_cruzada('+  Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date)));
  dRelatorios.qryComprasRefCruzada.SQL.Add(','+  Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')');
  ////dm.adicionalog(dRelatorios.qryComprasRefCruzada.SQL.Text);
  dRelatorios.qryComprasRefCruzada.Active := true;

  dRelatorios.qryTotaisCompraRefCruzada.Active := false;
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Clear;
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add('SELECT sum(DIA_01)AS TOT_01,sum(DIA_02)AS TOT_02,sum(DIA_03)AS TOT_03,sum(DIA_04)AS TOT_04, ');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_05)AS TOT_05,sum(DIA_06)AS TOT_06,sum(DIA_07)AS TOT_07,sum(DIA_08)AS TOT_08,');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_09)AS TOT_09,sum(DIA_10)AS TOT_10,sum(DIA_11)AS TOT_11,sum(DIA_12)AS TOT_12,');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_13)AS TOT_13,sum(DIA_14)AS TOT_14,sum(DIA_15)AS TOT_15,sum(DIA_16)AS TOT_16,');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_17)AS TOT_17,sum(DIA_18)AS TOT_18,sum(DIA_19)AS TOT_19,sum(DIA_20)AS TOT_20,');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_21)AS TOT_21,sum(DIA_22)AS TOT_22,sum(DIA_23)AS TOT_23,sum(DIA_24)AS TOT_24,');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_25)AS TOT_25,sum(DIA_26)AS TOT_26,sum(DIA_27)AS TOT_27,sum(DIA_28)AS TOT_28,');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(' sum(DIA_29)AS TOT_29,sum(DIA_30)AS TOT_30,sum(DIA_31)AS TOT_31  from r_compras_ref_cruzada( ');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date)));
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add(','+  Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+') rc');
  dRelatorios.qryTotaisCompraRefCruzada.SQL.Add('  where udf_len(trim(rc.cod_grupo)) =8');
  ////dm.adicionalog(dRelatorios.qryTotaisCompraRefCruzada.SQL.Text);
  dRelatorios.qryTotaisCompraRefCruzada.Active := true;
  dRelatorios.setPeriodoRelatorio(cbMes.Text +' - '+cbAno.Text);
  dRelatorios.rpt.Clear;
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relComprasRefCruzada.fr3',true);
  dRelatorios.rpt.PrepareReport(true);
  dRelatorios.rpt.ShowReport(true);







end;

procedure TfrmRelComprasRefCruzada.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelComprasRefCruzada.FormActivate(Sender: TObject);
var
anoAtual :  integer;
i : integer;
begin
  inherited;

  anoAtual := CurrentYear;
  cbAno.Clear;
  for I := 0 to 10 do
     begin
       cbAno.Items.Add(IntToStr(anoAtual-i));
     end;

  cbAno.ItemIndex :=0;

end;

end.
