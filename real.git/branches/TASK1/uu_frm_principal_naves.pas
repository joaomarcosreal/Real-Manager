
unit uu_frm_principal_naves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, RDprint,
  ToolWin, XPMenu, jpeg, DB, IBCustomDataSet, IBTable, Buttons, DBTables,
  WinSkinData, ImgList, IBQuery, ppBands, ppCache, ppClass, ppComm,
  ppRelatv, ppProd, ppReport, ppModule, raCodMod, ppPrnabl, ppCtrls, ppVar,
  RxMemDS, ppDB, ppDBPipe, Grids, DBGrids, OleCtrls, Mask;


  type TAux_item =class
    public
    total_item:  integer;
    total_monetario : real;

  end;

type
  Tfrm_principal_naves = class(TForm)
    MainMenu1: TMainMenu;
    I40000000: TMenuItem;
    I40003000: TMenuItem;
    StatusBar1: TStatusBar;
    Image1: TImage;
    I40003001: TMenuItem;
    I40006000: TMenuItem;
    I40006001: TMenuItem;
    ImageList1: TImageList;
    Button1: TButton;
    Button2: TButton;
    Sair1: TMenuItem;
    SintticoPorgarom1: TMenuItem;
    RelatoriodeproduodeMaitres1: TMenuItem;
    ProduodeGarons1: TMenuItem;
    Memo1: TMemo;
    Function SerialNum(FDrive:String) :String;
    function busca_parametros : boolean;

    procedure menu_sairClick(Sender: TObject);

    function conexao_banco: boolean;
    procedure ssClick(Sender: TObject);

    procedure I40002001Click(Sender: TObject);
    procedure I40005001Click(Sender: TObject);
    procedure encerramento_do_dia;

    procedure I40004001Click(Sender: TObject);
    procedure I50003001Click(Sender: TObject);
    procedure inicia;
    procedure FormActivate(Sender: TObject);
    procedure I40007001Click(Sender: TObject);
    procedure I60001000Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure I40008001Click(Sender: TObject);

    procedure encerraClick(Sender: TObject);
    procedure I50002001Click(Sender: TObject);
    procedure I40010000Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);

  private
    { Private declarations }
  public

   { Public declarations }
     log_erro_sql : TStrings;
     oquefazer_itens : integer;
     oquefazer_fornecedores : integer;
     oquefazer_cotacoes : integer;
     cod_cotacao        :   string;



  end;



var
  frm_principal_naves: Tfrm_principal_naves;
  cor_foco_edit : Tcolor;
  cor_botao : Tcolor;
  cor_foco_botao : Tcolor;

  codigo_usuario : string;
  nome_usuario: string;
  nome_completo_usuario : string;

  codigo_usuario_responsavel : string;
  nome_usuario_responsavel : string;
  nome_comp_usuario_responsavel : string;




  data_do_sistema : Tdate;
  caminho_logomarca : string;
  imagem_c_livre : string;
  imagem_c_aguardando : string;
  imagem_n_disponivel: string;
  string_auxiliar    :   string;
  string_auxiliar2   :   string;
  senha_correta : boolean;
  razao_social,nome_fantasia : string;
  percentual_taxa_servico : double;
  valor_couvert : double;
  tipo_cob_couvert : integer;
  Iretorno           :   integer;
  tipo_impressora : integer;

  tipo_comprovante : integer;

  //Parâmetros da Impressora Fiscal
  impressora_fiscal_instalada : integer;
  marca_impressora_fiscal : integer;
  modelo_impressora_fiscal : integer;
  porta_impressora_fiscal : integer;


  //Parâmetros da Impressora não fiscal 01
  impressora_nao_fiscal_01_instalada : integer;
  marca_impressora_nao_fiscal_01 : integer;
  modelo_impressora_nao_fiscal_01 : integer;
  porta_impressora_nao_fiscal_01 : string;

  //Parâmetros da Impressora não fiscal 02
  impressora_nao_fiscal_02_instalada : integer;
  marca_impressora_nao_fiscal_02 : integer;
  modelo_impressora_nao_fiscal_02 : integer;
  porta_impressora_nao_fiscal_02 : string;
  gravado : boolean;


  numero_caixa : string;
  cod_barras : string;
                                              patch : string;
  patch2: string;
  patch3: string;
  ultima_venda : string;
  cod_operador : string;
  tipo_cupom : integer;
  caixa_fechado : boolean;
  encerrar_dia : boolean;
  coluna : integer;
  linha  : integer;



implementation

uses
 uu_data_module, uu_login, uu_relatorio,
  uu_rel_prod_vendidos, uu_rel_vendas,
  uu_sintegra, uu_rel_tx_servico, uu_rel_produtos, uu_rel_couvert,
  uu_rel_gastos, UU_DM_RELATORIOS;

{$R *.dfm}

