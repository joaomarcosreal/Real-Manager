unit uuLeCartaoLancamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Buttons,
  jpeg;

type
  TfrmLeCartaoLancamento = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    img_estado_cartao: TImage;
    edNumeroCartao: TEdit;
    Timer1: TTimer;
    tmClear: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmClearTimer(Sender: TObject);
    procedure edNumeroCartaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeCartaoLancamento: TfrmLeCartaoLancamento;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}







procedure TfrmLeCartaoLancamento.Timer1Timer(Sender: TObject);
begin
  inherited;
  panel2.Font.Color := clYellow;
  Panel2.Caption :='PASSE O CARTÃO NA LEITORA...';
  img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\leitorLancamento.jpg');
  Timer1.Enabled:=false;
  edNumeroCartao.CLEAR;

end;

procedure TfrmLeCartaoLancamento.FormActivate(Sender: TObject);
begin
  inherited;
  Self.top:=0;
  self.Left :=0;
  edNumeroCartao.SetFocus;
end;

procedure TfrmLeCartaoLancamento.tmClearTimer(Sender: TObject);
begin
  inherited;
  edNumeroCartao.Clear;
  tmClear.Enabled := false;
end;

procedure TfrmLeCartaoLancamento.edNumeroCartaoChange(Sender: TObject);
var
 estadoCartao : integer;
 numeroCartao  : string;
begin
  inherited;

//  tmClear.Enabled := false;
//  tmClear.Enabled := true;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  string_auxiliar := '';
  numeroCartao:='';




   IF (Length(TRIM(edNumeroCartao.Text)) = StrToInt(dm.LeIni(2,'SALAO','tamanhoStringCartao')) ) then
    begin
      dm.transacao.Active:=false;
      dm.transacao.Active:=true;



      edNumeroCartao.Text:= copy(edNumeroCartao.Text,StrToInt(dm.LeIni(2,'SALAO','inicioSubstringCartao')) ,StrToInt(dm.LeIni(2,'SALAO','tamanhoNumeracaoCartao'))  );



      try


       numeroCartao:= formatfloat('0000',StrToFloat(edNumeroCartao.Text))
      except
        begin
           edNumeroCartao.clear;
           exit;
        end
      end;






      Try

        estadoCartao:= getEstadoCartao(numeroCartao);
      except
       begin
          edNumeroCartao.clear;
          Exit;
       end;
      end;



      if ( (estadoCartao=2)  ) then  // Se o cartão estiver em uso ou já tiver sido liberado...
        begin
         panel2.Font.Color := clred;
         Panel2.Caption :='CARTÃO BLOQUEADO POR EXTRAVIO.'+#13#10+'FAVOR CONTACTAR A GERÊNCIA!';
         img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\bloqueadoExtravioLancamento.jpg');
         edNumeroCartao.Clear;
         Timer1.Enabled:=true;

        end
      else
       begin
          string_auxiliar := numeroCartao;
          Close;
       end;

    end
   else
    begin
      IF (Length(TRIM(edNumeroCartao.Text)) > StrToInt(dm.LeIni(2,'SALAO','tamanhoStringCartao')) ) then
        begin
          edNumeroCartao.clear;
          Exit;
        end;

    end;


 end;

end.
