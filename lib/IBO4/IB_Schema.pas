{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_Schema                                                                    }
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
{  Jason Wharton <jwharton@ibobjects.com>                                      }
{  09/19/2010                                                                  }
{     Per request of Salvatore Besso <s.besso@mclink.it>                       }
{     He suggested I resolve the problem that occurs when the IDAPI registry   }
{     key is not on the machine the IBO app is running on. It creates an error }
{     message saying "file not found". It should just ignore the problem.      }
{                                                                              }
{  Jason Wharton <jwharton@ibobjects.com>                                      }
{  11/07/2003                                                                  }
{     Added OldParameterOrder function to assist with input parameter          }
{     handling.                                                                }
{                                                                              }
{     Fixed a problem with generator handling. It was not properly dealing     }
{     with negative values and interpreting them as a high positive number.    }
{            Copyright (C) 2001 Jason Wharton                                  }
{                                                                              }
{------------------------------------------------------------------------------}
{  Place your credits and information in the top of the section                }
{  below with any other descriptions or explanations desired.                  }
{------------------------------------------------------------------------------}
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  10-Aug-2001                                                                 }
{     Altered GetGeneratorValue so that it always expects the supplied         }
{     generator name parameter to be fully specified - including quotes        }
{     if quotes are required.  Previously it tried to reprocess the            }
{     the supplied name but this produces inconsistent results.                }
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}

unit
  IB_Schema;

interface

uses
  Classes, SysUtils, Dialogs,

  IB_Header,
  IB_Utils,
  IB_Constants,
  IB_Session,
  IB_Components,
  IB_StringList;

procedure SchemaVersionInfo( Cn: TIB_Connection;
                             Tr: TIB_Transaction;
                             VersionInfo: TStrings );

procedure SchemaDomainNames( Cn: TIB_Connection;
                             Tr: TIB_Transaction;
                             System: boolean;
                             Names: TStrings );

procedure SchemaFieldDomains( Cn: TIB_Connection;
                              Tr: TIB_Transaction;
                              FieldDomains: TStrings );

procedure SchemaGeneratorNames( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                System: boolean;
                                Names: TStrings );

procedure SchemaRelationNames( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               System,
                               Tables,
                               Views: boolean;
                               Names: TStrings );

procedure SchemaRelationsByID( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               Views: boolean;
                               RelationsByID: TStrings );

procedure SchemaFieldNames( Cn: TIB_Connection;
                            Tr: TIB_Transaction;
                            Names: TStrings;
                            RelationName: string = '' );

procedure SchemaCharacterSetList( Cn: TIB_Connection;
                                  Tr: TIB_Transaction;
                                  CharList: TStrings );

procedure SchemaCharacterSetInfo( Cn: TIB_Connection;
                                  Tr: TIB_Transaction;
                                  CharInfo: TStrings );

procedure SchemaCollationList( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               CollateList: TStrings );

procedure SchemaCollationInfo( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               CollationInfo: TStrings );

procedure SchemaBlobInfo( Cn: TIB_Connection;
                          Tr: TIB_Transaction;
                          BlobInfo: TStrings );

procedure SchemaProcedureInfo( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               Names: TStrings );

procedure SchemaConstraintInfo( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                System: boolean;
                                Names: TStrings;
                                RelationName: string = '' );

procedure SchemaTriggerInfo( Cn: TIB_Connection;
                             Tr: TIB_Transaction;
                             System: boolean;
                             Names: TStrings;
                             RelationName: string = '' );

procedure SchemaIndexDefinitions( Cn: TIB_Connection;
                                  Tr: TIB_Transaction;
                                  SystemTables: boolean;
                                  Definitions: TStrings );

procedure SchemaIndexInfo( Cn: TIB_Connection;
                           Tr: TIB_Transaction;
                           System: boolean;
                           Names: TStrings;
                           RelationName: string = '' );

procedure SchemaIndexSegmentsInfo( Cn: TIB_Connection;
                                   Tr: TIB_Transaction;
                                   Names: TStrings;
                                   IndexName: string );

procedure SchemaPrimaryKeyInfo( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                RelationName: string;
                                KeyList: TStrings );

procedure SchemaForeignKeyInfo( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                RelationName: string;
                                TargetRelationNames: boolean;
                                ForeignKeys: TStrings );

procedure SchemaRequiredCols( Cn: TIB_Connection;
                              Tr: TIB_Transaction;
                              System: boolean;
                              RelationName: string;
                              RequiredCols: TStrings );

procedure SchemaComputedCols( Cn: TIB_Connection;
                              Tr: TIB_Transaction;
                              System: boolean;
                              RelationName: string;
                              ComputedCols: TStrings );

procedure SchemaDefaultedCols( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               ASystem,
                               AIncludeValues: boolean;
                               RelationName: string;
                               DefaultedCols: TStrings );

procedure SchemaForeignKeyLinks( Cn: TIB_Connection;
                                 Tr: TIB_Transaction;
                                 RelationName: string;
                                 ForeignKeyLinks: TStrings );

function GetGeneratorValue(     Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                GeneratorName: string;
                                Increment: longint;
                            var GeneratorValue: ISC_INT64 ): boolean;

function GetDefaultCharSet(     Cn: TIB_Connection;
                                Tr: TIB_Transaction ): string;

function GetOldParameterOrder( Cn: TIB_Connection ): boolean;

type
  TIB_SchemaCursor = class( TIB_Dataset )
  protected
    procedure SysUpdateTrimming( AField: TIB_Column ); override;
    function SysPrepare: boolean; override;
  public
    function CheckTransaction( RequestStart: boolean;
                     TranMode: TIB_TransactionMode ): TIB_Transaction; override;
    constructor Create( AOwner: TComponent ); override;
  end;

procedure GetBDEAliasInfo( TargetType, TargetName: string; AStrings: TStrings );

//var
//  GenValueExec2: boolean = true;

implementation

