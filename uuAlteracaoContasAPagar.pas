unit uuAlteracaoContasAPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.StdCtrls, Vcl.Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Data.DB, RxMemDS, AdvGlassButton,
  Vcl.ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  RxToolEdit, RxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Comp.Client, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, Vcl.Mask, Vcl.Menus;

type
  TfrmAlteraContasAPagar = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    ActionList1: TActionList;
    ControlAction1: TControlAction;
    Action1: TAction;
    JvControlActionList1: TJvControlActionList;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action28: TAction;
    Action29: TAction;
    Action30: TAction;
    Action31: TAction;
    Action32: TAction;
    Action33: TAction;
    Action34: TAction;
    Action35: TAction;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action39: TAction;
    Action40: TAction;
    Action41: TAction;
    Action42: TAction;
    Action43: TAction;
    Action44: TAction;
    Action45: TAction;
    Action46: TAction;
    Action47: TAction;
    Action48: TAction;
    Action49: TAction;
    Action50: TAction;
    Action51: TAction;
    Action52: TAction;
    Action53: TAction;
    Action54: TAction;
    Action55: TAction;
    Action56: TAction;
    Action57: TAction;
    Action58: TAction;
    Panel1: TPanel;
    Label10: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    edTotalConta: TCurrencyEdit;
    edDataVencimento: TcxDateEdit;
    edDataRD: TcxDateEdit;
    edObservacoes: TEdit;
    Panel4: TPanel;
    Panel6: TPanel;
    Shape1: TShape;
    Label34: TLabel;
    Panel9: TPanel;
    Label23: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    ed_razao_social_fornecedor: TEdit;
    edNumeroNota: TEdit;
    edNumeroEntrada: TEdit;
    edDataDoc: TcxDateEdit;
    btLancar: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    tbParcelas: TRxMemoryData;
    tbParcelasdataVencimento: TDateField;
    tbParcelasdescricaoConta: TStringField;
    tbParcelasnumeroControle: TStringField;
    tbParcelasvalorParcela: TCurrencyField;
    tbParcelasvalorMulta: TCurrencyField;
    tbParcelasvalorMora: TFloatField;
    tbParcelasvalorDesconto: TFloatField;
    tbParcelasflagMulta: TSmallintField;
    tbParcelasflagMora: TSmallintField;
    tbParcelasflagDesconto: TSmallintField;
    tbParcelasdiasDesconto: TIntegerField;
    tbParcelasdiaSemana: TStringField;
    tbParcelasparcela: TStringField;
    dsParcelas: TDataSource;
    CurrencyEdit1: TCurrencyEdit;
    Label4: TLabel;
    FDMemTable1: TFDMemTable;
    Edit3: TEdit;
    Label7: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label8: TLabel;
    Panel7: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    cxDateEdit1: TcxDateEdit;
  private
    procedure BuscaDadosDoTiTulo(ACodigo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlteraContasAPagar: TfrmAlteraContasAPagar;

implementation

{$R *.dfm}


procedure TfrmAlteraContasAPagar.BuscaDadosDoTiTulo(ACodigo : string);
Var
 LMemTable : TFDMemTable;
begin

end;

end.
