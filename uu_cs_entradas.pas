unit uu_cs_entradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, Buttons, Mask, DBCtrls, StdCtrls, Grids,db,
  DBGrids, ExtCtrls, AdvGlassButton;

type
  Tfrm_cs_entradas = class(Tfrm_modelo_pesquisas)
    BitBtn1: TBitBtn;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label6: TLabel;
    Panel4: TPanel;
    ed_razao_social_fornecedor: TEdit;
    ed_cod_fornecedor: TEdit;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    edDataEntradaInicial: TMaskEdit;
    edDataEntradaFinal: TMaskEdit;
    GroupBox3: TGroupBox;
    Panel6: TPanel;
    Label8: TLabel;
    Label11: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    gpNota: TGroupBox;
    Panel7: TPanel;
    edNumeroNota: TEdit;
    gpChave: TGroupBox;
    Panel8: TPanel;
    edChaveNFE: TEdit;


    function  verificaValidade() : boolean;
    procedure processarConsulta();

    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edChaveNFEExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_entradas: Tfrm_cs_entradas;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

function Tfrm_cs_entradas.verificaValidade() : boolean;
begin

  if ( trim(ed_cod_fornecedor.text) <> '')  then
   begin
      if ( verificaExistenciaFornecedor(ed_cod_fornecedor.text) = false ) then
        begin
         ShowMessage('Fornecedor especifado não existe!');
         ed_cod_fornecedor.setfocus;
         Result:=false;
         exit;
        end;
   end;




    if ( (Trim(edDataEntradaInicial.Text) <> '/  /' ) and   (Trim(edDataEntradaInicial.Text) <> '' )) then
     begin
       Try
        begin
          edDataEntradaInicial.Text := FormatDateTime('DD/MM/YYYY',StrToDate(edDataEntradaInicial.Text));
          edDataEntradaFinal.Text   := FormatDateTime('DD/MM/YYYY',StrToDate(edDataEntradaFinal.Text));
        end;
       except
        begin
          showmessage('Período de entrada inválido!');
          edDataEntradaInicial.SetFocus;
          Result:=false;
          edDataEntradaInicial.SetFocus;
          exit;
        end;
       end;

       if ( StrToDate(edDataEntradaFinal.Text) < StrToDate(edDataEntradaInicial.Text)) then
        begin
          showmessage('Data final de entrada não pode ser maior que a data inicial de entrada!');
          result:=false;
          edDataEntradaFinal.SetFocus;
          edDataEntradaFinal.clear;
          exit;
        end;
     end;

   result:=true;
end;



procedure Tfrm_cs_entradas.processarConsulta();
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select e.*, f.razao_social,f.nome_fantasia,u.login,u.nome_usuario,  epg.descricao as DescricaoLoja from entradas     e');
  dm.qry_consultas.sql.add('inner join fornecedor       f  on (f.cod_fornecedor      = e.cod_fornecedor)');
  dm.qry_consultas.sql.add('inner join usuarios         u  on (u.cod_usuario         = e.cod_usuario)');
  dm.qry_consultas.sql.add('inner join empresas_grupo epg on (epg.codigo = e.cod_emp_grupo)');

  dm.qry_consultas.SQL.add(' where e.cod_entrada <> '+Quotedstr(''));


  if ( trim(ed_cod_fornecedor.text) <> '')  then
   begin
     dm.qry_consultas.sql.add(' and e.cod_fornecedor='+Quotedstr(ed_cod_fornecedor.text));
   end;





    if ( (Trim(edDataEntradaInicial.Text) <> '/  /' ) and   (Trim(edDataEntradaInicial.Text) <> '' )) then
     begin
       dm.qry_consultas.sql.add(' and e.data_entrada between '+Quotedstr( FormatDateTime('DD.MM.YYYY',StrToDate(edDataEntradaInicial.text))));
       dm.qry_consultas.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',StrToDate(edDataEntradaFinal.text))));
     end;


  if ( Trim(edNumeroNota.Text) <> '' ) then
     begin
       dm.qry_consultas.sql.add(' and e.numero_nota='+Quotedstr(edNumeroNota.Text));
     end;

  if ( Trim(edChaveNFE.text) <> '' ) then
   begin
     dm.qry_consultas.sql.add(' and e.chave_nfe='+Quotedstr(edChaveNFE.Text));
   end;


  dm.qry_consultas.Active:=true;
//  TFloatField(dm.qry_consultas.Fields[23]).DisplayFormat := 'R$ ###,###,##0.00';


end;



procedure Tfrm_cs_entradas.BitBtn1Click(Sender: TObject);
begin
//  inherited;
  if verificaValidade() then
    processarConsulta();
end;

procedure Tfrm_cs_entradas.FormActivate(Sender: TObject);
begin
  inherited;
   inherited;
  frm_cs_entradas.Top:=0;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select e.*, f.razao_social,f.nome_fantasia,u.login,u.nome_usuario,  epg.descricao as DescricaoLoja from entradas     e');
  dm.qry_consultas.sql.add('inner join fornecedor       f  on (f.cod_fornecedor      = e.cod_fornecedor)');
  dm.qry_consultas.sql.add('inner join usuarios         u  on (u.cod_usuario         = e.cod_usuario)');
  dm.qry_consultas.sql.add('inner join empresas_grupo epg on (epg.codigo = e.cod_emp_grupo)');

  dm.qry_consultas.Active:=true;
//  TFloatField(dm.qry_consultas.Fields[23]).DisplayFormat := 'R$ ###,###,##0.00';
  ed_cod_fornecedor.SetFocus;
end;

procedure Tfrm_cs_entradas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if odd(dm.qry_consultas.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clred; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure Tfrm_cs_entradas.edChaveNFEExit(Sender: TObject);
begin
  inherited;
  if (sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroNota')) then
   begin
    if (trim(edNumeroNota.text) <> '')
     then
      begin
         try
           edNumeroNota.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNota.Text));
         except
          begin
            showmessage('Número da nota fiscal inválido!');
            edNumeroNota.SetFocus;
            exit;
          end;
         end;
      end;
   end;

end;

end.
