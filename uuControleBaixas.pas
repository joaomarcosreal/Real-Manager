unit uuControleBaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Data.DB, cxGraphics,
  cxControls,
  AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,

  cxDBLookupComboBox, AdvGlassButton,
  JvDBGrid, Vcl.ActnList, Vcl.Buttons,  System.DateUtils,
  uuDmControleInventarios, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvExDBGrids, JvActionsEngine,
  JvControlActions, System.Actions, cxLookupEdit, cxDBLookupEdit, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmControleBaixas = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    ActionList1: TActionList;
    ControlAction1: TControlAction;
    Action1: TAction;
    frmCorpo: TPanel;
    Label4: TLabel;
    JvDBGrid1: TJvDBGrid;
    frmTopo: TPanel;
    Label8: TLabel;
    cbHistoricoBaixaEstoque: TcxLookupComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    btImprimirInventario: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    RadioGroup1: TRadioGroup;
    AdvGlassButton4: TAdvGlassButton;
    RadioGroup2: TRadioGroup;
    Panel6: TPanel;
    ed_desc_item: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    Panel4: TPanel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label5: TLabel;
    ed_cod_item: TEdit;
    RadioGroup3: TRadioGroup;
    Panel5: TPanel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TEdit;
    Label6: TLabel;
    Panel7: TPanel;
    ed_desc_grupo: TEdit;
    Label12: TLabel;
    btPequisaInventarios: TAdvGlassButton;
    Panel10: TPanel;
    Label9: TLabel;
    lbTotalInventarios: TLabel;
    PopupMenu1: TPopupMenu;
    I1: TMenuItem;
    procedure AdvGlassButton4Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btPequisaInventariosClick(Sender: TObject);
    procedure btImprimirInventarioClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
  private
    procedure CalculavaloresInventarios;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleBaixas: TfrmControleBaixas;

implementation

{$R *.dfm}

uses uuDmRelatorios, uu_frm_principal,
  uuBaixasManuais;

procedure TfrmControleBaixas.btImprimirInventarioClick(Sender: TObject);
var
 codigoInventario : integer;
begin
  inherited;


  dRelatorios.qryRelInventario.Active := false;
  dRelatorios.qryRelItensInventario.Active := false;

  codigoInventario := dmControleInventarios.QryConsultaInventario.FieldByName('codigo').Value;
  dRelatorios.qryRelInventario.ParamByName('VpInventario').Value      := codigoInventario;
  dRelatorios.qryRelItensInventario.ParamByName('VpInventario').Value := codigoInventario;
  dRelatorios.qryRelInventario.Active := true;
  dRelatorios.qryRelItensInventario.Active := true;

  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relInventario.fr3',true);
  dRelatorios.rpt.PrepareReport(true);
  dRelatorios.rpt.ShowReport(true);

end;

procedure TfrmControleBaixas.btPequisaInventariosClick(Sender: TObject);
var
 dataInicial , dataFinal, codProduto, codHistorico : string;
begin
  inherited;

  dataInicial := Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date));
  dataFinal   := Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date));
  codProduto  := Quotedstr(ed_cod_item.Text);
  codHistorico  := cbHistoricoBaixaEstoque.EditValue;




  dmControleInventarios.QryConsultaInventario.Active := false;
  dmControleInventarios.QryConsultaInventario.SQL.Clear;
  dmControleInventarios.QryConsultaInventario.sql.Add ('  select ir.codigo, ir.data_inventario, cast(ir.data_hora_so as Time) as hora, ir.cod_historico, hi.descricao as descricao_historico, ');
  dmControleInventarios.QryConsultaInventario.sql.add('         ir.nome_usuario, ir.total_sobras, ir.total_perdas, ir.total_inventario,ir.obs ');
  dmControleInventarios.QryConsultaInventario.sql.add('   from inventarios ir ');
  dmControleInventarios.QryConsultaInventario.sql.add('        inner join historicos_inventario hi on (hi.codigo = ir.cod_historico)  ');
  dmControleInventarios.QryConsultaInventario.sql.add('        where ir.data_inventario between '+dataInicial+' and '+dataFinal);


  if ( trim(ed_cod_item.Text) <> ''  ) then
   begin
    dmControleInventarios.QryConsultaInventario.sql.add('         and ir.codigo in   ');
    dmControleInventarios.QryConsultaInventario.sql.add('          ( select itv.cod_inventario    from itens_inventario itv  ');
    dmControleInventarios.QryConsultaInventario.sql.add('               inner join inventarios iv on (iv.codigo = itv.cod_inventario )  ');
    dmControleInventarios.QryConsultaInventario.sql.add('              where itv.cod_produto= '+codProduto);
    dmControleInventarios.QryConsultaInventario.sql.add('              and iv.data_inventario between  '+dataInicial+' and '+dataFinal+')');
   end;


  if codHistorico  <> '0'  then
   begin
     dmControleInventarios.QryConsultaInventario.SQL.Add(' and ir.cod_historico = '+codHistorico);
   end;


  dmControleInventarios.QryConsultaInventario.SQL.Add('  order by ir.codigo ');
  ////dm.adicionalog(dmControleInventarios.QryConsultaInventario.SQL.Text);
  dmControleInventarios.QryConsultaInventario.Active := true;
  CalculavaloresInventarios();







end;

procedure TfrmControleBaixas.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmControleBaixas.AdvGlassButton4Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaixasManuais, frmBaixasManuais);
  frmBaixasManuais.ShowModal;
  frmBaixasManuais.Free;
end;

procedure TfrmControleBaixas.FormCreate(Sender: TObject);
begin
  inherited;
  dmControleInventarios :=   TdmControleInventarios.Create(self);
  dmControleInventarios.qryHistoricosBaixaEstoque.Active := true;
  cbHistoricoBaixaEstoque.EditValue := '000';
  edDataInicial.Date := StartOfTheMonth(now);
  edDataFinal.Date   := now;
  btPequisaInventarios.Click;
end;

procedure TfrmControleBaixas.CalculavaloresInventarios();
var
totalSobras, totalFaltas, totalnventario :  Currency;
begin
 totalSobras :=0;
 totalFaltas := 0;
 totalnventario :=0;

 dmControleInventarios.QryConsultaInventario.DisableControls;
 dmControleInventarios.QryConsultaInventario.first;

 while not dmControleInventarios.QryConsultaInventario.eof do
  begin
    totalSobras := totalSobras + dmControleInventarios.QryConsultaInventarioTOTAL_SOBRAS.Value;
    totalFaltas := totalFaltas + dmControleInventarios.QryConsultaInventarioTOTAL_PERDAS.Value;
    totalnventario := totalnventario + dmControleInventarios.QryConsultaInventarioTOTAL_INVENTARIO.Value;
    dmControleInventarios.QryConsultaInventario.Next;
  end;


   lbTotalInventarios.Caption    := FormatFloat('R$ ###,###,##0.00 ',totalnventario );

 dmControleInventarios.QryConsultaInventario.EnableControls;
end;


procedure TfrmControleBaixas.FormDestroy(Sender: TObject);
begin
  inherited;
  dmControleInventarios.qryHistoricosInventarios.Active := false;
  FreeAndNil(dmControleInventarios);

end;

procedure TfrmControleBaixas.I1Click(Sender: TObject);
begin
  inherited;
  btImprimirInventario.Click;
end;

end.
