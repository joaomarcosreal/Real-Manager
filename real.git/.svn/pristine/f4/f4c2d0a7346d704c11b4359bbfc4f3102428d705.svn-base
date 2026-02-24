unit uu_clientes_na_casa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons,ibquery;

type
  TfrmClientesNaCasa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    edNomeCliente: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lbTotClientesNaCasa: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbTotClientesEntraram: TLabel;
    lbTotClientesSairam: TLabel;
    rdTipo: TRadioGroup;
    Panel2: TPanel;
    Label6: TLabel;
    btSair: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure edNomeClienteChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientesNaCasa: TfrmClientesNaCasa;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmClientesNaCasa.FormActivate(Sender: TObject);
var
  qryContagem : Tibquery;
begin
  inherited;
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;
   qryContagem := TIBQuery.Create(Self);
   qryContagem.Database:= dm.dbrestaurante;
   qryContagem.Transaction:= dm.transacao;


   dm.qryClientesNaCasa.Active:=false;
   dm.qryClientesNaCasa.SQL.clear;
   dm.qryClientesNaCasa.sql.add('   select c.cod_cartao, cli.razao_social  from cartoes c ');
   dm.qryClientesNaCasa.sql.add('  inner join clientes cli on (cli.cod_cli = c.cod_cli )');
   dm.qryClientesNaCasa.sql.add('   where c.status=0');
   dm.qryClientesNaCasa.SQL.add('  order by cli.razao_social');
   dm.qryClientesNaCasa.Active:=true;



   qryContagem.Active:=false;
   qryContagem.SQL.clear;
   qryContagem.sql.add('select count(*) as total from cartoes c where status=0');
   qryContagem.Active:=true;
   lbTotClientesNaCasa.Caption := Inttostr(qryContagem.fieldbyname('total').Value);




   qryContagem.Active:=false;
   qryContagem.SQL.clear;
   qryContagem.sql.add('select count(*) as total from cartoes c where status=1 or status=0');
   qryContagem.Active:=true;
   lbTotClientesEntraram.Caption := Inttostr(qryContagem.fieldbyname('total').Value);



   qryContagem.Active:=false;
   qryContagem.SQL.clear;
   qryContagem.sql.add('select count(*) as total from cartoes c where status=1');
   qryContagem.Active:=true;
   lbTotClientesSairam.Caption := Inttostr(qryContagem.fieldbyname('total').Value);


   dm.qryClientesNaCasa.Active:=false;
   dm.qryClientesNaCasa.SQL.clear;
   dm.qryClientesNaCasa.sql.add('   select c.cod_cartao, cli.razao_social  from cartoes c ');
   dm.qryClientesNaCasa.sql.add('  inner join clientes cli on (cli.cod_cli = c.cod_cli )');
   dm.qryClientesNaCasa.sql.add('   where c.status=0');
   dm.qryClientesNaCasa.SQL.add('  order by cli.razao_social');
   dm.qryClientesNaCasa.Active:=true;
   edNomeCliente.SetFocus;

end;

procedure TfrmClientesNaCasa.edNomeClienteChange(Sender: TObject);
var
  qryContagem : Tibquery;

begin
  inherited;

   dm.qryClientesNaCasa.Active:=false;
   dm.qryClientesNaCasa.SQL.clear;
   dm.qryClientesNaCasa.sql.add('   select c.cod_cartao, cli.razao_social  from cartoes c ');
   dm.qryClientesNaCasa.sql.add('  inner join clientes cli on (cli.cod_cli = c.cod_cli )');

   case rdTipo.ItemIndex of
    0: dm.qryClientesNaCasa.sql.add('  where c.status <> -10');
    1: dm.qryClientesNaCasa.sql.add('  where c.status = 0');
    2: dm.qryClientesNaCasa.sql.add('  where c.status = 1');
   end;

   dm.qryClientesNaCasa.sql.add(' and cli.razao_social like '+Quotedstr(edNomeCliente.Text+'%'));




  if (RadioGroup1.ItemIndex = 0) then
    dm.qryClientesNaCasa.SQL.add('  order by c.cod_cartao')
  else
    dm.qryClientesNaCasa.SQL.add('  order by cli.razao_social');

   dm.qryClientesNaCasa.Active:=true;



end;

procedure TfrmClientesNaCasa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmClientesNaCasa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if odd(dm.qryClientesNaCasa.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
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

procedure TfrmClientesNaCasa.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNomeCliente') then
    begin
      if key = vk_up then
       begin
         dm.qryClientesNaCasa.Prior;
       end;

      if key = vk_down then
       begin
         dm.qryClientesNaCasa.Next;
       end;
    end;


end;

procedure TfrmClientesNaCasa.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
