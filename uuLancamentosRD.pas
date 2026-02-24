unit uuLancamentosRD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls,
  RXDBCtrl, DBCtrls,  Grids, DBGrids, ibx.ibquery, Menus, Data.DB,
  RxCurrEdit, RxToolEdit;

type
  TfrmLancamentosRD = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    pnFornecedor: TPanel;
    Label6: TLabel;
    Label30: TLabel;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    ed_cod_fornecedor: TDBEdit;
    Panel3: TPanel;
    ed_razao_social_fornecedor: TDBEdit;
    Panel13: TPanel;
    edDataEmissaoNotaFiscal: TDBDateEdit;
    edDataEntradaNotaFiscal: TDBDateEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    ed_desc_grupo: TEdit;
    bt_pesq_grupo: TSpeedButton;
    Label3: TLabel;
    Label43: TLabel;
    Panel5: TPanel;
    btAdicionar: TBitBtn;
    edNumeroNotaFiscal: TDBEdit;
    Label4: TLabel;
    edValor: TCurrencyEdit;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    memoObs: TMemo;
    Label5: TLabel;
    ed_cod_grupo: TEdit;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Panel8: TPanel;
    edTotalLancamentos: TCurrencyEdit;
    Label7: TLabel;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);


    function  verificarValidade() : boolean;
    function  verificaValidadeItemRD() : boolean;
    procedure gravarInformacoes();
    procedure bt_gravarClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure gravarItensEntrada();
    procedure FormCreate(Sender: TObject);
    procedure calculaTotais();
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    veioDasEntradas : boolean;
    codigoEntrada : string;
  end;

var
  frmLancamentosRD: TfrmLancamentosRD;

implementation

uses uu_data_module, uu_frm_principal, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmLancamentosRD.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
    if odd(dm.tbLancamentosRDTEMP.RecNo) then
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


procedure TfrmLancamentosRD.calculaTotais();
begin
  dm.tbLancamentosRDTEMP.First;
  edTotalLancamentos.Value := 0;
  while not dm.tbLancamentosRDTEMP.Eof do
   begin
    edTotalLancamentos.Value := dm.tbLancamentosRDTEMP.fieldbyname('valor').value + edTotalLancamentos.Value;
    dm.tbLancamentosRDTEMP.Next;
   end;


end;

function TfrmLancamentosRD.verificarValidade() : boolean;
begin
  result := false;

    if ( (dm.qryLancamentosRDDATA_DOCUMENTO.Value) > (dm.qryLancamentosRDDATA_RD  .value) )then
  begin
    showmessage('Data de entrada do RD não pode ser menor que a data de emissão!!');
    edDataEntradaNotaFiscal .SetFocus;
    Result:=false;
    exit;
  end;



  if ( verificaExistenciaFornecedor(ed_cod_fornecedor.text) = false ) then
  begin
    ShowMessage('Fornecedor especifado não existe!');
    ed_cod_fornecedor.setfocus;
    Result:=false;
    exit;
  end;

  if ( dm.tbLancamentosRDTEMP.IsEmpty ) then
  begin
    showmessage('É necessário no mínimo um ítem lançançado!');
    ed_cod_grupo.SetFocus;
    Result:=false;
    exit;
  end;

  if (dm.qryLancamentosRDNUM_DOC.Value = '') or (dm.qryLancamentosRDNUM_DOC.Value = null) then
   begin
    showmessage('Número do documento inválido!');
    edNumeroNotaFiscal.SetFocus;
    Result:=false;
    exit;
   end;

  result := true;


end;


procedure TfrmLancamentosRD.gravarItensEntrada();
var
 q : TIBQuery;
 ordem : integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.sql.Add('delete from itens_lancamento_rd where cod_lanc_rd='+Quotedstr(ed_codigo.Text));
  q.ExecSQL;
  q.Active:=false;
  q.SQL.Clear;

  dm.tbLancamentosRDTEMP.First;
  while not dm.tbLancamentosRDTEMP.Eof do
   begin
     q.Active := false;
     q.SQL.Clear;
     q.SQL.add('insert into itens_lancamento_rd (cod_lanc_rd,cod_grupo,valor) values ('+Quotedstr(ed_codigo.Text)+', ');
     q.SQL.add(dm.tbLancamentosRDTEMPCOD_GRUPO.Value+',');
     q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(dm.tbLancamentosRDTEMPvalor.Value ))+')');
     q.ExecSQL;

     dm.tbLancamentosRDTEMP.Next;


   end;