function  Tfrm_principal_naves.busca_parametros : boolean;
begin
 { dm.tb_parametros.Active:=true;
  data_do_sistema:=dm.tb_parametros.Fieldbyname('data_sistema').value;
  caminho_logomarca:=dm.tb_parametros.Fieldbyname('caminho_imagem').value;
  razao_social:=dm.tb_parametros.Fieldbyname('razao_social').value;
  nome_fantasia:=dm.tb_parametros.Fieldbyname('nome_fantasia').value;
  percentual_taxa_servico:=StrTofloat(dm.LeIni(2,'TAXA_SERVICO','percentual'));  //dm.tb_parametros.Fieldbyname('taxa_servico').value;
  valor_couvert:=StrTofloat(dm.LeIni(2,'COUVERT','valor'));
  tipo_cob_couvert:=StrToInt(dm.LeIni(2,'COUVERT','tipo_cobranca'));

  cod_operador:=dm.LeIni(2,'CAIXA','COD_OPERADOR');
  StatusBar1.Panels[0].Text:=dm.tb_parametros.Fieldbyname('nome_fantasia').value;
  StatusBar1.Panels[2].Text:='Movimento: '+FormatDateTime('DD/MM/YY',data_do_sistema);
  StatusBar1.Panels[3].Text:='Usuário: '+nome_usuario;
}

end;








procedure Tfrm_principal_naves.menu_sairClick(Sender: TObject);
begin
  Application.Terminate;
end;


function Tfrm_principal_naves.conexao_banco : boolean;
var
 local_banco,usuario,senha : string;
begin



  local_banco:=ExtractFilePath( Application.ExeName )+dm.LeIni(2,'BANCO_DE_DADOS','local_bd');
  usuario:=dm.LeIni(2,'BANCO_DE_DADOS','usuario');
  senha:=dm.LeIni(2,'BANCO_DE_DADOS','senha');
  dm.dbrestaurante.DatabaseName:=local_banco;
  dm.dbrestaurante.Params.Values['user_name']:=usuario;
  dm.dbrestaurante.Params.Values['password']:=senha;
  try
    dm.dbrestaurante.Connected:=true;
  except
    begin
      ShowMessage('Erro ao conectar com o banco de dados!. Verifique o arquivo de parâmetros  ou efetue a reinstalação do SGBD´R.');
      Result:=false;
      exit;
    end;
  end;
  Result:=true;
end;

procedure Tfrm_principal_naves.ssClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rel_prod_vendidos_a,frm_rel_prod_vendidos_a);
  frm_rel_prod_vendidos_a.showmodal;
  frm_rel_prod_vendidos_a.free;

end;


procedure Tfrm_principal_naves.I40002001Click(Sender: TObject);
begin
 Application.CreateForm(Tfrm_rel_vendas,frm_rel_vendas);
 frm_rel_vendas.showmodal;
 frm_rel_vendas.free;
end;

procedure Tfrm_principal_naves.I40005001Click(Sender: TObject);
begin
   Application.CreateForm(Tfrm_sintegra, frm_sintegra);
  frm_sintegra.ShowModal;
  frm_sintegra.free;

end;                                                                      


procedure Tfrm_principal_naves.encerramento_do_dia;
begin
  dm.tb_parametros.Active:=true;
  dm.tb_parametros.Edit;
  data_do_sistema:=data_do_sistema+1;
  dm.tb_parametros.FieldByName('data_sistema').value:=data_do_sistema;
  dm.tb_parametros.Post;

  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm.tb_parametros.Active:=true;
  busca_parametros;

end;



procedure Tfrm_principal_naves.I40004001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rel_tx_serv,frm_rel_tx_serv);
  frm_rel_tx_serv.ShowModal;
  frm_rel_tx_serv.free;
end;


procedure Tfrm_principal_naves.I50003001Click(Sender: TObject);
begin
  IF (StrToInt(dm.LeIni(2,'LISTAGENS','PRODUTOS')) = 1) THEN
     BEGIN
       Application.CreateForm(Tfrm_rel_produtos, frm_rel_produtos);
       frm_rel_produtos.ShowModal;
       frm_rel_produtos.free;
     end
  else
    begin
      dm.imprimeProdutosMiniPrinter(marca_impressora_nao_fiscal_01,modelo_impressora_nao_fiscal_01);
    end;

end;



procedure Tfrm_principal_naves.inicia;
begin
  Application.HintColor:=clYellow;
//  Application.HintPause:=10000;
//'  Application.HintShortPause:=10000;
  Application.HintHidePause:=500000;

  Image1.Picture.LoadFromFile(dm.leini(2,'parametros','logo_principal'));
  dm.dbrestaurante.Connected:=false;
  If conexao_banco = false then
  begin
    Application.Terminate;
  end;

  senha_correta:=false;
  cor_foco_edit:=clMoneyGreen;
  Application.CreateForm(Tfrm_login,frm_login);
  frm_login.tipo_teste:=0;
  frm_login.ShowModal;
  frm_login.Free;

  if senha_correta = false then
   begin
    Application.Terminate;
   end;
   busca_parametros;

