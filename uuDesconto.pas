unit uuDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons,
  ExtCtrls, RxCurrEdit,
  AdvGlassButton, cxGraphics, cxControls,


  cxClasses, RxToolEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Mask, Vcl.Menus;

type
  TfrmDesconto = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    rdPercentual: TRadioButton;
    rdValor: TRadioButton;
    Panel3: TPanel;
    edValorDesconto: TCurrencyEdit;
    Label4: TLabel;
    Label2: TLabel;
    btImprimir: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    procedure BitBtn1Click(Sender: TObject);
   procedure setOrigem(o : SmallInt);
    procedure btImprimirClick(Sender: TObject);

  private
    { Private declarations }
    origem : smallint;
    qtdPessoas : smallint;
  public
    { Public declarations }
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses InformacaoMesa, InformacaoMesaDAO;

{$R *.dfm}

procedure TfrmDesconto.setOrigem(o : SmallInt);
begin
  origem := o;

end;

procedure TfrmDesconto.btImprimirClick(Sender: TObject);
var

 LInformacoesMesa : TInformacaoMesa;
 LInformacoesMesaDAO : TInformacaoMesaDAO;
 tipoDesconto : smallint;

begin
if ( edValorDesconto.value < 0 ) then
   begin
     ShowMessage('Desconto não pode ser negativo!');
     exit;
   end;

  if ( (rdPercentual.Checked ) and ( edValorDesconto.Value  > 99.99)) then
   begin
     ShowMessage('Desconto não pode ser superior a 99.99');
     exit;
   end;

  if rdPercentual.Checked  then
    tipoDesconto :=0
  else
    tipoDesconto := 1;


   close;
end;

procedure TfrmDesconto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
