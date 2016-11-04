{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_StatementSource                                                           }
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

{: This unit contains the TIB_StatementSource component.}
unit
  IB_StatementSource;

interface

uses
  Classes, IB_Components;

type
{: This component is mostly used as an internal object used to make another
component statement aware. By placing it on a form you can also make your
form become statement aware.
<br><br>
I use this extensively throughout the IB_SQL sample application.}
TIB_StatementSource = class( TIB_StatementLink )
{$I IB_Component.pbl}
private
{ Event Storage Fields }
  FBeforeAssignment: TIB_StmtLinkEvent;
  FAfterAssignment: TIB_StmtLinkEvent;
  FBeforePrepare: TIB_StmtLinkEvent;
  FAfterPrepare: TIB_StmtLinkEvent;
  FBeforeUnprepare: TIB_StmtLinkEvent;
  FAfterUnprepare: TIB_StmtLinkEvent;
  FBeforeExecute: TIB_StmtLinkEvent;
  FAfterExecute: TIB_StmtLinkEvent;
  FBeforeExecDDL: TIB_StmtLinkEvent;
  FAfterExecDDL: TIB_StmtLinkEvent;
  FBeforeExecDML: TIB_StmtLinkEvent;
  FAfterExecDML: TIB_StmtLinkEvent;
  FOnActiveChange: TIB_StmtLinkEvent;
  FOnLayoutChanged: TIB_StmtLinkEvent;
  FOnParamsStateChanged: TIB_StmtLinkEvent;
  FOnFieldsStateChanged: TIB_StmtLinkEvent;
  FOnParamsDataChange: TIB_ColLinkEvent;
  FOnParamsUpdateData: TIB_ColLinkEvent;
  FOnFieldsDataChange: TIB_ColLinkEvent;
  FOnFieldsUpdateData: TIB_ColLinkEvent;
protected
{ Methods }
  procedure ProcessEvent( AEvent: TIB_StatementEventType;
                          Info: longint ); override;
published
{ Inherited Properties }
  property Statement;
{ Events }
  property BeforeAssignment: TIB_StmtLinkEvent read FBeforeAssignment
                                               write FBeforeAssignment;
  property AfterAssignment: TIB_StmtLinkEvent read FAfterAssignment
                                              write FAfterAssignment;
  property BeforePrepare: TIB_StmtLinkEvent read FBeforePrepare
                                            write FBeforePrepare;
  property AfterPrepare: TIB_StmtLinkEvent read FAfterPrepare
                                           write FAfterPrepare;
  property BeforeUnprepare: TIB_StmtLinkEvent read FBeforeUnprepare
                                              write FBeforeUnprepare;
  property AfterUnprepare: TIB_StmtLinkEvent read FAfterUnprepare
                                             write FAfterUnprepare;
  property BeforeExecute: TIB_StmtLinkEvent read FBeforeExecute
                                            write FBeforeExecute;
  property AfterExecute: TIB_StmtLinkEvent read FAfterExecute
                                           write FAfterExecute;
  property BeforeExecDDL: TIB_StmtLinkEvent read FBeforeExecDDL
                                            write FBeforeExecDDL;
  property AfterExecDDL: TIB_StmtLinkEvent read FAfterExecDDL
                                           write FAfterExecDDL;
  property BeforeExecDML: TIB_StmtLinkEvent read FBeforeExecDML
                                            write FBeforeExecDML;
  property AfterExecDML: TIB_StmtLinkEvent read FAfterExecDML
                                           write FAfterExecDML;
  property OnPreparedChanged;
  property OnActiveChange: TIB_StmtLinkEvent read FOnActiveChange
                                              write FOnActiveChange;
  property OnLayoutChanged: TIB_StmtLinkEvent read FOnLayoutChanged
                                              write FOnLayoutChanged;
  property OnParamsDataChange: TIB_ColLinkEvent read FOnParamsDataChange
                                                 write FOnParamsDataChange;
  property OnParamsUpdateData: TIB_ColLinkEvent read FOnParamsUpdateData
                                                write FOnParamsUpdateData;
  property OnParamsStateChanged: TIB_StmtLinkEvent read FOnParamsStateChanged
                                                  write FOnParamsStateChanged;
  property OnFieldsDataChange: TIB_ColLinkEvent read FOnFieldsDataChange
                                                write FOnFieldsDataChange;
  property OnFieldsUpdateData: TIB_ColLinkEvent read FOnFieldsUpdateData
                                                write FOnFieldsUpdateData;
  property OnFieldsStateChanged: TIB_StmtLinkEvent read FOnFieldsStateChanged
                                                  write FOnFieldsStateChanged;
end; { TIB_StatementSource }

implementation

procedure TIB_StatementSource.ProcessEvent( AEvent: TIB_StatementEventType;
                                            Info: longint );
begin
  if not ( csDestroying in ComponentState ) then case AEvent of
  setBeforeAssignment:
    if Assigned( BeforeAssignment ) then BeforeAssignment( Self, Statement );
  setAfterAssignment: 
    if Assigned( AfterAssignment ) then AfterAssignment( Self, Statement );
  setBeforePrepare:
    if Assigned( BeforePrepare ) then BeforePrepare( Self, Statement );
  setAfterPrepare: 
    if Assigned( AfterPrepare ) then AfterPrepare( Self, Statement );
  setBeforeUnprepare: 
    if Assigned( BeforeUnprepare ) then BeforeUnprepare( Self, Statement );
  setAfterUnprepare: 
    if Assigned( AfterUnprepare ) then AfterUnprepare( Self, Statement );
  setBeforeExecute: 
    if Assigned( BeforeExecute ) then BeforeExecute( Self, Statement );
  setAfterExecute: 
    if Assigned( AfterExecute ) then AfterExecute( Self, Statement );
  setBeforeExecDDL: 
    if Assigned( BeforeExecDDL ) then BeforeExecDDL( Self, Statement );
  setAfterExecDDL: 
    if Assigned( AfterExecDDL ) then AfterExecDDL( Self, Statement );
  setBeforeExecDML: 
    if Assigned( BeforeExecDML ) then BeforeExecDML( Self, Statement );
  setAfterExecDML: 
    if Assigned( AfterExecDML ) then AfterExecDML( Self, Statement );
  setPreparedChanged: 
    inherited ProcessEvent( AEvent, Info );
  setActiveChange:
    if Assigned( OnActiveChange ) then OnActiveChange( Self, Statement );
  setLayoutChanged: 
    if Assigned( OnLayoutChanged ) then OnLayoutChanged( Self, Statement );
  setParamsStateChanged: 
    if Assigned( OnParamsStateChanged ) then begin
      OnParamsStateChanged( Self, Statement );
    end;
  setFieldsStateChanged: 
    if Assigned( OnFieldsStateChanged ) then begin
      OnFieldsStateChanged( Self, Statement );
    end;
  setParamsDataChange: 
    if Assigned( FOnParamsDataChange ) then begin
      FOnParamsDataChange( Self, Statement, TIB_Column( Info ));
    end;
  setParamsUpdateData: 
    if Assigned( FOnParamsUpdateData ) then begin
      FOnParamsUpdateData( Self, Statement, TIB_Column( Info ));
    end;
  setFieldsDataChange: 
    if Assigned( FOnFieldsDataChange ) then begin
      FOnFieldsDataChange( Self, Statement, TIB_Column( Info ));
    end;
  setFieldsUpdateData: 
    if Assigned( FOnFieldsUpdateData ) then begin
      FOnFieldsUpdateData( Self, Statement, TIB_Column( Info ));
    end;
  end;
end;

end.
