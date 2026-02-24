unit uuFrmInutilizacoesNFCE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ComCtrls, StdCtrls, ExtCtrls, Buttons,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmInutilizacoesNFCE = class(Tfrm_modelo_vazio)
    pnInutlizacoes: TPanel;
    lbpnInutilizacoes: TLabel;
    lbQtdInut: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    pgInutilizacoes: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInutilizacoesNFCE: TfrmInutilizacoesNFCE;

implementation

{$R *.dfm}

end.
