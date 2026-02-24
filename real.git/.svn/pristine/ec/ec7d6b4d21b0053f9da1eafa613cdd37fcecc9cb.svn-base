unit uuRelCancelamentoProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.Mask, RxToolEdit,DateUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JvExMask, JvSpin;

type
  TfrmRelCancelamentosProdutos = class(Tfrm_modelo_vazio)
    Panel6: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    edDataInicial: TDateEdit;
    Panel7: TPanel;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    edDataFinal: TDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    edHoraInicial: TJvTimeEdit;
    edHoraFinal: TJvTimeEdit;
    Label3: TLabel;
    Label5: TLabel;
    lbTitulo: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
     procedure emitirRelatorio();
     function  verificaValidade() : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCancelamentosProdutos: TfrmRelCancelamentosProdutos;

implementation

{$R *.dfm}

uses UU_DM_RELATORIOS, uuDmRelatorios, uu_frm_principal, uu_data_module;

procedure TfrmRelCancelamentosProdutos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade  then
    emitirRelatorio;
end;

procedure TfrmRelCancelamentosProdutos.BitBtn2Click(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmRelCancelamentosProdutos.emitirRelatorio();
begin

 dRelatorios.qryRelEstornos.Active := false;
 dRelatorios.qryRelEstornos.SQL.Clear;
 dRelatorios.qryRelEstornos.SQL.Add(' select upper( udf_monthname(c.data_sistema)) ||'+Quotedstr('/')+'|| udf_year(c.data_sistema) mes,  c.codigo,c.data_sistema, e.hora,c.nome_usuario,e.nome_usuario_autorizou, c.numero_caixa, e.descricao,');
 dRelatorios.qryRelEstornos.SQL.Add('        e.quantidade,e.valor_unitario,(e.quantidade * e.valor_unitario) as total');
 dRelatorios.qryRelEstornos.SQL.Add('  from  estornos e');
 dRelatorios.qryRelEstornos.SQL.Add('  inner join caixas c on (c.codigo = e.cod_caixa)');
 dRelatorios.qryRelEstornos.SQL.Add('    where c.data_sistema  between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
 dRelatorios.qryRelEstornos.SQL.Add('    and e.hora between '+Quotedstr(edHoraInicial.Text+':00')+' and '+Quotedstr(edHoraFinal.Text +':59' ));
 dRelatorios.qryRelEstornos.SQL.Add('    order by udf_year(c.data_sistema),udf_month(c.data_sistema), c.data_sistema');
 dm.adicionaLog(dRelatorios.qryRelEstornos.SQL.Text );
 dRelatorios.qryRelEstornos.Active := true;

 dRelatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text+' - Entre '+edHoraInicial.Text +' e '+edHoraFinal.Text);
 dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relEstornosPeriodoDetalhado.fr3',true);
 dRelatorios.rpt.ShowReport(true);
 dRelatorios.qryParametros.Active:=true;
 dRelatorios.qryRelEstornos.Active:=false;


end;


function TfrmRelCancelamentosProdutos.verificaValidade() : boolean;
begin
  Result:=false;

  try
   begin
     StrToDate(edDataInicial.text);
     StrToDate(edDataFinal.text);

   end;
  except
   begin
      Showmessage('Período de datas inválido');
      edDataInicial.SetFocus;
      result:=false;
      exit;
   end;
  end;

  if (  edDataInicial.Date  > edDataFinal.Date  ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    edDataInicial.SetFocus;
    result:=false;
    exit;
  end;



  result:=true;
end;


procedure TfrmRelCancelamentosProdutos.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.SetFocus;
  edDataInicial.Date := Today;
  edDataFinal.Date := today;
  edHoraInicial.Value := StrToTime('00:00:00');
  edHoraFinal.Value := StrToTime('23:59:59');


end;

end.
