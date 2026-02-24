unit uuGerarEFDPisCofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ComCtrls, Buttons, Mask,  ibquery,
  jpeg, ExtCtrls, ACBrSpedPisCofins,ACBrEPCBlocos,ACBrUtil,
  ACBrTXTClass,
    ACBrEPCBloco_0, ACBrEPCBloco_1
, ACBrEPCBloco_A, ACBrEPCBloco_C, ACBrEPCBloco_D, ACBrEPCBloco_F
, ACBrEPCBloco_M;


type
  TfrmGerarEFDPisCofins = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDataInicial: TDateEdit;
    edDataFinal: TDateEdit;
    edDataVencimento: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    memoTXT: TMemo;
    Panel3: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    memoError: TMemo;
    BitBtn3: TBitBtn;
    efd: TACBrSPEDPisCofins;

    procedure LoadToMemo;
    procedure GeraBloco0();
    procedure GerarBlocoF();
    procedure BitBtn1Click(Sender: TObject);



  private
    { Private declarations }
     qryParametros : Tibquery;
     qryREGF550 : TIBQuery;
  public
    { Public declarations }
  end;

var
  frmGerarEFDPisCofins: TfrmGerarEFDPisCofins;

implementation

uses DateUtils, uu_data_module;

{$R *.dfm}


procedure TfrmGerarEFDPisCofins.GeraBloco0();
begin
   with efd do
   begin
    DT_INI := edDataInicial.Date;
    DT_FIN := edDataFinal.Date;
    LinhasBuffer:= StrToIntDef('10000',0);
    IniciaGeracao;
   end;




   with efd.Bloco_0 do
   begin
      // Dados da Empresa
      with Registro0000New do
      begin
        COD_VER          := vlVersao101;
        TIPO_ESCRIT      := tpEscrOriginal;
        IND_SIT_ESP      := indSitAbertura;
        NUM_REC_ANTERIOR := '';
        NOME             := qryParametros.fieldbyname('razao_social').value;
        CNPJ             := qryParametros.fieldbyname('CNPJ').value;
        UF               := qryParametros.fieldbyname('UF').value;
        COD_MUN          := qryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
        SUFRAMA          := '';
        IND_NAT_PJ       := indNatPJSocEmpresariaGeral;
        IND_ATIV         := indAtivIndustrial;

        with Registro0001New do
        begin
           IND_MOV := imComDados;

           // FILHO - Dados do contador.
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

           // FILHO - Regime de Apuração
           with Registro0110New do
           begin
              COD_INC_TRIB  := codEscrOpIncNaoCumulativo;
//              IND_APRO_CRED := indMetodoApropriacaoDireta;
              COD_TIPO_CONT := codIndTipoConExclAliqBasica;
             //Campo IND_REG_CUM apenas para Lucro Presumido e (COD_INC_TRIB = 2)
             //IND_REG_CUM := 2;


           end;


           //0140 - Tabela de Cadastro de Estabelecimento
//           for int0140 := 1 to 2 do
//           begin
           // FILHO
              with Registro0140New do
              begin
                 COD_EST := '1';
                 NOME    := qryParametros.fieldbyname('razao_social').value;
                 CNPJ    := qryParametros.fieldbyname('CNPJ').value;
                 UF      := qryParametros.fieldbyname('UF').value;
                 IE      := qryParametros.fieldbyname('IE').value;
                 COD_MUN := qryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
                 IM      := '';
                 SUFRAMA := '';

                 {
                 // 10 Clientes por estabelecimento
                 for int0150 := 1 to 10 do
                 begin
                    //0150 - Tabela de Cadastro do Participante
                    with Registro0150New do
                    begin
                       COD_PART := IntToStr(int0150);
                       NOME     := 'NOME DO CLIENTE '+ IntToStr(int0150);
                       COD_PAIS := '1058';
                       CNPJ     := '';
                       CPF      := '12345678909';
                       IE       := '';
                       COD_MUN  := 3200607;
                       SUFRAMA  := '';
                       ENDERECO := 'ENDERECO DO CLIENTE '+ IntToStr(int0150);
                       NUM      := IntToStr(int0150);
                       COMPL    := 'COMPLEMENTO DO CLIENTE '+ IntToStr(int0150);
                       BAIRRO   := 'BAIRRO';
                       //
                    end;
                 end;
                  }


                 {
                 // 0190 - Identificação das Unidades de Medida
                 for int0190 := Low(strUNID) to High(strUNID) do
                 begin
                    with Registro0190New do
                    begin
                       UNID  := strUNID[int0190];
                       DESCR := 'Descricao ' + strUNID[int0190];
                    end;
                 end;
                  }

                 {
                 //10 produtos/serviços
                 for int0200 := 1 to 10 do
                 begin
                    // 0200 - Tabela de Identificação do Item (Produtos e Serviços)
                    with Registro0200New do
                    begin
                       COD_ITEM     := FormatFloat('000000', int0200);
                       DESCR_ITEM   := 'DESCRIÇÃO DO ITEM';
                       COD_BARRA    := '';
                       COD_ANT_ITEM := '';
                       UNID_INV     := strUNID[int0200 mod (High(strUNID))];
                       TIPO_ITEM    := tiMercadoriaRevenda;
                       COD_NCM      := '12345678';
                       EX_IPI       := '';
                       COD_GEN      := '';
                       COD_LST      := '';
                       ALIQ_ICMS    := 0;

                      //Cria uma alteração apenas para o item 5...
                      if (int0200 = 5) then with Registro0205New do
                      begin
                        DESCR_ANT_ITEM := 'DESCRIÇÃO ANTERIOR DO ITEM 5';
                        DT_INI := StrToDate('01/04/2011');
                        DT_FIM := StrToDate('15/04/2011'); //Observe que o campo é DT_FIM e não DT_FIN
                      end;
                    end;
                 end;
                }

              end;
