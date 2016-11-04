{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{   MODULE:       ibase.h                                                      }
{   DESCRIPTION:  OSRI entrypoints and defines                                 }
{                                                                              }
{      Portions copyright (c) 1996 by Borland International                    }
{                                                                              }

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
{  Jason Wharton (khabibr@mail.ru)                                             }
{  10-Mar-2009                                                                 }
{     Many changes having to do with migrating to Delphi 2009.                 }
{                                                                              }
{  Ramil Khabibullin (khabibr@mail.ru)                                         }
{  21-Sep-2006                                                                 }
{     Added isc_info_sql_relation_alias allow to detect Relation Aliases.      }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  27-Apr-2003                                                                 }
{     Added isc_info_firebird_version db info item to allow detect of FB.      }
{                                                                              }
{  Jason Wharton <jwharton@ibobjects.com>                                      }
{  24-Oct-2002                                                                 }
{     Added support for IB7 new features.                                      }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  07-Nov-2001                                                                 }
{     Added isc_portable_integer function.  Its like isc_vax_integer but       }
{     also supports int64 types.  Only available in IB6 and Firebird.          }
{                                                                              }
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}
{$WARNINGS OFF}

unit
  IB_Header;

interface

uses
{$IFNDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, DelphiCompatibilityNonVisual,
{$ENDIF}
  SysUtils, Classes;

const
  IB_Null = -1;
  IB_NotNull = 0;
  null_terminated = 0;
  mindouble: double = -5.0E324;
  maxdouble: double = 1.7E308;
  mindate: TDateTime = -MaxWord * 2; // Just a temp hack.
  maxdate: TDateTime = MaxWord * 2; // Just a temp hack.

  METADATALENGTH = 32;
  METADATALENGTH_V2 = 68;
  ISC_TRUE = 1;
  ISC_FALSE = 0;

type
  TIB_Identifier = array [0..METADATALENGTH - 1] of ansichar;
  TIB_Identifier_V2 = array [0..METADATALENGTH_V2 - 1] of ansichar;

  PISC_STATUS = ^ISC_STATUS;
  ISC_STATUS = longint;
  PISC_LONG = ^ISC_LONG;
  ISC_LONG = longint;

  status_vector = array[0..19] of ISC_STATUS;
  pstatus_vector = ^status_vector;
  ppstatus_vector = ^pstatus_vector;

{$IFNDEF FPC}
{$IFNDEF IBO_CPPB}
{$IFNDEF IBO_VCL2006_OR_GREATER}
  short = smallint;
{$ENDIF}
{$ENDIF}
{$ENDIF}
  pshort = ^short;

{$IFNDEF IBO_VCL2009_OR_GREATER}
  RawByteString = AnsiString;
  PRawByteString = ^RawByteString;
{$ENDIF}

  PSQL_VARCHAR = ^SQL_VARCHAR;
  SQL_VARCHAR = packed record
    vary_len_low: byte;
    vary_len_high: byte;
    vary_string: array [0..0] of ansichar;
  end;

  PISC_QUAD = ^ISC_Quad;
  ISC_QUAD = record
    isc_quad_high: integer;  // IB Date
    isc_quad_low:  cardinal; // IB Time
  end ;

  tm = record
    tm_sec:   integer; // Seconds
    tm_min:   integer; // Minutes
    tm_hour:  integer; // Hour (0--23)
    tm_mday:  integer; // Day of month (1--31)
    tm_mon:   integer; // Month (0--11)
    tm_year:  integer; // Year (calendar year minus 1900)
    tm_wday:  integer; // Weekday (0--6) Sunday = 0)
    tm_yday:  integer; // Day of year (0--365)
    tm_isdst: integer; // 0 if daylight savings time is not in effect)
  end;
  ptm = ^tm;

const
  DSQL_close = 1;
  DSQL_drop  = 2;
  DSQL_cancel = 4;

//*******************************************************************/
//* 64 bit Integers                                                 */
//*******************************************************************/

type
  PISC_INT64 = ^ISC_INT64;
  ISC_INT64 = int64;

  PISC_UINT64 = ^ISC_UINT64;
  ISC_UINT64 = record
    LowPart: DWORD;
    HighPart: DWORD;
  end;

//*******************************************************************/
//* Time & Date Support                                             */
//*******************************************************************/

type
  ISC_DATE = longint;
  PISC_DATE = ^ISC_DATE;
  ISC_TIME = DWORD;
  PISC_TIME = ^ISC_TIME;
  ISC_TIMESTAMP = record
    timestamp_date: ISC_DATE;
    timestamp_time: ISC_TIME;
  end;
  PISC_TIMESTAMP = ^ISC_TIMESTAMP;

const
  _ISC_TIMESTAMP_ = 1;
  ISC_TIME_SECONDS_PRECISION = 10000;
  ISC_TIME_SECONDS_PRECISION_SCALE = -4;

//*******************************************************************/
//* Blob id structure                                               */
//*******************************************************************/

type
  PGDS_QUAD = ^GDS_QUAD;
  GDS_QUAD = record
    gds_quad_high: ISC_LONG;
    gds_quad_low:  cardinal;
  end;

  PISC_ARRAY_BOUND = ^ISC_ARRAY_BOUND;
  ISC_ARRAY_BOUND = record
    array_bound_lower: short;
    array_bound_upper: short;
  end;

  PISC_ARRAY_DESC = ^ISC_ARRAY_DESC;
  ISC_ARRAY_DESC = record
    array_desc_dtype:         byte;
    array_desc_scale:         byte;
    array_desc_length:        word;
    array_desc_field_name:    TIB_Identifier;
    array_desc_relation_name: TIB_Identifier;
    array_desc_dimensions:    short;
    array_desc_flags:         short;
    array_desc_bounds: array [0..15] of ISC_ARRAY_BOUND;
  end;
  TISC_ARRAY_DESC = ISC_ARRAY_DESC;

{ IB7 Support }  
  PISC_ARRAY_DESC_V2 = ^ISC_ARRAY_DESC_V2;
  ISC_ARRAY_DESC_V2 = record
    array_desc_dtype:         byte;
    array_desc_scale:         byte;
    array_desc_length:        word;
    array_desc_field_name:    TIB_Identifier_V2;
    array_desc_relation_name: TIB_Identifier_V2;
    array_desc_dimensions:    short;
    array_desc_flags:         short;
    array_desc_bounds: array [0..15] of ISC_ARRAY_BOUND;
  end;
  TISC_ARRAY_DESC_V2 = ISC_ARRAY_DESC_V2;

  PISC_BLOB_DESC = ^ISC_BLOB_DESC;
  ISC_BLOB_DESC = record
    blob_desc_subtype:       short;
    blob_desc_charset:       short;
    blob_desc_segment_size:  short;
    blob_desc_field_name:    TIB_Identifier;
    blob_desc_relation_name: TIB_Identifier;
  end;
  TISC_BLOB_DESC = ISC_BLOB_DESC;

{ IB7 Support }  
  PISC_BLOB_DESC_V2 = ^ISC_BLOB_DESC_V2;
  ISC_BLOB_DESC_V2 = record
    blob_desc_subtype:       short;
    blob_desc_charset:       short;
    blob_desc_segment_size:  short;
    blob_desc_field_name:    TIB_Identifier_V2;
    blob_desc_relation_name: TIB_Identifier_V2;
  end;
  TISC_BLOB_DESC_V2 = ISC_BLOB_DESC_V2;

//***************************/
//* Blob control structure  */
//***************************/

  pisc_blob_ctl = ^isc_blob_ctl;
  isc_blob_ctl = record
    ctl_source_filter: function( ctl_source_handle: pisc_blob_ctl ): ISC_STATUS;
    ctl_source_handle:   pisc_blob_ctl; // Argument to pass to source filter
    ctl_to_sub_type:     short;         // Target type
    ctl_from_sub_type:   short;         // Source type
    ctl_buffer_length:   short;         // Length of buffer
    ctl_segment_length:  short;         // Length of current segment
    ctl_bpb_length:      short;         // Length of blob parameter block
    ctl_bpb:             pbyte;         // Address of blob parameter block
    ctl_buffer:          pbyte;         // Address of segment buffer
    ctl_max_segment:     ISC_LONG;      // Length of longest segment
    ctl_number_segments: ISC_LONG;      // Total number of segments
    ctl_total_length:    ISC_LONG;      // Total length of blob
    ctl_status:          pISC_STATUS;   // Address of status vector
    ctl_data: array [0..7] of longint;  // Application specific data
  end;

//***************************/
//* Dynamic SQL definitions */
//***************************/

//******************************/
//* Declare the extended XSQLDA */
//******************************/

  PPXSQLVAR = ^PXSQLVAR;
  PXSQLVAR = ^XSQLVAR;
  XSQLVAR = record
    sqltype:          smallint;
    sqlscale:         smallint;
    sqlsubtype:       smallint;
    sqllen:           smallint;
    sqldata:          Pointer;
    sqlind:           psmallint;
    sqlname_length:   smallint;
    sqlname:          TIB_Identifier;
    relname_length:   smallint;
    relname:          TIB_Identifier;
    ownname_length:   smallint;
    ownname:          TIB_Identifier;
    aliasname_length: smallint;
    aliasname:        TIB_Identifier;
  end;

{ IB7 Support }
  PXSQLVAR_V2 = ^XSQLVAR_V2;
  XSQLVAR_V2 = record
    sqltype:          smallint;
    sqlscale:         smallint;
    sqlsubtype:       smallint;
    sqllen:           smallint;
    sqldata:          Pointer;
    sqlind:           psmallint;
    sqlname_length:   smallint;
    sqlname:          TIB_Identifier_V2;
    relname_length:   smallint;
    relname:          TIB_Identifier_V2;
    ownname_length:   smallint;
    ownname:          TIB_Identifier_V2;
    aliasname_length: smallint;
    aliasname:        TIB_Identifier_V2;
  end;

  PXSQLDA = ^XSQLDA;
  XSQLDA = record
    version: smallint;
    sqldaid: array[0..7] of ansichar;
    sqldabc: ISC_LONG;
    sqln: smallint;
    sqld: smallint;
    sqlvar: array[0..0] of XSQLVAR;
    sqlvar_V2: array[0..0] of XSQLVAR_V2;
  end;

const
  SQLDA_VERSION1 = 1; // pre V6.0 SQLDA
  SQLDA_VERSION2 = 2; //     V6.0 SQLDA

  SQL_DIALECT_V5 = 1; // meaning is same as DIALECT_xsqlda
  SQL_DIALECT_V6_TRANSITION = 2; // flagging anything that is delimited
                                 // by double quotes as an error and
                                 // flagging keyword DATE as an error
  SQL_DIALECT_V6 = 3; // supports SQL delimited identifier,
                      // SQLDATE/DATE, TIME, TIMESTAMP,
                      // CURRENT_DATE, CURRENT_TIME,
                      // CURRENT_TIMESTAMP, and 64-bit exact
                      // numeric type

  SQL_DIALECT_CURRENT = SQL_DIALECT_V6; // latest IB DIALECT

//********************************/
//* InterBase Handle Definitions */
//********************************/

type
  isc_att_handle  = pointer;
  isc_blob_handle = pointer;
  isc_db_handle   = pointer;
  isc_form_handle = pointer;
  isc_req_handle  = pointer;
  isc_stmt_handle = pointer;
  isc_svc_handle  = pointer;
  isc_tr_handle   = pointer;
  isc_win_handle  = pointer;
  isc_resv_handle = longint;

// For some reason the self referential nature of having the callback declared
// of type pisc_callback caused a stack overflow in the link phase of
// C++ Builder.

//  pisc_callback = ^ isc_callback;
  isc_callback = procedure( callback: pointer; //pisc_callback;
                            length:   short;
                            updated:  pbyte ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  pisc_att_handle  = ^isc_att_handle;
  pisc_blob_handle = ^isc_blob_handle;
  pisc_db_handle   = ^isc_db_handle;
  pisc_form_handle = ^isc_form_handle;
  pisc_req_handle  = ^isc_req_handle;
  pisc_stmt_handle = ^isc_stmt_handle;
  pisc_svc_handle  = ^isc_svc_handle;
  pisc_tr_handle   = ^isc_tr_handle;
  pisc_win_handle  = ^isc_win_handle;

{ Transaction parameter block }
  isc_teb = record
    db_ptr:  pisc_db_handle;
    tpb_len: longint;
    tpb_ptr: pansichar;
  end;
  pisc_teb = ^isc_teb;

//***************************/
//* OSRI database functions */
//***************************/

  Tisc_attach_database = function( status:          pstatus_vector;
                                   db_name_len:     short;
                                   db_name:         pbyte;
                                   db_handle:       pisc_db_handle;
                                   parm_buffer_len: short;
                                   parm_buffer:     pbyte
                                   ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_gen_sdl = function( status:          pstatus_vector;
                                 array_desc:      pISC_ARRAY_DESC;
                                 array_1:         pshort;
                                 array_buf:       pbyte;
                                 array_2:         pshort
                                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_get_slice = function( status:     pstatus_vector;
                                   db_handle:  pisc_db_handle;
                                   tr_handle:  pisc_tr_handle;
                                   ARRAY_ID:   PISC_QUAD;
                                   ARRAY_DESC: PISC_ARRAY_DESC;
                                   DestBuf:    pointer;
                                   DestLen:    PISC_LONG
                                   ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_get_slice_V2 = function( status:     pstatus_vector;
                                      db_handle:  pisc_db_handle;
                                      tr_handle:  pisc_tr_handle;
                                      ARRAY_ID:   PISC_QUAD;
                                      ARRAY_DESC: PISC_ARRAY_DESC_V2;
                                      DestBuf:    pointer;
                                      DestLen:    PISC_LONG
                                      ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_lookup_bounds = function( status:     pstatus_vector;
                                       db_handle:  pisc_db_handle;
                                       tr_handle:  pisc_tr_handle;
                                       tbl_name:   pbyte;
                                       col_name:   pbyte;
                                       e:          PISC_ARRAY_DESC
                                       ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_lookup_bounds_V2 = function( status:     pstatus_vector;
                                          db_handle:  pisc_db_handle;
                                          tr_handle:  pisc_tr_handle;
                                          tbl_name:   pbyte;
                                          col_name:   pbyte;
                                          e:          PISC_ARRAY_DESC_V2
                                          ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_lookup_desc = function( status:     pstatus_vector;
                                     db_handle:  pisc_db_handle;
                                     tr_handle:  pisc_tr_handle;
                                     tbl_name:   pbyte;
                                     col_name:   pbyte;
                                     e:          PISC_ARRAY_DESC
                                     ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_lookup_desc_V2 = function( status:     pstatus_vector;
                                        db_handle:  pisc_db_handle;
                                        tr_handle:  pisc_tr_handle;
                                        tbl_name:   pbyte;
                                        col_name:   pbyte;
                                        e:          PISC_ARRAY_DESC_V2
                                        ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_put_slice = function( status:     pstatus_vector;
                                   db_handle:  pisc_db_handle;
                                   tr_handle:  pisc_tr_handle;
                                   ARRAY_ID:   PISC_QUAD;
                                   ARRAY_DESC: PISC_ARRAY_DESC;
                                   SrcBuf:     pointer;
                                   SrcLen:     PISC_LONG
                                   ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_put_slice_V2 = function( status:     pstatus_vector;
                                      db_handle:  pisc_db_handle;
                                      tr_handle:  pisc_tr_handle;
                                      ARRAY_ID:   PISC_QUAD;
                                      ARRAY_DESC: PISC_ARRAY_DESC_V2;
                                      SrcBuf:     pointer;
                                      SrcLen:     PISC_LONG
                                      ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_set_desc = function( status: pstatus_vector;
                                  tbl_name:   pbyte;
                                  col_name:   pbyte;
                                  sql_dtype:  pshort;
                                  sql_len:    pshort;
                                  dimensions: pshort;
                                  f: PISC_ARRAY_DESC
                                  ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_array_set_desc_V2 = function( status:     pstatus_vector;
                                     tbl_name:   pbyte;
                                     col_name:   pbyte;
                                     sql_dtype:  pshort;
                                     sql_len:    pshort;
                                     dimensions: pshort;
                                     f:          PISC_ARRAY_DESC_V2
                                     ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_default_desc = procedure ( BLOB_DESC: PISC_BLOB_DESC;
                                       tbl_name:  pbyte;
                                       col_name:  pbyte ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_default_desc_V2 = procedure ( BLOB_DESC: PISC_BLOB_DESC_V2;
                                          tbl_name:  pbyte;
                                          col_name:  pbyte ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_gen_bpb = function( status:         pstatus_vector;
                                To_BLOB_DESC:   PISC_BLOB_DESC;
                                From_BLOB_DESC: PISC_BLOB_DESC;
                                BufLen:         word;
                                Buffer:         pbyte;
                                StoredLen:      pword
                                ):              ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_gen_bpb_V2 = function( status:         pstatus_vector;
                                   To_BLOB_DESC:   PISC_BLOB_DESC_V2;
                                   From_BLOB_DESC: PISC_BLOB_DESC_V2;
                                   BufLen:         word;
                                   Buffer:         pbyte;
                                   StoredLen:      pword
                                   ):              ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_info = function( status:       pstatus_vector;
                             BLOB_HANDLE:  pisc_blob_handle;
                             ItemBufLen:   short;
                             ItemBuffer:   pbyte;
                             ResultBufLen: short;
                             ResultBuffer: pbyte
                             ):            ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_lookup_desc = function( status:     pstatus_vector;
                                    db_handle:  pisc_db_handle;
                                    tr_handle:  pisc_tr_handle;
                                    c:          pbyte;
                                    d:          pbyte;
                                    e:          PISC_BLOB_DESC;
                                    f:          pbyte
                                    ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} ;

  Tisc_blob_lookup_desc_V2 = function( status:     pstatus_vector;
                                       db_handle:  pisc_db_handle;
                                       tr_handle:  pisc_tr_handle;
                                       c:          pbyte;
                                       d:          pbyte;
                                       e:          PISC_BLOB_DESC_V2;
                                       f:          pbyte
                                       ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} ;

  Tisc_blob_set_desc = function( status: pstatus_vector;
                                 a:      pbyte;
                                 b:      pbyte;
                                 c:      short;
                                 d:      short;
                                 e:      short;
                                 f:      PISC_BLOB_DESC
                                 ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_blob_set_desc_V2 = function( status: pstatus_vector;
                                    a:      pbyte;
                                    b:      pbyte;
                                    c:      short;
                                    d:      short;
                                    e:      short;
                                    f:      PISC_BLOB_DESC_V2
                                    ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_cancel_blob = function( status:      pstatus_vector;
                               blob_handle: pisc_blob_handle
                               ):           ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_close_blob = function( status:      pstatus_vector;
                              blob_handle: pisc_blob_handle
                              ):           ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_commit_retaining = function( status:    pstatus_vector;
                                    tr_handle: pisc_tr_handle
                                    ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_commit_transaction = function( status:    pstatus_vector;
                                      tr_handle: pisc_tr_handle
                                      ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_create_blob = function( status:      pstatus_vector;
                               db_handle:   pisc_db_handle;
                               tr_handle:   pisc_tr_handle;
                               blob_handle: pisc_blob_handle;
                               blob_id:     PISC_QUAD
                               ):           ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_create_blob2 = function( status:      pstatus_vector;
                                db_handle:   pisc_db_handle;
                                tr_handle:   pisc_tr_handle;
                                blob_handle: pisc_blob_handle;
                                blob_id:     PISC_QUAD;
                                e:           short;
                                f:           pbyte
                                ):           ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_create_database = function( status: pstatus_vector;
                                   a:      short;
                                   b:      pbyte;
                                   c:      pisc_db_handle;
                                   d:      short;
                                   e:      pbyte;
                                   f:      short
                                   ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_database_info = function( status: pstatus_vector;
                                 a:      pisc_db_handle;
                                 b:      short;
                                 c:      pbyte;
                                 d:      short;
                                 e:      pbyte
                                 ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_decode_date = procedure( ib_date: PISC_QUAD;
                                tm_date: ptm); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_decode_sql_date = procedure ( a: PISC_DATE;
                                     b: PISC_LONG ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_decode_sql_time = procedure ( a: PISC_TIME;
                                     b: PISC_LONG ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_decode_timestamp = procedure ( a: PISC_TIMESTAMP;
                                      b: PISC_LONG ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_detach_database = function( status:    pstatus_vector;
                                   db_handle: pisc_db_handle
                                   ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_drop_database = function( status:    pstatus_vector;
                                 db_handle: pisc_db_handle
                                 ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_allocate_statement = function( status:    pstatus_vector;
                                           db_handle: pisc_db_handle;
                                           st_handle: pisc_stmt_handle
                                           ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_alloc_statement2 = function( status:      pstatus_vector;
                                         a:	      pisc_db_handle;
                                         b:	      pisc_stmt_handle
                                         ):           ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_describe = function ( status_vector: pstatus_vector;
                                  st_handle:     pisc_stmt_handle;
                                  dialect:       word;
                                  params:        PXSQLDA
                                  ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//  Tisc_dsql_describe_V2 = function ( status_vector: pstatus_vector;
//                                     st_handle:     pisc_stmt_handle;
//                                     dialect:       word;
//                                     params:        PXSQLDA_V2
//                                     ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_describe_bind = function( status:        pstatus_vector;
                                      st_handle:     pisc_stmt_handle;
                                      dialect:       word;
                                      params:        PXSQLDA
                                      ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//  Tisc_dsql_describe_bind_V2 = function( status:        pstatus_vector;
//                                         st_handle:     pisc_stmt_handle;
//                                         dialect:       word;
//                                         params:        PXSQLDA_V2
//                                         ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_exec_immed2 = function( status:    pstatus_vector;
                                    db_handle: pisc_db_handle;
                                    tr_handle: pisc_tr_handle;
                                    length:    word;
                                    statement: pbyte;
                                    dialect:   word;
                                    params:    PXSQLDA;
                                    outvar:    PXSQLDA
                                    ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_exec_immed2_V2 = function( status:    pstatus_vector;
                                       db_handle: pisc_db_handle;
                                       tr_handle: pisc_tr_handle;
                                       length:    word;
                                       statement: pbyte;
                                       dialect:   word;
                                       params:    PXSQLDA_V2;
                                       outvar:    PXSQLDA_V2
                                       ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_execute = function ( status:    pstatus_vector;
                                 tr_handle: pisc_tr_handle;
                                 st_handle: pisc_stmt_handle;
                                 dialect:   word;
                                 params:    PXSQLDA
                                 ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_execute_V2 = function ( status:    pstatus_vector;
                                    tr_handle: pisc_tr_handle;
                                    st_handle: pisc_stmt_handle;
                                    dialect:   word;
                                    params:    PXSQLDA_V2
                                    ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_execute2 = function( status:    pstatus_vector;
                                 tr_handle: pisc_tr_handle;
                                 st_handle: pisc_stmt_handle;
                                 a:         word;
                                 d:         PXSQLDA;
                                 e:         PXSQLDA
                                 ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_execute2_V2 = function( status:    pstatus_vector;
                                    tr_handle: pisc_tr_handle;
                                    st_handle: pisc_stmt_handle;
                                    a:         word;
                                    d:         PXSQLDA_V2;
                                    e:         PXSQLDA_V2
                                    ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_execute_immediate = function( status:    pstatus_vector;
                                          db_handle: pisc_db_handle;
                                          tr_handle: pisc_tr_handle;
                                          length:    word;
                                          statement: pbyte;
                                          dialect:   word;
                                          params:    PXSQLDA
                                          ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_execute_immediate_V2 = function( status:    pstatus_vector;
                                             db_handle: pisc_db_handle;
                                             tr_handle: pisc_tr_handle;
                                             length:    word;
                                             statement: pbyte;
                                             dialect:   word;
                                             params:    PXSQLDA_V2
                                             ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_fetch = function ( status_vector: pstatus_vector;
                               st_handle:     pisc_stmt_handle;
                               dialect:       word;
                               fields:        PXSQLDA
                               ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_fetch_V2 = function ( status_vector: pstatus_vector;
                                  st_handle:     pisc_stmt_handle;
                                  dialect:       word;
                                  fields:        PXSQLDA_V2
                                  ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_finish = function( db_handle: pisc_db_handle
                               ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_free_statement = function ( status_vector: pstatus_vector;
                                        st_handle:     pisc_stmt_handle;
                                        option:        word
                                        ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_insert = function( status:    pstatus_vector;
                               st_handle: pisc_stmt_handle;
                               dialect:   word;
                               params:    PXSQLDA
                               ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_prepare = function ( status:    pstatus_vector;
                                 tr_handle: pisc_tr_handle;
                                 st_handle: pisc_stmt_handle;
                                 len:       word;
                                 statement: pbyte;
                                 dialect:   word;
                                 params:    PXSQLDA
                                 ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_dsql_prepare_V2 = function ( status:    pstatus_vector;
                                    tr_handle: pisc_tr_handle;
                                    st_handle: pisc_stmt_handle;
                                    len:       word;
                                    statement: pbyte;
                                    dialect:   word;
                                    params:    PXSQLDA_V2
                                    ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_dsql_set_cursor_name = function( status_vector: pstatus_vector;
                                        st_handle:     pisc_stmt_handle;
                                        cursor_name:   pbyte;
                                        unusedType:    word
                                        ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_sql_info = function( status:        pstatus_vector;
                                 st_handle:     pisc_stmt_handle;
                                 item_length:   short;
                                 items:         pbyte;
                                 buffer_length: short;
                                 result_buffer: pbyte
                                 ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_encode_date = procedure( tm_date: ptm;
                                ib_date: PISC_QUAD); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_encode_sql_date = procedure ( a: pointer;
                                     b: PISC_DATE ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_encode_sql_time = procedure ( a: pointer;
                                     b: PISC_TIME ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_encode_timestamp = procedure ( a: pointer;
                                      b: PISC_TIMESTAMP ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_wait_for_event = function( status:        pstatus_vector;
                                  db_handle:     pisc_db_handle;
                                  length:        short;
                                  event_buffer:  pbyte;
                                  result_buffer: pbyte
                                  ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_cancel_events = function( status:    pstatus_vector;
                                 db_handle: pisc_db_handle;
                                 event_id:  pISC_LONG
                                 ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

// Tisc_event_block has cdecl calling convention even for Windows dure to the variable number of parameters
  Tisc_event_block = function( event_buf:  pointer;
                               result_buf: pointer;
                               count:      short;
                               name1:      pbyte
                               ):          longint; cdecl;

{ Must use assembler for this method call.
ISC_LONG    cdecl isc_event_block (ansichar  *  *
                                   ansichar  *  *
                                   unsigned short, ...);
}
(*
  Tisc_event_counts = procedure( status:        pstatus_vector;
                                 buffer_length: short;
                                 event_buffer:  pbyte;
                                 result_buffer: pbyte ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_event_counts = function( status:        pstatus_vector;
                                buffer_length: short;
                                event_buffer:  pbyte;
                                result_buffer: pbyte
                                ):             ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_free = function( buffer: pbyte ): ISC_LONG; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
void        cdecl isc_expand_dpb (ansichar  *  *
                                  short  *
                                  ...);
int        {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_modify_dpb (ansichar  *  *
                                   short  * unsigned short,
                                   ansichar  * short );
*)

  Tisc_get_segment = function( status: pstatus_vector;
                               a:      pisc_blob_handle;
                               b:      pword;
                               c:      word;
                               d:      pbyte
                               ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_get_slice = function( status: pstatus_vector;
                             a:      pisc_db_handle;
                             b:      pisc_tr_handle;
                             c:      PISC_QUAD;
                             d:      short;
                             e:      pbyte;
                             f:      short;
                             g:      pISC_LONG;
                             h:      ISC_LONG;
                             i:      pointer;
                             j:      PISC_LONG
                             ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_interprete = function( buffer: pbyte;
                              status: ppstatus_vector
                              ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tfb_interpret = function( buffer: pbyte;
                            buflen: dword;
                            status: ppstatus_vector
                            ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_open_blob = function( status: pstatus_vector;
                             a:      pisc_db_handle;
                             b:      pisc_tr_handle;
                             c:      pisc_blob_handle;
                             d:      PISC_QUAD
                             ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_open_blob2 = function( status: pstatus_vector;
                              a:      pisc_db_handle;
                              b:      pisc_tr_handle;
                              c:      pisc_blob_handle;
                              d:      PISC_QUAD;
                              e:      short;
                              g:      pbyte
                              ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
  Tisc_prepare_transaction2 = function( status:          pstatus_vector;
                                        isc_tr_handle  *
                                        short,
                                        ansichar  *
                                        ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  void        {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_print_sqlerror (short,  ISC_STATUS  *

  Tisc_print_status = function( status: pstatus_vector;
                                ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};
*)

  Tisc_put_segment = function( status:  pstatus_vector;
                               a:       pisc_blob_handle;
                               b:       word;
                               c:       pbyte
                               ):       ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_put_slice = function( status: pstatus_vector;
                             a:      pisc_db_handle;
                             b:      pisc_tr_handle;
                             c:      PISC_QUAD;
                             d:      short;
                             e:      pbyte;
                             f:      short;
                             g:      pISC_LONG;
                             h:      ISC_LONG;
                             i:      pointer
                             ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_que_events = function( status:             pstatus_vector;
                              db_handle:          pisc_db_handle;
                              event_id:           pISC_LONG;
                              length:             short;
                              event_buffer:       pbyte;
                              event_function:     isc_callback;
                              event_function_arg: pointer
                              ):                  ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_rollback_retaining = function( status:    pstatus_vector;
                                      tr_handle: pisc_tr_handle
                                      ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_rollback_transaction = function( status:    pstatus_vector;
                                        tr_handle: pisc_tr_handle
                                        ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_start_multiple = function( status:             pstatus_vector;
                                  tr_handle:          pisc_tr_handle;
                                  db_handle_count:    short;
                                  teb_vector_address: pointer
                                  ):                  ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_sqlcode = function( status: PISC_STATUS ): ISC_LONG; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_sql_interprete = procedure( a: short;
                                   b: pbyte;
                                   c: short ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_transaction_info = function( status: pstatus_vector;
                                    a:      pisc_tr_handle;
                                    b:      short;
                                    c:      pbyte;
                                    d:      short;
                                    e:      pbyte
                                    ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_transact_request = function( status:  pstatus_vector;
                                    a:       pisc_db_handle;
                                    b:       pisc_tr_handle;
                                    c:       word;
                                    d:       pbyte;
                                    e:       word;
                                    f:       pbyte;
                                    g:       word;
                                    h:       pbyte
                                    ):       ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_vax_integer = function( a: pbyte; b: short): ISC_LONG; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  TtmpPByte = ^byte;

{$IFNDEF IBO_VCL60_OR_GREATER}
  PPAnsiChar = ^PAnsiChar;
{$ENDIF}

  Tisc_portable_integer = function ( a: TtmpPByte;
                                     b: short): ISC_INT64; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

{ InterBase 8.x Function Support }

  Tisc_dsql_batch_execute_immed =
    function ( status_vector: pstatus_vector;
               db_handle: pisc_db_handle;
               tr_handle: pisc_tr_handle;
               dialect: word;
               number_of_sql: dword;
               sql: PPAnsiChar;
               rows_affected: PULong ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_batch_exec_immed3_m =
    function ( status_vector: pstatus_vector;
               db_handle: pisc_db_handle;
               tr_handle: pisc_tr_handle;
               isc_var4: word;
               isc_var5: dword;
               isc_var6: pbyte;
               isc_var7: word;
               isc_var8: pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_batch_execute =
    function ( status_vector: pstatus_vector;
               tran_handle: pisc_tr_handle;
               stmt_handle: pisc_stmt_handle;
               dialect: word;
               insqlda: PXSQLDA;
               no_of_rows: word;
               batch_vars: PPXSQLVAR;
               rows_affected: PULong ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_batch_execute2_m =
    function ( status_vector: PISC_STATUS;
               tran_handle: PISC_TR_HANDLE;
               statement_handle: PISC_STMT_HANDLE;
               isc_arg4: word;
               isc_arg5: pbyte;
               isc_arg6: word;
               isc_arg7: word;
               isc_arg8: pbyte;
               isc_arg9: word;
               isc_arg10: pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_execute_immediate_m =
    function ( status_vector: PISC_STATUS;
               db_handle : PISC_DB_HANDLE;
               tran_handle: PISC_TR_HANDLE;
               isc_arg4: word;
               isc_arg5: pbyte;
               isc_arg6: word;
               isc_arg7: word;
               isc_arg8: pbyte;
               isc_arg9: word;
               isc_arg10: word;
               isc_arg11: pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_dsql_exec_immed3_m =
    function ( status_vector: PISC_STATUS;
               db_handle: PISC_DB_HANDLE;
               tran_handle: PISC_TR_HANDLE;
               isc_arg4: word;
               isc_arg5: pbyte;
               isc_arg6: word;
               isc_arg7: word;
               isc_arg8: pbyte;
               isc_arg9: word;
               isc_arg10: word;
               isc_arg11: pbyte;
               isc_arg12: word;
               isc_arg13: pbyte;
               isc_arg14: word;
               isc_arg15: word;
               isc_arg16: pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//*************************************/
//* Security Functions and structures */
//*************************************/

const
  sec_uid_spec           =  001;
  sec_gid_spec	         =  002;
  sec_server_spec        =  004;
  sec_password_spec      =  008;
  sec_group_name_spec    =  016;
  sec_first_name_spec    =  032;
  sec_middle_name_spec   =  064;
  sec_last_name_spec     =  128;
  sec_dba_user_name_spec =  256;
  sec_dba_password_spec  =  512;

  sec_protocol_tcpip     =    1;
  sec_protocol_netbeui   =    2;
  sec_protocol_spx       =    3;
  sec_protocol_local     =    4;

type
 PUSER_SEC_DATA = ^TUSER_SEC_DATA;
 TUSER_SEC_DATA = record
    sec_flags:	   short;     //* which fields are specified */
    uid:           longint;   //* the user's id */
    gid:           longint;   //* the user's group id */
    protocol:      longint;   //* protocol to use for connection */
    server:        pbyte; //* server to administer */
    user_name:     pbyte; //* the user's name */
    password:      pbyte; //* the user's password */
    group_name:    pbyte; //* the group name */
    first_name:	   pbyte; //* the user's first name */
    middle_name:   pbyte; //* the user's middle name */
    last_name:	   pbyte; //* the user's last name */
    dba_user_name: pbyte; //* the dba user name */
    dba_password:  pbyte; //* the dba password */
  end;

  Tisc_user    = function( status: pstatus_vector;
                           UserSecData: PUSER_SEC_DATA ): ISC_LONG; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//**********************************/
//*  Other OSRI functions          */
//**********************************/

  Tisc_compile_request = function( status:     pstatus_vector;
                                   db_handle:  pisc_db_handle;
                                   req_handle: pisc_req_handle;
                                   buflen:     short;
                                   buf:        pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_compile_request2 = Tisc_compile_request;

  Tisc_ddl = function( status:    pstatus_vector;
                       db_handle: pisc_db_handle;
                       tr_handle: pisc_tr_handle;
                       buflen:    short;
                       buf:       pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_prepare_transaction = function( status:    pstatus_vector;
                                       tr_handle: pisc_tr_handle
                                                         ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_receive = function( status:     pstatus_vector;
                           req_handle: pisc_req_handle;
                           a:          short;
                           b:          short;
                           c:          pointer;
                           d:          short ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_reconnect_transaction = function( status:    pstatus_vector;
                                         db_handle: pisc_db_handle;
                                         tr_handle: pisc_tr_handle;
                                         a:         short;
                                         b:         pbyte
                                                         ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_release_request = function( status:     pstatus_vector;
                                   req_handle: pisc_req_handle
                                   ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_request_info = function( status:      pstatus_vector;
                                req_handle:  pisc_req_handle;
                                a:           short;
                                b:           short;
                                c:           pbyte;
                                d:           short;
                                e:           pbyte
                                ):           ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_seek_blob = function( status: pstatus_vector;
                             a:      pisc_blob_handle;
                             b:      short;
                             c:      ISC_LONG;
                             d:      pISC_LONG
                             ):      ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_send = function( status:     pstatus_vector;
                        req_handle: pisc_req_handle;
                        a:          short;
                        b:          short;
                        c:          pointer;
                        d:          short
                        ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_start_and_send = function( status:     pstatus_vector;
                                  req_handle: pisc_req_handle;
                                  tr_handle:  pisc_tr_handle;
                                  a:          short;
                                  b:          short;
                                  c:          pointer;
                                  d:          short
                                  ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_start_request = function( status:     pstatus_vector;
                                 req_handle: pisc_req_handle;
                                 tr_handle:  pisc_tr_handle;
                                 a:          short
                                 ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

  Tisc_unwind_request = function( status:    pstatus_vector;
                                  tr_handle: pisc_tr_handle;
                                  a:         short
                                  ):         ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//*************************************/
//* Other Dynamic sql functions       */
//*************************************/

(*

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_execute_m (ISC_STATUS  *
					   isc_tr_handle  *
					   isc_stmt_handle  *
					   unsigned short,
					   ansichar  *
					   unsigned short,
					   unsigned short,
					   ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_execute2_m (ISC_STATUS  *
					   isc_tr_handle  *
					   isc_stmt_handle  *
					   unsigned short,
					   ansichar  *
					   unsigned short,
					   unsigned short,
					   ansichar  *
					   unsigned short,
					   ansichar  *
					   unsigned short,
					   unsigned short,
					   ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_execute_immediate_m (ISC_STATUS  *
						     isc_db_handle  *
						     isc_tr_handle  *
						     unsigned short,
						     ansichar  *
						     unsigned short,
						     unsigned short,
						     ansichar  *
						     unsigned short,
						     unsigned short,
						     ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_exec_immed3_m (ISC_STATUS  *
					       isc_db_handle  *
					       isc_tr_handle  *
					       unsigned short,
					       ansichar  *
					       unsigned short,
					       unsigned short,
					       ansichar  *
					       unsigned short,
					       unsigned short,
					       ansichar  *
					       unsigned short,
					       ansichar  *
					       unsigned short,
					       unsigned short,
					       ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_fetch_m (ISC_STATUS  *
					 isc_stmt_handle  *
					 unsigned short,
					 ansichar  *
					 unsigned short,
					 unsigned short,
					 ansichar  *

{ Removed in IB 5.0
ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_fetch2_m (ISC_STATUS  *
					 isc_stmt_handle  *
					 unsigned short,
					 ansichar  *
					 unsigned short,
					 unsigned short,
					 ansichar  *
					 unsigned short,
					 signed long);
}
  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_insert_m (ISC_STATUS  *
					  isc_stmt_handle  *
					  unsigned short,
					  ansichar  *
					  unsigned short,
					  unsigned short,
					  ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_prepare_m (ISC_STATUS  *
					   isc_tr_handle  *
					   isc_stmt_handle  *
					   unsigned short,
					   ansichar  *
					   unsigned short,
					   unsigned short,
					   ansichar  *
					   unsigned short,
					   ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_dsql_release (ISC_STATUS  *
					 ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_close (ISC_STATUS  *
					     ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_declare (ISC_STATUS  *
					      ansichar  *
					      ansichar  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_describe (ISC_STATUS  *
						ansichar  *
						unsigned short,
						XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_describe_bind (ISC_STATUS  *
						     ansichar  *
						     unsigned short,
						     XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_execute (ISC_STATUS  *
					       isc_tr_handle  *
					       ansichar  *
					       unsigned short,
					       XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_execute2 (ISC_STATUS  *
						isc_tr_handle  *
						ansichar  *
						unsigned short,
						XSQLDA  *
						XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_execute_immed (ISC_STATUS  *
						     isc_db_handle  *
						     isc_tr_handle  *
						     unsigned short,
						     ansichar  *
						     unsigned short,
						     XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_fetch (ISC_STATUS  *
					     ansichar  *
					     unsigned short,
					     XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_open (ISC_STATUS  *
					    isc_tr_handle  *
					    ansichar  *
					    unsigned short,
					    XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_open2 (ISC_STATUS  *
					     isc_tr_handle  *
					     ansichar  *
					     unsigned short,
					     XSQLDA  *
					     XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_insert (ISC_STATUS  *
					      ansichar  *
					      unsigned short,
					      XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_prepare (ISC_STATUS  *
					       isc_db_handle  *
					       isc_tr_handle  *
					       ansichar  *
					       unsigned short,
					       ansichar  *
					       unsigned short,
					       XSQLDA  *

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_embed_dsql_release (ISC_STATUS  *
					       ansichar  *

*)

//******************************/
//* Other Blob functions       */
//******************************/

(*

BSTREAM      * {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_open ( isc_blob_handle;
				   pbyte;
				   longint);

int  	    {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_put (ansichar,
				 BSTREAM  *

int  	    {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_close (BSTREAM  *

int  	    {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_get (BSTREAM  *

int         {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_display (ISC_QUAD  *
				     isc_db_handle,
				     isc_tr_handle,
				     ansichar  *

int         {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_dump (ISC_QUAD  *
				  isc_db_handle,
				  isc_tr_handle,
				  ansichar  *

int         {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_edit (ISC_QUAD  *
				  isc_db_handle,
				  isc_tr_handle,
				  ansichar  *

int         {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_load (ISC_QUAD  *
				  isc_db_handle,
				  isc_tr_handle,
				  ansichar  *

int         {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_text_dump (ISC_QUAD  *
				  isc_db_handle,
				  isc_tr_handle,
				  ansichar  *

int         {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} BLOB_text_load (ISC_QUAD  *
				  isc_db_handle,
				  isc_tr_handle,
				  ansichar  *

BSTREAM      * {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} Bopen (ISC_QUAD  *
			       	    isc_db_handle,
			       	    isc_tr_handle,
			       	    ansichar  *

BSTREAM      * {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} Bopen2 (ISC_QUAD  *
				     isc_db_handle,
				     isc_tr_handle,
				     ansichar  *
				     unsigned short);

*)

(*

//******************************/
//* Other Misc functions       */
//******************************/

ISC_LONG    {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_ftof (ansichar  *
				 unsigned short,
				 ansichar  *
				 unsigned short);

  T? = function( status:          pstatus_vector;
                 ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

ISC_STATUS  {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_print_blr (ansichar  *
				      isc_callback,
				      void  *
				      short);

void        {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_set_debug (int);

void        {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_qtoq (ISC_QUAD  *
				 ISC_QUAD  *

void        {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif} isc_vtof (ansichar  *
				 ansichar  *
				 unsigned short);

*)

Tisc_vtov = procedure ( a: pbyte; b: pbyte; c: short ); {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

(*
Tisc_version = function ( db_handle: PISC_DB_HANDLE;
                          isc_arg2:  TISC_CALLBACK;
                          isc_arg3:  PVoid): Int;
                                {$IFDEF MSWINDOWS} {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif}; {$ENDIF}
                                {$IFDEF LINUX} cdecl; {$ENDIF}
*)

//*****************************************/
//* Service manager functions             */
//*****************************************/

(*
  ADD_SPB_LENGTH(p, length)    {*(p)++ = (length); \
                         *(p)++ = (length) >> 8;}

  ADD_SPB_NUMERIC(p, data)    {*(p)++ = (data); \
                         *(p)++ = (data) >> 8; \
                     *(p)++ = (data) >> 16; \
                     *(p)++ = (data) >> 24;}
*)
procedure add_spb_length(var p: pbyte; length: integer);
procedure add_spb_numeric(var p: pbyte; data: integer);

type

//ISC_STATUS  ISC_EXPORT isc_service_attach (ISC_STATUS ISC_FAR *,
//                       unsigned short,
//                       ansichar ISC_FAR *,
//                       isc_svc_handle ISC_FAR *,
//                       unsigned short,
//                       ansichar ISC_FAR * );
Tisc_service_attach = function( status:          pstatus_vector;
                                svc_name_len:    short;
                                svc_name:        pbyte;
                                svc_handle:      pisc_svc_handle;
                                parm_buffer_len: short;
                                parm_buffer:     pbyte
                                ):               ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//ISC_STATUS  ISC_EXPORT isc_service_detach (ISC_STATUS ISC_FAR *,
//                       isc_svc_handle ISC_FAR * );
Tisc_service_detach = function( status:     pstatus_vector;
                                svc_handle: pisc_svc_handle
                                ):          ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

//ISC_STATUS  ISC_EXPORT isc_service_query (ISC_STATUS ISC_FAR *,
//                      isc_svc_handle ISC_FAR *,
//                                        isc_resv_handle ISC_FAR *,
//                      unsigned short,
//                      ansichar ISC_FAR *,
//                      unsigned short,
//                      ansichar ISC_FAR *,
//                      unsigned short,
//                      ansichar ISC_FAR * );
Tisc_service_query = function( status: pstatus_vector;
                               svc_handle: pisc_svc_handle;
                               recv_handle: pisc_svc_handle;
                               isc_arg4: short;
                               isc_arg5: pbyte;
                               isc_arg6: short;
                               isc_arg7: pbyte;
                               isc_arg8: short;
                               isc_arg9: pbyte): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};


//ISC_STATUS ISC_EXPORT isc_service_start (ISC_STATUS ISC_FAR *,
//                         isc_svc_handle ISC_FAR *,
//                                  isc_resv_handle ISC_FAR *,
//                         unsigned short,
//                         ansichar ISC_FAR* );
Tisc_service_start = function( status: pstatus_vector;
                               svc_handle: pisc_svc_handle;
                               recv_handle: pisc_svc_handle;
                               isc_arg4: short;
                               isc_arg5: pbyte ): ISC_STATUS; {$IFDEF WINDOWS}stdcall{$else}cdecl{$endif};

const

//***************************************************/
//* Actions to pass to the blob filter (ctl_source) */
//***************************************************/

isc_blob_filter_open            = 0;
isc_blob_filter_get_segment     = 1;
isc_blob_filter_close           = 2;
isc_blob_filter_create          = 3;
isc_blob_filter_put_segment     = 4;
isc_blob_filter_alloc           = 5;
isc_blob_filter_free            = 6;
isc_blob_filter_seek            = 7;

//*******************/
//* Blr definitions */
//*******************/

blr_text                         = 14;
blr_text2                        = 15;
blr_short                        = 7;
blr_long                         = 8;
blr_quad                         = 9;
blr_int64                        = 16;
blr_float                        = 10;
blr_double                       = 27;
blr_d_float                      = 11;
blr_timestamp                    = 35;
blr_varying                      = 37;
blr_varying2                     = 38;
blr_blob                         = 261;
blr_cstring                      = 40;
blr_cstring2                     = 41;
blr_blob_id                      = 45;
blr_sql_date                     = 12;
blr_sql_time                     = 13;
blr_date                         = blr_timestamp;

blr_inner                        = 0;
blr_left                         = 1;
blr_right                        = 2;
blr_full                         = 3;

blr_gds_code                     = 0;
blr_sql_code                     = 1;
blr_exception                    = 2;
blr_trigger_code                 = 3;
blr_default_code                 = 4;

blr_version4                     = 4;
blr_version5                     = 5;
blr_eoc                          = 76;
blr_end                          = 255;

blr_assignment                   = 1;
blr_begin                        = 2;
blr_dcl_variable                 = 3;
blr_message                      = 4;
blr_erase                        = 5;
blr_fetch                        = 6;
blr_for                          = 7;
blr_if                           = 8;
blr_loop                         = 9;
blr_modify                       = 10;
blr_handler                      = 11;
blr_receive                      = 12;
blr_select                       = 13;
blr_send                         = 14;
blr_store                        = 15;
blr_label                        = 17;
blr_leave                        = 18;
blr_store2                       = 19;
blr_post                         = 20;

blr_literal                      = 21;
blr_dbkey                        = 22;
blr_field                        = 23;
blr_fid                          = 24;
blr_parameter                    = 25;
blr_variable                     = 26;
blr_average                      = 27;
blr_count                        = 28;
blr_maximum                      = 29;
blr_minimum                      = 30;
blr_total                        = 31;
blr_add                          = 34;
blr_subtract                     = 35;
blr_multiply                     = 36;
blr_divide                       = 37;
blr_negate                       = 38;
blr_concatenate                  = 39;
blr_substring                    = 40;
blr_parameter2                   = 41;
blr_from                         = 42;
blr_via                          = 43;
blr_user_name                    = 44;
blr_null                         = 45;

blr_eql                          = 47;
blr_neq                          = 48;
blr_gtr                          = 49;
blr_geq                          = 50;
blr_lss                          = 51;
blr_leq                          = 52;
blr_containing                   = 53;
blr_matching                     = 54;
blr_starting                     = 55;
blr_between                      = 56;
blr_or                           = 57;
blr_and                          = 58;
blr_not                          = 59;
blr_any                          = 60;
blr_missing                      = 61;
blr_unique                       = 62;
blr_like                         = 63;

blr_stream                       = 65;
blr_set_index                    = 66;
blr_rse                          = 67;
blr_first                        = 68;
blr_project                      = 69;
blr_sort                         = 70;
blr_boolean                      = 71;
blr_ascending                    = 72;
blr_descending                   = 73;
blr_relation                     = 74;
blr_rid                          = 75;
blr_union                        = 76;
blr_map                          = 77;
blr_group_by                     = 78;
blr_aggregate                    = 79;
blr_join_type                    = 80;

blr_agg_count                    = 83;
blr_agg_max                      = 84;
blr_agg_min                      = 85;
blr_agg_total                    = 86;
blr_agg_average                  = 87;
blr_parameter3                   = 88;
blr_run_count                    = 118;
blr_run_max                      = 89;
blr_run_min                      = 90;
blr_run_total                    = 91;
blr_run_average                  = 92;
blr_agg_count2                   = 93;
blr_agg_count_distinct           = 94;
blr_agg_total_distinct           = 95;
blr_agg_average_distinct         = 96;

blr_function                     = 100;
blr_gen_id                       = 101;
blr_prot_mask                    = 102;
blr_upcase                       = 103;
blr_lock_state                   = 104;
blr_value_if                     = 105;
blr_matching2                    = 106;
blr_index                        = 107;
blr_ansi_like                    = 108;
blr_bookmark                     = 109;
blr_crack                        = 110;
blr_force_crack                  = 111;
blr_seek                         = 112;
blr_find                         = 113;

blr_continue                     = 0;
blr_forward                      = 1;
blr_backward                     = 2;
blr_bof_forward                  = 3;
blr_eof_backward                 = 4;

blr_lock_relation                = 114;
blr_lock_record                  = 115;
blr_set_bookmark                 = 116;
blr_get_bookmark                 = 117;
blr_rs_stream                    = 119;
blr_exec_proc                    = 120;
blr_begin_range                  = 121;
blr_end_range                    = 122;
blr_delete_range                 = 123;
blr_procedure                    = 124;
blr_pid                          = 125;
blr_exec_pid                     = 126;
blr_singular                     = 127;
blr_abort                        = 128;
blr_block                        = 129;
blr_error_handler                = 130;
blr_cast                         = 131;
blr_release_lock                 = 132;
blr_release_locks                = 133;
blr_start_savepoint              = 134;
blr_end_savepoint                = 135;
blr_find_dbkey                   = 136;
blr_range_relation               = 137;
blr_delete_ranges                = 138;

blr_plan                         = 139;
blr_merge                        = 140;
blr_join                         = 141;
blr_sequential                   = 142;
blr_navigational                 = 143;
blr_indices                      = 144;
blr_retrieve                     = 145;

blr_relation2                    = 146;
blr_rid2                         = 147;
blr_reset_stream                 = 148;
blr_release_bookmark             = 149;
blr_set_generator                = 150;
blr_ansi_any                     = 151;
blr_exists                       = 152;
blr_cardinality                  = 153;

blr_record_version               = 154;		// get tid of record
blr_stall                        = 155;		// fake server stall
blr_seek_no_warn                 = 156;
blr_find_dbkey_version           = 157;
blr_ansi_all                     = 158;
blr_extract                      = 159;
// sub parameters for blr_extract
  blr_extract_year    = 0;
  blr_extract_month   = 1;
  blr_extract_day     = 2;
  blr_extract_hour    = 3;
  blr_extract_minute  = 4;
  blr_extract_second  = 5;
  blr_extract_weekday = 6;
  blr_extract_yearday = 7;

blr_current_date      = 160;
blr_current_timestamp = 161;
blr_current_time      = 162;

// These verbs were added in 6.0, primarily to support 64-bit integers

blr_add2                  = 163;
blr_subtract2             = 164;
blr_multiply2             = 165;
blr_divide2               = 166;
blr_agg_total2            = 167;
blr_agg_total_distinct2   = 168;
blr_agg_average2          = 169;
blr_agg_average_distinct2 = 170;
blr_average2              = 171;
blr_gen_id2               = 172;
blr_set_generator2        = 173;

//**********************************/
//* Database parameter block stuff */
//**********************************/

isc_dpb_version1                 =  1;

isc_dpb_cdd_pathname             =  1;
isc_dpb_allocation               =  2;
isc_dpb_journal                  =  3;
isc_dpb_page_size                =  4;
isc_dpb_num_buffers              =  5;
isc_dpb_buffer_length            =  6;
isc_dpb_debug                    =  7;
isc_dpb_garbage_collect          =  8;
isc_dpb_verify                   =  9;
isc_dpb_sweep                    = 10;
isc_dpb_enable_journal           = 11;
isc_dpb_disable_journal          = 12;
isc_dpb_dbkey_scope              = 13;
isc_dpb_number_of_users          = 14;
isc_dpb_trace                    = 15;
isc_dpb_no_garbage_collect       = 16;
isc_dpb_damaged                  = 17;
isc_dpb_license                  = 18;
isc_dpb_sys_user_name            = 19;
isc_dpb_encrypt_key              = 20;
isc_dpb_activate_shadow          = 21;
isc_dpb_sweep_interval           = 22;
isc_dpb_delete_shadow            = 23;
isc_dpb_force_write              = 24;
isc_dpb_begin_log                = 25;
isc_dpb_quit_log                 = 26;
isc_dpb_no_reserve               = 27;
isc_dpb_user_name                = 28;
isc_dpb_password                 = 29;
isc_dpb_password_enc             = 30;
isc_dpb_sys_user_name_enc        = 31;
isc_dpb_interp                   = 32;
isc_dpb_online_dump              = 33;
isc_dpb_old_file_size            = 34;
isc_dpb_old_num_files            = 35;
isc_dpb_old_file                 = 36;
isc_dpb_old_start_page           = 37;
isc_dpb_old_start_seqno          = 38;
isc_dpb_old_start_file           = 39;
isc_dpb_drop_walfile             = 40;
isc_dpb_old_dump_id              = 41;
isc_dpb_wal_backup_dir           = 42;
isc_dpb_wal_chkptlen             = 43;
isc_dpb_wal_numbufs              = 44;
isc_dpb_wal_bufsize              = 45;
isc_dpb_wal_grp_cmt_wait         = 46;
isc_dpb_lc_messages              = 47;
isc_dpb_lc_ctype                 = 48;
isc_dpb_cache_manager            = 49;
isc_dpb_shutdown                 = 50;
isc_dpb_online                   = 51;
isc_dpb_shutdown_delay           = 52;
isc_dpb_reserved                 = 53;
isc_dpb_overwrite                = 54;
isc_dpb_sec_attach               = 55;
isc_dpb_disable_wal              = 56;
{IB5}
isc_dpb_connect_timeout          = 57;
isc_dpb_dummy_packet_interval    = 58;
isc_dpb_gbak_attach              = 59;
isc_dpb_sql_role_name            = 60;
isc_dpb_set_page_buffers         = 61;
isc_dpb_working_directory        = 62;
{IB6}
isc_dpb_SQL_dialect              = 63;
isc_dpb_set_db_readonly          = 64;
isc_dpb_set_db_SQL_dialect       = 65;
isc_dpb_gfix_attach              = 66;
isc_dpb_gstat_attach             = 67;

//*********************************/
//* isc_dpb_verify specific flags */
//*********************************/

isc_dpb_pages        =  1;
isc_dpb_records      =  2;
isc_dpb_indices      =  4;
isc_dpb_transactions =  8;
isc_dpb_no_update    = 16;
isc_dpb_repair       = 32;
isc_dpb_ignore       = 64;

//***********************************/
//* isc_dpb_shutdown specific flags */
//***********************************/

isc_dpb_shut_cache       = 1;
isc_dpb_shut_attachment  = 2;
isc_dpb_shut_transaction = 4;
isc_dpb_shut_force       = 8;

isc_dpb_shut_mode_mask   = 70; {fb}
isc_dpb_shut_default     =  0; {fb}
isc_dpb_shut_normal      = 10; {fb}
isc_dpb_shut_multi       = 20; {fb}
isc_dpb_shut_single      = 30; {fb}
isc_dpb_shut_full        = 40; {fb}

//**************************************/
//* Bit assignments in RDB$SYSTEM_FLAG */
//**************************************/

RDB_system      = 1;
RDB_id_assigned = 2;

//*************************************/
//* Transaction parameter block stuff */
//*************************************/

isc_tpb_version1         =  1;
isc_tpb_version3         =  3;

isc_tpb_consistency      =  1;
isc_tpb_concurrency      =  2;
isc_tpb_shared           =  3;
isc_tpb_protected        =  4;
isc_tpb_exclusive        =  5;
isc_tpb_wait             =  6;
isc_tpb_nowait           =  7;
isc_tpb_read             =  8;
isc_tpb_write            =  9;
isc_tpb_lock_read        = 10;
isc_tpb_lock_write       = 11;
isc_tpb_verb_time        = 12;
isc_tpb_commit_time      = 13;
isc_tpb_ignore_limbo     = 14;
isc_tpb_read_committed   = 15;
isc_tpb_autocommit       = 16;
isc_tpb_rec_version      = 17;
isc_tpb_no_rec_version   = 18;
isc_tpb_restart_requests = 19;
isc_tpb_no_auto_undo     = 20;
isc_tpb_lock_timeout     = 21; { Added in Firebird 2.1 }

//************************/
//* Blob Parameter Block */
//************************/

isc_bpb_version1         = 1;
isc_bpb_source_type      = 1;
isc_bpb_target_type      = 2;
isc_bpb_type             = 3;
isc_bpb_source_interp    = 4;
isc_bpb_target_interp    = 5;
isc_bpb_filter_parameter = 6;

isc_bpb_type_segmented   = 0;
isc_bpb_type_stream      = 1;

//*********************************/
//* Service parameter block stuff */
//*********************************/

isc_spb_connect_timeout       = isc_dpb_connect_timeout;
isc_spb_dummy_packet_interval = isc_dpb_dummy_packet_interval;
isc_spb_sql_role_name         = isc_dpb_sql_role_name;

isc_spb_version1          = 1;
isc_spb_current_version   = 2;
isc_spb_version           = isc_spb_current_version;
isc_spb_user_name         = isc_dpb_user_name;
isc_spb_sys_user_name     = isc_dpb_sys_user_name;
isc_spb_sys_user_name_enc = isc_dpb_sys_user_name_enc;
isc_spb_password          = isc_dpb_password;
isc_spb_password_enc      = isc_dpb_password_enc;
isc_spb_command_line      = 105;
isc_spb_dbname            = 106;
isc_spb_verbose           = 107;
isc_spb_options           = 108;

isc_spb_address_path      = 109; {fb}
isc_spb_process_id        = 110; {fb}
isc_spb_trusted_auth      = 111; {fb}
isc_spb_process_name      = 112; {fb}

//*********************************/
//* Information call declarations */
//*********************************/

//****************************/
//* Common, structural codes */
//****************************/

isc_info_end            = 1;
isc_info_truncated      = 2;
isc_info_error          = 3;
isc_info_data_not_ready = 4;
isc_info_flag_end       = 127;

//******************************/
//* Database information items */
//******************************/

isc_info_db_id                   =  4;
isc_info_reads                   =  5;
isc_info_writes                  =  6;
isc_info_fetches                 =  7;
isc_info_marks                   =  8;
isc_info_implementation          = 11;
isc_info_version                 = 12;
isc_info_base_level              = 13;
isc_info_page_size               = 14;
isc_info_num_buffers             = 15;
isc_info_limbo                   = 16;
isc_info_current_memory          = 17;
isc_info_max_memory              = 18;
isc_info_window_turns            = 19;
isc_info_license                 = 20;
isc_info_allocation              = 21;
isc_info_attachment_id           = 22;
isc_info_read_seq_count          = 23;
isc_info_read_idx_count          = 24;
isc_info_insert_count            = 25;
isc_info_update_count            = 26;
isc_info_delete_count            = 27;
isc_info_backout_count           = 28;
isc_info_purge_count             = 29;
isc_info_expunge_count           = 30;
isc_info_sweep_interval          = 31;
isc_info_ods_version             = 32;
isc_info_ods_minor_version       = 33;
isc_info_no_reserve              = 34;
isc_info_logfile                 = 35;
isc_info_cur_logfile_name        = 36;
isc_info_cur_log_part_offset     = 37;
isc_info_num_wal_buffers         = 38;
isc_info_wal_buffer_size         = 39;
isc_info_wal_ckpt_length         = 40;
isc_info_wal_cur_ckpt_interval   = 41;
isc_info_wal_prv_ckpt_fname      = 42;
isc_info_wal_prv_ckpt_poffset    = 43;
isc_info_wal_recv_ckpt_fname     = 44;
isc_info_wal_recv_ckpt_poffset   = 45;
isc_info_wal_grpc_wait_usecs     = 47;
isc_info_wal_num_io              = 48;
isc_info_wal_avg_io_size         = 49;
isc_info_wal_num_commits         = 50;
isc_info_wal_avg_grpc_size       = 51;
isc_info_forced_writes	         = 52;
isc_info_user_names              = 53;
isc_info_page_errors             = 54;
isc_info_record_errors           = 55;
isc_info_bpage_errors            = 56;
isc_info_dpage_errors            = 57;
isc_info_ipage_errors            = 58;
isc_info_ppage_errors            = 59;
isc_info_tpage_errors            = 60;
isc_info_set_page_buffers        = 61;
isc_info_db_SQL_dialect          = 62;
isc_info_db_read_only            = 63;
isc_info_db_size_in_pages        = 64;

frb_info_att_charset            = 101;
isc_info_db_class               = 102;
isc_info_firebird_version       = 103;
isc_info_oldest_transaction     = 104;
isc_info_oldest_active          = 105;
isc_info_oldest_snapshot        = 106;
isc_info_next_transaction       = 107;
isc_info_db_provider            = 108;
isc_info_active_transactions    = 109;
isc_info_active_tran_count      = 110;
isc_info_creation_date          = 111;


//**************************************/
//* Database information return values */
//**************************************/

isc_info_db_impl_rdb_vms       =  1;
isc_info_db_impl_rdb_eln       =  2;
isc_info_db_impl_rdb_eln_dev   =  3;
isc_info_db_impl_rdb_vms_y     =  4;
isc_info_db_impl_rdb_eln_y     =  5;
isc_info_db_impl_jri           =  6;
isc_info_db_impl_jsv           =  7;
isc_info_db_impl_isc_a         = 25;
isc_info_db_impl_isc_u         = 26;
isc_info_db_impl_isc_v         = 27;
isc_info_db_impl_isc_s         = 28;
isc_info_db_impl_isc_apl_68K   = 25;
isc_info_db_impl_isc_vax_ultr  = 26;
isc_info_db_impl_isc_vms       = 27;
isc_info_db_impl_isc_sun_68k   = 28;
isc_info_db_impl_isc_os2       = 29;
isc_info_db_impl_isc_sun4      = 30;
isc_info_db_impl_isc_hp_ux     = 31;
isc_info_db_impl_isc_sun_386i  = 32;
isc_info_db_impl_isc_vms_orcl  = 33;
isc_info_db_impl_isc_mac_aux   = 34;
isc_info_db_impl_isc_rt_aix    = 35;
isc_info_db_impl_isc_mips_ult  = 36;
isc_info_db_impl_isc_xenix     = 37;
isc_info_db_impl_isc_dg        = 38;
isc_info_db_impl_isc_hp_mpexl  = 39;
isc_info_db_impl_isc_hp_ux68K  = 40;
isc_info_db_impl_isc_sgi       = 41;
isc_info_db_impl_isc_sco_unix  = 42;
isc_info_db_impl_isc_cray      = 43;
isc_info_db_impl_isc_imp       = 44;
isc_info_db_impl_isc_delta     = 45;
isc_info_db_impl_isc_next      = 46;
isc_info_db_impl_isc_dos       = 47;
isc_info_db_impl_isc_winnt     = 48;
isc_info_db_impl_isc_epson     = 49;

isc_info_db_class_access    =  1;
isc_info_db_class_y_valve   =  2;
isc_info_db_class_rem_int   =  3;
isc_info_db_class_rem_srvr  =  4;
isc_info_db_class_pipe_int  =  7;
isc_info_db_class_pipe_srvr =  8;
isc_info_db_class_sam_int   =  9;
isc_info_db_class_sam_srvr  = 10;
isc_info_db_class_gateway   = 11;
isc_info_db_class_cache     = 12;

//*****************************/
//* Request information items */
//*****************************/

isc_info_number_messages  =  4;
isc_info_max_message      =  5;
isc_info_max_send         =  6;
isc_info_max_receive      =  7;
isc_info_state            =  8;
isc_info_message_number   =  9;
isc_info_message_size     = 10;
isc_info_request_cost     = 11;
isc_info_access_path      = 12;
isc_info_req_select_count = 13;
isc_info_req_insert_count = 14;
isc_info_req_update_count = 15;
isc_info_req_delete_count = 16;

//*********************/
//* Access path items */
//*********************/

isc_info_rsb_end      = 0;
isc_info_rsb_begin    = 1;
isc_info_rsb_type     = 2;
isc_info_rsb_relation = 3;
isc_info_rsb_plan     = 4;

//*************/
//* Rsb types */
//*************/

isc_info_rsb_unknown        =  1;
isc_info_rsb_indexed        =  2;
isc_info_rsb_navigate       =  3;
isc_info_rsb_sequential     =  4;
isc_info_rsb_cross          =  5;
isc_info_rsb_sort           =  6;
isc_info_rsb_first          =  7;
isc_info_rsb_boolean        =  8;
isc_info_rsb_union          =  9;
isc_info_rsb_aggregate      = 10;
isc_info_rsb_merge          = 11;
isc_info_rsb_ext_sequential = 12;
isc_info_rsb_ext_indexed    = 13;
isc_info_rsb_ext_dbkey      = 14;
isc_info_rsb_left_cross     = 15;
isc_info_rsb_select         = 16;
isc_info_rsb_sql_join       = 17;
isc_info_rsb_simulate       = 18;
isc_info_rsb_sim_cross      = 19;
isc_info_rsb_once           = 20;
isc_info_rsb_procedure      = 21;

//**********************/
//* Bitmap expressions */
//**********************/

isc_info_rsb_and   = 1;
isc_info_rsb_or    = 2;
isc_info_rsb_dbkey = 3;
isc_info_rsb_index = 4;

isc_info_req_active    = 2;
isc_info_req_inactive  = 3;
isc_info_req_send      = 4;
isc_info_req_receive   = 5;
isc_info_req_select    = 6;
isc_info_req_sql_stall = 7;

//**************************/
//* Blob information items */
//**************************/

isc_info_blob_num_segments = 4;
isc_info_blob_max_segment  = 5;
isc_info_blob_total_length = 6;
isc_info_blob_type         = 7;

//*********************************/
//* Transaction information items */
//*********************************/

isc_info_tra_id                        =  4;
isc_info_tra_oldest_interesting        =  5; {fb}
isc_info_tra_oldest_snapshot           =  6; {fb}
isc_info_tra_oldest_active             =  7; {fb}
isc_info_tra_isolation                 =  8; {fb}
isc_info_tra_access                    =  9; {fb}
isc_info_tra_lock_timeout              = 10; {fb}

//*****************************
//* Service action items      *
//*****************************/
isc_action_svc_backup         =  1; // Starts database backup process on the server
isc_action_svc_restore        =  2; // Starts database restore process on the server
isc_action_svc_repair         =  3; // Starts database repair process on the server
isc_action_svc_add_user       =  4; // Adds a new user to the security database
isc_action_svc_delete_user    =  5; // Deletes a user record from the security database
isc_action_svc_modify_user    =  6; // Modifies a user record in the security database
isc_action_svc_display_user   =  7; // Displays a user record from the security database
isc_action_svc_properties     =  8; // Sets database properties
isc_action_svc_add_license    =  9; // Adds a license to the license file
isc_action_svc_remove_license = 10; // Removes a license from the license file
isc_action_svc_db_stats       = 11; // Retrieves database statistics
isc_action_svc_get_ib_log     = 12; // Retrieves the InterBase log file from the server


//*****************************/
//* Service information items */
//*****************************/

// !!!! Telesis Computing !!!!
// I presume the values commented out below must from an earlier version
// of Interbase - they are certainly nothing like the values provided for
// IB6.0
{
isc_info_svc_version        =  4;
isc_info_svc_message        =  5;
isc_info_svc_total_length   =  6;
isc_info_svc_response       =  7;
isc_info_svc_response_more  =  8;
isc_info_svc_line           =  9;
isc_info_svc_to_eof         = 10;
isc_info_svc_timeout        = 11;
isc_info_svc_server_version = 12;
isc_info_svc_implementation = 13;
isc_info_svc_capabilities   = 14;
isc_info_svc_user_dbpath    = 15;
isc_info_svc_svr_db_info    = 16;
isc_info_svc_svr_online     = 17;
isc_info_svc_svr_offline    = 18;
isc_info_svc_get_config     = 19;
isc_info_svc_set_config     = 20;
isc_info_svc_default_config = 21;
isc_info_svc_get_env        = 22;
isc_info_svc_get_env_lock   = 23;
isc_info_svc_get_env_msg    = 24;
}
isc_info_svc_svr_db_info        = 50; // Retrieves the number of attachments and databases
isc_info_svc_get_license        = 51; // Retrieves all license keys and IDs from the license file
isc_info_svc_get_license_mask   = 52; // Retrieves a bitmask representing licensed options on the server
isc_info_svc_get_config         = 53; // Retrieves the parameters and values for IB_CONFIG
isc_info_svc_version            = 54; // Retrieves the version of the services manager
isc_info_svc_server_version     = 55; // Retrieves the version of the InterBase server
isc_info_svc_implementation     = 56; // Retrieves the implementation of the InterBase server
isc_info_svc_capabilities       = 57; // Retrieves a bitmask representing the server's capabilities
isc_info_svc_user_dbpath        = 58; // Retrieves the path to the security database in use by the server
isc_info_svc_get_env            = 59; // Retrieves the setting of $INTERBASE
isc_info_svc_get_env_lock       = 60; // Retrieves the setting of $INTERBASE_LCK
isc_info_svc_get_env_msg        = 61; // Retrieves the setting of $INTERBASE_MSG
isc_info_svc_line               = 62; // Retrieves 1 line of service output per call
isc_info_svc_to_eof             = 63; // Retrieves as much of the server output as will fit in the supplied buffer
isc_info_svc_timeout            = 64; // Sets / signifies a timeout value for reading service information
isc_info_svc_get_licensed_users = 65; // Retrieves the number of users licensed for accessing the server
isc_info_svc_limbo_trans        = 66; // Retrieve the limbo transactions
isc_info_svc_running            = 67; // Checks to see if a service is running on an attachment
isc_info_svc_get_users          = 68; // Returns the user information from isc_action_svc_display_users

//*************************/
//* SQL information items */
//*************************/

isc_info_sql_select         =  4;
isc_info_sql_bind           =  5;
isc_info_sql_num_variables  =  6;
isc_info_sql_describe_vars  =  7;
isc_info_sql_describe_end   =  8;
isc_info_sql_sqlda_seq      =  9;
isc_info_sql_message_seq    = 10;
isc_info_sql_type           = 11;
isc_info_sql_sub_type       = 12;
isc_info_sql_scale          = 13;
isc_info_sql_length         = 14;
isc_info_sql_null_ind       = 15;
isc_info_sql_field          = 16;
isc_info_sql_relation       = 17;
isc_info_sql_owner          = 18;
isc_info_sql_alias          = 19;
isc_info_sql_sqlda_start    = 20;
isc_info_sql_stmt_type      = 21;
isc_info_sql_get_plan       = 22;
isc_info_sql_records        = 23;
isc_info_sql_batch_fetch    = 24;
isc_info_sql_relation_alias = 25;

//*********************************/
//* SQL information return values */
//*********************************/

isc_info_sql_stmt_select         =  1;
isc_info_sql_stmt_insert         =  2;
isc_info_sql_stmt_update         =  3;
isc_info_sql_stmt_delete         =  4;
isc_info_sql_stmt_ddl            =  5;
isc_info_sql_stmt_get_segment    =  6;
isc_info_sql_stmt_put_segment    =  7;
isc_info_sql_stmt_exec_procedure =  8;
isc_info_sql_stmt_start_trans    =  9;
isc_info_sql_stmt_commit         = 10;
isc_info_sql_stmt_rollback       = 11;
isc_info_sql_stmt_select_for_upd = 12;
isc_info_sql_stmt_set_generator  = 13;

//***********************************/
//* Server configuration key values */
//***********************************/

ISCCFG_LOCKMEM_KEY      =  0;
ISCCFG_LOCKSEM_KEY      =  1;
ISCCFG_LOCKSIG_KEY      =  2;
ISCCFG_EVNTMEM_KEY      =  3;
ISCCFG_DBCACHE_KEY      =  4;
ISCCFG_PRIORITY_KEY     =  5;
ISCCFG_IPCMAP_KEY       =  6;
ISCCFG_MEMMIN_KEY       =  7;
ISCCFG_MEMMAX_KEY       =  8;
ISCCFG_LOCKORDER_KEY    =  9;
ISCCFG_ANYLOCKMEM_KEY   = 10;
ISCCFG_ANYLOCKSEM_KEY   = 11;
ISCCFG_ANYLOCKSIG_KEY   = 12;
ISCCFG_ANYEVNTMEM_KEY   = 13;
ISCCFG_LOCKHASH_KEY     = 14;
ISCCFG_DEADLOCK_KEY     = 15;
ISCCFG_LOCKSPIN_KEY     = 16;
ISCCFG_CONN_TIMEOUT_KEY = 17;
ISCCFG_DUMMY_INTRVL_KEY = 18;

//***************/
//* Error codes */
//***************/

isc_err_base                         = 335544320;
isc_facility                         = 20;
isc_err_factor                       = 1;
isc_arg_end                          = 0;
isc_arg_gds                          = 1;
isc_arg_string                       = 2;
isc_arg_cstring                      = 3;
isc_arg_number                       = 4;
isc_arg_interpreted                  = 5;
isc_arg_vms                          = 6;
isc_arg_unix                         = 7;
isc_arg_domain                       = 8;
isc_arg_dos                          = 9;
isc_arg_mpexl                        = 10;
isc_arg_mpexl_ipc                    = 11;
isc_arg_next_mach                    = 15;
isc_arg_netware                      = 16;
isc_arg_win32                        = 17;
isc_arg_warning                      = 18;

isc_arith_except                     = 335544321;
isc_bad_dbkey                        = 335544322;
isc_bad_db_format                    = 335544323;

isc_bad_db_handle                    = 335544324;

isc_bad_dpb_content                  = 335544325;
isc_bad_dpb_form                     = 335544326;
isc_bad_req_handle                   = 335544327;
isc_bad_segstr_handle                = 335544328;
isc_bad_segstr_id                    = 335544329;
isc_bad_tpb_content                  = 335544330;
isc_bad_tpb_form                     = 335544331;
isc_bad_trans_handle                 = 335544332;
isc_bug_check                        = 335544333;
isc_convert_error                    = 335544334;
isc_db_corrupt                       = 335544335;
isc_deadlock                         = 335544336;
isc_excess_trans                     = 335544337;
isc_from_no_match                    = 335544338;
isc_infinap                          = 335544339;
isc_infona                           = 335544340;
isc_infunk                           = 335544341;
isc_integ_fail                       = 335544342;
isc_invalid_blr                      = 335544343;
isc_io_error                         = 335544344;
isc_lock_conflict                    = 335544345;
isc_metadata_corrupt                 = 335544346;
isc_not_valid                        = 335544347;
isc_no_cur_rec                       = 335544348;
isc_no_dup                           = 335544349;
isc_no_finish                        = 335544350;
isc_no_meta_update                   = 335544351;
isc_no_priv                          = 335544352;
isc_no_recon                         = 335544353;
isc_no_record                        = 335544354;
isc_no_segstr_close                  = 335544355;
isc_obsolete_metadata                = 335544356;
isc_open_trans                       = 335544357;
isc_port_len                         = 335544358;
isc_read_only_field                  = 335544359;
isc_read_only_rel                    = 335544360;
isc_read_only_trans                  = 335544361;
isc_read_only_view                   = 335544362;
isc_req_no_trans                     = 335544363;
isc_req_sync                         = 335544364;
isc_req_wrong_db                     = 335544365;
isc_segment                          = 335544366;
isc_segstr_eof                       = 335544367;
isc_segstr_no_op                     = 335544368;
isc_segstr_no_read                   = 335544369;
isc_segstr_no_trans                  = 335544370;
isc_segstr_no_write                  = 335544371;
isc_segstr_wrong_db                  = 335544372;
isc_sys_request                      = 335544373;
isc_stream_eof                       = 335544374;
isc_unavailable                      = 335544375;
isc_unres_rel                        = 335544376;
isc_uns_ext                          = 335544377;
isc_wish_list                        = 335544378;
isc_wrong_ods                        = 335544379;
isc_wronumarg                        = 335544380;
isc_imp_exc                          = 335544381;
isc_random                           = 335544382;
isc_fatal_conflict                   = 335544383;
isc_badblk                           = 335544384;
isc_invpoolcl                        = 335544385;
isc_nopoolids                        = 335544386;
isc_relbadblk                        = 335544387;
isc_blktoobig                        = 335544388;
isc_bufexh                           = 335544389;
isc_syntaxerr                        = 335544390;
isc_bufinuse                         = 335544391;
isc_bdbincon                         = 335544392;
isc_reqinuse                         = 335544393;
isc_badodsver                        = 335544394;
isc_relnotdef                        = 335544395;
isc_fldnotdef                        = 335544396;
isc_dirtypage                        = 335544397;
isc_waifortra                        = 335544398;
isc_doubleloc                        = 335544399;
isc_nodnotfnd                        = 335544400;
isc_dupnodfnd                        = 335544401;
isc_locnotmar                        = 335544402;
isc_badpagtyp                        = 335544403;
isc_corrupt                          = 335544404;
isc_badpage                          = 335544405;
isc_badindex                         = 335544406;
isc_dbbnotzer                        = 335544407;
isc_tranotzer                        = 335544408;
isc_trareqmis                        = 335544409;
isc_badhndcnt                        = 335544410;
isc_wrotpbver                        = 335544411;
isc_wroblrver                        = 335544412;
isc_wrodpbver                        = 335544413;
isc_blobnotsup                       = 335544414;
isc_badrelation                      = 335544415;
isc_nodetach                         = 335544416;
isc_notremote                        = 335544417;
isc_trainlim                         = 335544418;
isc_notinlim                         = 335544419;
isc_traoutsta                        = 335544420;
isc_connect_reject                   = 335544421;
isc_dbfile                           = 335544422;
isc_orphan                           = 335544423;
isc_no_lock_mgr                      = 335544424;
isc_ctxinuse                         = 335544425;
isc_ctxnotdef                        = 335544426;
isc_datnotsup                        = 335544427;
isc_badmsgnum                        = 335544428;
isc_badparnum                        = 335544429;
isc_virmemexh                        = 335544430;
isc_blocking_signal                  = 335544431;
isc_lockmanerr                       = 335544432;
isc_journerr                         = 335544433;
isc_keytoobig                        = 335544434;
isc_nullsegkey                       = 335544435;
isc_sqlerr                           = 335544436;
isc_wrodynver                        = 335544437;
isc_funnotdef                        = 335544438;
isc_funmismat                        = 335544439;
isc_bad_msg_vec                      = 335544440;
isc_bad_detach                       = 335544441;
isc_noargacc_read                    = 335544442;
isc_noargacc_write                   = 335544443;
isc_read_only                        = 335544444;
isc_ext_err                          = 335544445;
isc_non_updatable                    = 335544446;
isc_no_rollback                      = 335544447;
isc_bad_sec_info                     = 335544448;
isc_invalid_sec_info                 = 335544449;
isc_misc_interpreted                 = 335544450;
isc_update_conflict                  = 335544451;
isc_unlicensed                       = 335544452;
isc_obj_in_use                       = 335544453;
isc_nofilter                         = 335544454;
isc_shadow_accessed                  = 335544455;
isc_invalid_sdl                      = 335544456;
isc_out_of_bounds                    = 335544457;
isc_invalid_dimension                = 335544458;
isc_rec_in_limbo                     = 335544459;
isc_shadow_missing                   = 335544460;
isc_cant_validate                    = 335544461;
isc_cant_start_journal               = 335544462;
isc_gennotdef                        = 335544463;
isc_cant_start_logging               = 335544464;
isc_bad_segstr_type                  = 335544465;
isc_foreign_key                      = 335544466;
isc_high_minor                       = 335544467;
isc_tra_state                        = 335544468;
isc_trans_invalid                    = 335544469;
isc_buf_invalid                      = 335544470;
isc_indexnotdefined                  = 335544471;
isc_login                            = 335544472;
isc_invalid_bookmark                 = 335544473;
isc_bad_lock_level                   = 335544474;
isc_relation_lock                    = 335544475;
isc_record_lock                      = 335544476;
isc_max_idx                          = 335544477;
isc_jrn_enable                       = 335544478;
isc_old_failure                      = 335544479;
isc_old_in_progress                  = 335544480;
isc_old_no_space                     = 335544481;
isc_no_wal_no_jrn                    = 335544482;
isc_num_old_files                    = 335544483;
isc_wal_file_open                    = 335544484;
isc_bad_stmt_handle                  = 335544485;
isc_wal_failure                      = 335544486;
isc_walw_err                         = 335544487;
isc_logh_small                       = 335544488;
isc_logh_inv_version                 = 335544489;
isc_logh_open_flag                   = 335544490;
isc_logh_open_flag2                  = 335544491;
isc_logh_diff_dbname                 = 335544492;
isc_logf_unexpected_eof              = 335544493;
isc_logr_incomplete                  = 335544494;
isc_logr_header_small                = 335544495;
isc_logb_small                       = 335544496;
isc_wal_illegal_attach               = 335544497;
isc_wal_invalid_wpb                  = 335544498;
isc_wal_err_rollover                 = 335544499;
isc_no_wal                           = 335544500;
isc_drop_wal                         = 335544501;
isc_stream_not_defined               = 335544502;
isc_wal_subsys_error                 = 335544503;
isc_wal_subsys_corrupt               = 335544504;
isc_no_archive                       = 335544505;
isc_shutinprog                       = 335544506;
isc_range_in_use                     = 335544507;
isc_range_not_found                  = 335544508;
isc_charset_not_found                = 335544509;
isc_lock_timeout                     = 335544510;
isc_prcnotdef                        = 335544511;
isc_prcmismat                        = 335544512;
isc_wal_bugcheck                     = 335544513;
isc_wal_cant_expand                  = 335544514;
isc_codnotdef                        = 335544515;
isc_xcpnotdef                        = 335544516;
isc_except                           = 335544517;
isc_cache_restart                    = 335544518;
isc_bad_lock_handle                  = 335544519;
isc_jrn_present                      = 335544520;
isc_wal_err_rollover2                = 335544521;
isc_wal_err_logwrite                 = 335544522;
isc_wal_err_jrn_comm                 = 335544523;
isc_wal_err_expansion                = 335544524;
isc_wal_err_setup                    = 335544525;
isc_wal_err_ww_sync                  = 335544526;
isc_wal_err_ww_start                 = 335544527;
isc_shutdown                         = 335544528;
isc_existing_priv_mod                = 335544529;
isc_primary_key_ref                  = 335544530;
isc_primary_key_notnull              = 335544531;
isc_ref_cnstrnt_notfound             = 335544532;
isc_foreign_key_notfound             = 335544533;
isc_ref_cnstrnt_update               = 335544534;
isc_check_cnstrnt_update             = 335544535;
isc_check_cnstrnt_del                = 335544536;
isc_integ_index_seg_del              = 335544537;
isc_integ_index_seg_mod              = 335544538;
isc_integ_index_del                  = 335544539;
isc_integ_index_mod                  = 335544540;
isc_check_trig_del                   = 335544541;
isc_check_trig_update                = 335544542;
isc_cnstrnt_fld_del                  = 335544543;
isc_cnstrnt_fld_rename               = 335544544;
isc_rel_cnstrnt_update               = 335544545;
isc_constaint_on_view                = 335544546;
isc_invld_cnstrnt_type               = 335544547;
isc_primary_key_exists               = 335544548;
isc_systrig_update                   = 335544549;
isc_not_rel_owner                    = 335544550;
isc_grant_obj_notfound               = 335544551;
isc_grant_fld_notfound               = 335544552;
isc_grant_nopriv                     = 335544553;
isc_nonsql_security_rel              = 335544554;
isc_nonsql_security_fld              = 335544555;
isc_wal_cache_err                    = 335544556;
isc_shutfail                         = 335544557;
isc_check_constraint                 = 335544558;
isc_bad_svc_handle                   = 335544559;
isc_shutwarn                         = 335544560;
isc_wrospbver                        = 335544561;
isc_bad_spb_form                     = 335544562;
isc_svcnotdef                        = 335544563;
isc_no_jrn                           = 335544564;
isc_transliteration_failed           = 335544565;
isc_start_cm_for_wal                 = 335544566;
isc_wal_ovflow_log_required          = 335544567;
isc_text_subtype                     = 335544568;
isc_dsql_error                       = 335544569;
isc_dsql_command_err                 = 335544570;
isc_dsql_constant_err                = 335544571;
isc_dsql_cursor_err                  = 335544572;
isc_dsql_datatype_err                = 335544573;
isc_dsql_decl_err                    = 335544574;
isc_dsql_cursor_update_err           = 335544575;
isc_dsql_cursor_open_err             = 335544576;
isc_dsql_cursor_close_err            = 335544577;
isc_dsql_field_err                   = 335544578;
isc_dsql_internal_err                = 335544579;
isc_dsql_relation_err                = 335544580;
isc_dsql_procedure_err               = 335544581;
isc_dsql_request_err                 = 335544582;
isc_dsql_sqlda_err                   = 335544583;
isc_dsql_var_count_err               = 335544584;
isc_dsql_stmt_handle                 = 335544585;
isc_dsql_function_err                = 335544586;
isc_dsql_blob_err                    = 335544587;
isc_collation_not_found              = 335544588;
isc_collation_not_for_charset        = 335544589;
isc_dsql_dup_option                  = 335544590;
isc_dsql_tran_err                    = 335544591;
isc_dsql_invalid_array               = 335544592;
isc_dsql_max_arr_dim_exceeded        = 335544593;
isc_dsql_arr_range_error             = 335544594;
isc_dsql_trigger_err                 = 335544595;
isc_dsql_subselect_err               = 335544596;
isc_dsql_crdb_prepare_err            = 335544597;
isc_specify_field_err                = 335544598;
isc_num_field_err                    = 335544599;
isc_col_name_err                     = 335544600;
isc_where_err                        = 335544601;
isc_table_view_err                   = 335544602;
isc_distinct_err                     = 335544603;
isc_key_field_count_err              = 335544604;
isc_subquery_err                     = 335544605;
isc_expression_eval_err              = 335544606;
isc_node_err                         = 335544607;
isc_command_end_err                  = 335544608;
isc_index_name                       = 335544609;
isc_exception_name                   = 335544610;
isc_field_name                       = 335544611;
isc_token_err                        = 335544612;
isc_union_err                        = 335544613;
isc_dsql_construct_err               = 335544614;
isc_field_aggregate_err              = 335544615;
isc_field_ref_err                    = 335544616;
isc_order_by_err                     = 335544617;
isc_return_mode_err                  = 335544618;
isc_extern_func_err                  = 335544619;
isc_alias_conflict_err               = 335544620;
isc_procedure_conflict_error         = 335544621;
isc_relation_conflict_err            = 335544622;
isc_dsql_domain_err                  = 335544623;
isc_idx_seg_err                      = 335544624;
isc_node_name_err                    = 335544625;
isc_table_name                       = 335544626;
isc_proc_name                        = 335544627;
isc_idx_create_err                   = 335544628;
isc_wal_shadow_err                   = 335544629;
isc_dependency                       = 335544630;
isc_idx_key_err                      = 335544631;
isc_dsql_file_length_err             = 335544632;
isc_dsql_shadow_number_err           = 335544633;
isc_dsql_token_unk_err               = 335544634;
isc_dsql_no_relation_alias           = 335544635;
isc_indexname                        = 335544636;
isc_no_stream_plan                   = 335544637;
isc_stream_twice                     = 335544638;
isc_stream_not_found                 = 335544639;
isc_collation_requires_text          = 335544640;
isc_dsql_domain_not_found            = 335544641;
isc_index_unused                     = 335544642;
isc_dsql_self_join                   = 335544643;
isc_stream_bof                       = 335544644;
isc_stream_crack                     = 335544645;
isc_db_or_file_exists                = 335544646;
isc_invalid_operator                 = 335544647;
isc_conn_lost                        = 335544648;
isc_bad_checksum                     = 335544649;
isc_page_type_err                    = 335544650;
isc_ext_readonly_err                 = 335544651;
isc_sing_select_err                  = 335544652;
isc_psw_attach                       = 335544653;
isc_psw_start_trans                  = 335544654;
isc_invalid_direction                = 335544655;
isc_dsql_var_conflict                = 335544656;
isc_dsql_no_blob_array               = 335544657;
isc_dsql_base_table                  = 335544658;
isc_duplicate_base_table             = 335544659;
isc_view_alias                       = 335544660;
isc_index_root_page_full             = 335544661;
isc_dsql_blob_type_unknown           = 335544662;
isc_req_max_clones_exceeded          = 335544663;
isc_dsql_duplicate_spec              = 335544664;
isc_unique_key_violation             = 335544665;
isc_srvr_version_too_old             = 335544666;
isc_drdb_completed_with_errs         = 335544667;
isc_dsql_procedure_use_err           = 335544668;
isc_dsql_count_mismatch              = 335544669;
isc_blob_idx_err                     = 335544670;
isc_array_idx_err                    = 335544671;
isc_key_field_err                    = 335544672;
isc_no_delete                        = 335544673;
isc_del_last_field                   = 335544674;
isc_sort_err                         = 335544675;
isc_sort_mem_err                     = 335544676;
isc_version_err                      = 335544677;
isc_inval_key_posn                   = 335544678;
isc_no_segments_err                  = 335544679;
isc_crrp_data_err                    = 335544680;
isc_rec_size_err                     = 335544681;
isc_dsql_field_ref                   = 335544682;
isc_req_depth_exceeded               = 335544683;
isc_no_field_access                  = 335544684;
isc_no_dbkey                         = 335544685;
isc_jrn_format_err                   = 335544686;
isc_jrn_file_full                    = 335544687;
isc_dsql_open_cursor_request         = 335544688;
isc_ib_error                         = 335544689;
isc_cache_redef                      = 335544690;
isc_cache_too_small                  = 335544691;
isc_log_redef                        = 335544692;
isc_log_too_small                    = 335544693;
isc_partition_too_small              = 335544694;
isc_partition_not_supp               = 335544695;
isc_log_length_spec                  = 335544696;
isc_precision_err                    = 335544697;
isc_scale_nogt                       = 335544698;
isc_expec_short                      = 335544699;
isc_expec_long                       = 335544700;
isc_expec_ushort                     = 335544701;
isc_like_escape_invalid              = 335544702;
isc_svcnoexe                         = 335544703;
isc_net_lookup_err                   = 335544704;
isc_service_unknown                  = 335544705;
isc_host_unknown                     = 335544706;
isc_grant_nopriv_on_base             = 335544707;
isc_dyn_fld_ambiguous                = 335544708;
isc_dsql_agg_ref_err                 = 335544709;
isc_complex_view                     = 335544710;
isc_unprepared_stmt                  = 335544711;
isc_expec_positive                   = 335544712;
isc_dsql_sqlda_value_err             = 335544713;
isc_invalid_array_id                 = 335544714;
isc_extfile_uns_op                   = 335544715;
isc_svc_in_use                       = 335544716;
isc_err_stack_limit                  = 335544717;
isc_invalid_key                      = 335544718;
isc_net_init_error                   = 335544719;
isc_loadlib_failure                  = 335544720;
isc_network_error                    = 335544721;
isc_net_connect_err                  = 335544722;
isc_net_connect_listen_err           = 335544723;
isc_net_event_connect_err            = 335544724;
isc_net_event_listen_err             = 335544725;
isc_net_read_err                     = 335544726;
isc_net_write_err                    = 335544727;
isc_integ_index_deactivate           = 335544728;
isc_integ_deactivate_primary         = 335544729;
isc_cse_not_supported                = 335544730;
isc_tra_must_sweep                   = 335544731;
isc_unsupported_network_drive        = 335544732;
isc_io_create_err                    = 335544733;
isc_io_open_err                      = 335544734;
isc_io_close_err                     = 335544735;
isc_io_read_err                      = 335544736;
isc_io_write_err                     = 335544737;
isc_io_delete_err                    = 335544738;
isc_io_access_err                    = 335544739;
isc_udf_exception                    = 335544740;
isc_lost_db_connection               = 335544741;
isc_no_write_user_priv               = 335544742;
isc_token_too_long                   = 335544743;
isc_max_att_exceeded                 = 335544744;
isc_login_same_as_role_name          = 335544745;
isc_reftable_requires_pk             = 335544746;
isc_usrname_too_long                 = 335544747;
isc_password_too_long                = 335544748;
isc_usrname_required                 = 335544749;
isc_password_required                = 335544750;
isc_bad_protocol                     = 335544751;
isc_dup_usrname_found                = 335544752;
isc_usrname_not_found                = 335544753;
isc_error_adding_sec_record          = 335544754;
isc_error_modifying_sec_record       = 335544755;
isc_error_deleting_sec_record        = 335544756;
isc_error_updating_sec_db            = 335544757;
isc_sort_rec_size_err                = 335544758;
isc_bad_default_value                = 335544759;
isc_invalid_clause                   = 335544760;
isc_too_many_handles                 = 335544761;
isc_optimizer_blk_exc                = 335544762;
isc_invalid_string_constant          = 335544763;
isc_transitional_date                = 335544764;
isc_read_only_database               = 335544765;
isc_must_be_dialect_2_and_up         = 335544766;
isc_blob_filter_exception            = 335544767;
isc_exception_access_violation       = 335544768;
isc_exception_datatype_missalignment = 335544769;
isc_exception_array_bounds_exceeded  = 335544770;
isc_exception_float_denormal_operand = 335544771;
isc_exception_float_divide_by_zero   = 335544772;
isc_exception_float_inexact_result   = 335544773;
isc_exception_float_invalid_operand  = 335544774;
isc_exception_float_overflow         = 335544775;
isc_exception_float_stack_check      = 335544776;
isc_exception_float_underflow        = 335544777;
isc_exception_integer_divide_by_zero = 335544778;
isc_exception_integer_overflow       = 335544779;
isc_exception_unknown                = 335544780;
isc_exception_stack_overflow         = 335544781;
isc_exception_sigsegv                = 335544782;
isc_exception_sigill                 = 335544783;
isc_exception_sigbus                 = 335544784;
isc_exception_sigfpe                 = 335544785;
isc_ext_file_delete                  = 335544786;
isc_ext_file_modify                  = 335544787;
isc_adm_task_denied                  = 335544788;
isc_extract_input_mismatch           = 335544789;
isc_insufficient_svc_privileges      = 335544790;
isc_file_in_use                      = 335544791;
isc_service_att_err                  = 335544792;
isc_ddl_not_allowed_by_db_sql_dial   = 335544793;
isc_cancelled                        = 335544794;
isc_unexp_spb_form                   = 335544795;
isc_sql_dialect_datatype_unsupport   = 335544796;
isc_svcnouser                        = 335544797;
isc_depend_on_uncommitted_rel        = 335544798;
isc_svc_name_missing                 = 335544799;
isc_too_many_contexts                = 335544800;
isc_datype_notsup                    = 335544801;
isc_gfix_db_name                     = 335740929;
isc_gfix_invalid_sw                  = 335740930;
isc_gfix_incmp_sw                    = 335740932;
isc_gfix_replay_req                  = 335740933;
isc_gfix_pgbuf_req                   = 335740934;
isc_gfix_val_req                     = 335740935;
isc_gfix_pval_req                    = 335740936;
isc_gfix_trn_req                     = 335740937;
isc_gfix_full_req                    = 335740940;
isc_gfix_usrname_req                 = 335740941;
isc_gfix_pass_req                    = 335740942;
isc_gfix_subs_name                   = 335740943;
isc_gfix_wal_req                     = 335740944;
isc_gfix_sec_req                     = 335740945;
isc_gfix_nval_req                    = 335740946;
isc_gfix_type_shut                   = 335740947;
isc_gfix_retry                       = 335740948;
isc_gfix_retry_db                    = 335740951;
isc_gfix_exceed_max                  = 335740991;
isc_gfix_corrupt_pool                = 335740992;
isc_gfix_mem_exhausted               = 335740993;
isc_gfix_bad_pool                    = 335740994;
isc_gfix_trn_not_valid               = 335740995;
isc_gfix_unexp_eoi                   = 335741012;
isc_gfix_recon_fail                  = 335741018;
isc_gfix_trn_unknown                 = 335741036;
isc_gfix_mode_req                    = 335741038;
isc_gfix_opt_SQL_dialect             = 335741039;
isc_dsql_dbkey_from_non_table        = 336003074;
isc_dsql_transitional_numeric        = 336003075;
isc_dsql_dialect_warning_expr        = 336003076;
isc_sql_db_dialect_dtype_unsupport   = 336003077;
isc_isc_sql_dialect_conflict_num     = 336003079;
isc_dyn_role_does_not_exist          = 336068796;
isc_dyn_no_grant_admin_opt           = 336068797;
isc_dyn_user_not_role_member         = 336068798;
isc_dyn_delete_role_failed           = 336068799;
isc_dyn_grant_role_to_user           = 336068800;
isc_dyn_inv_sql_role_name            = 336068801;
isc_dyn_dup_sql_role                 = 336068802;
isc_dyn_kywd_spec_for_role           = 336068803;
isc_dyn_roles_not_supported          = 336068804;
isc_dyn_domain_name_exists           = 336068812;
isc_dyn_field_name_exists            = 336068813;
isc_dyn_dependency_exists            = 336068814;
isc_dyn_dtype_invalid                = 336068815;
isc_dyn_char_fld_too_small           = 336068816;
isc_dyn_invalid_dtype_conversion     = 336068817;
isc_dyn_dtype_conv_invalid           = 336068818;
isc_gbak_unknown_switch              = 336330753;
isc_gbak_page_size_missing           = 336330754;
isc_gbak_page_size_toobig            = 336330755;
isc_gbak_redir_ouput_missing         = 336330756;
isc_gbak_switches_conflict           = 336330757;
isc_gbak_unknown_device              = 336330758;
isc_gbak_no_protection               = 336330759;
isc_gbak_page_size_not_allowed       = 336330760;
isc_gbak_multi_source_dest           = 336330761;
isc_gbak_filename_missing            = 336330762;
isc_gbak_dup_inout_names             = 336330763;
isc_gbak_inv_page_size               = 336330764;
isc_gbak_db_specified                = 336330765;
isc_gbak_db_exists                   = 336330766;
isc_gbak_unk_device                  = 336330767;
isc_gbak_blob_info_failed            = 336330772;
isc_gbak_unk_blob_item               = 336330773;
isc_gbak_get_seg_failed              = 336330774;
isc_gbak_close_blob_failed           = 336330775;
isc_gbak_open_blob_failed            = 336330776;
isc_gbak_put_blr_gen_id_failed       = 336330777;
isc_gbak_unk_type                    = 336330778;
isc_gbak_comp_req_failed             = 336330779;
isc_gbak_start_req_failed            = 336330780;
isc_gbak_rec_failed                  = 336330781;
isc_gbak_rel_req_failed              = 336330782;
isc_gbak_db_info_failed              = 336330783;
isc_gbak_no_db_desc                  = 336330784;
isc_gbak_db_create_failed            = 336330785;
isc_gbak_decomp_len_error            = 336330786;
isc_gbak_tbl_missing                 = 336330787;
isc_gbak_blob_col_missing            = 336330788;
isc_gbak_create_blob_failed          = 336330789;
isc_gbak_put_seg_failed              = 336330790;
isc_gbak_rec_len_exp                 = 336330791;
isc_gbak_inv_rec_len                 = 336330792;
isc_gbak_exp_data_type               = 336330793;
isc_gbak_gen_id_failed               = 336330794;
isc_gbak_unk_rec_type                = 336330795;
isc_gbak_inv_bkup_ver                = 336330796;
isc_gbak_missing_bkup_desc           = 336330797;
isc_gbak_string_trunc                = 336330798;
isc_gbak_cant_rest_record            = 336330799;
isc_gbak_send_failed                 = 336330800;
isc_gbak_no_tbl_name                 = 336330801;
isc_gbak_unexp_eof                   = 336330802;
isc_gbak_db_format_too_old           = 336330803;
isc_gbak_inv_array_dim               = 336330804;
isc_gbak_xdr_len_expected            = 336330807;
isc_gbak_open_bkup_error             = 336330817;
isc_gbak_open_error                  = 336330818;
isc_gbak_missing_block_fac           = 336330934;
isc_gbak_inv_block_fac               = 336330935;
isc_gbak_block_fac_specified         = 336330936;
isc_gbak_missing_username            = 336330940;
isc_gbak_missing_password            = 336330941;
isc_gbak_missing_skipped_bytes       = 336330952;
isc_gbak_inv_skipped_bytes           = 336330953;
isc_gbak_err_restore_charset         = 336330965;
isc_gbak_err_restore_collation       = 336330967;
isc_gbak_read_error                  = 336330972;
isc_gbak_write_error                 = 336330973;
isc_gbak_db_in_use                   = 336330985;
isc_gbak_sysmemex                    = 336330990;
isc_gbak_restore_role_failed         = 336331002;
isc_gbak_role_op_missing             = 336331005;
isc_gbak_page_buffers_missing        = 336331010;
isc_gbak_page_buffers_wrong_param    = 336331011;
isc_gbak_page_buffers_restore        = 336331012;
isc_gbak_inv_size                    = 336331014;
isc_gbak_file_outof_sequence         = 336331015;
isc_gbak_join_file_missing           = 336331016;
isc_gbak_stdin_not_supptd            = 336331017;
isc_gbak_stdout_not_supptd           = 336331018;
isc_gbak_bkup_corrupt                = 336331019;
isc_gbak_unk_db_file_spec            = 336331020;
isc_gbak_hdr_write_failed            = 336331021;
isc_gbak_disk_space_ex               = 336331022;
isc_gbak_size_lt_min                 = 336331023;
isc_gbak_svc_name_missing            = 336331025;
isc_gbak_not_ownr                    = 336331026;
isc_gbak_mode_req                    = 336331031;
isc_gsec_cant_open_db                = 336723983;
isc_gsec_switches_error              = 336723984;
isc_gsec_no_op_spec                  = 336723985;
isc_gsec_no_usr_name                 = 336723986;
isc_gsec_err_add                     = 336723987;
isc_gsec_err_modify                  = 336723988;
isc_gsec_err_find_mod                = 336723989;
isc_gsec_err_rec_not_found           = 336723990;
isc_gsec_err_delete                  = 336723991;
isc_gsec_err_find_del                = 336723992;
isc_gsec_err_find_disp               = 336723996;
isc_gsec_inv_param                   = 336723997;
isc_gsec_op_specified                = 336723998;
isc_gsec_pw_specified                = 336723999;
isc_gsec_uid_specified               = 336724000;
isc_gsec_gid_specified               = 336724001;
isc_gsec_proj_specified              = 336724002;
isc_gsec_org_specified               = 336724003;
isc_gsec_fname_specified             = 336724004;
isc_gsec_mname_specified             = 336724005;
isc_gsec_lname_specified             = 336724006;
isc_gsec_inv_switch                  = 336724008;
isc_gsec_amb_switch                  = 336724009;
isc_gsec_no_op_specified             = 336724010;
isc_gsec_params_not_allowed          = 336724011;
isc_gsec_incompat_switch             = 336724012;
isc_gsec_inv_username                = 336724044;
isc_gsec_inv_pw_length               = 336724045;
isc_gsec_db_specified                = 336724046;
isc_gsec_db_admin_specified          = 336724047;
isc_gsec_db_admin_pw_specified       = 336724048;
isc_gsec_sql_role_specified          = 336724049;
isc_license_no_file                  = 336789504;
isc_license_op_specified             = 336789523;
isc_license_op_missing               = 336789524;
isc_license_inv_switch               = 336789525;
isc_license_inv_switch_combo         = 336789526;
isc_license_inv_op_combo             = 336789527;
isc_license_amb_switch               = 336789528;
isc_license_inv_parameter            = 336789529;
isc_license_param_specified          = 336789530;
isc_license_param_req                = 336789531;
isc_license_syntx_error              = 336789532;
isc_license_dup_id                   = 336789534;
isc_license_inv_id_key               = 336789535;
isc_license_err_remove               = 336789536;
isc_license_err_update               = 336789537;
isc_license_err_convert              = 336789538;
isc_license_err_unk                  = 336789539;
isc_license_svc_err_add              = 336789540;
isc_license_svc_err_remove           = 336789541;
isc_license_eval_exists              = 336789563;
isc_gstat_unknown_switch             = 336920577;
isc_gstat_retry                      = 336920578;
isc_gstat_wrong_ods                  = 336920579;
isc_gstat_unexpected_eof             = 336920580;
isc_gstat_open_err                   = 336920605;
isc_gstat_read_err                   = 336920606;
isc_gstat_sysmemex                   = 336920607;
isc_err_max                          = 671;

//**********************************************/
//* Dynamic Data Definition Language operators */
//**********************************************/

//******************/
//* Version number */
//******************/

isc_dyn_version_1                =  1;
isc_dyn_eoc                      = -1;

//******************************/
//* Operations (may be nested) */
//******************************/

isc_dyn_begin                    =   2;
isc_dyn_end                      =   3;
isc_dyn_if                       =   4;
isc_dyn_def_database             =   5;
isc_dyn_def_global_fld           =   6;
isc_dyn_def_local_fld            =   7;
isc_dyn_def_idx                  =   8;
isc_dyn_def_rel                  =   9;
isc_dyn_def_sql_fld              =  10;
isc_dyn_def_view                 =  12;
isc_dyn_def_trigger              =  15;
isc_dyn_def_security_class       = 120;
isc_dyn_def_dimension            = 140;
isc_dyn_def_generator            =  24;
isc_dyn_def_function             =  25;
isc_dyn_def_filter               =  26;
isc_dyn_def_function_arg         =  27;
isc_dyn_def_shadow               =  34;
isc_dyn_def_trigger_msg          =  17;
isc_dyn_def_file                 =  36;
isc_dyn_mod_database             =  39;
isc_dyn_mod_rel                  =  11;
isc_dyn_mod_global_fld           =  13;
isc_dyn_mod_idx                  = 102;
isc_dyn_mod_local_fld            =  14;
isc_dyn_mod_sql_fld              = 216;
isc_dyn_mod_view                 =  16;
isc_dyn_mod_security_class       = 122;
isc_dyn_mod_trigger              = 113;
isc_dyn_mod_trigger_msg          =  28;
isc_dyn_delete_database          =  18;
isc_dyn_delete_rel               =  19;
isc_dyn_delete_global_fld        =  20;
isc_dyn_delete_local_fld         =  21;
isc_dyn_delete_idx               =  22;
isc_dyn_delete_security_class    = 123;
isc_dyn_delete_dimensions        = 143;
isc_dyn_delete_trigger           =  23;
isc_dyn_delete_trigger_msg       =  29;
isc_dyn_delete_filter            =  32;
isc_dyn_delete_function          =  33;
isc_dyn_delete_shadow            =  35;
isc_dyn_grant                    =  30;
isc_dyn_revoke                   =  31;
isc_dyn_def_primary_key          =  37;
isc_dyn_def_foreign_key          =  38;
isc_dyn_def_unique               =  40;
isc_dyn_def_procedure            = 164;
isc_dyn_delete_procedure         = 165;
isc_dyn_def_parameter            = 135;
isc_dyn_delete_parameter         = 136;
isc_dyn_mod_procedure            = 175;
isc_dyn_def_log_file             = 176;
isc_dyn_def_cache_file           = 180;
isc_dyn_def_exception            = 181;
isc_dyn_mod_exception            = 182;
isc_dyn_del_exception            = 183;
isc_dyn_drop_log                 = 194;
isc_dyn_drop_cache               = 195;
isc_dyn_def_default_log          = 202;

//***********************/
//* View specific stuff */
//***********************/

isc_dyn_view_blr                 = 43;
isc_dyn_view_source              = 44;
isc_dyn_view_relation            = 45;
isc_dyn_view_context             = 46;
isc_dyn_view_context_name        = 47;

//**********************/
//* Generic attributes */
//**********************/

isc_dyn_rel_name                =   50;
isc_dyn_fld_name                =   51;
isc_dyn_new_fld_name            =  215;
isc_dyn_idx_name                =   52;
isc_dyn_description             =   53;
isc_dyn_security_class          =   54;
isc_dyn_system_flag             =   55;
isc_dyn_update_flag             =   56;
isc_dyn_prc_name                =  166;
isc_dyn_prm_name                =  137;
isc_dyn_sql_object              =  196;
isc_dyn_fld_character_set_name  =  174;

//********************************/
//* Relation specific attributes */
//********************************/

isc_dyn_rel_dbkey_length         =  61;
isc_dyn_rel_store_trig           =  62;
isc_dyn_rel_modify_trig          =  63;
isc_dyn_rel_erase_trig           =  64;
isc_dyn_rel_store_trig_source    =  65;
isc_dyn_rel_modify_trig_source   =  66;
isc_dyn_rel_erase_trig_source    =  67;
isc_dyn_rel_ext_file             =  68;
isc_dyn_rel_sql_protection       =  69;
isc_dyn_rel_constraint           = 162;
isc_dyn_delete_rel_constraint    = 163;

//************************************/
//* Global field specific attributes */
//************************************/

isc_dyn_fld_type                 =  70;
isc_dyn_fld_length               =  71;
isc_dyn_fld_scale                =  72;
isc_dyn_fld_sub_type             =  73;
isc_dyn_fld_segment_length       =  74;
isc_dyn_fld_query_header         =  75;
isc_dyn_fld_edit_string          =  76;
isc_dyn_fld_validation_blr       =  77;
isc_dyn_fld_validation_source    =  78;
isc_dyn_fld_computed_blr         =  79;
isc_dyn_fld_computed_source      =  80;
isc_dyn_fld_missing_value        =  81;
isc_dyn_fld_default_value        =  82;
isc_dyn_fld_query_name           =  83;
isc_dyn_fld_dimensions           =  84;
isc_dyn_fld_not_null             =  85;
isc_dyn_fld_precision            =  86;
isc_dyn_fld_char_length          = 172;
isc_dyn_fld_collation            = 173;
isc_dyn_fld_default_source       = 193;
isc_dyn_del_default              = 197;
isc_dyn_del_validation           = 198;
isc_dyn_single_validation        = 199;
isc_dyn_fld_character_set        = 203;

//***********************************/
//* Local field specific attributes */
//***********************************/

isc_dyn_fld_source               = 90;
isc_dyn_fld_base_fld             = 91;
isc_dyn_fld_position             = 92;
isc_dyn_fld_update_flag          = 93;

//*****************************/
//* Index specific attributes */
//*****************************/

isc_dyn_idx_unique               = 100;
isc_dyn_idx_inactive             = 101;
isc_dyn_idx_type                 = 103;
isc_dyn_idx_foreign_key          = 104;
isc_dyn_idx_ref_column           = 105;
isc_dyn_idx_statistic            = 204;

//*******************************/
//* Trigger specific attributes */
//*******************************/

isc_dyn_trg_type                 = 110;
isc_dyn_trg_blr                  = 111;
isc_dyn_trg_source               = 112;
isc_dyn_trg_name                 = 114;
isc_dyn_trg_sequence             = 115;
isc_dyn_trg_inactive             = 116;
isc_dyn_trg_msg_number           = 117;
isc_dyn_trg_msg                  = 118;

//**************************************/
//* Security Class specific attributes */
//**************************************/

isc_dyn_scl_acl                  = 121;
isc_dyn_grant_user               = 130;
isc_dyn_grant_proc               = 186;
isc_dyn_grant_trig               = 187;
isc_dyn_grant_view               = 188;
isc_dyn_grant_options            = 132;
isc_dyn_grant_user_group         = 205;

//**********************************/
//* Dimension specific information */
//**********************************/

isc_dyn_dim_lower                = 141;
isc_dyn_dim_upper                = 142;

//****************************/
//* File specific attributes */
//****************************/

isc_dyn_file_name                = 125;
isc_dyn_file_start               = 126;
isc_dyn_file_length              = 127;
isc_dyn_shadow_number            = 128;
isc_dyn_shadow_man_auto          = 129;
isc_dyn_shadow_conditional       = 130;

//********************************/
//* Log file specific attributes */
//********************************/

isc_dyn_log_file_sequence        = 177;
isc_dyn_log_file_partitions      = 178;
isc_dyn_log_file_serial          = 179;
isc_dyn_log_file_overflow        = 200;
isc_dyn_log_file_raw             = 201;

//***************************/
//* Log specific attributes */
//***************************/

isc_dyn_log_group_commit_wait    = 189;
isc_dyn_log_buffer_size          = 190;
isc_dyn_log_check_point_length   = 191;
isc_dyn_log_num_of_buffers       = 192;

//********************************/
//* Function specific attributes */
//********************************/

isc_dyn_function_name        = 145;
isc_dyn_function_type        = 146;
isc_dyn_func_module_name     = 147;
isc_dyn_func_entry_point     = 148;
isc_dyn_func_return_argument = 149;
isc_dyn_func_arg_position    = 150;
isc_dyn_func_mechanism       = 151;
isc_dyn_filter_in_subtype    = 152;
isc_dyn_filter_out_subtype   = 153;

isc_dyn_description2           = 154;
isc_dyn_fld_computed_source2   = 155;
isc_dyn_fld_edit_string2       = 156;
isc_dyn_fld_query_header2      = 157;
isc_dyn_fld_validation_source2 = 158;
isc_dyn_trg_msg2               = 159;
isc_dyn_trg_source2            = 160;
isc_dyn_view_source2           = 161;
isc_dyn_xcp_msg2               = 184;

//*********************************/
//* Generator specific attributes */
//*********************************/

isc_dyn_generator_name = 95;
isc_dyn_generator_id   = 96;

//*********************************/
//* Procedure specific attributes */
//*********************************/

isc_dyn_prc_inputs  = 167;
isc_dyn_prc_outputs = 168;
isc_dyn_prc_source  = 169;
isc_dyn_prc_blr     = 170;
isc_dyn_prc_source2 = 171;

//*********************************/
//* Parameter specific attributes */
//*********************************/

isc_dyn_prm_number = 138;
isc_dyn_prm_type   = 139;

//********************************/
//* Relation specific attributes */
//********************************/

isc_dyn_xcp_msg = 185;

//**********************************************/
//* Cascading referential integrity values     */
//**********************************************/

isc_dyn_foreign_key_update  = 205;
isc_dyn_foreign_key_delete  = 206;
isc_dyn_foreign_key_cascade = 207;
isc_dyn_foreign_key_default = 208;
isc_dyn_foreign_key_null    = 209;
isc_dyn_foreign_key_none    = 210;

//***********************/
//* SQL role values     */
//***********************/
isc_dyn_def_sql_role        = 211;
isc_dyn_sql_role_name       = 212;
isc_dyn_grant_admin_options = 213;
isc_dyn_del_sql_role        = 214;

//****************************/
//* Last $dyn value assigned */
//****************************/

isc_dyn_last_dyn_value = 216;

//******************************************/
//* Array slice description language (SDL) */
//******************************************/

isc_sdl_eoc           = -1;
isc_sdl_version1      =  1;
isc_sdl_relation      =  2;
isc_sdl_rid           =  3;
isc_sdl_field         =  4;
isc_sdl_fid           =  5;
isc_sdl_struct        =  6;
isc_sdl_variable      =  7;
isc_sdl_scalar        =  8;
isc_sdl_tiny_integer  =  9;
isc_sdl_short_integer = 10;
isc_sdl_long_integer  = 11;
isc_sdl_literal       = 12;
isc_sdl_add           = 13;
isc_sdl_subtract      = 14;
isc_sdl_multiply      = 15;
isc_sdl_divide        = 16;
isc_sdl_negate        = 17;
isc_sdl_eql           = 18;
isc_sdl_neq           = 19;
isc_sdl_gtr           = 20;
isc_sdl_geq           = 21;
isc_sdl_lss           = 22;
isc_sdl_leq           = 23;
isc_sdl_and           = 24;
isc_sdl_or            = 25;
isc_sdl_not           = 26;
isc_sdl_while         = 27;
isc_sdl_assignment    = 28;
isc_sdl_label         = 29;
isc_sdl_leave         = 30;
isc_sdl_begin         = 31;
isc_sdl_end           = 32;
isc_sdl_do3           = 33;
isc_sdl_do2           = 34;
isc_sdl_do1           = 35;
isc_sdl_element       = 36;

//********************************************/
//* International text interpretation values */
//********************************************/

isc_interp_eng_ascii = 0;
isc_interp_jpn_sjis  = 5;
isc_interp_jpn_euc   = 6;

//*******************/
//* SQL definitions */
//*******************/

// not nullable       nullable          ;
SQL_VARYING   = 448;  SQL_VARYING_   = 449;
SQL_TEXT      = 452;  SQL_TEXT_      = 453;
SQL_DOUBLE    = 480;  SQL_DOUBLE_    = 481;
SQL_FLOAT     = 482;  SQL_FLOAT_     = 483;
SQL_LONG      = 496;  SQL_LONG_      = 497;
SQL_SHORT     = 500;  SQL_SHORT_     = 501;
SQL_DATE      = 510;  SQL_DATE_      = 511;
SQL_BLOB      = 520;  SQL_BLOB_      = 521;
SQL_D_FLOAT   = 530;  SQL_D_FLOAT_   = 531;
SQL_ARRAY     = 540;  SQL_ARRAY_     = 541;
SQL_QUAD      = 550;  SQL_QUAD_      = 551;

SQL_TIMESTAMP = 510;  SQL_TIMESTAMP_ = 511;
SQL_TYPE_TIME = 560;  SQL_TYPE_TIME_ = 561;
SQL_TYPE_DATE = 570;  SQL_TYPE_DATE_ = 571;
SQL_INT64     = 580;  SQL_INT64_     = 581;
SQL_BOOLEAN   = 590;  SQL_BOOLEAN_   = 591;

//*****************/
//* Blob Subtypes */
//*****************/

//* types less than zero are reserved for customer use */

isc_blob_untyped = 0;

//* internal subtypes */

isc_blob_text    = 1;
isc_blob_blr     = 2;
isc_blob_acl     = 3;
isc_blob_ranges  = 4;
isc_blob_summary = 5;
isc_blob_format  = 6;
isc_blob_tra     = 7;
isc_blob_extfile = 8;

//* the range 20-30 is reserved for dBASE and Paradox types */

isc_blob_formatted_memo = 20;
isc_blob_paradox_ole    = 21;
isc_blob_graphic        = 22;
isc_blob_dbase_ole      = 23;
isc_blob_typed_binary   = 24;

{------------------------------------------------------------------------------}
{ DBF Format Records  Dbase III + header definition                            }
{------------------------------------------------------------------------------}

type

TDBFHeader = record
   VersionNumber: byte;      { version number (03h or 83h ) }
   LastUpdateYear: byte;
   LastUpdateMonth: byte;
   LastUpdateDay: byte;
   NumberOfRecords: longint; { number of record in database }
   BytesInHeader: smallint;  { number of bytes in header }
   BytesInRecords: smallint; { number of bytes in records }
   ReservedInHeader: array[1..20] of ansichar;
end;

TDBFField = record
   FieldName: array[1..11] of ansichar;
   FieldType: ansichar;     { type of field - C,N,D,L,etc. }
   fld_addr: longint;   { not used }
   Width: byte;         { total width of this field }
   Decimals: byte;      { digits to right of decimal }
   MultiUser: smallint; { reserved }
   WorkAreaID: byte;    { Work area ID }
   MUser: smallint;     { reserved }
   SetFields: byte;     { SET_FIELDS flag }
   Reserved: array[1..4] of byte;
end;

function XSQLDA_LENGTH( n: smallint ): longint;

implementation

function XSQLDA_LENGTH( n: smallint ): longint;
begin
  Result := ( SizeOf( XSQLDA ) + (n - 1) * SizeOf( XSQLVAR ) );
end;

{ IB7 Support }  
{
function XSQLDA_LENGTH_V2( n: smallint ): longint;
begin
  Result := ( SizeOf( XSQLDA ) + (n - 1) * SizeOf( XSQLVAR_V2 ) );
end;
}

procedure add_spb_length(var p: pbyte; length: integer);
(*
#define ADD_SPB_LENGTH(p, length)    {*(p)++ = (length); \
                         *(p)++ = (length) >> 8;}
*)
begin
  p^ := byte(length);
  Inc (p);
  p^ := byte(length shr 8);
  Inc (p);
end;

procedure add_spb_numeric(var p: pbyte; data: integer);
(*
#define ADD_SPB_NUMERIC(p, data)    {*(p)++ = (data); \
                         *(p)++ = (data) >> 8; \
                     *(p)++ = (data) >> 16; \
                     *(p)++ = (data) >> 24;}
*)
begin
  p^ := byte(data);
  Inc (p);
  p^ := byte(data shr 8);
  Inc (p);
  p^ := byte(data shr 16);
  Inc (p);
  p^ := byte(data shr 24);
  Inc (p);
end;

end.

