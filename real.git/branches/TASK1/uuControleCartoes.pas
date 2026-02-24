unit uuControleCartoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,ibquery,
  Menus;

type
  TfrmControleCartoes = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    livre: TImage;
    Label3: TLabel;
    bloqueado: TImage;
    Label4: TLabel;
    consumo: TImage;
    Label5: TLabel;
    pagou: TImage;
    Label6: TLabel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    Bloquearcarto1: TMenuItem;
    Liberarcarto1: TMenuItem;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    edDe: TEdit;
    edAte: TEdit;
    BitBtn4: TBitBtn;
    btBloqueia: TBitBtn;
    btLibera: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btBloqueiaClick(Sender: TObject);
    procedure posicionaLinhaGrid(codCartao : string);
    procedure bloquearCartao(codCartao : string);
    procedure liberarCartao(codCartao : string);
    procedure Bloquearcarto1Click(Sender: TObject);


    procedure Liberarcarto1Click(Sender: TObject);
    procedure ExibirCartoes;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDeExit(Sender: TObject);
    procedure edAteExit(Sender: TObject);
    procedure btLiberaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleCartoes: TfrmControleCartoes;


implementation

uses uu_data_module, uuAuditoriaCartoes;

{$R *.dfm}

procedure TfrmControleCartoes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if Column.Field.FieldName = 'STATUS'  then
  begin
    case dm.qryCartoes.FieldByName('status').Value of

     0: begin
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.Canvas.StretchDraw(Rect,consumo.Picture.Bitmap  );
        end;

     1: begin
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.Canvas.StretchDraw(Rect,pagou.Picture.Bitmap  );
        end;


     2: begin
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.Canvas.StretchDraw(Rect,bloqueado.Picture.Bitmap  );
        end;


     3: begin
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.Canvas.StretchDraw(Rect,livre.Picture.Bitmap  );
        end;


    end;
  end;
end;


procedure TfrmControleCartoes.ExibirCartoes();
begin
  inherited;
  dm.qryCartoes.Active:=false;
  dm.qryCartoes.SQL.Clear;
  dm.qryCartoes.SQL.add('select * from cartoes where cod_cartao between '+quotedstr(edDe.Text)+' and '+QuotedStr(edAte.Text)+' order by cod_cartao');
  dm.qryCartoes.Active:=true;
end;

procedure TfrmControleCartoes.btBloqueiaClick(Sender: TObject);
var
 codCartao : string;
begin
  inherited;

  codCartao := dm.qryCartoes.fieldByname('cod_cartao').Value;

  if (dm.qryCartoes.FieldByName('status').Value <> 3) then
   begin
     MessageDlg('Este cartão não pode ser bloqueado pois não se encontra no estado  LIVRE!',mtError,[mbOK],0);
   end
  else
   begin
     if ( MessageDlg('Confirma bloqueio do cartão selecionado  ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
        bloquearCartao(codCartao); 
      end;
   end;      
end;


procedure TfrmControleCartoes.bloquearCartao(codCartao : string);
var
 q : Tibquery;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.SQL.Add('update cartoes set status=2,cod_cli=null where cod_cartao='+Quotedstr(codCartao));
  q.ExecSQL;
  dm.transacao.Commit;
  FreeAndNil(q);
  posicionaLinhaGrid(codCartao);
end;



procedure TfrmControleCartoes.liberarCartao(codCartao : string);
var
 q : Tibquery;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.SQL.Add('update cartoes set status=3,cod_cli=null where cod_cartao='+Quotedstr(codCartao));
  q.ExecSQL;
  dm.transacao.Commit;
  FreeAndNil(q);
  posicionaLinhaGrid(codCartao);
end;




procedure TfrmControleCartoes.posicionaLinhaGrid(codCartao : string);
var
 ct : integer;
begin
 dm.qryCartoes.Active:=false;
 dm.qryCartoes.Active:=true;
 dm.qryCartoes.First;
 while not dm.qryCartoes.eof do
  begin
    if (dm.qryCartoes.FieldByName('cod_cartao').value = codCartao) then
     begin
       exit;
     end
    else
    dm.qryCartoes.Next;
  end;


end;



procedure TfrmControleCartoes.Bloquearcarto1Click(Sender: TObject);
begin
  inherited;
  btBloqueia.Click;
end;

procedure TfrmControleCartoes.Liberarcarto1Click(Sender: TObject);
begin
  inherited;
  btLibera.Click;
end;

procedure TfrmControleCartoes.BitBtn4Click(Sender: TObject);
begin
  inherited;
  ExibirCartoes();
end;

procedure TfrmControleCartoes.FormActivate(Sender: TObject);
begin
  inherited;
  ExibirCartoes();
end;

procedure TfrmControleCartoes.edDeExit(Sender: TObject);
begin
  inherited;
  try
    edDe.Text := FormatFloat('0000',StrToFloat(edDe.Text));
  except
   begin
      showmessage('Valor inválido!');
      edDe.SetFocus;
      edDe.Clear;
   end;
  end;
end;

procedure TfrmControleCartoes.edAteExit(Sender: TObject);
begin
  inherited;
  try
    edAte.Text := FormatFloat('0000',StrToFloat(edAte.Text));
  except
   begin
      showmessage('Valor inválido!');
      edAte.SetFocus;
      edAte.Clear;
   end;
  end;

end;

procedure TfrmControleCartoes.btLiberaClick(Sender: TObject);
var
 codCartao : string;

begin
  inherited;

  codCartao := dm.qryCartoes.fieldByname('cod_cartao').Value;

  if (dm.qryCartoes.FieldByName('status').Value <> 2) then
   begin
     MessageDlg('Este cartão não pode ser liberado pois não se encontra no estado  BLOQUEADO!',mtError,[mbOK],0);
   end
  else
   begin
     if ( MessageDlg('Confirma liberação do cartão selecionado  ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
        liberarCartao(codCartao);
      end;
   end;      
end;


procedure TfrmControleCartoes.BitBtn1Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmAuditoriaCartoes, frmAuditoriaCartoes);
   frmAuditoriaCartoes.ShowModal;
   frmAuditoriaCartoes.Free;
end;

procedure TfrmControleCartoes.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
