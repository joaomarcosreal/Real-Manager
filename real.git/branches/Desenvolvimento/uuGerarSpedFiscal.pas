  unit uuGerarSpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask,  ExtCtrls, Buttons,
  ACBrSpedFiscal,ibquery,ACBrEFDBlocos,ACBrUtil, jpeg, ComCtrls,
  AdvCircularProgress, IdBaseComponent,pcnConversaoNFe, IdThreadComponent, ACBrSintegra,
  RxToolEdit, ACBrBase, JvExMask, JvToolEdit, IBX.IBScript, Vcl.ActnList,
  System.Actions;


type
  TFrmGerarSpedFiscal = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    sped: TACBrSPEDFiscal;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    memoTXT: TMemo;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    memoError: TMemo;
    Panel1: TPanel;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    sv: TSaveDialog;
    Panel3: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Label8: TLabel;
    Timer3: TTimer;
    ckbGerarInventario: TCheckBox;
    rdTipoGeracao: TRadioGroup;
    edDataVencimento: TDateEdit;
    lbl1: TLabel;
    pnAguarde: TPanel;
    lbAguarde: TPanel;
    AdvCircularProgress1: TAdvCircularProgress;
    tmAguarde: TTimer;
    sintegra: TACBrSintegra;
    ckbSintegra: TCheckBox;
    cbMes: TComboBox;
    cbAno: TComboBox;
    edDataInicial: TJvDateEdit;
    edDataFinal: TJvDateEdit;
    procedure  LoadToMemo;
    procedure  GerarBloco0;
    procedure  GerarBloco1();
    procedure  GerarBlocoC;


    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cal1Click(Sender: TObject);
    procedure tmAguardeTimer(Sender: TObject);
    procedure gerarSintegra();
    procedure gerarSpedFiscal();
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerarSpedFiscal: TFrmGerarSpedFiscal;

implementation

uses uu_data_module, ACBrEFDBloco_0, ACBrEFDBloco_0_Class,
  ACBrEFDBloco_C_Class, ACBrEFDBloco_C, DB, ACBrEFDBloco_H_Class,
  ACBrEFDBloco_E_Class, ACBrEFDBloco_1_Class, ACBrEFDBloco_9_Class,
  ACBrEFDBloco_E, ACBrEFDBloco_H, ACBrEFDBloco_D_Class,
  ACBrEFDBloco_D, ACBrEFDBloco_1, uu_frm_principal, DateUtils;

{$R *.dfm}

procedure TFrmGerarSpedFiscal.GerarBloco0;
var
 qryParametros : Tibquery;
 qryParticipantes : Tibquery;



