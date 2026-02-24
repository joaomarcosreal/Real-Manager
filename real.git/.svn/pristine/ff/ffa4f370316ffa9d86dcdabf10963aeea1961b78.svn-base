unit uu_rel_recebimentos_a;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RDprint, StdCtrls,  Mask, ExtCtrls, Buttons;

type
  Tfrm_rel_recebimentos_a = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    Label1: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    cbk_visualizar: TCheckBox;
    Panel2: TPanel;
    rdp: TRDprint;
    RDprint1: TRDprint;
    Label2: TLabel;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    procedure ed_data_inicialEnter(Sender: TObject);
    procedure ed_data_inicialExit(Sender: TObject);
    procedure ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_imprimirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_sairKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_imprimirClick(Sender: TObject);
    procedure imprimir_cabecalho;
    procedure corpo_relatorio ;
    procedure bt_sairClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_recebimentos_a: Tfrm_rel_recebimentos_a;
  linha : integer;

implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure Tfrm_rel_recebimentos_a.ed_data_inicialEnter(Sender: TObject);
begin
 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=cor_foco_edit;
  end;



end;

procedure Tfrm_rel_recebimentos_a.ed_data_inicialExit(Sender: TObject);
begin
 

 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=clWhite;
  end;


   if  sender is TMaskedit and ((sender as TMaskedit).Name = 'ed_data_inicial') then
   begin
     Try
       ed_data_inicial.Text:=FormatDateTime('DD/MM/YYY',StrTodate(ed_data_inicial.Text));
     except
      begin
        ShowMessage('Data inicial inválida!');
        ed_data_inicial.Clear;
        ed_data_inicial.SetFocus;
        exit;
      end;
     end;
   end;

   if  sender is TMaskedit and ((sender as TMaskedit).Name = 'ed_data_final') then
   begin
     Try
       ed_data_final.Text:=FormatDateTime('DD/MM/YYY',StrTodate(ed_data_final.Text));
     except
      begin
        ShowMessage('Data final inválida!');
        ed_data_final.Clear;
        ed_data_final.SetFocus;
        exit;
      end;
     end;

     if StrToDate(ed_data_inicial.text) > StrToDate(ed_data_final.Text) then
     begin
       ShowMessage('Data final não pode ser maior do que a data inicial');
       ed_data_final.Clear;
       ed_data_final.SetFocus;
       exit;
     end;
   end;


end;

procedure Tfrm_rel_recebimentos_a.ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;

  if key=vk_escape then
  begin
   if  sender is TMaskedit and ((sender as TMaskedit).Name <> 'ed_data_inicial') then
    begin
     ed_data_inicial.SetFocus;
     exit;
    end
   else
     Close;
  end;

end;

procedure Tfrm_rel_recebimentos_a.bt_imprimirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
  begin
     ed_data_inicial.SetFocus;
     exit;
  end;


end;

procedure Tfrm_rel_recebimentos_a.bt_sairKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
  begin
     ed_data_inicial.SetFocus;
     exit;
  end;


end;

procedure Tfrm_rel_recebimentos_a.bt_imprimirClick(Sender: TObject);
begin
  linha:=1;
  rdp.Abrir;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  imprimir_cabecalho;
  corpo_relatorio;

  if cbk_visualizar.Checked then
   begin
    rdp.OpcoesPreview.Preview:=true;
    rdp.OpcoesPreview.CaptionPreview:='Relatório de recebimentos por período';
    rdp.OpcoesPreview.Remalina:=true;
    rdp.Fechar;
   end
  else
   begin
     rdp.OpcoesPreview.Preview:=False;
     if rdp.Setup then rdp.Fechar;
   end;

end;

