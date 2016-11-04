
{$R-}  // Turn off range checking.
{$A+}  // Need aligned record fields.
{$B-}  // Make sure there isn't complete boolean evaluation.
{$H+}  // Make sure huge strings are supported.

{------------------------------------------------------------------------------}
// Setup usage of default/alternate session behavior.
//
//  When controlling your own sessions manually, such as when doing an ISAPI
//  module, it is not necessary to maintain a default session. This is a
//  benefit because it avoids using a multi-threading resource when this
//  define is disabled. It is the same for the alternate session too.

// Make sure when building design-time packages the default session is on.

{$DEFINE ALLOW_DEFAULT_SESSION}

{------------------------------------------------------------------------------}
// Setup defines whether the emulated registry on non Windows platforms
// is global (one registry for the system) or not (one registry per application).
//
// Applies only to FPC/Lazarus
// As windows has one global registry, it would be tempting to set it to global
// for non Windows systems. However, in most installations, the application
// will not have write permissions to the global folder.
// Enable this setting on a case by case.

//{$DEFINE USE_GLOBAL_REGISTRY}
{ $ DEFINE USE_GLOBAL_REGISTRY}

{------------------------------------------------------------------------------}
// Work around for an old bug in InterBase/Firebird.
//
// In older versions of InterBase and Firebird there was a bug in the execute2
// API call that was problematic for the internal buffering mechanisms of IBO.
// So, I had to do a workaround that is less efficient but still got the job
// done. Now that we are well past that era and both InterBase and Firebird
// are seeing an increase in development activity these bugs are all fixed.
// So, I changed IBO to work assuming that people are using the later versions.
// If you are using an earlier version with the bug and want to have the work-
// around back in your application then set this compiler directive.

{ $ DEFINE BUG_EXEC2}

{------------------------------------------------------------------------------}

{$IFDEF WIN32}
{$DEFINE MSWINDOWS}
{$ENDIF}

{------------------------------------------------------------------------------}
// Setup defines according to compiler versions.
//
// Notes:
//
//   * Using an IBO_ prefix on the defines to avoid conflict with
//     non IBO packages.
//
//   * In an effort to minimise changes required to support new
//     compiler releases I use a reverse logic in assigning
//     some of the defines - that is, define all relevant values
//     and then undefine items not supported in specific versions.
//     - in support of this Delphi is the assumed compiler unless
//     overridden by specific C++Builder version. (Majority rule.)
//
//     IMPORTANT: If adding a new VCLxx_OR_GREATER define remember
//     to undefine the value in all the older versions!
//
//     Note: Actually this does not achieve much at the moment due
//     to a necessary hack in IBG_Custom.imp.  Hopefully a means
//     will eventually be found to avoid that issue.
//     Use IBO_SUPPORTED_COMPILER if you need to test whether the
//     current compiler has been defined and tested to support IBObjects.

{$DEFINE IBO_40_OR_GREATER}    // Detection of move to IBO 4.x
{$DEFINE IBO_49_OR_GREATER}    // Detection of move to IBO 4.9.x
{.$DEFINE IBO_50_OR_GREATER}    // Detection of move to IBO 5.x
{$DEFINE IBO_UseUnicode} // Flag indicates IBO now properly uses D2009+ strings.

