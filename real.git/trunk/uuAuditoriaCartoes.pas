unit uuAuditoriaCartoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons, DB, RxMemDS,
  Grids, DBGrids;

type
  TfrmAuditoriaCartoes = class(Tfrm_modelo_vazio)
    pnl1: TPanel;
    tbCartoes: TRxMemoryData;
    ds1: TDataSource;
    strngfldCartoescartao: TStringField;
    pnl2: TPanel;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    edtNumeroCartao: TEdit;
    pnl4: TPanel;
    btnLibera: TBitBtn;
    btn1: TBitBtn;
    lbl1: TLabel;
    procedure edtNumeroCartaoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnLiberaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditoriaCartoes: TfrmAuditoriaCartoes;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmAuditoriaCartoes.edtNumeroCartaoChange(Sender: TObject);
begin
  inherited;


 IF (Length(TRIM(edtNumeroCartao.Text)) = 8) then
  begin
     tbCartoes.Append;
     tbCartoes.FieldByName('cartao').Value := formatfloat('0000',strToFloat(edtNumeroCartao.Text)  );
     tbCartoes.Post;
     edtNumeroCartao.Clear;
     edtNumeroCartao.SetFocus;
  end;



end;

procedure TfrmAuditoriaCartoes.FormActivate(Sender: TObject);
begin
  inherited;

  tbCartoes.Active := True;
  tbCartoes.EmptyTable;
  tbCartoes.Active := true;

end;

procedure TfrmAuditoriaCartoes.btn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAuditoriaCartoes.btnLiberaClick(Sender: TObject);
begin
  inherited;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('update cartoes set status=2,cod_movimentacao=null,cod_cli=null');
  dm.qryauxiliar.ExecSQL;


  If dm.transacao.Active = false then dm.transacao.active:=true;
  dm.transacao.Commit;

  dm.transacao.Active := True;

  tbCartoes.First;
  while not tbCartoes.Eof do
   begin
     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.SQL.Clear;
     dm.qryauxiliar.SQL.Add('update cartoes set status=3 where cod_cartao='+Quotedstr(tbCartoes.FieldByName('cartao').Value));
     dm.qryauxiliar.ExecSQL;
     tbCartoes.Next;
   end;

 
  If dm.transacao.Active = false then dm.transacao.active:=true;
  dm.transacao.Commit;

  ShowMessage('Auditoria realizada!');


end;

end.
