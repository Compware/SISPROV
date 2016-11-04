{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_ConnectionSource                                                          }
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
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}

{: This unit contains the IB_ConnectionSource component.}
unit
  IB_ConnectionSource;

interface

uses
  Classes, IB_Components;

type
{: This component is used mostly as an internal or contained object in order
to make another component or object connection aware. One example is the
IB_ConnectionBar control.
<br><br>
However, it comes in very handy to make a form connection aware. This can be
seen in the IBF_Base.PAS/DFM form file. It is used as a base class for form
inheritance all throughout the IB_SQL sample application.}
TIB_ConnectionSource = class(TIB_ConnectionLink)
{$I IB_Component.pbl}
private
  FBeforeAssignment: TIB_ConnectionLinkEvent;
  FAfterAssignment: TIB_ConnectionLinkEvent;
  FBeforeExecDDL: TIB_ConnectionLinkEvent;
  FAfterExecDDL: TIB_ConnectionLinkEvent;
  FBeforeConnect: TIB_ConnectionLinkEvent;
  FAfterConnect: TIB_ConnectionLinkEvent;
  FBeforeDisconnect: TIB_ConnectionLinkEvent;
  FAfterDisconnect: TIB_ConnectionLinkEvent;
  FBeforeCreateDatabase: TIB_ConnectionLinkEvent;
  FAfterCreateDatabase: TIB_ConnectionLinkEvent;
  FBeforeDropDatabase: TIB_ConnectionLinkEvent;
  FAfterDropDatabase: TIB_ConnectionLinkEvent;
  FOnConnectedChanged: TIB_ConnectionLinkEvent;
public
  procedure ProcessEvent( AEvent: TIB_ConnectionEventType ); override;
published
  property IB_Connection;
  property ReceiveFocus;
  property OnReceiveFocus;
published
  property BeforeAssignment: TIB_ConnectionLinkEvent read FBeforeAssignment
                                                     write FBeforeAssignment;
  property AfterAssignment: TIB_ConnectionLinkEvent read FAfterAssignment
                                                    write FAfterAssignment;
  property BeforeExecDDL: TIB_ConnectionLinkEvent read FBeforeExecDDL
                                                  write FBeforeExecDDL;
  property AfterExecDDL: TIB_ConnectionLinkEvent read FAfterExecDDL
                                                 write FAfterExecDDL;
  property BeforeConnect: TIB_ConnectionLinkEvent read FBeforeConnect
                                                  write FBeforeConnect;
  property AfterConnect: TIB_ConnectionLinkEvent read FAfterConnect
                                                 write FAfterConnect;
  property BeforeDisconnect: TIB_ConnectionLinkEvent read FBeforeDisconnect
                                                     write FBeforeDisconnect;
  property AfterDisconnect: TIB_ConnectionLinkEvent read FAfterDisconnect
                                                    write FAfterDisconnect;
  property BeforeCreateDatabase: TIB_ConnectionLinkEvent
      read FBeforeCreateDatabase
     write FBeforeCreateDatabase;
  property AfterCreateDatabase: TIB_ConnectionLinkEvent
      read FAfterCreateDatabase
     write FAfterCreateDatabase;
  property BeforeDropDatabase: TIB_ConnectionLinkEvent
      read FBeforeDropDatabase
     write FBeforeDropDatabase;
  property AfterDropDatabase: TIB_ConnectionLinkEvent
      read FAfterDropDatabase
     write FAfterDropDatabase;
  property OnConnectedChanged: TIB_ConnectionLinkEvent
      read FOnConnectedChanged
     write FOnConnectedChanged;
end;

implementation

procedure TIB_ConnectionSource.ProcessEvent( AEvent: TIB_ConnectionEventType );
begin
  if not ( csDestroying in ComponentState ) then case AEvent of
    cetBeforeAssignment:
      if Assigned(BeforeAssignment) then
        BeforeAssignment(Self, IB_Connection);
    cetAfterAssignment: begin
      if Assigned(AfterAssignment) then begin
        AfterAssignment( Self, IB_Connection );
      end;
    end;
    cetBeforeExecDDL:
      if Assigned ( FBeforeExecDDL ) then
        FBeforeExecDDL( Self, IB_Connection );
    cetAfterExecDDL:
      if Assigned ( FAfterExecDDL ) then
        FAfterExecDDL( Self, IB_Connection );
    cetConnectedChanged:
      if Assigned ( FOnConnectedChanged ) then
        FOnConnectedChanged( Self, IB_Connection );
    cetBeforeCreateDatabase:
      if Assigned ( FBeforeCreateDatabase ) then
        FBeforeCreateDatabase( Self, IB_Connection );
    cetBeforeConnect:
      if Assigned ( FBeforeConnect ) then
        FBeforeConnect( Self, IB_Connection );
    cetAfterConnect:
      if Assigned ( FAfterConnect ) then
        FAfterConnect( Self, IB_Connection );
    cetBeforeDisconnect:
      if Assigned ( FBeforeDisconnect ) then
        FBeforeDisconnect( Self, IB_Connection );
    cetAfterDisconnect:
      if Assigned ( FAfterDisconnect ) then
        FAfterDisconnect( Self, IB_Connection );
    cetAfterCreateDatabase:
      if Assigned ( FAfterCreateDatabase ) then
        FAfterCreateDatabase( Self, IB_Connection );
    cetBeforeDropDatabase:
      if Assigned ( FBeforeDropDatabase ) then
        FBeforeDropDatabase( Self, IB_Connection );
    cetAfterDropDatabase:
      if Assigned ( FAfterDropDatabase ) then
        FAfterDropDatabase( Self, IB_Connection );
  end;
end;

end.