{$DEFINE IBO_VCL20_OR_GREATER}   // VCL v2.0 or greater (Delphi v2+)
{$DEFINE IBO_VCL30_OR_GREATER}   // VCL v3.0 or greater (Delphi v3+)
{$DEFINE IBO_VCL35_OR_GREATER}   // VCL v3.5 or greater (C++Builder v3+)
{$DEFINE IBO_VCL40_OR_GREATER}   // VCL v4.0 or greater (Delphi v4+ or C++B v4+)
{$DEFINE IBO_VCL50_OR_GREATER}   // VCL v5.0 or greater (Delphi v5+ or C++B v5+)
{$DEFINE IBO_VCL60_OR_GREATER}   // VCL v6.0 or greater (Delphi v6+ or C++B v6+)
{$DEFINE IBO_VCL70_OR_GREATER}   // VCL v7.0 or greater (Delphi v7+ or C++B v?+)
{$DEFINE IBO_VCL2005_OR_GREATER} // Delphi v2005 or greater
{$DEFINE IBO_VCL2006_OR_GREATER} // Delphi and C++ Builder v2006 or greater
{$DEFINE IBO_VCL2007_OR_GREATER} // Delphi and C++ Builder v2007 or greater
{$DEFINE IBO_VCL2009_OR_GREATER} // Delphi and C++ Builder v2009 or greater
{$DEFINE IBO_VCL2010_OR_GREATER} // Delphi and C++ Builder v2010 or greater
{$DEFINE IBO_VCL2011_OR_GREATER} // Delphi and C++ Builder v2011 or greater
{$DEFINE IBO_VCL2012_OR_GREATER} // Delphi and C++ Builder v2012 or greater

{------------------------------------------------------------------------------}

// Compiler specific defines, latest to oldest...

{$IFDEF VER230}                    // Embarcadero For Delphi 2012
  {$IFDEF BCB}                     // C++ Builder
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_2012}
  {$ELSE}                          // Delphi Win32
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2012}
  {$ENDIF}
  {$DEFINE IBO_VCL2012}
  {$DEFINE IBO_SUPPORTED_COMPILER}
{$ENDIF}

{$IFDEF VER220}                    // Embarcadero For Delphi 2011
  {$IFDEF BCB}                     // C++ Builder
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_2011}
  {$ELSE}                          // Delphi Win32
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2011}
  {$ENDIF}
  {$DEFINE IBO_VCL2011}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
{$ENDIF}

{$IFDEF VER210}                    // Embarcadero For Delphi 2010
  {$IFDEF BCB}                     // C++ Builder
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_2010}
  {$ELSE}                          // Delphi Win32
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2010}
  {$ENDIF}
  {$DEFINE IBO_VCL2010}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
{$ENDIF}


{$IFDEF VER200}                    // CodeGear For Delphi 2009
  {$IFDEF BCB}                     // C++ Builder
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_2009}
  {$ELSE}                          // Delphi Win32
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2009}
  {$ENDIF}
  {$DEFINE IBO_VCL2009}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
{$ENDIF}

{$IFDEF VER185}                    // CodeGear For Delphi 2007
  {$IFDEF BCB}                     // C++ Builder
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_2007}
  {$ELSE}                          // Delphi Win32
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2007}
  {$ENDIF}
  {$DEFINE IBO_VCL2007}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
{$ENDIF}

{$IFDEF VER180}                    // Borland Developer Studio v2006
  {$IFDEF BCB}                     // C++ Builder
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_2006}
  {$ELSE}                          // Delphi Win32
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2006}
  {$ENDIF}
  {$DEFINE IBO_VCL2006}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {.$UNDEF IBO_VCL2007_OR_GREATER}
{$ENDIF}

{$IFDEF VER170}                    // Delphi v2005
  {$IFDEF BCB}
    ERROR: BCB v2005 not supported
  {$ELSE}
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_2005}
  {$ENDIF}
  {$DEFINE IBO_VCL2005}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {$UNDEF IBO_VCL2007_OR_GREATER}
  {$UNDEF IBO_VCL2006_OR_GREATER}
{$ENDIF}

{$IFDEF VER150}                    // Delphi v7
  {$IFDEF BCB}                     // C++ Builder
    ERROR: BCB v7 not supported
  {$ELSE}
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_7}
  {$ENDIF}
  {$DEFINE IBO_VCL70}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {$UNDEF IBO_VCL2007_OR_GREATER}
  {$UNDEF IBO_VCL2006_OR_GREATER}
  {$UNDEF IBO_VCL2005_OR_GREATER}
{$ENDIF}

