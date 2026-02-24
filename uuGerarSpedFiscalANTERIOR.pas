unit uuGerarSpedFiscalANTERIOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask,  ExtCtrls, Buttons,
  ACBrSpedFiscal,ibx.ibquery,ACBrEFDBlocos,ACBrUtil,ACBrTXTClass, jpeg,
  ComCtrls;

type
  TfrmGerarSpedFiscal = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    sped: TACBrSPEDFiscal;
    GroupBox1: TGroupBox;
    edDataInicial: TDateEdit;
    Label1: TLabel;
    edDataFinal: TDateEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edDataVencimento: TDateEdit;
    Label3: TLabel;
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
    procedure  LoadToMemo;
    procedure  GerarBloco0;
    procedure  GerarBlocoC;


    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarSpedFiscal: TfrmGerarSpedFiscal;

implementation

uses DateUtils, uu_data_module, ACBrEFDBloco_0, ACBrEFDBloco_0_Class,
  ACBrEFDBloco_C_Class, ACBrEFDBloco_C, DB, ACBrEFDBloco_H_Class,
  ACBrEFDBloco_E_Class, ACBrEFDBloco_1_Class, ACBrEFDBloco_9_Class,
  ACBrEFDBloco_E, uu_frm_principal, ACBrEFDBloco_H, ACBrEFDBloco_D_Class,
  ACBrEFDBloco_D;

{$R *.dfm}

procedure TfrmGerarSpedFiscal.GerarBloco0;
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


   // Início da geração do bloco 0
   with sped.Bloco_0 do
    begin
      // Dados da Empresa
      with Registro0000New do
       begin
//         COD_VER    := vlVersao102;
         COD_VER    := vlVersao102;
         COD_FIN    := raSubstituto;
         NOME       := qryParametros.fieldbyname('razao_social').value;
         CNPJ       := qryParametros.fieldbyname('CNPJ').value;
//         CPF        := '00000000000'; // Deve ser uma informação valida
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
            EMAIL      := 'flavio@torredepizza.com.br';
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
            EMAIL      := '';
            COD_MUN    := qryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
         end;


         qryParticipantes.Active:=false;
         qryParticipantes.SQL.Clear;
         qryParticipantes.SQL.add(' select udf_strzero(f.cod_fornecedor,4) as codigo,c.cod_ibge as cod_ibge,  ');
         qryParticipantes.SQL.add('  f.* ');
         qryParticipantes.SQL.add('  from  fornecedor f');
         qryParticipantes.SQL.add('  inner join cidade c on (c.cod_cidade = f.cod_cidade)');
         qryParticipantes.sql.add('where f.cod_fornecedor in ( select et.cod_fornecedor  from entradas et where et.data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')');
         qryParticipantes.sql.add(' or f.cod_fornecedor in ( select s.cod_fornecedor  from saidas s where s.data_saida between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')');
         qryParticipantes.sql.add(' or f.cod_fornecedor in ( select nt.cod_fornecedor  from notas_transporte nt where nt.data_servico  between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')');




         qryParticipantes.Active:=true;
         qryParticipantes.first;

         frm_principal.memo_avisos.Visible:=true;

         while not qryParticipantes.eof do
          begin
            with Registro0150New do
             begin
               frm_principal.memo_avisos.Visible:=true;
               frm_principal.memo_avisos.Lines.Add(qryParticipantes.fieldbyname('codigo').value);



               COD_PART := qryParticipantes.fieldbyname('codigo').value;
               NOME     := qryParticipantes.fieldbyname('razao_social').value;
               COD_PAIS := '1058';
               if Length(trim(qryParticipantes.fieldbyname('cgc_cpf').value) ) = 14 then
                  CNPJ     := qryParticipantes.fieldbyname('cgc_cpf').value
               else
                  CPF      := qryParticipantes.fieldbyname('cgc_cpf').value;

               IF ((qryParticipantes.fieldbyname('inscricao_estadual').value = Null) or (qryParticipantes.fieldbyname('inscricao_estadual').value = '') ) then
                 IE:=''
               ELSE
                 IE:= qryParticipantes.fieldbyname('inscricao_estadual').value;

                 



               try
                COD_MUN  := qryParticipantes.fieldbyname('cod_ibge').value;
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
            qryParticipantes.Next;
          end;

          // Pega as unidades envolvidas nas compras

          qryParticipantes.SQL.Clear;

          if ckbGerarInventario.Checked  then
            qryParticipantes.sql.add('select distinct cod_unidade,sigla from r_unidades_sped('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',1)')
          else
            qryParticipantes.sql.add('select distinct cod_unidade,sigla from r_unidades_sped('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',0)');

          qryParticipantes.Active:=true;
          memoError.Lines := qryParticipantes.sql;
          qryParticipantes.First;


          while not qryParticipantes.eof do
           begin

             with Registro0190New do
               begin
                 UNID  := qryParticipantes.fieldbyname('cod_unidade').value;
                 DESCR := qryParticipantes.fieldbyname('sigla').value;
               end;

             qryParticipantes.Next;
           end;

           // Cadastro de ítens - Matérias-primas

          qryParticipantes.active:=false;
          qryParticipantes.sql.clear;

          if ckbGerarInventario.Checked  then
            qryParticipantes .SQL.Add('select  distinct codigo,descricao,cod_unidade,tipo  from r_sped_reg0200('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',1)')
          else
            qryParticipantes .SQL.Add('select distinct codigo,descricao,cod_unidade,tipo   from r_sped_reg0200('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+',0)');

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
                 COD_NCM := '';
                 EX_IPI := '';
                 COD_GEN :='';
                 COD_LST := '';
                 ALIQ_ICMS:= 0;
              end;

             qryParticipantes.Next;
           end;
       end;
    end;




   sped.WriteBloco_0;
   LoadToMemo;
