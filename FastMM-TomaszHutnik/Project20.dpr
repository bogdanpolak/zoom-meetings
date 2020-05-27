// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
library Project20;

uses
  {$ifdef USEFASTMM}
  FastMM4 in 'FastMM\FastMM4.pas',
  FastMM4Messages in 'FastMM\FastMM4Messages.pas',
  {$endif }
  System.SysUtils,
  System.Classes,
  CommonInterfaces in 'CommonInterfaces.pas',
  UnitDll in 'UnitDll.pas';

{$R *.res}

function EntryPoint(aExePart: IExePart; out aDllPart: IDllPart): Integer; stdcall;
begin
  try
    aDllPart := TDLLPart.Create(aExePart);
    Result := 0;
  except
    Result := -1;
  end;
end;

exports EntryPoint;

begin
end.
