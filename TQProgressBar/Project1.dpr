program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  {$IF RTLVersion >= 20}
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  {$IFEND}
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
