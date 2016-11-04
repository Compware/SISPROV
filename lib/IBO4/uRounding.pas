{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

unit
  uRounding;

{$INCLUDE IB_Directives.inc}

{
  NewLook Financial Rounding and Scaling Routines

  Note: Financial rounding i.e. Round( x ) = -Round( -x )

  Copyright 1997 NewLook Through Old Windows Limited
}

interface

const
	MAX_ROUNDING_PLACES = 12;

{ Compares two numbers for less than with specified number of decimal places }
function LessReal(Value1, Value2: Extended; Places: integer): Boolean;

{ Compares two numbers for equality with specified number of decimal places }
function EqualReal(Value1, Value2: Extended; Places: integer): Boolean;

{ Compares two numbers for greater than with specified number of decimal places }
function GreatReal(Value1, Value2: Extended; Places: integer): Boolean;

{ Rounds up to largest whole number e.g. 1.1 => 2.0 }
function RoundUp(Value: Extended; Places: integer): Extended;

{ Rounds downs to smallest whole number i.e. 1.9 => 1.0 }
function RoundDown(Value: Extended; Places: integer): Extended;

{ Rounds to nearest whole number with exact .5 up i.e. 1.5 => 2.0 }
function RoundNear(Value: Extended; Places: integer): Extended;

{ Rounds to nearest whole number with exact .5 down i.e. 1.5 => 1.0 }
function RoundHalf(Value: Extended; Places: integer): Extended;
{ Largely for NZ counter-intuitive GST rounding }

{ Rounds to nearest whole number with exact .5 either up or down  }
function RoundBool(Value: Extended; Places: integer; HalfDown: Boolean): Extended;

{ Scales up floating point Value into whole integer Value  }
function ScaleUp(Value: Extended; Places: integer): Integer;

{ Scales down whole integer Value into floating point Value }
function ScaleDown(Value: Integer; Places: integer): Extended;

{ Checks double for valid values for 52-bit integer }
function ValidInt52(Value: Double): Boolean;

const
  NearCW: Word = $133F;
  FloorCW: Word = $173F;
  CeilCW: Word = $1B3F;
  Half: Double = 0.5;
  Epsilon: Double = 0.001;

implementation

uses
  SysUtils;

const
  TenPower: array [0..MAX_ROUNDING_PLACES] of Double = (
    1.0,
    10.0,
    100.0,
    1000.0,
    10000.0,
    100000.0,
    1000000.0,
    10000000.0,
    100000000.0,
    1000000000.0,
    10000000000.0,
    100000000000.0,
    1000000000000.0
  );

  Accuracy: array [0..MAX_ROUNDING_PLACES] of Double = (
    0.5,
    0.05,
    0.005,
    0.0005,
    0.00005,
    0.000005,
    0.0000005,
    0.00000005,
    0.000000005,
    0.0000000005,
    0.00000000005,
    0.000000000005,
    0.0000000000005
  );

procedure CheckPlaces(Places: integer);
begin
  if Places > MAX_ROUNDING_PLACES then begin
    raise Exception.Create('Rounding precision too large')
  end;
end;

function LessReal(Value1, Value2: Extended; Places: integer): Boolean;
begin
  CheckPlaces(Places);
  Result := Value1 < Value2 - Accuracy[Places];
end;

function EqualReal(Value1, Value2: Extended; Places: integer): Boolean;
begin
  CheckPlaces(Places);
  Result := Abs(Value1 - Value2) < Accuracy[Places];
end;

function GreatReal(Value1, Value2: Extended; Places: integer): Boolean;
begin
  CheckPlaces(Places);
  Result := Value1 > Value2 + Accuracy[Places];
end;

{$IFDEF FPC}
function ValidInt52(Value: Double): Boolean;

begin
  Result:=True
end;
{$ELSE}
function ValidInt52(Value: Double): Boolean; assembler;
asm
  FLD   QWORD [EBP+8]
  FXAM
  FSTSW AX
  TEST  AH,$40          { Zero/Denormal? }
  JNZ   @@Good
  TEST  AH,$01          { Inf/NaN? }
  JNZ   @@Bad
  MOV   AX,[EBP+8+6]    { Scale }
  AND   AX,$7FF0        { Mask Sign/Mantissa }
  SHR   AX,4
  SUB   AX,$3FF         { Subtract Bias }
  JB    @@Bad
  CMP   AX,52
  JA    @@Bad         
  FLD   ST(0)           { No Fractions? }
  FRNDINT
  FCOMP
  FSTSW AX
  SAHF
  JE    @@Good
@@Bad:
  XOR   AL,AL
  JMP   @@Fini
@@Good:
  MOV   AL,1
@@Fini:
  FSTP  ST(0)           { Pop FPU Stack }
end;
{$ENDIF}

{$IFDEF FPC}
function _RoundBool(Value: Extended; Scale: Double; HalfDown: Boolean): Extended;
begin
  Result:=Value;
end;

{$ELSE}
function _RoundBool(Value: Extended; Scale: Double; HalfDown: Boolean): Extended; assembler;
asm
  SUB   ESP,2
  FLD   Value
  FXAM
  FSTSW [ESP]
  MOV   AH,[ESP+1]
  TEST  AH,$41 { Zero/Den/Nan/Inf? }
  JNZ   @@Fini
  TEST  AH,$02 { Sign? }
  JZ    @@Skip
  XOR   AL, 1
@@Skip:
  FMUL  Scale
  FSTCW [ESP]
  TEST  AL,AL
  JNZ   @@SubCeil
@@AddFloor:
  FADD  QWORD [Half]
  FADD  QWORD [Epsilon]
  FLDCW FloorCW
  JMP   @@Round
@@SubCeil:
  FSUB  QWORD [Half]
  FSUB  QWORD [Epsilon]
  FLDCW CeilCW
@@Round:
  FRNDINT
  FDIV  Scale
  FLDCW [ESP]
@@Fini:
  ADD   ESP,2
end;
{$ENDIF}

{$IFDEF FPC}
function _RoundUp(Value: Extended; Scale: Double): Extended;
begin
  Result:=Value;
end;

function _RoundDown(Value: Extended; Scale: Double): Extended;
begin
  Result:=Value;
end;

function _ScaleUp(Value: Extended; Scale: Double): Integer;
begin
  Result:=Round(Value);
end;
{$ELSE}
function _RoundUp(Value: Extended; Scale: Double): Extended; assembler;
asm
  SUB   ESP,2
  FLD   Value
  FXAM
  FSTSW AX
  TEST  AH,$41 { Zero/Den/Nan/Inf? }
  JNZ   @@Fini
  FMUL  Scale
  FSTCW [ESP]
  TEST  AH,$02 { Sign? }
  JZ    @@SubCeil
@@AddFloor:
  FADD  QWORD [Epsilon]
  FLDCW FloorCW
  JMP   @@Round
@@SubCeil:
  FSUB  QWORD [Epsilon]
  FLDCW CeilCW
@@Round:
  FRNDINT
  FDIV  Scale
  FLDCW [ESP]
@@Fini:
  ADD   ESP,2
end;

function _RoundDown(Value: Extended; Scale: Double): Extended; assembler;
asm
  SUB   ESP,2
  FLD   Value
  FXAM
  FSTSW AX
  TEST  AH,$41 { Zero/Den/Nan/Inf? }
  JNZ   @@Fini
  FMUL  Scale
  FSTCW [ESP]
  TEST  AH,$02 { Sign? }
  JNZ    @@SubCeil
@@AddFloor:
  FADD  QWORD [Epsilon]
  FLDCW FloorCW
  JMP   @@Round
@@SubCeil:
  FSUB  QWORD [Epsilon]
  FLDCW CeilCW
@@Round:
  FRNDINT
  FDIV  Scale
  FLDCW [ESP]
@@Fini:
  ADD   ESP,2
end;

function _ScaleUp(Value: Extended; Scale: Double): Integer; assembler;
asm
  SUB   ESP,4
  FLD   Value
  FXAM
  FSTSW AX
  TEST  AH,$41 { Zero/Den/Nan/Inf? }
  JNZ   @@Fini
  FMUL  Scale
  FSTCW [ESP]
  TEST  AH,$02 { Sign? }
  JNZ   @@SubCeil
@@AddFloor:
  FADD  QWORD [Half]
  FADD  QWORD [Epsilon]
  FLDCW FloorCW
  JMP   @@Round
@@SubCeil:
  FSUB  QWORD [Half]
  FSUB  QWORD [Epsilon]
  FLDCW CeilCW
@@Round:
  FRNDINT
  FLDCW [ESP]
@@Fini:
  FISTP DWORD [ESP]
  POP   EAX
end;
{$endif}
function RoundNear(Value: Extended; Places: integer): Extended;
begin
  CheckPlaces(Places);
  Result := _RoundBool(Value, TenPower[Places], False);
end;

function RoundHalf(Value: Extended; Places: integer): Extended;
begin
  CheckPlaces(Places);
  Result := _RoundBool(Value, TenPower[Places], True);
end;

function RoundUp(Value: Extended; Places: integer): Extended;
begin
  CheckPlaces(Places);
  Result := _RoundUp(Value, TenPower[Places]);
end;

function RoundDown(Value: Extended; Places: integer): Extended;
begin
  CheckPlaces(Places);
  Result := _RoundDown(Value, TenPower[Places]);
end;

function RoundBool( Value: Extended;
                    Places: integer;
                    HalfDown: Boolean): Extended;
begin
  CheckPlaces(Places);
  Result := _RoundBool(Value, TenPower[Places], HalfDown);
end;

function ScaleUp(Value: Extended; Places: integer): Integer;
begin
  CheckPlaces(Places);
  Result := _ScaleUp(Value, TenPower[Places]);
end;

function ScaleDown(Value: Integer; Places: integer): Extended;
begin
  CheckPlaces(Places);
  Result := Value / TenPower[Places];
end;

end.
