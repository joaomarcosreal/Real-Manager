unit uuAlterarCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAlterarCartao = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarCartao: TfrmAlterarCartao;

implementation

{$R *.dfm}

end.
