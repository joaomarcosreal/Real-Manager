unit uuIdentificaClienteECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, AdvTouchKeyboard,
  ACBrValidador, AdvGlassButton, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, ACBrBase, Vcl.Menus;

type
  TfrmIdentificaClienteECF = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    edNomeCliente: TEdit;
    Label3: TLabel;
    edCpf: TEdit;
    Label1: TLabel;
    edEndereco: TEdit;
    Label2: TLabel;
    ACBrValidador1: TACBrValidador;
    Panel1: TPanel;
    lb_mesa: TLabel;
    Label4: TLabel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    btImprimir: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIdentificaClienteECF: TfrmIdentificaClienteECF;

implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure TfrmIdentificaClienteECF.btImprimirClick(Sender: TObject);
begin
  inherited;
  if (trim (edCpf.Text) <> '') then
   begin
      if ( (Length(trim( edCpf.Text)) = 11 ) or (Length(trim( edCpf.Text)) = 14 )) then
       begin
         if Length(trim( edCpf.Text)) = 11 then
          begin
            ACBrValidador1.TipoDocto   := docCPF;
            ACBrValidador1.Documento   := trim(edCpf.text);
            if ACBrValidador1.Validar = false then
             begin
               dm.exibe_painel_erro('CPF INVÁLIDO!','Ok');
               edCpf.Clear;
               edCpf.SetFocus;
               exit;
             end;
          end;

         if Length(trim(edCpf.Text)) = 14 then
          begin
            ACBrValidador1.TipoDocto   := docCNPJ;
            ACBrValidador1.Documento   := trim(edCpf.text);
            if ACBrValidador1.Validar = false then
             begin
               dm.exibe_painel_erro('CNPJ INVÁLIDO!','Ok');
               edCpf.Clear;
               edCpf.SetFocus;
               exit;
             end;
          end;
       end
      else
       begin
         dm.exibe_painel_erro('Número de documento inválido','Ok');
         edCpf.Clear;
         edCpf.SetFocus;
         exit;

       end;


   end;


  nomeClienteCupom            := edNomeCliente.Text;
  enderecoClienteCupomFiscal  := edEndereco.Text;
  cpfClienteCupomFiscal       := edCpf.Text;
  Close;

end;

end.

