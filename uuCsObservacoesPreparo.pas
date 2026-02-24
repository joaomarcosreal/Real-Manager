unit uuCsObservacoesPreparo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, PngSpeedButton, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCsObservacoesPreparo = class(Tfrm_modelo_pesquisas)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton12: TPngSpeedButton;
    itConfirmarPedido: TPngSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure itConfirmarPedidoClick(Sender: TObject);
    procedure PngSpeedButton12Click(Sender: TObject);
    procedure lbTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsObservacoesPreparo: TfrmCsObservacoesPreparo;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsObservacoesPreparo.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select cod_obs,descricao from observacoes_padrao order by descricao');
  
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsObservacoesPreparo.itConfirmarPedidoClick(Sender: TObject);
begin
  inherited;
  bt_selecionar.Click;
end;

procedure TfrmCsObservacoesPreparo.lbTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Offset: TPoint;
begin
  if Button = mbLeft then
  begin
    Offset := Panel1.ScreenToClient(Mouse.CursorPos);
    // Mantenha o botão do mouse pressionado enquanto move o formulário
    while GetAsyncKeyState(VK_LBUTTON) <> 0 do
    begin
      Application.ProcessMessages;
      Left := Mouse.CursorPos.X - Offset.X;
      Top := Mouse.CursorPos.Y - Offset.Y;
    end;
  end;
end;

procedure TfrmCsObservacoesPreparo.PngSpeedButton12Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
