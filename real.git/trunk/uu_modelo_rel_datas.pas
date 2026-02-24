unit uu_modelo_rel_datas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, RDprint,
  uu_modelo_Vazio;

type
  Tfrm_modelo_relatorio_data = class(Tfrm_modelo_vazio)
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    cbk_visualizar: TCheckBox;
    Panel2: TPanel;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    rdp: TRDprint;
    function verifica_datas(data_inicial : Tdate ; data_final : Tdate) : boolean;
    procedure bt_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_modelo_relatorio_data: Tfrm_modelo_relatorio_data;
  linha : integer;

implementation



{$R *.dfm}

function Tfrm_modelo_relatorio_data.verifica_datas(data_inicial : Tdate ; data_final : Tdate) : boolean;
begin
  if (data_inicial < data_final) then
   begin
     ShowMessage('Período de datas inválido!');
     Result:=false;
     Exit;
   end;
  Result:=true;
end;





procedure Tfrm_modelo_relatorio_data.bt_imprimirClick(Sender: TObject);
begin
  linha:=1;
end;

end.
