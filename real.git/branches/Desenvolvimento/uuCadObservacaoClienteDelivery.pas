unit uuCadObservacaoClienteDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ibquery,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, Vcl.ActnList,
  System.Actions;

type
  TfrmCadObsClienteDelivery = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    memo_obs: TMemo;
    Label1: TLabel;
    ckbAlerta: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure gravarObservaco();
    procedure setCodCLi(codigo : string);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadObsClienteDelivery: TfrmCadObsClienteDelivery;
  codCliente : string;

implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure TfrmCadObsClienteDelivery.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;


procedure TfrmCadObsClienteDelivery.gravarObservaco();
var
 observacao : string;
 ct : integer;
 q : TIbquery;
 codObs : string;
begin

  for ct:= 0 to memo_obs.Lines.Count  do
   begin
     observacao := observacao+#13+memo_obs.lines[ct];
   end;

  if trim(observacao) = '' then
   begin
     showmessage('Digite alguma observação');
     exit;
   end;


  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  dm.transacao.Active:=true;

  codObs:=Inttostr(StrToInt(dm.geraCodigo('G_OBS_CLIENTES_DELIVERY',5)));

  q.Active:=false;
  q.SQL.clear;
  q.SQL.add('insert into obs_clientes_delivery (codigo,cod_cli,data,observacao,alerta) values (');
  q.sql.add(''+codObs+',');
  q.sql.add(''+Quotedstr(codCliente)+',');
  q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  q.sql.add(''+Quotedstr(observacao)+',');
  if ckbAlerta.Checked = true then
    q.sql.add('1)')
  else
    q.sql.add('0)');



  try
    q.ExecSQL;
  except
   begin
     Showmessage('Erro ao incluir observação!');
     exit;
   end;
  end;

  showmessage('Observação incluída com sucesso!');
  dm.transacao.Commit();
  

end;


procedure TfrmCadObsClienteDelivery.setCodCLi(codigo : string);
begin
 codCliente := codigo;

end;


procedure TfrmCadObsClienteDelivery.BitBtn1Click(Sender: TObject);
begin
  inherited;
  gravarObservaco();
  close();
end;

end.