begin
  inherited;

  qryParametros := TIBQuery.Create(self);
  qryParametros.Database := dm.dbrestaurante;
  qryParametros.Transaction := dm.transacao;
  qryParametros.Active:=false;
  qryParametros.SQL.clear;
  qryParametros.SQL.Add('select * from parametros');
  qryParametros.Active:=true;


  qryParticipantes := TIBQuery.Create(self);
  qryParticipantes.Database := dm.dbrestaurante;
  qryParticipantes.Transaction := dm.transacao;
  qryParticipantes.Active:=false;

 


  with sped do
   begin
    DT_INI := edDataInicial.Date;
    DT_FIN := edDataFinal.Date;
    LinhasBuffer:= StrToIntDef('10000',0);
    IniciaGeracao;
   end;

  //Registro 10 SINTEGRA

  if ckbSintegra.Checked  then
   begin
     With sintegra do
      begin
        Registro10.CNPJ :=qryParametros.fieldbyname('CNPJ').value;
        Registro10.Inscricao := qryParametros.fieldbyname('IE').value;
        Registro10.RazaoSocial := qryParametros.fieldbyname('razao_social').value;
        Registro10.Cidade := 'SALVADOR';
        Registro10.Estado := 'BA';
        Registro10.Telefone :=  qryParametros.fieldbyname('TELEFONE_EMPRESA').value;
        Registro10.DataInicial := edDataInicial.Date;
        Registro10.DataFinal :=   edDataFinal.Date;
        Registro10.CodigoConvenio := '1';
        Registro10.NaturezaInformacoes := '3';
        Registro10.FinalidadeArquivo := '1';

        Registro11.Endereco:= qryParametros.fieldbyname('logradouro').value;
        Registro11.Numero:=   qryParametros.fieldbyname('numero').value;
        Registro11.Bairro:=   qryParametros.fieldbyname('bairro').value;
        Registro11.Cep:=      qryParametros.fieldbyname('cep').value;
        Registro11.Responsavel:= qryParametros.fieldbyname('contato').value;
        Registro11.Telefone:= qryParametros.fieldbyname('TELEFONE_EMPRESA').value;
      end
   end;





   // Início da geração do bloco 0
   with sped.Bloco_0 do
    begin
      // Dados da Empresa
      with Registro0000New do
       begin
         COD_VER    := vlVersao112;

         COD_FIN    := raSubstituto;
         NOME       := qryParametros.fieldbyname('razao_social').value;
         CNPJ       := qryParametros.fieldbyname('CNPJ').value;
         UF         := qryParametros.fieldbyname('UF').value;
         IE         := qryParametros.fieldbyname('IE').value;
         COD_MUN    := qryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
         IM         := '';
         SUFRAMA    := '';
         IND_PERFIL := pfPerfilB;
         IND_ATIV   := atOutros;
       end;



      with Registro0001New do
       begin
        IND_MOV := imComDados;

          // Registro complementar de identificação da empresa

         with Registro0005New do
          begin
            FANTASIA   := qryParametros.fieldbyname('nome_fantasia').value;
            CEP        := qryParametros.fieldbyname('CEP').value;
            ENDERECO   := qryParametros.fieldbyname('LOGRADOURO').value;
            NUM        := qryParametros.fieldbyname('NUMERO').value;
            COMPL      := qryParametros.fieldbyname('COMPLEMENTO').value;
            BAIRRO     := qryParametros.fieldbyname('BAIRRO').value;
            FONE       := qryParametros.fieldbyname('TELEFONE_EMPRESA').value;
            FAX        := qryParametros.fieldbyname('FAX_EMPRESA').value;
            EMAIL      := 'xx@xx.com';
          end;

           // Dados da contabilidade

         with Registro0100New do
         begin
            NOME       := qryParametros.fieldbyname('nome_contabilista').value;
            CPF        := qryParametros.fieldbyname('cpf_contabilista').value;
            CRC        := qryParametros.fieldbyname('crc_contabilista').value;
            CNPJ       := qryParametros.fieldbyname('cnpj_contabilista').value;
            CEP        := qryParametros.fieldbyname('cep_contabilista').value;
            ENDERECO   := qryParametros.fieldbyname('endereco_contabilista').value;
            NUM        := qryParametros.fieldbyname('numero_end_contabilista').value;
            COMPL      := '';
            BAIRRO     := qryParametros.fieldbyname('bairro_contabilista').value;
            FONE       := qryParametros.fieldbyname('telefone_contabilista').value;
            FAX        := qryParametros.fieldbyname('fax_contabilista').value;
            EMAIL      := qryParametros.fieldbyname('email_contabilista').value;
            COD_MUN    := qryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
         end;



         qryParticipantes.Active:=false;
         qryParticipantes.SQL.Clear;


         qryParticipantes.sql.add('        select cod_participante,f.* from ( ');
         qryParticipantes.sql.add('             select distinct cod_fornecedor as cod_participante  from');
         qryParticipantes.sql.add('             (');
         qryParticipantes.sql.add('               select distinct nt.cod_fornecedor  from notas_transporte nt where nt.data_servico between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+'');
         qryParticipantes.sql.add('                union all ');
         qryParticipantes.sql.add('               select distinct s.cod_fornecedor  from saidas s  where s.data_saida between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+'');
         qryParticipantes.sql.add('                union all ');
         qryParticipantes.sql.add('               select distinct e.cod_fornecedor  from entradas e where e.data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+'');
         qryParticipantes.sql.add('                 union all ');
         qryParticipantes.sql.add('                select distinct v.cod_fornecedor  from ');
         qryParticipantes.sql.add('                  vendas v where v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+'');
         qryParticipantes.sql.add('                      and v.cod_fornecedor <> '+Quotedstr('')+' and v.cod_fornecedor is not null ');
         qryParticipantes.sql.add('');
         qryParticipantes.sql.add('             ) p ');
         qryParticipantes.sql.add('             ) ');
         qryParticipantes.sql.add('             inner join fornecedor f on (f.cod_fornecedor = cod_participante) ');

     

         qryParticipantes.Active:=true;
         qryParticipantes.first;

         lbAguarde.Repaint;
         while not qryParticipantes.eof do
          begin
            with Registro0150New do
             begin
               COD_PART := qryParticipantes.fieldbyname('cod_fornecedor').value;
               NOME     := qryParticipantes.fieldbyname('razao_social').value;
               COD_PAIS := qryParticipantes.fieldbyname('cod_pais').value;

               if ( qryParticipantes.fieldbyname('cod_pais').value <> '1058' )  then
                begin
                  CNPJ :='';
                  CPF := '';
                end
               else
                begin

                 if Length(trim(qryParticipantes.fieldbyname('cgc_cpf').value) ) = 14 then
                    CNPJ     := qryParticipantes.fieldbyname('cgc_cpf').value
                 else
                    CPF      := qryParticipantes.fieldbyname('cgc_cpf').value;

                end;




               IF ((qryParticipantes.fieldbyname('inscricao_estadual').value = Null) or (qryParticipantes.fieldbyname('inscricao_estadual').value = '') ) then
                 IE:=''
               ELSE
                 begin
                     IE:=  qryParticipantes.fieldbyname('inscricao_estadual').value;
                 end;

                 



               try
                COD_MUN  := qryParticipantes.fieldbyname('cod_cidade').value;
               except
                begin
                  showmessage('Preencher IBGE do municipio '+qryParticipantes.fieldbyname('cod_cidade').value);
                  exit;
                end;
               end;

               SUFRAMA  := '';
               IF qryParticipantes.fieldbyname('endereco').value <> null then
                 ENDERECO := trim(qryParticipantes.fieldbyname('endereco').value)
               ELSE
                 ENDERECO := 'NAO INFORMADO';

               NUM      := '';
               COMPL    := '';
               IF qryParticipantes.fieldbyname('BAIRRO').value <> null then
                 BAIRRO   := qryParticipantes.fieldbyname('BAIRRO').value
               else
                bairro := 'NAO INFORMADO';


               {  Só alterarei isso depois

               // Alterações para cada cliente
               for int0175 := 1 to 5 do
               begin
                  with Registro0175New do
                  begin
                     DT_ALT   := Date + int0175;
                     NR_CAMPO := IntToStr(int0175);
                     CONT_ANT := 'CAMPO ANTERIOR ' + IntToStr(int0175);
                  end;
               end;
                }


             end;
            Application.ProcessMessages;
            qryParticipantes.Next;
          end;

          // Pega as unidades envolvidas nas compras

          qryParticipantes.SQL.Clear;

          if ckbGerarInventario.Checked  then
            qryParticipantes.sql.add('select distinct cod_unidade,sigla from r_unidades_sped('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',1)')
          else
            qryParticipantes.sql.add('select distinct cod_unidade,sigla from r_unidades_sped('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',0)');
          memoError.Lines := qryParticipantes.sql;
          qryParticipantes.Active:=true;
          qryParticipantes.First;
          lbAguarde.Repaint;

          while not qryParticipantes.eof do
           begin

             with Registro0190New do
               begin
                 UNID  := qryParticipantes.fieldbyname('cod_unidade').value;
                 DESCR := qryParticipantes.fieldbyname('sigla').value;
               end;
             Application.ProcessMessages;
             qryParticipantes.Next;
           end;

           // Cadastro de ítens - Matérias-primas

          qryParticipantes.active:=false;
          qryParticipantes.sql.clear;

          if ckbGerarInventario.Checked  then
            qryParticipantes .SQL.Add('select  distinct codigo,descricao,cod_unidade,tipo,genero,ncm from r_sped_reg0200('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',1)')
          else
            qryParticipantes .SQL.Add('select distinct codigo,descricao,cod_unidade,tipo, genero,ncm   from r_sped_reg0200('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',0)');

          qryParticipantes.active:=true;

          while not qryParticipantes.eof do
           begin
             With Registro0200New  do
              begin

                 COD_ITEM :=    qryParticipantes.fieldbyname('codigo').value;
                 DESCR_ITEM :=  trim(qryParticipantes.fieldbyname('descricao').value);
                 COD_BARRA :='';
                 COD_ANT_ITEM :='';
                 UNID_INV := qryParticipantes.fieldbyname('cod_unidade').value;
                 TIPO_ITEM := qryParticipantes.fieldbyname('tipo').value;
                 COD_NCM :=  qryParticipantes.fieldbyname('ncm').value;
                 EX_IPI := '';
                 COD_GEN := qryParticipantes.fieldbyname('genero').value;
                 COD_LST := '';
                 ALIQ_ICMS:= 0;
              end;

            Application.ProcessMessages;
             qryParticipantes.Next;
           end;
       end;
    end;

   lbAguarde.Repaint;
   sped.WriteBloco_0;
   LoadToMemo;
end;




procedure TFrmGerarSpedFiscal.LoadToMemo;
begin
   memoTXT .Lines.Clear;
   if FileExists( sped.Path + sped.Arquivo ) then
      memoTXT  .Lines.LoadFromFile(sped.Path + sped.Arquivo);
end;


procedure TFrmGerarSpedFiscal.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfAMonth(StrToInt(cbAno.text),cbMes.ItemIndex +1);
  edDataFinal.Date :=  EndOfTheMonth(edDataInicial.date);


  if (edDataInicial.Date > edDataFinal.Date) then
   begin
     ShowMessage('Data final não pode ser menor que a data inicial !');
     exit;
   end;


  if ( FormatDateTime('MM',edDataInicial.Date) <> FormatDateTime('MM',edDataFinal.Date) ) then
   begin
     ShowMessage('Datas não podem estar em meses diferentes!');
     exit;
   end;

  edDataVencimento.Date := StrToDate('09/'+FormatDateTime('MM/YYY',edDataInicial.Date));


  memoTXT.Clear;
  pnAguarde.Visible := True;
  tmAguarde.Enabled := true;
  lbAguarde.Repaint;

  gerarSpedFiscal();


end;


procedure TFrmGerarSpedFiscal.GerarBloco1();
begin
   with sped.Bloco_1  do
    begin
       with Registro1001New  do
        begin
          IND_MOV := imComDados;

          with Registro1010New   do
          begin
            IND_EXP    := 'N';
            IND_CCRF   := 'N';
            IND_COMB   := 'N';
            IND_USINA  := 'N';
            IND_VA     := 'N';
            IND_EE     := 'N';
            IND_CART   := 'N';
            IND_FORM   := 'N';
            IND_AER    := 'N';
            IND_GIAF1  := 'N';
            IND_GIAF3  := 'N';
            IND_GIAF4  := 'N';
          end;
        end;
    end;

//    sped.WriteBloco_1;
//    LoadToMemo();
end;


procedure TFrmGerarSpedFiscal.GerarBlocoC;
var
 reducaoInicial, reducaoFinal : integer;

 baseIcmsVenda, valorIcmsVenda : double;

 qryEntradas : Tibquery;
 qryImpressorasFiscais : Tibquery;
 qrySaidas : Tibquery;
 qryItensEntradas : Tibquery;
 qryItensSaidas : Tibquery;
 bufferNotas : integer;
 contador : integer;
 qryRegistros60M : TIBQuery;
 qryRegistros60A : TIBQuery;

 cod_totalizador : string;
 qryProdutosVendidosDia :TIBQuery;
 qryResumoNotasConsumidor :TIBQuery;
 qryNotasConsumidor :TIBQuery;
 qryProdutosNotasConsumidor :TIBQuery;
 valorTotalBaseICMS : double;
 valorTotalICMS : double;

 valorTotalBaseICMSOutrosEstados : double;
 valorTotalICMSOutrosEstados : double;

 valorBaseICMSReduzida : double;
 valorICMSReduzido: double;

  valorBaseICMSReduzidaOutrosEstados : double;
  valorICMSReduzidoOutrosEstados: double;


 qryNotasTransporte : TIBQuery;

 qryInventario : TIBQuery;
 qryRegistros425 :        TIBQuery;
 valorICMSXML : currency;

 vlItem425 : currency;


begin
  inherited;

   valorTotalBaseICMSOutrosEstados :=0;
   valorTotalICMSOutrosEstados :=0;
   valorBaseICMSReduzidaOutrosEstados :=0;
   valorICMSReduzidoOutrosEstados:=0;



    valorBaseICMSReduzida :=0;
    valorICMSReduzido:=0;
    valorTotalBaseICMS:=0;
    valorTotalICMS :=0;

    bufferNotas := 10;
    contador:=0;

    qryEntradas := TIBQuery.Create(self);
    qryEntradas.Database := dm.dbrestaurante;
    qryEntradas.Transaction := dm.transacao;
    qryEntradas.Active:=false;
    qryEntradas.SQL.clear;

    qryImpressorasFiscais  := TIBQuery.Create(self);
    qryImpressorasFiscais.Database := dm.dbrestaurante;
    qryImpressorasFiscais.Transaction := dm.transacao;
    qryImpressorasFiscais.Active:=false;
    qryImpressorasFiscais.SQL.clear;


    qryRegistros60A   := TIBQuery.Create(self);
    qryRegistros60A.Database := dm.dbrestaurante;
    qryRegistros60A.Transaction := dm.transacao;
    qryRegistros60A.Active:=false;

    qryRegistros60M   := TIBQuery.Create(self);
    qryRegistros60M.Database := dm.dbrestaurante;
    qryRegistros60M.Transaction := dm.transacao;
    qryRegistros60M.Active:=false;


    qryNotasTransporte := TIBQuery.Create(self);
    qryNotasTransporte.Database := dm.dbrestaurante;
    qryNotasTransporte.Transaction := dm.transacao;
    qryNotasTransporte.Active:=false;
    qryNotasTransporte.SQL.clear;



    qrySaidas := TIBQuery.Create(self);
    qrySaidas.Database := dm.dbrestaurante;
    qrySaidas.Transaction := dm.transacao;
    qrySaidas.Active:=false;
    qrySaidas.SQL.clear;


    qryItensEntradas  := TIBQuery.Create(self);
    qryItensEntradas.Database := dm.dbrestaurante;
    qryItensEntradas.Transaction := dm.transacao;
    qryItensEntradas.Active:=false;

    qryItensSaidas  := TIBQuery.Create(self);
    qryItensSaidas.Database := dm.dbrestaurante;
    qryItensSaidas.Transaction := dm.transacao;
    qryItensSaidas.Active:=false;



    qryProdutosVendidosDia   := TIBQuery.Create(self);
    qryProdutosVendidosDia.Database := dm.dbrestaurante;
    qryProdutosVendidosDia.Transaction := dm.transacao;
    qryProdutosVendidosDia.Active:=false;

    qryResumoNotasConsumidor   := TIBQuery.Create(self);
    qryResumoNotasConsumidor.Database := dm.dbrestaurante;
    qryResumoNotasConsumidor.Transaction := dm.transacao;
    qryResumoNotasConsumidor.Active:=false;


    qryNotasConsumidor   := TIBQuery.Create(self);
    qryNotasConsumidor.Database := dm.dbrestaurante;
    qryNotasConsumidor.Transaction := dm.transacao;
    qryNotasConsumidor.Active:=false;

    qryProdutosNotasConsumidor   := TIBQuery.Create(self);
    qryProdutosNotasConsumidor.Database := dm.dbrestaurante;
    qryProdutosNotasConsumidor.Transaction := dm.transacao;
    qryProdutosNotasConsumidor.Active:=false;


    qryInventario    := TIBQuery.Create(self);
    qryInventario.Database := dm.dbrestaurante;
    qryInventario.Transaction := dm.transacao;
    qryInventario.Active:=false;


    qryRegistros425     := TIBQuery.Create(self);
    qryRegistros425.Database := dm.dbrestaurante;
    qryRegistros425.Transaction := dm.transacao;
    qryRegistros425.Active:=false;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.add('select * from impressoras_fiscais order by numordem');
    dm.qryauxiliar.Active := true;


    while not dm.qryauxiliar.Eof do
     begin
      dm.qryauxiliar2.Active := false;
      dm.qryauxiliar2.SQL.Clear;
      dm.qryauxiliar2.SQL.Add('        select first 1 cast(rm.cont_z as integer) + 1 as  reducao_inicial   from reg60m rm ');
      dm.qryauxiliar2.SQL.Add('       where rm.data >='+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date)));
      dm.qryauxiliar2.SQL.Add('       and rm.num_serie='+QuotedStr(dm.qryauxiliar.fieldbyname('num_serie').Value));
      dm.qryauxiliar2.SQL.Add('   order by rm.cod_reg asc ');
      dm.qryauxiliar2.Active := true;
      if not  dm.qryauxiliar2.IsEmpty then
       begin
        reducaoInicial := dm.qryauxiliar2.fieldbyname('reducao_inicial').Value;

        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;
        dm.qryauxiliar2.SQL.Add('        select first 1 cast(rm.cont_z as integer) + 1 as  reducao_final   from reg60m rm ');
        dm.qryauxiliar2.SQL.Add('       where rm.data <='+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal .Date)));
        dm.qryauxiliar2.SQL.Add('       and rm.num_serie='+QuotedStr(dm.qryauxiliar.fieldbyname('num_serie').Value));
        dm.qryauxiliar2.SQL.Add('    order by rm.cod_reg desc');
        dm.adicionaLog(dm.qryauxiliar2.SQL.Text);
        dm.qryauxiliar2.Active := true;
        reducaoFinal := dm.qryauxiliar2.fieldbyname('reducao_final').Value;

        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;

        dm.qryauxiliar2.sql.Add('          update vendas v set v.percentual_desconto=    ');
        dm.qryauxiliar2.sql.Add('                        ( ');
        dm.qryauxiliar2.sql.Add('                            cast(v.valor_desconto as numeric(10,8)) /');
        dm.qryauxiliar2.sql.Add('                             (');
        dm.qryauxiliar2.sql.Add('                               cast(v.valor_bruto      as numeric(10,8)) +');
        dm.qryauxiliar2.sql.Add('                               cast(v.valor_txserv     as numeric(10,8)) +');
        dm.qryauxiliar2.sql.Add('                               cast(v.valor_tx_entrega as numeric(10,8))');
        dm.qryauxiliar2.sql.Add('                              )');
        dm.qryauxiliar2.sql.Add('                        )');
        dm.qryauxiliar2.sql.Add('             where  v.valor_desconto > 0 and v.num_serie_ecf='+QuotedStr(dm.qryauxiliar.fieldbyname('num_serie').Value));
        dm.qryauxiliar2.SQL.Add('             and v.reducao_z between '+IntToStr(reducaoInicial)+' and '+IntToStr(reducaoFinal));
        try
         dm.qryauxiliar2.ExecSQL;
        except
          begin
              frm_principal.memo_avisos.Visible := true;
              frm_principal.memo_avisos.Lines := dm.qryauxiliar2.SQL;
              exibe_painel_erro('Erro ao calcular percentual de desconto das vendas!','Ok');
              exit;
          end;
        end;

        
        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;
        dm.qryauxiliar2.SQL.Add('            update vendas v set v.desconto_taxas =  (udf_roundabnt(v.percentual_desconto,8) * (v.valor_txserv + v.valor_tx_entrega ) ) ');
        dm.qryauxiliar2.sql.Add('             where  v.valor_desconto > 0 and v.num_serie_ecf='+QuotedStr(dm.qryauxiliar.fieldbyname('num_serie').Value));
        dm.qryauxiliar2.SQL.Add('             and v.reducao_z between '+IntToStr(reducaoInicial)+' and '+IntToStr(reducaoFinal));


        try
           dm.qryauxiliar2.ExecSQL;
          except
            begin
                frm_principal.memo_avisos.Visible := true;
                frm_principal.memo_avisos.Lines := dm.qryauxiliar2.SQL;
                exibe_painel_erro('Erro ao calcular desconto das taxas na tabela de vendas!','Ok');
                exit;
            end;
          end;




        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;
        dm.qryauxiliar2.sql.Add('update movimento_venda mv set mv.desconto =  ');
        dm.qryauxiliar2.sql.Add('         (');
        dm.qryauxiliar2.sql.Add('         (select v.percentual_desconto   from vendas v where v.cod_venda = mv.cod_venda)');
        dm.qryauxiliar2.sql.Add('          * (mv.valor_unitario * mv.quantidade)) ');
        dm.qryauxiliar2.sql.Add('             where mv.num_serie_ecf='+QuotedStr(dm.qryauxiliar.fieldbyname('num_serie').Value));
        dm.qryauxiliar2.SQL.Add('             and mv.reducao_z between '+IntToStr(reducaoInicial)+' and '+IntToStr(reducaoFinal));
        dm.adicionaLog(dm.qryauxiliar2.SQL.Text);
         try
          dm.qryauxiliar2.ExecSQL;
         except
           begin
              frm_principal.memo_avisos.Visible := true;
              frm_principal.memo_avisos.Lines := dm.qryauxiliar2.SQL;
              exibe_painel_erro('Erro ao aplicar desconto taxas na tabela movimento_venda','Ok');
              exit;
           end;
          end;




       end;
       Application.ProcessMessages;
       dm.qryauxiliar.Next;
     end;

     // aplica desconto em todas as notas

        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;

        dm.qryauxiliar2.sql.Add('          update vendas v set v.percentual_desconto=    ');
        dm.qryauxiliar2.sql.Add('                        ( ');
        dm.qryauxiliar2.sql.Add('                            cast(v.valor_desconto as numeric(10,8)) /');
        dm.qryauxiliar2.sql.Add('                             (');
        dm.qryauxiliar2.sql.Add('                               cast(v.valor_bruto      as numeric(10,8)) +');
        dm.qryauxiliar2.sql.Add('                               cast(v.valor_txserv     as numeric(10,8)) +');
        dm.qryauxiliar2.sql.Add('                               cast(v.valor_tx_entrega as numeric(10,8))');
        dm.qryauxiliar2.sql.Add('                              )');
        dm.qryauxiliar2.sql.Add('                        )');
        dm.qryauxiliar2.sql.Add('             where  v.valor_desconto > 0 ');
        dm.qryauxiliar2.SQL.Add('             and v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
        try
         dm.qryauxiliar2.ExecSQL;
        except
          begin
              frm_principal.memo_avisos.Visible := true;
              frm_principal.memo_avisos.Lines := dm.qryauxiliar2.SQL;
              exibe_painel_erro('Erro ao calcular percentual de desconto das vendas!','Ok');
              exit;
          end;
        end;


        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;
        dm.qryauxiliar2.SQL.Add('            update vendas v set v.desconto_taxas =  (udf_roundabnt(v.percentual_desconto,8) * (v.valor_txserv + v.valor_tx_entrega ) ) ');
        dm.qryauxiliar2.sql.Add('             where  v.valor_desconto > 0 and ');
        dm.qryauxiliar2.SQL.Add('              v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));



        try
           dm.qryauxiliar2.ExecSQL;
          except
            begin
                frm_principal.memo_avisos.Visible := true;
                frm_principal.memo_avisos.Lines := dm.qryauxiliar2.SQL;
                exibe_painel_erro('Erro ao calcular desconto das taxas na tabela de vendas!','Ok');
                exit;
            end;
          end;




        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.Clear;
        dm.qryauxiliar2.sql.Add('update movimento_venda mv set mv.desconto =  ');
        dm.qryauxiliar2.sql.Add('         (');
        dm.qryauxiliar2.sql.Add('         (select v.percentual_desconto   from vendas v where v.cod_venda = mv.cod_venda)');
        dm.qryauxiliar2.sql.Add('          * (mv.valor_unitario * mv.quantidade)) ');
        dm.qryauxiliar2.SQL.Add('            where  mv.data_ecf between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));

        dm.adicionaLog(dm.qryauxiliar2.SQL.Text);
         try
          dm.qryauxiliar2.ExecSQL;
         except
           begin
              frm_principal.memo_avisos.Visible := true;
              frm_principal.memo_avisos.Lines := dm.qryauxiliar2.SQL;
              exibe_painel_erro('Erro ao aplicar desconto taxas na tabela movimento_venda','Ok');
              exit;
           end;
          end;


      // fim da aplicação de desconto em todas as notas



    dm.transacao.Commit;
    dm.transacao.Active := false;
    dm.transacao.Active := true;
     lbAguarde.Repaint;







    with sped.Bloco_C do
     begin
       with RegistroC001New do
        begin
          IND_MOV := imComDados;

          /// Notas fiscais de entrada - Gerais

          qryEntradas.Active:=false;
          qryEntradas.sql.clear;
          qryEntradas.sql.add('      select udf_strzero(e.cod_fornecedor,4) as CodFornecedor, e.* from entradas e where data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
          qryEntradas.sql.add('  and tipo_entrada=0  order by cod_entrada ');
          qryEntradas.active:=true;
          qryEntradas.first;
          contador:=0;


          while not qryEntradas.eof do
           begin
           try
            begin
              if StrToInt(qryEntradas.fieldbyname('cod_entrada').value)  = 14950 then
                showmessage('É AGORA SALVADOR!');

               With RegistroC100New do
               begin
                 COD_PART      := qryEntradas.fieldbyname('codFornecedor').Value;
                 IND_EMIT      := edTerceiros;
                 IND_OPER      := tpEntradaAquisicao;
                 COD_MOD       := qryEntradas.fieldbyname('modelo_nota').Value;
                 COD_SIT       := sdRegular;
                 SER           := qryEntradas.fieldbyname('serie_nota').Value;
                 NUM_DOC       := formatFloat('000000000',StrToFloat(qryEntradas.fieldbyname('numero_nota').Value));



                 if ( (qryEntradas.fieldbyname('modelo_nota').Value = '55') and (qryEntradas.fieldbyname('chave_nfe').Value <> null) and (qryEntradas.fieldbyname('chave_nfe').Value <> '') ) then
                   CHV_NFE       := qryEntradas.fieldbyname('chave_nfe').Value
                 else
                   CHV_NFE := '';
                 DT_DOC        := qryEntradas.fieldbyname('data_emissao').Value;
                 DT_E_S        := qryEntradas.fieldbyname('data_entrada').Value;
                 VL_DOC        := qryEntradas.fieldbyname('total_nota').Value;
                 IND_PGTO      := tpPrazo;
                 VL_DESC       := qryEntradas.fieldbyname('desconto').Value;
                 VL_ABAT_NT    := 0;  // Não tenho esse campo nas NFS
                 VL_MERC       := qryEntradas.fieldbyname('valor_produtos').Value;
                 IND_FRT       :=  tfSemCobrancaFrete;
{                 case qryEntradas.fieldbyname('pagto_frete').Value of
                  0: IND_FRT       := tfSemCobrancaFrete;
                  1: IND_FRT       := tfPorContaEmitente;
                  2: IND_FRT       := tfPorContaDestinatario;
                 end;
 }
                 VL_FRT        := qryEntradas.fieldbyname('frete').Value;
                 VL_SEG        := qryEntradas.fieldbyname('seguro').Value;
                 VL_OUT_DA     := qryEntradas.fieldbyname('outras_despesas').Value;
                 VL_BC_ICMS    := 0;
                 VL_ICMS       := 0;
                 VL_BC_ICMS_ST := 0;
                 VL_ICMS_ST    := 0;
                 VL_IPI        := 0;
                 VL_PIS        := 0;
                 VL_COFINS     := 0;
                 VL_PIS_ST     := 0;
                 VL_COFINS_ST  := 0;



                 qryItensEntradas.Active:=false;
                 qryItensEntradas.sql.clear;
                 qryItensEntradas.sql.add(' select udf_strzero(ite.cod_item,5) as codItem, ite.*  from itens_entrada  ite');
                 qryItensEntradas.sql.add(' where ite.cod_entrada='+Quotedstr(qryEntradas.fieldbyname('cod_entrada').Value)+' order by ordem');
                 qryItensEntradas.Active:=true;
                 qryItensEntradas.First;

                  while not qryItensEntradas.eof do
                    begin
                      with RegistroC170New do
                        begin

                          NUM_ITEM    := FormatFloat('000',qryItensEntradas.fieldbyname('ordem').Value );
                          COD_ITEM    := qryItensEntradas.fieldbyname('codItem').Value;
                          DESCR_COMPL := '';
                          QTD         := qryItensEntradas.fieldbyname('quantidade').Value;
                          UNID        := qryItensEntradas.fieldbyname('cod_unidade').Value;
                          VL_ITEM     := qryItensEntradas.fieldbyname('valor_unitario').Value * qryItensEntradas.fieldbyname('quantidade').Value;
                          VL_DESC     := qryItensEntradas.fieldbyname('desconto').Value;
                          IND_MOV     := mfNao;
                          CST_ICMS    := qryItensEntradas.fieldbyname('CST').Value;
                          CFOP        := qryItensEntradas.fieldbyname('CFOP').Value;
                          COD_NAT     := '';
                          VL_BC_ICMS  := 0;
                          ALIQ_ICMS   := 0;
                          VL_ICMS     := 0;
                          VL_BC_ICMS_ST := 0;
                          ALIQ_ST       := 0;
                          VL_ICMS_ST    := 0;
                          IND_APUR      := iaMensal;
                          CST_IPI       := CstIpiToStr ( stipiEntradaIsenta );
                          COD_ENQ       := '';
                          VL_BC_IPI     := 0;
                          ALIQ_IPI      := 0;
                          VL_IPI        := 0;
                          CST_PIS       := CstPisToStr ( stpisOutrasOperacoes );
                          VL_BC_PIS     := 0;
                          ALIQ_PIS_PERC := 0;
                          QUANT_BC_PIS  := 0;
                          ALIQ_PIS_R    := 0;
                          VL_PIS        := 0;
                          CST_COFINS    :=  CstCofinsToStr ( stcofinsOutrasOperacoes );
                          VL_BC_COFINS  := 0;
                          ALIQ_COFINS_PERC := 0;
                          QUANT_BC_COFINS  := 0;
                          ALIQ_COFINS_R    := 0;
                          VL_COFINS        := 0;
                          COD_CTA          := '';
                        end;
                      Application.ProcessMessages;
                      qryItensEntradas.Next;
                    end;


                 qryItensEntradas.Active:=false;
                 qryItensEntradas.sql.clear;
                 qryItensEntradas.sql.add('   select sum( (ite.quantidade * ite.valor_unitario) + ite.valor_ipi + valor_icms_st + ite.outras_despesas - ite.desconto) as total,ite.cfop,ite.cst from itens_entrada ite');
                 qryItensEntradas.sql.add(' where ite.cod_entrada='+Quotedstr(qryEntradas.fieldbyname('cod_entrada').Value));
                 qryItensEntradas.sql.adD('      group by ite.cst, ite.cfop');
                 qryItensEntradas.Active:=true;
                 qryItensEntradas.First;


                  while not qryItensEntradas.eof do
                    begin
                      with RegistroC190New   do
                        begin
                          CST_ICMS    :=  qryItensEntradas.fieldbyname('CST').Value;
                          CFOP        :=  qryItensEntradas.fieldbyname('CFOP').Value;
                          ALIQ_ICMS   :=  0;
                          VL_OPR      :=  qryItensEntradas.fieldbyname('total').Value;
                          VL_BC_ICMS  := 0;
                          VL_ICMS     := 0;
                          VL_BC_ICMS_ST := 0;
                          VL_ICMS_ST    := 0;
                          VL_RED_BC     := 0;
                          VL_IPI        := 0;
                          COD_OBS       := '';
                        end;
                      Application.ProcessMessages;
                      qryItensEntradas.Next;
                    end;
               end;



               if ( (contador mod bufferNotas) = 0 )then
                 begin
                  sped.WriteBloco_C(false);
                  LoadToMemo;
                  contador:=0;
                 end
               else
                 contador:= contador +1;
               Application.ProcessMessages;

              qryEntradas.Next;

              

            end

             except
              begin
               ShowMessage('Erro gerando entradas cód número '+qryEntradas.fieldbyname('cod_entrada').value);
              end;
             end


           end;

            lbAguarde.Repaint;
             if ( (rdTipoGeracao.ItemIndex  = 0) or (rdTipoGeracao.ItemIndex = 2) ) then
              begin
                  qrySaidas.Active:=false;
                  qrySaidas.sql.clear;
                  qrySaidas.sql.add('      select udf_strzero(e.cod_fornecedor,4) as CodFornecedor, e.* from saidas e where data_saida between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
                  qrySaidas.sql.add('    order by cod_saida ');
                  qrySaidas.active:=true;
                  qrySaidas.first;
                  contador:=0;

                  while not qrySaidas.eof do
                   begin
                      With RegistroC100New do
                       begin

                        if ( qrySaidas.fieldbyname('VALOR_ICMS').Value > 0) then
                           begin

                            // armengue para resolver o problema da nota de outro estado no bp, comentar para as outras csas.
                            if (copy(qrySaidas.fieldbyname('CFOP_NOTA').Value,0,1)='6') then
                              begin
                                valorTotalBaseICMSOutrosEstados := valorTotalBaseICMSOutrosEstados + qrySaidas.fieldbyname('BASE_ICMS').Value;
                                valorTotalICMSOutrosEstados := valorTotalICMSOutrosEstados + qrySaidas.fieldbyname('VALOR_ICMS').Value;
                              end
                            else
                              begin
                                //forma normal de calcular
                                valorTotalBaseICMS := valorTotalBaseICMS + qrySaidas.fieldbyname('BASE_ICMS').Value;
                                valorTotalICMS :=  valorTotalICMS + qrySaidas.fieldbyname('VALOR_ICMS').Value;
                              end;



                           end;

                         COD_SIT       := qrySaidas.fieldbyname('situacao').Value;
                         COD_MOD       := qrySaidas.fieldbyname('modelo_nota').Value;
                         NUM_DOC       := formatFloat('000000000',StrToFloat(qrySaidas.fieldbyname('numero_nota').Value));

                         if ( (qrySaidas.fieldbyname('modelo_nota').Value = '55') and (qrySaidas.fieldbyname('chave_nfe').Value <> null) and (qrySaidas.fieldbyname('chave_nfe').Value <> '') ) then
                           CHV_NFE       := qrySaidas.fieldbyname('chave_nfe').Value
                         else
                           CHV_NFE := '';


                         if qrySaidas.fieldbyname('situacao').Value = '00' then
                          begin
                             COD_PART      := qrySaidas.fieldbyname('codFornecedor').Value;
                             IND_EMIT      := edEmissaoPropria;
                             IND_OPER      := tpSaidaPrestacao;
                             SER           := qrySaidas.fieldbyname('serie_nota').Value;
                             DT_DOC        := qrySaidas.fieldbyname('data_emissao').Value;
                             DT_E_S        := qrySaidas.fieldbyname('data_saida').Value;
                             VL_DOC        := qrySaidas.fieldbyname('total_nota').Value;
                             IND_PGTO      := tpPrazo;
                             VL_DESC       := qrySaidas.fieldbyname('desconto').Value;
                             VL_ABAT_NT    := 0;  // Não tenho esse campo nas NFS
                             VL_MERC       := qrySaidas.fieldbyname('valor_produtos').Value;
                             IND_FRT       :=  tfSemCobrancaFrete;
                             VL_FRT        := qrySaidas.fieldbyname('frete').Value;
                             VL_SEG        := qrySaidas.fieldbyname('seguro').Value;
                             VL_OUT_DA     := qrySaidas.fieldbyname('outras_despesas').Value;
                             VL_BC_ICMS    := qrySaidas.fieldbyname('base_icms').Value;
                             VL_ICMS       := qrySaidas.fieldbyname('valor_icms').Value;
                             VL_BC_ICMS_ST := qrySaidas.fieldbyname('BASE_ICMS_SUBST').Value;
                             VL_ICMS_ST    := qrySaidas.fieldbyname('VALOR_ICMS_SUBST').Value;
                             VL_IPI        := qrySaidas.fieldbyname('VALOR_IPI').Value;
                             VL_PIS        := 0;
                             VL_COFINS     := 0;
                             VL_PIS_ST     := 0;
                             VL_COFINS_ST  := 0;

                             // se a nota tiver cupom referenciado, CFOP=5929, não precisa do C170
        //                     if ( (qrySaidas.FieldByName('numero_cupom_fiscal').Value <> null) and (triM(qrySaidas.FieldByName('numero_cupom_fiscal').Value) <> '')) then
          //                     begin
                               // validador deu erro ao informar o registro

          //                         With RegistroC110New do
              //                    begin
            //                        COD_INF :='000001';
          //                          TXT_COMPL:='';
          //                              with RegistroC114New   do  // informações do cupom referenciado
                //                        begin
                              //           qryItensSaidas.Active:=false;
                            //             qryItensSaidas.sql.clear;
                          //               qryItensSaidas.sql.add('  select distinct v.num_serie_ecf as num_serie, i.numordem, i.descricao,v.valor_total,v.data_ecf,v.coo_cupom  from vendas v');
                        //                 qryItensSaidas.sql.add('   inner join impressoras_fiscais i on (i.num_serie  = v.num_serie_ecf) ');
                      //                   qryItensSaidas.sql.add('   where v.coo_cupom ='+quotedstr(qrySaidas.FieldByName('numero_cupom_fiscal').Value));
                    //                     qryItensSaidas.Active :=true;
                  //                       COD_MOD := '2D';
                //                         ECF_FAB := qryItensSaidas.fieldbyname('num_serie').Value;
              //                           ECF_CX  := qryItensSaidas.fieldbyname('numordem').Value;
            //                             NUM_DOC := qryItensSaidas.fieldbyname('coo_cupom').Value;
          //                               DT_DOC  := qryItensSaidas.fieldbyname('data_ecf').Value;
          //                                end;
          //                        end;

      //                         end
    //                         else
  //                            begin

                                 if (qrySaidas.fieldbyname('modelo_nota').Value <> '55') then  // Se a nota fiscal de saída for eletrônica, não é necessário informar os ítens da nota.
                                 begin
                                     qryItensSaidas.Active:=false;
                                     qryItensSaidas.sql.clear;
                                     qryItensSaidas.sql.add(' select udf_strzero(ite.cod_item,5) as codItem, ite.*  from itens_saida  ite');
                                     qryItensSaidas.sql.add(' where ite.cod_saida='+Quotedstr(qrySaidas.fieldbyname('cod_saida').Value)+' order by ordem');
                                     qryItensSaidas.Active:=true;
                                     qryItensSaidas.First;

                                      while not qryItensSaidas.eof do
                                        begin
                                          with RegistroC170New do
                                            begin
                                              NUM_ITEM    := FormatFloat('000',qryItensSaidas.fieldbyname('ordem').Value );
                                              COD_ITEM    := qryItensSaidas.fieldbyname('codItem').Value;
                                              DESCR_COMPL := '';
                                              QTD         := qryItensSaidas.fieldbyname('quantidade').Value;
                                              UNID        := qryItensSaidas.fieldbyname('cod_unidade').Value;
                                              VL_ITEM     := qryItensSaidas.fieldbyname('valor_unitario').Value * qryItensSaidas.fieldbyname('quantidade').Value;
                                              VL_DESC     := qryItensSaidas.fieldbyname('desconto').Value;
                                              IND_MOV     := mfNao;
                                              CST_ICMS    := qryItensSaidas.fieldbyname('CST').Value;
                                              CFOP        := qryItensSaidas.fieldbyname('CFOP').Value;
                                              COD_NAT     := '';
                                              VL_BC_ICMS  :=  qryItensSaidas.fieldbyname('BASE_ICMS').Value;
                                              ALIQ_ICMS   :=  qryItensSaidas.fieldbyname('ALIQUOTA_ICMS').Value;
                                              VL_ICMS     :=  qryItensSaidas.fieldbyname('VALOR_ICMS').Value;
                                              VL_BC_ICMS_ST := qryItensSaidas.fieldbyname('VALOR_ICMS_ST').Value;
                                              ALIQ_ST       := 0;
                                              VL_ICMS_ST    := qryItensSaidas.fieldbyname('VALOR_ICMS_ST').Value;
                                              IND_APUR      := iaMensal;
                                              CST_IPI       := CstIpiToStr ( STipiSaidaIsenta);
                                              COD_ENQ       := '';
                                              VL_BC_IPI     := 0;
                                              ALIQ_IPI      := 0;
                                              VL_IPI        := 0;
                                              CST_PIS       := CstPisToStr ( STpisOutrasOperacoes);
                                              VL_BC_PIS     := 0;
                                              ALIQ_PIS_PERC := 0;
                                              QUANT_BC_PIS  := 0;
                                              ALIQ_PIS_R    := 0;
                                              VL_PIS        := 0;
                                              CST_COFINS    := CstCofinsToStr ( stcofinsOutrasOperacoes);
                                              VL_BC_COFINS  := 0;
                                              ALIQ_COFINS_PERC := 0;
                                              QUANT_BC_COFINS  := 0;
                                              ALIQ_COFINS_R    := 0;
                                              VL_COFINS        := 0;
                                              COD_CTA          := '';
                                            end;
                                            Application.ProcessMessages;
                                            qryItensSaidas.Next;
                                        end;
                                 end;

                            lbAguarde.Repaint;

//                              end;

                             // Registro C190
                             qryItensSaidas.Active:=false;
                               qryItensSaidas.sql.clear;
                             qryItensSaidas.sql.add('   select sum( (ite.quantidade * ite.valor_unitario) + ite.valor_ipi + ite.outras_despesas - ite.desconto) as total,');
                             qryItensSaidas.SQL.add('    sum(ite.base_icms) as total_base, sum(ite.reducao_base_icms) as total_red_base_icms,ite.cfop,ite.cst,ite.aliquota_icms from itens_saida ite');
                             qryItensSaidas.sql.add(' inner join saidas s on (s.cod_saida = ite.cod_saida)');
                             qryItensSaidas.sql.add(' where ite.cod_saida='+Quotedstr(qrySaidas.fieldbyname('cod_saida').Value));
                             qryItensSaidas.sql.adD('      group by ite.cst, ite.cfop,ite.aliquota_icms');


                             qryItensSaidas.Active:=true;
                             qryItensSaidas.First;

                              while not qryItensSaidas.eof do
                                begin
                                  with RegistroC190New   do
                                    begin
                                      CST_ICMS    :=  qryItensSaidas.fieldbyname('CST').Value;
                                      CFOP        :=  qryItensSaidas.fieldbyname('CFOP').Value;
                                      ALIQ_ICMS   :=  qryItensSaidas.fieldbyname('aliquota_icms').Value;
                                      VL_OPR      :=  qryItensSaidas.fieldbyname('total').Value;
                                      if (qryItensSaidas.fieldbyname('aliquota_icms').Value > 0) then
                                       begin
                                        VL_BC_ICMS  :=  qryItensSaidas.fieldbyname('total_base').Value;
                                        VL_ICMS     :=  qryItensSaidas.fieldbyname('total_base').Value * (qryItensSaidas.fieldbyname('aliquota_icms').Value / 100)
                                       end
                                      else
                                       begin
                                         VL_BC_ICMS  :=  0;
                                         VL_ICMS     :=  0;
                                       end;

                                      VL_BC_ICMS_ST := 0;
                                      VL_ICMS_ST    := 0;
                                      VL_RED_BC     :=  (qryItensSaidas.fieldbyname('total').Value - qryItensSaidas.fieldbyname('total_base').Value);
                                      VL_IPI        := 0;
                                      COD_OBS       := '';
                                    end;
                                  Application.ProcessMessages;
                                  qryItensSaidas.Next;
                                end;
                          end;

                       end;

                       if ( (contador mod bufferNotas) = 0 )then
                         begin
                          sped.WriteBloco_C(false);
                          LoadToMemo;
                          contador:=0;
                         end
                       else
                         contador:= contador +1;
                      Application.ProcessMessages;
                      qrySaidas.Next;
                   end;


                  // NFC-E notas fiscais de venda eletrônicas modelo 55

                  qrysaidas.Active := false;
                  qrysaidas.sql.clear;
                  qrysaidas.SQL.add(' select * from vendas v where ');
                  qrysaidas.SQL.add('  v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
                  qrysaidas.SQL.add('  and  (v.chave_nfce is not null ) and v.chave_nfce <> '+Quotedstr(''));
                  qrySaidas.sql.add(' and v.modelo_comprovante=3');
                  qrysaidas.SQL.add('   order by v.serie_nfce, v.numero_nfce ');
                  dm.adicionaLog(qrySaidas.SQL.Text);
                  qrysaidas.Active := true;


                  while not qrySaidas.eof do
                   begin
                      With RegistroC100New do
                       begin
                        dm.adicionaLog('SPED venda nº :'+ qrySaidas.fieldbyname('cod_venda').Value);
                        qryItensSaidas.Active := false;
                        qryItensSaidas.sql.clear;

                        qryItensSaidas.sql.add('select sum(r.base_icms) as base_icms, sum(r.valor_icms) as valor_icms from  registros_c190_nfce('+QUotedstr(qrysaidas.fieldbyname('cod_venda').Value)+') r');
                        dm.adicionaLog(qryItensSaidas.SQL.text);
                        qryItensSaidas.Active := true;


                        if not qryItensSaidas.IsEmpty then
                         begin
                          baseIcmsVenda  := qryItensSaidas.fieldbyname('base_icms').value;
                          valorIcmsVenda := qryItensSaidas.fieldbyname('valor_icms').value;
                         end
                        else
                         begin
                          baseIcmsVenda  := 0;
                          valorIcmsVenda := 0;
                         end;

    										COD_SIT       :=  sdRegular;
		    								COD_MOD       := '55';
		    								SER           := qrySaidas.fieldbyname('serie_nfce').Value;
				    						NUM_DOC       := formatFloat('000000000',StrToFloat(qrySaidas.fieldbyname('numero_nfce').Value));
                        CHV_NFE       := qrySaidas.fieldbyname('chave_nfce').Value;
						    				COD_PART      := qrySaidas.fieldbyname('cod_fornecedor').Value;
								    		IND_EMIT      := edEmissaoPropria;
    										IND_OPER      := tpSaidaPrestacao;

				    						DT_DOC        := qrySaidas.fieldbyname('data_so').Value;
						    				DT_E_S        := qrySaidas.fieldbyname('data_so').Value;
    										VL_DOC        := qrySaidas.fieldbyname('valor_total').Value;
		    								IND_PGTO      := tpVista;
				    						VL_DESC       := qrySaidas.fieldbyname('valor_desconto').Value;
						    				VL_ABAT_NT    := 0;  // Não tenho esse campo nas NFS
								    		VL_MERC       := qrySaidas.fieldbyname('valor_bruto').Value;
										    IND_FRT       :=  tfSemCobrancaFrete;
    										VL_FRT        := 0;
		    								VL_SEG        := 0;
				    						VL_OUT_DA     := 0;
						    				VL_BC_ICMS    := baseIcmsVenda;
								    		VL_ICMS       := valorIcmsVenda;
										    VL_BC_ICMS_ST := 0;
    										VL_ICMS_ST    := 0;
		    								VL_IPI        := 0;
				    						VL_PIS        := 0;
						    				VL_COFINS     := 0;
	  							  		VL_PIS_ST     := 0;
  	  									VL_COFINS_ST  := 0;

                        qryItensSaidas.Active := false;
                        qryItensSaidas.sql.clear;





                        qryItensSaidas.sql.add('select * FROM registros_c190_nfce('+QUotedstr(qrysaidas.fieldbyname('cod_venda').Value)+') where valor_operacao > 0');
                        dm.adicionaLog(qryItensSaidas.SQL.text);
                        qryItensSaidas.Active := true;



                        while not qryItensSaidas.Eof do
                         begin

                            with RegistroC190New   do
                              begin


                                CST_ICMS    :=  qryItensSaidas.fieldbyname('cst_saida').Value;
                                CFOP        :=  qryItensSaidas.fieldbyname('cfop_saida').Value;
                                ALIQ_ICMS   :=  qryItensSaidas.fieldbyname('percentual_icms').Value;
                                VL_OPR      :=  qryItensSaidas.fieldbyname('valor_operacao').Value;

                                if ( qryItensSaidas.FieldByName('valor_icms').Value > 0 ) then
                                 begin
                                   VL_BC_ICMS  :=  qryItensSaidas.fieldbyname('base_icms').Value;
                                   VL_ICMS     :=  qryItensSaidas.fieldbyname('valor_icms').Value;
                                   valorTotalBaseICMS := valorTotalBaseICMS +  qryItensSaidas.fieldbyname('base_icms').Value;
                                   valorTotalICMS :=  valorTotalICMS + qryItensSaidas.fieldbyname('valor_icms').Value;


                                 end
                                else
                                 begin
                                  VL_BC_ICMS := 0;
                                  VL_ICMS    := 0;
                                 end;

                                VL_BC_ICMS_ST := 0;
                                VL_ICMS_ST    := 0;
                                VL_RED_BC     := qryItensSaidas.fieldbyname('TOTAL_REDUCAO_BASE_ICMS').Value;
                                VL_IPI        := 0;
                                COD_OBS       := '';
                              end;

                           Application.ProcessMessages;
                           qryItensSaidas.Next;
                         end;
                       end;
                      Application.ProcessMessages;
                      qrysaidas.Next;
                   end;







                  // NFC-E notas fiscais de venda ao consumidor eletrônicas   (modelo 65)


                  qrysaidas.Active := false;
                  qrysaidas.sql.clear;
                  qrysaidas.SQL.add(' select * from vendas v where ');
                  qrysaidas.SQL.add('  v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
                  qrysaidas.SQL.add('  and  (v.chave_nfce is not null ) and v.chave_nfce <> '+Quotedstr(''));
                  qrySaidas.sql.add(' and v.modelo_comprovante=2 ');
                  qrysaidas.SQL.add('   order by v.serie_nfce, v.numero_nfce ');
                  qrysaidas.Active := true;

                  while not qrySaidas.eof do
                   begin
                      With RegistroC100New do
                       begin


                        qryItensSaidas.Active := false;
                        qryItensSaidas.sql.clear;
                        qryItensSaidas.sql.add('select sum(r.base_icms) as base_icms, sum(r.valor_icms) as valor_icms from  registros_c190_nfce('+QUotedstr(qrysaidas.fieldbyname('cod_venda').Value)+') r');
                        dm.adicionaLog(qryItensSaidas.SQL.text);
                        qryItensSaidas.Active := true;

                        if not qryItensSaidas.IsEmpty then
                         begin
                          baseIcmsVenda  := qryItensSaidas.fieldbyname('base_icms').value;
                          valorIcmsVenda := qryItensSaidas.fieldbyname('valor_icms').value;

                         end
                        else
                         begin
                          baseIcmsVenda  := 0;
                          valorIcmsVenda := 0;
                         end;

                          {
                        dm.parametrizaAcbrNFE(moNFCE);
                        dm.ACBrNFe1.NotasFiscais.Clear;
                        dm.ACBrNFe1.NotasFiscais.LoadFromFile('C:\201612\'+qrySaidas.fieldbyname('chave_nfce').Value+'.xml',false);
                        valorICMSXML :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;

                        if valorICMSXML <> StrToCurr( Floattostr(qrySaidas.fieldbyname('valor_total').Value ) )  then
                         begin
                          Memo1.Lines.Add('NFCE : '+Inttostr(qrySaidas.FieldByName('numero_nfce').Value) + '  XML: '+CurrToStr(valorICMSXML)+'  Sped: '+Floattostr(baseIcmsVenda)
                          +'  Dif: '+Floattostr(qrySaidas.fieldbyname('valor_total').Value - valorICMSXML));
                         end;
                           }


    										COD_SIT       :=  sdRegular;
		    								COD_MOD       := '65';
		    								SER           := qrySaidas.fieldbyname('serie_nfce').Value;
				    						NUM_DOC       := formatFloat('000000000',StrToFloat(qrySaidas.fieldbyname('numero_nfce').Value));
                        CHV_NFE       := qrySaidas.fieldbyname('chave_nfce').Value;
//						    				COD_PART      := qrySaidas.fieldbyname('codFornecedor').Value;
								    		IND_EMIT      := edEmissaoPropria;
    										IND_OPER      := tpSaidaPrestacao;

				    						DT_DOC        := qrySaidas.fieldbyname('data_so').Value;
						    				DT_E_S        := qrySaidas.fieldbyname('data_so').Value;
    										VL_DOC        := qrySaidas.fieldbyname('valor_total').Value;
		    								IND_PGTO      := tpVista;
				    						VL_DESC       := qrySaidas.fieldbyname('valor_desconto').Value;
						    				VL_ABAT_NT    := 0;  // Não tenho esse campo nas NFS
								    		VL_MERC       := qrySaidas.fieldbyname('valor_bruto').Value;
										    IND_FRT       :=  tfSemCobrancaFrete;
    										VL_FRT        := 0;
		    								VL_SEG        := 0;
				    						VL_OUT_DA     := 0;
						    				VL_BC_ICMS    := baseIcmsVenda;
								    		VL_ICMS       := valorIcmsVenda;
										    VL_BC_ICMS_ST := 0;
    										VL_ICMS_ST    := 0;
		    								VL_IPI        := 0;
				    						VL_PIS        := 0;
						    				VL_COFINS     := 0;
	  							  		VL_PIS_ST     := 0;
  	  									VL_COFINS_ST  := 0;


                        qryItensSaidas.Active := false;
                        qryItensSaidas.sql.clear;
                        qryItensSaidas.sql.add('select * FROM registros_c190_nfce('+QUotedstr(qrysaidas.fieldbyname('cod_venda').Value)+') where valor_operacao > 0');
                        dm.adicionaLog(qryItensSaidas.SQL.text);
                        qryItensSaidas.Active := true;



                        while not qryItensSaidas.Eof do
                         begin

                            with RegistroC190New   do
                              begin


                                CST_ICMS    :=  qryItensSaidas.fieldbyname('cst_saida').Value;
                                CFOP        :=  qryItensSaidas.fieldbyname('cfop_saida').Value;
                                ALIQ_ICMS   :=  qryItensSaidas.fieldbyname('percentual_icms').Value;
                                VL_OPR      :=  qryItensSaidas.fieldbyname('valor_operacao').Value;

                                if ( qryItensSaidas.FieldByName('valor_icms').Value > 0 ) then
                                 begin
                                   VL_BC_ICMS  :=  qryItensSaidas.fieldbyname('base_icms').Value;
                                   VL_ICMS     :=  qryItensSaidas.fieldbyname('valor_icms').Value;
                                   valorTotalBaseICMS := valorTotalBaseICMS +  qryItensSaidas.fieldbyname('base_icms').Value;
                                   valorTotalICMS :=  valorTotalICMS + qryItensSaidas.fieldbyname('valor_icms').Value;
                                 end
                                else
                                 begin
                                  VL_BC_ICMS := 0;
                                  VL_ICMS    := 0;
                                 end;

                                VL_BC_ICMS_ST := 0;
                                VL_ICMS_ST    := 0;
                                VL_RED_BC     := qryItensSaidas.fieldbyname('TOTAL_REDUCAO_BASE_ICMS').Value;
                                VL_IPI        := 0;
                                COD_OBS       := '';
                              end;

                           Application.ProcessMessages;
                           qryItensSaidas.Next;
                         end;
                       end;
                      Application.ProcessMessages;
                      qrysaidas.Next;
                   end;







                   // Registro das impressoras fiscais

                     qryImpressorasFiscais.Active:=false;
                     qryImpressorasFiscais.sql.clear;
                     qryImpressorasFiscais.sql.add(' select * from impressoras_fiscais if ');
                     qryImpressorasFiscais.sql.add('  where if.num_serie  in (select rm.num_serie from reg60m rm where rm.data between ');
                     qryImpressorasFiscais.sql.add(''+ Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')' );


                     frm_principal.memo_avisos.Lines := qryImpressorasFiscais.SQL;
//                     frm_principal.memo_avisos.Visible := true;
                     qryImpressorasFiscais.Active:=true;
                     qryImpressorasFiscais.first;

                     while not qryImpressorasFiscais.Eof do
                      begin
                        with RegistroC400New do
                        begin
                          COD_MOD   := '2D';
                          ECF_MOD   := qryImpressorasFiscais.fieldbyname('descricao').value;
                          ECF_FAB   := qryImpressorasFiscais.fieldbyname('NUM_SERIE').value;
                          ECF_CX    := qryImpressorasFiscais.fieldbyname('numordem').value;


                          qryRegistros60M.Active:=false;
                          qryRegistros60M.sql.clear;
                          qryRegistros60M.sql.add('select rm.*, cast(udf_replace(rm.tot_geral,'+Quotedstr(',')+','+Quotedstr('.')+') as numeric(10,2)) as t_geral, ');
                          qryRegistros60M.sql.add('  cast(udf_replace(rm.venda_bruta,'+Quotedstr(',')+','+Quotedstr('.')+') as numeric(10,2)) as v_bruta ');
                          qryRegistros60M.sql.add('  from reg60M RM where rm.num_serie='+Quotedstr(qryImpressorasFiscais.fieldbyname('NUM_SERIE').value));
                          qryRegistros60M.sql.add('  and data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+' order by data');
                          qryRegistros60M.Active:=true;
                          qryRegistros60M.First;



                          while not qryRegistros60M.Eof do
                            begin
                              with RegistroC405New do
                                begin
                                  DT_DOC         := qryRegistros60M.fieldbyname('data').Value;
                                  CRO            := StrToInt(qryRegistros60M.fieldbyname('co_rein_op').Value);
                                  CRZ            := StrToInt(qryRegistros60M.fieldbyname('cont_z').Value)+1;
                                  NUM_COO_FIN    := StrToInt(qryRegistros60M.fieldbyname('coo_fim').Value);
                                  GT_FIN         := qryRegistros60M.fieldbyname('t_geral').Value;
                                  VL_BRT         := qryRegistros60M.fieldbyname('v_bruta').Value;


                                  if VL_BRT > 0 then
                                   begin
                                      // Consultar caso do boi preto de salvador para PIS e Cofins
                                      with RegistroC410New do
                                       begin
                                         VL_PIS     :=0;
                                         VL_COFINS  :=0;
                                       end;

                                     qryRegistros60A.Active :=false;
                                     qryRegistros60A.SQL.clear;
                                     qryRegistros60A.SQL.Add('select aliquota, al.sped, al.percentual_icms,al.sintegra,ra.num_serie, ');
                                     qryRegistros60A.SQL.Add('  SUM( cast(udf_replace(valor_acumulado,'+Quotedstr(',')+','+Quotedstr('.')+') as numeric(10,2) )) as valor_ac  from reg60a ra');
                                     qryRegistros60A.SQL.Add('  inner join aliquotas al on (al.sintegra = ra.aliquota)');
                                     qryRegistros60A.SQL.Add(' where ra.num_serie='+Quotedstr(qryImpressorasFiscais.fieldbyname('NUM_SERIE').value));
                                     qryRegistros60A.SQL.Add(' and data='+Quotedstr(FormatDateTime('DD.MM.YYY',qryRegistros60M.fieldbyname('data').Value))+'  AND valor_acumulado >0 group by ra.aliquota,al.sped,al.percentual_icms,al.sintegra,ra.num_serie ');
                                     qryRegistros60A.Active:=true;
                                     qryRegistros60A.First;





                                     while not qryRegistros60A.Eof do
                                      begin
                                       if StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) > 0 then
                                        begin
                                          with RegistroC420New do
                                           begin
                                              if (qryRegistros60A.fieldbyname('percentual_icms').Value > 0) then
                                               begin
                                                  NR_TOT := 1;
                                                  DESCR_NR_TOT :='';
                                               end;

                                              COD_TOT_PAR  := qryRegistros60A.fieldbyname('sped').Value;
                                              VLR_ACUM_TOT := qryRegistros60A.fieldbyname('valor_ac').Value;



                                              qryRegistros425.Active := False;
                                              qryRegistros425.SQL.Clear;
                                              qryRegistros425.sql.add('select *  from registrosc425('+Quotedstr(FormatDateTime('DD.MM.YYY',qryRegistros60M.fieldbyname('data').Value))+','+QuotedStr(qryRegistros60A.fieldbyname('sintegra').Value)+','+
                                              Quotedstr(qryRegistros60A.fieldbyname('num_serie').Value )+')');
                                              qryRegistros425.SQL.Add(' r where r.sped='+Quotedstr( qryRegistros60A.fieldbyname('sped').Value));
                                              qryRegistros425.SQL.Add(' and  cast(r.baseicms as numeric(10,2)) > 0 ');

                                              dm.adicionaLog(qryRegistros425.SQL.Text);
                                              qryRegistros425.Active:= true;
                                              qryRegistros425.First;

                                              while not qryRegistros425.Eof do
                                               begin
                                                 vlItem425 := qryRegistros425.fieldbyname('BASEICMS').Value ;

                                                 if vlItem425 > 0.01  then
                                                  begin

                                                     With RegistroC425New do
                                                      begin
                                                        COD_ITEM := qryRegistros425.fieldbyname('cod_produto').Value ;
                                                        QTD := qryRegistros425.fieldbyname('QTDITEM').Value ;
                                                        UNID := '10';
                                                        VL_ITEM := qryRegistros425.fieldbyname('BASEICMS').Value ;
                                                      end;
                                                  end;
                                                  Application.ProcessMessages;
                                                  qryRegistros425.Next;

                                               end;

                                           end;
                                        end;
                                        Application.ProcessMessages;
                                        qryRegistros60A.Next
                                      end;



                                     qryRegistros60A.Active :=false;
                                     qryRegistros60A.SQL.clear;
                                     qryRegistros60A.SQL.Add(' select ra.aliquota,al.cod_aliquota,al.sped, al.percentual_icms,al.cfop_sped, al.cst_sped,al.soma_base_icms, ');
                                     qryRegistros60A.SQL.Add(' SUM( cast(udf_replace(valor_acumulado,'+Quotedstr(',')+','+Quotedstr('.')+') as numeric(10,2) )) as valor_ac  from reg60a ra');
                                     qryRegistros60A.SQL.Add('  inner join aliquotas al on (al.sintegra = ra.aliquota)');
                                     qryRegistros60A.SQL.Add(' where data= '+Quotedstr(FormatDateTime('DD.MM.YYY',qryRegistros60M.fieldbyname('data').Value)));
                                     qryRegistros60A.SQL.Add(' and ra.num_serie='+Quotedstr(qryImpressorasFiscais.fieldbyname('NUM_SERIE').value));
                                     qryRegistros60A.SQL.Add(' and al.sped_c490=1 ');
                                     qryRegistros60A.SQL.Add(' group by  ra.aliquota,al.cod_aliquota,al.sped, al.percentual_icms,al.cfop_sped, al.cst_sped,al.soma_base_icms');
                                     qryRegistros60A.Active:=true;
                                     qryRegistros60A.First;

                                     while not qryRegistros60A.Eof do
                                      begin
                                       if (StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) > 0) then
                                        begin
                                         with RegistroC490New  do
                                           begin
                                             CFOP       := qryRegistros60A.fieldbyname('cfop_sped').Value;
                                             CST_ICMS   := qryRegistros60A.fieldbyname('cst_sped').Value;
                                             ALIQ_ICMS  := qryRegistros60A.fieldbyname('percentual_icms').Value;
                                             VL_OPR:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);

                                             if ( (qryRegistros60A.fieldbyname('soma_base_icms').Value =1) and (qryRegistros60A.fieldbyname('percentual_icms').Value  > 0) ) then
                                              begin
                                                VL_BC_ICMS:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                                VL_ICMS:= ( (StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) * qryRegistros60A.fieldbyname('percentual_icms').Value) / 100);
                                                valorTotalBaseICMS := valorTotalBaseICMS + qryRegistros60A.fieldbyname('valor_ac').Value;
                                                valorTotalICMS :=  valorTotalICMS + VL_ICMS;
                                              end
                                             else
                                               begin
                                                VL_BC_ICMS:=0;
                                                VL_ICMS:=0;
                                               end;

                                           end;
                                         end;
                                         Application.ProcessMessages;
                                        qryRegistros60A.Next
                                      end;
                                    end;
                                   end;
                                 Application.ProcessMessages;
                                qryRegistros60M.Next;
                            end;

                        end;
                        Application.ProcessMessages;
                        qryImpressorasFiscais.Next;
                      end;



              end;
        end;
     end;




   sped.WriteBloco_C(true);


   with sped.Bloco_D do
   begin
      dm.adicionaLog('Entrou na geração do bloco D');
      with RegistroD001New do
      begin
         dm.tb_parametros.Active := true;
          dm.adicionaLog('Começa as notas de transporte');
          qryNotasTransporte.Active := false;
        qryNotasTransporte.SQL.Clear;

        qryNotasTransporte.SQL.add(' select CODIGO,COD_FORNECEDOR,NUMERO_NOTA,SERIE, ');
        qryNotasTransporte.SQL.add(' SUB_SERIE,SITUACAO, DATA_EMISSAO, DATA_SERVICO,');
        qryNotasTransporte.SQL.add(' DATA_LANCAMENTO,MES_REF_CONTABIL,MODELO_NOTA,');
        qryNotasTransporte.SQL.add(' CFOP,CST_ICMS,VALOR_SERVICO,DESCONTO,BASE_ICMS,');
        qryNotasTransporte.SQL.add(' REDUCAO_BASE_ICMS,ALIQ_ICMS,VALOR_ICMS, VALOR_NAO_TRIBUTADO,');
        qryNotasTransporte.SQL.add(' VALOR_DOC,TIPO_CTE,ID_FRETE,CHAVE_CTE,TIPODOC, ');
        qryNotasTransporte.SQL.add(' coalesce(MUNICIPIO_REMETENTE,0) as municipio_origem');
        qryNotasTransporte.SQL.add('  from notas_transporte where data_servico between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
        dm.adicionaLog(qryNotasTransporte.SQL.Text);
        qryNotasTransporte.Active :=true;

        if (qryNotasTransporte.IsEmpty = true) then                                                                             
           IND_MOV := imSemDados
        else
          begin
            IND_MOV := imComDados;

            while not qryNotasTransporte.Eof do
             begin

                with RegistroD100New do
                 begin
                   IND_OPER :=  tpEntradaAquisicao;
                   IND_EMIT :=  edTerceiros;
                   COD_PART :=  qryNotasTransporte.fieldbyname('cod_fornecedor').Value;
                   COD_MOD  :=  qryNotasTransporte.fieldbyname('modelo_nota').Value;
                   COD_SIT  :=  sdRegular;
                   if ( (qryNotasTransporte.fieldbyname('serie').Value = '') or (qryNotasTransporte.fieldbyname('serie').Value = null ) ) then
                     SER := ''
                   else
                     SER := qryNotasTransporte.fieldbyname('serie').Value;

                   if ( (qryNotasTransporte.fieldbyname('sub_serie').Value = '') or (qryNotasTransporte.fieldbyname('sub_serie').Value = null ) ) then
                     SUB  := ''
                   else
                     SUB := qryNotasTransporte.fieldbyname('sub_serie').Value;


                   NUM_DOC := qryNotasTransporte.fieldbyname('numero_nota').Value;
                   DT_DOC  := qryNotasTransporte.fieldbyname('data_emissao').Value;
                   DT_A_P  := qryNotasTransporte.fieldbyname('data_servico').Value;

                   if ( (COD_MOD ='57') and (qryNotasTransporte.fieldbyname('chave_cte').Value <> null) ) then
                    BEGIN

                     TP_CT_e := qryNotasTransporte.fieldbyname('tipo_cte').Value;
                     CHV_CTE := qryNotasTransporte.fieldbyname('chave_cte').Value;
                    END;
                   VL_DOC  :=  qryNotasTransporte.fieldbyname('valor_doc').Value;
                   VL_DESC :=  qryNotasTransporte.fieldbyname('desconto').Value;

                   case qryNotasTransporte.fieldbyname('id_frete').Value of
                    0:  IND_FRT := tfPorContaTerceiros;
                    1:  IND_FRT := tfPorContaEmitente ;
                    2:  IND_FRT := tfPorContaDestinatario;
                    3:  IND_FRT := tfSemCobrancaFrete;
                   end;

                   VL_SERV    := qryNotasTransporte.fieldbyname('valor_servico').Value;
                   VL_BC_ICMS := qryNotasTransporte.fieldbyname('base_icms').Value;
                   VL_ICMS    := qryNotasTransporte.fieldbyname('valor_icms').Value;
                   VL_NT      := qryNotasTransporte.fieldbyname('VALOR_NAO_TRIBUTADO').Value;
                   COD_INF    :='';
                   COD_CTA    :='';

                   if qryNotasTransporte.fieldbyname('municipio_origem').Value <> 0  then
                    COD_MUN_ORIG := inttostr(qryNotasTransporte.fieldbyname('municipio_origem').Value)
                   else
                     COD_MUN_ORIG :='';

                   COD_MUN_DEST := dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value;



                   with RegistroD190New  do
                     begin
                       CST_ICMS    :=  qryNotasTransporte.fieldbyname('CST_ICMS').Value;
                       CFOP        :=  qryNotasTransporte.fieldbyname('CFOP').Value;
                       ALIQ_ICMS   :=  qryNotasTransporte.fieldbyname('ALIQ_ICMS').Value;
                       VL_OPR      :=  qryNotasTransporte.fieldbyname('VALOR_DOC').Value;
                       VL_BC_ICMS  :=  qryNotasTransporte.fieldbyname('base_icms').Value;
                       VL_ICMS     :=  qryNotasTransporte.fieldbyname('valor_icms').Value;
                       VL_RED_BC   :=  qryNotasTransporte.fieldbyname('reducao_base_icms').Value;
                       COD_OBS     := '';
                     end;


                 end;
                Application.ProcessMessages;
                qryNotasTransporte.Next;
             end;

          end;
      end;
   end;


   with sped.Bloco_E  do
   begin
      with RegistroE001New do
      begin
        IND_MOV := imComDados;

        With RegistroE100New DO
         BEGIN
           DT_INI := edDataInicial.Date;
           DT_FIN := edDataFinal.Date;

           with RegistroE110New do
             begin
//CEARA
// Parametrizar para o valor da redução da casa que houver  ceará (redução de 79.4% na base)
//              valorBaseICMSReduzida := ( valorTotalBaseICMS  * 0.206 );


// usava este valor antigamente para redução na torre de pizza - bahia
//               valorBaseICMSReduzida := ( valorTotalBaseICMS * 0.2352945 ); // Aplica redução de 76,47055%

               dm.tb_parametros.Active := true;


               valorBaseICMSReduzida := ( valorTotalBaseICMS * dm.tb_parametrosRED_BASE_ICMS.Value); // Aplica redução de base
               valorICMSReduzido:= ( valorBaseICMSReduzida * (dm.tb_parametrosALIQUOTA_ICMS.value/100));

               valorBaseICMSReduzidaOutrosEstados := 0; // (valorTotalBaseICMSOutrosEstados * 0.206);
               valorICMSReduzidoOutrosEstados     := 0; //(valorBaseICMSReduzidaOutrosEstados * 0.12);

               valorTotalICMS := valorTotalICMS + valorTotalICMSOutrosEstados;


               valorTotalICMS := valorTotalICMS;
               VL_TOT_DEBITOS := valorTotalICMS;
               VL_AJ_DEBITOS := 0;
               VL_TOT_AJ_DEBITOS := 0;
               VL_ESTORNOS_CRED := 0;
               VL_TOT_CREDITOS := 0;
               VL_AJ_CREDITOS := 0;
               VL_TOT_AJ_CREDITOS := 0;
               VL_ESTORNOS_DEB    := 0;
               VL_SLD_CREDOR_ANT := 0;

               if ( (valorICMSReduzido > 0) or (valorICMSReduzidoOutrosEstados > 0)) then
                begin
                  VL_TOT_DED :=        valorTotalICMS  - (valorICMSReduzido + valorICMSReduzidoOutrosEstados);
                end
               else
                begin
                  VL_TOT_DED := 0;
                end;

               VL_SLD_APURADO :=  valorTotalICMS;
               VL_ICMS_RECOLHER :=  VL_TOT_DEBITOS -VL_ESTORNOS_DEB - VL_TOT_DED ;
               //               VL_ICMS_RECOLHER :=  valorICMSReduzido + valorICMSReduzidoOutrosEstados;
               VL_SLD_CREDOR_TRANSPORTAR := 0;
               DEB_ESP := 0;


              if ( (valorICMSReduzido > 0) or (valorICMSReduzidoOutrosEstados > 0)) then
               begin

                 with RegistroE111New do
                    begin
                       COD_AJ_APUR :=   'BA049999';
                       DESCR_COMPL_AJ:= 'ICMS CALCULADO POR RECEITA BRUTA  - 4%';
                       VL_AJ_APUR := valorTotalICMS  - (valorICMSReduzido + valorICMSReduzidoOutrosEstados);
                      { PRO CEARA
                       COD_AJ_APUR := 'CE030004';
                        DESCR_COMPL_AJ:= 'AJUSTE FEITO MEDIANTE TERMO DE ACORDO 54/2007 SEFAZ-CE';
                        VL_AJ_APUR := valorTotalICMS  - valorICMSReduzido - valorICMSReduzidoOutrosEstados;
                        }
                    end;
                end;



               with RegistroE116New do
                begin
                  COD_OR:='000';
                  VL_OR:= VL_ICMS_RECOLHER - DEB_ESP;
                  DT_VCTO:= edDataVencimento.Date;
                  COD_REC :='1';
                  NUM_PROC:='';
                  MES_REF := FormatDateTime('MMYYY',edDataInicial.Date);
                  IND_PROC:=opNenhum;
                  COD_REC :='0759';
                end;

             end;
         END;

      end;
   end;



   if ckbGerarInventario.Checked  then
    begin
       with sped.Bloco_H do
       begin
          with RegistroH001New do
          begin
             IND_MOV := imComDados;

             with RegistroH005New do
               begin
                  qryInventario.Active :=false;
                  qryInventario.SQL.Clear;
                  qryInventario.SQL.Add('  select sum(estoque_dinheiro) as total  from v_itens_estoque ');
                  qryInventario.Active := true;
                  DT_INV := edDataFinal.Date;
                  VL_INV := qryInventario.fieldbyname('total').Value;

                  qryInventario.Active :=false;
                  qryInventario.SQL.Clear;
                  qryInventario.SQL.Add('  select *  from v_itens_estoque ');
                  qryInventario.Active := true;
                  qryInventario.First;


                  while not qryInventario.Eof do
                  begin
                     with RegistroH010New do
                     begin
                        COD_ITEM := FormatFloat('00000', qryInventario.fieldbyname('cod_item').Value         );
                        UNID :=   qryInventario.fieldbyname('cod_un_entrada').Value;
                        QTD  :=   qryInventario.fieldbyname('estoque_total').Value;
                        VL_UNIT := qryInventario.fieldbyname('custo_unitario').Value;
                        VL_ITEM := qryInventario.fieldbyname('estoque_dinheiro').Value;
                        IND_PROP := piInformante;
                        COD_PART := '';
                        TXT_COMPL := '';
                        COD_CTA := '01';
                     end;
                     Application.ProcessMessages;
                     qryInventario.Next;
                  end;
               end;
            end;
       end;
    end;

{
   with sped.Bloco_1 do
   begin
      with Registro1001New  do
      begin
        IND_MOV := imSemDados;
      end;
   end;
}

   GerarBloco1;
   
   with sped.Bloco_9 do
   begin
      with Registro9001  do
      begin
        IND_MOV := imComDados;
      end;
   end;


   sped.WriteBloco_D;
   sped.writeBloco_E;
   sped.WriteBloco_H;
   sped.WriteBloco_1;
   sped.WriteBloco_9;


          LoadToMemo;

end;


procedure TFrmGerarSpedFiscal.gerarSintegra();
begin

  With sintegra do
   begin



   end;


end;





procedure TFrmGerarSpedFiscal.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmGerarSpedFiscal.BitBtn2Click(Sender: TObject);
begin
  inherited;
 sv.Execute;
if sv.FileName <> '' then
  begin
   if FilesExists(sv.FileName) then
   begin

    if (MessageBox(0, 'Arquivo já existe, deseja sobrescrevê-lo ?', 'Sobrescrever arquivo ?', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
      begin
       DeleteFile(sv.FileName);
       memoTXT.Lines.SaveToFile(sv.FileName);
       Showmessage(' Arquivo salvo com sucesso!');
      end;
   end
  else
    begin
       memoTXT.Lines.SaveToFile(sv.FileName);
       Showmessage(' Arquivo salvo com sucesso!');
    end;
  end;
end;

procedure TFrmGerarSpedFiscal.cal1Click(Sender: TObject);
var
 vec_icms : string;
begin
  inherited;



end;

procedure TFrmGerarSpedFiscal.FormActivate(Sender: TObject);
var
anoAtual :  integer;
i : integer;
begin
  inherited;

  anoAtual := CurrentYear;
  cbAno.Clear;
  for I := 0 to 10 do
     begin
       cbAno.Items.Add(IntToStr(anoAtual-i));
     end;
end;

procedure TFrmGerarSpedFiscal.gerarSpedFiscal();
begin
  inherited;
  GerarBloco0();
  GerarBlocoC();
  pnAguarde.Visible := false;
  dm.exibe_painel_erro('Escrituraçaõ gerada com sucesso!'+#13#10#13#10+'Nº de linhas: '+inttostr(memoTXT.Lines.count),'OK');

end;

procedure TFrmGerarSpedFiscal.tmAguardeTimer(Sender: TObject);
begin
  inherited;
  AdvCircularProgress1.Position := AdvCircularProgress1.Position +1;
  tmAguarde.Enabled := True;
end;

end.
