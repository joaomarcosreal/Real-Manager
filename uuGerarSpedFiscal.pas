unit uuGerarSpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uu_frm_principal, Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons,
  ACBrSpedFiscal, ibx.ibquery, ACBrEFDBlocos, ACBrUtil, jpeg, ComCtrls,
  ACBrSintegra, RxToolEdit, JvToolEdit, JvExMask, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, AdvGlassButton, JvBaseDlg,
  JvBrowseFolder, JvPageList, JvExControls, ACBrBase, Vcl.Mask, Vcl.Menus;

type
  TFrmGerarSpedFiscal = class(Tfrm_modelo_vazio)
    sped: TACBrSPEDFiscal;
    sv: TSaveDialog;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    tmAguarde: TTimer;
    sintegra: TACBrSintegra;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    folderDialog: TJvBrowseForFolderDialog;
    pgList: TJvPageList;
    pgPrincipal: TJvStandardPage;
    pgAguarde: TJvStandardPage;
    Panel2: TPanel;
    lbl1: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    cbVersaoArquivo: TComboBox;
    ckbGerarInventario: TCheckBox;
    rdTipoGeracao: TRadioGroup;
    ckb495: TCheckBox;
    edDataVencimento: TDateEdit;
    ckbSintegra: TCheckBox;
    edDataInicial: TJvDateEdit;
    edDataFinal: TJvDateEdit;
    Panel1: TPanel;
    lbAguarde: TLabel;
    pgArquivo: TProgressBar;
    Panel3: TPanel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    Label3: TLabel;
    procedure GerarBloco0;
    procedure GerarBloco1();
    procedure GerarBlocoC;
    procedure BitBtn2Click(Sender: TObject);
    procedure cal1Click(Sender: TObject);
    procedure gerarSintegra();
    procedure gerarSpedFiscal();
    procedure FormActivate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerarSpedFiscal: TFrmGerarSpedFiscal;

implementation

uses
  uu_data_module, ACBrEFDBloco_0, ACBrEFDBloco_0_Class, ACBrEFDBloco_C_Class,
  ACBrEFDBloco_C, DB, ACBrEFDBloco_H_Class, ACBrEFDBloco_E_Class,
  ACBrEFDBloco_1_Class, ACBrEFDBloco_9_Class, ACBrEFDBloco_E, ACBrEFDBloco_H,
  ACBrEFDBloco_D_Class, ACBrEFDBloco_D, ACBrEFDBloco_1, DateUtils;

{$R *.dfm}

procedure TFrmGerarSpedFiscal.GerarBloco0;
var
  LQryParametros: Tibquery;
  LQryParticipantes: Tibquery;
  LQryREG220: TIBQuery;
