unit uuConfNFCEEmitidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons;

type
  TfrmConferenciaNFCEEmitidas = class(Tfrm_modelo_vazio)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConferenciaNFCEEmitidas: TfrmConferenciaNFCEEmitidas;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmConferenciaNFCEEmitidas.Button1Click(Sender: TObject);
var
 ultimaNotaMesAnterior : integer;
 ultimaNotaMes : integer;

 serieAtual : integer;

 notaAtual  : integer;

begin
  inherited;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select  cf.serie_nfce_normal,  cf.numero_nfce_normal, ');
  dm.qryauxiliar.sql.add('        cf.serie_nfce_offline, cf.numero_nfce_offline');
  dm.qryauxiliar.sql.add('           from configuracoes_estacao cf');
  dm.qryauxiliar.sql.add(' order by cf.numero_caixa');
  dm.qryauxiliar.Active := true;



   dm.qryauxiliar.First;
   while not dm.qryauxiliar.Eof do
    begin
       serieAtual := dm.qryauxiliar.fieldbyname('serie_nfce').Value;

       dm.qryauxiliar2.Active := False;
       dm.qryauxiliar2.SQL.Clear;
       dm.qryauxiliar2.sql.add('  select first 1 v.numero_nfce  from vendas v where  v.data < '+Quotedstr('01.01.2017'));
       dm.qryauxiliar2.sql.add('  and v.serie_nfce='+IntToStr(serieAtual));
       dm.qryauxiliar2.sql.add('      order by v.numero_nfce desc   ');
       dm.qryauxiliar2.Active := True;
       if not dm.qryauxiliar2.IsEmpty then
         ultimaNotaMesAnterior := dm.qryauxiliar2.fieldbyname('numero_nfce').Value
       else
         ultimaNotaMesAnterior :=0;


       dm.qryauxiliar2.Active := False;
       dm.qryauxiliar2.SQL.Clear;
       dm.qryauxiliar2.sql.add('  select first 1 v.numero_nfce  from vendas v where  v.data between '+Quotedstr('01.12.2016')+' and '+Quotedstr('31.12.2016'));
       dm.qryauxiliar2.sql.add('  and v.serie_nfce='+IntToStr(serieAtual));
       dm.qryauxiliar2.sql.add('      order by v.numero_nfce desc   ');
       dm.qryauxiliar2.Active := True;
       ultimaNotaMes := dm.qryauxiliar2.fieldbyname('numero_nfce').Value;

       dm.qryauxiliar2.Active := False;
       dm.qryauxiliar2.SQL.Clear;
       dm.qryauxiliar2.SQL.add(' select v.numero_nfce  from vendas v where v.serie_nfce='+IntToStr(serieAtual));
       dm.qryauxiliar2.SQL.add('   and v.numero_nfce between '+IntToStr(ultimaNotaMesAnterior + 1)+' and '+IntToStr(ultimaNotaMesAnterior)+' order by v.numero_nfce ');
       dm.qryauxiliar2.Active := True;
       dm.qryauxiliar2.First;


        notaAtual := ultimaNotaMesAnterior +1;
       while not dm.qryauxiliar2.Eof do
        begin
           while ( notaAtual < dm.qryauxiliar2.FieldByName('numero_nfce').Value ) do
            begin
              Memo1.Lines.Add('Serie: '+Inttostr(dm.qryauxiliar.fieldbyname('serie_nfce').Value)+'  Nota:'+Inttostr(notaAtual));
              notaAtual := notaAtual +1;
            end;

        end;



   end;

       
       





 
end;

end.
