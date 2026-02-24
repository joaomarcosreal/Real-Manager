unit teste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_principal, frm_principal);
  frm_principal.ShowModal;
  frm_principal.Free; 
end;

end.