{$IFDEF FPC}                    // Free Pascal Compiler
  {$DEFINE IBO_VCL70}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {$UNDEF IBO_VCL2007_OR_GREATER}
  {$UNDEF IBO_VCL2006_OR_GREATER}
  {$UNDEF IBO_VCL2005_OR_GREATER}
{$ELSE}
  {$DEFINE WINDOWS}
{$ENDIF}

{$IFDEF VER140}
  {$IFDEF BCB}             // C++Builder v6
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_6}
  {$ELSE}                  // Delphi 6
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_6}
  {$ENDIF}
  {$DEFINE IBO_VCL60}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {$UNDEF IBO_VCL2007_OR_GREATER}
  {$UNDEF IBO_VCL2006_OR_GREATER}
  {$UNDEF IBO_VCL2005_OR_GREATER}
  {$UNDEF IBO_VCL70_OR_GREATER}
{$ENDIF}

{$IFDEF VER130}
  {$IFDEF BCB}             // C++Builder v5
    {$DEFINE IBO_CPPB}
    {$DEFINE IBO_CPPB_5}
  {$ELSE}                  // Delphi v5
    {$DEFINE IBO_DELPHI}
    {$DEFINE IBO_DELPHI_5}
  {$ENDIF}
  {$DEFINE IBO_VCL50}
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {$UNDEF IBO_VCL2007_OR_GREATER}
  {$UNDEF IBO_VCL2006_OR_GREATER}
  {$UNDEF IBO_VCL2005_OR_GREATER}
  {$UNDEF IBO_VCL70_OR_GREATER}
  {$UNDEF IBO_VCL60_OR_GREATER}
{$ENDIF}

{$IFDEF VER125}    // C++Builder v4
  {$DEFINE IBO_CPPB}
  {$DEFINE IBO_CPPB_4}
  {$DEFINE IBO_VCL40} // same VCL version as Delphi 4
  {$DEFINE IBO_SUPPORTED_COMPILER}

  {$UNDEF IBO_VCL2012_OR_GREATER}
  {$UNDEF IBO_VCL2011_OR_GREATER}
  {$UNDEF IBO_VCL2010_OR_GREATER}
  {$UNDEF IBO_VCL2009_OR_GREATER}
  {$UNDEF IBO_VCL2007_OR_GREATER}
  {$UNDEF IBO_VCL2006_OR_GREATER}
  {$UNDEF IBO_VCL2005_OR_GREATER}
  {$UNDEF IBO_VCL70_OR_GREATER}
  {$UNDEF IBO_VCL60_OR_GREATER}
  {$UNDEF IBO_VCL50_OR_GREATER}
{$ENDIF}

// Intentional compile time errors

{$IFDEF VER120}    // Delphi v4
ERROR: Delphi v4 not supported
{$ENDIF}

{$IFDEF VER110}    // C++Builder v3
ERROR: C++Builder v3 not supported
{$ENDIF}

{$IFDEF VER100}    // Delphi v3
ERROR: Delphi v3 not supported
{$ENDIF}

{$IFDEF VER90}     // Delphi v2
ERROR: Delphi v2 not supported
{$ENDIF}

{$IFDEF VER93}     // C++Builder v1.0
ERROR: C++Builder v1.0 not supported
{$ENDIF}

{$IFDEF VER80}     // Delphi v1.0 (Win16 version)
ERROR: Delphi v1.0 not supported
{$ENDIF}

{------------------------------------------------------------------------------}
// Derived defines based on compiler/VCL versions...

{$IFDEF IBO_VCL2006_OR_GREATER}
  {$DEFINE IBO_ASCOMP_SUPPORT}
{$ENDIF}

{$IFDEF IBO_DELPHI}
  {$DEFINE IBO_ASCOMP_SUPPORT}
{$ENDIF}

