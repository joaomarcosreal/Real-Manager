unit uuGerarEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
   Menus, Data.DB, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, System.ImageList, Vcl.ImgList;

type
  TfrmGerarEtiquetas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    DBGrid2: TDBGrid;
    Image1: TImage;
    Panel13: TPanel;
    Label43: TLabel;
    ed_desc_grupo: TEdit;
    bt_pesq_grupo: TSpeedButton;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Edit2: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label4: TLabel;
    ed_cod_grupo: TEdit;
    RadioGroup1: TRadioGroup;
    Panel14: TPanel;
    edCodInicial: TEdit;
    edCodFinal: TEdit;
    GroupBox1: TGroupBox;
    edDescProduto: TEdit;
    RadioGroup2: TRadioGroup;
    ckbEstoque: TCheckBox;
    PopupMenu1: TPopupMenu;
    Adicionar1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    ImageList1: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarEtiquetas: TfrmGerarEtiquetas;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmGerarEtiquetas.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryCsProdEtiquetas.Active := false;
  dm.qryCsProdEtiquetas.Active := true;
end;

procedure TfrmGerarEtiquetas.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  Image1.Picture.LoadFromFile(dm.qryCsProdEtiquetasCAMINHO_FOTO.Value);
end;

procedure TfrmGerarEtiquetas.DBGrid1CellClick(Column: TColumn);
begin
  inherited;

  Image1.Picture.LoadFromFile(dm.qryCsProdEtiquetasCAMINHO_FOTO.Value);

end;

procedure TfrmGerarEtiquetas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    inherited;
    if odd(dm.qryCsProdEtiquetas.RecNo) then
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

procedure TfrmGerarEtiquetas.BitBtn3Click(Sender: TObject);
begin
  inherited;

  if ( trim(edCodInicial.Text) <> '') then
   begin
    try
      edCodInicial.Text := FormatFloat('00000',StrToFloat(edCodInicial.Text));
    except
       begin
         showmessage('Código inicial inválido!');
         edCodInicial.SetFocus;
         exit;
       end;
    end;

    try
      edCodFinal.Text := FormatFloat('00000',StrToFloat(edCodFinal.Text));
    except
       begin
         showmessage('Código final inválido!');
         edCodFinal.SetFocus;
         exit;
       end;
    end;

    if ( StrToInt(edCodInicial.Text ) > StrToInt(edCodFinal.Text ) ) then
     begin
       showmessage('Intervalo de códigos inválido. Código inicial não pode ser maior que o final!');
       edCodInicial.SetFocus;
       Exit;
     end;
   end;



  dm.qryCsProdEtiquetas.Active := false;
  dm.qryCsProdEtiquetas.sql.clear;
  dm.qryCsProdEtiquetas.sql.add('select p.cod_produto, p.descricao, p.valor_unitario, p.cod_grupo,p.caminho_foto ');
  dm.qryCsProdEtiquetas.sql.add(' from produtos p where p.cod_grupo like '+Quotedstr(ed_cod_grupo.Text+'%')+'');

  if ckbEstoque.Checked then
   begin
    dm.qryCsProdEtiquetas.SQL.Add(' and p.estoque_liquido > 0 ');
   end;

   if (trim(edDescProduto.Text) <> '') then
    begin
      dm.qryCsProdEtiquetas.SQL.Add(' and p.descricao like '+QuotedStr('%'+edDescProduto.Text+'%')+' ');
    end;

  if ( trim(edCodInicial.Text) <> '') then
   begin
    dm.qryCsProdEtiquetas.SQL.Add(' and p.cod_produto between '+QuotedStr(edCodInicial.text)+' and '+Quotedstr(edCodFinal.Text));
   end ;


   
  dm.qryCsProdEtiquetas.sql.add('  order by cod_produto ');

  dm.qryCsProdEtiquetas.Active := true;

  if dm.qryCsProdEtiquetas.IsEmpty then
   begin
     showmessage('Sem resultados para os filtros aplicados!');
     exit;
   end;


end;

procedure TfrmGerarEtiquetas.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
