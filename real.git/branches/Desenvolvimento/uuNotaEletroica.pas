unit uuNotaEletroica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Grids,
  DBGrids,   ComCtrls;

type
  TfrmNotaFiscalEletronica = class(Tfrm_modelo_cadastro)
    rg1: TRadioGroup;
    lbl1: TLabel;
    pnl3: TPanel;
    lbl4: TLabel;
    edt2: TEdit;
    lbl5: TLabel;
    medt1: TMaskEdit;
    lbl6: TLabel;
    medt2: TMaskEdit;
    grp1: TGroupBox;
    grp2: TGroupBox;
    edt3: TEdit;
    lbl2: TLabel;
    btn1: TSpeedButton;
    lbl3: TLabel;
    lbl8: TLabel;
    edt1: TEdit;
    lbl9: TLabel;
    btn2: TSpeedButton;
    lbl10: TLabel;
    lbl11: TLabel;
    grp5: TGroupBox;
    dbgrd1: TDBGrid;
    pnl5: TPanel;
    edt5: TEdit;
    lbl38: TLabel;
    btn5: TSpeedButton;
    pnl6: TPanel;
    edt6: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    edt7: TEdit;
    edt9: TEdit;
    edt8: TEdit;
    lbl45: TLabel;
    edt10: TEdit;
    lbl46: TLabel;
    EDIquantidade: TCurrencyEdit;
    lbl22: TLabel;
    EDIpreco: TCurrencyEdit;
    lbl23: TLabel;
    btn4: TBitBtn;
    CurrencyEdit2: TCurrencyEdit;
    lbl7: TLabel;
    lbl12: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    lbl13: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    medt3: TMaskEdit;
    medt4: TMaskEdit;
    lbl17: TLabel;
    edt4: TEdit;
    lbl18: TLabel;
    edt11: TEdit;
    edt12: TEdit;
    lbl19: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    mmo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotaFiscalEletronica: TfrmNotaFiscalEletronica;

implementation

{$R *.dfm}

end.
