unit uuCancelaItemPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  JvExControls, JvButton, JvTransparentButton;

type
  TfrmCancelaItemPDV = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    btConsultarProdutos: TJvTransparentButton;
    JvTransparentButton1: TJvTransparentButton;
    btConfirmar: TJvTransparentButton;
    btDesistir: TJvTransparentButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btDesistirClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btConsultarProdutosClick(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelaItemPDV: TfrmCancelaItemPDV;

implementation

uses uu_data_module, uuFrenteCaixa, Math;

{$R *.dfm}

procedure TfrmCancelaItemPDV.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if odd(dm.qry_movimento_mesa.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);



if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin

  Font.Color := clBlack;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];

//  TDbGrid(Sender).Canvas.font.Color:= clb;
  Brush.Color:=4099549; 
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


end;

procedure TfrmCancelaItemPDV.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  inherited;
  {
if odd(dm.qry_movimento_mesa.RecNo) then
DBGrid2.Canvas.Brush.Color:= clwhite
else
DBGrid2.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
}

end;

procedure TfrmCancelaItemPDV.btDesistirClick(Sender: TObject);
begin
  inherited;
  frmFrenteCaixa.desistirCancelamento := true;
  Close;
end;

procedure TfrmCancelaItemPDV.btConfirmarClick(Sender: TObject);
begin
  inherited;
  frmFrenteCaixa.desistirCancelamento := false;
  Close;
end;

procedure TfrmCancelaItemPDV.btConsultarProdutosClick(Sender: TObject);
begin
  inherited;
  dm.qry_movimento_mesa.Prior;

end;

procedure TfrmCancelaItemPDV.JvTransparentButton1Click(Sender: TObject);
begin
  inherited;
  dm.qry_movimento_mesa.Next;
end;

procedure TfrmCancelaItemPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = vk_return) then
   begin
     btConfirmar.Click;
   end;

 if (Key = vk_escape) then
  begin
    btDesistir.Click;
  end;

end;

end.
