unit uuRelContatoEstrategicoDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmRelContatoEstrategicoDelivery = class(Tfrm_modelo_rel_datas)
    rdgSelecaoFiltro: TRadioGroup;
    Panel1: TPanel;
    Label3: TLabel;
    edInicioFaixa: TEdit;
    Label4: TLabel;
    edFimFaixa: TEdit;
    Label5: TLabel;
    ckbDatas: TCheckBox;
    procedure emitirRelatorio();
    function  verificaValidade() : boolean;
    procedure rdgSelecaoFiltroClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure ckbDatasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelContatoEstrategicoDelivery: TfrmRelContatoEstrategicoDelivery;

implementation

uses UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


procedure TfrmRelContatoEstrategicoDelivery.emitirRelatorio();
begin
  dm_relatorios.qryContatoEstrategicoDelivery.Active:=false;
  dm_relatorios.qryContatoEstrategicoDelivery.SQL.clear;

  if rdgSelecaoFiltro.ItemIndex = 0 then
   begin
     dm_relatorios.qryContatoEstrategicoDelivery.SQL.add('select * from v_contato_estrategico_delivery  c');
     dm_relatorios.qryContatoEstrategicoDelivery.SQL.add(' where diascorridos >='+edInicioFaixa.text+' and diascorridos<='+edFimFaixa.Text);
   end
  else
   begin
     dm_relatorios.qryContatoEstrategicoDelivery.SQL.add(' select * from v_contato_estrategico_delivery  c');
     dm_relatorios.qryContatoEstrategicoDelivery.SQL.add(' inner join clientes_delivery cli on (cli.codigo = c.codigo)');
     dm_relatorios.qryContatoEstrategicoDelivery.SQL.add(' where c.freq_compra >= cli.freq_compra');
   end;



  if (ckbDatas.Checked  ) then
   begin
     dm_relatorios.qryContatoEstrategicoDelivery.SQL.add(' and dataultimo between '+QuotedStr(FormatDateTime('DD.MM.YYY',StrToDate(ed_data_inicial.Text))));
     dm_relatorios.qryContatoEstrategicoDelivery.sql.add(' and '+QuotedStr(FormatDateTime('DD.MM.YYY',StrToDate(ed_data_final.Text))));
   end;



  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relContatoEstrategicoDelivery.fr3',true);
//  dm_relatorios.setPeriodoRelatorio('De  '+ ed_data_inicial.Text +'  até  '+ed_data_final.Text);
  dm_relatorios.rpt.ShowReport(true);



end;



procedure TfrmRelContatoEstrategicoDelivery.rdgSelecaoFiltroClick(
  Sender: TObject);
begin
  inherited;
  if rdgSelecaoFiltro.ItemIndex = 0    then
   begin
     edInicioFaixa.Enabled:=true;
     edFimFaixa.Enabled:=true;
     edInicioFaixa.text:='0';
     edFimFaixa.Text :='30';

   end
  else
    begin
     edInicioFaixa.Enabled:=false;
     edFimFaixa.Enabled:=false;
     edInicioFaixa.text:='0';
     edFimFaixa.Text :='30';
    end;
end;


function TfrmRelContatoEstrategicoDelivery.verificaValidade() : boolean;
begin

  if (  ckbDatas.Checked  ) then
   begin
     if (verificaDatas = false) then
      begin
        Result:=false;
        exit;
      end;
   end;

   if rdgSelecaoFiltro.ItemIndex = 0 then
    begin
      try
       begin
         edInicioFaixa.Text :=Inttostr(StrToInt(edInicioFaixa.text));
         edFimFaixa.Text    :=Inttostr(StrToInt(edFimFaixa.text));
       end;
      except
       begin
         showmessage('Faixa inválida');
         edInicioFaixa.SetFocus;
         Result:=false;
         exit;
       end;
      end;

      if strToInt(edFimFaixa.Text) < StrToInt(edInicioFaixa.Text) then
      begin
         showmessage('Faixa inválida');
         edInicioFaixa.SetFocus;
         Result:=false;
         exit;
      end;
    end;

    Result:=true;

end;

procedure TfrmRelContatoEstrategicoDelivery.bt_imprimirClick(
  Sender: TObject);
begin
  inherited;
   if (verificaValidade = true) then
   begin
     emitirRelatorio();
   end;
end;

procedure TfrmRelContatoEstrategicoDelivery.ckbDatasClick(Sender: TObject);
begin
  inherited;
  if ckbDatas.Checked then
   begin
     ed_data_inicial.Enabled:=true;
     ed_data_final.Enabled:=true;
     ed_data_inicial.Text:='';
     ed_data_final.Text:=''
   end
  else
  begin
     ed_data_inicial.Enabled:=false;
     ed_data_final.Enabled:=false;
     ed_data_inicial.Text:='';
     ed_data_final.Text:='';
  end;
end;

end.
