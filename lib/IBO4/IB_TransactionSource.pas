{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_TransactionSource                                                         }
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

{: This unit contains the IB_TransactionSource component.}
unit
  IB_TransactionSource;

interface

uses
  Classes, IB_Components;

type
{: This component is used mostly as an internal or contained object in order
to make another component or object transaction aware. One example is the
IB_TransactionBar control.
<br><br>
However, it comes in very handy to make a form transaction aware. This can be
seen in the IBF_Base.PAS/DFM form file. It is used as a base class for form
inheritance all throughout the IB_SQL sample application.}
TIB_TransactionSource = class( TIB_TransactionLink )
{$I IB_Component.pbl}
private
{ Event Storage Fields }
  FBeforeAssignment: TIB_TransactionLinkEvent;
  FAfterAssignment: TIB_TransactionLinkEvent;
  FBeforeStart: TIB_TransactionLinkEvent;
  FAfterStart: TIB_TransactionLinkEvent;
  FBeforeCommitRetaining: TIB_TransactionLinkEvent;
  FAfterCommitRetaining: TIB_TransactionLinkEvent;
  FBeforeCommit: TIB_TransactionLinkEvent;
  FAfterCommit: TIB_TransactionLinkEvent;
  FBeforeRollback: TIB_TransactionLinkEvent;
  FAfterRollback: TIB_TransactionLinkEvent;
  FBeforeRollbackRetaining: TIB_TransactionLinkEvent;
  FAfterRollbackRetaining: TIB_TransactionLinkEvent;
  FBeforeEnd: TIB_TransactionLinkEvent;
  FAfterEnd: TIB_TransactionLinkEvent;
  FOnPostPendingChanged: TIB_TransactionLinkEvent;
  FOnStatusChanged: TIB_TransactionLinkEvent;
  procedure SetPostPendingChanged( AValue: TIB_TransactionLinkEvent );
public
{ Inherited methods }
  procedure ProcessEvent( AEvent: TIB_TransactionEventType ); override;
  
published
{ Events }
  property BeforeAssignment: TIB_TransactionLinkEvent
        read FBeforeAssignment
       write FBeforeAssignment;
  property AfterAssignment: TIB_TransactionLinkEvent
        read FAfterAssignment
       write FAfterAssignment;
  property BeforeStart: TIB_TransactionLinkEvent
        read FBeforeStart
       write FBeforeStart;
  property AfterStart: TIB_TransactionLinkEvent
        read FAfterStart
       write FAfterStart;
  property BeforeCommitRetaining: TIB_TransactionLinkEvent
        read FBeforeCommitRetaining
       write FBeforeCommitRetaining;
  property AfterCommitRetaining: TIB_TransactionLinkEvent
        read FAfterCommitRetaining
       write FAfterCommitRetaining;
  property BeforeCommit: TIB_TransactionLinkEvent
        read FBeforeCommit
       write FBeforeCommit;
  property AfterCommit: TIB_TransactionLinkEvent
        read FAfterCommit
       write FAfterCommit;
  property BeforeRollback: TIB_TransactionLinkEvent
        read FBeforeRollback
       write FBeforeRollback;
  property AfterRollback: TIB_TransactionLinkEvent
        read FAfterRollback
       write FAfterRollback;
  property BeforeRollbackRetaining: TIB_TransactionLinkEvent
        read FBeforeRollbackRetaining
       write FBeforeRollbackRetaining;
  property AfterRollbackRetaining: TIB_TransactionLinkEvent
        read FAfterRollbackRetaining
       write FAfterRollbackRetaining;
  property BeforeEnd: TIB_TransactionLinkEvent
        read FBeforeEnd
       write FBeforeEnd;
  property AfterEnd: TIB_TransactionLinkEvent
        read FAfterEnd
       write FAfterEnd;
  property OnPostPendingChanged: TIB_TransactionLinkEvent
        read FOnPostPendingChanged
       write SetPostPendingChanged;
  property OnStatusChanged: TIB_TransactionLinkEvent
        read FOnStatusChanged
       write FOnStatusChanged;
end;

implementation

procedure TIB_TransactionSource.ProcessEvent(AEvent: TIB_TransactionEventType);
begin
  if AEvent = tetBeforeAssignment then begin
    if Assigned( IB_Transaction ) and
       Assigned( OnPostPendingChanged ) then begin
      IB_Transaction.EndPostPendingNotify; 
    end;
  end else if AEvent = tetAfterAssignment then begin
    if Assigned( IB_Transaction ) and
       Assigned( OnPostPendingChanged ) then begin
      IB_Transaction.BeginPostPendingNotify; 
    end;
  end;
  inherited ProcessEvent( AEvent );
  if not ( csLoading in ComponentState ) and
     not ( csDestroying in ComponentState ) then case AEvent of
    tetBeforeAssignment: if Assigned( BeforeAssignment ) then begin
      BeforeAssignment(Self, IB_Transaction);
    end;
    tetAfterAssignment: if Assigned( AfterAssignment ) then begin
      AfterAssignment( Self, IB_Transaction );
    end;
    tetBeforeStart: if Assigned( BeforeStart ) then begin
      BeforeStart( Self, IB_Transaction );
    end;
    tetAfterStart: if Assigned( AfterStart ) then begin
      AfterStart( Self, IB_Transaction );
    end;
    tetBeforeCommit: if Assigned( BeforeCommit ) then begin
      BeforeCommit( Self, IB_Transaction );
    end;
    tetAfterCommit: if Assigned( AfterCommit ) then begin
      AfterCommit( Self, IB_Transaction );
    end;
    tetBeforeCommitRetaining: if Assigned( BeforeCommitRetaining ) then begin
      BeforeCommitRetaining( Self, IB_Transaction );
    end;
    tetAfterCommitRetaining: if Assigned( AfterCommitRetaining ) then begin
      AfterCommitRetaining( Self, IB_Transaction );
    end;
    tetBeforeRollback: if Assigned( BeforeRollback ) then begin
      BeforeRollback( Self, IB_Transaction );
    end;
    tetAfterRollback: if Assigned( AfterRollback ) then begin
      AfterRollback( Self, IB_Transaction );
    end;
    tetBeforeRollbackRetaining: if Assigned( BeforeRollbackRetaining) then begin
      BeforeRollbackRetaining( Self, IB_Transaction );
    end;
    tetAfterRollbackRetaining: if Assigned( AfterRollbackRetaining ) then begin
      AfterRollbackRetaining( Self, IB_Transaction );
    end;
    tetBeforeEnd: if Assigned( BeforeEnd ) then begin
      BeforeEnd( Self, IB_Transaction );
    end;
    tetAfterEnd: if Assigned( AfterEnd ) then begin
      AfterEnd( Self, IB_Transaction );
    end;
    tetOnPostPendingChanged: if Assigned( OnPostPendingChanged ) then begin
      OnPostPendingChanged( Self, IB_Transaction );
    end;
    tetOnStatusChanged: if Assigned( OnStatusChanged ) then begin
      OnStatusChanged( Self, IB_Transaction );
    end;
  end;
end;

procedure TIB_TransactionSource.SetPostPendingChanged(
                                             AValue: TIB_TransactionLinkEvent );
begin
  if Assigned( FOnPostPendingChanged ) <> Assigned( AValue ) then begin
    if Assigned( IB_Transaction ) then begin
      if Assigned( AValue ) then begin
        IB_Transaction.BeginPostPendingNotify;
      end else begin
        IB_Transaction.EndPostPendingNotify;
      end;
    end;
  end;
  FOnPostPendingChanged := AValue;
end;

end.
