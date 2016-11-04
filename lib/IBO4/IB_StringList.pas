{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_StringList                                                                }
{                                                                              }

{***************************************************************}
{                                                               }
{          IB Objects Components and Resources Library          }
{                                                               }
{          Copyright (C) 1996-2011 Jason Wharton                }
{          and CPS - Computer Programming Solutions, Malta, ID  }
{                                                               }
{  This source code unit is released under the terms of the     }
{  CPS Trustware License.                                       }
{  It may be distributed or deployed as source code or in       }
{  compiled form only in compliance with the terms and          }
{  conditions of the CPS Trustware License which may be         }
{  examined at http://www.ibobjects.com/ibo_trustware.html      }
{                                                               }
{***************************************************************}

{******************************************************************************}
{  CONTRIBUTED MODIFICATIONS                                                   }
{  Additions or modifications listed below using format:                       }
{                                                                              }
{  Joe Citizen <joe@joecitizen.com>                                            }
{  mm/dd/yyyy                                                                  }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{            Copyright (C) 2001 Joe Citizen                                    }
{                                                                              }
{------------------------------------------------------------------------------}
{  Place your credits and information in the top of the section                }
{  below with any other descriptions or explanations desired.                  }
{------------------------------------------------------------------------------}
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}

{: This unit contains the string list used by many properties.}
unit
  IB_StringList;

interface

uses

{$IFNDEF FPC}
  Windows, Messages,
{$ELSE}
  LCLIntf, LCLType, DelphiCompatibilityNonVisual,
{$ENDIF}
  SysUtils, Classes,

  IB_Constants;


type

{: This class is used heavily throughout IB Objects to store information that
is keyed to a column name. Generally, it contains a list of strings, each
comprising a column name connected by an '=' symbol to a value associated
with it. Such a string is referred to as a "link entry".
<br><br>
It is possible for multiple values to be associated with a column in a single
link entry. They are accessed by using link entry params. It can be thought of
as parallel to command-line parameters, where there are multiple settings on one
line of text.
<br><br>
This storage technique makes it very easy to preserve settings between sessions,
to maintain user preferences.  Examine the code in the IB_SQL application to see
how settings are streamed between the IB_Stringlists and the system registry
from session to session.
<br><br>
IBF_Query should be the best example in this project. Be sure to look through
IBF_Base to see how a foundation for streaming has been built. You will find
the WriteStrings() and ReadStrings() methods very useful to put and get string
list data in/out of the system registry.
<br><br>
Some stringlist properties that are referred to heavily are mirrored to
variables for direct reading (via properties) without the overhead of parsing
the link entries for an individual entry each time it is wanted. It may appear
that duplication exists in the component interface but, in fact, IBO keeps the
variables, including those which are writable, fully synchronized.
<br><br>
The BNF of the syntax for the link entries are as follows:
<br><br>
Since I don't exactly recall the proper syntax for this I'll give the key
that I use:
<br>
<br>< > denotes a logical item of the BNF
<br>[]  denotes an optional portion of an item
<br>( | ) denotes that only one of the items separated by the | are valid
<br>''  denote literal characters
<font face="Courier New">
<ul>
<li>< link entry >      ::= < link name >< equal sign >< link value >
<li>< link name >       ::= [< table name >< period >]< column name >
<li>< link value >      ::= (< string literal >|< param list >)
<li>< param list >      ::= < param name >[=< literal >]
                                             [< param delimiter >< param list >]
<li>< literal >         ::= < char list item >[< literal >]
<li>< char list item >  ::= (< char >|< char pair >)
<li>< char pair >       ::= ( '\=' | '\;' | '\\' | '\n' | '\0' )
<li>< char >            ::= < any character except 2nd char of char pair >
<li>< param delimiter > ::= ';'
<li>< equal sign >      ::= '='
<li>< period >          ::= '.'
<li>< table name >      ::= < IB identifier >
<li>< column name >     ::= < IB identifier >
<li>< param name >      ::= < IB identifier >
<li>< IB identifier >   ::= < string with no spaces or funky characters, etc. >
</ul>
</font>
<br><br>
The special characters are used in order to prevent the stringlist from
becoming corrupted and to simplify parsing of each string list item.
<br><br>
Don't confuse the notion of "param" above with the input parameters of a
SQL statement. They are used in a different context here.  Certain link entries
can take a refining value (or a comma-separated list) as "parameters".  As an
example, a ColumnAttributes link entry for a Boolean column might look like
this:
<br><br>
MYCOLUMN=BOOLEAN='T','F'
<br><br>
Here, the values which IBO is to recognize as True and False are
parameters to this link entry.
<br><br>
When using the properties to interface with the contents of the stringlist
the special characters are all converted for you.  It is only if you access the
raw contents of the list directly in your own code that you will need to take
the special characters into consideration.
<br><br>
Please take care with punctuating these link entries. In general, avoid adding
extra spaces since the parsing may not be so forgiving as to allow them.  In
particular, do not leave spaces either side of the "=" symbol in a link entry.}
TIB_StringList = class(TStringList)
private
  FAllowBlankLines: boolean;
  FRemovingBlankLines: boolean;
  FUpdateState: boolean;
  FQuickSortParam: String;
  FQuickSortNumeric: boolean;
  function GetIndexName( Index: integer ): String;
  function GetIndexNameRel( Index: integer ): String;
  function GetIndexNameCol( Index: integer ): String;
  procedure SetIndexName( Index: integer; AValue: String );
  function GetIndexValue( Index: integer ): String;
  procedure SetIndexValue( Index: integer; AValue: String );
  function GetLinkIndex( ALink: String ): integer;
  function GetLinkValue( ALink: String ): String;
  procedure SetLinkValue( ALink: String; AValue: String );
  function GetIndexParamValue( Index: integer; AParam: String ): String;
  procedure SetIndexParamValue( Index: integer; AParam, AValue: String );
  function GetLinkParamValue( ALink, AParam: String ): String;
  procedure SetLinkParamValue( ALink, AParam: String; AValue: String );
  function GetLinkParamIsSet( ALink, AParam: String ): boolean;
  procedure SetLinkParamIsSet( ALink, AParam: String; AValue: boolean );
  function GetIndexParamIsSet( AIndex: integer; AParam: String ): boolean;
  procedure SetIndexParamIsSet( AIndex: integer;
                                AParam: String; AValue: boolean );
  procedure SetAllowBlankLines( AValue: boolean );
  function GetSafeCommaText: String;
  procedure SetSafeCommaText( AValue: String );
  procedure RemoveBlankLines;
