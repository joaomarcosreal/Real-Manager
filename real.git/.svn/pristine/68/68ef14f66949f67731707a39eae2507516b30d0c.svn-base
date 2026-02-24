unit uuSintegraBP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, IBquery;

type
  TfrmBoiPreto = class(Tfrm_modelo_cadastro)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    DBEdit1: TEdit;
    DBEdit2: TEdit;
    edCro: TEdit;
    DBEdit4: TEdit;
    DBEdit10: TEdit;
    DBEdit5: TEdit;
    DBEdit11: TEdit;
    DBEdit12: TEdit;
    DBEdit7: TEdit;
    DBEdit9: TEdit;
    DBEdit8: TEdit;
    edData: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gravar();
  end;

var
  frmBoiPreto: TfrmBoiPreto;

implementation

uses uu_data_module, uu_frm_principal;


{$R *.dfm}

procedure TfrmBoiPreto.gravar();
var
 codigo : string;
 q : Tibquery;
begin

 codigo :=dm.geraCodigo('G_REG60M',8);
 q := TIBQuery.Create(Self);
 q.Database:=dm.dbrestaurante;
 q.Transaction:=dm.transacao;
 q.Active:=false;
 q.sql.add('insert into reg60M (cod_reg,data,modelo,coo_ini,coo_fim,cont_z,co_rein_op,cancelamentos,');
 q.sql.add('descontos,substituicao,isencao,naotributado,venda_bruta,tot_geral) values (');
 q.sql.add(QuotedStr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',strToDate(edData.text)   ))+',');
 q.sql.add(QuotedStr(asdas'2D')+',');daaasd
 q.sql.add(QuotedStr()+',');
 q.sql.add(QuotedStr(NumCOO)+',');
 q.sql.add(QuotedStr(NumCRZ)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(ed  =   )))+',');
 q.sql.add(TrocaVirgPPto(TotalCancelamentos)+',');
 q.sql.add(TrocaVirgPPto(TotalDescontos)+',');
 q.sql.add(TrocaVirgPPto(TotalSubstituicaoTributaria)+',');
 q.sql.add(TrocaVirgPPto(TotalIsencao)+',');
 q.sql.add(TrocaVirgPPto(TotalNaoTributado)+',');
 q.sql.add(TrocaVirgPPto(VendaBruta)+',');
 q.sql.add(TrocaVirgPPto(GrandeTotal)+')');
 try
   q.ExecSQL;
 Except
   frm_principal.memo_avisos.Lines := q.sql;
   frm_principal.memo_avisos.Visible :=true;
 end;



end;

end.