end;

procedure Tfrm_principal_naves.FormActivate(Sender: TObject);
begin
// inicia;
end;

Function GetStateK (Key: integer): boolean;
begin
Result := Odd (GetKeyState (Key));
end;


procedure Tfrm_principal_naves.I40007001Click(Sender: TObject);
begin
 Application.CreateForm(Tfrm_rel_couvert,frm_rel_couvert);
 frm_rel_couvert.ShowModal;
 frm_rel_couvert.free;
end;

procedure Tfrm_principal_naves.I60001000Click(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_manutencao,frm_manutencao);
  frm_manutencao.showmodal;
  frm_manutencao.free; }
end;

procedure Tfrm_principal_naves.BitBtn6Click(Sender: TObject);
begin
 if MessageDlg('Confirma saída do sistema ?',mtConfirmation,[MbYes,mbNo],0) = Mryes then
 Application.Terminate;
end;




procedure Tfrm_principal_naves.I40008001Click(Sender: TObject);
begin
 Application.CreateForm(Tfrm_rel_gasto_diario,frm_rel_gasto_diario);
 frm_rel_gasto_diario.showmodal;
 frm_rel_gasto_diario.free;
end;





Function Tfrm_principal_naves.SerialNum(FDrive:String) :String;
Var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  Try
   GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
  Except Result :='';
end;
end;




procedure Tfrm_principal_naves.encerraClick(Sender: TObject);
begin
  inicia;
end;




procedure Tfrm_principal_naves.I50002001Click(Sender: TObject);
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from listagem_grupos('+Quotedstr('000')+',1,0)');
  dm.qryauxiliar.active:=true;
end;





procedure Tfrm_principal_naves.I40010000Click(Sender: TObject);
begin

end;



{

procedure Tfrm_principal.Button2Click(Sender: TObject);
var
 str : string;
 ret : integer;
 TipoRegistro,Arquivo,Ano,RazaoSocial,Endereco,Numero,Complemento,Bairro,Cidade,CEP,Telefone,Fax,contato,mes : string;
 vlr_unit : double;
begin
  adoq.Active:=false;
  adoq.SQL.clear;
  adoq.SQL.add('select * from REGISTRO_60R');
  adoq.Active:=true;
  adoq.First;

  while not adoq.Eof do
  begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.add(' insert into registro_60r (cod_produto,descricao,qtde,acumulado,aliquota,valor_unitario,valor_custo,estoque_liquido) values( ');
    dm.qryauxiliar.SQL.add(''+Quotedstr(FormatFloat('00000',adoq.fieldbyname('cod_produto').AsFloat)));
    dm.qryauxiliar.sql.add(','+quotedstr(adoq.fieldbyname('descricao').value));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('qtde').value)));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('acumulado').value)));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('aliquota').Value));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('acumulado').value / adoq.fieldbyname('qtde').value)));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr( (adoq.fieldbyname('acumulado').value / adoq.fieldbyname('qtde').value) * 0.2 )));
    Randomize;
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(randomRange(23,328)))+')');

    dm.qryauxiliar.ExecSQL;
    adoq.Next;
  end;

  adoq.Active:=false;
  adoq.SQL.Clear;
  adoq.SQL.add('select * from REGISTRO_60A');
  adoq.active:=true;
  adoq.First;

  while not adoq.Eof do
  begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('insert into REG60A (data,num_serie,aliquota,valor_acumulado) values (');
   dm.qryauxiliar.SQL.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',adoq.fieldbyname('data').Value)));
   dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('num_serie').Value));
   dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('aliquota').Value));
   dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('valor_acumulado').AsFloat))+')');
   dm.qryauxiliar.ExecSQL;
   adoq.Next;
  end;

  adoq.Active:=false;
  adoq.SQL.Clear;
  adoq.SQL.add('select * from registro_60M');
  adoq.Active:=true;
  adoq.First;

  while not adoq.Eof do
  begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.Add('insert into REG60M(data,num_serie,coo_ini,coo_fim,cont_z,co_rein_op,venda_bruta,tot_geral) values (');
    dm.qryauxiliar.SQL.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',adoq.fieldbyname('data').Value)));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('NUM_SERIE').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('COO_INI').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('COO_FIM').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('CONT_Z').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('CO_REIN_OP').Value));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('venda_bruta').AsFloat)));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('tot_geral').AsFloat))+')');
    dm.qryauxiliar.ExecSQL;
    adoq.next;
  end;

  showmessage(dm.dbrestaurante.DatabaseName);
  showmessage('completo');

  dm.transacao.Commit;


end;
 }





procedure Tfrm_principal_naves.Sair1Click(Sender: TObject);
begin
 close;
end;








end.