protected
  procedure Changing; override;
  procedure Changed; override;
  procedure SetUpdateState(Updating: Boolean); override;
  procedure Put(Index: Integer; const S: String); override;
  property RemovingBlankLines: boolean read FRemovingBlankLines;
  property UpdateState: boolean read FUpdateState;
  procedure SysParamQuickSort( L, R: Integer );
  function SysStringListParamSort( Index1: integer; Index2: String ): Integer;
public
  constructor Create; virtual;

{: Cover up a bug in Delphi 2.}
  procedure SaveToStream(Stream: TStream); override;
  procedure RemoveBlankEntries;
{: This will allow you to order the entries in the string list according to a
particular parameter in the link entries.}
  procedure ParamQuickSort( AParam: String; IsNumeric: boolean );
{: Hook in needed functionality to this sub class by overriding.}
  function Add(const S: String): Integer; override;
{: Allow checking for validity of returned value.  ie. A blank/null return
string could mean that the attribute was defined as blank OR it could
mean that the value was not found.  Use the IsSet parameter to check
whether the attribute was truly found. }
  function GetLinkParamValueEx(     ALink, AParam: String;
                                var IsSet: boolean ): String;
{: This property is used to trim out blank lines from the string list.}
  property AllowBlankLines: boolean read FAllowBlankLines
                                    write SetAllowBlankLines;
{: Just what it implies. Safe from what? It has to do with the SQL Dialect 3
capabilities. Because a comma is a valid part of a delimited identifier the
comma text feature needs to be sensitive to that.}
  property SafeCommaText: String read GetSafeCommaText write SetSafeCommaText;
{: If Sorted this will perform an optimized search for the Index of the name.}
  function FindIndex( const AName: String; var AIndex: integer ): boolean;
{: If Sorted this will perform an optimized search for the Value of the name.}
  function FindValue( const AName: String; var AValue: String ): boolean;
{: Indexed reference to the name portion of the link entry.}
  property IndexNames[ Index: integer ]: String read GetIndexName
                                                write SetIndexName;
{: Indexed reference to the relation of the name portion of the link entry.}
  property IndexNamesRel[ Index: integer ]: String read GetIndexNameRel;
{: Indexed reference to the column of the name portion of the link entry.}
  property IndexNamesCol[ Index: integer ]: String read GetIndexNameCol;
{: Indexed reference to the value portion of the link entry.}
  property IndexValues[ Index: integer ]: String read GetIndexValue
                                                 write SetIndexValue;
{: Value of a parameter from the value portions of a link entry that
corresponds with the given index reference.}
  property IndexParamValue[ Index: integer;
                            AParam: String ]: String read GetIndexParamValue
                                                     write SetIndexParamValue;
{: Indicates whether, in the value portions of the link entry having the given
index reference, a value exists corresponding to the given parameter.}
  property IndexParamIsSet[ Index: integer;
                            AParam: String ]: boolean read GetIndexParamIsSet
                                                      write SetIndexParamIsSet;
{: Index of the Link in the list of link entries.}
  property LinkIndex[ ALink: String ]: integer read GetLinkIndex;
{: Value portion associated with the Link in the list of link entries.}
  property LinkValues[ ALink: String ]: String read GetLinkValue
                                               write SetLinkValue;
{: Value of a parameter from the value portions of a link entry that
corresponds with the given link.}
  property LinkParamValue[ ALink,
                           AParam: String ]: String read GetLinkParamValue
                                                    write SetLinkParamValue;
{: Indicates whether, in the value portions of the link entry that corresponds
to the given link, a value exists.}
  property LinkParamIsSet[ ALink,
                           AParam: String ]: boolean read GetLinkParamIsSet
                                                     write SetLinkParamIsSet;
