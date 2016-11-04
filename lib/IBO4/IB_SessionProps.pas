{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_SessionProps                                                              }
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

{: This unit provides access to the default session created automatically.}
unit
  IB_SessionProps;

interface

uses
  SysUtils, Classes, Graphics,

  IB_Constants,
  IB_Session,
  IB_Components;

type
  TIB_ScreenCursor = smallint;

{: This class surfaces the properties and events of the default component
session so that they can be modified at design time.
<br><br>
With this component it is possible to turn off the screen cursor handling and
change the colors used in data aware controls when the ColorScheme property
of a TIB_Dataset is true.
<br><br>
It is also possible to intercept all error codes from API calls and log them
or even override them with another action. Perhaps a more user friendly error
message could be presented.
<br><br>
If more than ONE of these instances exist at one time in an application
they will compete for the same settings. In this case, the last one to touch the
default session's properties or events will take effect and any other settings
will be overwritten.
<br><br>
It can also cause some interesting anomolies that should be harmless during
design-time if more than one project is open and they each have a
TIB_SessionProps component in use. This is because there is only one default
session for them to share during design-time. I have it saving the property
values in the DFM independant of the settings stored in the default session so
each project will stay isolated from one another as to what gets stored in the
DFM.
<br><Br>
Try to keep this component among the first in the component creation order.}
TIB_SessionProps = class(TIB_Component)
private
  FAllowDefaultConnection: boolean;
  FAllowDefaultTransaction: boolean;
  FBusyCursor: TIB_ScreenCursor{TCursor};
  FStoreActive: boolean;
  FYieldCursor: TIB_ScreenCursor{TCursor};
  FUseCursor: boolean;
  FEditingColor: TColor;
  FInsertingColor: TColor;
  FDeletingColor: TColor;
  FSearchingColor: TColor;
  FReadOnlyColor: TColor;
  FSelectedColor: TColor;
  FInvalidColor: TColor;
  FPreparedColor: TColor;
  FBrowsingColor: TColor;
  FTimerInterval: cardinal;
  FOnBeginBusy: TNotifyEvent;
  FOnEndBusy: TNotifyEvent;
  FOnBeginYield: TNotifyEvent;
  FOnEndYield: TNotifyEvent;
  FOnGetDataLinkColor: TIB_GetDataLinkColorEvent;
  FOnSessionTimer: TIB_SessionTimerEvent;
  FOnWakeUp: TNotifyEvent;
  procedure SetAllowDefaultConnection( AValue: boolean );
  procedure SetAllowDefaultTransaction( AValue: boolean );
  procedure SetBrowsingColor( AValue: TColor );
  procedure SetBusyCursor( AValue: TIB_ScreenCursor{TCursor} );
  procedure SetDeletingColor( AValue: TColor );
  procedure SetEditingColor( AValue: TColor );
  procedure SetInvalidColor( AValue: TColor );
  procedure SetInsertingColor( AValue: TColor );
  procedure SetOnBeginBusy( AValue: TNotifyEvent );
  procedure SetOnBeginYield( AValue: TNotifyEvent );
  procedure SetOnEndBusy( AValue: TNotifyEvent );
  procedure SetOnEndYield( AValue: TNotifyEvent );
  procedure SetOnGetDataLinkColor( AValue: TIB_GetDataLinkColorEvent );
  procedure SetOnSessionTimer( AValue: TIB_SessionTimerEvent );
  procedure SetPreparedColor( AValue: TColor );
  procedure SetReadOnlyColor( AValue: TColor );
  procedure SetSearchingColor( AValue: TColor );
  procedure SetSelectedColor( AValue: TColor );
  procedure SetStoreActive( AValue: boolean );
  procedure SetTimerInterval( AValue: cardinal );
  procedure SetUseCursor( AValue: boolean );
  procedure SetYieldCursor( AValue: TIB_ScreenCursor{TCursor} );
  function GetWakeup: TNotifyEvent;
  procedure SetWakeup( AValue: TNotifyEvent );
