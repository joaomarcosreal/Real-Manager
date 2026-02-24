unit uuImportaDadosECFReducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons,inifiles,ibx.ibquery;

type
  TfrmImportacaoDadosTextoZ = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit2: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    ckb60A: TCheckBox;
    ckb60M: TCheckBox;
    ckb60I: TCheckBox;
    Button2: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure  importaProsoft();
    procedure  importaFortes();
    function   gerarDadosRegistroImportadoReducao(arquivo : string) : boolean;
    procedure  BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function  gerarDadosRegistroImportadoSintegra(arquivo : string) : boolean;
    procedure Button2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacaoDadosTextoZ: TfrmImportacaoDadosTextoZ;

implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure TfrmImportacaoDadosTextoZ.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Execute;
  Edit2.Text := OpenDialog1.FileName;
end;



function TfrmImportacaoDadosTextoZ.gerarDadosRegistroImportadoReducao(arquivo : string) : boolean;
var
ArqIni : tIniFile;
dataMovimentoECF : TDate;
caminho : string;
ct : integer;
//variaveis do registro 60M
NumSerie,NumECF,NumLoja,NumCOOInicial,NumCOO,NumCRZ,NumCRO : string;
VendaBruta,GrandeTotal,TotalDescontos,TotalCancelamentos,TotalAcrescimos,TotalNaoFiscal : string;
TotalSubstituicaoTributaria,TotalNaoTributado,TotalIsencao  : string;
total17,total25,total7,total27 : string;
q : TIBquery;
codigo : string;
ct60I : integer;
begin
 frm_principal.memo_avisos.Lines.Clear;
 dataMovimentoECF:= StrToDate(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','data')));
 caminho:=patchAplicacao+'dadosReducoes\'+FormatDateTime('YYYMMDD',dataMovimentoECF)+'.ini';
  if FileExists(caminho) then
   DeleteFile(caminho);
 frm_principal.memo_avisos.Lines.SaveToFile(caminho);
 ArqIni := tIniFile.Create(caminho);

 total17 :='0';
 total25 :='0';
 total27 := '0';


 // Informacoes do ECF
 NumSerie                    :=  '321321321';
 NumECF                      :=  '001';
 NumLoja                     :=  '001';
 NumCOOInicial               :=  'xyz';
 NumCOO                      :=  trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','COO'));
 NumCRZ                      :=  trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','CRZ'));
 NumCRO                      :=  trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','CRO'));

 // Informacoes dos Totalizadores
 VendaBruta                  := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','VENDA_BRUTA')));
 GrandeTotal                 := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','TOTALIZADOR_GERAL')));
 TotalDescontos              := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','DESCONTOS')));
 TotalCancelamentos          := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','CANCELAMENTOS')));
 TotalAcrescimos             := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','ACRESIMO')));
// TotalNaoFiscal              := trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','TotalNaoFiscal','0'));
 TotalSubstituicaoTributaria := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','F1')));
 TotalNaoTributado           := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','TotalNaoTributado')));
 TotalIsencao                :=dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','I1')));
 total7 :=  dm.removePonto( trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','T7')));
 total17 := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','T17')));
 total25 := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','T25')));
 total27 := dm.removePonto(trim(dm.LeArquivoIniCaminho(arquivo,2,'ECF','T27')));



 codigo :=dm.geraCodigo('G_REG60M',8);
 q := TIBQuery.Create(Self);
 q.Database:=dm.dbrestaurante;
 q.Transaction:=dm.transacao;
 q.Active:=false;
 q.sql.add('insert into reg60M (cod_reg,data,num_serie,num_ord,modelo,coo_ini,coo_fim,cont_z,co_rein_op,cancelamentos,');
 q.sql.add('descontos,substituicao,isencao,naotributado,venda_bruta,tot_geral) values (');
 q.sql.add(QuotedStr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumECF)))+',');
 q.sql.add(QuotedStr('2D')+',');
 q.sql.add(QuotedStr(NumCOOInicial)+',');
 q.sql.add(QuotedStr(NumCOO)+',');
 q.sql.add(QuotedStr(NumCRZ)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumCRO)))+',');
 q.sql.add(dm.TrocaVirgPPto(TotalCancelamentos)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalDescontos)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalSubstituicaoTributaria)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalIsencao)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalNaoTributado)+',');
 q.sql.add(dm.TrocaVirgPPto(VendaBruta)+',');
 q.sql.add(dm.TrocaVirgPPto(GrandeTotal)+')');
 try
   q.ExecSQL;
 Except
  begin
    frm_principal.memo_avisos.lines := q.SQL;
    Exit;
  end;
 end;


 // Grava Cancelamentos..
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalCancelamentos)+',');
 q.sql.add(QuotedStr('CANC')+')');
 q.ExecSQL;

 // Grava descontos
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalDescontos)+',');
 q.sql.add(QuotedStr('DESC')+')');
 q.ExecSQL;

  // Grava Acresimos
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalAcrescimos)+',');
 q.sql.add(QuotedStr('ACRE')+')');
 q.ExecSQL;


  // Grava substituição
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalSubstituicaoTributaria)+',');
 q.sql.add(QuotedStr('F')+')');
 q.ExecSQL;

   // Grava isencao
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalIsencao)+',');
 q.sql.add(QuotedStr('I')+')');
 q.ExecSQL;

   // Grava nao tributado
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(TotalNaoTributado)+',');
 q.sql.add(QuotedStr('N')+')');
 q.ExecSQL;


 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(FormatFloat('#0.00',StrToFloat(total17)) )+',');
 q.sql.add(QuotedStr('1700')+')');
 q.ExecSQL;

 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(FormatFloat('#0.00',StrToFloat(total25)) )+',');
 q.sql.add(QuotedStr('2500')+')');
 q.ExecSQL;

 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(dm.TrocaVirgPPto(FormatFloat('#0.00',StrToFloat(total27)) )+',');
 q.sql.add(QuotedStr('2700')+')');
 q.ExecSQL;

 dm.transacao.Commit;
 ArqIni.Free;

 q.Active:=false;
 FreeAndNil(q);
