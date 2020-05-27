unit CommonInterfaces;

interface

uses Data.DB;

const
  DLLENTRYPOINT = 'EntryPoint';

type

  IExePart = interface ['{488D173B-F0D8-4639-B379-557E1C2B823F}']
    function Callback(aValue: String): Integer; stdcall;
  end;

  IDllPart = interface ['{F481404D-5B12-4440-A901-5166B6C91C08}']
    function Echo(aValue: String): Integer; stdcall;
    function GetDataset: TDataset; stdcall;
  end;

  TEntryPoint = function(aExePart: IExePart; out aDllPart: IDllPart): Integer; stdcall;

implementation

end.
