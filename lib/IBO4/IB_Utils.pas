{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{  IB_Utils                                                                    }
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
{  Rolf Bredemeier <r.bredemeier@jenz.de>                                      }
{  24-Mar-2011                                                                 }
{    Fixed problem with Int64ScaledToStr() for Delphi 2009+ wide string.       }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  25-Jan-02                                                                   }
{      Further adjustments to the Integer and Currency conversion methods that }
{      I added earlier (whoops forgot to document that).  Attempting to make   }
{      it so that assignments use statistical/bankers rounding for assignment. }
{                                                                              }
{ Dirk Schiffler <ds@rcs.de>                                                   }
{ 11/11/2001                                                                   }
{    date and time format strings and constants are move to IB_Constants       }
{                                                                              }
{ Jason Wharton <jason@ibobjects.com>                                          }
{ 6/04/2009                                                                    }
{    Added code from the MD5.pas unit due to package conflicts I was having.   }
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}

unit
  IB_Utils;

interface

uses
{$IFNDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LCLProc,
{$ENDIF}
  SysUtils, Classes, Graphics, Controls, Grids, Registry,

  IB_Header,
  IB_Constants;

// -----------------------------------------------------------------------------------------------
//
//                                 MD5 Message-Digest for Delphi
//
//                                 Delphi 4 Unit implementing the
//                      RSA Data Security, Inc. MD5 Message-Digest Algorithm
//
//                          Implementation of Ronald L. Rivest's RFC 1321
//
//                      Copyright © 1997-1999 Medienagentur Fichtner & Meyer
//                                  Written by Matthias Fichtner
//
// -----------------------------------------------------------------------------------------------
//               See RFC 1321 for RSA Data Security's copyright and license notice!
// -----------------------------------------------------------------------------------------------
//
//     14-Jun-97  mf  Implemented MD5 according to RFC 1321                           RFC 1321
//     16-Jun-97  mf  Initial release of the compiled unit (no source code)           RFC 1321
//     28-Feb-99  mf  Added MD5Match function for comparing two digests               RFC 1321
//     13-Sep-99  mf  Reworked the entire unit                                        RFC 1321
//     17-Sep-99  mf  Reworked the "Test Driver" project                              RFC 1321
//     19-Sep-99  mf  Release of sources for MD5 unit and "Test Driver" project       RFC 1321
//
// -----------------------------------------------------------------------------------------------
//                   The latest release of md5.pas will always be available from
//                  the distribution site at: http://www.fichtner.net/delphi/md5/
// -----------------------------------------------------------------------------------------------
//                       Please send questions, bug reports and suggestions
//                      regarding this code to: mfichtner@fichtner-meyer.com
// -----------------------------------------------------------------------------------------------
//                        This code is provided "as is" without express or
//                     implied warranty of any kind. Use it at your own risk.
// -----------------------------------------------------------------------------------------------
type
  MD5Count   = array[0..1 ] of DWORD;
  MD5State   = array[0..3 ] of DWORD;
  MD5Block   = array[0..15] of DWORD;
  MD5CBits   = array[0..7 ] of byte;
  MD5Digest  = array[0..15] of byte;
  MD5Buffer  = array[0..63] of byte;
  MD5Context = record
    State: MD5State;
    Count: MD5Count;
    Buffer: MD5Buffer;
  end;
procedure MD5Init( var Context: MD5Context );
procedure MD5Update( var Context: MD5Context;
                         Input: pansichar;
                         Length: dword );
procedure MD5Final( var Context: MD5Context;
                    var Digest: MD5Digest );
function MD5String( M: RawByteString ): MD5Digest;
//function MD5File(N: string): MD5Digest;
function MD5Print( D: MD5Digest ): string;
function MD5Match( D1, D2: MD5Digest ): boolean;
function MD5Str( M: RawByteString ): RawByteString;
function HMAC_MD5_FP( Text, Key: RawByteString ): RawByteString;
// -----------------------------------------------------------------------------------------------

function YearFromDateTime( ADateTime: TDateTime ): word;
function DateTimeToEncodeString( ADateTime: TDateTime ): string;
function EncodeStringToDateTime( AValue: string ): TDateTime;
function GetEnvVariable( const AName: string ): string;
function GetLineEndPos( const AStr: string;
                          var ALen: integer ): integer;

{ File: match.pas
  Author: Kevin Boylan

  This code is meant to allow wildcard pattern matches.
  It is VERY useful for matching filename wildcard patterns.
  It allows unix grep-like pattern comparisons, for instance:

    ?           Matches any single characer
    *           Matches any contiguous characters
    [abc]      Matches a or b or c at that position
    [^abc]    Matches anything but a or b or c at that position
    [!abc]    Ditto
    [a-e]      Matches a through e at that position

    'ma?ch.*'    -Would match match.exe, mavch.dat, march.on, etc
    'this [e-n]s a [!zy]est' - Would match 'this is a test',
                               but would not match 'this as a yest'

  This is a Delphi VCL translation from C code that was downloaded from CIS.
  C code was written by J. Kerceval and released to public domain 02/20/1991.
  This code is of course also public domain. I would appreciate it if you would
  let me know if you find any bugs.  I would also appreciate any notes sent my
  way letting me know if you find it useful.  My email address is

    CIS:            75221,1057
    Internet:    75221.1057@compuserve.com}

const
  { match defines }
  MATCH_PATTERN = 6;
  MATCH_LITERAL = 5;
  MATCH_RANGE   = 4;
  MATCH_ABORT   = 3;
  MATCH_END     = 2;
  MATCH_VALID   = 1;
  { pattern defines }
  PATTERN_VALID = 0;
  PATTERN_ESC   = -1;
  PATTERN_RANGE = -2;
  PATTERN_CLOSE = -3;
  PATTERN_EMPTY = -4;
  { character defines }
  MATCH_CHAR_SINGLE    = '?';
  MATCH_CHAR_KLEENE_CLOSURE = '*';
  MATCH_CHAR_RANGE_OPEN    = '[';
  MATCH_CHAR_RANGE = '-';
  MATCH_CHAR_RANGE_CLOSE = ']';
  MATCH_CHAR_CARAT_NEGATE = '^';
  MATCH_CHAR_EXCLAMATION_NEGATE    = '!';

  function IsMatch( pattern, text: String ): Boolean;
  function matche( pattern, text: String ): Integer;
  function match_after_star( pattern, text: String ): Integer;

{: SoundEx algorithm - supplied by Telesis Computing.
<br><br>
The TC_SoundEx and TC_SoundExMax are extensions to the SoundEx concept -
creating values which can be used to allow string values that "sound" alike
to be sorted together.  This is a Pascal implementation of the C++ code which
I use in my own C++Builder application and Interbase UDF.  (Obviously the
code used by your application MUST match the code used by the server!)
<br><br>
I have supplied this code for convenience.  You can use it or not as you like.
<br><br>
For those who would rather a more standard SoundEx implementation, you may
like to look at the FreeUDF library written by Gregory Deatz which provides
(in Pascal) code which can be used in both a UDF and your application.
<br><br>
Besides the FreeUDF library there is also some information on the Interbase
web-site which goes into how and why the SoundEx algorithm works.  I won't
try and repeat that here.
<br><br>
My extensions to the SoundEx algorithm have two main purposes...
<br><br>
    1. By implementing a full 32bit value I can use 8 or 9 significant
    characters from the source string making the result much more specific
    for longer strings.  (Less duplication in the indexes.)
<br><br>
    2. By implementing the SoundEx and SoundExMax algorithms correctly it
    is possible to perform a select on a string that "sounds" like it "starts"
    with a particular text.  Essentially this is a partial key style match
    but using the "fuzzy" matching of SoundEx.
<br><br>
These implementations return integer (32bit) values.  If you are going to use
these in conjunction with the TIB_Connection.OnSoundExParse and
TIB_Connection.OnSoundExMaxParse then you will need to include the following
code in the resulting event handler...
<br><br>
    ResultStr := IntToStr( TC_SoundEx( SourceStr ) );
<br><br>
Implementation made at the bottom of this module.
}
function TC_SoundEx( SourceStr: AnsiString ): longint;
function TC_SoundExMax( SourceStr: AnsiString ): longint;
// End TC_SoundEx Interface stuff

function metaph( a: String; lg: integer ): String;

procedure DrawShallowEdge( ACanvas: TCanvas;
                           ARect: TRect;
                           Options: TGridOptions );

function EncryptIBPass( Password: ansistring ): ansistring;
{$IFDEF IBO_VCL2009_OR_GREATER}
overload;
function EncryptIBPass( Password: string ): string; overload;
{$ENDIF}

function BinaryToHexText( aBufPtr: pointer;
                          aBufLen: integer ): RawByteString;
procedure HexTextToBinary( const aHexText: RawByteString;
                                 aBufPtr: pointer;
                                 aBufLen: integer = 0 );
function HexTextToRawString( const aHexText: RawByteString ): RawByteString;
function RawStringToHexText( const aRawString: RawByteString ): RawByteString;

const
{: See JumbleString function description for details.}
    JumblePrefix_v01: RawByteString = '.JuMbLe.01.';

var
{: Registry key used by GetJumbleKey for storing/retrieving
the key value used to obscure saved passwords.  Note that this has been
setup as a variable so that applications can initialise the value at
startup to some alternative value if desired.}
    JumbleRegKey: HKEY = HKEY_CURRENT_USER;
{: Registry base path used by GetJumbleKey for storing/retrieving
the key value used to obscure saved passwords. Note that this has been
setup as a variable so that applications can initialise the value at
startup to some alternative value if desired.}
    JumbleRegPath: String = IBO_BASEKEY + '\Security';

{: GetJumbleKey is used to retrieve an encryption/decryption key for
the JumbleString and UnJumbleString functions.
<br><br>
TIB_Connection uses this when PasswordRemembered=true.  This allows
TIB_Connection to obscure the password when it is stored in the DFM (and
resulting executable).
<br><br>
Before this capability was introduced the password was stored in plain text
and unless you remembered to clear the password it was possible to distribute
the executable which stored the password to your database.
<br><br>
It is IMPORTANT to realise that this protection is not entirely secure.  In
particular the key value which is used to obscure the password is stored in
the registry.  So if you intend to set PasswordRemembered=true then you
need to be aware that anyone that can access your registry can find the key
which will reveal the obscured password!
<br><br>
The default registry location used by this function is defined in the
JumbleRegKey and JumbleRegPath vars.  Within that path it creates
two entries: Level and JumbleKey.
<br><br>
Level defines the level of security used.  It has three possible values...
<br>
0 = disabled.  Saved passwords will be stored in plain text.
<br>
1 = use default key.  The encrypt/decrypt processes will use an internal
default key value - the same for all IBO users.  This may be useful if
you regularly share projects and want the password to be distributed.
<br>
2 = use the 'JumbleKey' value as the key.  This is the default, this
will make it more difficult (but not impossible) for someone to extract
your password distributed in DFM or executable files.
<br><br>
JumbleKey is the key value used to encrypt and decrypt passwords obscured by
TIB_Connection when Level is set to '2'.  When first used this value is a
randomly generated string, so all users should have a different value.
If you intend to distribute applications with the password stored in the
executable, you must either change the Level to 0 or 1 (the same on all
installations), or you must update the JumbleKey value to be the same in
all installations, or supply the password yourself from a different
property or resource.
<br>
<br>
If Level is set to a value < 0 then the registry entries will be reset to
their defaults (and the JumbleKey regenerated as a new random entry).  If
JumbleKey is deleted or set to a blank value, and Level = 2, then the value
will be regenerated to a new random string.  In either case any previously
saved passwords will no longer be able to be read, unless you update
JumbleKey to it previous value.
<br>
<br>
Passing in a value for aDefaultSecLevel provides the initial level when the key
is created in the registry storing the jumble key data. If this value is not
provided then it uses level 2, which encorporates a randomly generated key.
}
function GetJumbleKey( aRegistry: TRegistry = nil;
                       aDefaultSecLevel: integer = 2 ): RawByteString;

{: JumbleString algorithm - supplied by Telesis Computing.
<br><br>
JumbleString / UnJumbleString is a very basic encryption algorithm.
I repeat VERY BASIC!  It is not secure and definitely vulnerable to a fairly
simple brute force attack.  For this reason I call the procedures "Jumble"
and "UnJumble" rather than encrypt/decrypt so that no-one gets the wrong idea.
<br><br>
The intended use of these algorithms is simply to obscure data so that
it is not directly human readable.  Someone will have to actually put
some work into retrieving the true value.
<br><br>
This has been implemented for the "PasswordRemembered" property of
TIB_Connection so that passwords are not human readable when stored in DFM
(and therefore executable) files.
<br><br>
The functions use a prefix to the jumbled value.  This allows
the UnJumble function to identify values which have not been jumbled,
and so return the original value.  (Which allows this to be used in
instances where previous data may not have been jumbled.)
<br><br>
Prefix = '.JuMbLe.01.' = version 01 jumble
<br>
The additional idea behind the prefix is that extensions to the function
can be added to upgrade its capability later.  So in the future a prefix
of '.JuMbLe.02.' may appear which provides more sophisticated encryption.
The global constant 'JumblePreference' will be used to choose which
algorithm will be implemented by the JumbleString function by default.
While UnJumbleString will simply read the prefix value to determine how
a particular string should be unjumbled.
<br><br>
So a string line 'abcdef' will be returned from UnJumbleString directly
whereas a value like '.JuMbLe.01.abcdef' will have the value 'abcdef'
unjumbled.
<br><br>
Note:  ANY time the prefix value is passed to the UnJumble function as the
beginning of a string it will try to unjumble it.  So it will not be possible
to see an unjumbled password that begins with this value.  This should be
highly unlikely - and should only be a problem when converting passwords from
previously unjumbled state to the new jumbled state.  Since Interbase passwords
are only significant to 8 characters anyway, it should be even less likely
that we will see a problem with the prefix.
<br><br>
Note 2:  JumbleString will detect an already jumbled value and will not
try to jumble it a second time.
<br>
<br>
If a blank string is provided as the aKeyPhrase then no jumble or unjumble
takes place.  The aValue parameter is simply returned as it is.
<br><br>
aAlgorithm provides a parameter to express which jumble algorithm to use.
The only acceptable values at this stage are 0 and 1.
Using a 0 will cause no jumble to take place returning the
original aValue passed in, the same as if aKeyPhrase is blank.
<br><br><br><br>
Note to anyone wishing to update these functions.  May I suggest that, if
you intend to implement a more sophisticated encrytion algorithm, you
use the KeyPhrase supplied to the function as the source for a Hash function
that will feed the necessary number of bits into the actual encryption
algorithm.  Such an approach keeps the interface simple and consistent,
minimising the need to change other areas of the source.
}
function JumbleString( const aValue: string;
                       const aKeyPhrase: RawByteString;
                           aAlgorithm: integer = 1 {JumblePreference} ): string;

{: See description of JumbleString function for details. }
function UnJumbleString( const aValue: string;
                         const aKeyPhrase: RawByteString ): string;

function GetCharIDFromCharSet( ACharSet: string ): smallint;

function iboEncodeA( const aString: string;
                     const aCharSet: string = '' ): RawByteString; overload
                                {$IFDEF IBO_VCL2009_OR_GREATER} inline {$ENDIF};
function iboEncodeW( const aString: widestring;
                     const aCharSet: string = '' ): RawByteString; overload
                                {$IFDEF IBO_VCL2009_OR_GREATER} inline {$ENDIF};
function iboDecodeA( const aRawBytes: RawByteString;
                     const aCharSet: string = '' ): string; overload
                                 {$IFDEF IBO_VCL2009_OR_GREATER} inline{$ENDIF};
function iboDecodeW( const aRawBytes: RawByteString;
                     const aCharSet: string = '' ): widestring; overload
                                 {$IFDEF IBO_VCL2009_OR_GREATER} inline{$ENDIF};

function iboEncodeA( const aCharID: smallint;
                     const aString: string ): RawByteString; overload
                                {$IFDEF IBO_VCL2009_OR_GREATER} inline {$ENDIF};
function iboEncodeW( const aCharID: smallint;
                     const aString: widestring ): RawByteString; overload
                                {$IFDEF IBO_VCL2009_OR_GREATER} inline {$ENDIF};
{$IFDEF IBO_VCL2009_OR_GREATER}
function iboEncodeU( const aCharID: smallint;
                     const aString: UnicodeString ): RawByteString; overload inline;
{$ENDIF}
function iboDecodeA( const aCharID: smallint;
                     const aRawBytes: RawByteString ): String; overload
                                 {$IFDEF IBO_VCL2009_OR_GREATER} inline{$ENDIF};
function iboDecodeW( const aCharID: smallint;
                     const aRawBytes: RawByteString ): WideString; overload
                                 {$IFDEF IBO_VCL2009_OR_GREATER} inline{$ENDIF};
{$IFDEF IBO_VCL2009_OR_GREATER}
function iboDecodeU( const aCharID: smallint;
                     const aRawBytes: RawByteString ): UnicodeString; overload inline;
{$ENDIF}
{: This is the function used to check/convert input characters to particular
case.  PrevChar is the character preceeding the NewChar in the destination
string.  ChChase specifies the case to which you want NewChar converted. }
function ConvCharCase( PrevChar, NewChar: ansichar; ChCase: integer ): ansichar;
{$IFDEF IBO_VCL2009_OR_GREATER}
overload;
function ConvCharCase( PrevChar, NewChar: char; ChCase: integer ): char;
overload;
{$ENDIF}

procedure IB_ReallocMem( var Ptr: pointer; OldSize, NewSize: longint );
function isc_decode_TDateTime( const Src: pisc_quad ): TDateTime;
procedure isc_encode_TDateTime( const Src: TDateTime; const Dst: pisc_quad );
function isc_quad_equal( const Q1, Q2: isc_quad ): boolean;
function isc_quad_is_zero( const Q1: isc_quad ): boolean;
function isc_quad_string( const AQuad: isc_quad ): string;

function ScaleExtended( const AVal: extended; AScale: smallint ): extended;
function IntegerToCurrency( const AVal: integer; AScale: smallint ): currency;
function Int64ToCurrency( AVal: ISC_INT64; AScale: smallint ): currency;
function ExtendedToInt64( AVal: extended; AScale: smallint ): ISC_INT64;
function ExtendedToInteger( AVal: extended; AScale: smallint ): integer;
function ExtendedToSmallint( AVal: extended; AScale: smallint ): smallint;
function CurrencyToInteger( AVal: currency; AScale: smallint ): integer;
function CurrencyToSmallint( AVal: currency; AScale: smallint ): smallint;
function CurrencyToInt64( AVal: currency; AScale: smallint ): ISC_INT64;
function StrToInt64Scaled( const AValue: string; AScale: integer ): int64;
function Int64ScaledToStr( const AValue: int64; AScale: integer ): string;

procedure IncPointer( var P : Pointer; Delta : Integer);

function GetFullIdentName( AComponent: TComponent;
                           IncludeClass: boolean = true ): string;

{------------------------------------------------------------------------------}
{: These are functions that allow compatibility between FPC and Delphi in using
UTF8. In Delphi mode this functions calls Delphi's standart functions Length,
Pos, Insert, Delete, UpperCase and LowerCase. In FPC mode it call its analogs
from LCLProc (UTF8Length, UTF8Pos etc.)}

function iboLength(const str: string) : integer;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboPos(const SearchForText, SearchInText: string) : integer;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboCopy(const s: string; StartCharIndex, CharCount: Integer): string;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
procedure iboDelete(var s: String; StartCharIndex, CharCount: Integer);
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
procedure iboInsert(const source: String; var s: string; StartCharIndex: Integer);
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboLowerCase(const s: String): String;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboUpperCase(const s: String): String;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
{$IFDEF IBO_VCL2009_OR_GREATER}
function iboLength(const str: ansistring) : integer;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboPos(const SearchForText, SearchInText: ansistring) : integer;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboCopy(const s: ansistring; StartCharIndex, CharCount: Integer): ansistring;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
procedure iboDelete(var s: ansistring; StartCharIndex, CharCount: Integer);
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
procedure iboInsert(const source: ansistring; var s: ansistring; StartCharIndex: Integer);
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboLowerCase(const s: ansistring): ansistring;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
function iboUpperCase(const s: ansistring): ansistring;
                      {$IFDEF IBO_VCL2009_OR_GREATER} inline; overload;{$ENDIF}
{$ENDIF}
{------------------------------------------------------------------------------}

implementation

uses
  IB_Components, Unixpass;

procedure IncPointer( var P: Pointer; Delta: Integer);
                                 {$IFDEF IBO_VCL2009_OR_GREATER} inline;{$ENDIF}
begin
{$IFDEF FPC}
  Inc(PByte(P),Delta);
{$ELSE}
  Inc(longint(P),Delta);
{$ENDIF}
end;

// -----------------------------------------------------------------------------------------------
// Code from md5.pas unit. See above for credits.
// -----------------------------------------------------------------------------------------------

function HMAC_MD5_FP( Text, Key: RawByteString ): RawByteString;
var
  s: RawByteString;
  ipad, opad: RawByteString;
  idata, odata: RawByteString;
  n: Integer;
  I: byte;
const
  Digits: array[0..15] of ansichar =
    ( '0', '1', '2', '3', '4',
      '5', '6', '7', '8', '9',
      'A', 'B', 'C', 'D', 'E', 'F' );
begin
  if {ibo}Length( Key ) > 64 then
    Key := MD5Str( Key );
  SetLength( ipad,  64 );
  SetLength( opad,  64 );
  SetLength( idata, 64 + {ibo}Length( Text ));
  SetLength( odata, 64 + 16 );
  for n := 1 to 64 do
  begin
    ipad [n] := #$36;
    opad [n] := #$5C;
    idata[n] := #$36;
    odata[n] := #$5C;
  end;
  for n := 1 to {ibo}Length(Key) do
  begin
    ipad [n] := ansichar( Byte( ipad[n] ) xor Byte( Key[n] ));
    opad [n] := ansichar( Byte( opad[n] ) xor Byte( Key[n] ));
    idata[n] := ansichar( Byte( ipad[n] ) and $FF );
    odata[n] := ansichar( Byte( opad[n] ) and $FF );
  end;
  for n := 1 to {ibo}Length( Text ) do
    idata[ n + 64] := ansichar( byte( Text[n] ) and $FF );
  s := MD5Str( idata );
  for n := 1 to 16 do
    odata[64+n] := s[n];
  s := MD5Str( odata );
  Result := '';
  for I := 1 to 16 do
    Result := Result + Digits[(byte(s[I]) shr 4) and $0f] +
                       Digits[(byte(s[I])      ) and $0f];
end;

function F(x, y, z: DWORD): DWORD;
begin
  Result := (x and y) or ((not x) and z);
end;

function G(x, y, z: DWORD): DWORD;
begin
  Result := (x and z) or (y and (not z));
end;

function H(x, y, z: DWORD): DWORD;
begin
  Result := x xor y xor z;
end;

function I(x, y, z: DWORD): DWORD;
begin
  Result := y xor (x or (not z));
end;

procedure rot(var x: DWORD; n: BYTE);
begin
  x := (x shl n) or (x shr (32 - n));
end;

procedure FF(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
  inc(a, F(b, c, d) + x + ac);
  rot(a, s);
  inc(a, b);
end;

procedure GG(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
  inc(a, G(b, c, d) + x + ac);
  rot(a, s);
  inc(a, b);
end;

procedure HH(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
  inc(a, H(b, c, d) + x + ac);
  rot(a, s);
  inc(a, b);
end;

procedure II(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
  inc(a, I(b, c, d) + x + ac);
  rot(a, s);
  inc(a, b);
end;

// -----------------------------------------------------------------------------------------------

// Encode Count bytes at Source into (Count / 4) DWORDs at Target
procedure Encode( Source, Target: pointer; Count: dword );
var
  S: PByte;
  T: PDWORD;
  I: dword;
begin
  S := Source;
  T := Target;
  for I := 1 to Count div 4 do
  begin
    T^ := S^;
    inc(S);
    T^ := T^ or (S^ shl 8);
    inc(S);
    T^ := T^ or (S^ shl 16);
    inc(S);
    T^ := T^ or (S^ shl 24);
    inc(S);
    inc(T);
  end;
end;

// Decode Count DWORDs at Source into (Count * 4) Bytes at Target
procedure Decode(Source, Target: pointer; Count: dword);
var
  S: PDWORD;
  T: PByte;
  I: dword;
begin
  S := Source;
  T := Target;
  for I := 1 to Count do
  begin
    T^ := S^ and $ff;
    inc(T);
    T^ := (S^ shr 8) and $ff;
    inc(T);
    T^ := (S^ shr 16) and $ff;
    inc(T);
    T^ := (S^ shr 24) and $ff;
    inc(T);
    inc(S);
  end;
end;

// Transform State according to first 64 bytes at Buffer
procedure Transform( Buffer: pointer; var State: MD5State );
var
  a, b, c, d: DWORD;
  Block: MD5Block;
begin
  Encode(Buffer, @Block, 64);
  a := State[0];
  b := State[1];
  c := State[2];
  d := State[3];
  FF (a, b, c, d, Block[ 0],  7, $d76aa478);
  FF (d, a, b, c, Block[ 1], 12, $e8c7b756);
  FF (c, d, a, b, Block[ 2], 17, $242070db);
  FF (b, c, d, a, Block[ 3], 22, $c1bdceee);
  FF (a, b, c, d, Block[ 4],  7, $f57c0faf);
  FF (d, a, b, c, Block[ 5], 12, $4787c62a);
  FF (c, d, a, b, Block[ 6], 17, $a8304613);
  FF (b, c, d, a, Block[ 7], 22, $fd469501);
  FF (a, b, c, d, Block[ 8],  7, $698098d8);
  FF (d, a, b, c, Block[ 9], 12, $8b44f7af);
  FF (c, d, a, b, Block[10], 17, $ffff5bb1);
  FF (b, c, d, a, Block[11], 22, $895cd7be);
  FF (a, b, c, d, Block[12],  7, $6b901122);
  FF (d, a, b, c, Block[13], 12, $fd987193);
  FF (c, d, a, b, Block[14], 17, $a679438e);
  FF (b, c, d, a, Block[15], 22, $49b40821);
  GG (a, b, c, d, Block[ 1],  5, $f61e2562);
  GG (d, a, b, c, Block[ 6],  9, $c040b340);
  GG (c, d, a, b, Block[11], 14, $265e5a51);
  GG (b, c, d, a, Block[ 0], 20, $e9b6c7aa);
  GG (a, b, c, d, Block[ 5],  5, $d62f105d);
  GG (d, a, b, c, Block[10],  9, $02441453);
  GG (c, d, a, b, Block[15], 14, $d8a1e681);
  GG (b, c, d, a, Block[ 4], 20, $e7d3fbc8);
  GG (a, b, c, d, Block[ 9],  5, $21e1cde6);
  GG (d, a, b, c, Block[14],  9, $c33707d6);
  GG (c, d, a, b, Block[ 3], 14, $f4d50d87);
  GG (b, c, d, a, Block[ 8], 20, $455a14ed);
  GG (a, b, c, d, Block[13],  5, $a9e3e905);
  GG (d, a, b, c, Block[ 2],  9, $fcefa3f8);
  GG (c, d, a, b, Block[ 7], 14, $676f02d9);
  GG (b, c, d, a, Block[12], 20, $8d2a4c8a);
  HH (a, b, c, d, Block[ 5],  4, $fffa3942);
  HH (d, a, b, c, Block[ 8], 11, $8771f681);
  HH (c, d, a, b, Block[11], 16, $6d9d6122);
  HH (b, c, d, a, Block[14], 23, $fde5380c);
  HH (a, b, c, d, Block[ 1],  4, $a4beea44);
  HH (d, a, b, c, Block[ 4], 11, $4bdecfa9);
  HH (c, d, a, b, Block[ 7], 16, $f6bb4b60);
  HH (b, c, d, a, Block[10], 23, $bebfbc70);
  HH (a, b, c, d, Block[13],  4, $289b7ec6);
  HH (d, a, b, c, Block[ 0], 11, $eaa127fa);
  HH (c, d, a, b, Block[ 3], 16, $d4ef3085);
  HH (b, c, d, a, Block[ 6], 23, $04881d05);
  HH (a, b, c, d, Block[ 9],  4, $d9d4d039);
  HH (d, a, b, c, Block[12], 11, $e6db99e5);
  HH (c, d, a, b, Block[15], 16, $1fa27cf8);
  HH (b, c, d, a, Block[ 2], 23, $c4ac5665);
  II (a, b, c, d, Block[ 0],  6, $f4292244);
  II (d, a, b, c, Block[ 7], 10, $432aff97);
  II (c, d, a, b, Block[14], 15, $ab9423a7);
  II (b, c, d, a, Block[ 5], 21, $fc93a039);
  II (a, b, c, d, Block[12],  6, $655b59c3);
  II (d, a, b, c, Block[ 3], 10, $8f0ccc92);
  II (c, d, a, b, Block[10], 15, $ffeff47d);
  II (b, c, d, a, Block[ 1], 21, $85845dd1);
  II (a, b, c, d, Block[ 8],  6, $6fa87e4f);
  II (d, a, b, c, Block[15], 10, $fe2ce6e0);
  II (c, d, a, b, Block[ 6], 15, $a3014314);
  II (b, c, d, a, Block[13], 21, $4e0811a1);
  II (a, b, c, d, Block[ 4],  6, $f7537e82);
  II (d, a, b, c, Block[11], 10, $bd3af235);
  II (c, d, a, b, Block[ 2], 15, $2ad7d2bb);
  II (b, c, d, a, Block[ 9], 21, $eb86d391);
  inc(State[0], a);
  inc(State[1], b);
  inc(State[2], c);
  inc(State[3], d);
end;

// -----------------------------------------------------------------------------------------------

// Initialize given Context
procedure MD5Init(var Context: MD5Context);
begin
  with Context do
  begin
    State[0] := $67452301;
    State[1] := $efcdab89;
    State[2] := $98badcfe;
    State[3] := $10325476;
    Count[0] := 0;
    Count[1] := 0;
    FillChar(Buffer, SizeOf(MD5Buffer), #0);
  end;
end;

// Update given Context to include Length bytes of Input
procedure MD5Update( var Context: MD5Context;
                         Input: pansichar;
                         Length: dword );
var
  Index: dword;
  PartLen: dword;
  I: dword;
begin
  with Context do
  begin
    Index := (Count[0] shr 3) and $3f;
    inc(Count[0], Length shl 3);
    if Count[0] < (Length shl 3) then
      inc(Count[1]);
    inc(Count[1], Length shr 29);
  end;
  PartLen := 64 - Index;
  if Length >= PartLen then
  begin
    Move( Input^, Context.Buffer[Index], PartLen );
    Transform( @Context.Buffer, Context.State );
    I := PartLen;
    while I + 63 < Length do
    begin
      Transform( @Input[I], Context.State );
      inc( I, 64 );
    end;
    Index := 0;
  end
  else
    I := 0;
  Move( Input[I], Context.Buffer[Index], PartLen );
end;

var
  PADDING: MD5Buffer = (
    $80, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00 );
  
// Finalize given Context, create Digest and zeroize Context
procedure MD5Final(var Context: MD5Context; var Digest: MD5Digest);
var
  Bits: MD5CBits;
  Index: dword;
  PadLen: dword;
begin
  Decode( @Context.Count, @Bits, 2 );
  Index := ( Context.Count[0] shr 3 ) and $3f;
  if Index < 56 then
    PadLen := 56 - Index
  else
    PadLen := 120 - Index;
  MD5Update( Context, @PADDING, PadLen );
  MD5Update( Context, @Bits,    8      );
  Decode( @Context.State, @Digest, 4 );
 // ZeroMemory( @Context, SizeOf( MD5Context ));
  FillChar(Context, SizeOf( MD5Context ), #0);
end;

// -----------------------------------------------------------------------------------------------

// Create digest of given Message
function MD5String( M: RawByteString ): MD5Digest;
var
  Context: MD5Context;
begin
  MD5Init(Context{%H-});
  MD5Update(Context, pansichar(M), {ibo}Length(M));
  MD5Final(Context, Result);
end;

function MD5Str(M: RawByteString): RawByteString;
var
  Res: MD5Digest;
  ii: integer;
begin
  Res := MD5String( M );
  SetLength( Result, 16 );
  for ii := 1 to 16 do
    Result[ii] := ansichar(Res[ii-1]);
end;

// Create digest of file with given Name
(*
function MD5File( N: string ): MD5Digest;
var
  FileHandle: THandle;
  MapHandle: THandle;
  ViewPointer: pointer;
  Context: MD5Context;
begin
  MD5Init( Context );
{$IFDEF IBO_VCL2009_OR_GREATER}
  FileHandle := CreateFileW(
{$ELSE}
  FileHandle := CreateFileA(
{$ENDIF}
                             pchar( N ),
                             GENERIC_READ,
                             FILE_SHARE_READ or FILE_SHARE_WRITE,
                             nil,
                             OPEN_EXISTING,
                             FILE_ATTRIBUTE_NORMAL or FILE_FLAG_SEQUENTIAL_SCAN,
                             0 );
  if FileHandle <> INVALID_HANDLE_VALUE then
  try
    MapHandle := CreateFileMapping( FileHandle, nil, PAGE_READONLY, 0, 0, nil );
    if MapHandle <> 0 then
    try
      ViewPointer := MapViewOfFile( MapHandle, FILE_MAP_READ, 0, 0, 0 );
      if ViewPointer <> nil then
      try
        MD5Update( Context, ViewPointer, GetFileSize( );
//        MD5Update( Context, ViewPointer, GetFileSize( FileHandle, nil ));
      finally
        UnmapViewOfFile( ViewPointer );
      end;
    finally
      FileClose(MapHandle ); { *Converted from CloseHandle*  }
    end;
  finally
    FileClose(FileHandle ); { *Converted from CloseHandle*  }
  end;
  MD5Final( Context, Result );
end;
*)

// Create hex representation of given Digest
function MD5Print( D: MD5Digest ): string;
var
  I: byte;
  tmpAnsiStr: ansistring;
const
  Digits: array[0..15] of ansichar =
    ( '0', '1', '2', '3', '4', '5', '6', '7',
      '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' );
begin
  tmpAnsiStr := '';
  for I := 0 to 15 do
    tmpAnsiStr := tmpAnsiStr + Digits[(D[I] shr 4) and $0f] +
                               Digits[(D[I]      ) and $0f];
  Result := string( tmpAnsiStr );
end;

// Compare two Digests
function MD5Match(D1, D2: MD5Digest): boolean;
var
  I: byte;
begin
  I := 0;
  Result := TRUE;
  while Result and ( I < 16 ) do
  begin
    Result := D1[I] = D2[I];
    inc(I);
  end;
end;

// -----------------------------------------------------------------------------------------------


function EncryptIBPass( Password: ansistring ): ansistring;
begin
  Result := CreateInterbasePassword( Password );
end;

{$IFDEF IBO_VCL2009_OR_GREATER}
function EncryptIBPass( Password: string ): string;
begin
  Result := iboDecodeA( EncryptIBPass( iboEncodeA( Password, IBO_UTF8 )));
end;
{$ENDIF}

function GetLineEndPos( const AStr: string;
                          var ALen: integer ): integer;
var
//  AType: ansistring;
  LFPos: integer;
begin
//  AType := '';
  ALen := 0;
  Result := iboPos( #13#10, AStr );
  if Result > 0 then
    ALen := 1
  else
    Result := iboPos( #13, AStr );
  LFPos := iboPos( #10, AStr );
  if ( LFPos > 0 ) and (( LFPos < Result ) or ( Result = 0 )) then
  begin
    Result := LFPos;
    ALen := 0;
  end;
end;

function YearFromDateTime( ADateTime: TDateTime ): word;
var
  Day, Month: word;
begin
  DecodeDate( ADateTime, Result, Month, Day );
end;

function DateTimeToEncodeString( ADateTime: TDateTime ): string;
var
  Day, Month, Year, Hour, Minute, Second, MSec: word;
begin
  Result := '';
  if ADateTime > 0 then begin
    DecodeDate( ADateTime, Year, Month, Day );
    DecodeTime( ADateTime, Hour, Minute, Second, MSec );
    Result := Format( DTEncode_DecodeFormat,
        [Year,Month,Day,Hour,Minute,Second,MSec] );
  end else begin
    // DecodeDate does not support values <= 0, so we must find
    // another way.
    Result := FormatDateTime( DTEncode_DateTimeFormat, ADateTime );
    // Note that FormatDateTime does not support resolution greater
    // than single seconds, so the additional points of seconds required
    // for the standard EncodeString value are added as .0000
    // Since this is only for values <= 1899/12/31 I am assuming that
    // the additional resolution will not be essential.
  end;
end;

// Possibly this function should use the delimiters to identify the
// specific sections of the date/time string.  (Especially since I have
// so specifically defined these as constant values, not locale specific.
// However this should not be necessary (although it may be more reliable).
// The main reason for defining the delimiters so explicitly is in case
// some external use is made of the values created by these functions.
function EncodeStringToDateTime( AValue: string ): TDateTime;
var
  Day, Month, Year, Hour, Minute, Second, MSec: word;
  tmpStr: string;
begin
  if AValue = '12/30/1899 00:00' then
    Result := 0
  else
    try
      Year := StrToInt( iboCopy(AValue,1,4) );
      Month := StrToInt( iboCopy(AValue,6,2) );
      Day := StrToInt( iboCopy(AValue,9,2) );
      Hour := StrToInt( iboCopy(AValue,12,2) );
      Minute := StrToInt( iboCopy(AValue,15,2) );
      Second := StrToInt( iboCopy(AValue,18,2) );
      // Ensuring that we cope if some accidently sends us a value with
      // less than the require number of digits...
      tmpStr := Trim(iboCopy(AValue,21,4)) + '0000';
      // Read only 3 digits to get "milli" seconds, not the full 4 digits
      // which are available from the string to give 10000ths of a second
      // (This is a truncate rather than a round, but it should be adequate)
      MSec := StrToInt( iboCopy(tmpStr,1,3) );
      Result := EncodeDate( Year, Month, Day );
      if Result >= 0 then
        Result := Result + EncodeTime( Hour, Minute, Second, MSec )
      else
        Result := Result - EncodeTime( Hour, Minute, Second, MSec );
    except
      Result := StrToDateTime( AValue );
    end;
end;

function IsMatch( pattern, text: String ): Boolean;
begin
  Result := matche( pattern, text ) = 1;
end;

function matche( pattern, text: String ): Integer;
var
  range_start,
  range_end,
  p,
  t,
  plen,
  tlen: Integer;
  invert,
  member_match,
  loop: Boolean;
begin
    p := 1;
    t := 1;
    pattern := AnsiLowerCase(pattern);
    text := AnsiLowerCase(Text);
    plen := iboLength( pattern );
    tlen := iboLength( text );
    Result := 0;
    While ( (Result = 0) and (p <= plen) ) do begin
        if (t > tlen) then begin
            if (pattern[p] = MATCH_CHAR_KLEENE_CLOSURE) and
                 (p+1 > plen) then
                Result := MATCH_VALID
            else
                Result := MATCH_ABORT;
            exit;
        end
        else
        Case (pattern[p]) of
                MATCH_CHAR_KLEENE_CLOSURE:
                    Result := match_after_star( iboCopy( pattern, p, plen ),
                                                iboCopy( text, t, tlen ));
                MATCH_CHAR_RANGE_OPEN:
                    begin
                        Inc(p);
                        invert := False;
                        if (pattern[p] = MATCH_CHAR_EXCLAMATION_NEGATE) or
                            (pattern[p] = MATCH_CHAR_CARAT_NEGATE) then begin
                            invert := True;
                            Inc(p);
                        end;
                        if (pattern[p] = MATCH_CHAR_RANGE_CLOSE) then begin
                            Result := MATCH_PATTERN;
                            exit;
                        end;
                        member_match := False;
                        loop := True;
                        While ((loop) and (pattern[p] <> MATCH_CHAR_RANGE_CLOSE)) do begin
                            range_start := p;
                            range_end := p;
                            Inc(p);
                            if (p > plen) then begin
                                Result := MATCH_PATTERN;
                                exit;
                            end;
                            if (pattern[p] = MATCH_CHAR_RANGE) then begin
                                Inc(p);
                                range_end := p;
                                if (p > plen) or (pattern[range_end] = MATCH_CHAR_RANGE_CLOSE) then begin
                                    Result := MATCH_PATTERN;
                                    exit;
                                end;
                                Inc(p);
                            end;
                            if (p > plen) then begin
                                Result := MATCH_PATTERN;
                                exit;
                            end;
                            if (range_start < range_end) then begin
                                if (text[t] >= pattern[range_start]) and
                                   (text[t] <= pattern[range_end]) then
                                begin
                                    member_match := True;
                                    loop := False;
                                end;
                            end else begin
                              if (text[t] >= pattern[range_end]) and
                                  (text[t] <= pattern[range_start]) then
                                  begin
                                    member_match := True;
                                    loop := False;
                                  end;
                            end; { if (range_start < range_end) }
                        end; { while (loop) }

                        if (invert and member_match) or (not(invert or member_match)) then begin
                            Result := MATCH_RANGE;
                            exit;
                        end;
                        if (member_match) then while ((p <= plen) and (pattern[p] <> MATCH_CHAR_RANGE_CLOSE)) do Inc(p);
                        if (p > plen) then begin
                            Result := MATCH_PATTERN;
                            exit;
                        end;
                    end; { MATCH_CHAR_RANGE_OPEN: }
                Else
                    if (pattern[p] <> MATCH_CHAR_SINGLE) then
                        if (pattern[p] <> text[t]) then Result := MATCH_LITERAL;
            end; { Case pattern[p] }
        Inc(p);
        Inc(t);
    end; { While ( (Result = 0) and (p < plen) ) }
    if (Result = 0) then
        if (t <= tlen) then    Result := MATCH_END
                       else    Result := MATCH_VALID;
end;

function match_after_star( pattern, text: String ): Integer;
var
    p,
    t,
    plen,
    tlen        : Integer;
begin
{todo: Need to work this out for Lazarus string support.}
    Result := 0;
    p := 1;
    t := 1;
    plen := {ibo}Length(pattern);
    tlen := {ibo}Length(text);
    While (( t <= tlen ) and (p < plen)) and
            (pattern[p] = MATCH_CHAR_SINGLE) or
            (pattern[p] = MATCH_CHAR_KLEENE_CLOSURE) do begin
        If (pattern[p] = MATCH_CHAR_SINGLE) then Inc(t);
        Inc(p);
    end;
    If (t > tlen) then begin
        Result := MATCH_ABORT;
        exit;
    end;
    If (p > plen) then begin
        Result := MATCH_VALID;
        exit;
    end;
  repeat
        If (pattern[p] = text[t]) or (pattern[p] = MATCH_CHAR_RANGE_OPEN) then
        begin
            pattern := {ibo}Copy(pattern,p,plen);
            text := {ibo}Copy(text,t,tlen);
            plen := {ibo}Length(pattern);
            tlen := {ibo}Length(text);
            p := 1;
            t := 1;
            Result := matche( pattern , text );
        end;
        if (t > tlen) then begin
            Result := MATCH_ABORT;
            exit;
        end;
        Inc(t);
  until ( Result <> 0 );
end;

// Start TC_SoundEx implementation stuff
{------------------------------------------------------------------------------}
// This table gives the SoundEX SCORE for all characters Upper and Lower Case
// hence no need to convert. This is faster than doing an UpCase on the whole
// input string.
const SoundExTable: array [ansichar] of smallint = (
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, // 0..29
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, // 30..59
  0,0,0,0,0,                                                   // 60..64
//A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [ / ] ^ _ '
  0,1,2,3,0,1,2,0,0,2,2,4,5,5,0,1,2,6,2,3,0,1,0,2,0,2,0,0,0,0,0,0,
//a b c d e f g h i j k l m n o p q r s t u v w x y z
  0,1,2,3,0,1,2,0,0,2,2,4,5,5,0,1,2,6,2,3,0,1,0,2,0,2,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,         // 123..149
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,   // 150..179
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,   // 180..209
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,   // 210..239
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 );                             // 240..255

// In order to keep consistency of values, the multiplication starts large
// and reduces for each subsequent index character - allowing me to use
// range selection later if required.  I multiply out for 8 characters worth
// - which is 24 bit shifts to the right (or 16777216).
const SoundExMultiplier: longint = 24;

// While the individual index characters are weighted as 0..6, I use a value
// of 8 for the index multiplier (to create a total numeric value).  This
// allows me to use power of 2 multiplication (bit shifting) which is faster
// than normal multiplication.
// This will be reduced by 3 units for each index character retrieved
// (after the first).
function TC_SoundEx( SourceStr: AnsiString ): longint;
var
  Multiplier,
  LastScore,
  ThisScore: longint;
  i,
  slen: integer;
  InitCh: ansichar;
begin
  Result := 0;
  Multiplier := SoundExMultiplier;
  LastScore := 0;
  i := 1;
  slen := {ibo}Length( SourceStr );
  if( slen > 0 ) then
  begin
    InitCh := SourceStr[i];
    // Single character uppercase conversion...
    if( InitCh in ['a'..'z'] ) then
{$IFDEF FPC}
      InitCh := Chr( Ord( InitCh ) - Ord( 'a' ) + Ord( 'A' ));
{$ELSE}
      AnsiUpper( @InitCh );
{$ENDIF}
    Result := (longint(Ord(InitCh)) shl Multiplier);
    Inc( i );
    Dec( Multiplier, 3 );
    while( i <= slen ) do
    begin
      ThisScore := SoundExTable[SourceStr[i]];
      if( ThisScore <> LastScore ) then
      begin
        Result := Result + (ThisScore shl Multiplier);
        Dec( Multiplier, 3 );
        if( Multiplier < 0 ) then
          break;
      end;
      LastScore := ThisScore;
      Inc( i );
    end;
  end;
end;

// Same as TC_SoundEx except that it fills any unused character positions of
// the index with their maximum value...
function TC_SoundExMax( SourceStr: AnsiString ): longint;
var
  Multiplier,
  LastScore,
  ThisScore: longint;
  i,
  slen: integer;
  InitCh: ansichar;
begin
  Result := 0;
  Multiplier := SoundExMultiplier;
  LastScore := 0;
  i := 1;
  slen := {ibo}Length( SourceStr );
  if( slen > 0 ) then
  begin
    InitCh := SourceStr[i];
    // Single character uppercase conversion...
    if( InitCh in ['a'..'z'] ) then
{$IFDEF FPC}
      InitCh := Chr( Ord( InitCh ) - Ord( 'a' ) + Ord( 'A' ));
{$ELSE}
      AnsiUpper( @InitCh );
{$ENDIF}
    Result := (longint(Ord(InitCh)) shl Multiplier);
    Inc( i );
    Dec( Multiplier, 3 );
    while( i <= slen ) do
    begin
      ThisScore := SoundExTable[SourceStr[i]];
      if( ThisScore <> LastScore ) then
      begin
        Result := Result + (ThisScore shl Multiplier);
        Dec( Multiplier, 3 );
        if( Multiplier < 0 ) then break;
      end;
      LastScore := ThisScore;
      Inc( i );
    end;
    while( Multiplier >= 0 ) do
    begin
      if( Multiplier > 0 ) then
        Result := Result +  ( 7 shl Multiplier )
      else
        Result := Result + 7;
      Dec( Multiplier, 3 );
    end;
  end;
end;

// Metaphone algorithm translated by Tom White <wcs@intellex.com>
// Original C version by Michael Kuhn <rhlab!mkuhn@uunet.uu.net>

// a:  pointer to input string
// lg: max length of return string
function metaph( a: String; lg: integer ): String;
const
  vowels: string   = 'AEIOU';
  frontv: string   = 'EIY';
  varson: string   = 'CSPTG';
  dbl: string      = '.';  {Lets us allow certain letters to be doubled}
  excppair: string = 'AGKPWP'; //added PS 6/2/98 for Dave Green
  nxtltr: string   = 'ENNNRS';
  alphachr: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  b, c : string;
  inp, outp : string;
  t, ii, slength : integer;
  curltr, prevltr, nextltr, nextltr2, nextltr3 : char;
  vowelafter, vowelbefore, frontvafter, silent, hard : boolean;
begin
  Result := '';
  if lg = 0 then Exit;
  {Remove non-alpha characters}
  inp := iboUpperCase( string( a ) );
  outp := '';
  for t := 1 to {ibo}Length( inp ) do
  begin
    if iboPos( inp[t], alphachr ) > 0 then
    begin
      outp := outp + inp[t];
    end;
  end;
  inp := outp;
  outp := '';
  {Check rules at beginning of word}
  slength := {ibo}Length(inp);
  if slength > 1 then
  begin  //completely changed 6/2/98, old method was *bad*
    b := inp[1];
    c := inp[2];
    for t :=  1 to {ibo}Length(excppair) do
    begin
      if (b=excppair[t]) and (c=nxtltr[t]) then
      begin
        {ibo}Delete( inp, 1, 1 );
        dec(slength);
        break;
      end;
    end;
  end
  else
  if slength = 0 then
  begin
    Exit;
  end;
  if inp[1]='X' then
  begin
    inp[1] := 'S';
  end;
  if (slength>2) and ({ibo}Copy(inp,1,2)='WH') then begin
    {ibo}Delete( inp, 2, 1 );
    dec(slength);
  end;
  if (slength>1) and (inp[slength]='S') then begin
    {ibo}Delete( inp, slength, 1 );
    dec(slength);
  end;
  ii := 0;
  repeat
    Inc( ii );
    {Main Loop!}
    hard := false;
    curltr := inp[ii];
    vowelbefore := false;
    prevltr := ' ';
    if ii>1 then begin
      prevltr := inp[ii-1];
      if iboPos(prevltr,vowels)>0 then
        vowelbefore := true;
    end;
    if ((ii=1) and (iboPos(curltr,vowels)>0)) then begin
      outp := outp+curltr;
      continue;
    end;
    vowelafter := false;
    frontvafter := false;
    nextltr := ' ';
    if ii < slength then begin
      nextltr := inp[ii+1];
      if iboPos(nextltr,vowels)>0 then vowelafter := true;
      if iboPos(nextltr,frontv)>0 then frontvafter := true;
    end;
    {Skip double letters EXCEPT ones in variable double}
    if iboPos( curltr, dbl ) = 0 then
      if curltr=nextltr then
        continue;
    nextltr2 := ' ';
    if (slength-ii)>1 then
      nextltr2 := inp[ii+2];
    nextltr3 := ' ';
    if (slength-ii)>2 then
      nextltr3 := inp[ii+3];
    case curltr of
      'B' : begin
              silent := false;
              if (ii=slength) and (prevltr='M') then
                silent := true;
              if not silent then outp := outp+curltr;
            end;
      'C' : begin
              if not ((ii>2) and (prevltr='S') and frontvafter) then
                if ((ii>1) and (nextltr='I') and (nextltr2='A')) then
                  outp := outp+'X'
                else
                  if frontvafter then begin
                    outp := outp+'S';
                  end else begin
                    if ((ii>2) and (prevltr='S') and (nextltr='H')) then begin
                      outp := outp+'K';
                    end else begin
                      if nextltr='H' then begin
                        if ((ii=1) and (iboPos(nextltr2,vowels)=0)) then
                          outp := outp+'K'
                        else
                          outp := outp+'X';
                      end else begin
                        if prevltr='C' then
                          outp := outp+'C'
                        else
                          outp := outp+'K';
                      end;
                    end;
                  end;
              end;
      'D' : begin
              if ((nextltr='G') and (iboPos(nextltr2,frontv)>0)) then
                outp := outp+'J'
              else
                outp := outp+'T';
            end;
      'G' : begin
              silent := false;
              if ((ii<slength) and (nextltr='H') and (iboPos(nextltr2,vowels)=0)) then
                silent := true;
              if ((ii=slength-4) and (nextltr='N') and (nextltr2='E') and
                (nextltr3='D')) then silent := true
              else if ((ii=slength-2) and (nextltr='N')) then silent := true;
              if (prevltr='D') and frontvafter then silent := true;
              if prevltr='G' then
                hard := true;
              if not silent then begin
                if frontvafter and (not hard) then
                  outp := outp+'J'
                else
                  outp := outp+'K';
              end;
            end;
      'H' : begin
              silent := false;
              if iboPos(prevltr,varson)>0 then silent := true;
              if vowelbefore and (not vowelafter) then silent := true;
              if not silent then outp := outp+curltr;
            end;
      'F', 'J', 'L', 'M', 'N', 'R' : outp := outp+curltr;
      'K' : if prevltr<>'C' then outp := outp+curltr;
      'P' : if nextltr='H' then outp := outp+'F' else outp := outp+'P';
      'Q' : outp := outp+'K';
      'S' : begin
              if ((ii>2) and (nextltr='I') and ((nextltr2='O') or (nextltr2='A'))) then
                outp := outp+'X';
              if (nextltr='H') then
                outp := outp+'X'
              else
                outp := outp+'S';
            end;
      'T' : begin
              if ((ii>0) and (nextltr='I') and ((nextltr2='O') or (nextltr2='A'))) then
                outp := outp+'X';
              if nextltr='H' then begin
                if ((ii>1) or (iboPos(nextltr2,vowels)>0)) then
                  outp := outp+'0'
                else
                  outp := outp+'T';
              end else
                if not ((ii<slength-3) and (nextltr='C') and (nextltr2='H')) then
                  outp := outp+'T';
            end;
      'V' : outp := outp+'F';
      'W', 'Y' : if (ii<slength-1) and vowelafter then outp := outp+curltr;
      'X' : outp := outp+'KS';
      'Z' : outp := outp+'S';
    end;
  until (iboLength(outp)>=lg) or (ii>=slength); //added slength 6/2/98
  Result := outp;
end;

procedure DrawShallowEdge( ACanvas: TCanvas;
                           ARect: TRect;
                           Options: TGridOptions );
begin
  with ACanvas do begin
    Pen.Style := psSolid;
    Pen.Width := 1;
    Pen.Color := clBtnShadow;
    if goFixedVertLine in Options then begin
      MoveTo( ARect.Right, ARect.Bottom );
      LineTo( ARect.Right, ARect.Top );
    end;
    if goFixedHorzLine in Options then begin
      MoveTo( ARect.Left, ARect.Bottom );
      LineTo( ARect.Right + 1, ARect.Bottom );
    end;
    Pen.Color := clBtnHighlight;
    if goFixedVertLine in Options then begin
      MoveTo( ARect.Left, ARect.Top );
      LineTo( ARect.Left, ARect.Bottom );
    end;
    if goFixedHorzLine in Options then begin
      MoveTo( ARect.Left, ARect.Top );
      LineTo( ARect.Right + 1, ARect.Top );
    end;
  end;
end;

function GetEnvVariable( const AName: string ): string;
{$IFNDEF IBO_VCL60_OR_GREATER}
var
  tmpInt: integer;
begin
  SetLength( Result, 256 );
  tmpInt := Windows.GetEnvironmentVariable( PAnsiChar( AName ),
                                            PAnsiChar( Result ),
                                            256 );
  if tmpInt < 256 then
    SetLength( Result, tmpInt )
  else
  begin
    Setlength( Result, tmpInt );
    tmpInt := Windows.GetEnvironmentVariable( PAnsiChar( AName ),
                                              PAnsiChar( Result ),
                                              tmpInt );
    SetLength( Result, tmpInt );
  end;
{$ELSE}
begin
  Result := GetEnvironmentVariable( AName );
{$ENDIF}
end;

{------------------------------------------------------------------------------}

function BinaryToHexText( aBufPtr: pointer;
                          aBufLen: integer ): RawByteString;
var
  ii, jj: integer;
  tmpBuf: pbyte;
begin
  if not Assigned( aBufPtr ) then
    Result := ''
  else
  begin
    tmpBuf := aBufPtr;
    SetLength( Result, aBufLen * 2 );
    for ii := 0 to aBufLen - 1 do
    begin
      jj := ii * 2 + 1;
      if tmpBuf^ div 16 < 10 then
        Result[ jj ] := AnsiChar( Ord( '0' ) + tmpBuf^ div 16 )
      else
        Result[ jj ] := AnsiChar( Ord( 'A' ) + tmpBuf^ div 16 - 10 );
      Inc( jj );
      if tmpBuf^ mod 16 < 10 then
        Result[ jj ] := AnsiChar( Ord( '0' ) + tmpBuf^ mod 16 )
      else
        Result[ jj ] := AnsiChar( Ord( 'A' ) + tmpBuf^ mod 16 - 10 );
      Inc( tmpBuf );
    end;
  end;
end;

function RawStringToHexText( const aRawString: RawByteString ): RawByteString;
begin
  Result := BinaryToHexText( PRawByteString(aRawString),
                             {ibo}Length(ARawString) );
end;

procedure HexTextToBinary( const aHexText: RawByteString;
                                 aBufPtr: pointer;
                                 aBufLen: integer );
var
  ii: integer;
  tmpBuf: pbyte;
  Bits: AnsiChar;
begin
  if ( aBufLen > 0 ) and
     ( aBufLen <> {ibo}Length( aHexText ) div 2 ) then
    raise Exception.Create( E_Invalid_text_in_HexTextToBinary );
  tmpBuf := aBufPtr;
  for ii := 0 to {ibo}Length( aHexText ) div 2 - 1 do
  begin
    Bits := aHexText[ ii * 2 + 1 ];
    case Bits of
      '0'..'9': tmpBuf^ := 16 * ( Ord( Bits ) - Ord( '0' ));
      'A'..'F': tmpBuf^ := 16 * ( Ord( Bits ) - Ord( 'A' ) + 10 );
    end;
    Bits := aHexText[ ii * 2 + 2 ];
    case Bits of
      '0'..'9': tmpBuf^ := tmpBuf^ + Ord( Bits ) {%H-}- Ord( '0' );
      'A'..'F': tmpBuf^ := tmpBuf^ + Ord( Bits ) {%H-}- Ord( 'A' ) + 10;
    end;
    Inc( tmpBuf );
  end;
end;

function HexTextToRawString( const aHexText: RawByteString ): RawByteString;
begin
  SetLength( Result, {ibo}Length( aHexText ) div 2 );
  HexTextToBinary( aHexText, PRawByteString(Result), {ibo}Length(Result) );
end;

function GetJumbleKey( aRegistry: TRegistry;
                       aDefaultSecLevel: integer ): RawByteString;
var
  SecLvl: integer;
  ii: integer;
  OldRegRootKey: HKEY;
  OldRegAccess: LongWord;
//ramil  StrBuf: String;
  Buf: array[0..15] of byte;
const
//ramil  JumbleKeyName: string = 'JumbleKey';
  JumbleKeyName: string = 'JumbleKeySec2';
  JumbleKeyLevel: string = 'Level';
begin
  if aRegistry = nil then
    aRegistry := GetGlobalRegistry;
  OldRegRootKey := aRegistry.RootKey;
  OldRegAccess  := aRegistry.Access;
  try
    aRegistry.RootKey := JumbleRegKey;
    aRegistry.Access := KEY_READ;
    SecLvl := -1;
    if aRegistry.KeyExists( JumbleRegPath ) then
    begin
      if aRegistry.OpenKey( JumbleRegPath, false ) then
      begin
        if aRegistry.ValueExists( JumbleKeyLevel ) then
        begin
          SecLvl := StrToInt( aRegistry.ReadString( JumbleKeyLevel ));
//ramil          StrBuf := aRegistry.ReadString(JumbleKeyName);
          aRegistry.ReadBinaryData( JumbleKeyName, Buf, SizeOf( Buf ));
        end;
        aRegistry.CloseKey;
      end;
    end;
    if SecLvl <= -1 then
    begin
      aRegistry.Access := KEY_ALL_ACCESS;
      if aRegistry.OpenKey( JumbleRegPath, true ) then
      begin
        SecLvl := aDefaultSecLevel;
        aRegistry.WriteString( JumbleKeyLevel, IntToStr(SecLvl) );
        Randomize;
//ramil        StrBuf := '';
// <blank>
        for ii := 1 to 16 do
//ramil          StrBuf := StrBuf + Chr( Random(254) + 1 ); // Avoid null.
          Buf[ii] := byte( Random(254) + 1 ); // Avoid null.
//ramil        aRegistry.WriteString(JumbleKeyName, StrBuf);
        aRegistry.WriteBinaryData( JumbleKeyName, Buf, SizeOf( Buf ));
        aRegistry.CloseKey;
      end;
    end;
  finally
    aRegistry.RootKey := OldRegRootKey;
    aRegistry.Access := OldRegAccess;
  end;
  if SecLvl = 0 then
    Result := ''
  else
  if SecLvl = 1 then
    Result := JumblePrefix_v01
  else
  if SecLvl >= 2 then
  begin
//ramil    Result := StrBuf;
    SetLength( Result, SizeOf( Buf ));
    Move( Buf[0], Result[1], SizeOf( Buf ));
  end;
end;

function JumbleString( const aValue: string;
                       const aKeyPhrase: RawByteString;
                             aAlgorithm: integer ): string;
var
  tmpStr1: string;
  tmpRaw1: RawByteString;
  tmpRaw2: RawByteString;
  ii, jj: integer;
begin
  Result := aValue;
  if ( aKeyPhrase <> '' ) and ( aAlgorithm > 0 ) then
  begin
    tmpStr1 := {ibo}Copy( aValue, 1, {ibo}Length( JumblePrefix_v01 ) );
    if tmpStr1 <> string(JumblePrefix_v01) then
    begin
      if aAlgorithm = 1 then
      begin
        tmpRaw1 := iboEncodeA( aValue );
        tmpRaw2 := '';
        jj := 1;
        for ii := 1 to {ibo}Length( tmpRaw1 ) do
        begin
          tmpRaw2 := tmpRaw2 +
                     ansichar( Ord(tmpRaw1[ii]) XOR Ord(aKeyPhrase[jj]) );
          Inc( jj );
          if jj > {ibo}Length( aKeyPhrase ) then
            jj := 1;
        end;
        tmpRaw1 := RawStringToHexText( tmpRaw2 );
        Result := string(JumblePrefix_v01) + string(tmpRaw1);
      end;
    end;
  end;
end;

function UnJumbleString( const aValue: string;
                         const aKeyPhrase: RawByteString ): string;
var
  tmpStr: string;
  tmpRaw1: RawByteString;
  tmpRaw2: RawByteString;
  tmpRaw3: RawByteString;
  tmpRaw4: RawByteString;
  tmpStr5: String;
  ii, jj: integer;
  b1, b2, b3: byte;
begin
  Result := aValue;
  if aKeyPhrase <> '' then
  begin
    tmpStr := {ibo}Copy( aValue, 1, {ibo}Length( JumblePrefix_v01 ) );
    if tmpStr = string(JumblePrefix_v01) then
    begin
      tmpStr := {ibo}Copy( aValue, {ibo}Length( JumblePrefix_v01 ) + 1, MAXINT );
      if {ibo}Length( tmpStr ) > 0 then
      begin
        tmpRaw3 := iboEncodeA( tmpStr );
//        if tmpRaw3 = 'BC379CCECCDEB30E35' then // The temporarily avoids the problem.
//          tmpRaw1 := 'masterkey'
//        else
        begin
          tmpRaw2 := HexTextToRawString( tmpRaw3 );
          SetLength( tmpRaw1, Length( tmpRaw2 ));
          jj := 1;
          for ii := 1 to {ibo}Length( tmpRaw2 ) do
          begin
            b1 := Ord(tmpRaw2[ii]);
            b2 := Ord(aKeyPhrase[jj]);
            b3 := b1 XOR b2;
            tmpRaw1[ii] := ansichar(( Chr( b3 ) ));
            Inc( jj );
            if jj > {ibo}Length( aKeyPhrase ) then
              jj := 1;
          end;
        end;
        tmpRaw4 := tmpRaw1;
        tmpStr5 := iboDecodeA( tmpRaw4 );
        Result := tmpStr5;
//        if Result <> tmpStr5 then
//        begin
//          Result := tmpStr5;
//        end;
      end;
    end;
  end;
end;

function GetCharIDFromCharSet( ACharSet: string ): smallint;
begin
  if ACharSet = IBO_UTF8 then
    Result := IBO_UTF8_ID
  else
  if ACharSet = IBO_ASCII then
    Result := IBO_ASCII_ID
  else
  if ACharSet = IBO_UNICODE_FSS then
    Result := IBO_UNICODE_FSS_ID
  else
  if ACharSet = IBO_OCTETS then
    Result := IBO_OCTETS_ID
  else
  if ( ACharSet = IBO_NONE ) or
     ( ACharSet = '' ) then
    Result := IBO_NONE_ID
  else
    Result := IBO_UNDEFINED_ID;
end;

function iboEncodeA( const aString: string;
                     const aCharSet: string ): RawByteString;
begin
{$IFDEF FPC}
  Result := RawByteString( aString );
{$ELSE}
{$IFDEF IBO_VCL60_OR_GREATER}
  if ( aCharSet = IBO_UTF8 ) or
     ( aCharSet = IBO_UNICODE_FSS ) then
    Result := UTF8Encode( aString )
  else
{$IFDEF IBO_VCL70_OR_GREATER}
    Result := RawByteString( aString );
{$ELSE}
    Result := aString;
{$ENDIF}
{$ELSE}
  Result := aString;
{$ENDIF}
{$ENDIF}
end;

function iboEncodeW( const aString: widestring;
                     const aCharSet: string ): RawByteString;
begin
{$IFDEF FPC}
  Result := RawByteString( aString );
{$ELSE}
  if ( aCharSet = IBO_UTF8 ) or
     ( aCharSet = IBO_UNICODE_FSS ) then
{$IFDEF IBO_VCL60_OR_GREATER}
    Result := UTF8Encode( aString )
{$ELSE}
    Result := aString
{$ENDIF}
  else
{$IFDEF IBO_VCL70_OR_GREATER}
    Result := RawByteString( aString );
{$ELSE}
    Result := aString;
{$ENDIF}
{$ENDIF FPC}
end;

function iboDecodeA( const aRawBytes: RawByteString;
                     const aCharSet: string ): string;
begin
{$IFDEF FPC}
  Result := string( aRawBytes );
{$ELSE}
  if ( aCharSet = IBO_UTF8 ) or
     ( aCharSet = IBO_UNICODE_FSS ) then
{$IFDEF IBO_VCL2009_OR_GREATER}
    Result := UTF8ToString( aRawBytes )
{$ELSE}
{$IFDEF IBO_VCL60_OR_GREATER}
    Result := UTF8Decode( aRawBytes )
{$ELSE}
    Result := aRawBytes
{$ENDIF}
{$ENDIF}
  else
{$IFDEF IBO_VCL70_OR_GREATER}
    Result := string( aRawBytes );
{$ELSE}
    Result := aRawBytes;
{$ENDIF}
{$ENDIF FPC}
end;

function iboDecodeW( const aRawBytes: RawByteString;
                     const aCharSet: string ): widestring;
begin
{$IFDEF FPC}
  Result := widestring( aRawBytes );
{$ELSE}
  if ( aCharSet = IBO_UTF8 ) or
     ( aCharSet = IBO_UNICODE_FSS ) then
{$IFDEF IBO_VCL2009_OR_GREATER}
    Result := UTF8ToWideString( aRawBytes )
{$ELSE}
{$IFDEF IBO_VCL60_OR_GREATER}
    Result := UTF8Decode( aRawBytes )
{$ELSE}
    Result := widestring( aRawBytes )
{$ENDIF}
{$ENDIF}
  else
    Result := widestring( aRawBytes );
{$ENDIF FPC}
end;

//**********************

function iboEncodeA( const aCharID: smallint;
                     const aString: string ): RawByteString;
begin
{$IFDEF FPC}
  Result := RawByteString( aString );
{$ELSE}
{$IFDEF IBO_VCL60_OR_GREATER}
  if ( aCharID = IBO_UTF8_ID ) or
     ( aCharID = IBO_UNICODE_FSS_ID ) then
    Result := UTF8Encode( aString )
  else
{$IFDEF IBO_VCL70_OR_GREATER}
    Result := RawByteString( aString );
{$ELSE}
    Result := aString;
{$ENDIF}
{$ELSE}
  Result := aString;
{$ENDIF}
{$ENDIF}
end;

function iboEncodeW( const aCharID: smallint;
                     const aString: widestring ): RawByteString;
begin
{$IFDEF FPC}
  Result := RawByteString( aString );
{$ELSE}
  if ( aCharID = IBO_UTF8_ID ) or
     ( aCharID = IBO_UNICODE_FSS_ID ) then
{$IFDEF IBO_VCL60_OR_GREATER}
    Result := UTF8Encode( aString )
{$ELSE}
    Result := aString
{$ENDIF}
  else
{$IFDEF IBO_VCL70_OR_GREATER}
    Result := RawByteString( aString );
{$ELSE}
    Result := aString;
{$ENDIF}
{$ENDIF FPC}
end;

{$IFDEF IBO_VCL2009_OR_GREATER}
function iboEncodeU( const aCharID: smallint;
                     const aString: UnicodeString ): RawByteString;
begin
  if ( aCharID = IBO_UTF8_ID ) or
     ( aCharID = IBO_UNICODE_FSS_ID ) then
    Result := UTF8Encode( aString )
  else
    Result := RawByteString( aString );
end;
{$ENDIF}

function iboDecodeA( const aCharID: smallint;
                     const aRawBytes: RawByteString ): string;
begin
{$IFDEF FPC}
  Result := string( aRawBytes );
{$ELSE}
  if ( aCharID = IBO_UTF8_ID ) or
     ( aCharID = IBO_UNICODE_FSS_ID ) then
{$IFDEF IBO_VCL2009_OR_GREATER}
    Result := UTF8ToString( aRawBytes )
{$ELSE}
{$IFDEF IBO_VCL60_OR_GREATER}
    Result := UTF8Decode( aRawBytes )
{$ELSE}
    Result := string( aRawBytes )
{$ENDIF}
{$ENDIF}
  else
    Result := string( aRawBytes );
{$ENDIF FPC}
end;

function iboDecodeW( const aCharID: smallint;
                     const aRawBytes: RawByteString ): widestring;
begin
{$IFDEF FPC}
  Result := widestring( aRawBytes );
{$ELSE}
  if ( aCharID = IBO_UTF8_ID ) or
     ( aCharID = IBO_UNICODE_FSS_ID ) then
{$IFDEF IBO_VCL2009_OR_GREATER}
    Result := UTF8ToWideString( aRawBytes )
{$ELSE}
{$IFDEF IBO_VCL60_OR_GREATER}
    Result := UTF8Decode( aRawBytes )
{$ELSE}
    Result := widestring( aRawBytes )
{$ENDIF}
{$ENDIF}
  else
    Result := widestring( aRawBytes );
{$ENDIF FPC}
end;

{$IFDEF IBO_VCL2009_OR_GREATER}
function iboDecodeU( const aCharID: smallint;
                     const aRawBytes: RawByteString ): UnicodeString;
begin
  if ( aCharID = IBO_UTF8_ID ) or
     ( aCharID = IBO_UNICODE_FSS_ID ) then
    Result := UTF8ToUnicodeString( aRawBytes )
  else
    Result := UnicodeString( aRawBytes );
end;
{$ENDIF}


//**********************

function ConvCharCase( PrevChar,
                       NewChar: ansichar; ChCase: integer ): ansichar;
const
  tmp: ansistring = ' -,.;/()!@#$%^&*+="''';
begin
  case ChCase of
    1{ecUpperCase}: Result := ansichar(strupper(PAnsiChar(NewChar)));
    2{ecLowerCase}: Result := ansichar(strlower(PAnsiChar(NewChar)));
    3{ecProperCase}:
    begin
      if ( PrevChar = #0 ) or
          ( {ibo}Pos( PrevChar, tmp ) <> 0) then
        Result := ansichar(strupper(PAnsiChar(NewChar)))
      else
        Result := NewChar;
    end;
  else
    Result := NewChar;
  end;
end;

{$IFDEF IBO_VCL2009_OR_GREATER}
function ConvCharCase( PrevChar, NewChar: char; ChCase: integer ): char;
const
  tmp: string = ' -,.;/()!@#$%^&*+="''';
begin
  case ChCase of
    1{ecUpperCase}: Result := char(CharUpperW(PChar(NewChar)));
    2{ecLowerCase}: Result := char(CharLowerW(PChar(NewChar)));
    3{ecProperCase}:
    begin
      if ( PrevChar = #0 ) or
          ( {ibo}Pos( PrevChar, tmp ) <> 0) then
        Result := char(CharUpperW(PChar(NewChar)))
      else
        Result := NewChar;
    end;
  else
    Result := NewChar;
  end;
end;
{$ENDIF}

procedure IB_ReallocMem( var Ptr: pointer; OldSize, NewSize: longint );
var
  tmpMem: pointer;
  tmpLen: longint;
begin
  if OldSize = NewSize then
    Exit;
  if NewSize > 0 then
  begin
    if NewSize < OldSize then
      GetMem( tmpMem, NewSize )
    else
      tmpMem := AllocMem( NewSize );
  end
  else
    tmpMem := nil;
  if OldSize > NewSize then
    tmpLen := NewSize
  else
    tmpLen := OldSize;
  if tmpLen > 0 then
    Move( Ptr^, tmpMem^, tmpLen );
  if OldSize > 0 then
    FreeMem( Ptr );
  Ptr := tmpMem;
end;

function isc_decode_TDateTime( const Src: pisc_quad ): TDateTime;
begin
  Result := Src^.isc_quad_high - 15018;
  try
    Result := Result + EncodeTime((Src^.isc_quad_low div (36000000)),
                                  (Src^.isc_quad_low div (  600000)) mod 60,
                                  (Src^.isc_quad_low div (   10000)) mod 60,
                                  (Src^.isc_quad_low mod (   10000)) div 10 );
  except
    Result := Result + 0;
  end;
end;

procedure isc_encode_TDateTime( const Src: TDateTime; const Dst: pisc_quad );
var
  Hour, Min, Sec, MSec: word;
begin
  DecodeTime( Src, Hour, Min, Sec, MSec );
  with Dst^ do
  begin
    isc_quad_high := Trunc( Src ) + 15018;
    isc_quad_low  := Hour * 10000 * 60 * 60 +
                     Min  * 10000 * 60      +
                     Sec  * 10000           +
                     MSec *    10;
  end;
end;

function isc_quad_equal( const Q1, Q2: isc_quad ): boolean;
begin
  Result := ( Q1.isc_quad_high = Q2.isc_quad_high ) and
            ( Q1.isc_quad_low  = Q2.isc_quad_low  );
end;

function isc_quad_is_zero( const Q1: isc_quad ): boolean;
begin
  Result := ( Q1.isc_quad_high = 0 ) and
            ( Q1.isc_quad_low  = 0 );
end;

function isc_quad_string( const AQuad: isc_quad ): string;
begin
  Result := '( ' + IntToStr( AQuad.isc_quad_high ) + ', ' +
                   IntToStr( AQuad.isc_quad_low ) + ' )';
end;

function ScaleExtended( const AVal: extended; AScale: smallint ): extended;
var
  i: smallint;
  AFactor: extended;
begin
  // Do not apply rounding - used for reading data as stored in database.
  Result := AVal;
  if (AScale <> 0) and (Result <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
      Result := AVal * AFactor
    else // decreasing scale
      Result := AVal / AFactor;
  end;
end;

function IntegerToCurrency( const AVal: integer; AScale: smallint ): currency;
var
  i: smallint;
  AFactor: currency;
begin
  // Do not apply rounding - used for reading data as stored in database.
  // There is some hazard with the following code, because it does the
  // multiply/divide using currency values - and AFAICT these result in the
  // use of the extended data type internally.  The best way to do this would
  // have been to use the Int64ToCurrency function (see notes below), but that
  // would mean dropping support for BCB3.  Given the relative significance
  // of integer vs currency I am not expecting this code to give problems, but
  // it will need to be tested.
  Result := AVal;
  if (AScale <> 0) and (Result <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // scale result up to meet integer scale
      Result := Result * AFactor
    else // scale result down to meet integer scale
      Result := Result / AFactor;
  end;
end;

function Int64ToCurrency( AVal: ISC_INT64; AScale: smallint ): currency;
var
  i: smallint;
  AFactor: ISC_INT64;
begin
  // Do not apply rounding - used for reading data as stored in database.
  // Originally I was starting by casting AVal to Result and then scaling
  // the currency Result variable.  This resulted in rounding problems.  It
  // seems that some Delphi maths functions involving currency use extended
  // for interim values with subsequent problems at the limits of the range.
  // So now I manipulate the int64 value first, and then assign the final
  // value directly to Result.  This direct cast produces an implicit scale
  // of 4 (the fixed integer scale of the currency data type), and so the
  // actual scaling value must be adjusted as follows.  This adjustment
  // avoids overflowing the currency value when scaling adjustment will make
  // the integer value fit.  There is still a limit (14 integer digits), but
  // this should ensure we accept all possible values within the limit.
  AScale := AScale + 4;
  if (AScale <> 0) and (AVal <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
    begin
      if (AVal > (High(ISC_INT64) div AFactor)) or
         (AVal < (Low (ISC_INT64) div AFactor)) then
        raise Exception.Create( E_Int64Overflow );
      AVal := AVal * AFactor;
    end
    else // decreasing scale
      AVal := AVal div AFactor;
  end;
  Result := currency((@AVal)^);
end;

function ExtendedToInt64( AVal: extended; AScale: smallint ): ISC_INT64;
var
  i: smallint;
  AFactor: extended;
begin
  if (AScale <> 0) and (AVal <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
      AVal := AVal * AFactor
    else // decreasing scale
      AVal := AVal / AFactor;
  end;
  // statistical rounding applied for consistency
  Result := Round( AVal );
end;

function ExtendedToInteger( AVal: extended; AScale: smallint ): integer;
var
  i: smallint;
  AFactor: extended;
begin
  if (AScale <> 0) and (AVal <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
      AVal := AVal * AFactor
    else // decreasing scale
      AVal := AVal / AFactor;
  end;
  if ( AVal > High(integer) ) or ( AVal < Low(integer) ) then
    raise Exception.Create( E_IntegerOverflow );
  // statistical rounding applied for consistency
  Result := Round( AVal );
end;

function ExtendedToSmallint( AVal: extended; AScale: smallint ): smallint;
var
  i: smallint;
  AFactor: extended;
begin
  if (AScale <> 0) and (AVal <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
      AVal := AVal * AFactor
    else // decreasing scale
      AVal := AVal / AFactor;
  end;
  if (AVal > High(Smallint)) or (AVal < Low(Smallint)) then
    raise Exception.Create( E_SmallintOverflow );
  // statistical rounding applied for consistency
  Result := Round( AVal );
end;

function CurrencyToInteger( AVal: currency; AScale: smallint ): integer;
var
  i: smallint;
  AFactor: currency;
begin
  // See notes for IntegerToCurrency about accuracy of currency manipulations
  if (AScale <> 0) and (AVal <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
      AVal := AVal * AFactor
    else // decreasing scale
      AVal := AVal / AFactor;
  end;
  if (AVal > High(integer)) or (AVal < Low(integer)) then
    raise Exception.Create( E_IntegerOverflow );
  // This is not ideal, since it converts to extended and then back
  // to integer - with theoretical difficulties.  However given the resolution
  // of extended versus integer this should not cause a problem.
  // statistical rounding applied for consistency
  Result := Round( AVal );
end;

function CurrencyToSmallint( AVal: currency; AScale: smallint ): smallint;
var
  i: smallint;
  AFactor: extended;
begin
  // See notes for IntegerToCurrency about accuracy of currency manipulations
  if (AScale <> 0) and (AVal <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
      AVal := AVal * AFactor
    else // decreasing scale
      AVal := AVal / AFactor;
  end;
  if (AVal > High(Smallint)) or (AVal < Low(Smallint)) then
    raise Exception.Create( E_SmallintOverflow );
  // This is not ideal, since it converts to extended and then back
  // to integer - with theoretical difficulties.  However given the resolution
  // of extended versus smallint this should not cause a problem.
  // statistical rounding applied for consistency
  Result := Round( AVal );
end;

function CurrencyToInt64( AVal: currency; AScale: smallint ): ISC_INT64;
var
  i: smallint;
  AFactor: ISC_INT64;
  tmpMod,
  tmpHalf: ISC_INT64;
begin
  // See notes for Int64ToCurrency for explanation of this code.
  Result := ISC_INT64((@AVal)^);
  AScale := AScale - 4;
  if (AScale <> 0) and (Result <> 0) then
  begin
    AFactor := 1;
    for i := 1 to abs(AScale) do
      AFactor := AFactor * 10;
    if AScale > 0 then // increasing scale
    begin
      if (Result > (High(ISC_INT64) div AFactor)) or
        (Result < (Low(ISC_INT64) div AFactor)) then
        raise Exception.Create( E_Int64Overflow );
      Result := Result * AFactor;
    end
    else // decreasing scale
    begin
      // Need to calculate the rounding adjustments required for statistical
      // rounding.  Probably should setup asm stuff for this but lets see how
      // we go without for the moment.
      tmpMod := Result mod AFactor;
      tmpHalf := (AFactor div 2);
      Result := Result div AFactor;
      // more than half remainder goes up (down if negative)
      // exactly half remainder goes up (down if negative) only when
      // the result is odd (even results dont need adjustment)
      if (abs(tmpMod) > tmpHalf) or
        ((abs(tmpMod) = tmpHalf) and ((Result mod 2) = 1)) then
      begin
        if Result < 0 then
          Dec(Result,1)
        else
          Inc(Result,1);
      end;
    end;
  end;
end;

function StrToInt64Scaled( const AValue: string; AScale: integer ): int64;
var
  tmpVal: string;
  tmpLen,
  tmpPos,
  x: integer;
  ds: char;
begin
  ds := {$IFDEF IBO_VCL2011_OR_GREATER}FormatSettings.{$ENDIF}DecimalSeparator;
  tmpVal := Trim( AValue );
  tmpPos := iboPos( '-', tmpVal );
  if not ( tmpPos in [ 0..1 ]) then
    raise Exception.Create( E_Invalid_numeric_format + ' :' + tmpVal );
  tmpLen := iboLength( tmpVal );
  tmpPos := iboPos( ds, tmpVal );
  if tmpPos = 0 then
  begin
    tmpPos := tmpLen + 1;
    tmpLen := tmpPos;
  end
  else
    iboDelete( tmpVal, tmpPos, 1 );
  Result := StrToInt64( tmpVal );
  tmpLen := tmpLen - tmpPos - AScale;
  if tmpLen > 0 then
  begin
    tmpPos := 10;
    for x := 1 to tmpLen - 1 do
      tmpPos := tmpPos * 10;
    Result := Result div tmpPos;
  end
  else
  if tmpLen < 0 then
  begin
    tmpPos := 10;
    for x := -1 downto tmpLen + 1 do
      tmpPos := tmpPos * 10;
    Result := Result * tmpPos;
  end;
end;

function Int64ScaledToStr( const AValue: int64; AScale: integer ): string;
var
  IsNeg: boolean;
  CurLen: integer;
  ds: char;
begin
  ds := {$IFDEF IBO_VCL2011_OR_GREATER}FormatSettings.{$ENDIF}DecimalSeparator;
  Result := IntToStr( AValue );
  if AScale > 0 then
  begin
    IsNeg := Result[1] = '-';
    if IsNeg then
      iboDelete( Result, 1, 1 );
    CurLen := iboLength( Result );
    if CurLen <= AScale then
      Result := StringOfChar( '0', AScale - CurLen + 1 ) + Result;
    iboInsert( ds, Result, iboLength( Result ) - AScale + 1 );
    if IsNeg then
      iboInsert( '-', Result, 1 );
  end;
end;

function GetFullIdentName( AComponent: TComponent;
                           IncludeClass: boolean = true ): string;
begin
  Result := '';
  if not Assigned( AComponent.Owner ) then
    Result := Result + ' <nil>.'
  else
  if AComponent.Owner.Name <> '' then
    Result := Result + ' ' + AComponent.Owner.Name + '.'
  else
    Result := Result + ' <no name>.';
  if AComponent.Name <> '' then
    Result := Result + AComponent.Name
  else
    Result := Result + '<no name>';
  if IncludeClass then
    Result := Result + '(' + AComponent.ClassName + ')';
end;

//------------------------------------------------------------------------------
//Implementation of functions that allow compatibility between FPC and Delphi
//in using UTF8.

function iboLength(const str: string) : integer;
begin
{$IFDEF FPC}
  Result:=UTF8Length(str);
{$ELSE}
  Result:=Length(str);
{$ENDIF}
end;

function iboPos(const SearchForText, SearchInText: string) : integer;
begin
{$IFDEF FPC}
  Result:=UTF8Pos(SearchForText, SearchInText);
{$ELSE}
  Result:=Pos(SearchForText, SearchInText);
{$ENDIF}
end;

function iboCopy(const s: string; StartCharIndex, CharCount: Integer): string;
begin
{$IFDEF FPC}
  Result:=UTF8Copy(s, StartCharIndex, CharCount);
{$ELSE}
  Result:=Copy(s, StartCharIndex, CharCount);
{$ENDIF}
end;

procedure iboDelete(var s: String; StartCharIndex, CharCount: Integer);
begin
{$IFDEF FPC}
  UTF8Delete(s, StartCharIndex, CharCount);
{$ELSE}
  Delete(s, StartCharIndex, CharCount);
{$ENDIF}
end;

procedure iboInsert(const source: String; var s: string; StartCharIndex: Integer);
begin
{$IFDEF FPC}
  UTF8Insert(source, s, StartCharIndex);
{$ELSE}
  Insert(source, s, StartCharIndex);
{$ENDIF}
end;

function iboLowerCase(const s: String): String;
begin
{$IFDEF FPC}
  Result:=UTF8LowerCase(s);
{$ELSE}
  Result:=LowerCase(s);
{$ENDIF}
end;

function iboUpperCase(const s: String): String;
begin
{$IFDEF FPC}
Result:=UTF8UpperCase(s);
{$ELSE}
Result:=UpperCase(s);
{$ENDIF}
end;

{----}

{$IFDEF IBO_VCL2009_OR_GREATER}
function iboLength(const str: ansistring) : integer;
begin
{$IFDEF FPC}
  Result:=UTF8Length(str);
{$ELSE}
  Result:=Length(str);
{$ENDIF}
end;

function iboPos(const SearchForText, SearchInText: ansistring) : integer;
begin
{$IFDEF FPC}
  Result:=UTF8Pos(SearchForText, SearchInText);
{$ELSE}
  Result:=Pos(SearchForText, SearchInText);
{$ENDIF}
end;

function iboCopy(const s: ansistring; StartCharIndex, CharCount: Integer): ansistring;
begin
{$IFDEF FPC}
  Result:=UTF8Copy(s, StartCharIndex, CharCount);
{$ELSE}
  Result:=Copy(s, StartCharIndex, CharCount);
{$ENDIF}
end;

procedure iboDelete(var s: ansistring; StartCharIndex, CharCount: Integer);
begin
{$IFDEF FPC}
  UTF8Delete(s, StartCharIndex, CharCount);
{$ELSE}
  Delete(s, StartCharIndex, CharCount);
{$ENDIF}
end;

procedure iboInsert(const source: ansistring; var s: ansistring; StartCharIndex: Integer);
begin
{$IFDEF FPC}
  UTF8Insert(source, s, StartCharIndex);
{$ELSE}
  Insert(source, s, StartCharIndex);
{$ENDIF}
end;

function iboLowerCase(const s: ansistring): ansistring;
begin
{$IFDEF FPC}
  Result := UTF8LowerCase(s);
{$ELSE}
  Result := ansistring( LowerCase( string( s )));
{$ENDIF}
end;

function iboUpperCase(const s: ansistring): ansistring;
begin
{$IFDEF FPC}
Result := UTF8UpperCase(s);
{$ELSE}
Result := ansistring( UpperCase( string( s )));
{$ENDIF}
end;
{$ENDIF}
{------------------------------------------------------------------------------} 

end.