uses
{$IFNDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType,
{$ENDIF}
  Registry, IB_Parse;

procedure GetBDEAliasInfo( TargetType, TargetName: string; AStrings: TStrings );

  function GetIDAPI: string;
  begin
    Result := '';
    with TRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey( '\SOFTWARE\Borland\Database Engine', True ) then
          Result := ReadString( 'CONFIGFILE01' );
      finally
        CloseKey;
        Free;
      end;
  end;

  function XReadln( fin: TFileStream; var S: string ): boolean;
  { Special version of Readln, reads IDAPI.CFG-Line
    Every line in IDAPI.CFG starts with 0300. To make our
    life easier, we skip the first occurence and look
    at 0300 as CR/LF. When writing we automatically add
    0300 }
  var
    c: ansichar;
    EOR: boolean;
  begin
    s := '';
    c := #0;
    EOR := false;
    while ( fin.Read( c, 1 ) > 0 ) and not EOR do
    begin
      if c = #3 then
      begin
        EOR := true;
        fin.Read( c, 1 ); { skip 00 following 03 }
      end
      else
        s := s + char(c);
    end;
    Result := EOR or ( s <> '' );
  end;

var
  tFN: string;
  s: string; {todo: seems to me this should be ansistring.}
  fin: TFileStream;
  inDBSection,
  inDBInfoSection,
  inAliasSection: boolean;
  tmpPos: integer;
  tmpStr: string;
  AliasName: string;
begin
  tFN := Trim( GetIDAPI );
  if ( tFN = '' ) or not FileExists( tFN ) then
    AStrings.Clear
  else
  begin
    fin := TFileStream.Create( tFN, fmOpenRead );
    AStrings.BeginUpdate;
    try
      AStrings.Clear;
      { we look at 0300 as CRLF so we skip the first occurence }
      fin.Position := 2;
      inDBSection := false;
      s := '';
      while XReadln( fin, s ) do
      begin
        { Check for end of DATABASES section }
        if inDBSection then
        begin
          if ( iboPos( #2#0#2#0#2#0, s ) > 0 ) then
            Exit;
        end
        else
          { Check for start of DATABASES section }
          if iboPos( #0 + 'DATABASES' + #0#1#0, s ) > 0 then
          begin
            inDBSection := true;
            Continue;
          end;
        if inDBSection then
        begin
          AliasName := Trim( s );
          inDBInfoSection := false;
          inAliasSection := ( TargetType = 'ALIAS' ) and
                            ( AnsiCompareText( TargetName, AliasName ) = 0 );
          while XReadln( fin, s ) and ( iboPos( #2#0#2#0, s ) = 0 ) do
          begin
            if not inDBInfoSection then
              inDBInfoSection := iboPos( #0 + 'DB INFO' + #0#1#0, s ) = 1
            else
            begin
              if not inAliasSection then
              begin
                tmpPos := iboPos( #0 + 'TYPE' + #0#4#0, s );
                if tmpPos > 0 then
                begin
                  s := Trim( iboCopy( s, 9, MaxInt ));
                  if ( AnsiCompareText( s, TargetName ) = 0 ) or
                     ( TargetName = '' ) then
                  begin
                    AStrings.Add( AliasName );
                  end;
                end;
              end
              else
              begin
                tmpPos := iboPos( #0#4#0, s );
                if tmpPos > 0 then
                begin
                  tmpStr := Trim( iboCopy( s, 1, tmpPos - 1 )) + '=' +
                            Trim( iboCopy( s, tmpPos + 3, MaxInt ));
                end
                else
                  tmpStr := Trim( s ) + '=';
                AStrings.Add( tmpStr );
              end;
            end;
          end;
        end;
      end;
    finally
      fin.Free;
      AStrings.EndUpdate;
    end;
  end;
end;

function TIB_SchemaCursor.CheckTransaction( RequestStart: boolean;
                               TranMode: TIB_TransactionMode ): TIB_Transaction;
begin
  KeyLinksAutoDefine := false;
  if not Assigned( IB_Transaction ) and Assigned( IB_Connection ) then
    IB_Transaction := IB_Connection.SchemaCache.Transaction;
  Result := inherited CheckTransaction( RequestStart, TranMode );
end;

constructor TIB_SchemaCursor.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
end;

procedure TIB_SchemaCursor.SysUpdateTrimming( AField: TIB_Column );
var
  OldDefaultNoTrimming: boolean;
begin
  if Assigned( IB_Connection ) then
  begin
    OldDefaultNoTrimming := IB_Connection.DefaultNoTrimming;
    try
      IB_Connection.DefaultNoTrimming := false;
      inherited SysUpdateTrimming( AField );
    finally
      IB_Connection.DefaultNoTrimming := OldDefaultNoTrimming;
    end;
  end
  else
    inherited SysUpdateTrimming( AField );
end;

function TIB_SchemaCursor.SysPrepare: boolean;
var
  OldDefaultNoTrimming: boolean;
begin
  if Assigned( IB_Connection ) then
  begin
    OldDefaultNoTrimming := IB_Connection.DefaultNoTrimming;
    try
      IB_Connection.DefaultNoTrimming := false;
      Result := inherited SysPrepare;
    finally
      IB_Connection.DefaultNoTrimming := OldDefaultNoTrimming;
    end;
  end
  else
    Result := inherited SysPrepare;
end;

procedure SchemaVersionInfo( Cn: TIB_Connection;
                             Tr: TIB_Transaction;
                             VersionInfo: TStrings );
type
  TVarStrData = array [0..1023] of ansichar;
var
  ii: integer;
  tmpSQL: RawByteString;
  tmpCur: RawByteString;
  POut_DA: PXSQLDA;
  nullind0: smallint;
  Fld0: TVarStrData;
  tmp0: string;
  stHandle: isc_stmt_handle;
begin
  if ( VersionInfo = nil ) or ( Cn = nil ) then
    Exit;
  if Tr = nil then
    Tr := Cn.SchemaCache.Transaction;
  if Tr = nil then
    Tr := Cn.DefaultTransaction;
  if Tr = nil then
    Exit;
  Tr.Started := true;
  VersionInfo.BeginUpdate;
  try
    VersionInfo.Clear;
    {
    Note: Grab a calculated string result here as the *only* selected data
          to make it so that IBO does not try to get any other schema cache
          info. If this is not done, an infinite loop will result in the
          TIB_SchemaCache.GetSchemaCacheList method.
    Note: VERSION_NUMBER should be defined NOT NULL such that a string result
          is always returned for all items (a NULL value would remove the item
          from the result set, and cause version checking headaches).  See
          TIB_SchemaCache.CheckSchemaVersionTable for required table definition.
    }
    tmpSQL := 'SELECT cast( SCHEMA_ITEM as varchar( 33 )) || ''='' || ' +
              #13#10'cast( VERSION_NUMBER as varchar( 33 ))' +
              #13#10'FROM IBO$SCHEMA_VERSION' +
              #13#10'ORDER BY 1';  // Grab in sorted list order.
    POut_DA := AllocMem( XSQLDA_LENGTH( 1 ));
    try
      with POut_DA^ do
      begin
        version := SQLDA_VERSION1;
        sqln := 1;
        sqld := 1;
      end;
      stHandle := nil;
      Cn.AllocateStmtHandle( @stHandle );
      try
        Cn.IB_Session.errcode := isc_dsql_prepare( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   null_terminated,
                                                   PByte( tmpSQL ),
                                                   Cn.SQLDialect,
                                                   POut_DA );
        if Cn.IB_Session.errcode = isc_dsql_error then
          SysUtils.Abort // Schema table does not exist.
        else
        begin
          if Cn.IB_Session.errcode <> 0 then
            Cn.IB_Session.HandleException( Cn );
          Cn.IB_Session.errcode := isc_dsql_execute( @cn.IB_Session.status,
                                                     tr.PtrHandle,
                                                     @stHandle,
                                                     Cn.SQLDialect,
                                                     nil );
          if Cn.IB_Session.errcode <> 0 then
            Cn.IB_Session.HandleException( Cn );
          tmpCur := 'C_SchemaInfo_' + RawByteString( IntToStr( GetTickCount ));
          Cn.IB_Session.errcode := isc_dsql_set_cursor_name( @cn.IB_Session.status,
                                                             @stHandle,
                                                             PByte( tmpCur ),
                                                             0 {Unused Input } );
          if Cn.IB_Session.errcode <> 0 then
            Cn.IB_Session.HandleException( Cn );
          ii := 0;
          POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
          POut_DA.sqlvar[ ii ].sqllen  := 1022;
          POut_DA.sqlvar[ ii ].sqldata := @Fld0;
          POut_DA.sqlvar[ ii ].sqlind  := @nullind0;
          cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   POut_DA );
          while cn.IB_Session.errcode = 0 do
          begin
            tmp0 := Trim( iboDecodeA( Fld0, IBO_UTF8 ));
            VersionInfo.Add( tmp0  );
            cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                     @stHandle,
                                                     Cn.SQLDialect,
                                                     POut_DA );
          end;
          isc_dsql_free_statement( @cn.IB_Session.status,
                                   @stHandle,
                                   DSQL_CLOSE );
        end;
      finally
        Cn.DeallocateStmtHandle( @stHandle );
      end;
    finally
      FreeMem( POut_DA );
    end;
  finally
    VersionInfo.EndUpdate;
  end;
end;

procedure SchemaDomainNames( Cn: TIB_Connection;
                             Tr: TIB_Transaction;
                             System: boolean;
                             Names: TStrings );
begin
  if Names = nil then begin
    Exit;
  end else begin
    Names.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT RDB$FIELD_NAME' );
    SQL.Add( 'FROM RDB$FIELDS' );
    if not System then begin
      SQL.Add( 'WHERE ( RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL )' );
    end;
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do
    begin
      Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaFieldDomains( Cn: TIB_Connection;
                              Tr: TIB_Transaction;
                              FieldDomains: TStrings );
begin
  if FieldDomains = nil then begin
    Exit;
  end else begin
    FieldDomains.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT R.RDB$RELATION_NAME' );
    SQL.Add( '     , R.RDB$FIELD_NAME' );
    SQL.Add( '     , R.RDB$FIELD_SOURCE' );
    SQL.Add( 'FROM RDB$RELATION_FIELDS R' );
    SQL.Add( 'WHERE ( R.RDB$SYSTEM_FLAG <> 1 OR R.RDB$SYSTEM_FLAG IS NULL )' );
    SQL.Add( '  AND NOT R.RDB$RELATION_NAME STARTING ''RDB$''' );
    SQL.Add( '  AND NOT R.RDB$FIELD_NAME STARTING ''RDB$''' );
    SQL.Add( '  AND NOT R.RDB$FIELD_SOURCE STARTING ''RDB$''' );
    SQL.Add( '  AND NOT R.RDB$RELATION_NAME STARTING ''MON$''' );
    SQL.Add( '  AND NOT R.RDB$FIELD_NAME STARTING ''MON$''' );
    SQL.Add( '  AND NOT R.RDB$FIELD_SOURCE STARTING ''MON$''' );
    SQL.Add( 'ORDER BY 1, 2' );
    Prepare;
    First;
    while not Eof do
    begin
      FieldDomains.Add( IB_Connection.mkVARIdent( Fields[0].AsString ) + '.' +
                        IB_Connection.mkVARIdent( Fields[1].AsString ) + '=' +
                        IB_Connection.mkVARIdent( Fields[2].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaGeneratorNames( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                System: boolean;
                                Names: TStrings );
begin
  if Names = nil then begin
    Exit;
  end else begin
    Names.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT RDB$GENERATOR_NAME' );
    SQL.Add( 'FROM RDB$GENERATORS' );
    if not System then
      SQL.Add( 'WHERE ( RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL )' );
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do
    begin
      Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaRelationNames( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               System,
                               Tables,
                               Views: boolean;
                               Names: TStrings );
begin
  if Names = nil then begin
    Exit;
  end else begin
    Names.Clear;
  end;
  if Assigned( Cn ) then
  with TIB_SchemaCursor.Create( cn.IB_Session ) do
  try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT R.RDB$RELATION_NAME' );
    SQL.Add( 'FROM RDB$RELATIONS R' );
    if not Views and not Tables then begin
      SQL.Add( 'WHERE 0 = 1' );
    end else if System then begin
      SQL.Add( 'WHERE 1 = 1' );
    end else begin
      SQL.Add( 'WHERE ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                      ' R.RDB$SYSTEM_FLAG IS NULL )' );
    end;
    if Views and not Tables then begin
    SQL.Add( ' AND EXISTS ( SELECT V.RDB$VIEW_CONTEXT' );
    SQL.Add( '              FROM RDB$VIEW_RELATIONS V' );
    SQL.Add( '              WHERE R.RDB$RELATION_NAME = V.RDB$VIEW_NAME )' );
    end;
    if Tables and not Views then begin
    SQL.Add( ' AND NOT EXISTS ( SELECT V.RDB$VIEW_CONTEXT' );
    SQL.Add( '                  FROM RDB$VIEW_RELATIONS V' );
    SQL.Add( '                  WHERE R.RDB$RELATION_NAME = V.RDB$VIEW_NAME )');
    end;
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do
    begin
      Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaRelationsByID( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               Views: boolean;
                               RelationsByID: TStrings );
begin
  if RelationsByID = nil then
    Exit
  else
    RelationsByID.Clear;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    RetrieveDomainNames := false;
    ParamCheck := false;
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT cast( R.RDB$RELATION_ID as varchar( 33 )) || ''='', ' +
             'R.RDB$RELATION_NAME' );
    SQL.Add( 'FROM RDB$RELATIONS R' );
    if not Views then
    begin
    SQL.Add( 'WHERE NOT EXISTS ( SELECT V.RDB$VIEW_CONTEXT' );
    SQL.Add( '                   FROM RDB$VIEW_RELATIONS V' );
    SQL.Add( '                   WHERE R.RDB$RELATION_NAME=V.RDB$VIEW_NAME )');
    end;
    SQL.Add( 'ORDER BY 1' );  // Grab in sorted list order.
    Prepare;
    First;
    while not Eof do
    begin
      RelationsByID.Add( Fields[ 0 ].AsString +
                         IB_Connection.mkVARIdent( Fields[ 1 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaProcedureInfo( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               Names: TStrings );
begin
  if Names = nil then
    Exit
  else
    Names.Clear;
  if Assigned( Cn ) then
    with TIB_SchemaCursor.Create( cn.IB_Session ) do
      try
        IB_Connection := Cn;
        IB_Transaction := Tr;
        SQL.Add( 'SELECT RDB$PROCEDURE_NAME' );
        SQL.Add( 'FROM RDB$PROCEDURES' );
        SQL.Add( 'WHERE ( RDB$SYSTEM_FLAG <> 1 OR ' +
                        ' RDB$SYSTEM_FLAG IS NULL )' );
        SQL.Add( 'ORDER BY RDB$PROCEDURE_NAME' );
        Prepare;
        First;
        while not Eof do
        begin
          Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
          Next;
        end;
      finally
        Free;
      end;
end;

procedure SchemaFieldNames( Cn: TIB_Connection;
                            Tr: TIB_Transaction;
                            Names: TStrings;
                            RelationName: string );
var
  ByTable: boolean;
  tmpRel: string;
  tmpFld: string;
  tmpTbl: string;
  tmpStr: string;
  tmpPos: integer;
  OldSorted: boolean;
begin
  if Names = nil then
    Exit;
  Names.BeginUpdate;
  OldSorted :=  ( Names is TStringList ) and
                ( Names as TStringList ).Sorted;
  if OldSorted then
   ( Names as TStringList ).Sorted := false;
  try
  Names.Clear;
  ByTable := RelationName = '<BY TABLE>';
  tmpTbl := '';
  tmpStr := '';
  tmpPos := -1;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT R.RDB$RELATION_NAME, RDB$FIELD_NAME' );
    SQL.Add( 'FROM RDB$RELATION_FIELDS R' );
{ TODO : Use proper handling for detecting system settings. }
    SQL.Add( 'WHERE R.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                    ' R.RDB$SYSTEM_FLAG IS NULL )' );
    if not ByTable and ( RelationName <> '' ) then begin
      SQL.Add( '  AND R.RDB$RELATION_NAME = ' + mkLitCriteria(
                                                stLitCriteria( RelationName ),
                                                               '''' ));
      SQL.Add( 'ORDER BY R.RDB$FIELD_POSITION' );
    end else begin
      SQL.Add( 'ORDER BY R.RDB$RELATION_NAME, R.RDB$FIELD_POSITION' );
    end;
    Prepare;
    First;
{ TODO : Handle the sql dialog 3 formats...}
    while not Eof do
    begin
      tmpRel := IB_Connection.mkVARIdent( Fields[0].AsString );
      tmpFld := IB_Connection.mkVARIdent( Fields[1].AsString );
      if RelationName <> '' then
      begin
        if ByTable then
        begin
          if ( tmpTbl <> tmpRel ) or ( tmpPos = -1 ) then
          begin
            tmpStr := tmpFld;
            tmpTbl := tmpRel;
            tmpPos := Names.Add( tmpTbl + '=' + tmpStr );
          end
          else
          begin
            tmpStr := tmpStr + ',' + tmpFld;
            Names.Strings[ tmpPos ] := tmpTbl + '=' + tmpStr;
          end;
        end
        else
          Names.Add( tmpFld );
      end
      else
        Names.Add( tmpRel + '.' + tmpFld);
      Next;
    end;
  finally
    Free;
  end;
  finally
    if OldSorted then
      ( Names as TStringList ).Sorted := true;
    Names.EndUpdate;
  end;
end;

procedure SchemaCharacterSetList( Cn: TIB_Connection;
                                  Tr: TIB_Transaction;
                                  CharList: TStrings );
type
  TVarStrData = array [0..1023] of ansichar;
var
  ii: integer;
  OldSorted: boolean;
  tmpSQL: RawByteString;
  tmpCur: RawByteString;
  POut_DA: PXSQLDA;
  nullind0: smallint;
  nullind1: smallint;
  nullind2: smallint;
  nullind3: smallint;
  Fld0: TVarStrData;
  Fld1: TVarStrData;
  Fld2: TVarStrData;
  Fld3: TVarStrData;
  tmp0: string;
  tmp1: string;
  tmp2: string;
  tmp3: string;
  stHandle: isc_stmt_handle;
begin
  if ( CharList = nil ) or ( Cn = nil ) then
    Exit;
  if Tr = nil then
    Tr := Cn.SchemaCache.Transaction;
  if Tr = nil then
    Tr := Cn.DefaultTransaction;
  if Tr = nil then
    Exit;
  Tr.Started := true;
  OldSorted := ( CharList is TStringList ) and
               ( CharList as TStringList ).Sorted;
  if OldSorted then
   ( CharList as TStringList ).Sorted := false;
  CharList.BeginUpdate;
  try
    CharList.Clear;
    tmpSQL := 'SELECT C.RDB$CHARACTER_SET_ID' +
        #13#10'     , C.RDB$CHARACTER_SET_NAME' +
        #13#10'     , C.RDB$DEFAULT_COLLATE_NAME' +
        #13#10'     , C.RDB$BYTES_PER_CHARACTER' +
        #13#10'FROM RDB$RELATION_FIELDS R' +
        #13#10'JOIN RDB$FIELDS F' +
        #13#10'  ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE' +
        #13#10'JOIN RDB$CHARACTER_SETS C' +
        #13#10'  ON C.RDB$CHARACTER_SET_ID = F.RDB$CHARACTER_SET_ID' +
        #13#10'WHERE F.RDB$CHARACTER_SET_ID IS NOT NULL' +
        #13#10'UNION' +
        #13#10'SELECT C.RDB$CHARACTER_SET_ID' +
        #13#10'     , C.RDB$CHARACTER_SET_NAME' +
        #13#10'     , C.RDB$DEFAULT_COLLATE_NAME' +
        #13#10'     , C.RDB$BYTES_PER_CHARACTER' +
        #13#10'FROM RDB$CHARACTER_SETS C' +
        #13#10'WHERE C.RDB$CHARACTER_SET_NAME = ''' +
        RawByteString( Cn.CharSet ) + '''' +
        #13#10'   OR C.RDB$CHARACTER_SET_ID <= 4' +
        #13#10'ORDER BY 1';
    POut_DA := AllocMem( XSQLDA_LENGTH( 4 ));
    try
      with POut_DA^ do
      begin
        version := SQLDA_VERSION1;
        sqln := 4;
        sqld := 4;
      end;
      stHandle := nil;
      Cn.AllocateStmtHandle( @stHandle );
      try
        Cn.IB_Session.errcode := isc_dsql_prepare( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   null_terminated,
                                                   PByte( tmpSQL ),
                                                   Cn.SQLDialect,
                                                   POut_DA );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        Cn.IB_Session.errcode := isc_dsql_execute( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   nil );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        tmpCur := 'C_CharList_' + RawByteString( IntToStr( GetTickCount ));
        Cn.IB_Session.errcode := isc_dsql_set_cursor_name( @cn.IB_Session.status,
                                                           @stHandle,
                                                           PByte( tmpCur ),
                                                           0 {Unused Input } );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        ii := 0;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @Fld0;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind0;
        ii := 1;
        POut_DA.sqlvar[ ii ].sqldata := @Fld1;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind1;
        ii := 2;
        POut_DA.sqlvar[ ii ].sqldata := @Fld2;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind2;
        ii := 3;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @Fld3;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind3;
        cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                 @stHandle,
                                                 Cn.SQLDialect,
                                                 POut_DA );
        while cn.IB_Session.errcode = 0 do
        begin
          tmp0 := Trim( iboDecodeA( Fld0, IBO_UTF8 ));
          tmp1 := Trim( iboDecodeA( Fld1, IBO_UTF8 ));
          tmp2 := Trim( iboDecodeA( Fld2, IBO_UTF8 ));
          tmp3 := Trim( iboDecodeA( Fld3, IBO_UTF8 ));
          CharList.Add( tmp0 + '=' +
                        'CS=' + tmp1 + ';' +
                        'CL=' + tmp2 + ';' +
                        'BT=' + tmp3 + ';' );
          cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   POut_DA );
        end;
        isc_dsql_free_statement( @cn.IB_Session.status,
                                 @stHandle,
                                 DSQL_CLOSE );
      finally
        Cn.DeallocateStmtHandle( @stHandle );
      end;
    finally
      FreeMem( POut_DA );
    end;
  finally
    if OldSorted then
      ( CharList as TStringList ).Sorted := true;
    CharList.EndUpdate;
  end;
end;

procedure SchemaCollationList( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               CollateList: TStrings );
type
  TVarStrData = array [0..1023] of ansichar;
var
  ii: integer;
  OldSorted: boolean;
  tmpSQL: RawByteString;
  tmpCur: RawByteString;
  POut_DA: PXSQLDA;
  nullind0: smallint;
  nullind1: smallint;
  nullind2: smallint;
  nullind3: smallint;
  Fld0: TVarStrData;
  Fld1: TVarStrData;
  Fld2: TVarStrData;
  Fld3: TVarStrData;
  tmp0: string;
  tmp1: string;
  tmp2: string;
//  tmp3: string;
  stHandle: isc_stmt_handle;
begin
  if ( CollateList = nil ) or ( Cn = nil ) then
    Exit;
  if Tr = nil then
    Tr := Cn.SchemaCache.Transaction;
  if Tr = nil then
    Tr := Cn.DefaultTransaction;
  if Tr = nil then
    Exit;
  Tr.Started := true;
  OldSorted := ( CollateList is TStringList ) and
               ( CollateList as TStringList ).Sorted;
  if OldSorted then
   ( CollateList as TStringList ).Sorted := false;
  CollateList.BeginUpdate;
  try
  CollateList.Clear;
  tmpSQL := 'SELECT DISTINCT' +
      #13#10'       C.RDB$CHARACTER_SET_ID' +
      #13#10'     , C.RDB$COLLATION_ID' +
      #13#10'     , C.RDB$COLLATION_NAME' +
//      #13#10'     , C.RDB$BASE_COLLATION_NAME' + // ODS 11+ (Firebird)
      #13#10'FROM RDB$RELATION_FIELDS R' +
      #13#10'JOIN RDB$FIELDS F' +
      #13#10'  ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE' +
      #13#10'JOIN RDB$COLLATIONS C' +
      #13#10'  ON C.RDB$CHARACTER_SET_ID = F.RDB$CHARACTER_SET_ID' +
      #13#10' AND (( C.RDB$COLLATION_ID = F.RDB$COLLATION_ID ) OR ' +
      #13#10'      ( C.RDB$COLLATION_ID = R.RDB$COLLATION_ID ))' +
      #13#10'WHERE F.RDB$CHARACTER_SET_ID IS NOT NULL' +
      #13#10'ORDER BY C.RDB$CHARACTER_SET_ID' +
      #13#10'       , C.RDB$COLLATION_ID';
    POut_DA := AllocMem( XSQLDA_LENGTH( 4 ));
    try
      with POut_DA^ do
      begin
        version := SQLDA_VERSION1;
        sqln := 4;
        sqld := 4;
      end;
      stHandle := nil;
      Cn.AllocateStmtHandle( @stHandle );
      try
        Cn.IB_Session.errcode := isc_dsql_prepare( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   null_terminated,
                                                   PByte( tmpSQL ),
                                                   Cn.SQLDialect,
                                                   POut_DA );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        Cn.IB_Session.errcode := isc_dsql_execute( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   nil );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        tmpCur := 'C_CollateList_' + RawByteString( IntToStr( GetTickCount ));
        Cn.IB_Session.errcode := isc_dsql_set_cursor_name( @cn.IB_Session.status,
                                                           @stHandle,
                                                           PByte( tmpCur ),
                                                           0 {Unused Input } );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        ii := 0;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @Fld0;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind0;
        ii := 1;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @Fld1;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind1;
        ii := 2;
        POut_DA.sqlvar[ ii ].sqldata := @Fld2;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind2;
        ii := 3;
        POut_DA.sqlvar[ ii ].sqldata := @Fld3;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind3;
        cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                 @stHandle,
                                                 Cn.SQLDialect,
                                                 POut_DA );
        while cn.IB_Session.errcode = 0 do
        begin
          tmp0 := Trim( iboDecodeA( Fld0, IBO_UTF8 ));
          tmp1 := Trim( iboDecodeA( Fld1, IBO_UTF8 ));
          tmp2 := Trim( iboDecodeA( Fld2, IBO_UTF8 ));
//          tmp3 := Trim( iboDecodeA( Fld3, IBO_UTF8 ));
          CollateList.Add( tmp0 + '.' + tmp1 + '=' +
                        'CL=' + tmp2 + ';' {+
                        'BCL=' + tmp3 + ';'} );
          cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   POut_DA );
        end;
        isc_dsql_free_statement( @cn.IB_Session.status,
                                 @stHandle,
                                 DSQL_CLOSE );
      finally
        Cn.DeallocateStmtHandle( @stHandle );
      end;
    finally
      FreeMem( POut_DA );
    end;
  finally
    if OldSorted then
      ( CollateList as TStringList ).Sorted := true;
    CollateList.EndUpdate;
  end;
end;
                             
procedure SchemaCharacterSetInfo( Cn: TIB_Connection;
                                  Tr: TIB_Transaction;
                                  CharInfo: TStrings );
type
  TVarStrData = array [0..1023] of ansichar;
var
  ii: integer;
  tmpRel: string;
  tmpFld: string;
  tmpChrLen: string;
  tmpChrName: string;
  tmpClFName: string;
  tmpClRName: string;
  DefCharSet: string;
  OldSorted: boolean;
  tmpSQL: RawByteString;
  tmpCur: RawByteString;
  POut_DA: PXSQLDA;
  nullind0: smallint;
  nullind1: smallint;
  nullind2: smallint;
  nullind3: smallint;
  nullind4: smallint;
  nullind5: smallint;
  RelName: TVarStrData;
  FldName: TVarStrData;
  CharLen: TVarStrData;
  ChrName: TVarStrData;
  ClFName: TVarStrData;
  ClRName: TVarStrData;
  stHandle: isc_stmt_handle;
begin
  if ( CharInfo = nil ) or ( Cn = nil ) then
    Exit;
  if Tr = nil then
    Tr := Cn.SchemaCache.Transaction;
  if Tr = nil then
    Tr := Cn.DefaultTransaction;
  if Tr = nil then
    Exit;
  Tr.Started := true;
  DefCharSet := GetDefaultCharSet( Cn, Tr );
  OldSorted := ( CharInfo is TStringList ) and
               ( CharInfo as TStringList ).Sorted;
  if OldSorted then
   ( CharInfo as TStringList ).Sorted := false;
  CharInfo.BeginUpdate;
  try
  CharInfo.Clear;
  tmpRel := 'IBO$DATABASE';
  tmpFld := 'IBO$DEF_CHAR_SET_NAME';
  CharInfo.Add( tmpRel + '.' + tmpFld + '=' +
                'CS=' + DefCharSet + ';' );
  tmpSQL := 'SELECT R.RDB$RELATION_NAME' +
      #13#10'     , R.RDB$FIELD_NAME' +
      #13#10'     , F.RDB$CHARACTER_LENGTH' +
      #13#10'     , F.RDB$CHARACTER_SET_ID' +
      #13#10'     , F.RDB$COLLATION_ID' +
      #13#10'     , R.RDB$COLLATION_ID' +
      #13#10'FROM RDB$RELATION_FIELDS R' +
      #13#10'JOIN RDB$FIELDS F' +
      #13#10'  ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE' +
      #13#10'WHERE F.RDB$CHARACTER_SET_ID IS NOT NULL' +
      #13#10'ORDER BY R.RDB$RELATION_NAME' +
      #13#10'       , R.RDB$FIELD_POSITION';
    POut_DA := AllocMem( XSQLDA_LENGTH( 6 ));
    try
      with POut_DA^ do
      begin
        version := SQLDA_VERSION1;
        sqln := 6;
        sqld := 6;
      end;
      stHandle := nil;
      Cn.AllocateStmtHandle( @stHandle );
      try
        Cn.IB_Session.errcode := isc_dsql_prepare( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   null_terminated,
                                                   PByte( tmpSQL ),
                                                   Cn.SQLDialect,
                                                   POut_DA );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        Cn.IB_Session.errcode := isc_dsql_execute( @cn.IB_Session.status,
                                                   tr.PtrHandle,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   nil );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        tmpCur := 'C_CharInfo_' + RawByteString( IntToStr( GetTickCount ));
        Cn.IB_Session.errcode := isc_dsql_set_cursor_name( @cn.IB_Session.status,
                                                           @stHandle,
                                                           PByte( tmpCur ),
                                                           0 {Unused Input } );
        if Cn.IB_Session.errcode <> 0 then
          Cn.IB_Session.HandleException( Cn );
        ii := 0;
        POut_DA.sqlvar[ ii ].sqldata := @RelName;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind0;
        ii := 1;
        POut_DA.sqlvar[ ii ].sqldata := @FldName;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind1;
        ii := 2;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @CharLen;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind2;
        ii := 3;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @ChrName;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind3;
        ii := 4;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @ClFName;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind4;
        ii := 5;
        POut_DA.sqlvar[ ii ].sqltype := SQL_TEXT;
        POut_DA.sqlvar[ ii ].sqllen  := 10;
        POut_DA.sqlvar[ ii ].sqldata := @ClRName;
        POut_DA.sqlvar[ ii ].sqlind  := @nullind5;
        cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                 @stHandle,
                                                 Cn.SQLDialect,
                                                 POut_DA );
        while cn.IB_Session.errcode = 0 do
        begin
          tmpRel     := Trim( iboDecodeA( RelName, IBO_UTF8 ));
          tmpFld     := Trim( iboDecodeA( FldName, IBO_UTF8 ));
          tmpChrLen  := Trim( iboDecodeA( CharLen ));
          tmpChrName := Trim( iboDecodeA( ChrName ));
          tmpClFName := Trim( iboDecodeA( ClFName ));
          tmpClRName := Trim( iboDecodeA( ClRName ));
          if tmpClRName = '' then
            tmpClRName := tmpClFName;
          CharInfo.Add( Cn.mkVARIdent( tmpRel ) + '.' +
                        Cn.mkVARIdent( tmpFld ) + '=' +
                        'CL=' + tmpChrLen  + ';' +
                        'CS=' + tmpChrName + ';' +
                        'CO=' + tmpClRName + ';' );
          cn.IB_Session.errcode := isc_dsql_fetch( @cn.IB_Session.status,
                                                   @stHandle,
                                                   Cn.SQLDialect,
                                                   POut_DA );
        end;
        isc_dsql_free_statement( @cn.IB_Session.status,
                                 @stHandle,
                                 DSQL_CLOSE );
      finally
        Cn.DeallocateStmtHandle( @stHandle );
      end;
    finally
      FreeMem( POut_DA );
    end;
  finally
    if OldSorted then
      ( CharInfo as TStringList ).Sorted := true;
    CharInfo.EndUpdate;
  end;
end;

procedure SchemaCollationInfo( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               CollationInfo: TStrings );
var
  tmpRel: string;
  tmpFld: string;
  OldSorted: boolean;
begin
  if ( CollationInfo = nil ) or ( Cn = nil ) then
    Exit;
  OldSorted := ( CollationInfo is TStringList ) and
               ( CollationInfo as TStringList ).Sorted;
  if OldSorted then
   ( CollationInfo as TStringList ).Sorted := false;
  CollationInfo.BeginUpdate;
  try
  CollationInfo.Clear;
  with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT R.RDB$RELATION_NAME' );
    SQL.Add( '     , R.RDB$FIELD_NAME' );
    SQL.Add( '     , CO.RDB$COLLATION_NAME' );
    SQL.Add( 'FROM RDB$RELATION_FIELDS R' );
    SQL.Add( 'JOIN RDB$FIELDS F' );
    SQL.Add( '  ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE' );
    SQL.Add( 'JOIN RDB$CHARACTER_SETS C' );
    SQL.Add( '  ON C.RDB$CHARACTER_SET_ID = F.RDB$CHARACTER_SET_ID' );
    SQL.Add( 'JOIN RDB$COLLATIONS CO' );
    SQL.Add( '  ON CO.RDB$COLLATION_ID = R.RDB$COLLATION_ID' );
    SQL.Add( ' AND CO.RDB$CHARACTER_SET_ID = F.RDB$CHARACTER_SET_ID' );
    SQL.Add( ' AND CO.RDB$COLLATION_NAME <> C.RDB$DEFAULT_COLLATE_NAME' );
    SQL.Add( 'WHERE R.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                    ' R.RDB$SYSTEM_FLAG IS NULL )' );
    SQL.Add( '  AND F.RDB$CHARACTER_LENGTH > 0' );
    SQL.Add( 'ORDER BY R.RDB$RELATION_NAME' );
    SQL.Add( '       , R.RDB$FIELD_POSITION' );
    Prepare;
    First;
    while not Eof do
    begin
      tmpRel := IB_Connection.mkVARIdent( Fields[0].AsString );
      tmpFld := IB_Connection.mkVARIdent( Fields[1].AsString );
      CollationInfo.Add( tmpRel + '.' + tmpFld + '=' +
                         'CO=' + Fields[2].AsString + ';' );
      Next;
    end;
  finally
    Free;
  end;
  finally
    if OldSorted then
      ( CollationInfo as TStringList ).Sorted := true;
    CollationInfo.EndUpdate;
  end;
end;

procedure SchemaBlobInfo( Cn: TIB_Connection;
                          Tr: TIB_Transaction;
                          BlobInfo: TStrings );
var
  tmpRel: string;
  tmpFld: string;
  OldSorted: boolean;
begin
  if ( BlobInfo = nil ) or ( Cn = nil ) then
    Exit;
  OldSorted := ( BlobInfo is TStringList ) and
               ( BlobInfo as TStringList ).Sorted;
  if OldSorted then
   ( BlobInfo as TStringList ).Sorted := false;
  BlobInfo.BeginUpdate;
  try
  BlobInfo.Clear;
  with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT R.RDB$RELATION_NAME' );
    SQL.Add( '     , R.RDB$FIELD_NAME' );
    SQL.Add( '     , F.RDB$SEGMENT_LENGTH' );
    SQL.Add( 'FROM RDB$RELATION_FIELDS R' );
    SQL.Add( 'JOIN RDB$FIELDS F' );
    SQL.Add( '  ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE' );
    SQL.Add( 'WHERE R.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                    ' R.RDB$SYSTEM_FLAG IS NULL )' );
    SQL.Add( '  AND F.RDB$SEGMENT_LENGTH > 0' );
    SQL.Add( 'ORDER BY R.RDB$RELATION_NAME' );
    SQL.Add( '       , R.RDB$FIELD_NAME' );
    Prepare;
    First;
    while not Eof do
    begin
      tmpRel := IB_Connection.mkVARIdent( Fields[0].AsString );
      tmpFld := IB_Connection.mkVARIdent( Fields[1].AsString );
      BlobInfo.Add( tmpRel + '.' + tmpFld + '=' +
                    'SL=' + Fields[2].AsString + ';' );
      Next;
    end;
  finally
    Free;
  end;
  finally
    if OldSorted then
      ( BlobInfo as TStringList ).Sorted := true;
    BlobInfo.EndUpdate;
  end;
end;

procedure SchemaConstraintInfo( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                System: boolean;
                                Names: TStrings;
                                RelationName: string );
begin
  if Names = nil then
    Exit
  else
    Names.Clear;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT RDB$CONSTRAINT_NAME' );
    SQL.Add( 'FROM RDB$RELATION_CONSTRAINTS C' );
    SQL.Add( 'JOIN RDB$RELATIONS R' );
    SQL.Add( '  ON R.RDB$RELATION_NAME = C.RDB$RELATION_NAME' );
    SQL.Add( 'WHERE 1 = 1' );
    if RelationName <> '' then begin
    SQL.Add( '  AND C.RDB$RELATION_NAME = ' + mkLitCriteria(
                                              stLitCriteria( RelationName ),
                                                             '''' ));
    end;
    if not System then begin
{ TODO : Use proper handling for detecting system settings. }
    SQL.Add( '  AND C.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND C.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                    ' R.RDB$SYSTEM_FLAG IS NULL )' );
    end;
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do
    begin
      Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaTriggerInfo( Cn: TIB_Connection;
                             Tr: TIB_Transaction;
                             System: boolean;
                             Names: TStrings;
                             RelationName: string );
begin
  if Names = nil then begin
    Exit;
  end else begin
    Names.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT T.RDB$TRIGGER_NAME' );
    SQL.Add( 'FROM RDB$TRIGGERS T' );
    SQL.Add( 'JOIN RDB$RELATIONS R' );
    SQL.Add( '  ON R.RDB$RELATION_NAME = T.RDB$RELATION_NAME' );
    SQL.Add( 'WHERE 1=1' );
    if RelationName <> '' then
    begin
    SQL.Add( '  AND T.RDB$RELATION_NAME = ' + mkLitCriteria(
                                              stLitCriteria( RelationName ),
                                                             '''' ));
    end;
    if not System then
    begin
    SQL.Add( '  AND T.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND T.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                    ' R.RDB$SYSTEM_FLAG IS NULL )' );
    end;
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do
    begin
      Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaIndexInfo( Cn: TIB_Connection;
                           Tr: TIB_Transaction;
                           System: boolean;
                           Names: TStrings;
                           RelationName: string );
begin
  if Names = nil then begin
    Exit;
  end else begin
    Names.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT I.RDB$INDEX_NAME' );
    SQL.Add( '     , I.RDB$RELATION_NAME' );
    SQL.Add( 'FROM RDB$INDICES I' );
    SQL.Add( 'JOIN RDB$RELATIONS R' );
    SQL.Add( '  ON R.RDB$RELATION_NAME = I.RDB$RELATION_NAME' );
    SQL.Add( 'WHERE 1 = 1' );
    if RelationName <> '' then
    begin
    SQL.Add( '  AND I.RDB$RELATION_NAME = ' + mkLitCriteria(
                                              stLitCriteria( RelationName ),
                                                             '''' ));
    end;
    if not System then
    begin
    SQL.Add( '  AND I.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND I.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''RDB$''' );
    SQL.Add( '  AND R.RDB$RELATION_NAME NOT STARTING WITH ''MON$''' );
    SQL.Add( '  AND ( R.RDB$SYSTEM_FLAG <> 1 OR ' +
                    ' R.RDB$SYSTEM_FLAG IS NULL )' );
    end;
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do begin
      if RelationName <> '' then begin
        Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      end else begin
        Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ) + ',' +
                   IB_Connection.mkVARIdent( Fields[ 1 ].AsString ));
      end;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaIndexSegmentsInfo( Cn: TIB_Connection;
                                   Tr: TIB_Transaction;
                                   Names: TStrings;
                                   IndexName: string );
begin
  if Names = nil then begin
    Exit;
  end else begin
    Names.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT S.RDB$FIELD_NAME' );
    SQL.Add( 'FROM RDB$INDEX_SEGMENTS S' );
    SQL.Add( 'WHERE S.RDB$INDEX_NAME = ''' + IndexName + '''' );
    SQL.Add( 'ORDER BY S.RDB$FIELD_POSITION' );
    Prepare;
    First;
    while not Eof do begin
      Names.Add( IB_Connection.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaPrimaryKeyInfo( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                RelationName: string;
                                KeyList: TStrings );
var
  ByTable: boolean;
  ByKeys: boolean;
  ByUnique: boolean;
  curCst: string;
  curTbl: string;
  curKey: string;
  tmpCst: string;
  tmpTbl: string;
  tmpStr: string;
  tmpKey: string;
  tmpPos: integer;
  OldSorted: boolean;
begin
  if KeyList = nil then
    Exit;
  KeyList.BeginUpdate;
  OldSorted :=  ( KeyList is TStringList ) and
                ( KeyList as TStringList ).Sorted;
  if OldSorted then
   ( KeyList as TStringList ).Sorted := false;
  try
  KeyList.Clear;

  ByUnique := RelationName = '<BY UNIQUE KEYS>';
  ByKeys := RelationName = '<BY KEYS>';
  ByTable := RelationName = '<BY TABLE>';
  if ByUnique or ByTable or ByKeys then
    RelationName := ''
  else
  if ( cn.SQLDialect < SQL_DIALECT_V6 ) or
     ( not IsLitCriteria( RelationName, '"' )) then
    RelationName := iboUpperCase( RelationName );
  tmpKey := '';
  tmpCst := '';
  tmpTbl := '';
  tmpStr := '';
  tmpPos := -1;
  if Assigned( Cn ) then
  with TIB_SchemaCursor.Create( Cn.IB_Session ) do
  try
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT S.RDB$FIELD_NAME' );
    SQL.Add( '     , I.RDB$RELATION_NAME' );
    SQL.Add( '     , C.RDB$CONSTRAINT_NAME' );
    SQL.Add( 'FROM RDB$RELATION_CONSTRAINTS C' );
    SQL.Add( '   , RDB$INDICES I' );
    SQL.Add( '   , RDB$INDEX_SEGMENTS S' );
    if ByUnique then
     SQL.Add( 'WHERE C.RDB$CONSTRAINT_TYPE = ''UNIQUE''' )
    else
    if ByTable then
     SQL.Add( 'WHERE C.RDB$CONSTRAINT_TYPE IN ( ''PRIMARY KEY'', ''UNIQUE'' )' )
    else
     SQL.Add( 'WHERE C.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY''' );
    SQL.Add( '  AND C.RDB$RELATION_NAME = I.RDB$RELATION_NAME' );
    SQL.Add( '  AND C.RDB$INDEX_NAME = I.RDB$INDEX_NAME' );
    SQL.Add( '  AND I.RDB$INDEX_NAME = S.RDB$INDEX_NAME' );
    if ( RelationName <> '' ) then
    begin
      SQL.Add( '  AND I.RDB$RELATION_NAME = ' +
                          mkLitCriteria( stLitCriteria( RelationName ), '''' ));
      SQL.Add( 'ORDER BY C.RDB$CONSTRAINT_NAME' );
      SQL.Add( '       , S.RDB$FIELD_POSITION' );
    end
    else
    begin
      SQL.Add( 'ORDER BY I.RDB$RELATION_NAME' );
      SQL.Add( '       , C.RDB$CONSTRAINT_NAME' );
      SQL.Add( '       , S.RDB$FIELD_POSITION' );
    end;
    Prepare;
    First;
    while not Eof do
    begin
      curKey := IB_Connection.mkVARIdent( Fields[0].AsString );
      curTbl := IB_Connection.mkVARIdent( Fields[1].AsString );
      curCst := IB_Connection.mkVARIdent( Fields[2].AsString );
      if ( RelationName <> '' ) then
        KeyList.Add( curKey )
      else
      if ByTable then
      begin
        if ( tmpCst <> curCst ) or ( tmpTbl <> curTbl ) or ( tmpPos = -1 ) then
        begin
          tmpStr := curKey;
          tmpTbl := curTbl;
          tmpCst := curCst;
          tmpPos := KeyList.Add( curTbl + '=' + curKey );
        end
        else
        begin
          tmpStr := tmpStr + ',' + curKey;
          KeyList.Strings[ tmpPos ] := tmpTbl + '=' + tmpStr;
        end;
      end
      else
      if ByKeys then
      begin
        if ( tmpTbl <> curTbl ) then
        begin
          if tmpKey <> '' then
          begin
            KeyList.Add( tmpKey + '=' + tmpTbl );
            tmpKey := '';
          end;
          tmpTbl := curTbl;
        end;
        if tmpKey <> '' then
          tmpKey := tmpKey + ',';
        tmpKey := tmpKey + curKey;
      end
      else
        KeyList.Add( curKey + ',' + curTbl );
      Next;
    end;
    if ByKeys and ( tmpKey <> '' ) then
      KeyList.Add( tmpKey + '=' + tmpTbl );
  finally
    Free;
  end;
  finally
    if OldSorted then begin
      ( KeyList as TStringList ).Sorted := true;
    end;
    KeyList.EndUpdate;
  end;
end;

procedure SchemaForeignKeyInfo( Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                RelationName: string;
                                TargetRelationNames: boolean;
                                ForeignKeys: TStrings );
begin
  if ForeignKeys = nil then begin
    Exit;
  end else begin
    ForeignKeys.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT S.RDB$FIELD_NAME' );
    SQL.Add( '     , I.RDB$RELATION_NAME' );
    SQL.Add( 'FROM RDB$RELATION_CONSTRAINTS C' );
    SQL.Add( '   , RDB$INDICES I' );
    SQL.Add( '   , RDB$INDEX_SEGMENTS S' );
    SQL.Add( 'WHERE RDB$CONSTRAINT_TYPE = ''FOREIGN KEY''' );
    SQL.Add( '  AND C.RDB$RELATION_NAME = I.RDB$RELATION_NAME' );
    SQL.Add( '  AND C.RDB$INDEX_NAME = I.RDB$INDEX_NAME' );
    SQL.Add( '  AND I.RDB$INDEX_NAME = S.RDB$INDEX_NAME' );
    if RelationName <> '' then begin
      SQL.Add( '  AND I.RDB$RELATION_NAME = ' + mkLitCriteria(
                                                stLitCriteria( RelationName ),
                                                               '''' ));
    end;
    SQL.Add( 'ORDER BY 1, S.RDB$FIELD_POSITION' );
    Prepare;
    First;
    while not Eof do
    begin
      if TargetRelationNames then
        ForeignKeys.Add( IB_Connection.mkVARIdent( Fields[0].AsString ) + ',' +
                         IB_Connection.mkVARIdent( Fields[1].AsString ))
      else
        ForeignKeys.Add( IB_Connection.mkVARIdent( Fields[0].AsString ) + ',' +
                         IB_Connection.mkVARIdent( Fields[1].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaRequiredCols( Cn: TIB_Connection;
                              Tr: TIB_Transaction;
                              System: boolean;
                              RelationName: string;
                              RequiredCols: TStrings );
begin
  if RequiredCols = nil then begin
    Exit;
  end else begin
    RequiredCols.Clear;
  end;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT F.RDB$FIELD_NAME'    );
    SQL.Add( '     , F.RDB$RELATION_NAME' );
    SQL.Add( 'FROM RDB$RELATION_FIELDS F' );
    SQL.Add( 'WHERE RDB$NULL_FLAG = 1'  );
    if RelationName <> '' then
    SQL.Add( '  AND F.RDB$RELATION_NAME = ' + mkLitCriteria(
                                              stLitCriteria( RelationName ),
                                                             '''' ));
    if not System then
{ TODO : Use proper handling for detecting system settings. }
    SQL.Add( '  AND NOT F.RDB$RELATION_NAME STARTING WITH ''RDB$''' );
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do
    begin
      if RelationName = '' then
        RequiredCols.Add( Cn.mkVARIdent( Fields[ 0 ].AsString ) + ',' +
                          Cn.mkVARIdent( Fields[ 1 ].AsString ))
      else
        RequiredCols.Add( Cn.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaComputedCols( Cn: TIB_Connection;
                              Tr: TIB_Transaction;
                              System: boolean;
                              RelationName: string;
                              ComputedCols: TStrings );
begin
  if ComputedCols = nil then
    Exit
  else
    ComputedCols.Clear;
  if Cn = nil then Exit;
  if Assigned( Cn ) then with TIB_SchemaCursor.Create( cn.IB_Session ) do try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add( 'SELECT R.RDB$FIELD_NAME' );
    SQL.Add( '     , R.RDB$RELATION_NAME' );
    SQL.Add( 'FROM RDB$RELATION_FIELDS R' );
    SQL.Add( '   , RDB$FIELDS F' );
    SQL.Add( 'WHERE R.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME' );
    SQL.Add( '  AND F.RDB$COMPUTED_SOURCE IS NOT NULL' );
    if RelationName <> '' then
    SQL.Add( '  AND R.RDB$RELATION_NAME = ' + mkLitCriteria(
                                              stLitCriteria( RelationName ),
                                                             '''' ));
{ TODO : Use proper handling for detecting system settings. }
    if not System then
    SQL.Add( '  AND NOT R.RDB$RELATION_NAME STARTING WITH ''RDB$''' );
    SQL.Add( 'ORDER BY 1' );
    Prepare;
    First;
    while not Eof do begin
      if RelationName = '' then
        ComputedCols.Add( Cn.mkVARIdent( Fields[ 0 ].AsString ) + ',' +
                          Cn.mkVARIdent( Fields[ 1 ].AsString ))
      else
        ComputedCols.Add( Cn.mkVARIdent( Fields[ 0 ].AsString ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure SchemaDefaultedCols( Cn: TIB_Connection;
                               Tr: TIB_Transaction;
                               ASystem,
                               AIncludeValues: boolean;
                               RelationName: string;
                               DefaultedCols: TStrings );
var
  F_FIELDNAME: TIB_Column;
  F_RELATIONNAME: TIB_Column;
  F_DEFAULTSOURCE: TIB_Column;
  D_DEFAULTSOURCE: TIB_Column;
  D_FIELDTYPE: TIB_Column;
  tmpRel: string;
  tmpFld: string;
  tmpVal: string;
  tmpStr: string;
  tmpLnk: string;
begin
  if DefaultedCols = nil then
    Exit
  else
    DefaultedCols.Clear;
  if Assigned( Cn ) then
    with TIB_SchemaCursor.Create( cn.IB_Session ) do
      try
    if cn.SQLDialect < SQL_DIALECT_V6 then
      RelationName := iboUpperCase( RelationName );
    IB_Connection := Cn;
    IB_Transaction := Tr;
    SQL.Add('SELECT F.RDB$FIELD_NAME F_FieldName');
    SQL.Add('     , F.RDB$RELATION_NAME F_RelationName');
    if AIncludeValues then
    begin
    SQL.Add('     , F.RDB$DEFAULT_SOURCE F_DefaultSource');
    SQL.Add('     , D.RDB$DEFAULT_SOURCE D_DefaultSource');
    SQL.Add('     , D.RDB$FIELD_TYPE D_FieldType');
    end;
    SQL.Add('FROM RDB$RELATION_FIELDS F' );
    SQL.Add('INNER JOIN RDB$FIELDS D' );
    SQL.Add('  ON D.RDB$FIELD_NAME = F.RDB$FIELD_SOURCE');
    SQL.Add('WHERE (( F.RDB$DEFAULT_SOURCE IS NOT NULL ) OR ' +
                   '( D.RDB$DEFAULT_SOURCE IS NOT NULL ))');
    if not ASystem then
{ TODO : Use proper handling for detecting system settings. }
    SQL.Add( '  AND NOT F.RDB$RELATION_NAME STARTING WITH ''RDB$''' );
    if RelationName <> '' then
    begin
      SQL.Add( '  AND F.RDB$RELATION_NAME = ' +
               mkLitCriteria( stLitCriteria( RelationName ), '''' ));
      SQL.Add( 'ORDER BY F.RDB$FIELD_NAME' );
    end
    else
      SQL.Add( 'ORDER BY F.RDB$RELATION_NAME, F.RDB$FIELD_NAME' );
    Prepare;
    F_FIELDNAME := FieldByName('F_FIELDNAME');
    F_RELATIONNAME := FieldByName('F_RELATIONNAME');
    F_DEFAULTSOURCE := FindField('F_DEFAULTSOURCE');
    D_DEFAULTSOURCE := FindField('D_DEFAULTSOURCE');
    D_FIELDTYPE := FindField('D_FIELDTYPE');
    First;
    while not Eof do
    begin
      tmpRel := IB_Connection.mkVARIdent( F_RELATIONNAME.AsString );
      tmpFld := IB_Connection.mkVARIdent( F_FIELDNAME.AsString    );
      if RelationName <> '' then
        tmpLnk := tmpFld
      else
        tmpLnk := tmpRel + '.' + tmpFld;
      if AIncludeValues then
      begin
        if not F_DEFAULTSOURCE.IsNull then
          tmpVal := Trim( F_DEFAULTSOURCE.AsString )
        else
          tmpVal := Trim( D_DEFAULTSOURCE.AsString );
        tmpVal := Trim( TrimLeftPrevOrdChar( tmpVal, Char( Ord(' ') + 1 )));
        tmpVal := TrimLeftPrevOrdChar( tmpVal, Char( Ord(' ') + 1 ));
        if iboUpperCase( iboCopy( tmpVal, 1, 7 )) = 'DEFAULT' then
          tmpVal := Trim( iboCopy( tmpVal, 8, maxint ))
        else
          tmpVal := '';
        if tmpVal <> '' then
        begin
          tmpStr := '';
          SetListLinkParamValue( tmpStr, 'DV', tmpVal );
          SetListLinkParamValue( tmpStr, 'FT', D_FIELDTYPE.AsString );
          DefaultedCols.Add( tmpLnk + '=' + tmpStr );
        end;
      end
      else
        DefaultedCols.Add( tmpLnk );
      Next;
    end;
  finally
    Free;
  end;
end;

function GetDefaultCharSet(     Cn: TIB_Connection;
                                Tr: TIB_Transaction ): string;
var
  POut_DA: PXSQLDA;
  nullind: smallint;
  tmpName: pointer;
  tmpLen: integer;
  tmpBytes: RawByteString;
  tmpTran: TIB_Transaction;
begin
  Result := '';
  if Assigned( cn ) and Cn.Connected then
  begin
    if not Assigned( Tr ) then
      Tr := Cn.SchemaCache.Transaction;
    with TIB_DSQL.Create( cn ) do
      try
        RetrieveDomainNames := false;
        IB_Connection := Cn;
        IB_Transaction := Tr;
        CheckTransaction( true, tmReadRecord );
        GetMem( POut_DA, XSQLDA_LENGTH( 1 ));
        tmpName := AllocMem( 1024 );
        try
          with POut_DA^ do
          begin
            version := SQLDA_VERSION1;
            sqln := 1;
            sqld := 1;
            with sqlvar[ 0 ] do
            begin
              sqltype  := SQL_VARYING;
              sqllen   := 1024 - SizeOf( smallint );
              sqldata  := tmpName;
              sqlscale := 0;
              sqlind   := @nullind;
              relname          := '';
              relname_length   := 0;
              sqlname          := '';
              sqlname_length   := 0;
              aliasname        := 'CHARSET';
              aliasname_length := 7;
              ownname          := '';
              ownname_length   := 0;
            end;
          end;
          tmpTran := CheckTransaction( false, tmUnknownRead );
          tmpBytes := 'SELECT D.RDB$CHARACTER_SET_NAME ' +
                      'FROM RDB$DATABASE D';
          with IB_Session do
          begin
            errcode := isc_dsql_exec_immed2( @status,
                                             PdbHandle,
                                             tmpTran.PtrHandle,
                                             null_terminated,
                                             PByte(@tmpBytes[1]),
                                             SQLDialect,
                                             nil,
                                             POut_DA );
            if errcode <> 0 then
              HandleException( Cn );
          end;
          with SQL_VARCHAR( tmpName^ ) do
          begin
            tmpLen := vary_len_low + vary_len_high * 256;
            SetLength( tmpBytes, tmpLen );
            Move( vary_string, tmpBytes[1], tmpLen );
          end;
          Result := Trim( iboDecodeA( tmpBytes ) {Don't put CharSet here.} );
        finally
          FreeMem( tmpName );
          FreeMem( POut_DA );
          if Assigned( Tr ) then
            Tr.CheckOat;
        end;
      finally
        Free;
      end;
  end;
end;

{
function GetDefaultCharSet(     Cn: TIB_Connection;
                                Tr: TIB_Transaction ): string;
var
  POut_DA: PXSQLDA;
  nullind: smallint;
  tmpName: array[1..255] of byte;
  tmpLen: integer;
  tmpBytes: RawByteString;
  tmpDSQL: TIB_DSQL;
begin
  Result := '';
  if Assigned( cn ) and Cn.Connected then
  begin
    if not Assigned( Tr ) then
      Tr := Cn.SchemaCache.Transaction;
    tmpDSQL := TIB_DSQL.Create( cn );
    try
      tmpDSQL.RetrieveDomainNames := false;
      tmpDSQL.IB_Connection := Cn;
      tmpDSQL.IB_Transaction := Tr;
      tmpDSQL.CheckTransaction( true, tmReadRecord );
      GetMem( POut_DA, XSQLDA_LENGTH( 1 ));
      try
        with POut_DA^ do
        begin
          version := SQLDA_VERSION1;
          sqln := 1;
          sqld := 1;
          with sqlvar[ 0 ] do
          begin
            sqltype  := SQL_VARYING;
            sqllen   := SizeOf( tmpName ) - SizeOf( smallint );
            sqldata  := @tmpName;
            sqlscale := 0;
            sqlind   := @nullind;
            relname_length   := 0;
            sqlname_length   := 0;
            aliasname_length := 0;
            ownname_length   := 0;
          end;
        end;
        tmpDSQL.ExecImmed2( 'SELECT D.RDB$CHARACTER_SET_NAME ' +
                            'FROM RDB$DATABASE D', nil, POut_DA );
        with SQL_VARCHAR( pointer( @tmpName )^ ) do
        begin
          tmpLen := vary_len_low + vary_len_high * 256;
          SetLength( tmpBytes, tmpLen );
          Move( vary_string, tmpBytes[1], tmpLen );
        end;
        Result := Trim( iboDecodeA( tmpBytes ); //Don't put CharSet in here.
      finally
        FreeMem( POut_DA );
        if Assigned( Tr ) then
          Tr.CheckOat;
      end;
    finally
      tmpDSQL.Free;
    end;
  end;
end;
}

function GetGeneratorValue(     Cn: TIB_Connection;
                                Tr: TIB_Transaction;
                                GeneratorName: string;
                                Increment: longint;
                            var GeneratorValue: ISC_INT64 ): boolean;
var
  POut_DA: PXSQLDA;
  GeneratorSQL: string;
  nullind: smallint;
  tmpInt: integer;
  tmpVal: ISC_INT64;
begin
  Result := false;
  GeneratorValue := -1;
  GeneratorSQL := 'SELECT GEN_ID ( ' +
                  GeneratorName + ', ' +
                  IntToStr( Increment ) + ' )'#13#10 +
                  'FROM RDB$DATABASE';
  if Assigned( cn ) then
  begin
    if not Assigned( Tr ) then
      Tr := Cn.SchemaCache.Transaction;
    with TIB_DSQL.Create( cn ) do
      try
        RetrieveDomainNames := false;
        IB_Connection := Cn;
        IB_Transaction := Tr;
        CheckTransaction( true, tmGenID );
//        if GenValueExec2 then
        begin
          GetMem( POut_DA, XSQLDA_LENGTH( 1 ));
          try
            with POut_DA^ do
            begin
              version := SQLDA_VERSION1;
              sqln := 1;
              sqld := 1;
              with sqlvar[ 0 ] do
              begin
                if Cn.SQLDialect >= SQL_DIALECT_V6 then
                begin
                  sqltype  := SQL_INT64;
                  sqllen   := SizeOf( tmpVal );
                  sqldata  := @tmpVal;
                end
                else
                begin
                  sqltype  := SQL_LONG;
                  sqllen   := SizeOf( tmpInt );
                  sqldata  := @tmpInt;
                end;
                sqlscale         := 0;
                sqlind           := @nullind;
                relname          := '';
                relname_length   := 0;
                sqlname          := '';
                sqlname_length   := 0;
                aliasname        := 'GEN_ID';
                aliasname_length := 6;
                ownname          := '';
                ownname_length   := 0;
              end;
            end;
            ExecImmed2( GeneratorSQL, nil, POut_DA );
          finally
            FreeMem( POut_DA );
            if Assigned( Tr ) then
              Tr.CheckOat;
          end;
{
        end
        else
        begin
          SQL.Text := GeneratorSQL;
          ExecSQL;
          if Cn.SQLDialect >= SQL_DIALECT_V6 then
            tmpVal := Fields[0].AsInt64
          else
            tmpInt := Fields[0].AsInteger;
}
        end;
      finally
        Free;
      end;
    Result := true;
  end;
  if Cn.SQLDialect >= SQL_DIALECT_V6 then
    GeneratorValue := tmpVal
  else
    GeneratorValue := tmpInt;
end;

function GetOldParameterOrder( Cn: TIB_Connection ): boolean;
var
  tmpSQL: RawByteString;
  PIn_DA: PXSQLDA;
  POut_DA: PXSQLDA;
  stHandle: isc_stmt_handle;
  Tr: TIB_Transaction;
begin
  Result := true;
  if Assigned( Cn ) then
  begin
    if ( not Cn.Connected ) or
       ( Cn.Characteristics.dbODS_Version < 10 ) {or
       ( iboPos( '1.5', Cn.Characteristics.dbVersion ) = 0 )} then
    else
    begin
      Tr := Cn.SchemaCache.Transaction;
      if Tr = nil then
        Tr := Cn.DefaultTransaction;
      if Tr = nil then
        Exit;
      Tr.Started := true;

      tmpSQL := '/* OldParameterOrder test query */' +
          #13#10'SELECT R.RDB$RELATION_NAME,' +
          #13#10' (SELECT F.RDB$FIELD_NAME' +
          #13#10'  FROM RDB$RELATION_FIELDS F' +
          #13#10'  WHERE F.RDB$RELATION_NAME = R.RDB$RELATION_NAME' +
          #13#10'    AND F.RDB$FIELD_POSITION = ? ) AS TESTFIELD' +
          #13#10'FROM RDB$RELATIONS R' +
          #13#10'WHERE R.RDB$RELATION_NAME = ? ';

      PIn_DA  := AllocMem( XSQLDA_LENGTH( 2 ));
      POut_DA := AllocMem( XSQLDA_LENGTH( 2 ));
      try
        with PIn_DA^ do
        begin
          version := SQLDA_VERSION1;
          sqln := 2;
          sqld := 3;
        end;
        with POut_DA^ do
        begin
          version := SQLDA_VERSION1;
          sqln := 2;
          sqld := 2;
        end;
        stHandle := nil;
        Cn.AllocateStmtHandle( @stHandle );
        try
          Cn.IB_Session.errcode := isc_dsql_prepare( @cn.IB_Session.status,
                                                     tr.PtrHandle,
                                                     @stHandle,
                                                     null_terminated,
                                                     PByte( tmpSQL ),
                                                     Cn.SQLDialect,
                                                     POut_DA );
          if Cn.IB_Session.errcode <> 0 then
            Cn.IB_Session.HandleException( Cn );
          Cn.IB_Session.errcode := isc_dsql_describe_bind( @cn.IB_Session.status,
                                                           @stHandle,
                                                           Cn.SQLDialect,
                                                           PIn_DA );
          if Cn.IB_Session.errcode <> 0 then
            Cn.IB_Session.HandleException( Cn );
          case PIN_DA.sqlvar[0].sqltype of
            SQL_TEXT, SQL_TEXT_: Result := true;
            else Result := false;
          end;
        finally
          Cn.DeallocateStmtHandle( @stHandle );
        end;
      finally
        FreeMem( PIn_DA );
        FreeMem( POut_DA );
      end;
    end;
  end;
end;

procedure SchemaIndexDefinitions( Cn: TIB_Connection;
                                  Tr: TIB_Transaction;
                                  SystemTables: boolean;
                                  Definitions: TStrings );
var
  crIndexDefs: TIB_SchemaCursor;
  crIndexSegs: TIB_SchemaCursor;
  INDEX_NAME: TIB_Column;
  UNIQUE_FLAG: TIB_Column;
  INDEX_TYPE: TIB_Column;
  FIELD_NAME: TIB_Column;
  REL_NAME: TIB_Column;
  CNST_NAME: TIB_Column;
  CNST_TYPE: TIB_Column;  
  FGN_KEY: TIB_Column;
  UR: TIB_Column;
  DR: TIB_Column;
  tmpStr: string;
  s: string;
begin
  Definitions.Clear;
  crIndexDefs := TIB_SchemaCursor.Create( cn.IB_Session );
  crIndexSegs := TIB_SchemaCursor.Create( cn.IB_Session );
  Definitions.BeginUpdate;
  try
{
CREATE TABLE RDB$REF_CONSTRAINTS (
  RDB$CONSTRAINT_NAME    CHAR( 31 )
, RDB$CONST_NAME_UQ      CHAR( 31 )
, RDB$MATCH_OPTION       CHAR( 7 )
, RDB$UPDATE_RULE        CHAR( 11 )
, RDB$DELETE_RULE        CHAR( 11 )
)
}
    with crIndexSegs do
    begin
      IB_Connection := cn;
      IB_Transaction := tr;
      SQL.Add( 'SELECT RDB$FIELD_NAME' );
      SQL.Add( 'FROM RDB$INDEX_SEGMENTS' );
      SQL.Add( 'WHERE RDB$INDEX_NAME = ?Name' );
      SQL.Add( 'ORDER BY RDB$FIELD_POSITION' );
      Prepare;
      FIELD_NAME := FieldByName( 'RDB$FIELD_NAME' );
    end;
    with crIndexDefs do
    begin
      IB_Connection := cn;
      IB_Transaction := tr;
      SQL.Add( 'SELECT I.RDB$RELATION_NAME' );
      SQL.Add( '     , I.RDB$INDEX_NAME' );
      SQL.Add( '     , I.RDB$UNIQUE_FLAG' );
      SQL.Add( '     , I.RDB$INDEX_TYPE' );
      SQL.Add( '     , I.RDB$FOREIGN_KEY' );
      SQL.Add( '     , ( SELECT C.RDB$CONSTRAINT_NAME' );
      SQL.Add( '         FROM RDB$RELATION_CONSTRAINTS C' );
      SQL.Add( '         WHERE C.RDB$INDEX_NAME = I.RDB$INDEX_NAME ) AS RDB$CONSTRAINT_NAME' );
      SQL.Add( '     , ( SELECT R.RDB$UPDATE_RULE' );
      SQL.Add( '         FROM RDB$REF_CONSTRAINTS R' );
      SQL.Add( '         WHERE R.RDB$CONSTRAINT_NAME = ' );
      SQL.Add( '         ( SELECT C.RDB$CONSTRAINT_NAME' );
      SQL.Add( '           FROM RDB$RELATION_CONSTRAINTS C' );
      SQL.Add( '           WHERE C.RDB$INDEX_NAME = I.RDB$INDEX_NAME )) AS RDB$UPDATE_RULE' );
      SQL.Add( '     , ( SELECT R.RDB$DELETE_RULE' );
      SQL.Add( '         FROM RDB$REF_CONSTRAINTS R' );
      SQL.Add( '         WHERE R.RDB$CONSTRAINT_NAME = ' );
      SQL.Add( '         ( SELECT C.RDB$CONSTRAINT_NAME' );
      SQL.Add( '           FROM RDB$RELATION_CONSTRAINTS C' );
      SQL.Add( '           WHERE C.RDB$INDEX_NAME = I.RDB$INDEX_NAME )) AS RDB$DELETE_RULE' );
      if cn.Characteristics.dbODS_Version >= 10 then
      begin
      SQL.Add( '     , ( SELECT C.RDB$CONSTRAINT_TYPE');
      SQL.Add( '         FROM RDB$RELATION_CONSTRAINTS C');
      SQL.Add( '         WHERE C.RDB$INDEX_NAME = I.RDB$INDEX_NAME ) AS RDB$CONSTRAINT_TYPE' );
      end;
      SQL.Add( 'FROM RDB$INDICES I' );
      if not SystemTables then
      begin
{ TODO : Use proper handling for detecting system settings. }
      SQL.Add( 'WHERE NOT I.RDB$RELATION_NAME STARTING WITH ''RDB$''' );
      end;
      Prepare;
      REL_NAME := FieldByName( 'RDB$RELATION_NAME' );
      INDEX_NAME := FieldByName( 'RDB$INDEX_NAME' );
      UNIQUE_FLAG := FieldByName( 'RDB$UNIQUE_FLAG' );
      INDEX_TYPE := FieldByName( 'RDB$INDEX_TYPE' );
      CNST_NAME := FieldByName( 'RDB$CONSTRAINT_NAME' );
      FGN_KEY := FieldByName( 'RDB$FOREIGN_KEY' );
      UR := FieldByName( 'RDB$UPDATE_RULE' );
      DR := FieldByName( 'RDB$DELETE_RULE' );
      CNST_TYPE := nil;
      if cn.Characteristics.dbODS_Version >= 10 then
        CNST_TYPE := FieldByName( 'RDB$CONSTRAINT_TYPE' );
      First;
      while not EOF do
      begin
        tmpStr := IB_Connection.mkVARIdent( INDEX_NAME.AsString ) + '=';
        if ( Assigned( CNST_TYPE )) and
           ( CNST_TYPE.AsString = 'PRIMARY KEY' ) then
          tmpStr := tmpStr + 'PK;'
        else
        if Pos ( 'RDB$PRIMARY', tmpStr ) = 1 then
          tmpStr := tmpStr + 'PK;'
        else
        if UNIQUE_FLAG.AsInteger = 1 then
          tmpStr := tmpStr + 'UN;';
        if INDEX_TYPE.AsInteger = 1  then
          tmpStr := tmpStr + 'DESC;';
        tmpStr := tmpStr + 'REL=' +
            SetCharValues( IB_Connection.mkVARIdent( REL_NAME.AsString )) + ';';
        if CNST_NAME.AsString <> EmptyStr then
          tmpStr := tmpStr + 'CNST=' +
           SetCharValues( IB_Connection.mkVARIdent( CNST_NAME.AsString )) + ';';
        if FGN_KEY.AsString <> EmptyStr then
        begin
          tmpStr := tmpStr + 'FK=' +
             SetCharValues( IB_Connection.mkVARIdent( FGN_KEY.AsString )) + ';';
          if ( UR.AsString <> '' ) and
             ( UR.AsString <> 'RESTRICT' ) then
            tmpStr := tmpStr + 'UR=' +
                  SetCharValues( IB_Connection.mkVARIdent( UR.AsString )) + ';';
          if ( DR.AsString <> EmptyStr ) and
             ( DR.AsString <> 'RESTRICT' ) then
            tmpStr := tmpStr + 'DR=' +
                  SetCharValues( IB_Connection.mkVARIdent( DR.AsString )) + ';';
        end;
        crIndexSegs.Params[0].AsString := INDEX_NAME.AsString;
        crIndexSegs.First;
        while not crIndexSegs.EOF do
        begin
          s := SetCharValues( IB_Connection.mkVARIdent( FIELD_NAME.AsString ));
          if crIndexSegs.RowNum = 1 then tmpStr := tmpStr + 'SEGS=' + s
                                    else tmpStr := tmpStr + ','     + s;
          crIndexSegs.Next;
        end;
        crIndexSegs.Close;
        Definitions.Add( tmpStr );
        Next;
      end;
      Close;
    end;
  finally
    Definitions.EndUpdate;
    crIndexDefs.Free;
    crIndexSegs.Free;
  end;
end;

procedure SchemaForeignKeyLinks( Cn: TIB_Connection;
                                 Tr: TIB_Transaction;
                                 RelationName: string;
                                 ForeignKeyLinks: TStrings );
var
  tmpStr: string;
  oldRel: string;
  oldCol: string;
  FForgnKeys: TIB_StringList;
  procedure mkFK;
  var
    tmpIdx: integer;
    tmpSL: TIB_StringList;
    ii: integer;
  begin
    if tmpStr <> '' then
    begin
      tmpSL := TIB_StringList.Create;
      try
        ExtractFieldsIntoList( oldCol, tmpSL );
        for ii := 0 to tmpSL.Count - 1 do
        begin
          tmpIdx := FForgnKeys.Add(
                      RelationName + '.' + tmpSL[ii] + '=' +
                                                'REL=' + oldRel );
          FForgnKeys.IndexParamValue[tmpIdx,'LINKS'] := tmpStr;
        end;
        tmpStr := '';
        oldCol := '';
      finally
        tmpSL.Free;
      end;
    end;
  end;
var
  tmpRel: string;
  tmpCol: string;
  crFKInf: TIB_SchemaCursor;
const
  i2_relation_name = 0;
  s1_field_name    = 1;
  s2_field_name    = 2;
  field_position   = 3;
begin
  if not Assigned( ForeignKeyLinks ) then Exit;
  tmpStr := '';
  ForeignKeyLinks.Clear;
  crFKInf := TIB_SchemaCursor.Create( cn.IB_Session );
  FForgnKeys := TIB_StringList.Create;
  try
    with crFKInf do
    begin
      IB_Connection := Cn;
      IB_Transaction := Tr;
      SQL.Add( 'select i2.rdb$relation_name' );
      SQL.Add( '     , s1.rdb$field_name' );
      SQL.Add( '     , s2.rdb$field_name' );
      SQL.Add( '     , s1.rdb$field_position' );
      SQL.Add( 'from rdb$relation_constraints rc1' );
      SQL.Add( 'join rdb$ref_constraints c' );
      SQL.Add( '   on c.rdb$constraint_name = rc1.rdb$constraint_name' );
      SQL.Add( 'join rdb$relation_constraints rc2' );
      SQL.Add( '   on rc2.rdb$constraint_name=c.rdb$const_name_uq' );
      SQL.Add( 'join rdb$indices i1' );
      SQL.Add( '   on i1.rdb$index_name = rc1.rdb$index_name' );
      SQL.Add( 'join rdb$index_segments s1' );
      SQL.Add( '   on s1.rdb$index_name = i1.rdb$index_name' );
      SQL.Add( 'join rdb$indices i2' );
      SQL.Add( '   on i2.rdb$index_name = rc2.rdb$index_name' );
      SQL.Add( 'join rdb$index_segments s2' );
      SQL.Add( '   on s2.rdb$index_name = i2.rdb$index_name' );
      SQL.Add( 'where rc1.rdb$constraint_type = ''FOREIGN KEY''' );
      SQL.Add( '  and s1.rdb$field_position = s2.rdb$field_position' );
      SQL.Add( '  and rc1.rdb$relation_name = :REL' );
      SQL.Add( 'order by rc1.rdb$constraint_name' );
      SQL.Add( '        , s1.rdb$field_position' );
      Prepare;
      ParamByName( 'REL' ).AsString := stLitCriteria( RelationName );
      First;
      while not Eof do
      begin
        tmpCol := Cn.mkIdent( Fields[s1_field_name].AsString );
        if Fields[field_position].AsInteger = 0 then
        begin
          tmpRel := Cn.mkIdent( Fields[i2_relation_name].AsString );
          mkFK;
          oldCol := '';
        end
        else
        begin
          tmpStr := tmpStr + ',';
          oldCol := oldCol + ',';
        end;
        tmpStr := tmpStr + Cn.mkIdent( Fields[s1_field_name].AsString )+ '=' +
                           Cn.mkIdent( Fields[s2_field_name].AsString );
        oldRel := tmpRel;
        oldCol := oldCol + tmpCol;
        Next;
      end;
      mkFK;
    end;
    ForeignKeyLinks.AddStrings( FForgnKeys );
  finally
    FForgnKeys.Free;
    crFKInf.Free;
  end;
end;

end.
