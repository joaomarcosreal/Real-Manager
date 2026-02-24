unit uuGeraArquivoBalanca;

interface

uses
  Winapi.Windows, Vcl.FileCtrl, Winapi.Messages, ibx.ibquery, IBX.IBDatabase, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  ACBrCargaBal, System.TypInfo, Vcl.ExtCtrls,
  Vcl.Buttons, StrUtils, AdvGlassButton, cxGraphics, cxControls,
  cxProgressBar, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, ACBrBase,
  Vcl.Menus;

type
  TfrmGerarArquivoCargaBalanca = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    ACBrCargaBal1: TACBrCargaBal;
    cbxModelo: TComboBox;
    Label2: TLabel;
    edtDiretorio: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    btImprimir: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    cxProgressBar1: TcxProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarArquivoCargaBalanca: TfrmGerarArquivoCargaBalanca;

implementation

{$R *.dfm}

uses uu_data_module;

procedure TfrmGerarArquivoCargaBalanca.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmGerarArquivoCargaBalanca.BitBtn1Click(Sender: TObject);
var
  Diretorio: String;
begin
  if SelectDirectory('Selecione o diretório onde serão gerados os arquivos:', '', Diretorio) then
    edtDiretorio.Text := Diretorio;
end;

procedure TfrmGerarArquivoCargaBalanca.btImprimirClick(Sender: TObject);
var
  LQryConsulta: TIBquery;
  Ltransacao: TIBTransaction;
begin
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := false;
  Ltransacao.Active := true;
  LQryConsulta := TIBquery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := Ltransacao;

  try

   try
     ACBrCargaBal1.Modelo := TACBrCargaBalModelo(cbxModelo.ItemIndex);
     LQryConsulta.Active := false;
     LQryConsulta.SQL.Clear;


     LQryConsulta.SQL.add('  select p.cod_produto, p.cod_grupo, p.descricao, p.valor_unitario , p.balanca,p.validade,p.un_ecf,  g.descricao as nome_grupo ');
     LQryConsulta.SQL.add(' from produtos p ');
     LQryConsulta.SQL.add('     inner join grupos g on (g.cod_grupo = p.cod_grupo) ');
     LQryConsulta.SQL.add('     where p.fracionado=1 and p.vende=1 ');
     LQryConsulta.SQL.add(' union all ');
     LQryConsulta.SQL.add('  select cast(pt.codigo as varchar(5)) as cod_produto, p.cod_grupo,  tb.prefixo||'+Quotedstr(' ')+'||p.descricao as descricao, pt.valor_unitario , p.balanca, p.validade, p.un_ecf, g.descricao as nome_grupo ');
     LQryConsulta.SQL.add('    from produtos_tabela_precos  pt ');
     LQryConsulta.SQL.add('    inner join produtos p on (p.cod_produto = pt.cod_produto) ');
     LQryConsulta.SQL.add('    inner join tabelas_preco tb on (tb.codigo = pt.cod_tabela ) ');
     LQryConsulta.SQL.add('    inner join grupos g on (g.cod_grupo = p.cod_grupo)');
     LQryConsulta.SQL.add('     where p.fracionado=1 and p.vende=1 ');


     ////dm.adicionalog(LQryConsulta.SQL.Text);


     LQryConsulta.Active := true;
     LQryConsulta.FetchAll;
     cxProgressBar1.Properties.Max := LQryConsulta.RecordCount;


     while not LQryConsulta.Eof  do
      begin
        with ACBrCargaBal1.Produtos.New do
        begin
          ModeloEtiqueta  := 1;
          Tipo            := tpvPeso;
          Codigo          := LQryConsulta.FieldByName('cod_produto').Value;
          Descricao       := LQryConsulta.FieldByName('descricao').Value;
          ValorVenda      := LQryConsulta.FieldByName('valor_unitario').Value;
          Validade        := 0;
//          Tecla           := 0;
          validade        := LQryConsulta.FieldByName('validade').Value;
          case AnsiIndexStr(UpperCase(trim(LQryConsulta.FieldByName('UN_ECF').Value)), ['UN', 'KG']) of
           0: Tipo := tpvUnidade;
           1: Tipo := tpvPeso;
          end;


  //        Nutricional     := Format('Informação Nutricional do item %d', [I]);;
  {
          Nutricional.Codigo:=I;
          Nutricional.Qtd :=1;
          Nutricional.UndPorcao := tpGramas;
          Nutricional.PartInteira :=1;
          Nutricional.PartDecimal:= tpPara12;
          Nutricional.MedCaseira := tpColherSopa;
          Nutricional.ValorEnergetico := 20;
          Nutricional.Carboidrato := 2;
          Nutricional.Proteina := 3;
          Nutricional.GorduraTotal:= 4;
          Nutricional.GorduraSaturada:=5;
          Nutricional.GorduraTrans := 6;
          Nutricional.Fibra := 7;
          Nutricional.Sodio :=8;
                              }
          Setor.Codigo    := 1; //LQryConsulta.FieldByName('cod_grupo').Value  ;
          Setor.Descricao := 'GERAL'; //LQryConsulta.FieldByName('nome_grupo').Value;
        end;

       cxProgressBar1.Position := cxProgressBar1.Position +1;
       LQryConsulta.Next;
      end;

      ACBrCargaBal1.GerarArquivos(edtDiretorio.Text);
      dm.exibe_painel_erro('Arquivo gerado com sucesso!'+sLineBreak+IntToStr(LQryConsulta.RecordCount)+' produtos foram importados.','Ok');
   except
    dm.exibe_painel_erro('Ocorreu um erro ao gerar o arquivo!','Ok');

   end;

  finally
    LQryConsulta.Active := false;
    Ltransacao.Active := false;
    FreeAndNil(LQryConsulta);
    FreeAndNil(Ltransacao);
  end;


end;

procedure TfrmGerarArquivoCargaBalanca.FormActivate(Sender: TObject);
var
  I: TACBrCargaBalModelo;
begin
   edtDiretorio.Clear;
  cbxModelo.Items.Clear ;
  for I := Low(TACBrCargaBalModelo) to High(TACBrCargaBalModelo) do
    cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrCargaBalModelo), integer(I) ) ) ;

  cbxModelo.ItemIndex := 0;
end;
procedure TfrmGerarArquivoCargaBalanca.FormCreate(Sender: TObject);
var
  I: TACBrCargaBalModelo;
begin
  edtDiretorio.Clear;

  cbxModelo.Items.Clear ;
  for I := Low(TACBrCargaBalModelo) to High(TACBrCargaBalModelo) do
    cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrCargaBalModelo), integer(I) ) ) ;

  cbxModelo.ItemIndex := 0;
end;

end.
