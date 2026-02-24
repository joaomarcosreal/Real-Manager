unit uu_ranking_vendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmRelRankingProdutos = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    cbk_visualizar: TCheckBox;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    ed_cod_grupo: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRankingProdutos: TfrmRelRankingProdutos;

implementation

{$R *.dfm}

end.
