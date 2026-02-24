unit uuBaixaContasAssinadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, cxStyles,
  cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox , ibquery, Mask,  
  cxCustomData, cxGraphics, cxFilter, cxData, RxCurrEdit, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, RxToolEdit, Vcl.ActnList,
  System.Actions;

type
  TfrmBaixaFaturas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    ed_desc_cliente: TEdit;
    bt_pesq_cliente: TSpeedButton;
    ed_cod_cliente: TEdit;
    Label48: TLabel;
    Panel4: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DATA_FATURA: TcxGridDBColumn;
    cxGridDBTableView1HORA: TcxGridDBColumn;
    cxGridDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGridDBTableView1USUARIO_INCLUSAO: TcxGridDBColumn;
    cxGridDBTableView1VALOR_FATURA: TcxGridDBColumn;
    cxGridDBTableView1SELECAO: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    btListarFaturas: TBitBtn;
    Label2: TLabel;
    Panel5: TPanel;
    btDesmarcarTodos: TSpeedButton;
    btMarcarTodos: TSpeedButton;
    Panel6: TPanel;
    Label3: TLabel;
    edTotalAberto: TCurrencyEdit;
    Label5: TLabel;
    edTotalSelecionadas: TCurrencyEdit;
    btCalcularTotal: TSpeedButton;
    Panel8: TPanel;
    btBaixasFaturas: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxStyle3: TcxStyle;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2COD_PRODUTO: TcxGridDBColumn;
    cxGridDBTableView2DESCRICAO: TcxGridDBColumn;
    cxGridDBTableView2QUANTIDADE_REAL: TcxGridDBColumn;
    cxGridDBTableView2VALOR_UNITARIO: TcxGridDBColumn;
    cxGridDBTableView2TOTAL: TcxGridDBColumn;
    procedure FormActivate(Sender: TObject);
    procedure btListarFaturasClick(Sender: TObject);
    function exibirFaturasDoCliente : boolean;
    procedure Edit1Change(Sender: TObject);
    procedure atualizarTodasAsFaturas(marcar : boolean );
    procedure btMarcarTodosClick(Sender: TObject);
    procedure btDesmarcarTodosClick(Sender: TObject);
    procedure calcularTotais();
    procedure btCalcularTotalClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btBaixasFaturasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaFaturas: TfrmBaixaFaturas;

implementation

uses uu_data_module, uuRecebimentoContaAssinada;

{$R *.dfm}

procedure TfrmBaixaFaturas.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryConsultaFaturas.Active := false;
  btMarcarTodos.Enabled := false;
  btDesmarcarTodos.Enabled := false;
  btListarFaturas.Enabled := true;
  btCalcularTotal.Enabled := false;
  

end;


procedure TfrmBaixaFaturas.atualizarTodasAsFaturas(marcar : boolean );
var
 q : TIBquery;
begin
   dm.transacao.Active :=false;
   dm.transacao.Active :=true;
   q :=TIBQuery.Create(self);
   q.Database:=dm.DBRESTAURANTE;
   q.Transaction:=dm.transacao;
   q.Active:=false;
   q.SQL.Clear;
   if marcar = true then
      q.sql.add('update faturas f set f.selecao=1 where cod_cli='+Quotedstr(ed_cod_cliente.Text))
   else
   q.sql.add('update faturas f set f.selecao=0 where cod_cli='+Quotedstr(ed_cod_cliente.Text));
   q.ExecSQL;
   dm.transacao.Commit;

   calcularTotais;
end;



procedure TfrmBaixaFaturas.calcularTotais();
var
 q : TIBquery;
begin
   q :=TIBQuery.Create(self);
   q.Database:=dm.DBRESTAURANTE;
   q.Transaction:=dm.transacao;

   dm.qryConsultaFaturas.Active := true;
   dm.qryConsultaFaturas.Prior;
   dm.qryConsultaFaturas.First;

   dm.transacao.Commit;


   q.Active:=false;
   q.SQL.Clear;
   q.sql.add('select sum(f.valor_fatura) as total from faturas f where f.cod_cli='+Quotedstr(ed_cod_cliente.Text)+' and f.status=0');
   q.Active := true;
                          

   if q.Fields[0].Value <> Null then
    begin
        if  q.Fields[0].Value > 0 then
         begin
           edTotalAberto.Value := q.Fields[0].Value;
           btBaixasFaturas.Enabled := true;
         end
        else
         begin
           edTotalAberto.Value := 0;
          btBaixasFaturas.Enabled := false;
         end;
    end
   else
    begin
      edTotalAberto.Value := 0;
      btBaixasFaturas.Enabled := false;
    end;


   q.Active:=false;
   q.SQL.Clear;
   q.sql.add('select sum(f.valor_fatura) as total from faturas f where f.cod_cli='+Quotedstr(ed_cod_cliente.Text)+' and f.status=0 and f.selecao=1');
   q.Active := true;
   if q.Fields[0].Value <> Null then
    begin
        if  q.Fields[0].Value > 0 then
         begin
           edTotalSelecionadas.Value := q.Fields[0].Value;
           btBaixasFaturas.Enabled := true;
         end
        else
         begin
          edTotalSelecionadas.Value := 0;
          btBaixasFaturas.Enabled := false;
         end;
    end
   else
    begin
      edTotalSelecionadas.Value := 0;
      btBaixasFaturas.Enabled := false;      
    end;

   exibirFaturasDoCliente();

