unit uSelecionaGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ComCtrls, ExtCtrls, Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, AdvGlassButton, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TfrmSelecionaGrupo = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    ImageList1: TImageList;
    Panel4: TPanel;
    lbTop: TLabel;
    DBGrid1: TDBGrid;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    Panel3: TPanel;
    Label1: TLabel;
    edDescricaoGrupo: TEdit;
    pnSetParametros: TPanel;
    edNCM: TEdit;
    edCFOP: TEdit;
    edCST: TEdit;
    edAliquota: TEdit;
    SpeedButton1: TSpeedButton;
    NCM: TLabel;
    edCest: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edImpressora: TEdit;
    Label6: TLabel;
    procedure btSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edDescricaoGrupoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDescricaoGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSelecionarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }

    procedure processaConsultaGrupos;
  public
    { Public declarations }
  end;

var
  frmSelecionaGrupo: TfrmSelecionaGrupo;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmSelecionaGrupo.FormActivate(Sender: TObject);
begin
  inherited;
  if codigo_usuario = '001' then
  begin
    pnSetParametros.Visible := true;
  end;

  edDescricaoGrupo.SetFocus;
end;

procedure TfrmSelecionaGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  processaConsultaGrupos();
end;

procedure TfrmSelecionaGrupo.processaConsultaGrupos();
begin

  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.clear;

  dm.qry_consultas.SQL.Add('select rg.nivel, rg.cod_grupo_raiz,rg.cod_grupo_pai,cod_formatado||' + Quotedstr('   - ') + '||trim(g.descricao) as descricao, g.cod_grupo,');
  dm.qry_consultas.SQL.Add('       g.perc_proj_rd, ');
  dm.qry_consultas.SQL.Add('       case g.mostra_no_rd ');
  dm.qry_consultas.SQL.Add('        when 0 then ' + Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('        when 1 then ' + Quotedstr('SIM'));
  dm.qry_consultas.SQL.Add('       else ');
  dm.qry_consultas.SQL.Add('         ' + Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('       END as MOSTRA_RD, ');
  dm.qry_consultas.SQL.Add('       case g.RESULTADO_RD ');
  dm.qry_consultas.SQL.Add('        when 0 then ' + Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('        when 1 then ' + Quotedstr('SIM'));
  dm.qry_consultas.SQL.Add('       else ');
  dm.qry_consultas.SQL.Add('         ' + Quotedstr('NÃO'));
  dm.qry_consultas.SQL.Add('       END AS RESULTADO_RD ');
  dm.qry_consultas.SQL.Add(' from grupos g');
  dm.qry_consultas.SQL.Add('   inner join  r_grupos rg on (rg.cod_grupo  = g.cod_grupo)');
  dm.qry_consultas.SQL.Add('   where g.descricao like  ' + QuotedStr(edDescricaoGrupo.Text + '%') + ' ');
  dm.qry_consultas.SQL.Add('         order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobramento_filho');
  ////dm.adicionalog(dm.qry_consultas.SQL.Text);
  dm.qry_consultas.Active := true;
  TFloatField(dm.qry_consultas.fields[5]).DisplayFormat := '###,###,##0.00%';
end;

procedure TfrmSelecionaGrupo.SpeedButton1Click(Sender: TObject);
var
  LSQL: Tstringlist;
begin
  inherited;
  LSQL := TStringList.Create;

  try
    LSQL.clear;
    LSQL.add(' update produtos p set p.cod_produto=p.cod_produto,');
    if (trim(edNCM.Text) <> '') then
      LSQL.add(' p.ncm =' + QUotedstr(edNCM.Text) + ',');

    if (trim(edCest.Text) <> '') then
      LSQL.add(' p.cest =' + QUotedstr(edCest.Text) + ',');

    if (trim(edCFOP.Text) <> '') then
      LSQL.add(' p.cfop_saida =' + QUotedstr(edCFOP.Text) + ',');

    if (trim(edCST.Text) <> '') then
      LSQL.add(' p.cst_saida =' + QUotedstr(edCST.Text) + ',');

    if (trim(edAliquota.Text) <> '') then
      LSQL.add(' p.cod_aliquota =' + QUotedstr(edAliquota.Text) + ',');

    if (trim(edImpressora.Text) <> '') then
      LSQL.add(' p.cod_miniprinter =' + QUotedstr(edImpressora.Text) + ',');
    LSQL.add(' p.cod_barras = p.cod_barras');

    LSQL.add(' where p.cod_grupo like ' + Quotedstr(dm.qry_consultas.fieldbyname('cod_grupo').value) + '||' + Quotedstr('%'));
    dm.executaSQL(LSQL.Text);

    Showmessage('Procedimento de alteração realizado com sucesso!');

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmSelecionaGrupo.btSelecionarClick(Sender: TObject);
begin
  inherited;
  string_auxiliar := dm.qry_consultas.fieldbyname('cod_grupo').value;
  string_auxiliar2 := dm.qry_consultas.fieldbyname('descricao').value;
  close;

end;

procedure TfrmSelecionaGrupo.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSelecionaGrupo.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btSelecionar.Click;
end;

procedure TfrmSelecionaGrupo.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if dm.qry_consultas.fieldbyname('nivel').Value = 1 then
  begin
    DBGrid1.Canvas.Font.Style := [fsBold];
    if (Column.Field.FieldName = 'DESCRICAO') then
    begin
      DBGrid1.Canvas.Brush.Color := $00DF3C37;
    end;

  end
  else
  begin
    if dm.qry_consultas.fieldbyname('nivel').Value = 2 then
    begin
      DBGrid1.Canvas.Font.Style := [fsBold];
      if (Column.Field.FieldName = 'DESCRICAO') then
      begin
        DBGrid1.Canvas.Brush.Color := $00A8B649;
      end;

    end
    else
    begin

      if (Column.Field.FieldName = 'DESCRICAO') then
      begin
        if odd(dm.qryProjecaoDespesasRD.RecNo) then
          DBGrid1.Canvas.Brush.Color := clwhite
        else
          DBGrid1.Canvas.Brush.Color := clMoneyGreen;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

    end;

  end;

  if dm.qry_consultas.fieldbyname('MOSTRA_RD').Value = 'SIM' then
  begin
    if (Column.Field.FieldName = 'MOSTRA_RD') then
    begin
      DBGrid1.Canvas.font.Color := clblack;
      DBGrid1.Canvas.Brush.Color := clLime;
    end;
  end
  else
  begin
    if (Column.Field.FieldName = 'MOSTRA_RD') then
    begin
      DBGrid1.Canvas.font.Color := clblack;
      DBGrid1.Canvas.Brush.Color := clred;
    end;
  end;

  if dm.qry_consultas.fieldbyname('RESULTADO_RD').Value = 'SIM' then
  begin
    if (Column.Field.FieldName = 'RESULTADO_RD') then
    begin
      DBGrid1.Canvas.font.Color := clblack;
      DBGrid1.Canvas.Brush.Color := clLime;
    end;
  end
  else
  begin
    if (Column.Field.FieldName = 'RESULTADO_RD') then
    begin
      DBGrid1.Canvas.font.Color := clblack;
      DBGrid1.Canvas.Brush.Color := clred;
    end;
  end;

  TDbGrid(Sender).Canvas.font.Color := clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clred; //aqui é definida a cor do fundo
      Font.Color := clWhite;
      Font.Size := Font.Size + 2;
      Font.Style := [fsbold];
      FillRect(Rect);
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);
end;

procedure TfrmSelecionaGrupo.edDescricaoGrupoChange(Sender: TObject);
begin
  inherited;
  processaConsultaGrupos;
end;

procedure TfrmSelecionaGrupo.edDescricaoGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
  begin
    if Sender is Tedit and ((Sender as Tedit).Name = 'edDescricaoGrupo') then
    begin
      DBGrid1.SetFocus;
    end;

    if Sender is TDBGrid and ((Sender as TDBGrid).Name = 'DBGrid1') then
    begin
      btSelecionar.Click;
    end;

  end;

  if Key = vk_escape then
  begin
    if Sender is Tedit and ((Sender as Tedit).Name = 'edDescricaoGrupo') then
    begin
      btSair.Click;
    end;

    if Sender is TDBGrid and ((Sender as TDBGrid).Name = 'DBGrid1') then
    begin
      edDescricaoGrupo.SetFocus;
    end;
  end;

  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edDescricaoGrupo') then
  begin
    if Key = vk_up then
    begin
      dm.qry_consultas.Prior;
    end;

    if Key = vk_down then
    begin
      dm.qry_consultas.Next;
    end;
  end;

end;

end.

