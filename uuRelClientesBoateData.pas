unit uuRelClientesBoateData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, Mask, ibx.Ibquery,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelatorioclientesData = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    cbk_visualizar: TCheckBox;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rdOrdenacao: TRadioGroup;

    function  verificaValidade() : boolean;
    procedure emitirRelatorio();

    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioclientesData: TfrmRelatorioclientesData;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}



function TfrmRelatorioclientesData.verificaValidade() : boolean;
begin
  try
    ed_data_inicial.Text := FormatDateTime('DD/MM/YYY',StrToDate(ed_data_inicial.Text));
  except
   begin
     ShowMessage('Data inicial inválida');
     ed_data_inicial.SetFocus;
     result:=false;
     exit;
   end;
  end;



  try
    ed_data_final.Text := FormatDateTime('DD/MM/YYY',StrToDate(ed_data_final.Text));
  except
   begin
     ShowMessage('Data final inválida');
     ed_data_final.SetFocus;
     result:=false;
     exit;
   end;
  end;

  if (  StrToDate(ed_data_inicial.Text) > StrToDate(ed_data_final.Text) ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result:=false;
    exit;
  end;

  result:=true;

end;


procedure TfrmRelatorioclientesData.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioclientesData.emitirRelatorio();
var
  qryClientesBoate: TIBQuery;
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  qryClientesBoate := TIBQuery.Create(Self);
  with qryClientesBoate do
  begin
    Name := 'qryClientesBoate';
    Database := dm.dbrestaurante;
    Transaction := dm.transacao;
    BufferChunks := 1000;
    CachedUpdates := False;
    SQL.Clear;
  end;

  qryClientesBoate.Active:=false;
  qryClientesBoate.sql.Clear;

  qryClientesBoate.sql.add('select  mv.data,mv.cartao,cli.razao_social as nome, cli.telefone, cli.rg, ');
  qryClientesBoate.sql.add('        cast(mv.hora_entrada as time) as hora_entrada, cast(mv.hora_pagamento as time) as hora_pagamento');
  qryClientesBoate.sql.add('        , cast(mv.hora_saida as time) as hora_saida,');
  qryClientesBoate.sql.add(' mv.consumo');
  qryClientesBoate.sql.add('   from movimentacao_clientes mv');
  qryClientesBoate.sql.add('   inner join clientes cli on (cli.cod_cli = mv.cod_cli)');
  qryClientesBoate.sql.add('   where data between  '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_inicial.Text) ))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY', StrToDate(ed_data_final.EditText))));
  qryClientesBoate.sql.add(' order by mv.data,');

  case rdOrdenacao.ItemIndex of
   0 : qryClientesBoate.sql.add('mv.cartao');
   1 : qryClientesBoate.sql.add('cli.razao_social');
   2 : qryClientesBoate.sql.add('mv.consumo desc');
  end;

  qryClientesBoate.Active := true;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioClientesBoateData.fr3',true);
  dm_relatorios.dtClientesBoatePeriodo.DataSet := qryClientesBoate;
  dm_relatorios.setPeriodoRelatorio('De  '+ ed_data_inicial.Text +'  até  '+ed_data_final.Text);
  dm_relatorios.rpt.ShowReport(true);
  FreeAndNil(qryClientesBoate )


end;




procedure TfrmRelatorioclientesData.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    emitirRelatorio;
end;

procedure TfrmRelatorioclientesData.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.SetFocus;
end;

end.
