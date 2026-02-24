unit uu_cs_produtos;

interface

uses
  Windows, Messages,db, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls, Grids, DBGrids,
  Buttons, AdvTouchKeyboard, Vcl.DBCtrls;

type
  Tfrm_consulta_produtos = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ed_descricao_produto: Tedit;
    Label3: TLabel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    BT_SELECIONAR: TBitBtn;
    bt_sair: TBitBtn;
    AdvTouchKeyboard2: TAdvTouchKeyboard;
    Panel1: TPanel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Memo1: TDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure ed_descricao_produtoChange(Sender: TObject);
    procedure ed_descricao_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_sairClick(Sender: TObject);



    procedure bt_selecionarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_SELECIONARClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consulta_produtos: Tfrm_consulta_produtos;
  tipo_consulta : integer;

implementation

uses uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

procedure Tfrm_consulta_produtos.FormActivate(Sender: TObject);
begin

  dm.qryConsultaProdutos.Active:=false;
  dm.qryConsultaProdutos.SQL.Clear;
  dm.qryConsultaProdutos.SQL.add('Select cod_barras,descricao,valor_unitario,cod_grupo,cod_produto from produtos where vende=1');

  case tipo_consulta of
   1: begin
       Label3.Caption:='Digite as iniciais do produto:';
        frm_consulta_produtos.Caption:='Consulta de produtos';
      end;
   2: begin
        dm.qryConsultaProdutos.sql.add(' where acompanhamento=1 ');
        Label3.Caption:='Digite as iniciais do acompanhamento:';
        frm_consulta_produtos.Caption:='Consulta de acompanhamentos';
      end;
  end;
  dm.qryConsultaProdutos.SQL.Add('order by descricao');
  dm.qryConsultaProdutos.Active:=true;
  TNumericField(dm.qryConsultaProdutos.FieldByName('valor_unitario')).DisplayFormat := 'R$ ,0.00;-,0.00';

  DBGrid1.Refresh;

  ed_descricao_produto.SetFocus;

end;

procedure Tfrm_consulta_produtos.ed_descricao_produtoChange(
  Sender: TObject);
begin
  dm.qryConsultaProdutos.Active:=false;
  dm.qryConsultaProdutos.SQL.Clear;
  dm.qryConsultaProdutos.SQL.add('Select cod_barras,descricao,valor_unitario,cod_grupo,cod_produto  from produtos where vende=1 and descricao like '+QuotedStr('%'+ed_descricao_produto.Text+'%')+' ');
  If tipo_consulta=2 then
    dm.qryConsultaProdutos.SQL.Add(' and acompanhamento=1');
  dm.qryConsultaProdutos.sql.add(' order by descricao');

  dm.qryConsultaProdutos.Active:=true;
  TNumericField(dm.qryConsultaProdutos.FieldByName('valor_unitario')).DisplayFormat := 'R$ ,0.00;-,0.00';
  DBGrid1.refresh;

end;

procedure Tfrm_consulta_produtos.ed_descricao_produtoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao_produto') then
     begin
       DBGrid1.SetFocus;
     end;

     if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
     begin
        bt_selecionar.Click;
     end;

  end;

  if key=vk_escape then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao_produto') then
     begin
        bt_sair.Click;
     end;

     if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
     begin
        ed_descricao_produto.SetFocus;
     end;
  end;


   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_descricao_produto') then
    begin
      if key = vk_up then
       begin
         dm.qryConsultaProdutos.Prior;
       end;

      if key = vk_down then
       begin
         dm.qryConsultaProdutos.Next;
       end;
    end;


end;

procedure Tfrm_consulta_produtos.bt_sairClick(Sender: TObject);
begin
  string_auxiliar:='';
  close;
end;






procedure Tfrm_consulta_produtos.bt_selecionarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_escape then
 begin
   bt_sair.Click;

 end;


end;

procedure Tfrm_consulta_produtos.BT_SELECIONARClick(Sender: TObject);
begin
  try
   begin
    string_auxiliar:=dm.qryConsultaProdutos.fieldbyname('cod_produto').Value;

    string_aux_cod_barras:=dm.qryConsultaProdutos.fieldbyname('cod_barras').Value;
   end;
  except
   begin
     showmessage('Seleção inválida!');
     ed_descricao_produto.SetFocus;
     exit;
   end;
  end;
  close;

end;


procedure Tfrm_consulta_produtos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if odd(dm.qryConsultaProdutos.RecNo) then
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

procedure Tfrm_consulta_produtos.SpeedButton1Click(Sender: TObject);
begin
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
  dm.qryConsultaProdutos.Prior;
end;

procedure Tfrm_consulta_produtos.SpeedButton2Click(Sender: TObject);
begin
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;
  dm.qryConsultaProdutos.Next;


end;

end.