end;


procedure TfrmBaixaFaturas.btListarFaturasClick(Sender: TObject);
begin

 if verificaExistenciaCliente(ed_cod_cliente.Text) then
  begin
   atualizarTodasAsFaturas(false);
   if exibirFaturasDoCliente = true  then
    begin
       btListarFaturas.Enabled := false;
       btMarcarTodos.Enabled := true;
       btDesmarcarTodos.Enabled :=true;
       btCalcularTotal.Enabled := true;
    end
   else
    begin
       btListarFaturas.Enabled := true;
       btMarcarTodos.Enabled := false;
       btDesmarcarTodos.Enabled :=false;
       btCalcularTotal.Enabled := false;
    end;
  end
 else
  begin
   ShowMessage('Cliente inválido!');
   ed_cod_cliente.SetFocus;
   exit;
  end;
end;


function  TfrmBaixaFaturas.exibirFaturasDoCliente() : boolean;
begin
 dm.transacao.Active :=false;
 dm.transacao.Active :=true;
 dm.qryConsultaFaturas.Active := false;
 dm.qryConsultaFaturas.SQL.Clear;
 dm.qryConsultaFaturas.SQL.Add('select f.cod_venda as CodigoVenda, f.*  from faturas f where f.cod_cli='+Quotedstr(ed_cod_cliente.text)+' and f.status=0');
 dm.qryConsultaFaturas.Active :=true;



 if dm.qryConsultaFaturas.IsEmpty  then
  begin
    ShowMessage('Cliente não possui faturas em aberto!');
    result:= false
  end
 else
  result := true;
 dm.qryItensConsultaFatura.Active :=true;

end;

procedure TfrmBaixaFaturas.Edit1Change(Sender: TObject);
begin
  inherited;
  dm.qryConsultaFaturas.Active := false;
  edTotalSelecionadas.Value := 0;
  edTotalAberto.Value := 0;
  btMarcarTodos.Enabled := false;
  btDesmarcarTodos.Enabled := false;
  btListarFaturas.Enabled := true;
  btCalcularTotal.Enabled := false;

end;

procedure TfrmBaixaFaturas.btMarcarTodosClick(Sender: TObject);
begin
  inherited;
  atualizarTodasAsFaturas(true);
  exibirFaturasDoCliente;
end;

procedure TfrmBaixaFaturas.btDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  atualizarTodasAsFaturas(false);
  exibirFaturasDoCliente; 
end;




procedure TfrmBaixaFaturas.btCalcularTotalClick(Sender: TObject);
begin
  inherited;
  if ( (dm.qryConsultaFaturas.Active = true) and (dm.qryConsultaFaturas.IsEmpty = false) ) then
   begin

     calcularTotais;
   end;
end;

procedure TfrmBaixaFaturas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmBaixaFaturas.btBaixasFaturasClick(Sender: TObject);
begin
  inherited;
  if ( (dm.qryConsultaFaturas.Active = true) and (dm.qryConsultaFaturas.IsEmpty = false) ) then
   begin
     calcularTotais;
     if frmEncerramentoContasAssinadas = nil then
      begin
       Application.CreateForm(TfrmEncerramentoContasAssinadas,frmEncerramentoContasAssinadas);
      end;
     frmEncerramentoContasAssinadas.edTotalFaturas.Value  := edTotalSelecionadas.Value;
     frmEncerramentoContasAssinadas.lbCodCliente.Caption  := ed_cod_cliente.Text;
     frmEncerramentoContasAssinadas.lbNomeCliente.Caption := ed_desc_cliente.Text;
     frmEncerramentoContasAssinadas.ShowModal;
     frmEncerramentoContasAssinadas := nil ;


     exibirFaturasDoCliente();

   end;

end;

end.
