unit uuRelAniversariantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, ibx.Ibquery,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelAniversariantes = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    cmbInicio: TComboBox;
    cmbFim: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    CheckBox3: TCheckBox;
    edIdadeInicial: TEdit;
    edIdadeFinal: TEdit;
    ckbFaixa: TCheckBox;
    ckbEmail: TCheckBox;
    ckbTelefone: TCheckBox;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup3: TRadioGroup;
    function  verificarValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAniversariantes: TfrmRelAniversariantes;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}



function TfrmRelAniversariantes.verificarValidade() : boolean;
begin
 if cmbFim.ItemIndex < cmbInicio.ItemIndex then
   begin
      Showmessage('Período Inválido. O mês final não pode ser menor que o mês que inicia o período.');
      result:=false;
      exit;
   end;
  result:=true;
end;


procedure TfrmRelAniversariantes.emitirRelatorio();
var
  qryAniversariantes: TIBQuery;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  qryAniversariantes := TIBQuery.Create(Self);
  with qryAniversariantes do
  begin
    Name := 'qryAniversariantes';
    Database := dm.dbrestaurante;
    Transaction := dm.transacao;
    BufferChunks := 1000;
    CachedUpdates := False;
    SQL.Clear;
  end;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\aniversariantes.fr3',true);
  qryAniversariantes.Active:=false;
  qryAniversariantes.SQL.clear;
  qryAniversariantes.sql.add('select c.cod_cli, c.razao_social as nome , c.dtnascimento, c.email, c.telefone, ( Extract( day from    dtnascimento)||'+Quotedstr('/')+'|| Extract(month from   dtnascimento)) as aniversario,');
  qryAniversariantes.sql.add('Extract(month from   dtnascimento) as mes,  udf_day(dtNascimento) as dia,    upper(udf_monthname(dtnascimento)) as nomeMes ,udf_age(dtnascimento)+1 as idade ');
  qryAniversariantes.sql.add('    from clientes c');
  qryAniversariantes.sql.add('  where  Extract(month from   dtnascimento)  between '+Inttostr(cmbInicio.ItemIndex+1) +' and '+Inttostr(cmbFim.ItemIndex+1) );

  if ckbFaixa.Checked then
  begin
   qryAniversariantes.SQL.add(' and (udf_age(dtnascimento)+1) between '+edIdadeInicial.text+' and '+edIdadefinal.text);
  end;

  if ckbTelefone.Checked then
   begin
     qryAniversariantes.SQL.add(' and c.telefone is not null');
   end;

  if ckbEmail.Checked then
   begin
     qryAniversariantes.SQL.add(' and c.email is not null');
   end;



  qryAniversariantes.sql.add('    order by mes,dia');

  qryAniversariantes.Active:=true;

  dm_relatorios.dtClientesAniversariantes.DataSet:= qryAniversariantes;
  dm_relatorios.setPeriodoRelatorio('De  '+ cmbInicio.Text +'  até  '+cmbFim.Text);

  dm_relatorios.rpt.ShowReport(true);
  FreeAndNil(qryAniversariantes)




end;
procedure TfrmRelAniversariantes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificarValidade then
   begin
     emitirRelatorio;
   end;
end;

procedure TfrmRelAniversariantes.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelAniversariantes.FormActivate(Sender: TObject);
begin
  inherited;
  cmbInicio.SetFocus;
end;

end.
