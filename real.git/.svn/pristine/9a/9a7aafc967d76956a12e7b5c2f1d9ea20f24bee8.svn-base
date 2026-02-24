unit uuRelConferenciaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Grids, DBGrids, Mask, StdCtrls, ExtCtrls,
  Buttons;

type
  TfrmConferenciaCaixa = class(Tfrm_modelo_vazio)
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btFecharCaixa: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    edData: TMaskEdit;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConferenciaCaixa: TfrmConferenciaCaixa;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmConferenciaCaixa.BitBtn2Click(Sender: TObject);
begin
  inherited;
  dm.transacao.active:=false;
  dm.transacao.Active:=true;
  dm.qryConferenciaCaixa.Active:=false;
  dm.qryConferenciaCaixa.sql.clear;
  dm.qryConferenciaCaixa.SQL.add('select NOME_USUARIO,DATA_ABERTURA,HORA_ABERTURA,DATA_FECHAMENTO,HORA_FECHAMENTO,DATA_SISTEMA from caixas where data_sistema='+Quotedstr(formatDateTime('DD.MM.YYY',StrToDate(edData.text))));
  dm.qryConferenciaCaixa.Active:=true;

end;

procedure TfrmConferenciaCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConferenciaCaixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if dm.qryConferenciaCaixa.RecNo mod 2 = 1 then
      DBGrid1.Canvas.Brush.Color := clMoneyGreen
    else
      DBGrid1.Canvas.Brush.Color := clWhite;
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmConferenciaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.qryConferenciaCaixa.Close;
end;

end.