end;














function TfrmImportacaoDadosTextoZ.gerarDadosRegistroImportadoSintegra(arquivo : string) : boolean;
var
linha : string;
data : string;
dataMovimentoECF : TDate;
ct : integer;
//variaveis do registro 60M
NumSerie,NumECF,NumLoja,NumCOOInicial,NumCOO,NumCRZ,NumCRO : string;
VendaBruta,GrandeTotal,TotalDescontos,TotalCancelamentos,TotalAcrescimos,TotalNaoFiscal : string;
SituacaoTributaria60A,valor60A : string;
aliquota,codProduto,cod_usuario,cod_aliquota,valor_unitario,quantidade : string;
q : TIBquery;
codigo : string;
ct60I : integer;
begin

 ct60I := 0;

 frm_principal.memo_avisos.Lines.Clear;

  Memo1.Lines.LoadFromFile(Edit2.Text );
   For ct:=0 to Memo1.Lines.Count do
    begin
      linha := memo1.Lines[ct];
      if( ( trim(copy(linha,0,3)) = '60M' ) and (ckb60M.Checked = true) ) then
       begin
         data                      :=   copy(linha,4,8);
         dataMovimentoECF            := strToDate(copy(data,7,2)+'/'+copy(data,5,2)+'/'+copy(data,0,4));
         NumSerie                    :=  copy(linha,12,20);
         NumECF                      :=  '001';
         NumLoja                     :=  '001';
         NumCOOInicial               :=  copy(linha,37,6);
         NumCOO                      :=  copy(linha,43,6);
         NumCRZ                      :=  copy(linha,49,6);
         NumCRO                      :=  copy(linha,55,3);

         // Informacoes dos Totalizadores
         VendaBruta                  := trim(copy(linha,58,16));
         VendaBruta                  := FloatToStr(StrToFloat(copy(VendaBruta,0,14)+','+ copy(vendaBruta,15,2)));
         GrandeTotal                 :=  copy(linha,74,16);
         GrandeTotal                 :=  FloatToStr(StrToFloat(copy(GrandeTotal,0,14)+','+ copy(GrandeTotal,15,2)));

         codigo :=dm.geraCodigo('G_REG60M',8);
         q := TIBQuery.Create(Self);
         q.Database:=dm.dbrestaurante;
         q.Transaction:=dm.transacao;
         q.Active:=false;
         q.sql.add('insert into reg60M (cod_reg,data,num_serie,num_ord,modelo,coo_ini,coo_fim,cont_z,co_rein_op,');
         q.sql.add('venda_bruta,tot_geral) values (');
         q.sql.add(QuotedStr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumECF)))+',');
         q.sql.add(QuotedStr('2D')+',');
         q.sql.add(QuotedStr(NumCOOInicial)+',');
         q.sql.add(QuotedStr(NumCOO)+',');
         q.sql.add(QuotedStr(NumCRZ)+',');
         q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumCRO)))+',');
         q.sql.add(dm.TrocaVirgPPto(VendaBruta)+',');
         q.sql.add(dm.TrocaVirgPPto(GrandeTotal)+')');
         try
           q.ExecSQL;
         Except
          begin


          end;
         end;
       end;

      if( ( trim(copy(linha,0,3)) = '60A' ) and (ckb60M.Checked = true) ) then
       begin
         data                      :=    copy(linha,4,8);
         dataMovimentoECF            :=  strToDate(copy(data,7,2)+'/'+copy(data,5,2)+'/'+copy(data,0,4));
         NumSerie                    :=  copy(linha,12,20);
         SituacaoTributaria60A       :=  copy(linha,32,4);
         valor60A                  :=  trim(copy(linha,36,16));
         valor60A                  :=  FloatToStr(StrToFloat(copy(valor60A,0,10)+','+ copy(valor60A,11,2)));

         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(dm.TrocaVirgPPto(valor60A)+',');
         q.sql.add(QuotedStr(SituacaoTributaria60A)+')');
         q.ExecSQL;
       end;

      if( ( trim(copy(linha,0,3)) = '60I' ) and (ckb60M.Checked = true) ) then
       begin
          ct60I := ct60I +1;
          data                      :=    copy(linha,4,8);
          dataMovimentoECF            :=  strToDate(copy(data,7,2)+'/'+copy(data,5,2)+'/'+copy(data,0,4));

          codProduto      :=   trim(copy(linha,43,14));
          quantidade      :=   trim(copy(linha,57,13));
          quantidade      :=   FloatToStr(StrToFloat(copy(quantidade,0,10)+','+ copy(quantidade,11,3)));
          valor_unitario  :=   trim(copy(linha,70,13));
          valor_unitario  :=   FloatToStr(StrToFloat(copy(valor_unitario,0,11)+','+ copy(valor_unitario,12,2)));
          aliquota        :=   trim(copy(linha,95,4));

          if (aliquota = 'F'   )    then aliquota := '01';
          if (aliquota = '1700')    then aliquota := '03';
          if (aliquota = '0400')    then aliquota := '03';
          if (aliquota = 'I')       then aliquota := '02';
          if (aliquota = '0000')    then aliquota := '02';


          q.Active := false;
          q.sql.Clear;
          q.SQL.add('insert into movimento_venda(cod_venda,cod_mesa,cod_produto,data,cod_usuario,quantidade,valor_unitario,cod_aliquota) values (');
          q.sql.add(''+Quotedstr('00001402')+',');
          q.sql.add(''+Quotedstr('0001')+',');
          q.sql.add(''+Quotedstr(FormatFloat('00000',StrToFloat(codProduto)))+',');
          q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
          q.sql.add(''+Quotedstr('01')+',');
          q.sql.add(dm.TrocaVirgPPto(quantidade)+',');
          q.sql.add(dm.TrocaVirgPPto(valor_unitario)+',');
          q.sql.add(''+Quotedstr(aliquota)+')');
          try
           q.ExecSQL;
          except
           begin

           end;
          end;
       end;
    end;


 dm.transacao.Commit;
 FreeAndNil(q);

 showmessage('Importação finalizada !');
 showmessage(IntToStr(ct60I));


