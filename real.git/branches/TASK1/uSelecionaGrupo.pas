unit uSelecionaGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ComCtrls, ExtCtrls, Buttons, Ibquery,
  ImgList, AdvTreeComboBox, System.ImageList, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmSelecionaGrupo = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    Label1: TLabel;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
    procedure MontaTree(Nod: TTreeNode; Pai: string);
  public
    { Public declarations }
  end;

var
  frmSelecionaGrupo: TfrmSelecionaGrupo;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}


procedure TfrmSelecionaGrupo.MontaTree(Nod: TTreeNode; Pai: string);
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


 QFil.SQL.Add(' select rg.cod_grupo_raiz,rg.cod_grupo_pai,  trim(rg.cod_formatado) as cod_formatado, g.cod_grupo, ');
 QFil.SQL.Add('        udf_space(udf_len(g.cod_grupo)+2)|| trim(g.descricao) as descricao ');
 QFil.SQL.Add('  from grupos g');
 QFil.SQL.Add('    inner join  r_grupos rg on (rg.cod_grupo  = g.cod_grupo)');
 QFil.SQL.Add('         where cod_grupo_pai='+Quotedstr(Pai));
 QFil.SQL.Add('          order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobramento_filho');




 //QFil.SQL.Add(' select trim(descricao) as descricao, trim(cod_formatado) as cod_formatado, cod_grupo,cod_grupo_pai from r_grupos where cod_grupo_pai='+Quotedstr(pai)+' order by  cod_grupo_pai');
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
  QPai.SQL.Add('SELECT COUNT(*) AS QUANT FROM r_grupos where cod_grupo_pai ='+Quotedstr(QFil.FieldByName('cod_grupo').value));
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

procedure TfrmSelecionaGrupo.FormActivate(Sender: TObject);
begin
  inherited;
{  string_auxiliar:='';
  string_auxiliar2 :='';
  MontaTree(nil,'0');}


end;

procedure TfrmSelecionaGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.clear;

  dm.qry_consultas.SQL.Add('select rg.nivel, rg.cod_grupo_raiz,rg.cod_grupo_pai,cod_formatado||'+Quotedstr('   - ')+'||trim(g.descricao) as descricao, g.cod_grupo,');
  dm.qry_consultas.SQL.Add('       g.perc_proj_rd, ');
  dm.qry_consultas.SQL.Add('       case g.mostra_no_rd ');
  dm.qry_consultas.SQL.Add('        when 0 then '+Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('        when 1 then '+Quotedstr('SIM'));
  dm.qry_consultas.SQL.Add('       else ');
  dm.qry_consultas.SQL.Add('         '+Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('       END as MOSTRA_RD, ');
  dm.qry_consultas.SQL.Add('       case g.RESULTADO_RD ');
  dm.qry_consultas.SQL.Add('        when 0 then '+Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('        when 1 then '+Quotedstr('SIM'));
  dm.qry_consultas.SQL.Add('       else ');
  dm.qry_consultas.SQL.Add('         '+Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('       END AS RESULTADO_RD ');
  dm.qry_consultas.SQL.Add(' from grupos g');
  dm.qry_consultas.SQL.Add('   inner join  r_grupos rg on (rg.cod_grupo  = g.cod_grupo)');
  dm.qry_consultas.SQL.Add('         order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobramento_filho');
  dm.adicionaLog(dm.qry_consultas.SQL.Text);
  dm.qry_consultas.Active :=true;
  TFloatField(dm.qry_consultas.fields[5]).DisplayFormat := '###,###,##0.00%';
end;

procedure TfrmSelecionaGrupo.BitBtn1Click(Sender: TObject);

begin

 string_auxiliar :=  dm.qry_consultas.fieldbyname('cod_grupo').value;
 string_auxiliar2 := dm.qry_consultas.fieldbyname('descricao').value;
 close;



end;

procedure TfrmSelecionaGrupo.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSelecionaGrupo.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn1.Click;
end;

procedure TfrmSelecionaGrupo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


  if dm.qry_consultas.fieldbyname('nivel').Value =  1  then
   begin
     DBGrid1.Canvas.Font.Style := [fsBold];
     if (Column.Field.FieldName = 'DESCRICAO') then
         begin
          DBGrid1.Canvas.Brush.Color:= $00DF3C37;
         end;

   end
  else
   begin
      if dm.qry_consultas.fieldbyname('nivel').Value =  2  then
     begin
       DBGrid1.Canvas.Font.Style := [fsBold];
       if (Column.Field.FieldName = 'DESCRICAO') then
         begin
          DBGrid1.Canvas.Brush.Color:= $00A8B649;
         end;


     end

    else
     begin

     if (Column.Field.FieldName = 'DESCRICAO') then
       begin
          if odd(dm.qryProjecaoDespesasRD.RecNo) then
           DBGrid1.Canvas.Brush.Color:= clwhite
          else
           DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
          DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
       end;

     end;


   end;

  if dm.qry_consultas.fieldbyname('MOSTRA_RD').Value =  'SIM'  then
   begin
     if (Column.Field.FieldName = 'MOSTRA_RD') then
         begin
          DBGrid1.Canvas.font.Color:= clblack;
          DBGrid1.Canvas.Brush.Color:= clLime;
         end;
   end
  else
   begin
     if (Column.Field.FieldName = 'MOSTRA_RD') then
         begin
          DBGrid1.Canvas.font.Color:= clblack;
          DBGrid1.Canvas.Brush.Color:= clred;
         end;
   end;




  if dm.qry_consultas.fieldbyname('RESULTADO_RD').Value =  'SIM'  then
   begin
     if (Column.Field.FieldName = 'RESULTADO_RD') then
         begin
          DBGrid1.Canvas.font.Color:= clblack;
          DBGrid1.Canvas.Brush.Color:= clLime;
         end;
   end
  else
   begin
     if (Column.Field.FieldName = 'RESULTADO_RD') then
         begin
          DBGrid1.Canvas.font.Color:= clblack;
          DBGrid1.Canvas.Brush.Color:= clred;
         end;
   end;


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

end.

procedure TfrmSelecionaGrupo.FormActivate(Sender: TObject);
begin
  inherited;

end;


