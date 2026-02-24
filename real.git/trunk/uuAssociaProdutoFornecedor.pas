unit uuAssociaProdutoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons,
    RxToolEdit, RxCurrEdit;

type
  TfrmAssociaProdutoFornecedor = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    ed_cod_item: TEdit;
    Label9: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    rdTipoOperacao: TRadioGroup;
    Label10: TLabel;
    ed_unidade_item: TEdit;
    Label12: TLabel;
    pnfator: TPanel;
    edFatorConversao: TCurrencyEdit;
    Label13: TLabel;
    edCfopEntrada: TEdit;
    edCSTEntrada: TEdit;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    edCodProdFornecedor: TEdit;
    edDescProdFornecedor: TEdit;
    edUnidadeFornecedor: TEdit;
    edCFOPFornecedor: TEdit;
    edCSTFornecedor: TEdit;
    edNCMFornecedor: TEdit;
    edNomeFornecedor: TEdit;
    Panel9: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edCnpjFornecedor: TEdit;
    SpeedButton1: TSpeedButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    function  verificaValidadeLancamentoItemCompra() : boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssociaProdutoFornecedor: TfrmAssociaProdutoFornecedor;

implementation

uses uu_produtos, uu_data_module, uu_frm_principal, UU_DM_RELATORIOS;

{$R *.dfm}

procedure TfrmAssociaProdutoFornecedor.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key = vk_f11 then
  begin
    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item') then
      begin
        Application.CreateForm(Tfrm_produtos, frm_produtos);
        frm_produtos.ShowModal;
        frm_produtos.free;
        dm.transacao.Active:=false;
        dm.transacao.Active:=true;
        ed_cod_item.Text := string_auxiliar;
        ed_cod_item.SetFocus;
      end;
  end;;
end;

procedure TfrmAssociaProdutoFornecedor.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

function TfrmAssociaProdutoFornecedor.verificaValidadeLancamentoItemCompra() : boolean;
var
 cfop : string;
begin
  if verificaExistenciaItemEstoque(ed_cod_item.Text ,1) = false then
   begin
    showmessage('Código de ítem informado não existe!');
    ed_cod_item.Clear;
    result:=false;
    exit;
   end;


  if (edFatorConversao.Value  <= 0) then
  begin
    Showmessage('Fator de conversão deve ser superior a zero!');
    edFatorConversao.SetFocus;
    result:=false;
    exit;
  end;


  if (verificaExistenciaCFOP(edCfopEntrada.Text) =  false ) then
   begin
     showmessage('Código Fiscal de Operação do ítem não é válido!');
     edCfopEntrada.SetFocus;
     result:=false;
     exit;
   end;

   cfop:= copy(edCfopEntrada.Text,0,1);
   if (cfop <> '1') and (cfop <> '2') and (cfop <> '3') then
    begin
     showmessage('CFOP informado não é um CFOP de entrada');
     edCfopEntrada.SetFocus;
     result:=false;
     exit;
    end;


  if (verificaExistenciaCST(edCSTEntrada.Text) = false) then
    begin
      showmessage('Código da situação tributária do ítem não é válido!');
      edCSTEntrada.SetFocus;
      result:=false;
      exit;
    end;


  Result:=true;
end;


procedure TfrmAssociaProdutoFornecedor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidadeLancamentoItemCompra then
   begin
     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.SQL.Clear;

     dm.qryauxiliar.sql.Add('update compara_produtos_nfe cp');
     dm.qryauxiliar.sql.Add('  set ');
     dm.qryauxiliar.sql.Add('  cp.cod_produto_interno ='+Quotedstr(ed_cod_item.Text)+' ,');
     dm.qryauxiliar.sql.Add('  cp.cfop_entrada ='+Quotedstr(edCfopEntrada.Text)+' ,');
     dm.qryauxiliar.sql.Add('  cp.cst_entrada ='+Quotedstr(edCSTEntrada.Text)+' ,');
     dm.qryauxiliar.sql.Add('  cp.operacao ='+IntToStr(rdTipoOperacao.ItemIndex + 1)+',' );
     dm.qryauxiliar.sql.Add('  cp.fator_conversao ='+dm.TrocaVirgPPto(FloatToStr(edFatorConversao.Value))+' ');

     dm.qryauxiliar.sql.Add('  where cp.cnpj_fornecedor ='+QuotedStr(edCnpjFornecedor.Text));
     dm.qryauxiliar.sql.Add('   and cp.cod_prod_fornecedor ='+QuotedStr(edCodProdFornecedor.Text));
     dm.qryauxiliar.ExecSQL;
     dm.transacao.Commit;
     dm.transacao.Active := false;
     dm.transacao.Active :=true;
     showmessage('Atualização de associação realizada!');
     close;


   end;


end;

procedure TfrmAssociaProdutoFornecedor.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dm.ACBrNFe1.NotasFiscais.Clear;
//  dm_relatorios.ACBrNFeDANFEFR1.FastFile :=patchAplicacao+'DANFePaisagem.fr3';
  dm.ACBrNFe1   .NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(patchXMLEntradas+dm.qryComparaProdutosNFEULTIMA_CHAVE.Value+'-nfe.xml',False);
  dm.ACBrNFe1.NotasFiscais.Imprimir;

end;

end.
