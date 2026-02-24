unit uu_modelo_rel_grupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, Mask, StdCtrls, ExtCtrls, Buttons;

type
  Tfrm_modelo_rel_grupos = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    ckb_tipo: TCheckBox;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    ed_cod_grupo: TMaskEdit;
    Panel1: TPanel;
    bt_selecionar: TBitBtn;
    bt_cancelar: TBitBtn;
    procedure ckb_tipoClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_modelo_rel_grupos: Tfrm_modelo_rel_grupos;

implementation

{$R *.dfm}

procedure Tfrm_modelo_rel_grupos.ckb_tipoClick(Sender: TObject);
begin
  inherited;
  if ckb_tipo.Checked = true then pn_grupos.Enabled:=true
   else
     pn_grupos.Enabled:=false;
end;

procedure Tfrm_modelo_rel_grupos.Panel1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_modelo_rel_grupos.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