end;

{: This is used internally by various properties in IBO components. This class
uses default values appropriate for what each property needs to accomplish.}
TIB_StringProperty = class(TIB_StringList)
public
  constructor Create; override;
end;

{: This is used internally by various properties in IBO components. This class
uses default values appropriate for what each property needs to accomplish.}
TIB_StringCache = class(TIB_StringList)
public
  constructor Create; override;
end;

implementation

uses
  IB_Parse, IB_Utils;

constructor TIB_StringList.Create;
begin
  inherited Create;
  FAllowBlankLines := true;
end;

constructor TIB_StringProperty.Create;
begin
  inherited Create;
  FAllowBlankLines := false;
end;

constructor TIB_StringCache.Create;
begin
  inherited Create;
  inherited Sorted := true;
end;

procedure TIB_StringList.SaveToStream(Stream: TStream);
var
  S: string;
  SS: TStringStream;
begin
  if Assigned( Stream ) then
  begin
    S := GetTextStr;
    SS := TStringStream.Create( S );
    try
      Stream.CopyFrom( SS, 0 );
//    Stream.WriteBuffer(Pointer(S)^, {ibo}Length(S));
    finally
      SS.Free;
    end;
  end;
end;

function TIB_StringList.Add(const S: string): Integer;
  function InternalAdd( const S: string):Integer;
  var
    APos: longint;
  begin
    if ( not Sorted ) then
      Result := inherited Add( S )
    else
    begin
      APos := getLitSafePos( '=', S, 1 );
      if APos = 0 then
        Result := inherited Add( S )
      else
      begin
        if FindIndex( iboCopy( S, 1, APos - 1 ), Result ) then
        begin
          case Duplicates of
            dupIgnore:
            begin
              Strings[ Result ] := S;
              Exit;
            end;
            dupError: raise Exception.Create( E_Duplicate_String_Error );
          end;
        end;
        Result := inherited Add( S )
      end;
    end;
  end;
begin
  if RemovingBlankLines or ( iboLength( Trim( S )) > 0 ) then
    Result := InternalAdd( S )
  else
  begin
// This makes it so that a blank line can be explicitely added.
// It is to allow the way the TStrings.SetValue() method works.
    FRemovingBlankLines := true;
    try
      Result := InternalAdd( S );
    finally
      FRemovingBlankLines := false;
    end;
  end;
end;

