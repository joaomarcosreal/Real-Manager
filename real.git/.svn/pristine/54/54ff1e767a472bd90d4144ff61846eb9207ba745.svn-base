unit uu_rel_vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Mask, RDprint, ExtCtrls, Buttons;

type
  Tfrm_rel_vendas = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    rdp: TRDprint;
    Panel5: TPanel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbk_visualizar: TCheckBox;
    Panel2: TPanel;
    RDprint1: TRDprint;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    procedure bt_sairClick(Sender: TObject);
    function  imprimir_cabecalho : boolean;
    function corpo_relatorio : boolean;
    procedure bt_imprimirClick(Sender: TObject);
    procedure ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_data_inicialExit(Sender: TObject);
    procedure ed_data_inicialEnter(Sender: TObject);
    procedure bt_imprimirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_sairMouseEnter(sender: TObject);
    procedure bt_sairMouseExit(sender: TObject);
    procedure bt_imprimirMouseEnter(sender: TObject);
    procedure bt_imprimirMouseExit(sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_vendas: Tfrm_rel_vendas;
  linha : smallint;

implementation

uses uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

procedure Tfrm_rel_vendas.bt_sairClick(Sender: TObject);
begin
  Close;
end;

function Tfrm_rel_vendas.imprimir_cabecalho : boolean;
begin
  dm.tb_parametros.active:=true;
  rdp.ImpF(linha,1,dm.tb_parametros.fieldbyname('razao_social').Value+' - '+dm.tb_parametros.fieldbyname('nome_fantasia').Value,[negrito]);
  linha:=linha+1;
  rdp.ImpF(linha,1,'Data: '+FormatDateTime('DD/MM/YY',dm.tb_parametros.fieldbyname('data_sistema').Value)+' - Hora: '+formatdatetime('HH:MM',time),[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'Usuário: '+codigo_usuario,[negrito]);
  linha:=linha+3;
  rdp.ImpC(linha,40,'Relatório de Vendas', [negrito,expandido]);
  linha:=linha+1;
  rdp.ImpC(linha,40,ed_data_inicial.Text+' até '+ed_data_final.Text, [negrito,expandido]);
  linha:=linha+2;
  rdp.impf(linha,1,'Código',[negrito]);
  rdp.impf(linha,10,'Vl. Bruto',[negrito]);
  rdp.impf(linha,20,'Tx. Serv.',[negrito]);
  rdp.impf(linha,30,'Desconto',[negrito]);
  rdp.impf(linha,40,'Vl. Liq.',[negrito]);
  rdp.impf(linha,50,'Vl. Pago',[negrito]);
  rdp.impf(linha,60,'Troco',[negrito]);
  rdp.impf(linha,70,'Cupom',[negrito]);
  rdp.impf(linha,80,'Data',[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
end;

function Tfrm_rel_vendas.corpo_relatorio : boolean;
var
 total_bruto,total_txserv,total_desconto,total_troco,total_geral,total_pago : double;
begin
  total_bruto:=0;
  total_txserv:=0;
  total_desconto:=0;
  total_troco:=0;
  total_geral:=0;
  total_pago:=0;
  dm.qryauxiliar.active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from vendas where data >='+QuotedStr(FormatDateTime('DD.MM.YY',Strtodate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',Strtodate(ed_data_final.text))));
  dm.qryauxiliar.Active:=true;

  while  not dm.qryauxiliar.Eof do
  begin
    If linha >= 65 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;
    rdp.Impf(linha,1,dm.qryauxiliar.fieldbyname('cod_venda').value,[]);
    rdp.ImpVal(linha,10,'#0.00',dm.qryauxiliar.fieldbyname('valor_bruto').value,[]);
    total_bruto:=total_bruto+dm.qryauxiliar.fieldbyname('valor_bruto').value;

    rdp.ImpVal(linha,20,'#0.00',dm.qryauxiliar.fieldbyname('valor_txserv').value,[]);
    total_txserv:=total_txserv+dm.qryauxiliar.fieldbyname('valor_txserv').value;

    rdp.ImpVal(linha,30,'#0.00',dm.qryauxiliar.fieldbyname('valor_desconto').value,[]);
    total_desconto:=total_desconto+dm.qryauxiliar.fieldbyname('valor_desconto').value;

    rdp.ImpVal(linha,40,'#0.00',dm.qryauxiliar.fieldbyname('valor_total').value,[]);
    total_geral:=total_geral+dm.qryauxiliar.fieldbyname('valor_total').value;

    rdp.ImpVal(linha,50,'#0.00',dm.qryauxiliar.fieldbyname('total_pago').value,[]);
    total_pago:=total_pago+dm.qryauxiliar.fieldbyname('total_pago').value;

    rdp.ImpVal(linha,60,'#0.00',dm.qryauxiliar.fieldbyname('valor_troco').value,[]);
    total_troco:=total_troco+dm.qryauxiliar.fieldbyname('valor_troco').value;

    rdp.Impf(linha,70,dm.qryauxiliar.fieldbyname('cupom').value,[]);
    rdp.Impf(linha,80,FormatdateTime('DD/MM/YYY',dm.qryauxiliar.fieldbyname('data').value),[]);
    linha:=linha+1;
    dm.qryauxiliar.next;
  end;

   If linha+ 3 >= 65 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;



  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'Bruto',[negrito]);
  rdp.impf(linha,13,'Tx. Serv',[negrito]);
  rdp.impf(linha,24,'Desconto',[negrito]);
  rdp.impf(linha,35,'Liquido',[negrito]);
  rdp.impf(linha,45,'Pago',[negrito]);
  rdp.impf(linha,55,'Troco',[negrito]);
  linha:=linha+1;

  rdp.impf(linha,1,dm.ImpDireita(Formatfloat('#0.00',total_bruto),0),[]);
  rdp.impf(linha,13,dm.ImpDireita(Formatfloat('#0.00',total_txserv),0),[]);
  rdp.impf(linha,24,dm.ImpDireita(FormatFloat('#0.00',total_desconto),0),[]);
  rdp.impf(linha,35,dm.ImpDireita(Formatfloat('#0.00',total_geral),0),[]);
  rdp.impf(linha,45,dm.ImpDireita(FormatFloat('#0.00',total_pago),0),[]);
  rdp.impf(linha,55,dm.ImpDireita(FormatFloat('#0.00',total_troco),0),[]);
  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);












