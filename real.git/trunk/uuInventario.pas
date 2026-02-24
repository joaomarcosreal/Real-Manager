unit uuInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.ActnList,
  System.Actions, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.ComCtrls, AdvDateTimePicker, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, RxToolEdit,
  RxCurrEdit, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, CurvyControls, AdvGlassButton,
  JvExDBGrids, JvDBGrid, uuDMInventarios, uuProdutosInventarios, JvExStdCtrls,
  JvEdit, JvValidateEdit;

type
  TfrmInventario = class(Tfrm_modelo_vazio)
    frmCorpo: TPanel;
    frmTopo: TPanel;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    JvDBGrid1: TJvDBGrid;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Label4: TLabel;
    Label5: TLabel;
    AdvGlassButton2: TAdvGlassButton;
    edDataInventario: TAdvDateTimePicker;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    JvValidateEdit2: TJvValidateEdit;
    JvValidateEdit3: TJvValidateEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInventario: TfrmInventario;

implementation

{$R *.dfm}

procedure TfrmInventario.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmAdicionaProdutoIventario, frmAdicionaProdutoIventario);
  frmAdicionaProdutoIventario.showmodal;
  frmAdicionaProdutoIventario.Free;
end;

procedure TfrmInventario.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmInventario.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
   codigo : string;
  begin
  inherited;
  if key= VK_RETURN  then
  begin


    if sender is TcxLookupComboBox  then
    begin

      codigo := (sender as TcxLookupComboBox).Properties.ListSource.DataSet.FieldByName((sender as TcxLookupComboBox).Properties.KeyFieldNames).Value ;
      (sender as TcxLookupComboBox).EditValue := codigo;
    end;
  end;


end;

procedure TfrmInventario.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInventario.SetFocus;
end;

procedure TfrmInventario.FormCreate(Sender: TObject);
begin
  inherited;
  dmInventarios := TdmInventarios.Create(self);
end;

procedure TfrmInventario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmInventarios);
end;

end.
