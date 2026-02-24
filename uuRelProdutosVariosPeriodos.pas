unit uuRelProdutosVariosPeriodos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Grids, DBGrids,  Mask, StdCtrls,
  ExtCtrls, Buttons, DBCtrls, Menus, Data.DB, RxToolEdit, JvSpin, JvExMask,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  AdvGlassButton, PngSpeedButton;

type
  TfrmRelProdutosVariosPeriodos = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    gp_loja: TGroupBox;
    Label7: TLabel;
    btPesqLoja: TSpeedButton;
    Label28: TLabel;
    Panel9: TPanel;
    edDe: TDateEdit;
    edAte: TDateEdit;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    edDescLoja: TEdit;
    edCodLoja: TEdit;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    SpeedButton3: TSpeedButton;
    edHoraInicial: TJvTimeEdit;
    edHoraFinal: TJvTimeEdit;
    Label5: TLabel;
    Label6: TLabel;
    pnBottom: TPanel;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    ed_desc_grupo: TMaskEdit;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Label2: TLabel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    PngSpeedButton1: TPngSpeedButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure edDeClick(Sender: TObject);
    procedure edDeAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure edDeExit(Sender: TObject);
   function verificaValidadePeriodo() : Boolean;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    procedure GerarRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutosVariosPeriodos: TfrmRelProdutosVariosPeriodos;

implementation

uses UU_DM_RELATORIOS, uu_frm_principal, DateUtils;

{$R *.dfm}

procedure TfrmRelProdutosVariosPeriodos.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if verificaValidadePeriodo then
   begin
    dm_relatorios.cdsRelProdutosVendidosTemp.Append;
    dm_relatorios.cdsRelProdutosVendidosTempcod_empresa.Value   := edCodLoja.Text;
    dm_relatorios.cdsRelProdutosVendidosTempnome_empresa.Value  := edDescLoja.Text;
    dm_relatorios.cdsRelProdutosVendidosTempdata_inicial.Value  := edDe.Date;
    dm_relatorios.cdsRelProdutosVendidosTempdata_final.Value    := edAte.Date;
    dm_relatorios.cdsRelProdutosVendidosTempHORA_INICIAL.Value  := StrToTime(edHoraInicial.Text +':00');
    dm_relatorios.cdsRelProdutosVendidosTempHORA_FINAL.Value    := StrToTime(edHoraFinal.Text +':59');
    dm_relatorios.cdsRelProdutosVendidosTempalias_empresa.Value := getAliasEmpresaGrupo(edCodLoja.Text);
    dm_relatorios.cdsRelProdutosVendidosTemp.Post;
  end;
end;

procedure TfrmRelProdutosVariosPeriodos.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelProdutosVariosPeriodos.btSelecionarClick(Sender: TObject);
begin
  inherited;
   GerarRelatorio;
end;

function TfrmRelProdutosVariosPeriodos.verificaValidadePeriodo() : Boolean;
begin
  result := false;
  try
   StrToDate(edDe.Text)
  except
     begin
       ShowMessage('Data inicial inválida!');
       edDe.Clear;
       edDe.SetFocus;
       Exit;
     end;
  end;

  try
   StrToDate(edAte .Text)
  except
     begin
       ShowMessage('Data final inválida!');
       edAte .Clear;
       edAte .SetFocus;
       exit;
     end;
  end;


  if edDe.Date > edAte.Date then
   begin
     ShowMessage('Período inválido!');
     edDe.Clear;
     edAte.Clear;
     exit;
   end;

  if (verificaExistenciaLoja(edCodLoja.Text) = False) then
   begin
    ShowMessage('Empresa informada não é válida!');
    edCodLoja.Clear;
    exit;
   end;


  if (  edHoraInicial.Value > edHoraFinal.Value  ) then
  begin
    showmessage('Hora inicial não pode ser maior que hora final!');
    edHoraInicial.SetFocus;
    result:=false;
    exit;
  end;



  Result := true;
end;


procedure TfrmRelProdutosVariosPeriodos.FormActivate(Sender: TObject);
begin
  inherited;
  dm_relatorios.cdsRelProdutosVendidosTemp.Active := true;
  dm_relatorios.cdsRelProdutosVendidosTemp.EmptyDataSet;

  edDe.Date := Today;
  edAte.Date := today;
  edHoraInicial.Value := StrToTime('00:00:00');
  edHoraFinal.Value := StrToTime('23:59:59');


end;

procedure TfrmRelProdutosVariosPeriodos.GerarRelatorio();
var
 aliasPeriodo : string;
