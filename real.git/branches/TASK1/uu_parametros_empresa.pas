unit uu_parametros_empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, AdvPageControl,
  ComCtrls, DBCtrls;

type
  TfrmParametrosEmpresa = class(Tfrm_modelo_cadastro)
    pgControl: TAdvPageControl;
    AdvTabSheet4: TAdvTabSheet;
    AdvTabSheet1: TAdvTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    ed_cnpj: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Panel4: TPanel;
    ed_nome_cidade: TDBEdit;
    Label9: TLabel;
    bt_pesq_cidade: TSpeedButton;
    ed_cod_cidade: TDBEdit;
    Label10: TLabel;
    Panel2: TPanel;
    ed_nome_estado: TDBEdit;
    Label18: TLabel;
    ed_cod_estado: TDBEdit;
    bt_pesq_estado: TSpeedButton;
    Label17: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    ed_telefone: TDBEdit;
    Label13: TLabel;
    ed_fax: TDBEdit;
    Label14: TLabel;
    ed_email: TDBEdit;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit7: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit8: TDBEdit;
    Label24: TLabel;
    DBEdit9: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit10: TDBEdit;
    Label27: TLabel;
    DBEdit11: TDBEdit;
    Label28: TLabel;
    DBEdit12: TDBEdit;
    Label29: TLabel;
    AdvTabSheet2: TAdvTabSheet;
    Label30: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametrosEmpresa: TfrmParametrosEmpresa;

implementation

{$R *.dfm}

end.