protected
  procedure SetOnError( AValue: TIB_ErrorEvent ); override;
public
  constructor Create( AOwner: TComponent ); override;
published

{: This property determines whether or not IBO will permit the default
connection for the session to be automatically assigned to a statement or
dataset that did not have its IB_Connection property explicitly assigned.}   
  property AllowDefaultConnection: boolean read FAllowDefaultConnection
                                           write SetAllowDefaultConnection
                                           stored true;
{: This property determines whether or not IBO will permit a default
internal transaction to be automatically assigned to a statement or
dataset that did not have its IB_Transaction property explicitly assigned.}
  property AllowDefaultTransaction: boolean read FAllowDefaultTransaction
                                            write SetAllowDefaultTransaction
                                            stored true;
{: Determines the cursor that will appear on the screen when a process is
active and there is no Yield indication.
<br><br>
The UseCursor property must be true for this to happen.}
  property BusyCursor: TIB_ScreenCursor{TCursor} read FBusyCursor
                                                 write SetBusyCursor;
{: This property determines whether or not the following properties are
stored in the DFM of the forms and datamodules. The purpose of this is to
avoid exceptions when loading forms that have dependancies in other forms
and a live connection cannot be obtained. This is mostly for design-time
convenience.
<br>
<br>TIB_Connection.Connected
<br>TIB_Statement.Prepared
<br>TIB_Dataset.Active}
  property StoreActive: boolean read FStoreActive write SetStoreActive;
{: This property controls the frequency that the session generates events to
the components (transactions only for now).
<br><br>
It is in intervals of thousanths of seconds. So, for two minutes, which is the
default (for the default session), enter 2000.
<br><br>
For explicit sessions the default is 0 which disables the timer. This is
because some models of threading may not work with the timer. So, I have it
disabled in order to avoid problems.}
  property TimerInterval: cardinal read FTimerInterval write SetTimerInterval;   
{: Determines if the Screen.Cursor should be adjusted when a process becomes
active.}
  property UseCursor: boolean read FUseCursor write SetUseCursor;
{: Determines the cursor that will appear on the screen when a process is
active and there is a Yield indication.
<br><br>
The UseCursor property must be true for this to happen.}
  property YieldCursor: TIB_ScreenCursor{TCursor} read FYieldCursor
                                                  write SetYieldCursor;
{: If ColorScheme is set to true for any IB_Dataset component then this
color will be used by all data aware controls that reference this dataset
when the dataset goes into dssEditing state.}
  property EditingColor: TColor read FEditingColor write SetEditingColor;
{: If ColorScheme is set to true for any IB_Dataset component then this
color will be used by all data aware controls that reference this dataset
when the dataset goes into dssInserting state.}
  property InsertingColor: TColor read FInsertingColor write SetInsertingColor;
{: If ColorScheme is set to true for any IB_Dataset component then this
color will be used by all data aware controls that reference this dataset
when the dataset goes into dssDeleting state.}
  property DeletingColor: TColor read FDeletingColor write SetDeletingColor;
{: If ColorScheme is set to true for any IB_Dataset component then this
color will be used by all data aware controls that reference this dataset
when the dataset goes into dssSearching state.}
  property SearchingColor: TColor read FSearchingColor write SetSearchingColor;
{: If ColorScheme is set to true for any IB_Dataset component then this
color will be used by all data aware controls that reference this dataset
when the dataset goes into a state above dssBrowse state and the control is
a ReadOnly control.}
  property ReadOnlyColor: TColor read FReadOnlyColor write SetReadOnlyColor;
{: The color used for rows in a grid that are selected via multi-select.}
  property SelectedColor: TColor read FSelectedColor write SetSelectedColor;
{: When a control is not attached to a datasource/dataset this is the color
that the control will show as.}
  property InvalidColor: TColor read FInvalidColor write SetInvalidColor;
{: When a control is not attached to a prepared dataset this is the color
that the control will show as.}
  property PreparedColor: TColor read FPreparedColor write SetPreparedColor;
{: This is the color that will show when the control is attached to a
dataset that is browsing a record.}
  property BrowsingColor: TColor read FBrowsingColor write SetBrowsingColor;
{: Event hook to give access to when the first process becomes active.
<br><br>
This event is only triggered when the first process becomes active and not
when other processes that are nested become active.}
  property OnBeginBusy: TNotifyEvent read FOnBeginBusy write SetOnBeginBusy;
{: Event hook to give access to when the last process is completed or aborted.}
  property OnEndBusy: TNotifyEvent read FOnEndBusy write SetOnEndBusy;
{: Event hook to give access to when the first process becomes active that
was initiated with Yield as true.
<br><br>
This event is only triggered when the first yirlding process becomes active
and not when other processes that are nested become active.
<br><br>
This will not be affected if other process are nested after it that have
Yield as true or false.}
  property OnBeginYield: TNotifyEvent read FOnBeginYield write SetOnBeginYield;
{: Event to give access to when the last process is completed or
aborted that was initiated with Yied as true.}
  property OnEndYield: TNotifyEvent read FOnEndYield write SetOnEndYield;
{: Event to override default colorscheme assignments by datalinks.}
  property OnGetDataLinkColor: TIB_GetDataLinkColorEvent
      read FOnGetDataLinkColor
     write SetOnGetDataLinkColor;
{: This provides a hook into the session timer that operated in the background.}
  property OnSessionTimer: TIB_SessionTimerEvent read FOnSessionTimer
                                                 write SetOnSessionTimer;
{: Global hook for the session to gain control over the error handling for
all calls made to the API.}
  property OnError;
{: General purpose event used to tell the session to wakeup.
<br><br>
What actually happens here is the session does whatever is necessary to wake up the
application so that its events can be processed.}
  property OnWakeup: TNotifyEvent read GetWakeup write SetWakeup;
