unit uuMemoriaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask, ExtCtrls, ACBrBase,
  ACBrECF;

type
  TfrmLeituraMF = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    rdgEmissao: TRadioGroup;
    rgTipo: TRadioGroup;
    Panel2: TPanel;
    edInicial: TMaskEdit;
    edFinal: TMaskEdit;
    lbInicial: TLabel;
    lbFinal: TLabel;
    pnl1: TPanel;
    lbTitulo: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    ckbCotepe: TCheckBox;
    dlgDialogoSalvar: TSaveDialog;
    procedure rgTipoClick(Sender: TObject);
    function   verificaValidade() : boolean;
    procedure btn1Click(Sender: TObject);
    procedure rdgEmissaoClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure setSimplificada(simp : Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    simplificada : Boolean;
  public
    { Public declarations }
  end;

var
  frmLeituraMF: TfrmLeituraMF;

implementation

uses uu_frm_principal, Math;

{$R *.dfm}

procedure TfrmLeituraMF.setSimplificada(simp : Boolean);
begin
 self.simplificada := simp;
end;


procedure TfrmLeituraMF.rgTipoClick(Sender: TObject);
begin
  inherited;
  edInicial.Clear;
  edFinal.Clear;
  case rgTipo.ItemIndex of
   0 : begin
         edInicial.EditMask := '99/99/9999;1;_';
         edFinal.EditMask := '99/99/9999;1;_';
         lbInicial.caption  := 'Data Inicial';
         lbFinal.Caption    := 'Data Final';
       end;

   1 : begin
         edInicial.EditMask :='';
         edFinal.EditMask := '';
         lbInicial.caption  := 'Red. Z Inicial';
         lbFinal.Caption    := 'Red. Z Final';
       end;
  end;
end;


function  TfrmLeituraMF.verificaValidade() : boolean;
begin
 result :=false;

   case rgTipo.ItemIndex of
    0 : begin
         try
            StrToDate(edInicial.Text);
         except
          begin
            ShowMessage('Data inicial inválida!');
            edInicial.setfocus;
            exit;
          end;
         end;

         try
            StrToDate(edFinal.Text);
         except
          begin
            ShowMessage('Data final inválida!');
            edFInal.setfocus;
            exit;
          end;
         end;

         if (strToDate(edFinal.text) < StrToDate(edInicial.text) ) then
          begin
            ShowMessage('Data final não pode ser maior do que a data incial');
            edFinal.setfocus;
            exit;
          end;
          Result :=true;
        end;
    1:  begin
           try
             begin
               StrToInt(edInicial.Text);
             end;
           except
            begin
              showmessage('Redução inicial inválida');
              edInicial.setfocus;
              exit;
            end;
           end;

           try
             begin
               StrToInt(edfinal.Text);
             end;
           except
            begin
              showmessage('Redução final inválida');
              edFinal.setfocus;
              exit;
            end;
           end;


           if StrToInt(edFinal.text) < StrToInt(edInicial.text) then
            begin
              Showmessage('Redução final não pode ser menor que a redução inicial ');
              edFinal.setfocus;
              exit;
            end;
            result:=true;
        end;
   end;
end;


procedure TfrmLeituraMF.btn1Click(Sender: TObject);
var
 caminhoArquivo : string;
 caminhoArquivoUsuario : string;
begin
  inherited;


  if verificaValidade then
   begin
    if rdgEmissao.ItemIndex = 0 then // Se for impressa
     begin
       case rgTipo.ItemIndex of
         0: begin
              //  Se for por data

              if simplificada then
                frm_principal.ECF.PafMF_LMFS_Impressao(StrToDate(edInicial.text),StrToDate(edFinal.text))
              else
               frm_principal.ECF.PafMF_LMFC_Impressao(StrToDate(edInicial.text),StrToDate(edFinal.text));


            end;
         1: begin  // Se for por redução...

              if simplificada then
                frm_principal.ECF.PafMF_LMFS_Impressao( StrToInt(edInicial.text),StrToInt(edFinal.Text))
              else
               frm_principal.ECF.PafMF_LMFC_Impressao( StrToInt(edInicial.text),StrToInt(edFinal.Text));



           end;
        end;
     end

    else    // Se for para Arquivo...
      begin
       caminhoArquivo  := ExtractFilePath( ParamStr(0) )+'PAF\'+'LEITURA_MEM_FISCAL.TXT';
       IF FileExists (caminhoArquivo) THEN
        DeleteFile(caminhoArquivo);


       case rgTipo.ItemIndex of
         0: begin
              //  Se for por data

              if simplificada then
               begin
                try
                 begin
                  frm_principal.ECF.PafMF_LMFS_Espelho(StrToDate(edInicial.text),StrToDate(edFinal.text),caminhoArquivo);
                 end;
                except
                   begin
                    ShowMessage('Erro ao gerar arquivo!');
                    exit;
                   end;
                end;
               end
              else
               begin
                 if (ckbCotepe.Checked = false) then

                    try
                     begin
                      frm_principal.ECF.PafMF_LMFC_Espelho(StrToDate(edInicial.text),StrToDate(edFinal.text),caminhoArquivo);

                     end;
                    except
                       begin
                        ShowMessage('Erro ao gerar arquivo!');
                        exit;
                       end;
                    end
                 else
                  begin
                    try
                     begin
                      frm_principal.ECF.PafMF_LMFC_Cotepe1704(StrToDate(edInicial.text),StrToDate(edFinal.text),caminhoArquivo);

                     end;
                    except
                       begin
                        ShowMessage('Erro ao gerar arquivo!');
                        Exit;
                       end;
                    end;
                  end;



               end;


                  end;


         1: begin  // Se for por redução...

              if simplificada then
               begin
                try
                 begin
                  frm_principal.ECF.PafMF_LMFS_Espelho(StrToInt(edInicial.text),StrToInt(edFinal.Text),caminhoArquivo);

                 end;
                except
                   begin
                    ShowMessage('Erro ao gerar arquivo!');
                    exit;
                   end;
                end;





               end
              else
               begin

                 if (ckbCotepe.Checked = false) then

                    try
                     begin
                      frm_principal.ECF.PafMF_LMFC_Espelho(StrToInt(edInicial.text),StrToInt(edFinal.Text),caminhoArquivo);

                     end;
                    except
                       begin
                        ShowMessage('Erro ao gerar arquivo!');
                        exit;
                       end;
                    end
                 else
                  begin
                    try
                     begin
                      frm_principal.ecf.PafMF_LMFC_Cotepe1704(StrToInt(edInicial.text),StrToInt(edFinal.Text),caminhoArquivo);

                     end;
                    except
                       begin
                        ShowMessage('Erro ao gerar arquivo!');
                        Exit;
                       end;
                    end;
                  end;
               end;   
           end;
       end;

       dlgDialogoSalvar.DefaultExt := '.txt';
       dlgDialogoSalvar.Filter := 'Arquivos texto|*.txt';
       if dlgDialogoSalvar.Execute then
        begin
         caminhoArquivoUsuario := dlgDialogoSalvar.FileName;
          if FileExists(caminhoArquivoUsuario) then
            begin

             if (MessageBox(0, 'Arquivo já existe, deseja sobrescrevê-lo ?', 'Sobrescrever arquivo ?', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
               begin
                 DeleteFile(caminhoArquivoUsuario);
                 CopyFile(pchar(caminhoArquivo),pchar(caminhoArquivoUsuario),False);
                 Showmessage(' Arquivo salvo com sucesso na pasta :'+caminhoArquivoUsuario);
               end;
            end
          else
            begin
              CopyFile(pchar(caminhoArquivo),pchar(caminhoArquivoUsuario),False);
               Showmessage(' Arquivo salvo com sucesso na pasta :'+caminhoArquivoUsuario);
            end;
        end;
      end;
   end;
end;
procedure TfrmLeituraMF.rdgEmissaoClick(Sender: TObject);
begin
  inherited;

   if rdgEmissao.ItemIndex = 1  then
   begin
    btn1.Caption := 'Gerar arquivo';
    if (simplificada = false) then
      begin
        ckbCotepe.Visible := true;
        ckbCotepe.Checked := false;
      end;
   end
   else
    begin
      btn1.Caption := 'Imprimir';
      ckbCotepe.Visible := false;
      ckbCotepe.Checked := false;
    end;

end;

procedure TfrmLeituraMF.btn2Click(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TfrmLeituraMF.FormActivate(Sender: TObject);
begin
  inherited;
  if (simplificada = True) then
   begin
    lbTitulo.Caption:= 'Leitura da Memória Fiscal - Simplificada';
    ckbCotepe.Visible := false;
    ckbCotepe.Checked := false;
   end
  else
  begin
    lbTitulo.Caption:= 'Leitura da Memória Fiscal - Completa';
    ckbCotepe.Visible := False;
    ckbCotepe.Checked := false;

  end
end;

end.
