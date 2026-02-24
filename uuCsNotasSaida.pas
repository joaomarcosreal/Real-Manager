unit uuCsNotasSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, Mask, Buttons, StdCtrls, Grids, DBGrids,
  ExtCtrls, Data.DB;

type
  TfrmCsNotasSaida = class(Tfrm_modelo_pesquisas)
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
    GroupBox4: TGroupBox;
    Panel7: TPanel;
    edNumeroNota: TEdit;
    BitBtn1: TBitBtn;

    function  verificaValidade() : boolean;
    procedure processarConsulta();
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsNotasSaida: TfrmCsNotasSaida;

implementation

uses uu_data_module;

{$R *.dfm}


function TfrmCsNotasSaida.verificaValidade() : boolean;
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




    if ( Trim(edDataEntradaInicial.Text) <> '' ) then
     begin
       Try
        begin
          edDataEntradaInicial.Text := FormatDateTime('DD/MM/YYYY',StrToDate(edDataEntradaInicial.Text));
          edDataEntradaFinal.Text   := FormatDateTime('DD/MM/YYYY',StrToDate(edDataEntradaFinal.Text));
        end;
       except
        begin
          showmessage('Período de saída inválido!');
          edDataEntradaInicial.SetFocus;
          Result:=false;
          edDataEntradaInicial.SetFocus;
          exit;
        end;
       end;

       if ( StrToDate(edDataEntradaFinal.Text) < StrToDate(edDataEntradaInicial.Text)) then
        begin
          showmessage('Data final de saída não pode ser maior que a data inicial de entrada!');
          result:=false;
          edDataEntradaFinal.SetFocus;
          edDataEntradaFinal.clear;
          exit;
        end;
     end;

   result:=true;
end;


procedure TfrmCsNotasSaida.Edit1Exit(Sender: TObject);
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







procedure TfrmCsNotasSaida.processarConsulta();
begin
  dm.qry_consultas.Active:=false;

  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select s.*, f.razao_social,f.nome_fantasia,u.login,u.nome_usuario from saidas  s');
  dm.qry_consultas.sql.add('inner join fornecedor       f  on (f.cod_fornecedor      = s.cod_fornecedor)');
  dm.qry_consultas.sql.add('inner join usuarios         u  on (u.cod_usuario         = s.cod_usuario)');
  dm.qry_consultas.SQL.add(' where s.cod_saida <> '+Quotedstr(''));
  dm.qry_consultas.Active:=true;

  if ( trim(ed_cod_fornecedor.text) <> '')  then
   begin
     dm.qry_consultas.sql.add(' and s.cod_fornecedor='+Quotedstr(ed_cod_fornecedor.text));
   end;


  if ( Trim(edDataEntradaInicial.Text) <> '' ) then
     begin
       dm.qry_consultas.sql.add(' and s.data_saida between '+Quotedstr( FormatDateTime('DD.MM.YYYY',StrToDate(edDataEntradaInicial.text))));
       dm.qry_consultas.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',StrToDate(edDataEntradaFinal.text))));
     end;


  if ( Trim(edNumeroNota.Text) <> '' ) then
     begin
       dm.qry_consultas.sql.add(' and s.numero_nota='+Quotedstr(edNumeroNota.Text));
     end;



   dm.qry_consultas.Active:=true;


end;












procedure TfrmCsNotasSaida.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade() then
    processarConsulta();

end;

procedure TfrmCsNotasSaida.FormActivate(Sender: TObject);
begin
  inherited;
  with DBGrid1 do
  begin
    Name := 'DBGrid1';
    Parent := Panel1;
    Left := 3;
    Top := 3;
    Width := 998;
    Height := 340;
    DataSource := dm.ds_qry_consultas;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -11;
    Font.Name := 'MS Sans Serif';
    Font.Style := [];
    Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit];
    ParentFont := False;
    ReadOnly := True;
    TabOrder := 0;
    TitleFont.Charset := DEFAULT_CHARSET;
    TitleFont.Color := clWindowText;
    TitleFont.Height := -11;
    TitleFont.Name := 'MS Sans Serif';
    TitleFont.Style := [fsBold];
    OnDrawColumnCell := DBGrid1DrawColumnCell;
    OnDblClick := bt_selecionarClick;
    OnEnter := ed_parametroEnter;
    OnExit := ed_parametroExit;
    OnKeyDown := ed_parametroKeyDown;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'COD_SAIDA';
      Title.Caption := 'C'#243'digo';
      Width := 100;
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'RAZAO_SOCIAL';
      Title.Caption := 'Nome / Raz'#227'o Social do fornecedor';
      Width := 265;
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'DESCRICAO_TP_ENTRADA';
      Title.Caption := 'Tipo de entrada';
      Visible := False;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'DESC_TP_DOC';
      Title.Caption := 'Tipo do documento';
      Visible := False;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'NUMERO_NOTA';
      Title.Caption := 'N'#186' da nota';
      Width := 173;
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'DATA_EMISSAO';
      Title.Caption := 'Emiss'#227'o';
      Width := 94;
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'DATA_SAIDA';
      Title.Caption := 'Saída';
      Width := 93;
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'DATA';
      Title.Caption := 'Lan'#231'amento';
      Width := 80;
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'HORA';
      Title.Caption := 'Hora';
      Visible := True;
    end;
    with Columns.Add do begin 
      Expanded := False;
      FieldName := 'NOME_USUARIO';
      Title.Caption := 'Usu'#225'rio';
      Width := 102;
      Visible := True;
    end;
  end;

end;


procedure TfrmCsNotasSaida.DBGrid1DrawColumnCell(Sender: TObject;
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

end.
