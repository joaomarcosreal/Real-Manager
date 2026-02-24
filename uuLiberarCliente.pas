unit uuLiberarCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, jpeg, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmLiberarCliente = class(Tfrm_modelo_vazio)
    edNumeroCartao: TEdit;
    lbInformacoes: TLabel;
    lbEstadoCliente: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    lbCartaoCliente: TLabel;
    lbNomeCliente: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    img_estado_cartao: TImage;
    lbPasseCartao: TLabel;
    edCartao: TEdit;
    procedure edNumeroCartaoChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiberarCliente: TfrmLiberarCliente;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmLiberarCliente.edNumeroCartaoChange(Sender: TObject);
var
 estadoCartao : integer;
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;


   IF (Length(TRIM(edNumeroCartao.Text)) = StrToInt(dm.LeIni(2,'LIBERACAO','tamanhoStringCartao')) ) then
    begin
      dm.transacao.Active:=false;
      dm.transacao.Active:=true;

      //edNumeroCartao.Text:= trim(dm.removeCaracteres(edNumeroCartao.Text));
      edNumeroCartao.Text:= copy(edNumeroCartao.Text,StrToInt(dm.LeIni(2,'LIBERACAO','inicioSubstringCartao')) ,StrToInt(dm.LeIni(2,'LIBERACAO','tamanhoNumeracaoCartao'))  );
      Label2.Caption:= edNumeroCartao.Text;
      try
        edNumeroCartao.Text := formatfloat('0000',StrToFloat(edNumeroCartao.Text))
      except
        begin
///           lbTitulo.Font.Color:= clRed;
//           lbTitulo.Caption := UpperCase('Passe novamente o cartão...');
           edNumeroCartao.clear;
           exit;
        end
      end;

      Try
        estadoCartao:= getEstadoCartao(edNumeroCartao.Text);
      except
       begin
          Timer1.Enabled:=true;
          Exit;
       end;
      end;

      lbPasseCartao.Visible:=false;

      if ( (estadoCartao=0) or (estadoCartao=1) ) then  // Se o cartão estiver em uso ou já tiver sido liberado...
        begin
          dm.qryauxiliar.Active:=false;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.Add('select c.cod_cartao,c.cod_cli,cl.razao_social    from cartoes c ');
          dm.qryauxiliar.SQL.Add('   inner join clientes cl on (cl.cod_cli = c.cod_cli) ');
          dm.qryauxiliar.SQL.Add('   where c.cod_cartao='+QuotedStr(edNumeroCartao.Text));
          dm.qryauxiliar.Active:=true;

          lbCartaoCliente.Visible:=true;
          lbNomeCliente.Visible:=true;

          lbCartaoCliente.Caption:= edNumeroCartao.Text;
          lbNomeCliente.Caption:= dm.qryauxiliar.fieldbyname('razao_social').value;
          dm.qryauxiliar.Active:=false;


          if (estadoCartao = 1) then
            begin
             lbEstadoCliente.Visible:=true;
             img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_livre.jpg');
             lbEstadoCliente.Caption:='CARTÃO LIBERADO.';
             lbEstadoCliente.Font.Color:=clLime;
           end
          else
            begin
             lbEstadoCliente.Visible:=true;
             img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
             lbEstadoCliente.Caption:='POR FAVOR, DIRIJA-SE AO CAIXA.';
             lbEstadoCliente.Font.Color:=clRED;
            end;
        end
      else
        begin  /// Se o cartão não estiver em consumo, nem pago a conta...

           case  estadoCartao  of
             2: begin
                   lbCartaoCliente.Visible := true;
                   lbEstadoCliente.Visible:=TRUE;
                   img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
                   lbCartaoCliente.Caption := edNumeroCartao.Text;
                   lbEstadoCliente.Caption :='CARTÃO BLOQUEADO POR EXTRAVIO.'+#13#10+'FAVOR CONTACTAR A GERÊNCIA!';
                end;

             3: begin
                   lbEstadoCliente.Visible:=TRUE;
                   lbCartaoCliente.Visible := true;
                   img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
                   lbCartaoCliente.Caption := edNumeroCartao.Text;
                   lbEstadoCliente.Caption :='CARTÃO  NÃO UTILIZADO NO DIA.'+#13#10+'FAVOR CONTACTAR A GERÊNCIA!';
                end;
           end;
        end;
      edNumeroCartao.Clear;
      Timer1.Enabled:=true;
    end



end;




procedure TfrmLiberarCliente.Timer1Timer(Sender: TObject);
begin
  inherited;
  lbEstadoCliente.Visible:=false;
  lbCartaoCliente.Visible:=false;
  lbNomeCliente.Visible:=false;
  lbPasseCartao.Visible:=true;
  img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\marca_real.jpg');

  Timer1.Enabled:=false;


  edNumeroCartao.CLEAR;

end;

procedure TfrmLiberarCliente.edCartaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 estadoCartao : integer;