end;

procedure TfrmLancamentosRD.gravarInformacoes();
var
   ct: integer;
   obs : string;
begin

 if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_LANCAMENTOS_RD',8);
     dm.qryLancamentosRDCODIGO.Value := ed_codigo.Text;
     dm.qryLancamentosRDNOME_USUARIO.Value := nome_usuario;
   end;


 if ( (evento = 1) or (evento=2) )then
   begin


    for ct:=0 to memoObs.Lines.Count-1 do
      begin
       obs:=obs + memoObs.lines[ct];
      end;

    dm.qryLancamentosRDOBSERVACOES.Value := obs;
    dm.qryLancamentosRD.Post;
    gravarItensEntrada();
    dm.dbrestaurante.ApplyUpdates([dm.qryLancamentosRD]);
   end
 else
  begin



    if (MessageBox(0, 'Confirma exclusão desta entrada ? ', 'Exclusão de entrada', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) in [idYes]) then
      begin
       dm.qryLancamentosRD.Delete;
       dm.dbrestaurante.ApplyUpdates([dm.qryLancamentosRD]);
      end
    else
      bt_cancelar.Click;
  end;



end;

procedure TfrmLancamentosRD.bt_gravarClick(Sender: TObject);
begin

  if verificarValidade then
   begin
     gravarInformacoes;
     if veioDasEntradas then
      close
     else
     inherited;
   end;
end;

procedure TfrmLancamentosRD.Excluir1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirma exclusão ?',mtConfirmation, [mbYes,mbNo],0) = mrYes  then
  dm.tbLancamentosRDTEMP.Delete;
end;

function TfrmLancamentosRD.verificaValidadeItemRD() : boolean;
begin
  if (verificaExistenciaGrupo(ed_cod_grupo.Text) = false) then
   begin
    ShowMessage('Grupo especificado não existe!');
    ed_cod_grupo.clear;
    ed_desc_grupo.Clear;
    ed_cod_grupo.SetFocus;
    result := false;
   end;

  if length(trim(ed_cod_grupo.text)) < 6 then
  begin
     showmessage('O grupo selecionado não é um grupo-filho. Selecione uma ramificação no menor nível do grupo escolhido');
     ed_cod_grupo.clear;
     ed_desc_grupo.clear;
     ed_cod_grupo.setfocus;
     Result:=false;
     exit;
  end;


  result := true;

end;


procedure TfrmLancamentosRD.btAdicionarClick(Sender: TObject);
begin
  inherited;
  if (verificaValidadeItemRD = true) then
   begin
     dm.tbLancamentosRDTEMP.Active := true;
     dm.tbLancamentosRDTEMP.Append;
     dm.tbLancamentosRDTEMPCOD_GRUPO.Value := ed_cod_grupo.Text;
     dm.tbLancamentosRDTEMPdescricao.Value := ed_desc_grupo.Text;
     dm.tbLancamentosRDTEMPvalor.Value := edValor.Value;
     dm.tbLancamentosRDTEMP.Post;

     ed_cod_grupo.clear;
     ed_desc_grupo.clear;
     edValor.Value := 0;
     calculaTotais();
     ed_cod_grupo.SetFocus;
   end;
end;

procedure TfrmLancamentosRD.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.tbLancamentosRDTEMP.Active := true;
  dm.tbLancamentosRDTEMP.EmptyTable;
end;

procedure TfrmLancamentosRD.FormCreate(Sender: TObject);
begin
  inherited;
  veioDasEntradas := false;
  codigoEntrada := '';
end;

procedure TfrmLancamentosRD.FormActivate(Sender: TObject);
begin
  inherited;
  if veioDasEntradas then
   bt_novo.Click;
end;

end.
