unit uu_leitura_mem_fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tfrm_leitura_mem_fiscal_data = class(Tfrm_modelo_rel_datas)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_leitura_mem_fiscal_data: Tfrm_leitura_mem_fiscal_data;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

end.
