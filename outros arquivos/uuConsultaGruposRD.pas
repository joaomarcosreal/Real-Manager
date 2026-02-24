unit uuConsultaGruposRD;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ComCtrls, ExtCtrls, Buttons, ibx.ibquery,
  JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TfrmConsultaGruposRD = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure MontaTree(Nod: TTreeNode; Pai: string);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaGruposRD: TfrmConsultaGruposRD;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmConsultaGruposRD.FormActivate(Sender: TObject);
begin
  inherited;
  string_auxiliar:='';
  string_auxiliar2 :='';
  MontaTree(nil,'0');

end;





procedure TfrmConsultaGruposRD.MontaTree(Nod: TTreeNode; Pai: string);
var
Node: TTreeNode;
QFil: TIBQuery;
QPai: TIBQuery;
begin
 QFil := TIBQuery.Create(nil);
 QFil.Database  := dm.dbrestaurante;
 QFil.Transaction := dm.transacao;


 QPai := TIBQuery.Create(nil);
 QPai.Database := dm.dbrestaurante;
 QPai.Transaction := dm.transacao;

 QFil.SQL.Add('select trim(descricao) as descricao, trim(cod_formatado) as cod_formatado, cod_grupo,cod_grupo_pai from r_grupos_rd where cod_grupo_pai='+Quotedstr(pai)+' order by  cod_grupo_pai');
 QFil.Active :=true;


 while not QFil.Eof do
 begin
  if Nod = nil
   then
     begin
       Node := TreeView1.Items.Add(nil, QFil.fieldbyname('cod_formatado').value+' - '+QFil.FieldByName('descricao').AsString);
       TreeView1.Items[Node.Index].ImageIndex := 0;
       TreeView1.Items[Node.Index].SelectedIndex := 1;

    end
   else
     begin
       Node := TreeView1.Items.AddChild(Nod,QFil.fieldbyname('cod_formatado').value+' - '+QFil.FieldByName('descricao').AsString);
       TreeView1.Items[Node.Index].ImageIndex := 0;
       TreeView1.Items[Node.Index].SelectedIndex := 1;

     end;


  QPai.SQL.Clear;
  QPai.SQL.Add('SELECT COUNT(*) AS QUANT FROM r_grupos_rd where cod_grupo_pai ='+Quotedstr(QFil.FieldByName('cod_grupo').value));
  QPai.Open;
  if QPai.FieldByName('QUANT').AsInteger > 0 then
  MontaTree(Node, QFil.FieldByName('cod_grupo').AsString);
  QPai.Close;
  QFil.Next;
 end;
 QFil.Close;

 FreeAndNil(QFil);
 FreeAndNil(QPai);
end;


procedure TfrmConsultaGruposRD.BitBtn1Click(Sender: TObject);
var
 str : string;
 Q: TIBQuery;
begin
 try
  begin
    str :=   TreeView1.Selected.Text;
    str := copy(str,0,pos('-',str) -1);
  end
 except
  begin
    Showmessage('Selecione um grupo válido!');
    exit;
  end;
 end;



 Q := TIBQuery.Create(nil);
 Q.Database  := dm.dbrestaurante;
 Q.Transaction := dm.transacao;
 Q.SQL.clear;
 q.SQL.add('select cod_grupo,descricao from r_grupos_rd where trim(cod_formatado)='+Quotedstr(str));
 Q.Active:=true;
 string_auxiliar := Q.fieldbyname('cod_grupo').value;
 string_auxiliar2 := Q.fieldbyname('descricao').value;
 close;



end;

end.