procedure Tfrm_rel_recebimentos_a.imprimir_cabecalho;
begin
  dm.tb_parametros.active:=true;
  rdp.ImpF(linha,1,dm.tb_parametros.fieldbyname('razao_social').Value+' - '+dm.tb_parametros.fieldbyname('nome_fantasia').Value,[negrito]);
  linha:=linha+1;
  rdp.ImpF(linha,1,'Data: '+FormatDateTime('DD/MM/YY',data_do_sistema)+' - Hora: '+formatdatetime('HH:MM',time),[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'Usuário: '+codigo_usuario,[negrito]);
  linha:=linha+3;
  rdp.ImpC(linha,40,'Recebimentos por período', [negrito,expandido]);
  linha:=linha+1;
  rdp.ImpC(linha,40,ed_data_inicial.Text+' até '+ed_data_final.Text, [negrito,expandido]);
  linha:=linha+2;

  rdp.impf(linha,1,'Código',[negrito]);
  rdp.impf(linha,8,'Descrição',[negrito]);
  rdp.impf(linha,40,'Data',[negrito]);
  rdp.impf(linha,54,'Valor (R$)',[negrito]);
  rdp.impf(linha,65,'Cod. Venda ',[negrito]);

  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
end;


procedure Tfrm_rel_recebimentos_a.corpo_relatorio;
var
 total_recebimentos : double;
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  total_recebimentos:=0;
  dm.qryauxiliar.sql.add('select recebimentos.*,formas_pagamento.* from recebimentos, formas_pagamento ');
  dm.qryauxiliar.sql.add(' where formas_pagamento.cod_forma=recebimentos.cod_forma and ');
  dm.qryauxiliar.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',Strtodate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',Strtodate(ed_data_final.text))));
  dm.qryauxiliar.Active:=true;

  while not dm.qryauxiliar.Eof do
  begin
    if linha >= 60 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;


    rdp.impf(linha,1,dm.qryauxiliar.fieldbyname('cod_forma').value,[]);
    rdp.impf(linha,8,dm.qryauxiliar.fieldbyname('descricao').value,[]);
    rdp.impf(linha,40,formatdatetime('DD/MM/YY',dm.qryauxiliar.fieldbyname('data').value),[]);
    rdp.impf(linha,54,FormatFloat('R$ #0.00',dm.qryauxiliar.fieldbyname('valor').value) ,[]);
    rdp.impf(linha,65,dm.qryauxiliar.fieldbyname('cod_venda').value,[]);
    linha:=linha+1;
    total_recebimentos:=total_recebimentos+dm.qryauxiliar.fieldbyname('valor').value;
    dm.qryauxiliar.next;
  end;
  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+1;


  dm.qryauxiliar2.Active:=false;
  dm.qryauxiliar2.SQL.Clear;
  dm.qryauxiliar2.SQL.Add('select sum(valor) as total, cod_forma from recebimentos  where ');
  dm.qryauxiliar2.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',Strtodate(ed_data_inicial.text))));
  dm.qryauxiliar2.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',Strtodate(ed_data_final.text))));
  dm.qryauxiliar2.sql.add(' group by cod_forma ');
  dm.qryauxiliar2.Active:=true;
  dm.qryauxiliar2.First;
  rdp.ImpF(linha,1,'Totais sintéticos',[negrito]);
  linha:=linha+2;



  while not dm.qryauxiliar2.Eof do
  begin
    if linha >= 60 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;

    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('select * from formas_pagamento where cod_forma='+Quotedstr(dm.qryauxiliar2.fieldbyname('cod_forma').value));
    dm.qryauxiliar.Active:=true;
    rdp.ImpF(linha,1,dm.qryauxiliar.fieldbyname('descricao').value,[negrito]);
    rdp.impf(linha,18,FormatFloat('R$ #0.00',dm.qryauxiliar2.fieldbyname('total').value),[]);
    linha:=linha+1;
    dm.qryauxiliar2.Next;

  end;
  linha:=linha+2;


  rdp.impf(linha,1,'Total de recebimentos no período: '+FormatFloat('R$ #0.00',total_recebimentos),[negrito]);

end;






procedure Tfrm_rel_recebimentos_a.bt_sairClick(Sender: TObject);
begin
  close;
end;

end.