end;




procedure TfrmGerarSpedFiscal.LoadToMemo;
begin
   memoTXT .Lines.Clear;
   if FileExists( sped.Path + sped.Arquivo ) then
      memoTXT  .Lines.LoadFromFile(sped.Path + sped.Arquivo);
end;


procedure TfrmGerarSpedFiscal.BitBtn1Click(Sender: TObject);
begin
  inherited;
  memoTXT.Clear;
  GerarBloco0();
  GerarBlocoC();
  dm.exibe_painel_erro('Escrituraçaõ gerada com sucesso!'+#13#10#13#10+'Nº de linhas: '+inttostr(memoTXT.Lines.count),'OK');


end;



procedure TfrmGerarSpedFiscal.GerarBlocoC;
var
 qryEntradas : Tibquery;
 qrySaidas : Tibquery;
 qryItensEntradas : Tibquery;
 qryItensSaidas : Tibquery;
 bufferNotas : integer;
 contador : integer;
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


 qryNotasTransporte : TIBQuery;

 qryInventario : TIBQuery;


begin
  inherited;

   valorTotalBaseICMSOutrosEstados :=0;
   valorTotalICMSOutrosEstados :=0;



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


    qryRegistros60A   := TIBQuery.Create(self);
    qryRegistros60A.Database := dm.dbrestaurante;
    qryRegistros60A.Transaction := dm.transacao;
    qryRegistros60A.Active:=false;

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




    with sped.Bloco_C do
     begin
       with RegistroC001New do
        begin
          IND_MOV := imComDados;

          /// Notas fiscais de entrada - Gerais
          qryEntradas.Active:=false;
          qryEntradas.sql.clear;
          qryEntradas.sql.add('      select udf_strzero(e.cod_fornecedor,4) as CodFornecedor, e.* from entradas e where data_entrada between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
          qryEntradas.sql.add('    order by cod_entrada ');
          qryEntradas.active:=true;
          qryEntradas.first;
          contador:=0;


          while not qryEntradas.eof do
           begin

          if qryEntradas.fieldbyname('numero_nota').Value = '000000000073975' then
           begin
             showmessage('Agora');
           end;


              With RegistroC100New do
               begin
                 COD_PART      := qryEntradas.fieldbyname('codFornecedor').Value;
                 IND_EMIT      := edTerceiros;
                 IND_OPER      := tpEntradaAquisicao;
                 COD_MOD       := qryEntradas.fieldbyname('modelo_nota').Value;
                 COD_SIT       := sdRegular;
                 SER           := '';
                 NUM_DOC       := formatFloat('000000000',StrToFloat(qryEntradas.fieldbyname('numero_nota').Value));
                 CHV_NFE       := '';
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
                          CST_IPI       := ipiEntradaIsenta;
                          COD_ENQ       := '';
                          VL_BC_IPI     := 0;
                          ALIQ_IPI      := 0;
                          VL_IPI        := 0;
                          CST_PIS       := pisOutrasOperacoes;
                          VL_BC_PIS     := 0;
                          ALIQ_PIS_PERC := 0;
                          QUANT_BC_PIS  := 0;
                          ALIQ_PIS_R    := 0;
                          VL_PIS        := 0;
                          CST_COFINS    := cofinsOutrasOperacoes;
                          VL_BC_COFINS  := 0;
                          ALIQ_COFINS_PERC := 0;
                          QUANT_BC_COFINS  := 0;
                          ALIQ_COFINS_R    := 0;
                          VL_COFINS        := 0;
                          COD_CTA          := '';
                        end;
                      qryItensEntradas.Next;
                    end;

                 // Registro C190

//                 IF qryEntradas.fieldbyname('cod_entrada').Value= '00000707' THEN
//                   begin
//                     showmessage('');
//                   end;

                 qryItensEntradas.Active:=false;
                 qryItensEntradas.sql.clear;
                 qryItensEntradas.sql.add('   select sum( (ite.quantidade * ite.valor_unitario) + ite.valor_ipi + ite.outras_despesas - ite.desconto) as total,ite.cfop,ite.cst from itens_entrada ite');
//                 qryItensEntradas.sql.add(' inner join entradas en on (en.cod_entrada = ite.cod_entrada)');
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
              qryEntradas.Next;
           end;



// inicio do novo bloco de notas de saída


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


                 COD_PART      := qrySaidas.fieldbyname('codFornecedor').Value;
                 IND_EMIT      := edEmissaoPropria;
                 IND_OPER      := tpSaidaPrestacao;
                 COD_MOD       := qrySaidas.fieldbyname('modelo_nota').Value;
                 COD_SIT       := sdRegular;
                 SER           := '';
                 NUM_DOC       := formatFloat('000000000',StrToFloat(qrySaidas.fieldbyname('numero_nota').Value));
                 CHV_NFE       := '';
                 DT_DOC        := qrySaidas.fieldbyname('data_emissao').Value;
                 DT_E_S        := qrySaidas.fieldbyname('data_saida').Value;
                 VL_DOC        := qrySaidas.fieldbyname('total_nota').Value;
                 IND_PGTO      := tpPrazo;
                 VL_DESC       := qrySaidas.fieldbyname('desconto').Value;
                 VL_ABAT_NT    := 0;  // Não tenho esse campo nas NFS
                 VL_MERC       := qrySaidas.fieldbyname('valor_produtos').Value;
                 IND_FRT       :=  tfSemCobrancaFrete;
{                 case qrySaidas.fieldbyname('pagto_frete').Value of
                  0: IND_FRT       := tfSemCobrancaFrete;
                  1: IND_FRT       := tfPorContaEmitente;
                  2: IND_FRT       := tfPorContaDestinatario;
                 end;
 }
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
                          CST_IPI       := ipiSaidaIsenta;
                          COD_ENQ       := '';
                          VL_BC_IPI     := 0;
                          ALIQ_IPI      := 0;
                          VL_IPI        := 0;
                          CST_PIS       := pisOutrasOperacoes;
                          VL_BC_PIS     := 0;
                          ALIQ_PIS_PERC := 0;
                          QUANT_BC_PIS  := 0;
                          ALIQ_PIS_R    := 0;
                          VL_PIS        := 0;
                          CST_COFINS    := cofinsOutrasOperacoes;
                          VL_BC_COFINS  := 0;
                          ALIQ_COFINS_PERC := 0;
                          QUANT_BC_COFINS  := 0;
                          ALIQ_COFINS_R    := 0;
                          VL_COFINS        := 0;
                          COD_CTA          := '';
                        end;
                      qryItensSaidas.Next;
                    end;

                 // Registro C190

                 qryItensSaidas.Active:=false;
                 qryItensSaidas.sql.clear;
                 qryItensSaidas.sql.add('   select sum( (ite.quantidade * ite.valor_unitario) + ite.valor_ipi + ite.outras_despesas - ite.desconto) as total,');
                 qryItensSaidas.SQL.add('    sum(ite.base_icms) as total_base,ite.cfop,ite.cst,ite.aliquota_icms from itens_saida ite');
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
                          VL_RED_BC     := 0;
                          VL_IPI        := 0;
                          COD_OBS       := '';
                        end;
                      qryItensSaidas.Next;
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
              qrySaidas.Next;
           end;





             // Notas fiscais de venda ao consumidor

             qryResumoNotasConsumidor.Active:=false;
             qryResumoNotasConsumidor.sql.clear;
             qryResumoNotasConsumidor.sql.add(' select  * from r_sped_regc300('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')');
             qryResumoNotasConsumidor.Active:=true;
             qryResumoNotasConsumidor.First;

            while not qryResumoNotasConsumidor.Eof do
             begin
               with RegistroC300New do
                begin
                  COD_MOD:='02';
                  SER :=   qryResumoNotasConsumidor.fieldbyname('SERIE').Value;
                  SUB :=   qryResumoNotasConsumidor.fieldbyname('SUB_SERIE').Value;
                  NUM_DOC_INI :=   qryResumoNotasConsumidor.fieldbyname('NUM_DOC_INICIAL').Value;
                  NUM_DOC_FIN :=   qryResumoNotasConsumidor.fieldbyname('NUM_DOC_FINAL').Value;
                  DT_DOC :=   qryResumoNotasConsumidor.fieldbyname('DATA').Value;
                  VL_DOC :=    qryResumoNotasConsumidor.fieldbyname('TOTAL').Value;
                  VL_PIS :=0;
                  VL_COFINS :=0;

                  qryNotasConsumidor.Active:= false;
                  qryNotasConsumidor.sql.clear;
                  qryNotasConsumidor.sql.add(' select * from notas_consumidor where data_doc='+Quotedstr(FormatDateTime('DD.MM.YYY',qryResumoNotasConsumidor.fieldbyname('DATA').Value))+' and cancelado=1');
                  qryNotasConsumidor.Active:=true;
                  qryNotasConsumidor.first;

                  while not qryNotasConsumidor.Eof do
                   begin
                     With RegistroC310New do
                      begin
                       NUM_DOC_CANC := qryNotasConsumidor.fieldbyname('numero_nota').value;
                      end;
                      qryNotasConsumidor.Next;
                   end;
{

                  qryNotasConsumidor.Active:= false;
                  qryNotasConsumidor.sql.clear;
                  qryNotasConsumidor.sql.add('select  sum(r.total) as total , sum(r.valor_icms) as valor_icms from  r_sped_regc300('+Quotedstr(FormatDateTime('DD.MM.YYY',qryResumoNotasConsumidor.fieldbyname('DATA').Value))+','+Quotedstr(FormatDateTime('DD.MM.YYY',qryResumoNotasConsumidor.fieldbyname('DATA').Value))+') r');
                  qryNotasConsumidor.Active:=true;
                  qryNotasConsumidor.first;

 }
                  qryNotasConsumidor.Active:= false;
                  qryNotasConsumidor.sql.clear;
                  qryNotasConsumidor.sql.add(' select nc.cfop,nc.cst_icms,nc.aliq_icms,sum(valor_doc)as valor_operacoes,sum(nc.base_icms) as base_icms ,sum(nc.valor_icms) as valor_icms  from notas_consumidor nc');
                  qryNotasConsumidor.sql.add('    where nc.cancelado <> 1');
                  qryNotasConsumidor.sql.add('    and valor_doc <> 0');
                  qryNotasConsumidor.sql.add('    and nc.data_doc='+Quotedstr(FormatDateTime('DD.MM.YYY',qryResumoNotasConsumidor.fieldbyname('DATA').Value)));
                  qryNotasConsumidor.sql.add('    group by nc.cfop,nc.cst_icms,nc.aliq_icms');

                  qryNotasConsumidor.Active:=true;
                  qryNotasConsumidor.first;

                  while not qryNotasConsumidor.Eof do
                   begin
                     With RegistroC320New  do
                      begin

                        valorTotalBaseICMS := valorTotalBaseICMS + qryNotasConsumidor.fieldbyname('base_icms').Value;
                        valorTotalICMS :=  valorTotalICMS + qryNotasConsumidor.fieldbyname('valor_icms').Value;

                        CST_ICMS:=  qryNotasConsumidor.fieldbyname('CST_ICMS').Value;
                        CFOP :=     qryNotasConsumidor.fieldbyname('CFOP').Value;
                        ALIQ_ICMS:= qryNotasConsumidor.fieldbyname('aliq_icms').Value;
                        VL_OPR := qryNotasConsumidor.fieldbyname('valor_operacoes').Value;
                        VL_BC_ICMS := qryNotasConsumidor.fieldbyname('BASE_ICMS').Value;
                        VL_ICMS := qryNotasConsumidor.fieldbyname('valor_icms').Value;
                        VL_RED_BC:= 0;

                        //////////////////////////////
                        if (qryNotasConsumidor.fieldbyname('valor_operacoes').Value  > 0) then
                         begin
                           qryProdutosNotasConsumidor.Active:=false;
                           qryProdutosNotasConsumidor.sql.clear;
                           qryProdutosNotasConsumidor.sql.add('select * from r_sped_regc321('+Quotedstr(FormatDateTime('DD.MM.YYY',qryResumoNotasConsumidor.fieldbyname('DATA').Value))+')');
                           qryProdutosNotasConsumidor.SQL.Add(' where CFOP='+Quotedstr(qryNotasConsumidor.fieldbyname('CFOP').Value));
                           qryProdutosNotasConsumidor.SQL.Add(' and  CST='+Quotedstr(qryNotasConsumidor.fieldbyname('CST_ICMS').Value));
                           qryProdutosNotasConsumidor.SQL.Add(' and  aliquota='+dm.TrocaVirgPPto(FormatFloat('#0.00',qryNotasConsumidor.fieldbyname('aliq_icms').Value)));
{                           frm_principal.memo_avisos.Lines := qryProdutosNotasConsumidor.SQL;
                           frm_principal.memo_avisos.Visible :=true;
                           exit;                                   }
                           qryProdutosNotasConsumidor.Active:=true;
                           qryProdutosNotasConsumidor.First;

                           while not qryProdutosNotasConsumidor.eof do
                            begin
                              With RegistroC321New do
                                begin
                                 COD_ITEM := qryProdutosNotasConsumidor.fieldbyname('cod_produto').Value;
                                 QTD := qryProdutosNotasConsumidor.fieldbyname('quantidade').Value;
                                 UNID :=  qryProdutosNotasConsumidor.fieldbyname('cod_unidade').Value;
                                 VL_ITEM := qryProdutosNotasConsumidor.fieldbyname('total').Value;
                                 VL_DESC:=0;
                                 VL_BC_ICMS := qryProdutosNotasConsumidor.fieldbyname('BASE_ICMS').Value;
                                 VL_ICMS:= qryProdutosNotasConsumidor.fieldbyname('valor_icms').Value;
                                 VL_PIS :=0;
                                 VL_COFINS :=0;
                                end;
                               qryProdutosNotasConsumidor.Next;
                            end;
                         end;

                        //////////////////////////////

                      end;
                      qryNotasConsumidor.Next;
                   end;

                end;
                 qryResumoNotasConsumidor.next;
             end;





           // Registro das impressoras fiscais
             qryEntradas.Active:=false;
             qryEntradas.sql.clear;
             qryEntradas.sql.add('select * from impressoras_fiscais');
             qryEntradas.Active:=true;
             qryEntradas.first;

             while not qryEntradas.Eof do
              begin
                with RegistroC400New do
                begin
                  COD_MOD   := '2D';
                  ECF_MOD   := qryEntradas.fieldbyname('descricao').value;
                  ECF_FAB   := qryEntradas.fieldbyname('NUM_SERIE').value;
                  ECF_CX    := qryEntradas.fieldbyname('numordem').value;


                  qryItensEntradas.Active:=false;
                  qryItensEntradas.sql.clear;
                  qryItensEntradas.sql.add('select * from reg60M where data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+' order by data');
                  qryItensEntradas.Active:=true;
                  qryItensEntradas.First;

                  while not qryItensEntradas.Eof do
                    begin
                      with RegistroC405New do
                        begin
                          DT_DOC         := qryItensEntradas.fieldbyname('data').Value;
                          CRO            := StrToInt(qryItensEntradas.fieldbyname('co_rein_op').Value);
                          CRZ            := StrToInt(qryItensEntradas.fieldbyname('cont_z').Value);
                          NUM_COO_FIN    := StrToInt(qryItensEntradas.fieldbyname('coo_fim').Value);
                          GT_FIN         := qryItensEntradas.fieldbyname('tot_geral').Value;
                          VL_BRT         := qryItensEntradas.fieldbyname('venda_bruta').Value;


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
                             qryRegistros60A.SQL.Add('select valor_acumulado as valor_ac, ra.* from reg60a ra where data= '+Quotedstr(FormatDateTime('DD.MM.YYY',qryItensEntradas.fieldbyname('data').Value)));
                             qryRegistros60A.Active:=true;
                             qryRegistros60A.First;

                             while not qryRegistros60A.Eof do
                              begin
                               if StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) > 0 then
                                begin

                                  with RegistroC420New do
                                   begin
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='1700' then cod_totalizador :='T1700';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='2700' then cod_totalizador :='T2700';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='CANC' then cod_totalizador :='Can-T';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='DESC' then cod_totalizador :='DT';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='ACRE' then cod_totalizador :='AT';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='F' then cod_totalizador :='F1';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='I' then cod_totalizador :='I1';
                                        if trim(qryRegistros60A.FieldByName('aliquota').Value) ='N' then cod_totalizador :='N1';

                                        if((cod_totalizador='T1700') or (cod_totalizador='T2700')) then
                                         begin
                                          NR_TOT:=1;
                                          DESCR_NR_TOT:='1';
                                         end;
                                        COD_TOT_PAR  := cod_totalizador ;
                                        VLR_ACUM_TOT := qryRegistros60A.fieldbyname('valor_ac').Value;

                                          // descomentar esse bloco para os demais estados, na Bahia o C425 é dispensado.


                                        // Gera C425 apenas para totalizadores válidos (alíquotas, substituições e isenções



                                        if((cod_totalizador='T1700') or (cod_totalizador='T2700') or (cod_totalizador='F1') or (cod_totalizador='N1') or  (cod_totalizador='I1') ) then
                                        begin
                                         qryProdutosVendidosDia.Active:=false;
                                          qryProdutosVendidosDia.SQL.clear;
                                          qryProdutosVendidosDia.sql.add('   select mv.cod_produto,al.sped,sum(mv.quantidade) as quantidade ,sum(mv.valor_unitario * mv.quantidade) as total from ');
                                          qryProdutosVendidosDia.sql.add('       movimento_venda mv ');
                                          qryProdutosVendidosDia.sql.add('       inner join aliquotas al on (al.cod_aliquota = mv.cod_aliquota) ');
                                          qryProdutosVendidosDia.sql.add('       where al.sped='+Quotedstr(cod_totalizador));
                                          qryProdutosVendidosDia.sql.add('     and data='+Quotedstr(FormatDateTime('DD.MM.YYY',qryItensEntradas.fieldbyname('data').Value)));
                                          qryProdutosVendidosDia.sql.add('     group by mv.cod_produto,al.sped ');
                                          qryProdutosVendidosDia.Active:=true;
                                          qryProdutosVendidosDia.First;

                                          while not qryProdutosVendidosDia.Eof do
                                           begin
                                             With RegistroC425New do
                                               begin
                                                 COD_ITEM :=  qryProdutosVendidosDia.fieldbyname('cod_produto').value;
                                                 QTD  := qryProdutosVendidosDia.fieldbyname('quantidade').value;
                                                 UNID := '10';
                                                 VL_ITEM := qryProdutosVendidosDia.fieldbyname('TOTAL').value;
                                                 VL_PIS:=0;
                                                 VL_COFINS :=0;
                                                 qryProdutosVendidosDia.Next
                                               end;
                                           end;
                                        end;

                                   end;
                                end;
                                qryRegistros60A.Next
                              end;


                             qryRegistros60A.Active :=false;
                             qryRegistros60A.SQL.clear;
                             qryRegistros60A.SQL.Add('select valor_acumulado  as valor_ac, ra.* from reg60a ra where data= '+Quotedstr(FormatDateTime('DD.MM.YYY',qryItensEntradas.fieldbyname('data').Value)));
                             qryRegistros60A.sql.add(' and aliquota <>'+QuotedStr('CANC')+' and aliquota <>'+QuotedStr('DESC')+' and aliquota <>'+QuotedStr('ACRE'));
                             qryRegistros60A.Active:=true;
                             qryRegistros60A.First;

                             frm_principal.memo_avisos.Visible:=true;
                             frm_principal.memo_avisos.Lines:= qryRegistros60A.SQL;


                             while not qryRegistros60A.Eof do
                              begin
                                with RegistroC490New  do
                                 begin

                                    if ( (trim(qryRegistros60A.FieldByName('aliquota').Value) ='1700') ) then
                                      begin
                                        CST_ICMS:='000';
                                        CFOP:='5102';
                                        ALIQ_ICMS:=17.00;
                                        VL_OPR:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_BC_ICMS:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_ICMS:=(StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) * 0.17);
                                        valorTotalBaseICMS := valorTotalBaseICMS + VL_BC_ICMS;
                                        valorTotalICMS :=  valorTotalICMS + VL_ICMS;

                                      end;
                                    if trim(qryRegistros60A.FieldByName('aliquota').Value) ='2700' then
                                     begin
                                        CST_ICMS:='000';
                                        CFOP:='5102';
                                        ALIQ_ICMS:=27.00;
                                        VL_OPR:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_BC_ICMS:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_ICMS:=(StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) * 0.27);
                                        valorTotalBaseICMS := valorTotalBaseICMS + VL_BC_ICMS;
                                        valorTotalICMS :=  valorTotalICMS + VL_ICMS;

                                     end;

                                    if trim(qryRegistros60A.FieldByName('aliquota').Value) ='F' then
                                     begin
                                        //CST_ICMS  :='060';
                                        //CFOP:='5403';
