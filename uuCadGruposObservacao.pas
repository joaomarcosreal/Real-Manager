unit uuCadGruposObservacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, ExtCtrls, DBCtrls, Vcl.Mask;

type
  TfrmCadGruposObs = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label6: TLabel;
    edDescGrupoTouch: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGruposObs: TfrmCadGruposObs;

implementation

{$R *.dfm}

end.
