unit uuImportacaoLivrosEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, DB, RxMemDS,
  Grids, DBGrids, ibx.ibquery, ComCtrls;

type
  TfrmImportaLivrosEntrada = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    tbImportacao: TRxMemoryData;
    tbImportacaodataEntrada: TStringField;
    tbImportacaonumeroNota: TStringField;
    tbImportacaodataEmissao: TStringField;
    tbImportacaocnpj: TStringField;
    DataSource1: TDataSource;
    tbImportacaoserie: TStringField;
    tbImportacaotipoDoc: TStringField;
    tbImportacaoUF: TStringField;
    tbImportacaoIE: TStringField;
    tbImportacaovalor: TStringField;
    tbImportacaoCFOP: TStringField;
    tbImportacaonomeFornecedor: TStringField;
    Panel3: TPanel;
    memoArquivoEntradas: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    edCaminhoArquivoEntrada: TEdit;
    Label1: TLabel;
    lbQtdNotas: TLabel;
    lbTotalNotas: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaLivrosEntrada: TfrmImportaLivrosEntrada;

implementation

uses uu_data_module;



{$R *.dfm}

procedure TfrmImportaLivrosEntrada.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Execute;
  edCaminhoArquivoEntrada.text := OpenDialog1.FileName;

end;

procedure TfrmImportaLivrosEntrada.BitBtn1Click(Sender: TObject);
var
 ct  : integer;
 ct2 : integer;
 linhaLida : string;

 tamanhoLinha : integer;
 ctLinha : integer;
 valorCampo  : string;
 numeroCampo : integer;
 qryImportacaoLivros : Tibquery;
 qryVerificacao : Tibquery;
 qtdNotasImportadas : integer;
 totalNotasImportadas : double;


begin
  inherited;
  memoArquivoEntradas.Lines.LoadFromFile(edCaminhoArquivoEntrada.Text);
  tbImportacao.Active := false;
  tbImportacao.Active :=true;
  qtdNotasImportadas :=0;
  totalNotasImportadas :=0;

  for ct:=0 to memoArquivoEntradas.Lines.Count do
   begin
     linhaLida := trim(memoArquivoEntradas.Lines[ct]);
     try
      begin
         StrToDate(copy(linhaLida,0,10));
