unit uuMapaMesasNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls,
  jpeg, Mask,  CurrEdit;

type
  Tfrm_modelo_vazio2 = class(Tfrm_modelo_vazio)
    Button1: TButton;
    Image1: TImage;
    pnMapaMesas: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_modelo_vazio2: Tfrm_modelo_vazio2;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_modelo_vazio2.Button1Click(Sender: TObject);
begin
  inherited;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from mapa_mesas where m1 <> '+Quotedstr(''));
  dm.qryauxiliar.Active := true;

  DBGrid1.Repaint;
  DBGrid1.Refresh;
  frm_modelo_vazio2.Repaint;



//  patchAplicacao+'imagens\mesa_consumindo.bmp'
end;

procedure Tfrm_modelo_vazio2.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var Bitmap:
TBitmap;
begin
  inherited;




  if  dm.qryauxiliar.Fields[Column.index].Value <> '' then
   begin

    if (verificaMesaTemExtrato(dm.qryauxiliar.Fields[Column.index].Value)) then
     begin
       Image1.Picture.LoadFromFile(patchAplicacao+'imagens\conta.bmp');
     end
    else
      Image1.Picture.LoadFromFile(patchAplicacao+'imagens\livre2.bmp');



    Bitmap := Image1.Picture.Bitmap;


    Image1.Canvas.Font.Size := 14;
    Image1.Canvas.TextOut(18, 63, dm.qryauxiliar.Fields[Column.index].Value );


     with TDBGrid(Sender) do
      begin
       Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
       (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
      end;

   end;


//  end;

end;

end.