end;

implementation

constructor TIB_SessionProps.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FBusyCursor := -17;
  FYieldCursor := -19;
  FStoreActive := false;
  FEditingColor := $00AAFFFF;   // clLemon  // old value: clYellow;
  FInsertingColor := $00C0FFC0; // clApple  // old value: clLime;
  FDeletingColor := $00C8C8FF;  // clPink   // old value: clRed;
  FSearchingColor := $00F0F0C8; // clLtAqua // old value: clAqua;
  FReadOnlyColor := clSilver;
  FSelectedColor := clBlue;
  FInvalidColor := clNone;
  FPreparedColor := clGrayText;
  FBrowsingColor := clWindow;
  FAllowDefaultConnection := true;
  FAllowDefaultTransaction := true;
{$IFDEF ALLOW_DEFAULT_SESSION}
  SetSession( TIB_Session.DefaultSession );
{$ELSE}
  raise Exception.Create( E_Default_Session_Capability_Disabled );
{$ENDIF}
  SetTimerInterval( 5000 );
end;
procedure TIB_SessionProps.SetAllowDefaultConnection( AValue: boolean );
begin
  IB_Session.AllowDefaultConnection := AValue;
  FAllowDefaultConnection := AValue;
end;
procedure TIB_SessionProps.SetAllowDefaultTransaction( AValue: boolean );
begin
  IB_Session.AllowDefaultTransaction := AValue;
  FAllowDefaultTransaction := AValue;
end;
procedure TIB_SessionProps.SetStoreActive( AValue: boolean );
begin
  IB_Session.StoreActive := AValue;
  FStoreActive := AValue;
end;
procedure TIB_SessionProps.SetBusyCursor( AValue: TIB_ScreenCursor{TCursor} );
begin
  IB_Session.BusyCursor := AValue;
  FBusyCursor := AValue;