//         Memo1.Lines.Add(copy(linhaLida,0,217));
         tamanhoLinha :=  dm.AnsiLength(linhaLida);
         tbImportacao.Append;
         numeroCampo := 1;
         valorCampo  :='';
         for ctLinha:=1 to tamanhoLinha do
          begin
            if (trim(copy(linhaLida,ctlinha,1)) <> '') then
              begin
                 valorCampo :=valorCampo + trim(copy(linhaLida,ctlinha,1));
              end
            else
              begin
                //  Achou branco, incrementa o numero do campo
               if ( trim(valorCampo) <> '' ) then
                begin
                  case numeroCampo of
                   1: begin
                        tbImportacaodataEntrada.Value  :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;

                      end;
                   2: begin // não há interesse no campo
                       tbImportacaotipoDoc.Value   :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;
                   3: begin
                       if (dm.AnsiLength(valorCampo) = 10) then
                         begin
                          tbImportacaonumeroNota.Value   :=  valorCampo;
                          numeroCampo := numeroCampo +1;
                         end
                       else
                         tbImportacaoserie.Value   :=  valorCampo;

                       valorCampo :='';

                      end;
                   4: begin
                        tbImportacaodataEmissao.Value := valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;
                   5: begin
                        tbImportacaocnpj.Value         :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;

                   6: begin
                        tbImportacaoUF.Value         :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;

                   7: begin
                        tbImportacaoIE.Value         :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;

                   8: begin
                        tbImportacaoValor.Value         :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;

                   9: begin
                        tbImportacaoCFOP.Value         :=  valorCampo;
                        valorCampo :='';
                        numeroCampo := numeroCampo +1;
                      end;

                  end;

                end;

              end;
          end;

         ct2 := ct+1;  // Sai da linha corrente que constam os dados da nota
         
         while ( trim(memoArquivoEntradas.Lines[ct2]) = '' ) do  // Procura linha com o nome do fornecedor
           ct2 := ct2+1;

         linhaLida := trim(memoArquivoEntradas.Lines[ct2]);
         tbImportacaonomeFornecedor.Value := trim(copy(linhaLida,0,150));
         tbImportacao.Post;
      end;
     except
      begin
      end;
     end;
   end;


  qryImportacaoLivros := TIBQuery.Create(self);
  qryImportacaoLivros.Database := dm.dbrestaurante;
  qryImportacaoLivros.Transaction := dm.transacao;
  qryImportacaoLivros.Active:=false;

  qryVerificacao := TIBQuery.Create(self);
  qryVerificacao.Database := dm.dbrestaurante;
  qryVerificacao.Transaction := dm.transacao;
  qryVerificacao.Active:=false;




  dm.transacao.Active:=true;
  tbImportacao.First;

  while not tbImportacao.Eof do
   begin

     // Verifica se a nota atual já consta na base dos sistema.
     qryVerificacao.Active :=false;
     qryVerificacao.sql.clear;
     qryVerificacao.SQL.Add('select * from livros_entrada where cnpj ='+QuotedStr(dm.removeCaracteres(tbImportacaocnpj.Value))+' and ');
     qryVerificacao.SQL.Add(' numero_nota='+Quotedstr(FormatFloat('000000000000000',StrToFloat(tbImportacaonumeroNota.Value)))+' and ');
     qryVerificacao.SQL.Add('   total_nota='+dm.TrocaPontoPVirgula(dm.removePonto(tbImportacaovalor.Value))+' and ');
     qryVerificacao.SQL.add('   cfop='+QuotedStr(tbImportacaoCFOP.Value)+' and');
     qryVerificacao.SQL.Add('   tipo_doc='+QuotedStr(tbImportacaotipoDoc.Value));
     qryVerificacao.Active :=true;

     if qryVerificacao.IsEmpty  then  // caso a nota não exista no repositório do sistema, inclui
       begin
           qryImportacaoLivros.Active := false;
           qryImportacaoLivros.SQL.clear;
           qryImportacaoLivros.sql.add('insert into livros_entrada (data_entrada,data_emissao,tipo_doc,cnpj,numero_nota,serie,uf,ie,total_nota,cfop,nome_fornecedor) values (');
           qryImportacaoLivros.SQL.Add(''+QUotedstr(FormatDateTime('DD.MM.YYY',StrToDate(tbImportacaodataEntrada.Value)))+',');
           qryImportacaoLivros.SQL.Add(''+QUotedstr(FormatDateTime('DD.MM.YYY',StrToDate(tbImportacaodataEmissao.Value)))+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(tbImportacaotipoDoc.Value)+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(dm.removeCaracteres(tbImportacaocnpj.Value))+',');
           qryImportacaoLivros.SQL.Add(''+Quotedstr(FormatFloat('000000000000000',StrToFloat(tbImportacaonumeroNota.Value)))+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(tbImportacaoserie.Value)+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(tbImportacaoUF.Value)+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(tbImportacaoIE.Value)+',');
           qryImportacaoLivros.SQL.Add(''+dm.TrocaPontoPVirgula(dm.removePonto(tbImportacaovalor.Value))+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(tbImportacaoCFOP.Value)+',');
           qryImportacaoLivros.SQL.Add(''+QuotedStr(tbImportacaonomeFornecedor.Value)+')');
           try
            qryImportacaoLivros.ExecSQL;
           except
            begin
               showmessage('Erro ao executar SQL de importação!');
               exit;
            end;
           end;
       end;

     qtdNotasImportadas :=qtdNotasImportadas +1;
     totalNotasImportadas := totalNotasImportadas + StrToFloat(dm.removePonto(tbImportacaovalor.Value));
     tbImportacao.Next;
   end;

   

   ShowMessage('Finalizado com sucesso!'+#13#10#13#10+'Quantidade de notas...: '+IntToStr(qtdNotasImportadas)+#13#10+'Total das Notas.......: '+FormatFloat('R$ ###,###,##0.00',totalNotasImportadas));

   dm.transacao.Commit;

end;

end.
