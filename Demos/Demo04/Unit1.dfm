object Form1: TForm1
  Left = 237
  Top = 135
  Caption = 'Demo of Python'
  ClientHeight = 383
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 137
    Width = 528
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 536
  end
  object Memo1: TMemo
    Left = 0
    Top = 140
    Width = 528
    Height = 175
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'print ("Current value of var test is: ", test)'
      'test.Value = "New value set by Python"'
      'print ("New value is:", test)'
      'print ("-----------------------------------------------------")'
      'class C:'
      '  def __init__(Self, Arg):'
      '    Self.Arg = Arg'
      '  def __str__(Self):'
      '    return "<C instance contains: " + str(Self.Arg) + ">"'
      'print ("Current value of var object is: ", object)'
      'object.Value = C("Hello !")'
      'print ("New value is:", object)')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 315
    Width = 528
    Height = 68
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 328
      Top = 42
      Width = 38
      Height = 13
      Caption = 'var test:'
    end
    object Button1: TButton
      Left = 6
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Execute script'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 168
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Load script...'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 264
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Save script...'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 368
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Show var test'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Edit1: TEdit
      Left = 368
      Top = 40
      Width = 161
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
    end
  end
  object Memo2: TMemo
    Left = 0
    Top = 0
    Width = 528
    Height = 137
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 2
  end
  object PythonEngine1: TPythonEngine
    DllName = 'python39.dll'
    DllPath = 'E:\EXE\Python3'
    APIVersion = 1013
    RegVersion = '3.10'
    UseLastKnownVersion = False
    InitScript.Strings = (
      'import sys'
      'print ("Python Dll: ", sys.version)'
      'print (sys.copyright)'
      'print')
    IO = PythonGUIInputOutput1
    Left = 32
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.py'
    Filter = 'Python files|*.py|Text files|*.txt|All files|*.*'
    Left = 176
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.py'
    Filter = 'Python files|*.py|Text files|*.txt|All files|*.*'
    Left = 208
  end
  object PythonDelphiVar1: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'test'
    OnGetData = PythonDelphiVar1GetData
    OnSetData = PythonDelphiVar1SetData
    OnChange = PythonDelphiVar1Change
    Left = 128
  end
  object PythonGUIInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = Memo2
    Left = 64
  end
  object PythonDelphiVar2: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'object'
    OnExtGetData = PythonDelphiVar2ExtGetData
    OnExtSetData = PythonDelphiVar2ExtSetData
    Left = 128
    Top = 32
  end
end
