unit uuEspelhoMFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TfrmEspelhoMFD = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    lbInicial: TLabel;
    lbFinal: TLabel;
    edInicial: TMaskEdit;
    edFinal: TMaskEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pnl1: TPanel;
    lbTitulo: TLabel;
    dlgDialogoSalvar: TSaveDialog;
    rgTipo: TRadioGroup;
    procedure btn2Click(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    function  verificaValidade() : boolean;
    procedure btn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEspelhoMFD: TfrmEspelhoMFD;

implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmEspelhoMFD.btn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEspelhoMFD.rgTipoClick(Sender: TObject);
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
         lbInicial.caption  := 'COO Inicial';
         lbFinal.Caption    := 'COO Final';
       end;
  end;
end;







function  TfrmEspelhoMFD.verificaValidade() : boolean;
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
              showmessage('COO inicial inválido');
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
              showmessage('COO final inválido');
              edFinal.setfocus;
              exit;
            end;
           end;


           if StrToInt(edFinal.text) < StrToInt(edInicial.text) then
            begin
              Showmessage('COO final não pode ser menor que o COO inicial ');
              edFinal.setfocus;
              exit;
            end;
            result:=true;
        end;
   end;
end;


procedure TfrmEspelhoMFD.btn1Click(Sender: TObject);
var
 caminhoArquivo : string;
 caminhoArquivoUsuario : string;
begin
  inherited;
  caminhoArquivo  := ExtractFilePath( ParamStr(0) )+'PAF\'+'ESPELHO_MFD.TXT';
  IF FileExists (caminhoArquivo) THEN
  DeleteFile(caminhoArquivo);


  if verificaValidade then
   begin
     case rgTipo.ItemIndex of
       0: begin
            try
             begin
//               ShowMessage(DateToStr(StrToDate(edInicial.text))+'   '+DateToStr(StrToDate(edFinal.text)) );
               frm_principal.ECF.PafMF_MFD_Espelho(StrToDate(edInicial.text),StrToDate(edFinal.text),caminhoArquivo);
             end;
            except
               begin
                ShowMessage('Erro ao gerar arquivo!');
                exit;
               end;
            end;
          end;
       1: begin  // Se for por redução...

            try
             begin
              frm_principal.ECF.PafMF_MFD_Espelho( StrToInt(edInicial.text),StrToInt(edFinal.Text),caminhoArquivo);
             end;
            except
               begin
                ShowMessage('Erro ao gerar arquivo!');
                exit;
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


end.








