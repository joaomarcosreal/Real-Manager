program Project8;

uses
  EMemLeaks,
  EResLeaks,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogConsole,
  EDialogWinAPIStepsToReproduce,
  EDialogWER,
  EDialogService,
  EDebugExports,
  EDebugJCL,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  ExceptionLog7,
  Vcl.Forms,
  Unit7 in 'Unit7.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