//           end;


           {
           // FILHO - REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
           with Registro0500New do
           begin
             DT_ALT := StrToDate('01/04/2011');
             COD_NAT_CC := ncgAtivo;
             IND_CTA := indCTASintetica;
             NIVEL := '0';
             COD_CTA := '01';
             NOME_CTA := 'NOME CTA';
             COD_CTA_REF := '0';
             CNPJ_EST := '33333333000191';
           end;
           }
        end;
      end;
   end;

   LoadToMemo();

end;

procedure TfrmGerarEFDPisCofins.GerarBlocoF();
begin

   with efd.Bloco_F do
   begin
      with RegistroF001New do
      begin
        IND_MOV := imComDados;


        with RegistroF010New do
        begin
           CNPJ :=  qryParametros.fieldbyname('CNPJ').value;

           qryREGF550.Active := false;
           qryREGF550.SQL.Clear;
           qryREGF550.SQL.add(' select * from  r_efd_pis_cofins_f550('+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' , '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date))+')');
           qryREGF550.Active := true;
           qryREGF550.First;
                                     
           while not qryREGF550.Eof do
            begin
               with RegistroF550New  do
               begin
                 VL_REC_COMP := qryREGF550.fieldbyname('TOTAL_FATURADO').Value;
                 CST_PIS     := qryREGF550.fieldbyname('CST_PIS_COFINS').Value;
                 CST_COFINS  := qryREGF550.fieldbyname('CST_PIS_COFINS').Value;
                 CFOP        := qryREGF550.fieldbyname('CFOP').Value;
                 COD_MOD     := qryREGF550.fieldbyname('MODELO_DOC').Value;

                 // PIS
                 if  qryREGF550.fieldbyname('ALIQ_PIS').Value > 0 then
                    begin
                      VL_DESC_PIS := 0;
                      VL_BC_PIS :=  qryREGF550.fieldbyname('TOTAL_FATURADO').Value;
                      ALIQ_PIS  :=  qryREGF550.fieldbyname('ALIQ_PIS').Value;
                      VL_PIS    :=  qryREGF550.fieldbyname('TOTAL_PIS').Value;
                    end
                 else
                   begin
                     VL_DESC_PIS := qryREGF550.fieldbyname('TOTAL_FATURADO').Value;
                      VL_BC_PIS :=  0;
                      ALIQ_PIS  :=  0;
                      VL_PIS    :=  0;
                   end;

             // COFINS

                 if  qryREGF550.fieldbyname('ALIQ_COFINS').Value > 0 then
                    begin
                      VL_DESC_COFINS := 0;
                      VL_BC_COFINS :=  qryREGF550.fieldbyname('TOTAL_FATURADO').Value;
                      ALIQ_COFINS  :=  qryREGF550.fieldbyname('ALIQ_COFINS').Value;
                      VL_COFINS    :=  qryREGF550.fieldbyname('TOTAL_COFINS').Value;
                    end
                 else
                   begin
                     VL_DESC_COFINS := qryREGF550.fieldbyname('TOTAL_FATURADO').Value;
                      VL_BC_COFINS :=  0;
                      ALIQ_COFINS  :=  0;
                      VL_COFINS    :=  0;
                   end;
               end;
               qryREGF550.Next;
            end;
        end;
      end;
   end;
   LoadToMemo;
end;


procedure TfrmGerarEFDPisCofins.LoadToMemo;
begin
   memoTXT .Lines.Clear;
   if FileExists( efd.Path + efd.Arquivo ) then
      memoTXT  .Lines.LoadFromFile( efd.Path + efd.Arquivo);
end;


procedure TfrmGerarEFDPisCofins.BitBtn1Click(Sender: TObject);
begin
  inherited;

  qryParametros := TIBQuery.Create(self);
  qryParametros.Database := dm.dbrestaurante;
  qryParametros.Transaction := dm.transacao;
  qryParametros.Active:=false;
  qryParametros.SQL.clear;
  qryParametros.SQL.Add('select * from parametros');
  qryParametros.Active:=true;

  qryREGF550 := TIBQuery.Create(self);
  qryREGF550.Database := dm.dbrestaurante;
  qryREGF550.Transaction := dm.transacao;
  qryREGF550.Active:=false;
  qryREGF550.SQL.clear;


end;

end.