end;






procedure TfrmImportacaoDadosTextoZ.BitBtn1Click(Sender: TObject);
var
ct : integer;
arquivo : string;
begin
  inherited;

  for ct:=1 to 31 do
   begin
     arquivo := 'D:\reducoes torre\'+inttostr(ct)+'.ini';
     gerarDadosRegistroImportadoReducao(arquivo);
   end;
   Showmessage('Finalizado');
end;

procedure TfrmImportacaoDadosTextoZ.Button1Click(Sender: TObject);
var
 ct : integer;
begin
  inherited;
  gerarDadosRegistroImportadoSintegra('');


end;

procedure TfrmImportacaoDadosTextoZ.importaProsoft();
var
 ct : integer;
 ctNotas : integer;
 linha : string;
 ctLInha, tamanhoLinha : integer;
 valorCampo : string;
 numeroCampo : integer;
 dia : string;
 data : string;
 mesAno : string;
 nfvc_inicial,nfvc_final : string;
 valor : string;
 CFOP : string;
 aliquota : string;
 baseIcms, valorIcms : double;
 q : TIBQuery;
 cancelada : string;
begin
  inherited;

  q := TIBQuery.Create(Self);
  q.Database:=dm.dbrestaurante;
  q.Transaction:=dm.transacao;
  q.Active:=false;


  mesAno:='10.2011';

  Memo1.Lines.LoadFromFile(Edit2.Text );
  Memo2.Lines.Clear;

   For ct:=0 to Memo1.Lines.Count do
    begin
      linha := Trim(Memo1.Lines[ct]);
      if  ( copy(linha,0,4) = 'NFVC' ) then
        begin
         tamanhoLinha :=  dm.AnsiLength(linha);
         numeroCampo := 1;
         ctLInha:=1;
         valorCampo :='';
         while (ctLinha <= tamanhoLinha )do
          begin
            if (trim(copy(linha,ctlinha,1)) <> '') then
              begin
                 valorCampo :=valorCampo + trim(copy(linha,ctlinha,1));
              end
            else
             begin
             if (trim(valorCampo) <> '') then
             begin
                 case numeroCampo of
                  1: begin
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;
                  2: begin
                         numeroCampo := numeroCampo +1;
                         valorCampo :='';
                       end;
                  3: begin
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  4: begin
                       nfvc_inicial := valorCampo;
                       if valorCampo = '0000060609' then showmessage('AGORA');
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  5: begin
                       if ( dm.AnsiLength(Trim(valorCampo)) = 2) then
                         begin
                           nfvc_final := nfvc_inicial;
                           dia := valorCampo;
                           valorCampo :='';
                           numeroCampo := numeroCampo +2;
                         end
                       else
                         begin
                           nfvc_final := valorCampo;
                           numeroCampo := numeroCampo +1;
                             valorCampo :='';
                         end;
                     end;

                  6: begin
                       dia := valorCampo;
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  7: begin
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                      end;

                  8: begin
                       valor := valorCampo;
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  9: begin
                       if valorCampo  <> '0004' then
                        begin
                         CFOP  := valorCampo;
                         numeroCampo := numeroCampo +1;
                        end;
                       valorCampo :='';
                     end;

                  10: begin
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  11: begin
                       aliquota      := valorCampo;
                       numeroCampo   := numeroCampo +1;
                       valorCampo :='';
                     end;

                 end;
             end;

               if (numeroCampo >=10 ) then
                 begin
                   if StrToFloat(valor) <=0 then
                     begin
                       aliquota :='0';
                       ctLInha := tamanhoLinha +1;
                     end;

                 end;

             end;

            ctLInha := ctLInha +1;
          end;
          // aqui eu posto.

          if pos('CANCELADA',linha) >0 then
           cancelada :='1'
          else
           cancelada :='0';


          if nfvc_inicial <> nfvc_final then   // Conjunto de notas
            begin
              ctNotas:=StrToInt(nfvc_inicial);
              while  ctNotas <=  StrToInt(nfvc_final) do
               begin
                 q.Active :=false;
                 q.SQL.Clear;
                 q.SQL.Add('insert into notas_consumidor (codigo,numero_nota,serie,data_doc,data_lancamento,cfop,cst_icms,numero_ecf,valor_mercadorias,base_icms,aliq_icms,');
                 q.SQL.Add('valor_icms,reducao_base_icms,valor_doc,cancelado) values (');
                 q.SQL.add(''+Quotedstr(FormatFloat('000000',ctNotas))+',');
                 q.SQL.add(''+Quotedstr(FormatFloat('000000',ctNotas))+',');
                 q.SQL.add(''+Quotedstr('D1')+',');
                 q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
                 q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
                 q.SQL.add(''+Quotedstr(CFOP)+',');
                 if (trim(CFOP) = '5102') then
                   q.SQL.add(''+Quotedstr('000')+',')
                 else
                   q.SQL.add(''+Quotedstr('060')+',');
                 q.SQL.add(''+Quotedstr('001')+',');
                 q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');

                 if (StrToFloat(aliquota) > 0) then
                  q.SQL.add(''+dm.TrocaVirgPPto(valor)+',')
                 else
                  q.SQL.add(''+dm.TrocaVirgPPto('0')+',');

                 q.SQL.add(''+dm.TrocaVirgPPto(aliquota)+',');

                 valorIcms := (( StrToFloat(valor) * StrToFloat(aliquota) ) / 100);
                 q.SQL.add(''+dm.TrocaVirgPPto(FloatToStr(valorIcms))+',0,');
                 q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');
                 q.SQL.add(''+cancelada+')');

                 q.ExecSQL;
                 ctNotas:= ctNotas+1;
               end;
            end
          else    // Nota única
            begin
              q.Active :=false;
              q.SQL.Clear;
              q.SQL.Add('insert into notas_consumidor (codigo,numero_nota,serie,data_doc,data_lancamento,cfop,cst_icms,numero_ecf,valor_mercadorias,base_icms,aliq_icms,');
              q.SQL.Add('valor_icms,reducao_base_icms,valor_doc,cancelado) values (');
              q.SQL.add(''+Quotedstr(FormatFloat('000000',StrToFloat(nfvc_inicial) ))+',');
              q.SQL.add(''+Quotedstr(FormatFloat('000000',StrToFloat(nfvc_inicial) ))+',');
              q.SQL.add(''+Quotedstr('D1')+',');
              q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
              q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
              if (trim(CFOP) = '5102') then
               begin
                 q.SQL.add(''+Quotedstr(CFOP)+',');
                 q.SQL.add(''+Quotedstr('000')+',');
               end
              else
               begin
                q.SQL.add(''+Quotedstr('5403')+',');
                q.SQL.add(''+Quotedstr('060')+',');
               end;
              q.SQL.add(''+Quotedstr('001')+',');
              q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');

              if (StrToFloat(aliquota) > 0) then
                q.SQL.add(''+dm.TrocaVirgPPto(valor)+',')
              else
                q.SQL.add(''+dm.TrocaVirgPPto('0')+',');
              q.SQL.add(''+dm.TrocaVirgPPto(aliquota)+',');

              valorIcms := (( StrToFloat(valor) * StrToFloat(aliquota) ) / 100);
              q.SQL.add(''+dm.TrocaVirgPPto(FloatToStr(valorIcms))+',0,');
              q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');
              q.SQL.add(''+cancelada+')');
              q.ExecSQL;

            end;
        end;

    end;

    showmessage('FIm');
   dm.transacao.Commit;
   FreeAndNil(q);
