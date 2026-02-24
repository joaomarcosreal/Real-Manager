unit uu_listagemRegistros60M;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmListDadosRedZ = class(Tfrm_modelo_rel_datas)
    procedure bt_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListDadosRedZ: TfrmListDadosRedZ;

implementation



{$R *.dfm}

procedure TfrmListDadosRedZ.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  if (verificaDatas = true) then
   begin

   end;
end;


end.
