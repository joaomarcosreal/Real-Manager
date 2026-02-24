unit uuCadPromoter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmCadPromoters = class(Tfrm_modelo_cadastro)
    edNomePromoter: TDBEdit;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    function  verificaValidade() : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPromoters: TfrmCadPromoters;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCadPromoters.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryPromoters.Active := true;
  dm.qryPromoters.Append;
  ed_codigo.Enabled := false;
  edNomePromoter.SetFocus;
end;

procedure TfrmCadPromoters.bt_alterarClick(Sender: TObject);
begin
  inherited;
  ed_codigo.Enabled :=  true;
  ed_codigo.SetFocus;
end;

function TfrmCadPromoters.verificaValidade() : boolean;
begin
  ShowMessage('');
end;



end.
