unit uuSelecaoSabores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, Buttons, ExtCtrls, ibquery ;

type
  TfrmSelecaoSabores = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel1: TPanel;
    bt_selecionar: TBitBtn;
    Panel2: TPanel;
    memo_obs: TMemo;
    ScrollBox1: TScrollBox;
    ckb0: TCheckBox;
    procedure criarSabores();
    procedure criarSelecao();
    procedure bt_selecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure memo_obsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecaoSabores: TfrmSelecaoSabores;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}



procedure TfrmSelecaoSabores.criarSabores();
var
 q : TIBquery;
 ckb : TCheckBox;
 top_c, left_c : integer;
 qtBt : integer;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.Active:=false;
 q.sql.clear;
 q.sql.add('select * from sabores_produtos order by cod_sabor');
 q.Active:=true;
 top_c:=1;
 left_c:=2;
 qtBt:=0;
 ckb0.Destroy;
 ckb0.Free;
 ScrollBox1.Repaint;
 while not q.Eof do
 begin
    ckb := TCheckBox.Create(Self);
    CKB.Parent := ScrollBox1;
    ckb.Name:=  'ckb'+Inttostr(qtBt);
    CKB.Left := left_c;
    CKB.Top := top_c;
    ckb.OnEnter:= Edit1.OnEnter;
    ckb.OnExit:= Edit1.OnExit;
    ckb.OnKeyDown:= memo_obs.OnKeyDown;

    CKB.Width := 135;
    CKB.Height := 17;
    ckb.Caption:= q.fieldbyname('descricao').value;
    if (top_c >= 207) then
     begin
      top_c:=1;
      left_c:=left_c+ 139;
     end
    else
     begin
      top_c:=top_c+18;
     end;
    qtBt:=qtBt+1;
    q.Next;
 end;

 try
  ckb0.SetFocus;
 except
 end;
end;



procedure TfrmSelecaoSabores.criarSelecao();
var
 i : integer;
 obs : string;
begin
  memo_obs.Clear;
   For  i:=0 to ComponentCount-1 do
    begin
         if (components[i] is TCheckBox) then
         begin
           if ( (components[i] as TCheckBox).Checked = true) then
             obs:=obs+chr(13)+chr(10)+(components[i] as TCheckBox).Caption;
         end;
    End;
   memo_obs.Lines.add(obs);
end;



procedure TfrmSelecaoSabores.bt_selecionarClick(Sender: TObject);
begin
  inherited;
  criarSelecao;
  strObsProduto :='';
  strObsProduto := memo_obs.Lines.Text;
  strObsProduto := StrUpper(pchar(strObsProduto));

  Close;
end;

procedure TfrmSelecaoSabores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   strObsProduto := memo_obs.Lines.Text;
   strObsProduto := StrUpper(pchar(strObsProduto ));
end;


procedure TfrmSelecaoSabores.FormActivate(Sender: TObject);
begin
  inherited;
  criarSabores;
end;

procedure TfrmSelecaoSabores.memo_obsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 IF KEY = VK_RETURN THEN bt_selecionar.Click
end;

end.