begin
  inherited;
  if key = vk_return then
   begin




      dm.transacao.Active:=false;
      dm.transacao.Active:=true;

      DM.tb_parametros.Active := TRUE;


      Label2.Caption:= edNumeroCartao.Text;
      try
        edCartao.Text := formatfloat('0000',StrToFloat(edCartao.Text))
      except
        begin

           edCartao.clear;
           exit;
        end
      end;

      Try
        estadoCartao:= getEstadoCartao(edCartao.Text);
      except
       begin
          Timer1.Enabled:=true;
          Exit;
       end;
      end;

      lbPasseCartao.Visible:=false;




      IF (DM.tb_parametrosBOATE.Value = 1) then
       begin


          if ( (estadoCartao=0) or (estadoCartao=1) ) then  // Se o cartão estiver em uso ou já tiver sido liberado...
            begin
              dm.qryauxiliar.Active:=false;
              dm.qryauxiliar.SQL.Clear;
              dm.qryauxiliar.SQL.Add('select c.cod_cartao,c.cod_cli,cl.razao_social    from cartoes c ');
              dm.qryauxiliar.SQL.Add('   inner join clientes cl on (cl.cod_cli = c.cod_cli) ');
              dm.qryauxiliar.SQL.Add('   where c.cod_cartao='+QuotedStr(edCartao.Text));
              dm.qryauxiliar.Active:=true;

              lbCartaoCliente.Visible:=true;
              lbNomeCliente.Visible:=true;

              lbCartaoCliente.Caption:= edCartao.Text;
              lbNomeCliente.Caption:= dm.qryauxiliar.fieldbyname('razao_social').value;
              dm.qryauxiliar.Active:=false;


              if (estadoCartao = 1) then
                begin
                 lbEstadoCliente.Visible:=true;
                 img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_livre.jpg');
                 lbEstadoCliente.Caption:='CARTÃO LIBERADO.';
                 lbEstadoCliente.Font.Color:=clLime;
               end
              else
                begin
                 lbEstadoCliente.Visible:=true;
                 img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
                 lbEstadoCliente.Caption:='POR FAVOR, DIRIJA-SE AO CAIXA.';
                 lbEstadoCliente.Font.Color:=clRED;
                end;
            end
          else
            begin  /// Se o cartão não estiver em consumo, nem pago a conta...

               case  estadoCartao  of
                 2: begin
                       lbCartaoCliente.Visible := true;
                       lbEstadoCliente.Visible:=TRUE;
                       img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
                       lbCartaoCliente.Caption := edCartao.Text;
                       lbEstadoCliente.Caption :='CARTÃO BLOQUEADO POR EXTRAVIO.'+#13#10+'FAVOR CONTACTAR A GERÊNCIA!';
                    end;

                 3: begin
                       lbEstadoCliente.Visible:=TRUE;
                       lbCartaoCliente.Visible := true;
                       img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
                       lbCartaoCliente.Caption := edCartao.Text;
                       lbEstadoCliente.Caption :='CARTÃO  NÃO UTILIZADO NO DIA.'+#13#10+'FAVOR CONTACTAR A GERÊNCIA!';
                    end;
               end;
            end;
          edCartao.Clear;
          Timer1.Enabled:=true;
       end

  else
     begin
      if ( estadoCartao = 2) then
       begin
         lbCartaoCliente.Visible := true;
         lbEstadoCliente.Visible:=TRUE;
         img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
         lbCartaoCliente.Caption := edCartao.Text;
         lbEstadoCliente.Caption :='CARTÃO BLOQUEADO POR EXTRAVIO.'+#13#10+'FAVOR CONTACTAR A GERÊNCIA!';
       end
      else
       begin


          dm.qryauxiliar.Active:=false;
          dm.qryauxiliar.SQL.clear;
          dm.qryauxiliar.SQL.Add('select * from movimento_mesa  where cod_mesa='+QuotedStr(edCartao.Text));
          dm.qryauxiliar.Active:=true;
          dm.qryauxiliar.Active :=True;

          if (dm.qryauxiliar.IsEmpty = False) then
           begin
            lbEstadoCliente.Visible:=true;
            img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_bloqueado.jpg');
            lbEstadoCliente.Caption:='POR FAVOR, DIRIJA-SE AO CAIXA.';
            lbEstadoCliente.Font.Color:=clRED;
           end
          else
           begin
             lbEstadoCliente.Visible:=true;
             img_estado_cartao.Picture.LoadFromFile(patchAplicacao+'imagens\cartao_livre.jpg');
             lbEstadoCliente.Caption:='CARTÃO LIBERADO.';
             lbEstadoCliente.Font.Color:=clLime;
           end;
       end;
      Timer1.Enabled:=true;
      edCartao.Clear;
   end;

 end;

end;





procedure TfrmLiberarCliente.FormActivate(Sender: TObject);
begin
  inherited;
  edCartao.SetFocus;
  
end;

end.
