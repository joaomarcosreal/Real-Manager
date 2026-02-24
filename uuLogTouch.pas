unit uuLogTouch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uu_data_module, Dialogs, StdCtrls, Buttons, ExtCtrls,
  dxGDIPlusClasses, JvExControls, CurvyControls, ACBrEnterTab, AdvOfficeImage,
  JvTransparentButton, cxGraphics, cxControls, cxDBLookupComboBox, Data.DB,
  FireDAC.Comp.Client, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Comp.DataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvButton, AdvSmoothTouchKeyBoard, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  ACBrBase, cxLookupEdit, cxDBLookupEdit;

type
  TfrmLoginTouch = class(TForm)
    Panel1: TPanel;
    ACBrEnterTab1: TACBrEnterTab;
    JvGradient1: TPanel;
    gpUsuario: TGroupBox;
    AdvOfficeImage1: TAdvOfficeImage;
    AdvOfficeImage2: TAdvOfficeImage;
    edCodUsuario: TEdit;
    edSenha: TEdit;
    Panel2: TPanel;
    B20002003: TJvTransparentButton;
    gpEmpresas: TGroupBox;
    lbTitulo: TLabel;
    cbEmpresas: TcxLookupComboBox;
    FDMemTable1: TFDMemTable;
    AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard;
    function verifica_permissao: boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure edCodUsuarioExit(Sender: TObject);
    procedure B20002003Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSenhaEnter(Sender: TObject);
  private
    LTipoOperacao: tTipoLogin;
    LStatusValidacaoSenha: Boolean;
    procedure fecharSistema;
    function ValidarSenha: boolean;




    { Private declarations }
  public
    { Public declarations }
    procedure setTipoOperacao(ATipoOperacao: tTipoLogin);
    function getStatusValidacaoSenha: Boolean;
  end;

var
  frmLoginTouch: TfrmLoginTouch;

implementation

uses
  uu_frm_principal;

{$R *.dfm}

procedure TfrmLoginTouch.setTipoOperacao(ATipoOperacao: tTipoLogin);
begin
  LTipoOperacao := ATipoOperacao;
end;

function TfrmLoginTouch.verifica_permissao: boolean;
begin

  if (LTipoOperacao = tLoginInicial) then
  begin

    codigo_usuario_responsavel := dm.qryauxiliar.fieldbyname('cod_usuario').value;
    nome_usuario_responsavel := dm.qryauxiliar.fieldbyname('login').value;
    nome_comp_usuario_responsavel := dm.qryauxiliar.fieldbyname('nome_usuario').value;

  end
  else
  begin
    codigo_usuario_responsavel := dm.qryauxiliar.fieldbyname('cod_usuario').value;
    nome_usuario_responsavel := dm.qryauxiliar.fieldbyname('login').value;
    nome_comp_usuario_responsavel := dm.qryauxiliar.fieldbyname('nome_usuario').value;

  end;

  Result := true;
end;

procedure TfrmLoginTouch.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = 27 then
  begin
    fecharSistema;
  end;

end;

procedure TfrmLoginTouch.FormActivate(Sender: TObject);
begin
  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 1) then
  begin
    edCodUsuario.text := dm.LeIni(2, 'SALAO', 'usr');
    edSenha.Text := dm.LeIni(2, 'SALAO', 'pw');

//    edSenhaExit(edSenha);
//    edCodUsuario.ReadOnly := true;
  //  edSenha.ReadOnly := true;

    edSenha.selectAll;
    edCodUsuario.selectAll;
    edCodUsuario.SetFocus;

      {
    if ValidarSenha() then
    begin
      close;
    end;
     }
  end;

end;

procedure TfrmLoginTouch.FormCreate(Sender: TObject);
begin
  gpEmpresas.Visible := false;
  LStatusValidacaoSenha := false;

  if LTipoOperacao = tPermissaoAcesso then
  begin
    cbEmpresas.EditValue := codEmpresa;
    gpEmpresas.Visible := False;
  end
  else
  begin
    gpEmpresas.Visible := False;
    dm.tb_parametros.Active := false;
    dm.tb_parametros.Filtered := False;
    dm.tb_parametros.Filter := '';
    dm.tb_parametros.Active := true;
    dm.tb_parametros.FetchAll;
    dm.tb_parametros.First;
    cbEmpresas.EditValue := dm.tb_parametrosCOD_EMPRESA.Value;
    if dm.tb_parametros.RecordCount > 1 then
    begin
      gpEmpresas.Visible := true;
    end;
  end;

end;

procedure TfrmLoginTouch.edSenhaEnter(Sender: TObject);
begin
  edSenha.SelectAll;
end;

procedure TfrmLoginTouch.edSenhaExit(Sender: TObject);
begin
  if ((trim(edSenha.Text) <> '') and (ValidarSenha())) then
  begin
    Close;
  end;
end;

function TfrmLoginTouch.getStatusValidacaoSenha(): Boolean;
begin
  result := LStatusValidacaoSenha;

end;

function TfrmLoginTouch.ValidarSenha(): boolean;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  result := false;

  try
    try

      if (dm.validarCredenciaisUsuario(cbEmpresas.EditValue, edCodUsuario.text, edSenha.text) = True) then
      begin

        LSQL.Clear;
        LSQL.Add('select login, nome_usuario from usuarios u where u.cod_usuario=' + QuotedStr(edCodUsuario.Text));
        dm.getMemTable(LTbAux, LSQL.Text);

        if LTipoOperacao = tLoginInicial then
        begin
          dm.setCodEmpresa(cbEmpresas.EditValue);
          codigo_usuario := edCodUsuario.Text;
          nome_usuario := LTbAux.fieldbyname('login').value;
          nome_completo_usuario := LTbAux.fieldbyname('nome_usuario').value;
          dm.adicionaLog('o usuário ' + nome_usuario + ' entrou no sistema');
        end
        else
        begin
          codigo_usuario_responsavel := edCodUsuario.Text;
          nome_usuario_responsavel := LTbAux.fieldbyname('login').value;
          nome_comp_usuario_responsavel := LTbAux.fieldbyname('nome_usuario').value;
          dm.adicionaLog('o usuário ' + nome_usuario + ' autorizou a execução de uma funcionalidade no sistema');
        end;

        LStatusValidacaoSenha := true;
        Result := true;

      end
      else
      begin
        dm.exibe_painel_erro('Usuário ou senha incorreta!', 'Ok');
      end;

    except
      on E: Exception do
      begin
        Result := false;
        dm.exibe_painel_erro('Erro ao validar credenciais do usuário ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao validar credenciais do usuário ' + sLineBreak + sLineBreak + E.Message)
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmLoginTouch.B20002003Click(Sender: TObject);
begin

  fecharSistema();
end;

procedure TfrmLoginTouch.fecharSistema();
begin
  if LTipoOperacao = tLoginInicial then
  begin
    if MessageDlg('Deseja realmente sair ?', mtconfirmation, [mbYes, mbNo], 1) = Mryes then
    begin
      Application.Terminate;
    end;
  end
  else
    Close;

end;

procedure TfrmLoginTouch.edCodUsuarioExit(Sender: TObject);
begin
  if (Trim(edCodUsuario.Text) = '') then
  begin
    exit;
  end
  else
  begin
    edCodUsuario.Text := FormatFloat('000', StrToFloat(edCodUsuario.Text));

  end;

end;

end.

