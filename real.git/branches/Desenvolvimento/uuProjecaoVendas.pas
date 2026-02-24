unit uuProjecaoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids, DBCtrls, Menus;

type
  TfrmProjecaoVendas = class(Tfrm_modelo_cadastro)
    Panel2: TPanel;
    Panel3: TPanel;
    cal: TMonthCalendar;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    pnAlterar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel5: TPanel;
    edProjInicial: TDBEdit;
    edReprojecao: TDBEdit;
    edFaturamentoReal: TDBEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure calClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure calExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProjecaoVendas: TfrmProjecaoVendas;

implementation

uses uu_data_module, DateUtils;

{$R *.dfm}

procedure TfrmProjecaoVendas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if dm.qryProjecaoReceitaRDDIA.Value = 'DOM' then
   begin
    DBGrid1.Canvas.Brush.Color:= clYellow;
    TDbGrid(Sender).Canvas.font.Color:= clblack;
   end
  else
   begin
    TDbGrid(Sender).Canvas.font.Color:= clBlack;
    if odd(dm.qryProjecaoReceitaRD.RecNo) then
     DBGrid1.Canvas.Brush.Color:= clwhite
    else
     DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
   end;


  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:=clred; //aqui é definida a cor do fundo
    Font.Color := clWhite;
    Font.Size :=   Font.Size + 2;
    Font.Style:= [fsbold];
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TfrmProjecaoVendas.calClick(Sender: TObject);
var
 dataInicial, dataFinal : TDate;
begin
  inherited;

  dataInicial := StartOfTheMonth(cal.Date);
  dataFinal   := EndOfTheMonth(cal.Date);

  dm.qryProjecaoReceitaRD.Active := false;
  dm.qryProjecaoReceitaRD.SQL.Clear;
  dm.qryProjecaoReceitaRD.sql.Add('select rd.data, udf_copy( upper(udf_dayname(rd.data)),0,3) as dia ,rd.projecao, rd.reprojecao, rd.faturamento_real ');
  dm.qryProjecaoReceitaRD.sql.Add('from projecoes_receitas_rd rd ');
  dm.qryProjecaoReceitaRD.sql.Add('  where rd.data between ');
  dm.qryProjecaoReceitaRD.sql.Add( Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  )));
  dm.qryProjecaoReceitaRD.sql.Add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )));
  dm.qryProjecaoReceitaRD.sql.Add(' order by rd.data ');
  dm.qryProjecaoReceitaRD.Active := true;

  if dm.qryProjecaoReceitaRD.IsEmpty then
   begin

     while (dataInicial <= dataFinal) do
      begin
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.SQL.Clear;
       dm.qryauxiliar.SQL.Add('insert into projecoes_receitas_rd (data) values ( ');
       dm.qryauxiliar.sql.add(''+QuotedStr(FormatDateTime('DD.MM.YY',dataInicial ))+')');
       dm.qryauxiliar.ExecSQL;
       dataInicial := dataInicial + 1;
      end;

    dm.transacaoProcedure.Active:=false;
    dm.transacaoProcedure.Active:=true;
    dm.transacao.Commit;

    dataInicial := StartOfTheMonth(cal.Date);
    dataFinal   := EndOfTheMonth(cal.Date);
    dm.qryProjecaoReceitaRD.Active := false;
    dm.qryProjecaoReceitaRD.SQL.Clear;
    dm.qryProjecaoReceitaRD.sql.Add('select rd.data, udf_copy( upper(udf_dayname(rd.data)),0,3) as dia ,rd.projecao, rd.reprojecao, rd.faturamento_real ');
    dm.qryProjecaoReceitaRD.sql.Add('from projecoes_receitas_rd rd ');
    dm.qryProjecaoReceitaRD.sql.Add('  where rd.data between ');
    dm.qryProjecaoReceitaRD.sql.Add( Quotedstr( FormatDateTime('DD.MM.YYYY',dataInicial  )));
    dm.qryProjecaoReceitaRD.sql.Add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',dataFinal )));
    dm.qryProjecaoReceitaRD.sql.Add(' order by rd.data ');
    dm.qryProjecaoReceitaRD.Active := true;



   end;




end;

procedure TfrmProjecaoVendas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dm.qryProjecaoReceitaRD.Post;
  dm.transacao.Active := true;
  dm.transacao.Commit;
  dm.qryProjecaoReceitaRD.Active := false;
  dm.qryProjecaoReceitaRD.Active := True;
  pnAlterar.Visible := False;
  Panel2.Enabled := true;
  pn_principal.Enabled :=true;


end;

procedure TfrmProjecaoVendas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    pnAlterar.Visible := False;
    dm.qryProjecaoReceitaRD.Cancel;
    dm.qryProjecaoReceitaRD.Active := False;
    dm.qryProjecaoReceitaRD.Active := true;
   Panel2.Enabled := true;
  pn_principal.Enabled :=true;

end;

procedure TfrmProjecaoVendas.FormActivate(Sender: TObject);
begin
  inherited;
//  cal.Date := Date;
  cal.OnClick(Sender);

end;

procedure TfrmProjecaoVendas.calExit(Sender: TObject);
begin
  inherited;
  calClick(Sender)
end;

procedure TfrmProjecaoVendas.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  cal.Date := StartOfTheMonth(cal.Date);
  cal.Date := IncMonth(cal.Date,1);
   cal.OnClick(Sender);
end;

procedure TfrmProjecaoVendas.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  cal.Date := StartOfTheMonth(cal.Date);
  cal.Date := IncMonth (cal.Date,-1);
  cal.OnClick(Sender);

end;

procedure TfrmProjecaoVendas.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  pnAlterar.Visible := True;
  dm.qryProjecaoReceitaRD.Edit;

end;

end.
