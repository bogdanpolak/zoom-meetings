unit Unit24;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  CommonInterfaces;

type

  TForm24 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fHandle: THandle;
    fDllPart: IDllPart;
    procedure _LoadDLL;
    procedure _UnloadDLL;
  public
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}

{$ifdef USEFASTMM}
uses FastMMUsageTracker;
{$endif}

//******************************************************************************

type
  TExePart = class(TInterfacedObject, IExePart)
    private
      fOnCallback: TProc<String>;
      function Callback(aValue: String): Integer; stdcall;
    public
      constructor Create(aOnCallback: TProc<String>);
      destructor Destroy; override;
  end;

constructor TExePart.Create(aOnCallback: TProc<String>);
begin
  inherited Create;
  fOnCallback := aOnCallback;
end;

destructor TExePart.Destroy;
begin
  inherited;
end;

function TExePart.Callback(aValue: String): Integer;
begin
  Result := 0;
  if Assigned(fOnCallback) then
    try
      fOnCallback(aValue);
    except
      Result := -1;
    end;
end;

//******************************************************************************

procedure TForm24.FormCreate(Sender: TObject);
begin
{$ifdef USEFASTMM}
{$else}
  Button4.Visible := False;
{$endif}

end;

procedure TForm24.FormDestroy(Sender: TObject);
begin
  _UnloadDLL;
end;

procedure TForm24._LoadDLL;
var
  aEntryPoint: TEntryPoint;
begin
  if (fHandle = 0) then begin
    fHandle := Winapi.Windows.LoadLibrary(PChar('Project20.dll'));
    aEntryPoint := TEntryPoint(Winapi.Windows.GetProcAddress(fHandle, PChar(DLLENTRYPOINT)));
    aEntryPoint(
      TExePart.Create(
      procedure(aValue: String)
      begin
        Label1.Caption := aValue;
      end),
      fDllPart);
  end;
end;

procedure TForm24._UnloadDLL;
begin
  if (fHandle <> 0) then begin
    fDllPart := nil;                         // zwolnienie IDllPart w DLLce (w tym - zwolnienie IExePart)
    Winapi.Windows.FreeLibrary(fHandle);     // teraz mo¿na wyrzuciæ DLLkê z pamiêci
  end;
end;

procedure TForm24.Button1Click(Sender: TObject);
begin
  TStringList.Create.Add('Object and String Memory Leaks');  // tworzymy, ale nie zwalniamy - memory leak
end;

procedure TForm24.Button2Click(Sender: TObject);
var
  aValue: String;
begin
  _LoadDLL;
  aValue := GetTickCount.ToString;
  fDllPart.Echo(aValue);
end;

procedure TForm24.Button3Click(Sender: TObject);
begin
  _LoadDLL;
  DataSource1.Dataset := fDllPart.GetDataset;
end;

procedure TForm24.Button4Click(Sender: TObject);
begin
{$ifdef USEFASTMM}
  ShowFastMMUsageTracker;
{$endif}
end;

end.