//                                        ALIQ_ICMS:=0;
                                        CST_ICMS  :='000';
                                        CFOP:='5102';
                                        ALIQ_ICMS:=17;
                                        VL_OPR:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                     {
                                        // jeito certo descomenta isso e comenta o trecho de baixo
                                        VL_BC_ICMS:=0;
                                        VL_ICMS:=0;
                                        }

                                        //Descomentar a linha caso o valor substuído entre na base de cálculo
                                        VL_BC_ICMS:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_ICMS:=(StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) * 0.17);
                                        valorTotalBaseICMS := valorTotalBaseICMS + qryRegistros60A.fieldbyname('valor_ac').Value;
                                        valorTotalICMS :=  valorTotalICMS + VL_ICMS;
                                     end;

                                    if trim(qryRegistros60A.FieldByName('aliquota').Value) ='I' then
                                     begin

//                                      CST_ICMS  :='040';
  //                                    CFOP:='5102';
//                                      ALIQ_ICMS:=0;
                                        CST_ICMS  :='000';
                                        CFOP:='5102';
                                        ALIQ_ICMS:=17;
                                        VL_OPR:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                     {
                                        // jeito certo descomenta isso e comenta o trecho de baixo
                                        VL_BC_ICMS:=0;
                                        VL_ICMS:=0;
                                        }

                                        //Descomentar a linha caso o valor substuído entre na base de cálculo
                                        VL_BC_ICMS:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_ICMS:=(StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) * 0.17);
                                        valorTotalBaseICMS := valorTotalBaseICMS + qryRegistros60A.fieldbyname('valor_ac').Value;
                                        valorTotalICMS :=  valorTotalICMS + VL_ICMS;

                                     end;

                                    if trim(qryRegistros60A.FieldByName('aliquota').Value) ='N' then
                                     begin
