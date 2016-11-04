
{                                                                              }
{ IB_Constants.inc                                                             }
{                                                                              }

{***************************************************************}
{                                                               }
{          IB Objects Components and Resources Library          }
{                                                               }
{          Copyright (C) 1996-2007 Jason Wharton                }
{          and CPS - Computer Programming Solutions, Mesa, AZ   }
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
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  14-Apr-2005                                                                 }
{     Added some more E_DDL_* string UDF parameter checks in IB_Metadata.      }
{     Added IBO_FBCLIENT_DLL as the name for the Firebird v1.5 client, and     }
{     changed the library failure message to be more generic.                  }
{                                                                              }
{******************************************************************************}

{$IFDEF FPC}
const
  {$IFDEF Windows}
  IBO_GDS32 = 'gds32.' + dynlibs.SharedSuffix;
  IBO_FBCLIENT_DLL = 'fbclient.' + dynlibs.SharedSuffix;
  IBO_FBEMBED_DLL = 'fbembed.' + dynlibs.SharedSuffix;
  {$ELSE}
  IBO_GDS32 = 'libgds.' + dynlibs.SharedSuffix;
  IBO_FBCLIENT_DLL = 'libfbclient.' + dynlibs.SharedSuffix;
  IBO_FBEMBED_DLL = 'libfbembed.' + dynlibs.SharedSuffix;
  {$ENDIF}
{$ELSE}
var
// This is the name of the InterBase Client DLL (API) that is used.
// Use the unit IB_Session511.pas as the first item in the uses clause
// of your project to change this variable to use an alternate GDS32.DLL
// client library.
  IBO_GDS32: string = 'gds32.dll';
  IBO_FBCLIENT_DLL: string = 'fbclient.dll';
  IBO_FBEMBED_DLL: string = 'fbembed.dll';
{$ENDIF FPC}
  IBO_DefaultMessageFile: string = '';

const

// Version information
  IBO_VERSION_MAJOR = '4';
  IBO_VERSION_MINOR = '9';
  IBO_VERSION_RELEASE = '14';
  IBO_VERSION_BUILD = '16';

// IB_SQL and component editor information
  IBO_BASEKEY = 'Software\CPS\IBO';
  IBO_HelpFile = 'IBO.HLP';

// Internal settings
  IBO_RDB = 'RDB$';
  IBO_DB_KEY = 'DB_KEY';

// Parameter syntax
  IBO_BINDLINK = 'BIND_';
  IBO_MASTERLINK = 'MLNK_';
  IBO_KEYLINK = 'KLNK_';
  IBO_ORDLINK = 'OLNK_';
  IBO_PARAMETER = 'PRM_';
  IBO_QBE_PARAMETER = 'QBE_';
  IBO_LOCATE_PARAMETER = 'LOC_';
  IBO_RNGBEG = 'RBEG_';
  IBO_RNGEND = 'REND_';
  IBO_KEYROWNUM = 'KEYROWNUM';

// General flags
  IBO_TRUE = 'TRUE';
  IBO_FALSE = 'FALSE';
  IBO_BOOL_TRUE = 'T';
  IBO_BOOL_FALSE = 'F';
  IBO_AND = #13#10'  AND ';

// Connection parameter names. ( Don't translate these. )
  IBO_USER_NAME          = 'USER NAME';
  IBO_PASSWORD           = 'PASSWORD';
  IBO_LOCAL_PASSWORD     = 'LOCAL PASSWORD';
  IBO_SERVER_NAME        = 'SERVER NAME';
  IBO_SERVER             = 'SERVER';
  IBO_PATH               = 'PATH';
  IBO_LICENSE            = 'LICENSE';
  IBO_SYSDBA             = 'SYSDBA';
  IBO_ENCRYPT_KEY        = 'ENCRYPT KEY';
  IBO_CHARACTER_SET      = 'CHARACTER SET';
  IBO_MESSAGE_FILE       = 'MESSAGE FILE';
  IBO_FORCED_WRITES      = 'FORCED WRITES';
  IBO_BUFFERS            = 'BUFFERS';
  IBO_PAGE_SIZE          = 'PAGE SIZE';
  IBO_SWEEP_INTERVAL     = 'SWEEP INTERVAL';
  IBO_RESERVE_PAGE_SPACE = 'RESERVE PAGE SPACE';
  IBO_PROTOCOL           = 'PROTOCOL';
  IBO_DB_KEY_SCOPE       = 'DB_KEY SCOPE';
  IBO_SQL_DIALECT        = 'SQL DIALECT';
  IBO_SQL_ROLE_NAME_     = 'SQL ROLE NAME'; // This setting is being deprecated.
  IBO_ROLE_NAME          = 'ROLE NAME';
  IBO_ROLE_              = 'ROLE'; // This setting is being deprecated.