begin
  inherited;
  dm_relatorios.qryRelComparativoProdutos.Active := false;
  dm_relatorios.qryRelComparativoProdutos.sql.Clear;


  dm_relatorios.qryRelComparativoProdutos.sql.add('select * from (');

  dm_relatorios.cdsRelProdutosVendidosTemp.First;
  while not dm_relatorios.cdsRelProdutosVendidosTemp.Eof do
   begin
     aliasPeriodo := dm_relatorios.cdsRelProdutosVendidosTempalias_empresa.value+' '+FormatDateTime('DD/MM/YY',dm_relatorios.cdsRelProdutosVendidosTempdata_inicial.Value)+' até '+FormatDateTime('DD/MM/YY',dm_relatorios.cdsRelProdutosVendidosTempdata_final.Value)+' '+ dm_relatorios.cdsRelProdutosVendidosTempHORA_INICIAL.AsString  +' às '+dm_relatorios.cdsRelProdutosVendidosTempHORA_FINAL.AsString ;


       if dm_relatorios.cdsRelProdutosVendidosTemp.Bof = false then

            dm_relatorios.qryRelComparativoProdutos.sql.add(' union all ');

     dm_relatorios.qryRelComparativoProdutos.sql.add(' select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_raiz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,');
     dm_relatorios.qryRelComparativoProdutos.sql.add(' pm.descricao, pm.total, pm.percentualproduto,pm.quantidade as quantidade_contagem,');
     dm_relatorios.qryRelComparativoProdutos.sql.add(QuotedStr(aliasPeriodo)+' AS MES,'+IntToStr(dm_relatorios.cdsRelProdutosVendidosTemp.RecNo)+' as ordem');
     dm_relatorios.qryRelComparativoProdutos.sql.add('            from produtosvendidoscommargemF( ');
     dm_relatorios.qryRelComparativoProdutos.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dm_relatorios.cdsRelProdutosVendidosTempdata_inicial.value )));
     dm_relatorios.qryRelComparativoProdutos.sql.add(','+Quotedstr(FormatDateTime('DD.MM.YYY',dm_relatorios.cdsRelProdutosVendidosTempdata_final.Value )));
     dm_relatorios.qryRelComparativoProdutos.sql.add(','+Quotedstr(ed_cod_grupo.text));
     dm_relatorios.qryRelComparativoProdutos.sql.add(','+Quotedstr(dm_relatorios.cdsRelProdutosVendidosTempcod_empresa.value));
     dm_relatorios.qryRelComparativoProdutos.sql.add(','+Quotedstr(FormatDateTime('HH:MM:SS',dm_relatorios.cdsRelProdutosVendidosTempHORA_INICIAL.value )));
     dm_relatorios.qryRelComparativoProdutos.sql.add(','+Quotedstr(FormatDateTime('HH:MM:SS',dm_relatorios.cdsRelProdutosVendidosTempHORA_FINAL.Value )));
     dm_relatorios.qryRelComparativoProdutos.sql.add('      ) pm ');
     dm_relatorios.qryRelComparativoProdutos.sql.add('            inner join r_informacoes_produto ip on (ip.cod_produto = pm.cod_produto) ');

    // ////dm.adicionalog(dm_relatorios.qryRelComparativoProdutos.SQL.Text);

     dm_relatorios.cdsRelProdutosVendidosTemp.Next;


   end;



  dm_relatorios.qryRelComparativoProdutos.sql.add('       )    order by cod_g_raiz, cod_g_pai, cod_grupo,ordem ');
  ////dm.adicionalog(dm_relatorios.qryRelComparativoProdutos.SQL.Text);

  dm_relatorios.qryRelComparativoProdutos.Active := True;
  dm_relatorios.rpt.Clear;


  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relProdutosRefCruzada.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryRelComparativoProdutos.Active := False;



end;

procedure TfrmRelProdutosVariosPeriodos.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelProdutosVariosPeriodos.Excluir1Click(Sender: TObject);
begin
  inherited;
  if not  dm_relatorios.cdsRelProdutosVendidosTemp.IsEmpty then
   dm_relatorios.cdsRelProdutosVendidosTemp.Delete;
end;

procedure TfrmRelProdutosVariosPeriodos.edDeClick(Sender: TObject);
begin
  inherited;
  edAte.Date := EndOfTheMonth(edDe.Date);
end;

procedure TfrmRelProdutosVariosPeriodos.edDeAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  inherited;
  edAte.Date := EndOfTheMonth(edDe.Date);
end;

procedure TfrmRelProdutosVariosPeriodos.edDeExit(Sender: TObject);
begin
  inherited;
  edAte.Date := EndOfTheMonth(edDe.Date);
end;

procedure TfrmRelProdutosVariosPeriodos.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bold : boolean;
begin
  inherited;
if odd(dm_relatorios.cdsRelProdutosVendidosTemp.RecNo ) then
begin
  DBGrid1.Canvas.Brush.Color:= clwhite;

end
else
 begin
  DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

 end;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

bold :=false;
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

procedure TfrmRelProdutosVariosPeriodos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Confirma a exclusão de todos os períodos ?',mtConfirmation,[mbYes,mbNo],1)  = mrYes ) then
   begin
    dm_relatorios.cdsRelProdutosVendidosTemp.Active := true;
    dm_relatorios.cdsRelProdutosVendidosTemp.EmptyDataSet;
   end;
end;

end.
