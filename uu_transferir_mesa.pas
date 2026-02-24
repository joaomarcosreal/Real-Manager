unit uu_transferir_mesa;

interface

uses
  Windows, Messages, RealFramework, SysUtils, Variants, Classes,
  System.Generics.Collections, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, DBGrids, DB, RxMemDS, uu_modelo_vazio, AdvGlassButton,
  Vcl.Samples.Spin, Vcl.Grids;

type
  Tfrm_transferir_mesa = class(Tfrm_modelo_vazio)
    tbTransferencia: TRxMemoryData;
    tbTransferenciamesa: TStringField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    pnNumeroMesa: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btTransferirMesa: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Panel3: TPanel;
    lbl4: TLabel;
    Panel12: TPanel;
    Label37: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    edMesaAdicionar: TSpinEdit;
    edMesaDestino: TSpinEdit;
    btAdicionarMesa: TAdvGlassButton;
    ckbNaoImprimirProducao: TCheckBox;
    procedure ed_mesa_destinoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure confirmarTransferencia();
    procedure IAeverButton1Click(Sender: TObject);
    procedure btAdicionarMesaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIAeverButton1Click(Sender: TObject);
    procedure btTransferirMesaClick(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure btAdicionarMesaClick(Sender: TObject);
    procedure edMesaAdicionarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMesaDestinoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure AdicionarMesaALista;
    procedure ValidarTransferencia;
    procedure validarMesaAdicionar;
    procedure TransferirMesa(AMesaOrigem, AMesaDestino: string; AListaSQL: TList<string>);
    procedure GravarLogDaTransferencia(LMesaOrigem, LMesaDestino: string; AListaSQL: TList<string>);
    procedure RealizarTransferencia;



    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_transferir_mesa: Tfrm_transferir_mesa;

implementation

uses
  uu_data_module, uu_frm_principal, Math;


{$R *.dfm}

procedure Tfrm_transferir_mesa.RealizarTransferencia();
var
  LListaSQL: TList<string>;
  codigo_lancamento: string;
  result: string;
  LMesaOrigem, LMesaDestino: string;
begin

  LListaSQL := TList<string>.Create;

  try
    tbTransferencia.First;
    while not tbTransferencia.Eof do
    begin
      LMesaOrigem := tbTransferenciamesa.value;
      LMesaDestino := FormatFloat('0000', edMesaDestino.Value);
      dm.InsereChavesMovimento(numero_caixa, LMesaOrigem);
      if StrToBool(dm.LeIni(2, 'TRANSFERENCIA_DE_MESA', 'imprime_comprovante')) = true then
      begin
        dm.ImprimeComprovanteMesa(TcTransferenciaMesa, LMesaOrigem, LMesaDestino, ckbNaoImprimirProducao.Checked);
      end;
      TransferirMesa(LMesaOrigem, LMesaDestino, LListaSQL);
      GravarLogDaTransferencia(LMesaOrigem, LMesaDestino, LListaSQL);
      tbTransferencia.Next;
    end;
    LListaSQL.Add('delete from extratos_emitidos et where et.mesa not in (select distinct ms.cod_mesa  from movimento_mesa ms);');
    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);

  finally
    FreeAndNil(LListaSQL);
  end;




//
{
  if (dm.verificaSeAMesaFoiAberta(destino) = false ) then
   begin
     dm.efetuaAberturaDaMesa(destino);
   end;
 }

end;

procedure Tfrm_transferir_mesa.GravarLogDaTransferencia(LMesaOrigem: string; LMesaDestino: string; AListaSQL: TList<string>);
var
  totalMesaOrigem, totalMesaDestino: double;
  LCodTransferencia: string;
  LSQL: TStringlist;