end;
procedure TIB_SessionProps.SetYieldCursor( AValue: TIB_ScreenCursor{TCursor} );
begin
  IB_Session.YieldCursor := AValue;
  FYieldCursor := AValue;
end;
procedure TIB_SessionProps.SetUseCursor( AValue: boolean );
begin
  IB_Session.UseCursor := AValue;
  FUseCursor := AValue;
end;
procedure TIB_SessionProps.SetEditingColor( AValue: TColor );
begin
  IB_Session.EditingColor := AValue;
  FEditingColor := AValue;
end;
procedure TIB_SessionProps.SetInsertingColor( AValue: TColor );
begin
  IB_Session.InsertingColor := AValue;
  FInsertingColor := AValue;
end;
procedure TIB_SessionProps.SetDeletingColor( AValue: TColor );
begin
  IB_Session.DeletingColor := AValue;
  FDeletingColor := AValue;
end;
procedure TIB_SessionProps.SetSearchingColor( AValue: TColor );
begin
  IB_Session.SearchingColor := AValue;
  FSearchingColor := AValue;
end;
procedure TIB_SessionProps.SetReadOnlyColor( AValue: TColor );
begin
  IB_Session.ReadOnlyColor := AValue;
  FReadOnlyColor := AValue;
end;
procedure TIB_SessionProps.SetSelectedColor( AValue: TColor );
begin
  IB_Session.SelectedColor := AValue;
  FSelectedColor := AValue;
end;
procedure TIB_SessionProps.SetInvalidColor( AValue: TColor );
begin
  IB_Session.InvalidColor := AValue;
  FInvalidColor := AValue;
end;
procedure TIB_SessionProps.SetPreparedColor( AValue: TColor );
begin
  IB_Session.PreparedColor := AValue;
  FPreparedColor := AValue;
end;
procedure TIB_SessionProps.SetBrowsingColor( AValue: TColor );
begin
  IB_Session.BrowsingColor := AValue;
  FBrowsingColor := AValue;
end;
procedure TIB_SessionProps.SetTimerInterval( AValue: cardinal );
begin
  IB_Session.TimerInterval := AValue;
  FTimerInterval := AValue;
end;
procedure TIB_SessionProps.SetOnError( AValue: TIB_ErrorEvent );
begin
  inherited SetOnError( AValue );
  IB_Session.OnError := AValue;
end;
procedure TIB_SessionProps.SetOnBeginBusy( AValue: TNotifyEvent );
begin
  IB_Session.OnBeginBusy := AValue;
  FOnBeginBusy := AValue;
end;
procedure TIB_SessionProps.SetOnEndBusy( AValue: TNotifyEvent );
begin
  IB_Session.OnEndBusy := AValue;
  FOnEndBusy := AValue;
end;
procedure TIB_SessionProps.SetOnBeginYield( AValue: TNotifyEvent );
begin
  IB_Session.OnBeginYield := AValue;
  FOnBeginYield := AValue;
end;
procedure TIB_SessionProps.SetOnEndYield( AValue: TNotifyEvent );
begin
  IB_Session.OnEndYield := AValue;
  FOnEndYield := AValue;
end;
procedure TIB_SessionProps.SetOnGetDataLinkColor(
                                            AValue: TIB_GetDataLinkColorEvent );
begin
  IB_Session.OnGetDataLinkColor := AValue;
  FOnGetDataLinkColor := AValue;
end;

procedure TIB_SessionProps.SetOnSessionTimer( AValue: TIB_SessionTimerEvent );
begin
  IB_Session.OnSessionTimer := AValue;
  FOnSessionTimer := AValue;
end;

function TIB_SessionProps.GetWakeup: TNotifyEvent;
begin
  Result := FOnWakeUp;
end;

procedure TIB_SessionProps.SetWakeup( AValue: TNotifyEvent );
begin
  IB_Session.OnWakeUp := AValue;
  FOnWakeUp := AValue;
end;

end.