// Connection parameter values.
  IBO_PROTOCOL_LOCAL    = 'LOCAL';
  IBO_PROTOCOL_NETBEUI  = 'NETBEUI';
  IBO_PROTOCOL_TCP_IP   = 'TCP/IP';
  IBO_PROTOCOL_NOVELL   = 'NOVELL';
  IBO_DB_KEY_SCOPE_CONN = 'CONNECTION';
  IBO_DB_KEY_SCOPE_TRAN = 'TRANSACTION';

// BDE Alias settings
  BDE_DRIVER_FLAGS               = 'DRIVER FLAGS';
  BDE_TRACE_MODE                 = 'TRACE MODE';
  BDE_SERVER_NAME                = IBO_SERVER_NAME;
  BDE_USER_NAME                  = IBO_USER_NAME;
  BDE_PASSWORD                   = IBO_PASSWORD;
  BDE_OPEN_MODE                  = 'OPEN MODE';
  BDE_SCHEMA_CACHE_SIZE          = 'SCHEMA CACHE SIZE';
  BDE_LANGDRIVER                 = 'LANGDRIVER';
  BDE_SQLQRYMODE                 = 'SQLQRYMODE';
  BDE_SQLPASSTHRU_MODE           = 'SQLPASSTHRU MODE';
  BDE_SCHEMA_CACHE_TIME          = 'SCHEMA CACHE TIME';
  BDE_MAX_ROWS                   = 'MAX ROWS';
  BDE_BATCH_COUNT                = 'BATCH COUNT';
  BDE_ENABLE_SCHEMA_CACHE        = 'ENABLE SCHEMA CACHE';
  BDE_SCHEMA_CACHE_DIR           = 'SCHEMA CACHE DIR';
  BDE_ENABLE_BCD                 = 'ENABLE BCD';
  BDE_BLOBS_TO_CACHE             = 'BLOBS TO CACHE';
  BDE_BLOB_SIZE                  = 'BLOB SIZE';
  BDE_ROLE_NAME                  = IBO_ROLE_NAME;
  BDE_WAIT_ON_LOCKS              = 'WAIT ON LOCKS';
  BDE_COMMIT_RETAIN              = 'COMMIT RETAIN';

// BDE Alias settings
  BDE_SHARED_AUTOCOMMIT      = 'SHARED AUTOCOMMIT';
  BDE_SHARED_NOAUTOCOMMIT    = 'SHARED NOAUTOCOMMIT';
  BDE_NOT_SHARED             = 'NOT SHARED';

// These are various settings that can be made in the ColumnAttributes property.
  IBO_BINARY      = 'BINARY';     // Flag a CHAR or VARCHAR column as binary.
  IBO_BLANKISNULL = 'BLANKISNULL';// Used by TIB_Column class when assigning a
                                  // blank string to a Fields member.
  IBO_BOOLEAN     = 'BOOLEAN';    // Used to tell what values are used to make
                                  // this a boolean column.
  IBO_COMPUTED    = 'COMPUTED';   // It tells that the column is actually a
                                  // COMPUTED BY derived column.
  IBO_CURRENCY    = 'CURRENCY';   // Flag to indicate a column contains currency
  IBO_NOCASE      = 'NOCASE';     // Flag to set a case insensitive search field
  IBO_NODATE      = 'NODATE';
  IBO_NOSOUNDEX   = 'NOSOUNDEX';  // Disable soundex processing in a dataset
  IBO_NOTIME      = 'NOTIME';
  IBO_NOTRAILING  = 'NOTRAILING'; // Flag to use STARTING on literal strings
  IBO_NOTREQUIRED = 'NOTREQUIRED';
  IBO_REQUIRED    = 'REQUIRED';
  IBO_SOUNDEX     = 'SOUNDEX';    // Flag to set a SoundEx search field
  IBO_BCD         = 'BCD';        // Flag to force a colum to be TIBOBCDField
  IBO_NOBCD       = 'NOBCD';      // Flag to force a colum to be TIBOFloatField
  IBO_YESCASE     = 'YESCASE';    // Flag to override CN.DefaultNoCase
  IBO_YESLIKE     = 'YESLIKE';    // Flag to use LIKE on literal strings
  IBO_YESTRAILING = 'YESTRAILING';// Flag to override CN.DefaultNoTrailing
  IBO_MODIFIABLE  = 'MODIFIABLE'; // Used to make Calculated Fields Modifiable
  IBO_MINVAL      = 'MINVAL';     // Used to set numeric columns minimum value
  IBO_MAXVAL      = 'MAXVAL';     // Used to set numeric columns maximum value
  IBO_DOMAIN      = 'DOMAIN';     // Used to assign a field or param to a DOMAIN

