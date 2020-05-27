// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
program Project19;

uses
  {$ifdef USEFASTMM}
  FastMM4 in 'FastMM\FastMM4.pas',
  FastMM4Messages in 'FastMM\FastMM4Messages.pas',
  FastMMUsageTracker in 'FastMM\Demos\FastMMUsageTracker.pas' {fFastMMUsageTracker},
  {$endif }
  Vcl.Forms,
  Unit24 in 'Unit24.pas' {Form24},
  CommonInterfaces in 'CommonInterfaces.pas';

{$R *.res}

begin
{$ifndef USEFASTMM}
  ReportMemoryLeaksOnShutdown := True;
{$endif}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm24, Form24);
  Application.Run;
end.