//ADDED// CW 2000-08-11
{
The normal implementation (at least for Delphi 3) of TStringList.Put()
does not support sorted lists.  This method override allows Put() to
work with a sorted TIB_StringList by reverting to the behaviour of
the TStrings.Put() method when the stringlist is sorted.
}
procedure TIB_StringList.Put(Index: Integer; const S: string);
var
  TempObject: TObject;
begin
  if not Sorted then
    inherited Put( Index, S )
  else
  begin
    TempObject := GetObject( Index );
    {ibo}Delete( Index );
    AddObject( S, TempObject );
  end;
end;

function TIB_StringList.GetIndexName( Index: integer ): String;
var
  APos: longint;
begin
  Result := Get(Index);
  APos := getLitSafePos( '=', Result, 1 );
  if APos <> 0 then
    SetLength( Result, APos - 1 );
end;

function TIB_StringList.GetIndexNameRel( Index: integer ): String;
var
  tmpPos: integer;
begin
  Result := '';
  if ( Index >= 0 ) and ( Index < Count ) then
  begin
    Result := IndexNames[ Index ];
    tmpPos := getLitSafePos( '.', Result, 1 );
    if tmpPos > 0 then
      Result := iboCopy( Result, 1, tmpPos - 1 );
  end;
end;

function TIB_StringList.GetIndexNameCol( Index: integer ): String;
var
  tmpPos: integer;
begin
  if ( Index >= 0 ) and ( Index < Count ) then
  begin
    Result := IndexNames[ Index ];
    tmpPos := getLitSafePos( '.', Result, 1 );
    if tmpPos > 0 then
      Result := iboCopy( Result, tmpPos + 1, MaxInt );
  end
  else
    Result := '';
end;

procedure TIB_StringList.SetIndexName( Index: integer; AValue: String );
var
  tmpPos: longint;
  tmpStr: String;
begin
  if AValue = '' then
    {ibo}Delete( Index )
  else
  begin
    tmpStr := Get(Index);
    tmpPos := getLitSafePos( '=', tmpStr, 1 );
    if tmpPos > 0 then
      tmpStr := AValue + iboCopy( tmpStr, tmpPos, MaxInt )
    else
      tmpStr := AValue;
    Put( Index, tmpStr );
  end;
end;

function TIB_StringList.GetIndexValue( Index: integer ): String;
var
  tmpPos: longint;
begin
  Result := Get( Index );
  tmpPos := getLitSafePos( '=', Result, 1 );
  if tmpPos > 0 then
    Result := iboCopy( Result, tmpPos + 1, MaxInt )
  else
    SetLength( Result, 0 );
end;

procedure TIB_StringList.SetIndexValue( Index: integer; AValue: String );
var
  tmpPos: longint;
  tmpStr: String;
begin
  tmpStr := Get(Index);
  tmpPos := getLitSafePos( '=', tmpStr, 1 );
  if tmpPos > 0 then
    tmpStr := iboCopy( tmpStr, 1, tmpPos ) + AValue
  else
    tmpStr := tmpStr + '=' + AValue;
  Put(Index, tmpStr);
end;

function TIB_StringList.GetLinkIndex( ALink: String ): integer;
var
  tmpPos: longint;
  tmpStr: String;
  ii: integer;
begin
  if Sorted then
  begin
    Result := -1;
    FindIndex( ALink, Result );

    // This is apparently necessary because the whole string entry is sorted
    // instead of just the name being sorted. Thus, the quick lookup algorithm
    // has blind spots. This check is to make sure we don't hit a blind spot.
    // Yes, I know this is ugly and it won't help performance any.
    // A much better method of storing these stringlist properties is in order.
    if Result = -1 then
      Result := IndexOfName( ALink );

  end
  else
    Result := IndexOfName( ALink );
  if Result = -1 then
    Result := IndexOf( ALink );
  if Result = -1 then
  begin
    tmpPos := getLitSafePos( '.', ALink, 1 );
    if tmpPos <> 0 then
    begin
      ALink := iboCopy( ALink, tmpPos + 1, MaxInt );
      if Sorted then
        FindIndex( ALink, Result )
      else
        Result := IndexOfName( ALink );
      if Result = -1 then
        Result := IndexOf( ALink );
    end
    else
    begin
      for ii := 0 to Count - 1 do
      begin
        tmpStr := Names[ ii ];
        tmpPos := getLitSafePos( '.', tmpStr, 1 );
        if tmpPos > 0 then
        begin
          tmpStr := iboCopy( tmpStr, tmpPos + 1, MaxInt );
          if AnsiCompareText( ALink, tmpStr ) = 0 then
          begin
            Result := ii;
            Break;
          end;
        end;
      end;
    end;
  end;