//                                      CST_ICMS  :='041';
  //                                    CFOP:='5102';
//                                      ALIQ_ICMS:=0;
                                        CST_ICMS  :='000';
                                        CFOP:='5102';
                                        ALIQ_ICMS:=17;
                                        VL_OPR:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                     {
                                        // jeito certo descomenta isso e comenta o trecho de baixo
                                        VL_BC_ICMS:=0;
                                        VL_ICMS:=0;
                                        }

                                        //Descomentar a linha caso o valor substuído entre na base de cálculo
                                        VL_BC_ICMS:=StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value);
                                        VL_ICMS:=(StrToFloat(qryRegistros60A.fieldbyname('valor_ac').Value) * 0.17);
                                        valorTotalBaseICMS := valorTotalBaseICMS + qryRegistros60A.fieldbyname('valor_ac').Value;
                                        valorTotalICMS :=  valorTotalICMS + VL_ICMS;
                                     end;


                                 end;
                                qryRegistros60A.Next
                              end;
                            end;
                           end;

                        qryItensEntradas.Next;
                    end;

                end;
                qryEntradas.Next;
              end;

             //VALIDO APENAS PARA A BAHIA
             //INICIAR O REG 495 AQUI

         {
             qryEntradas.Active := false;
             qryEntradas.SQL.Clear;
             qryEntradas.SQL.Add('    select mv.cod_produto,al.sped,al.percentual_icms,  sum(mv.quantidade) as qtdItem ,sum(mv.quantidade * mv.valor_unitario) as baseICMS,(sum(mv.quantidade * mv.valor_unitario) * al.percentual_icms) as valorIcms  from movimento_venda mv');
             qryEntradas.SQL.Add('           inner join aliquotas al on (al.cod_aliquota = mv.cod_aliquota)');
             qryEntradas.sql.add('           where mv.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
             qryEntradas.SQL.Add('            group by mv.cod_produto,al.sped,al.percentual_icms');

             frm_principal.memo_avisos.Visible := true;
             frm_principal.memo_avisos.Lines := qryEntradas.SQL;


             qryEntradas.Active := true;

             qryEntradas.First;

             while not qryEntradas.Eof do
              begin
                with RegistroC495New  do
                  begin
                    ALIQ_ICMS   := qryEntradas.fieldbyname('percentual_icms').Value;
                    COD_ITEM    := qryEntradas.fieldbyname('cod_produto').Value;
                    QTD         := qryEntradas.fieldbyname('qtditem').Value;
                    QTD_CANC    := 0;
                    UNID        := '10';
                    VL_ITEM     := qryEntradas.fieldbyname('baseicms').Value;
                    VL_DESC     := 0;
                    VL_CANC     := 0;
                    VL_ACMO     := 0;
                    VL_BC_ICMS  := qryEntradas.fieldbyname('baseicms').Value;
                    VL_ICMS     := qryEntradas.fieldbyname('VALORICMS').Value;
                    VL_ISEN     :=0;
                    VL_NT       :=0;
                    VL_ICMS_ST  :=0;
                    qryEntradas.Next;
                  end;

              end;
              }


        end;

     end;

     sped.WriteBloco_C(true);


   with sped.Bloco_D do
   begin
      with RegistroD001New do
      begin
        qryNotasTransporte.Active := false;
        qryNotasTransporte.SQL.Clear;
        qryNotasTransporte.SQL.Add('select * from notas_transporte where data_servico between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
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

                   if COD_MOD ='57' then
                     TP_CT_e :=qryNotasTransporte.fieldbyname('tipo_cte').Value;

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
              valorBaseICMSReduzida := ( valorTotalBaseICMS * 0.206 ); // Parametrizar para o valor da redução da casa que houver  ceará (redução de 79.4% na base)
// bahia (torre)              valorBaseICMSReduzida := ( valorTotalBaseICMS * 0.2352945 ); // Aplica redução de 76,47055%
               valorICMSReduzido:= ( valorBaseICMSReduzida * 0.17 ); // Parametrizar para a aliquota utilizável no caso de outros estados.



               VL_TOT_DEBITOS := valorTotalICMS;
               VL_AJ_DEBITOS := 0;
               VL_TOT_AJ_DEBITOS := 0;
               VL_ESTORNOS_CRED := 0;
               VL_TOT_CREDITOS := 0;
               VL_AJ_CREDITOS := 0;
               VL_TOT_AJ_CREDITOS := 0;
//               VL_ESTORNOS_DEB := valorTotalICMS  - valorICMSReduzido;

               VL_SLD_CREDOR_ANT := 0;
               VL_SLD_APURADO :=    valorTotalICMS -  VL_ESTORNOS_DEB;
               VL_TOT_DED :=        valorTotalICMS  - valorICMSReduzido;
               VL_ICMS_RECOLHER :=  VL_SLD_APURADO - VL_ESTORNOS_DEB -VL_TOT_DED;
               VL_SLD_CREDOR_TRANSPORTAR := 0;
               DEB_ESP := 0;


               // para a bahia
               with RegistroE111New do
                begin
                 {
                   ///                 PARA A BAHIA
                 COD_AJ_APUR :=   'BA049999';
                 DESCR_COMPL_AJ:= 'ICMS CALCULADO POR RECEITA BRUTA  - 4%';
                 VL_AJ_APUR := valorTotalICMS  - valorICMSReduzido;

                 }
                  COD_AJ_APUR := 'CE030004';
                  DESCR_COMPL_AJ:= 'AJUSTE FEITO MEDIANTE TERMO DE ACORDO 54/2007 SEFAZ-CE';
                  VL_AJ_APUR := valorTotalICMS  - valorICMSReduzido;

                  {
                  WITH RegistroE112New DO
                   begin
                     NUM_PROC := 'XYZ';
                     PROC:=      'AJUSTE XYZ A VERIFICAR COM EDITH';
                     TXT_COMPL:= ''
                   end;

                  }
                end;

               with RegistroE116New do
                begin
                  COD_OR:='000';
                  VL_OR:= valorICMSReduzido;
                  DT_VCTO:= edDataVencimento.Date;
                  COD_REC :='1';
                  NUM_PROC:='';
                  //DESCOMENTAR PARA OS MESES SEGUINTES
                  //MES_REF := FormatDateTime('MMYYY',edDataInicial.Date);

                  IND_PROC:=opNenhum;
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
                     qryInventario.Next;
                  end;
               end;
            end;
       end;
    end;


   with sped.Bloco_1 do
   begin
      with Registro1001New  do
      begin
        IND_MOV := imSemDados;
      end;
   end;

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

procedure TfrmGerarSpedFiscal.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmGerarSpedFiscal.BitBtn2Click(Sender: TObject);
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

end.
