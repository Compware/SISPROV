{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_MaskInterface                                                             }
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
{  Original Author: Geoff Worboys                                              }
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}

unit
  IB_MaskInterface;

interface

type

// To create a mask processor with this interface, derive from
// TInterfacedObject (or derivation) to ensure the object will
// free itself when the reference count reaches 0.

IIB_MaskProcessor = interface
['{AC84351E-3849-4E26-94A7-E7524D1A955C}']
  // Return true if a mask is actually defined
  function IsMasked: boolean;
  // Return text resulting from an empty string passed through the mask
  function EmptyText: string;
  // Format AVal using the currently defined mask
  function FormatText(AVal: string): string;
  // Retreive the IB styled (::XX::MMMMM) mask string
  function GetMask: string;
  // Assign a new mask (given a ::XX::MMMMM mask string)
  procedure SetMask(AVal: string);
end;

TIB_CreateMaskProcessor = function(const MaskStr: string): IIB_MaskProcessor;

// Assign a function to this variable to allow IBObjects to create instances
// of the desired mask processor.  The supplied function should save any
// existing assignment and call that function if the string supplied
// to the function does not apply to the particular implementation.  This
// will allow multiple different mask processors to be used simultaneously by
// IBO.  There is an example of how to do this in the EnhComponents
// Telesis_MaskEnh.pas unit.
var
  IB_CreateMaskProcessor: TIB_CreateMaskProcessor;

implementation

initialization
  IB_CreateMaskProcessor := nil;

end.