end;

function TIB_StringList.GetLinkValue( ALink: String ): String;
var
  tmpPos: longint;
  ii: integer;
  tmpStr: String;
begin
  if Sorted then
    FindValue( ALink, Result )
  else
    Result := Values[ ALink ];
  if Result = '' then
  begin
    tmpPos := getLitSafePos( '.', ALink, 1 );
    if tmpPos <> 0 then
    begin
      ALink := iboCopy( ALink, tmpPos + 1, MaxInt );
      if Sorted then
        FindValue( ALink, Result )
      else
        Result := Values[ ALink ];
    end
    else
    begin
      for ii := 0 to Count - 1 do
      begin
        tmpStr := Names[ ii ];
        tmpPos := getLitSafePos( '.', tmpStr, 1 );
        if tmpPos > 0 then
        begin
          tmpStr := iboCopy( tmpStr, tmpPos + 1, MaxInt );
          if AnsiCompareText( ALink, tmpStr ) = 0 then
          begin
            Result := IndexValues[ ii ];
            Break;
            // Check for ambiguous settings?
          end;
        end;
      end;
    end;
  end;
end;

procedure TIB_StringList.SetLinkValue( ALink: String; AValue: String );
var
  tmpPos: longint;
  tmpStr: String;
  ii: integer;
  tmpInd: integer;
  tmpLink: String;
begin
  tmpLink := ALink;
  if Sorted then
  begin
    tmpInd := -1;
    FindIndex( ALink, tmpInd );
  end
  else
    tmpInd := IndexOfName( ALink );
  if tmpInd = -1 then
    tmpInd := IndexOf( ALink );
  if tmpInd = -1 then
  begin
    tmpPos := getLitSafePos( '.', ALink, 1 );
    if tmpPos <> 0 then
    begin
      ALink := iboCopy( ALink, tmpPos + 1, MaxInt );
      if Sorted then
        FindIndex( ALink, tmpInd )
      else
        tmpInd := IndexOfName( ALink );
      if tmpInd = -1 then
        tmpInd := IndexOf( ALink );
    end
    else
    begin
      for ii := 0 to Count - 1 do
      begin
        tmpStr := Names[ ii ];
        tmpPos := getLitSafePos( '.', tmpStr, 1 );
        if tmpPos > 0 then
        begin
          tmpStr := iboCopy( tmpStr, tmpPos + 1, MaxInt );
          if AnsiCompareText( ALink, tmpStr ) = 0 then
          begin
            tmpInd := ii;
            tmpStr := Get( tmpInd );
            Put( tmpInd, iboCopy( tmpStr, 1,
                               getLitSafePos( '=', tmpStr, 1 )) + AValue );
          end;
        end;
      end;
      if tmpInd <> -1 then
        Exit;
    end;
  end;
  if tmpInd = -1 then
    Add( tmpLink + '=' + AValue )
  else
  begin
    tmpStr := Get( tmpInd );
    Put( tmpInd, iboCopy( tmpStr, 1, getLitSafePos( '=', tmpStr, 1 )) + AValue );
  end;
end;

function TIB_StringList.GetIndexParamValue( Index: integer;
                                            AParam: String ): String;
var
  BeginPos, EndPos: longint;
begin
  BeginPos := 0;
  EndPos := 0;
  ExtractListLinkParam( IndexValues[Index], AParam, BeginPos, EndPos, Result );
end;

procedure TIB_StringList.SetIndexParamValue( Index: integer;
                                             AParam: String;
                                             AValue: String );
var
  tmpStr: String;
begin
  tmpStr := IndexValues[ Index ];
  if SetListLinkParamValue( tmpStr, AParam, AValue ) then
    IndexValues[ Index ] := tmpStr;
end;

function TIB_StringList.GetLinkParamValueEx( ALink, AParam: String;
  var IsSet: boolean ): String;
var
  BeginPos, EndPos: longint;
