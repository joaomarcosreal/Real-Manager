unit uuRelConsumoClientesNaCasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask, ExtCtrls, Buttons, ibx.Ibquery,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmConsumoClientesNaCasa = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edCartaoInicial: TMaskEdit;
    edCartaoFinal: TMaskEdit;
    cbk_visualizar: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure emitirRelatorio();
    function  verificaValidade : boolean;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmConsumoClientesNaCasa: TfrmConsumoClientesNaCasa;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

procedure TfrmConsumoClientesNaCasa.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsumoClientesNaCasa.Edit1Exit(Sender: TObject);
begin
  inherited;

      if(   ((sender as TCustomEdit).Name='edCartaoInicial')  or (((sender as TCustomEdit).Name='edCartaoFinal'))      ) then
       try
        (sender as TCustomEdit).Text := FormatFloat('0000',StrToFloat((sender as TCustomEdit).Text));
       except
        begin
          showmessage('Intervalo de cartões inválido');
          edCartaoInicial.SetFocus;
          exit;
        end;
       end;
end;






procedure TfrmConsumoClientesNaCasa .emitirRelatorio();
var
  qryConsumoClientes: TIBQuery;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  qryConsumoClientes := TIBQuery.Create(Self);
  with qryConsumoClientes do
  begin
    Name := 'qryConsumoClientes';
    Database := dm.dbrestaurante;
    Transaction := dm.transacao;
    BufferChunks := 1000;
    CachedUpdates := False;
    SQL.Clear;
  end;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\consumoAtualClientes.fr3',true);

  qryConsumoClientes.sql.add('select cm.cartao, c.razao_social,  cm.total_consumo, c.telefone from consumoatualclientes cm');
  qryConsumoClientes.sql.add('  inner join clientes c on (c.cod_cli = cm.cod_cli)');
  qryConsumoClientes.sql.add('  where cm.cartao between '+Quotedstr(edCartaoInicial.text) + ' and '+QUotedstr(edCartaoFInal.text));
  qryConsumoClientes.sql.add('  order by cm.total_consumo desc');
  qryConsumoClientes.Active:=true;

  dm_relatorios.setPeriodoRelatorio('Cartão '+ edCartaoInicial.Text +'  até  '+edCartaoFinal.Text);
  dm_relatorios.dtConsumoClientes.DataSet:= qryConsumoClientes;
  dm_relatorios.rpt.ShowReport(true);
  FreeAndNil(qryConsumoClientes)
end;




function TfrmConsumoClientesNaCasa.verificaValidade : boolean;
begin
   try
   begin
     if (StrToInt(edCartaoInicial.text) > StrToInt(edCartaoFinal.text) ) then
      begin
        showmessage('Período inválido. Cartão inicial não pode ser maior do que o cartão final');
        edCartaoInicial.setfocus;
        result:=false;
        exit;
      end;
   end;
  except
   begin
    showmessage('Período inválido');
    edCartaoInicial.setfocus;
    result:=false;
    exit;
   end;
  end;

  result:=true;

end;









procedure TfrmConsumoClientesNaCasa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade  then
    emitirRelatorio;
end;

end.
