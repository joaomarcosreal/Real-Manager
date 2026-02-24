unit uuRelSangrias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.ExtCtrls,  System.DateUtils,
  Vcl.StdCtrls, AdvGlassButton,
  RxToolEdit, cxGraphics, cxControls,

  cxDBLookupComboBox, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  Vcl.Buttons, cxLookupEdit, cxDBLookupEdit, Vcl.Mask, Vcl.Menus;

type
  TfrmRelSangrias = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    edDataInicial: TDateEdit;
    Panel4: TPanel;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    edDataFinal: TDateEdit;
    AdvGlassButton1: TAdvGlassButton;
    btImprimirInventario: TAdvGlassButton;
    cbTipoSangria: TcxLookupComboBox;
    Label4: TLabel;
    rdTipoAgrupamento: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure btImprimirInventarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function verificaValidade: boolean;
    procedure emitirRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSangrias: TfrmRelSangrias;

implementation

{$R *.dfm}

uses uu_frm_principal, uu_data_module, UU_DM_RELATORIOS;

procedure TfrmRelSangrias.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelSangrias.btImprimirInventarioClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
     begin
       emitirRelatorio;
     end;
end;

procedure TfrmRelSangrias.emitirRelatorio();

begin
  inherited;

//  dm.transacao.Active:=false;
//  dm.transacao.Active:=true;
  dm_relatorios.qryRelSangrias.Active := false;
  dm_relatorios.qryRelSangrias.sql.Clear;

  case rdTipoAgrupamento.ItemIndex  of
   0: begin
        dm_relatorios.qryRelSangrias.SQL.add('    select s.codigo, s.data, s.valor, s.nome_usuario_autorizou, s.cod_caixa, ');
        dm_relatorios.qryRelSangrias.SQL.add('           s.cod_usuario, s.codigo_tipo,tp.descricao,s.obs  from sangrias s ');
        dm_relatorios.qryRelSangrias.SQL.add('      inner join tipos_sangria tp on (tp.codigo = s.codigo_tipo) ');
        dm_relatorios.qryRelSangrias.SQL.add('        where s.data between :vpDataInicial and :vpDataFinal ');

        if cbTipoSangria.EditValue <> '000'  then
         begin
           dm_relatorios.qryRelSangrias.SQL.Add(' and s.codigo_tipo='+Quotedstr(cbTipoSangria.EditValue));
         end;

        dm_relatorios.qryRelSangrias.SQL.add('         order by s.codigo_tipo,s.data ');
        dm_relatorios.qryRelSangrias.ParamByName('vpDataInicial').Value := edDataInicial.Date;
        dm_relatorios.qryRelSangrias.ParamByName('vpDataFinal').Value := edDataFinal.Date;
        dm_relatorios.qryRelSangrias.Active := true;
        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\uuRelSangriasAgrupadoTipo.fr3',true);
      end;

   1: begin

        dm_relatorios.qryRelSangrias.SQL.add('    select s.codigo, s.data, s.valor, s.nome_usuario_autorizou, s.cod_caixa, ');
        dm_relatorios.qryRelSangrias.SQL.add('           s.cod_usuario, s.codigo_tipo,tp.descricao,s.obs  from sangrias s ');
        dm_relatorios.qryRelSangrias.SQL.add('      inner join tipos_sangria tp on (tp.codigo = s.codigo_tipo) ');
        dm_relatorios.qryRelSangrias.SQL.add('        where s.data between :vpDataInicial and :vpDataFinal ');

        if cbTipoSangria.EditValue <> '000'  then
         begin
           dm_relatorios.qryRelSangrias.SQL.Add(' and s.codigo_tipo='+Quotedstr(cbTipoSangria.EditValue));
         end;

        dm_relatorios.qryRelSangrias.SQL.add('         order by s.data,s.codigo_tipo ');
        dm_relatorios.qryRelSangrias.ParamByName('vpDataInicial').Value := edDataInicial.Date;
        dm_relatorios.qryRelSangrias.ParamByName('vpDataFinal').Value := edDataFinal.Date;
        dm_relatorios.qryRelSangrias.Active := true;
        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\uuRelSangriasAgrupadoData.fr3',true);



      end;
  end;


  dm_relatorios.setPeriodoRelatorio('De '+FormatDateTime('DD/MM/YY',edDataInicial.Date)
                                    +' até '+FormatDateTime('DD/MM/YY',edDataFinal.Date));
  dm_relatorios.rpt.PrepareReport(true);
  dm_relatorios.rpt.ShowReport(false);
  dm_relatorios.qryRelSangrias.Active := false;
//  dm.transacao.Active := false;
end;


function TfrmRelSangrias.verificaValidade() : boolean;
begin

  if (  edDataInicial.date > edDataFinal.date ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    edDataInicial.SetFocus;
    result:=false;
    exit;
  end;

  result:=true;

end;

procedure TfrmRelSangrias.FormActivate(Sender: TObject);
begin
  inherited;

  dm.qryTiposSangria.Active := false;
  dm.qryTiposSangria.SQL.Clear;
  dm.qryTiposSangria.SQL.Add('    select * from ( ');
  dm.qryTiposSangria.SQL.Add('      select '+Quotedstr('000')+' as codigo, '+Quotedstr('TODAS AS SANGRIAS')+' as descricao from parametros ');
  dm.qryTiposSangria.SQL.Add('       UNION ALL ');
  dm.qryTiposSangria.SQL.Add('      select * from tipos_sangria ');
  dm.qryTiposSangria.SQL.Add('                   ) order by codigo ');
  dm.qryTiposSangria.Active := true;
  cbTipoSangria.EditValue := '000';
  edDataInicial.Date  := StartOfTheMonth(data_do_sistema);
  edDataFinal.Date    := EndOfTheMonth(data_do_sistema);
  edDataInicial.SetFocus;


end;

procedure TfrmRelSangrias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dm.qryTiposSangria.Active := false;
end;

end.
