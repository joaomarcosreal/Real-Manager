unit uuCsPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ComCtrls, ExtCtrls, ibx.ibquery,
  Grids, DBGrids, Data.DB, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  Tfrm_cs_contas = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    TreeView1: TTreeView;
    Panel4: TPanel;
    Panel5: TPanel;
    edDescricao: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure MontaTree(Nod: TTreeNode; Pai: string);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edDescricaoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_contas: Tfrm_cs_contas;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cs_contas.MontaTree(Nod: TTreeNode; Pai: string);
var
  Node: TTreeNode;
  QFil: TIBQuery;
  QPai: TIBQuery;
begin
  QFil := TIBQuery.Create(nil);
  QFil.Database := dm.dbrestaurante;
  QFil.Transaction := dm.transacao;

  QPai := TIBQuery.Create(nil);
  QPai.Database := dm.dbrestaurante;
  QPai.Transaction := dm.transacao;

  QFil.SQL.Add('select * from r_plano_contas where cod_conta <> ' + Quotedstr('000000') + ' and cod_conta_pai=' + (Pai) + ' order by  cod_conta_raiz,cod_conta_pai,desdobramento');
  QFil.Active := true;

  while not QFil.Eof do
  begin
    if Nod = nil then
    begin
      Node := TreeView1.Items.Add(nil, QFil.fieldbyname('cod_formatado').value + ' - ' + QFil.FieldByName('descricao').AsString);
      TreeView1.Items[Node.Index].ImageIndex := 0;
      TreeView1.Items[Node.Index].SelectedIndex := 1;

    end
    else
    begin
      Node := TreeView1.Items.AddChild(Nod, QFil.fieldbyname('cod_formatado').value + ' - ' + QFil.FieldByName('descricao').AsString);
      TreeView1.Items[Node.Index].ImageIndex := 0;
      TreeView1.Items[Node.Index].SelectedIndex := 1;

    end;

    QPai.SQL.Clear;
    QPai.SQL.Add('SELECT COUNT(*) AS QUANT FROM r_plano_contas where  cod_conta <> ' + Quotedstr('000000') + ' and cod_conta_pai =' + (QFil.FieldByName('cod_conta').value));
    QPai.Open;
    if QPai.FieldByName('QUANT').AsInteger > 0 then
      MontaTree(Node, QFil.FieldByName('cod_conta').AsString);
    QPai.Close;
    QFil.Next;
  end;
  QFil.Close;

  FreeAndNil(QFil);
  FreeAndNil(QPai);
end;

procedure Tfrm_cs_contas.FormActivate(Sender: TObject);
begin
  inherited;
  string_auxiliar := '';
  string_auxiliar2 := '';
  MontaTree(nil, '0');
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.add('select cod_formatado,descricao from r_plano_contas where cod_conta <> ' + Quotedstr('000000'));
  dm.qry_consultas.Active := true;

end;

procedure Tfrm_cs_contas.BitBtn1Click(Sender: TObject);
var
  str: string;
  Q: TIBQuery;
begin
  try
    begin
      if PageControl1.ActivePageIndex = 0 then
      begin
        str := TreeView1.Selected.Text;
        str := copy(str, 0, pos('-', str) - 1);
      end
      else
      begin
        str := dm.qry_consultas.fieldbyname('cod_formatado').value;
      end;
    end
  except
    begin
      Showmessage('Selecione uma conta válido!');
      exit;
    end;
  end;

  Q := TIBQuery.Create(nil);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := dm.transacao;
  Q.SQL.clear;
  Q.SQL.add('select cod_conta,descricao from r_plano_contas where cod_conta <> ' + Quotedstr('000000') + ' and  cod_formatado=' + Quotedstr(str));
  Q.Active := true;
  string_auxiliar := Q.fieldbyname('cod_conta').value;
  string_auxiliar2 := Q.fieldbyname('descricao').value;
  close;

end;

procedure Tfrm_cs_contas.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_cs_contas.edDescricaoChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.add('select cod_formatado,descricao from r_plano_contas where  cod_conta <> ' + Quotedstr('000000') + ' and descricao    like ' + Quotedstr('%' + edDescricao.Text + '%') + ' ');
  dm.qry_consultas.Active := true;

end;

procedure Tfrm_cs_contas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if odd(dm.qry_consultas.RecNo) then
    DBGrid1.Canvas.Brush.Color := clwhite
  else
    DBGrid1.Canvas.Brush.Color := clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color := clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

end;

end.