begin
  inherited;
  try
    try

      LQryParametros := TIBQuery.Create(self);
      LQryParametros.Database := dm.dbrestaurante;
      LQryParametros.Transaction := dm.transacao;
      LQryParametros.Active := false;
      LQryParametros.SQL.clear;
      LQryParametros.SQL.Add('select * from parametros');
      LQryParametros.Active := true;

      LQryParticipantes := TIBQuery.Create(self);
      LQryParticipantes.Database := dm.dbrestaurante;
      LQryParticipantes.Transaction := dm.transacao;
      LQryParticipantes.Active := false;

      LQryREG220 := TIBQuery.Create(self);
      LQryREG220.Database := dm.dbrestaurante;
      LQryREG220.Transaction := dm.transacao;
      LQryREG220.Active := false;

      with sped do
      begin
        DT_INI := edDataInicial.Date;
        DT_FIN := edDataFinal.Date;
        LinhasBuffer := StrToIntDef('10000', 0);
        IniciaGeracao;
      end;

  //Registro 10 SINTEGRA

      if ckbSintegra.Checked then
      begin
        with sintegra do
        begin
          Registro10.CNPJ := LQryParametros.fieldbyname('CNPJ').value;
          Registro10.Inscricao := LQryParametros.fieldbyname('IE').value;
          Registro10.RazaoSocial := LQryParametros.fieldbyname('razao_social').value;
          Registro10.Cidade := 'SALVADOR';
          Registro10.Estado := 'BA';
          Registro10.Telefone := LQryParametros.fieldbyname('TELEFONE_EMPRESA').value;
          Registro10.DataInicial := edDataInicial.Date;
          Registro10.DataFinal := edDataFinal.Date;
          Registro10.CodigoConvenio := '1';
          Registro10.NaturezaInformacoes := '3';
          Registro10.FinalidadeArquivo := '1';

          Registro11.Endereco := LQryParametros.fieldbyname('logradouro').value;
          Registro11.Numero := LQryParametros.fieldbyname('numero').value;
          Registro11.Bairro := LQryParametros.fieldbyname('bairro').value;
          Registro11.Cep := LQryParametros.fieldbyname('cep').value;
          Registro11.Responsavel := LQryParametros.fieldbyname('contato').value;
          Registro11.Telefone := LQryParametros.fieldbyname('TELEFONE_EMPRESA').value;
        end
      end;





   // Início da geração do bloco 0
      with sped.Bloco_0 do
      begin
      // Dados da Empresa
        with Registro0000New do
        begin
          case cbVersaoArquivo.ItemIndex of
            0:
              COD_VER := vlVersao102;
            1:
              COD_VER := vlVersao103;
            2:
              COD_VER := vlVersao104;
            3:
              COD_VER := vlVersao105;
            4:
              COD_VER := vlVersao106;
            5:
              COD_VER := vlVersao107;
            6:
              COD_VER := vlVersao108;
            7:
              COD_VER := vlVersao109;
            8:
              COD_VER := vlVersao110;
            9:
              COD_VER := vlVersao111;
            10:
              COD_VER := vlVersao112;
            11:
              COD_VER := vlVersao113;
            12:
              COD_VER := vlVersao114;
            13:
              COD_VER := vlVersao115;
            14:
              COD_VER := vlVersao116;
            15:
              COD_VER := vlVersao117;
            16:
              COD_VER := vlVersao118;
          end;

          COD_FIN := raSubstituto;
          NOME := LQryParametros.fieldbyname('razao_social').value;
          CNPJ := LQryParametros.fieldbyname('CNPJ').value;
          UF := LQryParametros.fieldbyname('UF').value;
          IE := LQryParametros.fieldbyname('IE').value;
          COD_MUN := LQryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
          IM := '';
          SUFRAMA := '';
          IND_PERFIL := pfPerfilB;
          IND_ATIV := atOutros;
        end;

        with Registro0001New do
        begin
          IND_MOV := imComDados;

          // Registro complementar de identificação da empresa

          with Registro0005New do
          begin
            FANTASIA := LQryParametros.fieldbyname('nome_fantasia').value;
            CEP := LQryParametros.fieldbyname('CEP').value;
            ENDERECO := LQryParametros.fieldbyname('LOGRADOURO').value;
            NUM := LQryParametros.fieldbyname('NUMERO').value;
            COMPL := LQryParametros.fieldbyname('COMPLEMENTO').value;
            BAIRRO := LQryParametros.fieldbyname('BAIRRO').value;
            FONE := LQryParametros.fieldbyname('TELEFONE_EMPRESA').value;
            FAX := LQryParametros.fieldbyname('FAX_EMPRESA').value;
            EMAIL := 'xx@xx.com';
          end;

           // Dados da contabilidade

          with Registro0100New do
          begin
            NOME := LQryParametros.fieldbyname('nome_contabilista').value;
            CPF := LQryParametros.fieldbyname('cpf_contabilista').value;
            CRC := LQryParametros.fieldbyname('crc_contabilista').value;
            CNPJ := LQryParametros.fieldbyname('cnpj_contabilista').value;
            CEP := LQryParametros.fieldbyname('cep_contabilista').value;
            ENDERECO := LQryParametros.fieldbyname('endereco_contabilista').value;
            NUM := LQryParametros.fieldbyname('numero_end_contabilista').value;
            COMPL := '';
            BAIRRO := LQryParametros.fieldbyname('bairro_contabilista').value;
            FONE := LQryParametros.fieldbyname('telefone_contabilista').value;
            FAX := LQryParametros.fieldbyname('fax_contabilista').value;
            EMAIL := LQryParametros.fieldbyname('email_contabilista').value;
            COD_MUN := LQryParametros.fieldbyname('COD_MUNICIPIO_IBGE').value;
          end;

          LQryParticipantes.Active := false;
          LQryParticipantes.SQL.Clear;

          LQryParticipantes.sql.add('        select cod_participante,f.* from ( ');
          LQryParticipantes.sql.add('             select distinct cod_fornecedor as cod_participante  from');
          LQryParticipantes.sql.add('             (');
          LQryParticipantes.sql.add('               select distinct nt.cod_fornecedor  from notas_transporte nt where nt.data_servico between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + '');
          LQryParticipantes.sql.add('                union all ');
          LQryParticipantes.sql.add('               select distinct s.cod_fornecedor  from saidas s  where s.data_saida between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + '');
          LQryParticipantes.sql.add('                union all ');
          LQryParticipantes.sql.add('               select distinct e.cod_fornecedor  from entradas e where e.tipo_entrada=0 and  e.data_entrada between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + '');
          LQryParticipantes.sql.add('                 union all ');
          LQryParticipantes.sql.add('                select distinct v.cod_fornecedor  from ');
          LQryParticipantes.sql.add('                  vendas v where v.data_so between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + '');
          LQryParticipantes.sql.add('                      and v.cod_fornecedor <> ' + Quotedstr('') + ' and v.cod_fornecedor is not null ');
          LQryParticipantes.sql.add('');
          LQryParticipantes.sql.add('             ) p ');
          LQryParticipantes.sql.add('             ) ');
          LQryParticipantes.sql.add('             inner join fornecedor f on (f.cod_fornecedor = cod_participante) ');

          LQryParticipantes.Active := true;
          LQryParticipantes.first;

          lbAguarde.Repaint;
          while not LQryParticipantes.eof do
          begin
            with Registro0150New do
            begin
              COD_PART := LQryParticipantes.fieldbyname('cod_fornecedor').value;
              NOME := LQryParticipantes.fieldbyname('razao_social').value;
              COD_PAIS := LQryParticipantes.fieldbyname('cod_pais').value;

              if (LQryParticipantes.fieldbyname('cod_pais').value <> '1058') then
              begin
                CNPJ := '';
                CPF := '';
              end
              else
              begin

                if Length(trim(LQryParticipantes.fieldbyname('cgc_cpf').value)) = 14 then
                  CNPJ := LQryParticipantes.fieldbyname('cgc_cpf').value
                else
                  CPF := LQryParticipantes.fieldbyname('cgc_cpf').value;

              end;

              if ((LQryParticipantes.fieldbyname('inscricao_estadual').value = Null) or (LQryParticipantes.fieldbyname('inscricao_estadual').value = '')) then
                IE := ''
              else
              begin
                IE := LQryParticipantes.fieldbyname('inscricao_estadual').value;
              end;

              try
                COD_MUN := LQryParticipantes.fieldbyname('cod_cidade').value;
              except
                begin
                  showmessage('Preencher IBGE do municipio ' + LQryParticipantes.fieldbyname('cod_cidade').value);
                  exit;
                end;
              end;

              SUFRAMA := '';
              if LQryParticipantes.fieldbyname('endereco').value <> null then
                ENDERECO := trim(LQryParticipantes.fieldbyname('endereco').value)
              else
                ENDERECO := 'NAO INFORMADO';

              NUM := '';
              COMPL := '';
              if LQryParticipantes.fieldbyname('BAIRRO').value <> null then
                BAIRRO := LQryParticipantes.fieldbyname('BAIRRO').value
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
            LQryParticipantes.Next;
          end;

          // Pega as unidades envolvidas nas compras

          LQryParticipantes.SQL.Clear;

          if ckbGerarInventario.Checked then
          begin
            LQryParticipantes.sql.add('  select distinct cod_unidade, sigla from  r_unidades_sped(' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ',' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + ',1) r ');
          end
          else
          begin
            LQryParticipantes.sql.add(' select distinct cod_unidade, sigla from  r_unidades_sped(' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ',' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + ',0) r ');
          end;

          LQryParticipantes.Active := true;
          LQryParticipantes.First;
          lbAguarde.Repaint;

          while not LQryParticipantes.eof do
          begin

            with Registro0190New do
            begin
              UNID := LQryParticipantes.fieldbyname('cod_unidade').value;
              DESCR := LQryParticipantes.fieldbyname('sigla').value;
            end;
            Application.ProcessMessages;
            LQryParticipantes.Next;
          end;

           // Cadastro de ítens - Matérias-primas

          LQryParticipantes.active := false;
          LQryParticipantes.sql.clear;

          if ckbGerarInventario.Checked then
            LQryParticipantes.SQL.Add('select  * from r_sped_reg0200(' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ',' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + ',1)')
          else
            LQryParticipantes.SQL.Add('select * from r_sped_reg0200(' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ',' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)) + ',0)');

          LQryParticipantes.active := true;

          while not LQryParticipantes.eof do
          begin
            with Registro0200New do
            begin

              COD_ITEM := LQryParticipantes.fieldbyname('codigo').value;
              DESCR_ITEM := trim(LQryParticipantes.fieldbyname('descricao').value);
              COD_BARRA := '';
              COD_ANT_ITEM := '';
              UNID_INV := LQryParticipantes.fieldbyname('cod_unidade').value;
              TIPO_ITEM := LQryParticipantes.fieldbyname('tipo').value;
              COD_NCM := LQryParticipantes.fieldbyname('ncm').value;
              EX_IPI := '';
              COD_GEN := LQryParticipantes.fieldbyname('genero').value;
              COD_LST := '';
              ALIQ_ICMS := 0;


              // Gera os registros 220 Filhos (Unidades e conversões)
              LQryREG220.Active := false;
              LQryREG220.sql.clear;
              LQryREG220.sql.add(' select distinct ite.cod_unidade, (u.parametro / Uitem.parametro) as fator ');
              LQryREG220.sql.add(' from itens_entrada ite');
              LQryREG220.sql.add(' inner join entradas e on (e.cod_entrada = ite.cod_entrada)');
              LQryREG220.sql.add(' inner join unidades u on (u.cod_unidade = ite.cod_unidade)');
              LQryREG220.sql.add(' inner join produtos p on (p.cod_produto = ite.cod_item)');
              LQryREG220.sql.add(' inner join unidades uItem on (Uitem.cod_unidade = p.unidade_entrada)');
              LQryREG220.sql.add(' where e.tipo_entrada=0');
              LQryREG220.sql.add(' and ite.cod_unidade <> p.unidade_entrada');
              LQryREG220.sql.add(' and ite.cod_item = ' + QuotedStr(COD_ITEM));
              LQryREG220.sql.add(' and ite.data_entrada between ');
              LQryREG220.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
              LQryREG220.active := true;
              LQryREG220.FetchAll;

              if LQryREG220.IsEmpty = false then
              begin
                LQryREG220.first;

                with Registro0220New do
                begin
                  UNID_CONV := LQryREG220.FieldByName('cod_unidade').value;
                  FAT_CONV := LQryREG220.FieldByName('fator').value;
                end;

                LQryREG220.Next;
              end;
            end;

            Application.ProcessMessages;
            LQryParticipantes.Next;
          end;
        end;
      end;

      lbAguarde.Repaint;
      sped.WriteBloco_0;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar o bloco 0. ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LQryParametros);
    FreeAndNil(LQryParticipantes);
    FreeAndNil(LQryREG220);
  end;

end;

procedure TFrmGerarSpedFiscal.GerarBloco1();
begin
  with sped.Bloco_1 do
  begin
    with Registro1001New do
    begin
      IND_MOV := imComDados;

      with Registro1010New do
      begin
        IND_EXP := 'N';
        IND_CCRF := 'N';
        IND_COMB := 'N';
        IND_USINA := 'N';
        IND_VA := 'N';
        IND_EE := 'N';
        IND_CART := 'N';
        IND_FORM := 'N';
        IND_AER := 'N';
        IND_GIAF1 := 'N';
        IND_GIAF3 := 'N';
        IND_GIAF4 := 'N';
        IND_REST_RESSARC_COMPL_ICMS := 'N'
      end;
    end;
  end;

//    sped.WriteBloco_1;

end;

procedure TFrmGerarSpedFiscal.GerarBlocoC;
var
  reducaoInicial, reducaoFinal: integer;
  LValorBaseICMS, LValorICMS, LValorReducaoICMS: currency;
  qryEntradas: Tibquery;
  qrySaidas: Tibquery;
  qryItensEntradas: Tibquery;
  qryItensSaidas: Tibquery;
  bufferNotas: integer;
  contador: integer;
  cod_totalizador: string;
  valorTotalBaseICMS: currency;
  LValorTotalICMSApuracao: currency;
  valorTotalBaseICMSOutrosEstados: currency;
  valorTotalICMSOutrosEstados: currency;
  valorBaseICMSReduzida: currency;
  valorICMSReduzido: currency;
  valorBaseICMSReduzidaOutrosEstados: currency;
  valorICMSReduzidoOutrosEstados: currency;
  qryNotasTransporte: TIBQuery;
  qryInventario: TIBQuery;
  valorICMSXML: currency;
  vlItem425: currency;
begin
  inherited;

  valorTotalBaseICMSOutrosEstados := 0;
  valorTotalICMSOutrosEstados := 0;
  valorBaseICMSReduzidaOutrosEstados := 0;
  valorICMSReduzidoOutrosEstados := 0;

  valorBaseICMSReduzida := 0;
  valorICMSReduzido := 0;
  valorTotalBaseICMS := 0;
  LValorTotalICMSApuracao := 0;

  bufferNotas := 10;
  contador := 0;

  qryEntradas := TIBQuery.Create(self);
  qryEntradas.Database := dm.dbrestaurante;
  qryEntradas.Transaction := dm.transacao;
  qryEntradas.Active := false;
  qryEntradas.SQL.clear;

  qryNotasTransporte := TIBQuery.Create(self);
  qryNotasTransporte.Database := dm.dbrestaurante;
  qryNotasTransporte.Transaction := dm.transacao;
  qryNotasTransporte.Active := false;
  qryNotasTransporte.SQL.clear;

  qrySaidas := TIBQuery.Create(self);
  qrySaidas.Database := dm.dbrestaurante;
  qrySaidas.Transaction := dm.transacao;
  qrySaidas.Active := false;
  qrySaidas.SQL.clear;

  qryItensEntradas := TIBQuery.Create(self);
  qryItensEntradas.Database := dm.dbrestaurante;
  qryItensEntradas.Transaction := dm.transacao;
  qryItensEntradas.Active := false;

  qryItensSaidas := TIBQuery.Create(self);
  qryItensSaidas.Database := dm.dbrestaurante;
  qryItensSaidas.Transaction := dm.transacao;
  qryItensSaidas.Active := false;

  qryInventario := TIBQuery.Create(self);
  qryInventario.Database := dm.dbrestaurante;
  qryInventario.Transaction := dm.transacao;
  qryInventario.Active := false;

  with sped.Bloco_C do
  begin
    with RegistroC001New do
    begin
      IND_MOV := imComDados;

          /// Notas fiscais de entrada - Gerais

      qryEntradas.Active := false;
      qryEntradas.sql.clear;
      qryEntradas.sql.add('      select udf_strzero(e.cod_fornecedor,4) as CodFornecedor, e.* from entradas e where data_entrada between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
      qryEntradas.sql.add('  and tipo_entrada=0  order by cod_entrada ');
      qryEntradas.active := true;
      qryEntradas.FetchAll;
      qryEntradas.first;
      contador := 0;

      pgArquivo.Max := qryEntradas.RecordCount;
      pgArquivo.Position := 0;
      lbAguarde.Caption := 'Gerando entradas...';

      while not qryEntradas.eof do
      begin

        if StrToInt(qryEntradas.fieldbyname('numero_nota').Value) = 105730 then
          showmessage('É agora salvador!');

        try
          begin

            with RegistroC100New do
            begin
              COD_PART := qryEntradas.fieldbyname('codFornecedor').Value;
              IND_EMIT := edTerceiros;
              IND_OPER := tpEntradaAquisicao;
              COD_MOD := qryEntradas.fieldbyname('modelo_nota').Value;

              COD_SIT := sdRegular;

              SER := qryEntradas.fieldbyname('serie_nota').Value;
              NUM_DOC := formatFloat('000000000', StrToFloat(qryEntradas.fieldbyname('numero_nota').Value));

              if ((qryEntradas.fieldbyname('modelo_nota').Value = '55') and (qryEntradas.fieldbyname('chave_nfe').Value <> null) and (qryEntradas.fieldbyname('chave_nfe').Value <> '')) then
                CHV_NFE := qryEntradas.fieldbyname('chave_nfe').Value
              else
                CHV_NFE := '';
              DT_DOC := qryEntradas.fieldbyname('data_emissao').Value;
              DT_E_S := qryEntradas.fieldbyname('data_entrada').Value;
              VL_DOC := qryEntradas.fieldbyname('total_nota').Value;
              IND_PGTO := tpPrazo;
              VL_DESC := qryEntradas.fieldbyname('desconto').Value;
              VL_ABAT_NT := 0;  // Não tenho esse campo nas NFS
              VL_MERC := qryEntradas.fieldbyname('valor_produtos').Value;
              IND_FRT := tfSemCobrancaFrete;
{                 case qryEntradas.fieldbyname('pagto_frete').Value of
                  0: IND_FRT       := tfSemCobrancaFrete;
                  1: IND_FRT       := tfPorContaEmitente;
                  2: IND_FRT       := tfPorContaDestinatario;
                 end;
 }
              VL_FRT := qryEntradas.fieldbyname('frete').Value;
              VL_SEG := qryEntradas.fieldbyname('seguro').Value;
              VL_OUT_DA := qryEntradas.fieldbyname('outras_despesas').Value;
              VL_BC_ICMS := 0;
              VL_ICMS := 0;
              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
              VL_IPI := 0;
              VL_PIS := 0;
              VL_COFINS := 0;
              VL_PIS_ST := 0;
              VL_COFINS_ST := 0;

              qryItensEntradas.Active := false;
              qryItensEntradas.sql.clear;
              qryItensEntradas.sql.add(' select udf_strzero(ite.cod_item,5) as codItem, ite.*  from itens_entrada  ite');
              qryItensEntradas.sql.add(' where ite.cod_entrada=' + Quotedstr(qryEntradas.fieldbyname('cod_entrada').Value) + ' order by ordem');
              qryItensEntradas.Active := true;
              qryItensEntradas.First;

              while not qryItensEntradas.eof do
              begin
                with RegistroC170New do
                begin

                  NUM_ITEM := FormatFloat('000', qryItensEntradas.fieldbyname('ordem').Value);
                  COD_ITEM := qryItensEntradas.fieldbyname('codItem').Value;
                  DESCR_COMPL := '';
                  QTD := qryItensEntradas.fieldbyname('quantidade').Value;
                  UNID := qryItensEntradas.fieldbyname('cod_unidade').Value;
                  VL_ITEM := qryItensEntradas.fieldbyname('valor_unitario').Value * qryItensEntradas.fieldbyname('quantidade').Value;
                  VL_DESC := qryItensEntradas.fieldbyname('desconto').Value;
                  IND_MOV := mfNao;
                  CST_ICMS := qryItensEntradas.fieldbyname('CST').Value;
                  CFOP := qryItensEntradas.fieldbyname('CFOP').Value;
                  COD_NAT := '';
                  VL_BC_ICMS := 0;
                  ALIQ_ICMS := 0;
                  VL_ICMS := 0;
                  VL_BC_ICMS_ST := 0;
                  ALIQ_ST := 0;
                  VL_ICMS_ST := 0;
                  IND_APUR := iaMensal;
                  CST_IPI := CstIpiToStr(stipiEntradaIsenta);
                  COD_ENQ := '';
                  VL_BC_IPI := 0;
                  ALIQ_IPI := 0;
                  VL_IPI := 0;
                  CST_PIS := CstPisToStr(stpisOutrasOperacoes);
                  VL_BC_PIS := 0;
                  ALIQ_PIS_PERC := 0;
                  QUANT_BC_PIS := 0;
                  ALIQ_PIS_R := 0;
                  VL_PIS := 0;
                  CST_COFINS := CstCofinsToStr(stcofinsOutrasOperacoes);
                  VL_BC_COFINS := 0;
                  ALIQ_COFINS_PERC := 0;
                  QUANT_BC_COFINS := 0;
                  ALIQ_COFINS_R := 0;
                  VL_COFINS := 0;
                  COD_CTA := '';
                end;
                Application.ProcessMessages;
                qryItensEntradas.Next;
              end;

              qryItensEntradas.Active := false;
              qryItensEntradas.sql.clear;
              qryItensEntradas.sql.add('   select sum( (ite.quantidade * ite.valor_unitario) + ite.valor_ipi + valor_icms_st + ite.outras_despesas - ite.desconto) as total,ite.cfop,ite.cst from itens_entrada ite');
              qryItensEntradas.sql.add(' where ite.cod_entrada=' + Quotedstr(qryEntradas.fieldbyname('cod_entrada').Value));
              qryItensEntradas.sql.adD('      group by ite.cst, ite.cfop');
              qryItensEntradas.Active := true;
              qryItensEntradas.First;

              while not qryItensEntradas.eof do
              begin
                with RegistroC190New do
                begin
                  CST_ICMS := qryItensEntradas.fieldbyname('CST').Value;
                  CFOP := qryItensEntradas.fieldbyname('CFOP').Value;
                  ALIQ_ICMS := 0;
                  VL_OPR := qryItensEntradas.fieldbyname('total').Value;
                  VL_BC_ICMS := 0;
                  VL_ICMS := 0;
                  VL_BC_ICMS_ST := 0;
                  VL_ICMS_ST := 0;
                  VL_RED_BC := 0;
                  VL_IPI := 0;
                  COD_OBS := '';
                end;
                Application.ProcessMessages;
                qryItensEntradas.Next;
              end;
            end;

            if ((contador mod bufferNotas) = 0) then
            begin
              sped.WriteBloco_C(false);

              contador := 0;
            end
            else
              contador := contador + 1;
            Application.ProcessMessages;

            pgArquivo.Position := pgArquivo.Position + 1;
            lbAguarde.Caption := 'Gerando dados de entradas. (' + Inttostr(pgArquivo.Position) + '/' + IntToStr(qryEntradas.RecordCount) + ')';
            Application.ProcessMessages;
            qryEntradas.Next;

          end

        except
          on E: Exception do
          begin
            raise Exception.Create('Erro gerando entradas cód número ' + qryEntradas.fieldbyname('cod_entrada').value);

          end;
        end

      end;

      lbAguarde.Repaint;

      if ((rdTipoGeracao.ItemIndex = 0) or (rdTipoGeracao.ItemIndex = 2)) then
      begin
        qrySaidas.Active := false;
        qrySaidas.sql.clear;
        qrySaidas.SQL.add(' select cod_venda, serie_nfce,numero_nfce,chave_nfce,cod_fornecedor,data_so,valor_total,valor_desconto,valor_bruto from vendas v where ');
        qrySaidas.SQL.add('  v.data_so between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
        qrySaidas.sql.add(' and v.modelo_comprovante=3');
        qrySaidas.SQL.add('   order by v.serie_nfce, v.numero_nfce ');
                  //////dm.adicionalog(qrySaidas.SQL.Text);
        qrySaidas.Active := true;

        while not qrySaidas.eof do
        begin
          with RegistroC100New do
          begin
//            dm.adicionalog('SPED venda nº :'+ qrySaidas.fieldbyname('cod_venda').Value);


            qryItensSaidas.Active := false;
            qryItensSaidas.sql.clear;
            qryItensSaidas.sql.add('select udf_roundabnt(sum(r.base_icms),2) as base_icms, udf_roundabnt(sum(r.valor_icms),2) as valor_icms  from  registros_c190_nfce(' + QUotedstr(qrySaidas.fieldbyname('cod_venda').Value) + ') r');
            qryItensSaidas.Active := true;

            if not qryItensSaidas.IsEmpty then
            begin
              LValorBaseICMS := qryItensSaidas.fieldbyname('base_icms').value;
              LValorICMS := qryItensSaidas.fieldbyname('valor_icms').value;

            end
            else
            begin
              LValorBaseICMS := 0;
              LValorICMS := 0;
            end;

            COD_SIT := sdRegular;
            COD_MOD := '55';
            SER := qrySaidas.fieldbyname('serie_nfce').Value;
            NUM_DOC := formatFloat('000000000', StrToFloat(qrySaidas.fieldbyname('numero_nfce').Value));
            CHV_NFE := qrySaidas.fieldbyname('chave_nfce').Value;
            COD_PART := qrySaidas.fieldbyname('cod_fornecedor').Value;
            IND_EMIT := edEmissaoPropria;
            IND_OPER := tpSaidaPrestacao;

            DT_DOC := qrySaidas.fieldbyname('data_so').Value;
            DT_E_S := qrySaidas.fieldbyname('data_so').Value;
            VL_DOC := qrySaidas.fieldbyname('valor_total').Value;
            IND_PGTO := tpVista;
            VL_DESC := qrySaidas.fieldbyname('valor_desconto').Value;
            VL_ABAT_NT := 0;  // Não tenho esse campo nas NFS
            VL_MERC := qrySaidas.fieldbyname('valor_bruto').Value;
            IND_FRT := tfSemCobrancaFrete;
            VL_FRT := 0;
            VL_SEG := 0;
            VL_OUT_DA := 0;
            VL_BC_ICMS := LValorBaseICMS;
            VL_ICMS := LValorICMS;
            LValorTotalICMSApuracao := LValorTotalICMSApuracao + VL_ICMS;
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST := 0;
            VL_IPI := 0;
            VL_PIS := 0;
            VL_COFINS := 0;
            VL_PIS_ST := 0;
            VL_COFINS_ST := 0;

            qryItensSaidas.Active := false;
            qryItensSaidas.sql.clear;

            qryItensSaidas.sql.add('select * FROM registros_c190_nfce(' + QUotedstr(qrySaidas.fieldbyname('cod_venda').Value) + ') where valor_operacao > 0');
            qryItensSaidas.Active := true;

            while not qryItensSaidas.Eof do
            begin

              with RegistroC190New do
              begin

                CST_ICMS := qryItensSaidas.fieldbyname('cst_saida').Value;
                CFOP := qryItensSaidas.fieldbyname('cfop_saida').Value;
                ALIQ_ICMS := qryItensSaidas.fieldbyname('percentual_icms').Value;
                VL_OPR := qryItensSaidas.fieldbyname('valor_operacao').Value;
                VL_RED_BC := qryItensSaidas.fieldbyname('total_reducao_base_icms').value;

                if (qryItensSaidas.FieldByName('valor_icms').Value > 0) then
                begin
                  VL_BC_ICMS := qryItensSaidas.fieldbyname('base_icms').Value;
                  VL_ICMS := qryItensSaidas.fieldbyname('valor_icms').Value;
                  valorTotalBaseICMS := valorTotalBaseICMS + qryItensSaidas.fieldbyname('base_icms').Value;

                end
                else
                begin
                  VL_BC_ICMS := 0;
                  VL_ICMS := 0;
                end;

                VL_BC_ICMS_ST := 0;
                VL_ICMS_ST := 0;
                VL_RED_BC := qryItensSaidas.fieldbyname('TOTAL_REDUCAO_BASE_ICMS').Value;
                VL_IPI := 0;
                COD_OBS := '';
              end;

              Application.ProcessMessages;
              qryItensSaidas.Next;
            end;
          end;
          Application.ProcessMessages;
          qrySaidas.Next;
        end;







                  // NFC-E notas fiscais de venda ao consumidor eletrônicas   (modelo 65)


        qrySaidas.Active := false;
        qrySaidas.sql.clear;
        qrySaidas.SQL.add(' select cod_venda, serie_nfce,numero_nfce,chave_nfce,cod_fornecedor,data_so,valor_total,valor_desconto,valor_bruto from vendas v where ');
        qrySaidas.SQL.add('  v.data_so between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
        qrySaidas.SQL.add('  and  (v.chave_nfce is not null ) and v.chave_nfce <> ' + Quotedstr(''));
        qrySaidas.sql.add(' and v.modelo_comprovante=2 ');
        qrySaidas.SQL.add('   order by v.serie_nfce, v.numero_nfce ');
        qrySaidas.Active := true;
        qrySaidas.FetchAll;
        pgArquivo.Max := qrySaidas.RecordCount;
        pgArquivo.Position := 0;
        lbAguarde.Caption := 'Gerando arquivos de NFCE...';

        while not qrySaidas.eof do
        begin
//          if qrySaidas.fields[0].Value = '00004000' then
//          begin
//            Showmessage('Chegou na brincadeira!');
//          end;

          with RegistroC100New do
          begin

            try

              qryItensSaidas.Active := false;
              qryItensSaidas.sql.clear;
              qryItensSaidas.sql.add('select udf_roundabnt(sum(r.base_icms),2) as base_icms, udf_roundabnt(sum(r.valor_icms),2) as valor_icms  from registros_c190_nfce(' + QUotedstr(qrySaidas.fieldbyname('cod_venda').Value) + ') r');

              qryItensSaidas.Active := true;

              if not qryItensSaidas.IsEmpty then
              begin
                LValorBaseICMS := qryItensSaidas.fieldbyname('base_icms').value;
                LValorICMS := qryItensSaidas.fieldbyname('valor_icms').value;

              end
              else
              begin
                LValorBaseICMS := 0;
                LValorICMS := 0;
              end;

              COD_SIT := sdRegular;
              COD_MOD := '65';
              SER := qrySaidas.fieldbyname('serie_nfce').Value;
              NUM_DOC := formatFloat('000000000', StrToFloat(qrySaidas.fieldbyname('numero_nfce').Value));
              CHV_NFE := qrySaidas.fieldbyname('chave_nfce').Value;
//						    				COD_PART      := qrySaidas.fieldbyname('codFornecedor').Value;
              IND_EMIT := edEmissaoPropria;
              IND_OPER := tpSaidaPrestacao;

              DT_DOC := qrySaidas.fieldbyname('data_so').Value;
              DT_E_S := qrySaidas.fieldbyname('data_so').Value;
              VL_DOC := qrySaidas.fieldbyname('valor_total').Value;
              IND_PGTO := tpVista;
              VL_DESC := qrySaidas.fieldbyname('valor_desconto').Value;
              VL_ABAT_NT := 0;  // Não tenho esse campo nas NFS
              VL_MERC := qrySaidas.fieldbyname('valor_bruto').Value;
              IND_FRT := tfSemCobrancaFrete;
              VL_FRT := 0;
              VL_SEG := 0;
              VL_OUT_DA := 0;

              if qrySaidas.fieldbyname('valor_total').Value <= 0.01 then
              begin
                VL_BC_ICMS := 0.01;
                VL_ICMS := 0;
              end
              else
              begin
                VL_BC_ICMS := LValorBaseICMS;
                VL_ICMS := LValorICMS;
              end;
              LValorTotalICMSApuracao := LValorTotalICMSApuracao + VL_ICMS;

              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
              VL_IPI := 0;
              VL_PIS := 0;
              VL_COFINS := 0;
              VL_PIS_ST := 0;
              VL_COFINS_ST := 0;

              qryItensSaidas.Active := false;
              qryItensSaidas.sql.clear;

              qryItensSaidas.sql.add('select * FROM registros_c190_nfce(' + QUotedstr(qrySaidas.fieldbyname('cod_venda').Value) + ') where valor_operacao > 0');
                        //////dm.adicionalog(qryItensSaidas.SQL.text);
              qryItensSaidas.Active := true;

              while not qryItensSaidas.Eof do
              begin

                with RegistroC190New do
                begin

                  CST_ICMS := qryItensSaidas.fieldbyname('cst_saida').Value;
                  CFOP := qryItensSaidas.fieldbyname('cfop_saida').Value;
                  ALIQ_ICMS := qryItensSaidas.fieldbyname('percentual_icms').Value;
                  VL_OPR := qryItensSaidas.fieldbyname('valor_operacao').Value;

                  if qryItensSaidas.fieldbyname('valor_operacao').Value > 0.01 then
                  begin

                    if (qryItensSaidas.FieldByName('valor_icms').Value > 0) then
                    begin
                      VL_BC_ICMS := qryItensSaidas.fieldbyname('base_icms').Value;
                      VL_ICMS := qryItensSaidas.fieldbyname('valor_icms').Value;
                      valorTotalBaseICMS := valorTotalBaseICMS + qryItensSaidas.fieldbyname('base_icms').Value;
                    end
                    else
                    begin
                      VL_BC_ICMS := 0;
                      VL_ICMS := 0;
                    end;

                  end
                  else
                  begin
                    VL_BC_ICMS := 0.01;
                    VL_ICMS := 0;
                  end;

                  VL_BC_ICMS_ST := 0;
                  VL_ICMS_ST := 0;
                  VL_RED_BC := qryItensSaidas.fieldbyname('TOTAL_REDUCAO_BASE_ICMS').Value;
                  VL_IPI := 0;
                  COD_OBS := '';
                end;

                Application.ProcessMessages;
                qryItensSaidas.Next;
              end

            except
              on E: Exception do
              begin
                raise Exception.Create('Erro ao gerar dados da NF-e 65 de nº ' + Inttostr(qrySaidas.fieldbyname('numero_nfce').Value) + sLineBreak + e.Message);

              end;

            end;

          end;

          pgArquivo.Position := pgArquivo.Position + 1;
          lbAguarde.Caption := 'Gerando dados de NFC-e (' + Inttostr(pgArquivo.Position) + '/' + IntToStr(qrySaidas.RecordCount) + ')';
          Application.ProcessMessages;
          qrySaidas.Next;

        end;

      end;
    end;
  end;

  sped.WriteBloco_C(true);

  with sped.Bloco_D do
  begin
      ////dm.adicionalog('Entrou na geração do bloco D');
    with RegistroD001New do
    begin
      dm.tb_parametros.Active := true;
          ////dm.adicionalog('Começa as notas de transporte');
      qryNotasTransporte.Active := false;
      qryNotasTransporte.SQL.Clear;

      qryNotasTransporte.SQL.add(' select CODIGO,COD_FORNECEDOR,NUMERO_NOTA,SERIE, ');
      qryNotasTransporte.SQL.add(' SUB_SERIE,SITUACAO, DATA_EMISSAO, DATA_SERVICO,');
      qryNotasTransporte.SQL.add(' DATA_LANCAMENTO,MES_REF_CONTABIL,MODELO_NOTA,');
      qryNotasTransporte.SQL.add(' CFOP,CST_ICMS,VALOR_SERVICO,DESCONTO,BASE_ICMS,');
      qryNotasTransporte.SQL.add(' REDUCAO_BASE_ICMS,ALIQ_ICMS,VALOR_ICMS, VALOR_NAO_TRIBUTADO,');
      qryNotasTransporte.SQL.add(' VALOR_DOC,TIPO_CTE,ID_FRETE,CHAVE_CTE,TIPODOC, ');
      qryNotasTransporte.SQL.add(' coalesce(MUNICIPIO_REMETENTE,0) as municipio_origem');
      qryNotasTransporte.SQL.add('  from notas_transporte where data_servico between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)));
        //////dm.adicionalog(qryNotasTransporte.SQL.Text);
      qryNotasTransporte.Active := true;

      if (qryNotasTransporte.IsEmpty = true) then
        IND_MOV := imSemDados
      else
      begin
        IND_MOV := imComDados;

        while not qryNotasTransporte.Eof do
        begin

          with RegistroD100New do
          begin
            IND_OPER := tpEntradaAquisicao;
            IND_EMIT := edTerceiros;
            COD_PART := qryNotasTransporte.fieldbyname('cod_fornecedor').Value;
            COD_MOD := qryNotasTransporte.fieldbyname('modelo_nota').Value;
            COD_SIT := sdRegular;
            if ((qryNotasTransporte.fieldbyname('serie').Value = '') or (qryNotasTransporte.fieldbyname('serie').Value = null)) then
              SER := ''
            else
              SER := qryNotasTransporte.fieldbyname('serie').Value;

            if ((qryNotasTransporte.fieldbyname('sub_serie').Value = '') or (qryNotasTransporte.fieldbyname('sub_serie').Value = null)) then
              SUB := ''
            else
              SUB := qryNotasTransporte.fieldbyname('sub_serie').Value;

            NUM_DOC := qryNotasTransporte.fieldbyname('numero_nota').Value;
            DT_DOC := qryNotasTransporte.fieldbyname('data_emissao').Value;
            DT_A_P := qryNotasTransporte.fieldbyname('data_servico').Value;

            if ((COD_MOD = '57') and (qryNotasTransporte.fieldbyname('chave_cte').Value <> null)) then
            begin

              TP_CT_e := qryNotasTransporte.fieldbyname('tipo_cte').Value;
              CHV_CTE := qryNotasTransporte.fieldbyname('chave_cte').Value;
            end;
            VL_DOC := qryNotasTransporte.fieldbyname('valor_doc').Value;
            VL_DESC := qryNotasTransporte.fieldbyname('desconto').Value;

            case qryNotasTransporte.fieldbyname('id_frete').Value of
              0:
                IND_FRT := tfPorContaTerceiros;
              1:
                IND_FRT := tfPorContaEmitente;
              2:
                IND_FRT := tfPorContaDestinatario;
              3:
                IND_FRT := tfSemCobrancaFrete;
            end;

            VL_SERV := qryNotasTransporte.fieldbyname('valor_servico').Value;
            VL_BC_ICMS := qryNotasTransporte.fieldbyname('base_icms').Value;
            VL_ICMS := qryNotasTransporte.fieldbyname('valor_icms').Value;
            VL_NT := qryNotasTransporte.fieldbyname('VALOR_NAO_TRIBUTADO').Value;
            COD_INF := '';
            COD_CTA := '';

            if qryNotasTransporte.fieldbyname('municipio_origem').Value <> 0 then
              COD_MUN_ORIG := inttostr(qryNotasTransporte.fieldbyname('municipio_origem').Value)
            else
              COD_MUN_ORIG := '';

            COD_MUN_DEST := dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value;

            with RegistroD190New do
            begin
              CST_ICMS := qryNotasTransporte.fieldbyname('CST_ICMS').Value;
              CFOP := qryNotasTransporte.fieldbyname('CFOP').Value;
              ALIQ_ICMS := qryNotasTransporte.fieldbyname('ALIQ_ICMS').Value;
              VL_OPR := qryNotasTransporte.fieldbyname('VALOR_DOC').Value;
              VL_BC_ICMS := qryNotasTransporte.fieldbyname('base_icms').Value;
              VL_ICMS := qryNotasTransporte.fieldbyname('valor_icms').Value;
              VL_RED_BC := qryNotasTransporte.fieldbyname('reducao_base_icms').Value;
              COD_OBS := '';
            end;

          end;
          Application.ProcessMessages;
          qryNotasTransporte.Next;
        end;

      end;
    end;
  end;

  with sped.Bloco_E do
  begin
    with RegistroE001New do
    begin
      IND_MOV := imComDados;

      with RegistroE100New do
      begin
        DT_INI := edDataInicial.Date;
        DT_FIN := edDataFinal.Date;

        with RegistroE110New do
        begin

          dm.tb_parametros.Active := true;
          valorBaseICMSReduzida := (valorTotalBaseICMS * dm.tb_parametrosRED_BASE_ICMS.Value); // Aplica redução de base
          valorICMSReduzido := (valorBaseICMSReduzida * (dm.tb_parametrosALIQUOTA_ICMS.value / 100));

          valorBaseICMSReduzidaOutrosEstados := 0;
          valorICMSReduzidoOutrosEstados := 0;

          LValorTotalICMSApuracao := LValorTotalICMSApuracao;
          LValorTotalICMSApuracao := LValorTotalICMSApuracao;
          VL_TOT_DEBITOS := LValorTotalICMSApuracao;
          VL_AJ_DEBITOS := 0;
          VL_TOT_AJ_DEBITOS := 0;
          VL_ESTORNOS_CRED := 0;
          VL_TOT_CREDITOS := 0;
          VL_AJ_CREDITOS := 0;
          VL_TOT_AJ_CREDITOS := 0;
          VL_ESTORNOS_DEB := 0;
          VL_SLD_CREDOR_ANT := 0;

          if ((valorICMSReduzido > 0) or (valorICMSReduzidoOutrosEstados > 0)) then
          begin
            VL_TOT_DED := LValorTotalICMSApuracao - (valorICMSReduzido + valorICMSReduzidoOutrosEstados);
          end
          else
          begin
            VL_TOT_DED := 0;
          end;

          VL_SLD_APURADO := LValorTotalICMSApuracao;
          VL_ICMS_RECOLHER := VL_TOT_DEBITOS - VL_ESTORNOS_DEB - VL_TOT_DED;
               //               VL_ICMS_RECOLHER :=  valorICMSReduzido + valorICMSReduzidoOutrosEstados;
          VL_SLD_CREDOR_TRANSPORTAR := 0;
          DEB_ESP := 0;

          if ((valorICMSReduzido > 0) or (valorICMSReduzidoOutrosEstados > 0)) then
          begin

            with RegistroE111New do
            begin
              COD_AJ_APUR := 'BA049999';
              DESCR_COMPL_AJ := 'ICMS CALCULADO POR RECEITA BRUTA ';
              VL_AJ_APUR := LValorTotalICMSApuracao - (valorICMSReduzido + valorICMSReduzidoOutrosEstados);
            end;
          end;

          with RegistroE116New do
          begin
            COD_OR := '000';
            VL_OR := VL_ICMS_RECOLHER - DEB_ESP;
            DT_VCTO := edDataVencimento.Date;
            COD_REC := '1';
            NUM_PROC := '';
            MES_REF := FormatDateTime('MMYYY', edDataInicial.Date);
            IND_PROC := opNenhum;
            COD_REC := '0759';
          end;

        end;
      end;

    end;
  end;

  if ckbGerarInventario.Checked then
  begin
    with sped.Bloco_H do
    begin
      with RegistroH001New do
      begin
        IND_MOV := imComDados;

        with RegistroH005New do
        begin
          qryInventario.Active := false;
          qryInventario.SQL.Clear;
          qryInventario.SQL.Add('  select sum(estoque_dinheiro) as total  from v_itens_estoque ');
          qryInventario.Active := true;
          DT_INV := edDataFinal.Date;
          VL_INV := qryInventario.fieldbyname('total').Value;

          qryInventario.Active := false;
          qryInventario.SQL.Clear;
          qryInventario.SQL.Add('  select *  from v_itens_estoque ');
          qryInventario.Active := true;
          qryInventario.First;

          while not qryInventario.Eof do
          begin
            with RegistroH010New do
            begin
              COD_ITEM := FormatFloat('00000', qryInventario.fieldbyname('cod_item').Value);
              UNID := qryInventario.fieldbyname('cod_un_entrada').Value;
              QTD := qryInventario.fieldbyname('estoque_total').Value;
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
    with Registro9001 do
    begin
      IND_MOV := imComDados;
    end;
  end;

  sped.WriteBloco_D;
  sped.writeBloco_E;
  sped.WriteBloco_H;
  sped.WriteBloco_1;
  sped.WriteBloco_9;

end;

procedure TFrmGerarSpedFiscal.gerarSintegra();
begin

  with sintegra do
  begin

  end;

end;

procedure TFrmGerarSpedFiscal.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmGerarSpedFiscal.btSelecionarClick(Sender: TObject);
var
  LCaminhoArquivo: string;
begin
  inherited;

  try
    try

      edDataInicial.Date := StartOfAMonth(StrToInt(cbAno.text), cbMes.ItemIndex + 1);
      edDataFinal.Date := EndOfTheMonth(edDataInicial.date);

      folderDialog.Execute;
      LCaminhoArquivo := folderDialog.Directory;
      if DirectoryExists(LCaminhoArquivo) then
      begin
        sped.Path := LCaminhoArquivo;
        sped.Arquivo := 'SPED_' + StringReplace(razao_social, ' ', '_', [rfReplaceAll]) + '_' + cbMes.Text + '_' + cbAno.Text + '.txt';
        edDataVencimento.Date := StrToDate('09/' + FormatDateTime('MM/YYY', edDataInicial.Date));
      end
      else
        raise Exception.Create('Pasta selecionada não existe!');

      tmAguarde.Enabled := true;
      lbAguarde.Repaint;
      pgAguarde.Show;
      gerarSpedFiscal();
      pgPrincipal.Show;
      dm.exibe_painel_erro('Finalizou a geração do arquivo.' + sLineBreak + 'Local: ' + sped.Path + '\' + sped.Arquivo, 'Ok', mtInformation);

    except
      on E: Exception do
      begin
        pgPrincipal.Show;
        dm.exibe_painel_erro('Erro: ' + E.Message, 'Ok', mtError);
      end;

    end;
  finally

  end;

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

        Showmessage(' Arquivo salvo com sucesso!');
      end;
    end
    else
    begin

      Showmessage(' Arquivo salvo com sucesso!');
    end;
  end;
end;

procedure TFrmGerarSpedFiscal.cal1Click(Sender: TObject);
var
  vec_icms: string;
begin
  inherited;

end;

procedure TFrmGerarSpedFiscal.FormActivate(Sender: TObject);
var
  anoAtual: integer;
  i: integer;
begin
  inherited;

  anoAtual := CurrentYear;
  cbAno.Clear;
  for i := 0 to 10 do
  begin
    cbAno.Items.Add(IntToStr(anoAtual - i));
  end;

  cbVersaoArquivo.ItemIndex := cbVersaoArquivo.Items.Count - 1;
end;

procedure TFrmGerarSpedFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  cbVersaoArquivo.ItemIndex := cbVersaoArquivo.Items.Count - 1;
  cbAno.ItemIndex := cbAno.ITEMS.Count - 1;
end;

procedure TFrmGerarSpedFiscal.gerarSpedFiscal();
var
  Inicio: TDateTime;
  tempo: integer;
begin
  inherited;
  Inicio := now;
  GerarBloco0();
  GerarBlocoC();

  tempo := SecondsBetween(Inicio, now);

end;

end.