begin
  LSQL := TStringList.Create;
  try
    LCodTransferencia := dm.geraCodigo('G_TRANSFERENCIAS_MESA', 10);
    totalMesaOrigem := getValorProdutosMesa(LMesaOrigem);
    totalMesaDestino := getValorProdutosMesa(LMesaDestino);

    LSQL.Add('insert into transferencias_mesa (codigo,mesa_origem,mesa_destino,total_mesa_origem,total_mesa_destino,cod_caixa,hora,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU,cod_empresa) values(');
    LSQL.Add('' + Quotedstr(LCodTransferencia) + ',');
    LSQL.Add('' + Quotedstr(LMesaOrigem) + ',');
    LSQL.Add('' + QuotedStr(LMesaDestino) + ',');
    LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(totalMesaOrigem)) + ',');
    LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(totalMesaDestino)) + ',');
    LSQL.Add('' + Quotedstr(ultimoCaixaAberto) + ',');
    LSQL.Add('' + Quotedstr(FormatDateTime('hh:mm:ss', Time)) + ',');
    LSQL.Add(QuotedStr(codigo_usuario_responsavel) + ',');
    LSQL.Add(QuotedStr(nome_usuario_responsavel) + ',');
    LSQL.Add('' + Quotedstr(codEmpresa) + ')');

    LSQL.Add('insert into produtos_transferencias_mesa(COD_TRANSFERENCIA,COD_PRODUTO,');
    LSQL.Add('       QUANTIDADE,VALOR_UNITARIO,TOTAL)');
    LSQL.Add('       select ' + QuotedStr(LCodTransferencia) + ',mv.cod_produto,mv.quantidade,mv.valor_unitario,(mv.valor_unitario * mv.quantidade)');
    LSQL.Add('       from movimento_mesa mv');
    LSQL.Add('       where mv.cod_mesa=' + Quotedstr(LMesaOrigem));

  finally
    FreeAndNil(LSQL);
  end;

   {
  if (StrToInt(dm.LeIni(1, 'TRANSFERENCIA_DE_MESA', 'imprime_comprovante')) = 1) then
  begin
    dm.imprimeComprovanteTrans  ferenciaMesa(LMesaOrigem, LMesaDestino, LCodTransferencia, totalMesaOrigem, totalMesaDestino);
  end;
  }

end;

procedure Tfrm_transferir_mesa.TransferirMesa(AMesaOrigem: string; AMesaDestino: string; AListaSQL: TList<string>);
var
  codigo_lancamento: string;
  LSQL: TStringList;
begin

  LSQL := TStringList.Create();
  try

    LSQL.Clear;
    LSQL.Add('update movimento_mesa set cod_mesa=' + Quotedstr(AMesaDestino));
    LSQL.Add(',obs_paf=' + Quotedstr('Transf. mesa ' + Inttostr(StrToInt(AMesaOrigem))));
    LSQL.Add(' where cod_mesa=' + Quotedstr(AMesaOrigem) + ';');
    AListaSQL.add(LSQL.text);

    LSQL.Clear;
    LSQL.add('update recebimento_parcial set mesa=' + Quotedstr(AMesaDestino));
    LSQL.Add(' where mesa=' + Quotedstr(AMesaOrigem) + ';');
    AListaSQL.add(LSQL.text);

    if (StrToInt(dm.LeIni(2, 'ENCERRAMENTO', 'bloqueiaMesaAposFechar')) = 1) then
    begin
      LSQL.Clear;
      LSQL.Add('update cartoes set status=1 where cod_cartao=' + Quotedstr(AMesaOrigem) + ';');
      AListaSQL.add(LSQL.text);
    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure Tfrm_transferir_mesa.ed_mesa_destinoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0)
  end;

  if Key = vk_escape then
  begin
    Close;
  end;

end;

procedure Tfrm_transferir_mesa.FormActivate(Sender: TObject);
begin
  if StrToBool(dm.LeIni(2, 'TRANSFERENCIA_DE_MESA', 'imprimir_na_producao')) then
    ckbNaoImprimirProducao.Checked := true;

  tbTransferencia.Active := false;
  tbTransferencia.EmptyTable;
  tbTransferencia.Active := true;
  edMesaAdicionar.SetFocus;

end;