// Character set names.
  IBO_UTF8        = 'UTF8';       // Tells if UTF8 transliteration is needed.
  IBO_UNICODE_FSS = 'UNICODE_FSS';// Tells if UTF8 transliteration is needed.
  IBO_ISO8859_1   = 'ISO8859_1';  // Tells if NCHAR was used to define the col.
  IBO_OCTETS      = 'OCTETS';     // Tells if OCTETS characterset.
  IBO_NONE        = 'NONE';       // Tells if NONE transliteration is needed.
  IBO_ASCII       = 'ASCII';      // Tells if ASCII transliteration is needed.
  IBO_WIN1250     = 'WIN1250';
  IBO_WIN1251     = 'WIN1251';
  IBO_WIN1252     = 'WIN1252';
  IBO_SJIS_0208   = 'SJIS_0208';
  IBO_EUCJ_0208   = 'EUCJ_0208';
  IBO_KSC_5601    = 'KSC_5601';
  IBO_BIG_5       = 'BIG_5';
  IBO_GB_2312     = 'GB_2312';
  IBO_GBK         = 'GBK';
  IBO_CP943C      = 'CP943C';
  IBO_GB18030     = 'GB18030';

// Character set IDs.
  IBO_UNDEFINED_ID   = -1;  // These values may be subject to change.
  IBO_NONE_ID        =  0;
  IBO_OCTETS_ID      =  1;
  IBO_ASCII_ID       =  2;
  IBO_UNICODE_FSS_ID =  3;
  IBO_UTF8_ID        =  4;
  IBO_SJIS_0208_ID   =  5;
  IBO_EUCJ_0208_ID   =  6;
  IBO_ISO8859_1_ID   = 21;
  IBO_KSC_5601_ID    = 44;
  IBO_WIN1250_ID     = 51;
  IBO_WIN1251_ID     = 52;
  IBO_WIN1252_ID     = 53;
  IBO_BIG_5_ID       = 56;
  IBO_GB_2312_ID     = 57;
  IBO_GBK_ID         = 67;
  IBO_CP943C_ID      = 68;
  IBO_GB18030_ID     = 69;

// Used by the SeachPanel from the FieldsReadOnly property.
  IBO_NOINSERT = 'NOINSERT';
  IBO_NOEDIT   = 'NOEDIT';
  IBO_NOSEARCH = 'NOSEARCH';

// Events
  IBO_MaxEvents = 15;
  IBO_EventLength = 64;

// Global Defaults  ( Do NOT localize these )
  G_DefaultRowHeight = 17;

  DTEncode_DateDelimit     = '/';
  DTEncode_TimeDelimit     = ':';
  DTEncode_DateTimeDelimit = ' ';
  DTEncode_DecodeFormat    = '%.4u/%.2u/%.2u %.2u:%.2u:%.2u.%.3u0';
  DTEncode_DateTimeFormat  = 'YYYY"/"MM"/"DD" "HH":"NN":"SS".0000"';
  DT_DateFormat            = 'MM"/"dd"/"yyyy';
  DT_TimeFormat            = 'hh":"nn":"ss';

// Registry keys
  R_Settings = 'Settings';
  R_EV_RegSettingsKey = 'Events';

// Query properties
  QP_RIGHT    = 'RIGHT';
  QP_LEFT     = 'LEFT';
  QP_CENTER   = 'CENTER';
  QP_UPPER    = 'UPPER';
  QP_LOWER    = 'LOWER';
  QP_PROPER   = 'PROPER';
  QP_NORMAL   = 'NORMAL';
  QP_NONE     = 'NONE';
  QP_ALL      = 'ALL';
  QP_BOTH     = 'BOTH';
  QP_SENTENCE = 'SENTENCE';
  QP_TRUE     = 'TRUE';
  QP_FALSE    = 'FALSE';
  QP_HintStr: array [ 1..29 ] of string = ( 'EDIT',
                                            'INSERT',
                                            'DELETE',
                                            'REFRESH',
                                            'REFRESHKEYS',
                                            'REFRESHROWS',
                                            'POSTSEARCH',
                                            'CANCELSEARCH',
                                            'POSTEDIT',
                                            'CANCELEDIT',
                                            'POSTINSERT',
                                            'CANCELINSERT',
                                            'POSTDELETE',
                                            'CANCELDELETE',
                                            'POST',
                                            'CANCEL',
                                            'FIRST',
                                            'PRIOR',
                                            'NEXT',
                                            'LAST',
                                            'JUMPBCK',
                                            'JUMPFWD',
                                            'ORDER',
                                            'LAST_CRITERIA',
                                            'SEARCH',
                                            'SAVE_CRITERIA',
                                            'CLEAR_CRITERIA',
                                            'RECALL_CRITERIA',
                                            'COUNT' );