end;

procedure Tfrm_rel_vendas.bt_imprimirClick(Sender: TObject);
begin
  linha:=1;
  rdp.Abrir;
  imprimir_cabecalho;
  corpo_relatorio;
  if cbk_visualizar.Checked then
   begin
    rdp.OpcoesPreview.Preview:=true;
    rdp.OpcoesPreview.CaptionPreview:='Relatório de Vendas por período';
    rdp.OpcoesPreview.Remalina:=true;
    rdp.Fechar;
   end
  else
   begin
     rdp.OpcoesPreview.Preview:=False;
     if rdp.Setup then rdp.Fechar;
   end;

end;

procedure Tfrm_rel_vendas.ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_rel_vendas.ed_data_inicialExit(Sender: TObject);
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

procedure Tfrm_rel_vendas.ed_data_inicialEnter(Sender: TObject);
begin
 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=cor_foco_edit;
  end;

end;

procedure Tfrm_rel_vendas.bt_imprimirKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_escape then
  begin
     ed_data_inicial.SetFocus;
     exit;
  end;

end;

procedure Tfrm_rel_vendas.bt_sairMouseEnter(sender: TObject);
begin


end;

procedure Tfrm_rel_vendas.bt_sairMouseExit(sender: TObject);
begin


end;

procedure Tfrm_rel_vendas.bt_imprimirMouseEnter(sender: TObject);
begin


end;

procedure Tfrm_rel_vendas.bt_imprimirMouseExit(sender: TObject);
begin


end;

end.