begin
  BeginPos := 0;
  EndPos := 0;
  ExtractListLinkParam( LinkValues[ ALink ], AParam, BeginPos, EndPos, Result );
  IsSet := BeginPos <> ParseLineInvalid;
end;

function TIB_StringList.GetLinkParamValue( ALink, AParam: String ): String;
var
  BeginPos, EndPos: longint;
begin
  BeginPos := 0;
  EndPos := 0;
  ExtractListLinkParam( LinkValues[ ALink ], AParam, BeginPos, EndPos, Result );
end;

procedure TIB_StringList.SetLinkParamValue( ALink,
                                            AParam,
                                            AValue: String );
var
  tmpStr: String;
  tmpInt: integer;
begin
  tmpInt := LinkIndex[ ALink ];
  tmpStr := IndexValues[ tmpInt ];
  if SetListLinkParamValue( tmpStr, AParam, AValue ) then
    IndexValues[ tmpInt ] := tmpStr;
end;

function TIB_StringList.GetLinkParamIsSet( ALink, AParam: String ): boolean;
var
  tmpStr: String;
  BeginPos, EndPos: longint;
begin
  tmpStr := '';
  BeginPos := 0;
  EndPos := 0;
  ExtractListLinkParam( LinkValues[ ALink ], AParam, BeginPos, EndPos, tmpStr );
  Result := BeginPos <> ParseLineInvalid;
end;

procedure TIB_StringList.SetLinkParamIsSet( ALink, AParam: String;
                                            AValue: boolean );
var
  tmpStr: String;
begin
  tmpStr := LinkValues[ ALink ];
  if SetListLinkParamIsSet( tmpStr, AParam, AValue ) then
    LinkValues[ ALink ] := tmpStr;
end;

function TIB_StringList.GetIndexParamIsSet( AIndex: integer;
                                            AParam: String ): boolean;
var
  tmpStr: String;
  BeginPos, EndPos: longint;
begin
  tmpStr := '';
  BeginPos := 0;
  EndPos := 0;
  ExtractListLinkParam( IndexValues[AIndex], AParam, BeginPos, EndPos, tmpStr );
  Result := BeginPos <> ParseLineInvalid;
end;

procedure TIB_StringList.SetIndexParamIsSet( AIndex: integer;
                                             AParam: String;
                                             AValue: boolean );
var
  tmpStr: String;
begin
  tmpStr := IndexValues[ AIndex ];
  if SetListLinkParamIsSet( tmpStr, AParam, AValue ) then
    IndexValues[ AIndex ] := tmpStr;
end;

procedure TIB_StringList.RemoveBlankLines;
var
  ii: integer;
begin
  if ( not RemovingBlankLines ) then
  begin
    FRemovingBlankLines := true;
    try
      ii := Count - 1;
      while ii >= 0 do
      begin
        if ii < Count then
        begin
          if Trim( Get( ii )) = '' then
          begin
            {ibo}Delete( ii );
          end;
        end;
        Dec( ii );
      end;
    finally
      FRemovingBlankLines := false;
    end;
  end;
end;

procedure TIB_StringList.RemoveBlankEntries;
var
  ii: integer;
  tmpStr: String;
  tmpPos: integer;
begin
  if ( not RemovingBlankLines ) then
  begin
    FRemovingBlankLines := true;
    try
      ii := Count - 1;
      while ii >= 0 do
      begin
        if ii < Count then
        begin
          tmpStr := Trim( Get( ii ));
          tmpPos := getLitSafePos( '=', tmpStr, 1 );
          if tmpPos = iboLength( tmpStr ) then
          begin
            {ibo}Delete( ii );
          end;
        end;
        Dec( ii );
      end;
    finally
      FRemovingBlankLines := false;
    end;
  end;
end;

procedure TIB_StringList.SetAllowBlankLines( AValue: boolean );
begin
  if AllowBlankLines <> AValue then
  begin
    FAllowBlankLines := AValue;
    if AllowBlankLines then
      RemoveBlankLines;
  end;
end;

procedure TIB_StringList.Changing;
begin
  if ( not RemovingBlankLines ) then
    inherited Changing;
end;

procedure TIB_StringList.Changed;
begin
  if ( not RemovingBlankLines ) and ( not UpdateState ) then
  begin
    if ( Count > 0 ) and ( not AllowBlankLines ) then
      RemoveBlankLines;
    inherited Changed;
  end;
