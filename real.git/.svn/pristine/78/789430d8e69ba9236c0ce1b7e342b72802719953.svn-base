unit frm_modelo_rel_datasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  Tfrm_modelo_rel_datas = class(Tfrm_modelo_vazio)
    frm_modelo_rel_datas: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    Panel2: TPanel;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    procedure bt_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function verificaDatas() : boolean;
  end;

var
  frm_modelo_rel_datas: Tfrm_modelo_rel_datas;
  dataInicial, dataFinal : string;

implementation

{$R *.dfm}



function Tfrm_modelo_rel_datas.verificaDatas() : boolean;
begin
 try
   StrToDate(ed_data_inicial.Text)
 except
  begin
    showmessage('Data inicial inválida!');
    ed_data_inicial.SetFocus;
    ed_data_inicial.clear;
    Result:=false;
    exit;
  end;
 end;

 try
   StrToDate(ed_data_final.Text)
 except
  begin
    showmessage('Data final inválida!');
    ed_data_final.SetFocus;
    ed_data_final.Clear;
    Result:=false;
    exit;
  end;
 end;


 if (StrToDate(ed_data_inicial.Text) > StrToDate(ed_data_final.text)) then
  begin
    ShowMessage('Intervalo de datas inválido!');
    ed_data_final.SetFocus;
    ed_data_final.clear;
    Result:=false;
    exit;
  end;


 dataInicial:=Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_inicial.text)));
 dataFinal:=Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(ed_data_final.text))); 

 Result:=true;
end;


procedure Tfrm_modelo_rel_datas.bt_sairClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
