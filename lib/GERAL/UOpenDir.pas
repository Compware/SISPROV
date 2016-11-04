unit UOpenDir;

interface

uses Dialogs, Messages, Windows, SysUtils;

//***********************
//** Choose a directory **
//**   uses Messages   **
//***********************
  //General usage here:
  //  http://www.delphipages.com/forum/showthread.php?p=185734
  //Need a class to hold a procedure to be called by Dialog.OnShow:
  type TOpenDir = class(TObject)
  public
    Dialog: TOpenDialog;
    procedure HideControls(Sender: TObject);
  end;

  function PegaDiretorio(var Dir: string): boolean;
  
implementation


//This procedure hides de combo box of file types...
  procedure TOpenDir.HideControls(Sender: TObject);
  const
    //CDM_HIDECONTROL and CDM_SETCONTROLTEXT values from:
    //  doc.ddart.net/msdn/header/include/commdlg.h.html
    //  CMD_HIDECONTROL = CMD_FIRST + 5 = (WM_USER + 100) + 5;
    //Usage of CDM_HIDECONTROL and CDM_SETCONTROLTEXT here:
    //  msdn.microsoft.com/en-us/library/ms646853%28VS.85%29.aspx
    //  msdn.microsoft.com/en-us/library/ms646855%28VS.85%29.aspx
    CDM_HIDECONTROL =    WM_USER + 100 + 5;
    CDM_SETCONTROLTEXT = WM_USER + 100 + 4;
    //Component IDs from:
    //  msdn.microsoft.com/en-us/library/ms646960%28VS.85%29.aspx#_win32_Open_and_Save_As_Dialog_Box_Customization
    //Translation into exadecimal in dlgs.h:
    //  www.koders.com/c/fidCD2C946367FEE401460B8A91A3DB62F7D9CE3244.aspx
    //
    //File type filter...
    cmb1: integer  = $470; //Combo box with list of file type filters
    stc2: integer  = $441; //Label of the file type
    //File name const...
    cmb13: integer = $47c; //Combo box with name of the current file
    edt1: integer  = $480; //Edit with the name of the current file
    stc3: integer  = $442; //Label of the file name combo
  var H: THandle;
  begin
    H:= GetParent(Dialog.Handle);
    //Hide file types combo...
    SendMessage(H, CDM_HIDECONTROL, cmb1,  0);
    SendMessage(H, CDM_HIDECONTROL, stc2,  0);
    //Hide file name label, edit and combo...
    SendMessage(H, CDM_HIDECONTROL, cmb13, 0);
    SendMessage(H, CDM_HIDECONTROL, edt1,  0);
    SendMessage(H, CDM_HIDECONTROL, stc3,  0);
    //NOTE: How to change label text (the lentgh is not auto):
    //SendMessage(H, CDM_SETCONTROLTEXT, stc3, DWORD(pChar('Hello!')));
  end;
//Call it when you need the user to chose a folder for you...
function PegaDiretorio(var Dir: string): boolean;
var
  OpenDialog: TOpenDialog;
  OpenDir: TOpenDir;
begin
  //The standard dialog...
  OpenDialog:= TOpenDialog.Create(nil);
  //Objetc that holds the OnShow code to hide controls
  OpenDir:= TOpenDir.create;
  try
    //Conect both components...
    OpenDir.Dialog:= OpenDialog;
    OpenDialog.OnShow:= OpenDir.HideControls;
    //Configure it so only folders are shown (and file without extension!)...
    OpenDialog.FileName:= '*.';
    OpenDialog.Filter:=   '*.';
    OpenDialog.Title:=    'Chose a folder';
    //No need to check file existis!
    OpenDialog.Options:= OpenDialog.Options + [ofNoValidate];
    //Initial folder...
    OpenDialog.InitialDir:= Dir;
    //Ask user...
    if OpenDialog.Execute then begin
      Dir:= ExtractFilePath(OpenDialog.FileName);
      result:= true;
    end else begin
      result:= false;
    end;
  finally
    //Clean up...
    OpenDir.Free;
    OpenDialog.Free;
  end;
end;

end.
 