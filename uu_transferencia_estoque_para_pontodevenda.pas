unit uu_transferencia_estoque_para_pontodevenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, ExtCtrls, DBCtrls, Vcl.Mask;

type
  TfrmTransferenciaEstoque = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    gpDadosTransferencia: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    gpEstoqueAlmoxarifado: TGroupBox;
    Label24: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    bt_pesq_item_estoque_barras: TSpeedButton;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    Panel5: TPanel;
    Panel2: TPanel;
    ed_desc_item: TEdit;
    ed_estoque_item: TEdit;
    ed_unidade_item: TEdit;
    ed_cod_item: TEdit;
    ed_cod_barras_item: TEdit;
    ed_loc: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit2: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferenciaEstoque: TfrmTransferenciaEstoque;

implementation



{$R *.dfm}

end.