end;



procedure TfrmImportacaoDadosTextoZ.importaFortes();
var
 ct : integer;
 ctNotas : integer;
 linha : string;
 ctLInha, tamanhoLinha : integer;
 valorCampo : string;
 numeroCampo : integer;
 dia : string;
 data : string;
 mesAno : string;
 nfvc_inicial,nfvc_final : string;
 valor : string;
 CFOP : string;
 aliquota : string;
 valorIcms : double;
 baseIcms : string;
 q : TIBQuery;
 cancelada : string;
 qtdNotas : integer;
 merda : string;
 VL : DOUBLE;
begin
  inherited;

  q := TIBQuery.Create(Self);
  q.Database:=dm.dbrestaurante;
  q.Transaction:=dm.transacao;
  q.Active:=false;


  mesAno:='06.2010';

  Memo1.Lines.LoadFromFile(Edit2.Text );
  Memo2.Lines.Clear;

   For ct:=0 to Memo1.Lines.Count do
    begin
      linha := Trim(Memo1.Lines[ct]);
      if  ( copy(linha,0,4) = 'NFVC' ) then
        begin
         tamanhoLinha :=  dm.AnsiLength(linha);
         numeroCampo := 1;
         ctLInha:=1;
         valorCampo :='';
         while (ctLinha <= tamanhoLinha )do
          begin
            if (trim(copy(linha,ctlinha,1)) <> '') then
              begin
                 valorCampo :=valorCampo + trim(copy(linha,ctlinha,1));
              end
            else
             begin
             if (trim(valorCampo) <> '') then
             begin
                 case numeroCampo of
                  1: begin
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;
                  2: begin
                         numeroCampo := numeroCampo +1;
                         valorCampo :='';
                      end;

                  3: begin
                       nfvc_inicial := valorCampo;
                       if valorCampo = '0000060609' then showmessage('AGORA');
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  4: begin
                         if ( dm.AnsiLength(Trim(valorCampo)) = 1) then
                          begin
                           numeroCampo := numeroCampo +1;
                           valorCampo :='';
                          end
                         else
                          begin
                           dia := valorCampo;
                           valorCampo :='';
                           numeroCampo := numeroCampo +2;
                          end;

                      end;

                  5: begin
                       if ( dm.AnsiLength(Trim(valorCampo)) = 2) then
                         begin
                           nfvc_final := nfvc_inicial;
                           dia := valorCampo;
                           valorCampo :='';
                           numeroCampo := numeroCampo +2;
                         end
                       else
                         begin
                           nfvc_final := valorCampo;
                           numeroCampo := numeroCampo +1;
                             valorCampo :='';
                         end;
                     end;

                  6: begin
                       dia := valorCampo;
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  7: begin
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                      end;

                  8: begin
                       valor := dm.removePonto(valorCampo);
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  9: begin
                       if valorCampo  <> '0004' then
                        begin
                         CFOP  := dm.removeCaracteres (valorCampo);
                         numeroCampo := numeroCampo +1;
                        end;
                       valorCampo :='';
                     end;

                  10: begin
                       baseIcms := dm.removePonto(valorCampo);
                       numeroCampo := numeroCampo +1;
                       valorCampo :='';
                     end;

                  11: begin
                       aliquota      := valorCampo;
                       numeroCampo   := numeroCampo +1;
                       valorCampo :='';
                     end;

                 end;
             end;

               if (numeroCampo >=10 ) then
                 begin
                   if StrToFloat(valor) <=0 then
                     begin
                       aliquota :='0';
                       ctLInha := tamanhoLinha +1;
                     end;

                 end;

             end;

            ctLInha := ctLInha +1;
          end;
          // aqui eu posto.

          if pos('Cancelado',linha) >0 then
           cancelada :='1'
          else
           cancelada :='0';


          if nfvc_inicial <> nfvc_final then   // Conjunto de notas
            begin
              ctNotas:=StrToInt(nfvc_inicial);

              qtdNotas:= StrToInt(nfvc_final) - StrToInt(nfvc_inicial);
              Edit4.Text := IntToStr(qtdNotas);
              Edit4.Text := Inttostr(strToInt(edit4.Text)+1);

              Edit3.text := VarToStr(valor);
              Edit3.Text := Floattostr( strToFloat(edit3.text) / StrToInt(Edit4.text) );
              valor := Edit3.Text;



              Edit3.text := VarToStr(baseIcms);
              Edit3.Text := Floattostr( strToFloat(edit3.text) / StrToInt(Edit4.text) );
              baseIcms   := Edit3.Text;


              while  ctNotas <=  StrToInt(nfvc_final) do
               begin
                 q.Active :=false;
                 q.SQL.Clear;
                 q.SQL.Add('insert into notas_consumidor (codigo,numero_nota,serie,data_doc,data_lancamento,cfop,cst_icms,numero_ecf,valor_mercadorias,base_icms,aliq_icms,');
                 q.SQL.Add('valor_icms,reducao_base_icms,valor_doc,cancelado) values (');
                 q.SQL.add(''+Quotedstr(FormatFloat('000000',ctNotas))+',');
                 q.SQL.add(''+Quotedstr(FormatFloat('000000',ctNotas))+',');
                 q.SQL.add(''+Quotedstr('D1')+',');
                 q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
                 q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
                 q.SQL.add(''+Quotedstr(CFOP)+',');
                 if (trim(CFOP) = '5102') then
                   q.SQL.add(''+Quotedstr('000')+',')
                 else
                   q.SQL.add(''+Quotedstr('060')+',');
                 q.SQL.add(''+Quotedstr('001')+',');
                 q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');

                 if (StrToFloat(aliquota) > 0) then
                  q.SQL.add(''+dm.TrocaVirgPPto(baseIcms)+',')
                 else
                  q.SQL.add(''+dm.TrocaVirgPPto('0')+',');

                 q.SQL.add(''+dm.TrocaVirgPPto(aliquota)+',');

                 valorIcms := (( StrToFloat(baseIcms) * StrToFloat(aliquota) ) / 100);
                 q.SQL.add(''+dm.TrocaVirgPPto(FloatToStr(valorIcms))+',0,');
                 q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');
                 q.SQL.add(''+cancelada+')');

                 q.ExecSQL;
                 ctNotas:= ctNotas+1;
               end;
            end
          else    // Nota única
            begin
              q.Active :=false;
              q.SQL.Clear;
              q.SQL.Add('insert into notas_consumidor (codigo,numero_nota,serie,data_doc,data_lancamento,cfop,cst_icms,numero_ecf,valor_mercadorias,base_icms,aliq_icms,');
              q.SQL.Add('valor_icms,reducao_base_icms,valor_doc,cancelado) values (');
              q.SQL.add(''+Quotedstr(FormatFloat('000000',StrToFloat(nfvc_inicial) ))+',');
              q.SQL.add(''+Quotedstr(FormatFloat('000000',StrToFloat(nfvc_inicial) ))+',');
              q.SQL.add(''+Quotedstr('D1')+',');
              q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
              q.SQL.add(''+Quotedstr(dia+'.'+mesAno)+',');
              if (trim(CFOP) = '5102') then
               begin
                 q.SQL.add(''+Quotedstr(CFOP)+',');
                 q.SQL.add(''+Quotedstr('000')+',');
               end
              else
               begin
                q.SQL.add(''+Quotedstr('5403')+',');
                q.SQL.add(''+Quotedstr('060')+',');
               end;
              q.SQL.add(''+Quotedstr('001')+',');
              q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');

              if (StrToFloat(aliquota) > 0) then
                q.SQL.add(''+dm.TrocaVirgPPto(baseIcms)+',')
              else
                q.SQL.add(''+dm.TrocaVirgPPto('0')+',');
              q.SQL.add(''+dm.TrocaVirgPPto(aliquota)+',');

              valorIcms := (( StrToFloat(baseIcms) * StrToFloat(aliquota) ) / 100);
              q.SQL.add(''+dm.TrocaVirgPPto(FloatToStr(valorIcms))+',0,');
              q.SQL.add(''+dm.TrocaVirgPPto(valor)+',');
              q.SQL.add(''+cancelada+')');
              q.ExecSQL;

            end;
        end;

    end;

    q.Active :=false;
    q.SQL.clear;
    q.SQL.add('update notas_consumidor set valor_mercadorias=0,base_icms=0,aliq_icms=0,reducao_base_icms=0,valor_icms=0,valor_doc=0 where cancelado=1');
    q.ExecSQL;

    showmessage('FIm');
   dm.transacao.Commit;
   FreeAndNil(q);
end;


procedure TfrmImportacaoDadosTextoZ.Button2Click(Sender: TObject);
begin
  inherited;
   importaFortes();
end;

end.
