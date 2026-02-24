unit uu_cs_reg60A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Mask;

type
  TfrmCsReg60A = class(Tfrm_modelo_pesquisas)
    edDataInicial: TMaskEdit;
    edDataFinal: TMaskEdit;
    De: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure pesquisaRegistros();
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsReg60A: TfrmCsReg60A;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsReg60A.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select cod_reg,data,num_serie,coo_ini,coo_fim,aliq7,aliq12,aliq17,aliq25,substituicao,isencao,naotributado from reg60M ');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsReg60A.pesquisaRegistros();
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select cod_reg,data,num_serie,coo_ini,coo_fim,aliq7,aliq12,aliq17,aliq25,substituicao,isencao,naotributado from reg60M ');
  dm.qry_consultas.sql.add(' where data between '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(edDataInicial.text))));
  dm.qry_consultas.sql.add(' and '+Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(edDataFinal.text))));
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsReg60A.BitBtn1Click(Sender: TObject);
begin
  inherited;
  pesquisaRegistros();
end;

end.
