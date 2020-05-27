unit UnitDll;

interface

uses CommonInterfaces, Data.DB;

type

  TDLLPart = class(TInterfacedObject, IDllPart)
    private
      fExePart: IExePart;
      fDataset: TDataset;
    private // Interfaces
      function Echo(aValue: String): Integer; stdcall;
      function GetDataset: TDataset; stdcall;
    public
      constructor Create(aExePart: IExePart);
      destructor Destroy; override;
  end;

implementation

uses Sysutils, Winapi.Windows, MidasLib, Datasnap.DBClient;

constructor TDLLPart.Create(aExePart: IExePart);
begin
  inherited Create;
  fExePart := aExePart;
  fDataset := TCLientDataset.Create(nil);
  with TCLientDataset(fDataset) do begin
    FieldDefs.Add('Text', ftString, 10);
    CreateDataSet;
    Open;
    Append;
    Fields[0].AsString := 'Text1';
    Post;
    Append;
    Fields[0].AsString := 'Text2';
    Post;
  end;
end;

destructor TDLLPart.Destroy;
begin
  FreeAndNil(fDataset);
  inherited;
end;

function TDLLPart.Echo(aValue: String): Integer;
var
  aStr: String;
begin
  try
    aStr := 'Echo ' + aValue;
    fExePart.Callback(aStr);
    Result := 0;
  except
    Result := -1;
  end;
end;

function TDLLPart.GetDataset: TDataset;
begin
  fExePart.Callback('GetDataset');
  Result := fDataset;
end;

end.