procedure Tfrm_transferir_mesa.AdicionarMesaALista;
var
  LNumeroMesaAdicionar: string;
  LMensagemErro: string;
begin
  try
    LNumeroMesaAdicionar := formatFloat('0000', edMesaAdicionar.Value);
    if dm.verificaseExisteMovimentoMesa(LNumeroMesaAdicionar) then
    begin
      tbTransferencia.Append;
      tbTransferenciamesa.Value := LNumeroMesaAdicionar;
      tbTransferencia.Post;
      edMesaAdicionar.SetFocus;
    end
    else
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', 'A mesa/comanda ' + Inttostr(edMesaAdicionar.Value) + ' não tem movimento!', 22, true);
    end;

  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', 'Número de mesa inválido!', 22, true);
    end;
  end;
end;

procedure Tfrm_transferir_mesa.ValidarTransferencia();
var
  AMesaDestino: string;
begin

  try
    AMesaDestino := formatFloat('0000', edMesaDestino.Value);
  except
    raise Exception.Create('Número da mesa de destino é inválido');
  end;

  if edMesaDestino.value > 999 then
    raise Exception.Create('Mesa não pode ser maior que 999');

  if edMesaDestino.value <= 0 then
    raise Exception.Create('Mesa inválida!');

  if (tbTransferencia.IsEmpty = true) then
    raise Exception.Create('Nenhuma mesa foi adicionada na lista de transferência!');

  if tbTransferencia.Locate('mesa', AMesaDestino, []) then
    raise Exception.Create('A mesa não pode ser transferida para ela mesma!');

end;

procedure Tfrm_transferir_mesa.confirmarTransferencia();
var
  AMesaDestino: string;
begin
  AMesaDestino := FormatFloat('0000', edMesaDestino.value);
  RealizarTransferencia;
end;

procedure Tfrm_transferir_mesa.btAdicionarMesaClick(Sender: TObject);
begin
  inherited;
  try
    validarMesaAdicionar;
    AdicionarMesaALista();
    edMesaAdicionar.Value := 0;
    edMesaAdicionar.SelectAll;
  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, true);
    end;

  end;

end;

procedure Tfrm_transferir_mesa.edMesaAdicionarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (edMesaAdicionar.Value <> 0) then
    begin
      btAdicionarmesa.Click;
    end
    else
    begin
      edMesaDestino.SetFocus;
      edMesaDestino.SelectAll;
    end;
  end

end;

procedure Tfrm_transferir_mesa.edMesaDestinoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (edMesaDestino.Value <> 0) then
    begin
      btTransferirMesa.Click;
    end

  end
end;

procedure Tfrm_transferir_mesa.IAeverButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_transferir_mesa.btTransferirMesaClick(Sender: TObject);
begin
  inherited;
  try
    ValidarTransferencia();
    if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Confirma a transferência?') = teSim) then
    begin
      confirmarTransferencia();
      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Tranferência(s) efetuada(s) com sucesso!', 22, true);
      close;
    end;
  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, true);
    end;
  end;

end;

procedure Tfrm_transferir_mesa.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_transferir_mesa.btAdicionarMesaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_escape then
    close;
end;

procedure Tfrm_transferir_mesa.validarMesaAdicionar;
var
  LMesaAdicionar: string;
begin

  try
    LMesaAdicionar := formatFloat('0000', edMesaAdicionar.value);
  except
    raise Exception.Create('Número da mesa/comanda é inválido!');
  end;

  if edMesaAdicionar.value > 999 then
    raise Exception.Create('Mesa/comanda não pode ser maior que 999');

  if edMesaAdicionar.value <= 0 then
    raise Exception.Create('Mesa/comanda inválida!');

  if tbTransferencia.Locate('mesa', LMesaAdicionar, []) then
    raise Exception.Create('A mesa/comanda ' + inttostr(edMesaAdicionar.value) + ' já consta na lista de transferência!');

end;

procedure Tfrm_transferir_mesa.btnIAeverButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