end;

procedure TIB_StringList.SetUpdateState(Updating: Boolean);
begin
  FUpdateState := Updating;
  inherited SetUpdateState(Updating );
end;

function TIB_StringList.FindIndex( const AName: String;
                                     var AIndex: integer ): boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  if Sorted then
  begin
    L := 0;
    H := Count - 1;
    while L <= H do
    begin
      I := (L + H) shr 1;
      C := AnsiCompareText( iboCopy( Get(I), 1, iboLength(AName) + 1 ), AName + '=' );
      if C < 0 then
      begin
        L := I + 1;
      end
      else
      begin
        H := I - 1;
        if C = 0 then
        begin
          Result := True;
          if Duplicates <> dupAccept then
          begin
            L := I;
          end;
        end;
      end;
    end;
    AIndex := L;
  end
  else
    raise Exception.Create( E_Stringlist_Not_Sorted );
  if ( not Result ) then
    AIndex := -1;
end;

function TIB_StringList.FindValue( const AName: String;
                                     var AValue: String ): boolean;
var
  tmpInd: integer;
begin
  AValue := '';
  tmpInd := -1;
  Result := FindIndex( AName, tmpInd );
  if Result then
    AValue := IndexValues[ tmpInd ];
end;

function TIB_StringList.GetSafeCommaText: String;
var
  ii: integer;
begin
  if ( Count = 1 ) and ( Get(0) = '' ) then
    Result := '""'
  else
  begin
    Result := '';
    for ii := 0 to Count - 1 do
      Result := Result + Get( ii ) + ',';
    iboDelete( Result, iboLength( Result ), 1 );
  end;
end;

procedure TIB_StringList.SetSafeCommaText( AValue: String );
var
  ii: integer;
  tmpPos: integer;
begin
  tmpPos := 0;
  BeginUpdate;
  try
    Clear;
    if AValue <> '' then
      repeat
        Inc( tmpPos );
        ii := tmpPos;
        tmpPos := getLitSafePos( ',', AValue, tmpPos );
        if tmpPos > 0 then
          Add( Trim( iboCopy( AValue, ii, tmpPos - ii )))
        else
          Add( Trim( iboCopy( AValue, ii, MaxInt )));
      until tmpPos = 0;
  finally
    EndUpdate;
  end;
end;

function TIB_StringList.SysStringListParamSort( Index1: integer;
                                                Index2: String ): Integer;
var
  tmp1: String;
  tmp2: String;
begin
  if FQuickSortParam <> '' then
  begin
    tmp1 := IndexParamValue[ Index1, FQuickSortParam ];
    tmp2 := Index2;
  end
  else
  begin
    tmp1 := IndexValues[ Index1 ];
    tmp2 := Index2;
  end;
  if FQuickSortNumeric then
  begin
    if StrToFloat( tmp1 ) = StrToFloat( tmp2 ) then
      Result := 0
    else
    if StrToFloat( tmp1 ) < StrToFloat( tmp2 ) then
      Result := -1
    else
      Result := 1;
  end
  else
    Result := AnsiCompareText( tmp1, tmp2 );
end;

procedure TIB_StringList.SysParamQuickSort( L, R: Integer );
var
  I, J: Integer;
  P: String;
begin
  repeat
    I := L;
    J := R;
    if FQuickSortParam <> '' then
      P := IndexParamValue[ ( L + R ) shr 1, FQuickSortParam ]
    else
      P := IndexValues[ ( L + R ) shr 1 ];
    repeat
      while SysStringListParamSort( I, P ) < 0 do
        Inc( I );
      while SysStringListParamSort( J, P ) > 0 do
        Dec( J );
      if I <= J then
      begin
        Exchange( I, J );
        Inc( I );
        Dec( J );
      end;
    until I > J;
    if L < J then
      SysParamQuickSort( L, J );
    L := I;
  until I >= R;
end;

procedure TIB_StringList.ParamQuickSort( AParam: String;
                                         IsNumeric: boolean );
begin
  FQuickSortParam := AParam;
  FQuickSortNumeric := IsNumeric;
  if Count > 1 then
    SysParamQuickSort( 0, Count - 1 );
end;

end.
