unit module;

interface
uses PythonEngine;

// for python 2.x
procedure initdemodll; cdecl;
// for python 3.x
function PyInit_demodll : PPyObject; cdecl;

var
  gEngine : TPythonEngine;
  gModule : TPythonModule;

implementation

function Add( Self, Args : PPyObject ) : PPyObject; far; cdecl;
var
  a, b : Integer;
begin
  with GetPythonEngine do
    begin
      if PyArg_ParseTuple( args, 'ii:Add',@a, @b ) <> 0 then
        begin
          Result := PyLong_FromLong( a + b );
        end
      else
        Result := nil;
    end;
end;

procedure initdemodll;
begin
  try
    gEngine := TPythonEngine.Create(nil);
    gEngine.AutoFinalize := False;
    gEngine.UseLastKnownVersion := False;
    gEngine.DllName := 'python39.dll';
    gEngine.DllPath := 'E:\EXE\Python';
    gEngine.LoadDll;
    gModule := TPythonModule.Create(nil);
    gModule.Engine := gEngine;
    gModule.ModuleName := 'demodll';
    gModule.AddMethod( 'add', @Add, 'add(a,b) -> a+b' );
    gModule.Initialize;
  except
  end;
end;

function PyInit_demodll : PPyObject;
begin
  Result := nil;
  try
    gEngine := TPythonEngine.Create(nil);
    gEngine.AutoFinalize := False;
    gEngine.UseLastKnownVersion := False;
    gEngine.DllName := 'python39.dll';
    gEngine.DllPath := 'E:\EXE\Python';
    gEngine.LoadDll;
    gModule := TPythonModule.Create(nil);
    gModule.Engine := gEngine;
    gModule.ModuleName := 'demodll';
    gModule.AddMethod( 'add', @Add, 'add(a,b) -> a+b' );
    gModule.Initialize;
    Result := gModule.Module;
  except
  end;
end;

initialization
finalization
  gEngine.Free;
  gModule.Free;
end.


