(****************************************************************************
                     ?)[_.
        .":::::::^  .\\\\.     .
        ']{{{{{{{<  ^\\\(`.   :|(;.
                    ^\\\\\\1i)\\\['
    '1\\\\\\\\\\\?  ^\\\\\\\\\\\:
     ^"""""""""""'  ^\\\\\\\\\\\['
  .^^^^^^^^^^^^^^'  .'^:[\\\\\\\\|,:>]1.
  :|\\\\\\\\\\\\\[       '?\\\\\\\\\\\\>
                           ?\\\\\\\}"`.
;[}}}}}}}}}}}}}}[>         ^\\\\\\\-
`::::::::::::::::^         ,\\\\\\\?.
   '`````````````.        `|\\\\\\\\\(_:
  I\\\\\\\\\\\\\\)      'i\\\\\\\\)(\\\,
   ..............   '>?|\\\\\\\\\+  .'`
    .!~~~~~~~~~~~:  ^\\\\\\\\\\\i
    .I>>>>>>>>>>>,  ^\\\\\\\\\\\\I.
         ........   ^\\\\)<,'`]\\\!
        `\\\\\\\\)  .(\\\`     `:.
         ''''''''.   I\\\:
      ___        _        _     _
     |   \  ___ | | _ __ | |_  (_)
     | |) |/ -_)| || '_ \| ' \ | |
     |___/ \___||_|| .__/|_||_||_|
               |_|
  ___                    _    _  _
 / __| __ _  _ __   ___ | |__(_)| |_ ™
| (_ |/ _` || '  \ / -_)| / /| ||  _|
 \___|\__,_||_|_|_|\___||_\_\|_| \__|

  Copyright © 2022 tinyBigGAMES™ LLC
         All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software in
   a product, an acknowledgment in the product documentation would be
   appreciated but is not required.

2. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

3. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in
   the documentation and/or other materials provided with the
   distribution.

4. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

5. All video, audio, graphics and other content accessed through the
   software in this distro is the property of the applicable content owner
   and may be protected by applicable copyright law. This License gives
   Customer no rights to such content, and Company disclaims any liability
   for misuse of content.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
-----------------------------------------------------------------------------
Based on:
  Json Data Objects (https://github.com/ahausladen/JsonDataObjects)

*****************************************************************************)

{$A8,B-,C+,E-,F-,G+,H+,I+,J-,K-,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Z1}
{$WARN WIDECHAR_REDUCED OFF} // All sets only use ASCII chars (<=#127) and the compiler generates the >=#128 check itself
{$STRINGCHECKS OFF} // It only slows down Delphi strings, doesn't help C++Builder migration and is finally gone in XE+
{$WARN SYMBOL_DEPRECATED OFF} // for StrLen/StrLComp
{$POINTERMATH ON}
unit DelphiGamekit.Json;
{$IFDEF VER200}
  // Delphi 2009's ErrorInsight parser uses the CompilerVersion's memory address instead of 20.0, failing all the
  // IF CompilerVersion compiler directives
  {$DEFINE CPUX86}
{$ELSE}
  {$IF CompilerVersion >= 24.0} // XE3 or newer
    {$LEGACYIFEND ON}
    {$IF CompilerVersion >= 35.0} //11.0
      {$DEFINE USE_NATIVEINT}
    {$IFEND}
  {$IFEND}
  {$IF CompilerVersion >= 23.0}
    {$DEFINE HAS_UNIT_SCOPE}
    {$DEFINE HAS_RETURN_ADDRESS}
  {$IFEND}
  {$IF CompilerVersion <= 22.0} // XE or older
    {$DEFINE CPUX86}
  {$IFEND}
{$ENDIF VER200}
{$IFDEF NEXTGEN}
  {$IF CompilerVersion >= 31.0} // 10.1 Berlin or newer
    {$DEFINE SUPPORTS_UTF8STRING} // Delphi 10.1 Berlin supports UTF8String for mobile compilers
  {$IFEND}
{$ELSE}
  {$DEFINE SUPPORTS_UTF8STRING}
{$ENDIF}
{$IFDEF CPUX64}
  {$IFNDEF LINUX64} // Linux 64 compiler doesn't support ASM for x64 code => LLVM
    {$DEFINE ASMSUPPORT}
  {$ENDIF ~LINUX64}
{$ENDIF CPUX64}
{$IFDEF CPUX86}
  {$DEFINE ASMSUPPORT}
{$ENDIF CPUX86}
{$IFDEF EXTERNALLINKER} // implicates LLVM
  {$UNDEF ASMSUPPORT}
{$ENDIF EXTERNALLINKER}
// Enables the progress callback feature
{$DEFINE SUPPORT_PROGRESS}
// Sanity checks all array index accesses and raise an EListError exception.
{$DEFINE CHECK_ARRAY_INDEX}
// JSON allows the slash to be escaped. This is only necessary if you plan to put the JSON string
// into a <script>-Tag because then "</" can't be used and must be escaped to "<\/". This switch
// enables the special handling for "</" but makes the parser slightly slower.
{.$DEFINE ESCAPE_SLASH_AFTER_LESSTHAN}
// When parsing a JSON string the pair names are interned to reduce the memory foot print. This
// slightly slows down the parser but saves a lot of memory if the JSON string contains repeating
// pair names. The interning uses a hashset to store the strings.
{$DEFINE USE_STRINGINTERN_FOR_NAMES}
// Use an optimized NewInstance implementation. It skips the initialization of the interface table.
// and seals the TJsonArray and TJsonObject classes because it isn't safe to derive from them.
{$DEFINE USE_FAST_NEWINSTANCE}
//{$IF CompilerVersion < 28.0} // XE6 or older
  // The XE7 compiler is broken. It doesn't collapse duplicate string literals anymore. (RSP-10015)
  // But if the string literals are used in loops this optimization still helps.
  // Optimizes the following pattern:
  //   O['Name'][MyPropStr]
  //   O['Name']['MyProp'].
  // where the second O['Name'] is handled very fast by caching the pointer to the 'Name' string literal.
  {$DEFINE USE_LAST_NAME_STRING_LITERAL_CACHE}
//{$IFEND}
// When parsing the JSON string, the UStrAsg calls are skipped for internal strings what eliminates
// the CPU locks for those string assignments.
{$DEFINE USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
{$IFDEF AUTOREFCOUNT}
  // Delphi's ARC is slow (RSP-9712). This switch enables a faster ARC handling and even skips memory
  // barrier were possible.
  {$DEFINE USE_FAST_AUTOREFCOUNT}
{$ENDIF AUTOREFCOUNT}
{$IFDEF MSWINDOWS}
  // When adding JSON object properties with string literals, the string literals are stored directly
  // in the "Name" field instead of using UStrAsg that creates a new heap string. This improves the
  // performance as no string is copied and it slighly reduces the memory usage.
  // The string literals are only used if they are in the main instance or the DLL that contains the
  // JsonDataObjects unit. Other string literals are copied using UStrAsg because unloading the DLL
  // that holds them would cause access violations.
  // This has no effect when parsing JSON strings because then there are no string literals.
  {$DEFINE USE_NAME_STRING_LITERAL}
  // Reading a large file >64 MB from a network drive in Windows 2003 Server or older can lead to
  // an INSUFFICIENT RESOURCES error. By enabling this switch, large files are read in 20 MB blocks.
  {$DEFINE WORKAROUND_NETWORK_FILE_INSUFFICIENT_RESOURCES}
  // If defined, the TzSpecificLocalTimeToSystemTime is imported with GetProcAddress and if it is
  // not available (Windows 2000) an alternative implementation is used.
  {$DEFINE SUPPORT_WINDOWS2000}
{$ENDIF MSWINDOWS}
interface
uses
  {$IFDEF HAS_UNIT_SCOPE}
  System.SysUtils, System.Classes;
  {$ELSE}
  SysUtils, Classes;
  {$ENDIF HAS_UNIT_SCOPE}
{$HPPEMIT '#pragma link "Jsondataobjects"'}
  
type
  TDGJsonBaseObject = class;
  TDGJsonObject = class;
  TDGJsonArray = class;

  {$IFDEF NEXTGEN}
  // Mobile compilers have PAnsiChar but it is hidden and then published under a new name. This alias
  // allows us to remove some IFDEFs.
  PAnsiChar = MarshaledAString;
  {$ENDIF NEXTGEN}

  EDGJsonException = class(Exception);
  EDGJsonCastException = class(EDGJsonException);
  EDGJsonPathException = class(EDGJsonException);
  EDGJsonParserException = class(EDGJsonException)
  private
    FColumn: NativeInt;
    FPosition: NativeInt;
    FLineNum: NativeInt;
  public
    constructor CreateResFmt(ResStringRec: PResStringRec; const Args: array of const; ALineNum, AColumn, APosition: NativeInt);
    constructor CreateRes(ResStringRec: PResStringRec; ALineNum, AColumn, APosition: NativeInt);
    property LineNum: NativeInt read FLineNum;   // base 1
    property Column: NativeInt read FColumn;     // base 1
    property Position: NativeInt read FPosition; // base 0  Utf8Char/WideChar index
  end;

  {$IFDEF SUPPORT_PROGRESS}
  TDGJsonReaderProgressProc = procedure(Data: Pointer; Percentage: Integer; Position, Size: NativeInt);
  PDGJsonReaderProgressRec = ^TDGJsonReaderProgressRec;
  TDGJsonReaderProgressRec = record
    Data: Pointer;        // used for the first Progress() parameter
    Threshold: NativeInt; // 0: Call only if percentage changed; greater than 0: call after n processed bytes
    Progress: TDGJsonReaderProgressProc;
    function Init(AProgress: TDGJsonReaderProgressProc; AData: Pointer = nil; AThreshold: NativeInt = 0): PDGJsonReaderProgressRec;
  end;

  {$ENDIF SUPPORT_PROGRESS}
  // TJsonOutputWriter is used to write the JSON data to a string, stream or TStrings in a compact
  // or human readable format.
  TDGJsonOutputWriter = record
  private type
    TLastType = (ltInitial, ltIndent, ltUnindent, ltIntro, ltValue, ltSeparator);
    PJsonStringArray = ^TJsonStringArray;
    TJsonStringArray = array[0..MaxInt div SizeOf(string) - 1] of string;
    PJsonStringBuilder = ^TJsonStringBuilder;
    TJsonStringBuilder = record
    private
      FData: PChar;
      FCapacity: Integer;
      FLen: Integer;
      procedure Grow(MinLen: Integer);
    public
      procedure Init;
      procedure Done;
      procedure DoneConvertToString(var S: string);
      function FlushToBytes(var Bytes: PByte; var Size: NativeInt; Encoding: TEncoding): NativeInt;
      procedure FlushToMemoryStream(Stream: TMemoryStream; Encoding: TEncoding);
      procedure FlushToStringBuffer(var Buffer: TJsonStringBuilder);
      procedure FlushToString(var S: string);
      function Append(const S: string): PJsonStringBuilder; overload;
      procedure Append(P: PChar; Len: Integer); overload;
      function Append2(const S1: string; S2: PChar; S2Len: Integer): PJsonStringBuilder; overload;
      procedure Append2(Ch1: Char; Ch2: Char); overload;
      procedure Append3(Ch1: Char; const S2, S3: string); overload;
      procedure Append3(Ch1: Char; const S2: string; Ch3: Char); overload; inline;
      procedure Append3(Ch1: Char; const P2: PChar; P2Len: Integer; Ch3: Char); overload;
      property Len: Integer read FLen;
      property Data: PChar read FData;
    end;
  private
    FLastType: TLastType;
    FCompact: Boolean;
    FStringBuffer: TJsonStringBuilder;
    FLines: TStrings;
    FLastLine: TJsonStringBuilder;
    FStreamEncodingBuffer: PByte;
    FStreamEncodingBufferLen: NativeInt;
    FStream: TStream;                // used when writing to a stream
    FEncoding: TEncoding;            // used when writing to a stream
    FIndents: PJsonStringArray;      // buffer for line indention strings
    FIndentsLen: Integer;
    FIndent: Integer;                // current indention level
    procedure StreamFlushPossible; inline; // checks if StreamFlush must be called
    procedure StreamFlush;                 // writes the buffer to the stream
    procedure ExpandIndents;
    procedure AppendLine(AppendOn: TLastType; const S: string); overload; inline;
    procedure AppendLine(AppendOn: TLastType; P: PChar; Len: Integer); overload; inline;
    procedure FlushLastLine;
  private // unit private
    procedure Init(ACompact: Boolean; AStream: TStream; AEncoding: TEncoding; ALines: TStrings);
    function Done: string;
    procedure StreamDone;
    procedure LinesDone;
    procedure Indent(const S: string);
    procedure Unindent(const S: string);
    procedure AppendIntro(P: PChar; Len: Integer);
    procedure AppendValue(const S: string); overload;
    procedure AppendValue(P: PChar; Len: Integer); overload;
    procedure AppendStrValue(P: PChar; Len: Integer);
    procedure AppendSeparator(const S: string);
    procedure FreeIndents;
  end;

  TDGJsonDataType = (
    jdtNone, jdtString, jdtInt, jdtLong, jdtULong, jdtFloat, jdtDateTime, jdtUtcDateTime, jdtBool, jdtArray, jdtObject
  );

  // TJsonDataValue holds the actual value
  PDGJsonDataValue = ^TDGJsonDataValue;

  TDGJsonDataValue = packed record
  private type
    TJsonDataValueRec = record
      case TDGJsonDataType of
        jdtNone: (P: PChar);     // helps when debugging
        jdtString: (S: Pointer); // We manage the string ourself. Delphi doesn't allow "string" in a
                                 // variant record and if we have no string, we don't need to clean
                                 // it up, anyway.
        jdtInt: (I: Integer);
        jdtLong: (L: Int64);
        jdtULong: (U: UInt64);
        jdtFloat: (F: Double);
        jdtDateTime, jdtUtcDateTime: (D: TDateTime);
        jdtBool: (B: Boolean);
        jdtArray: (A: Pointer);  // owned by TJsonDataValue
        jdtObject: (O: Pointer); // owned by TJsonDataValue
    end;
  private
    FValue: TJsonDataValueRec;
    FTyp: TDGJsonDataType;
    function GetValue: string;
    function GetIntValue: Integer;
    function GetLongValue: Int64;
    function GetULongValue: UInt64;
    function GetFloatValue: Double;
    function GetDateTimeValue: TDateTime;
    function GetUtcDateTimeValue: TDateTime;
    function GetBoolValue: Boolean;
    function GetArrayValue: TDGJsonArray;
    function GetObjectValue: TDGJsonObject;
    function GetVariantValue: Variant;
    procedure SetValue(const AValue: string);
    procedure SetIntValue(const AValue: Integer);
    procedure SetLongValue(const AValue: Int64);
    procedure SetULongValue(const AValue: UInt64);
    procedure SetFloatValue(const AValue: Double);
    procedure SetDateTimeValue(const AValue: TDateTime);
    procedure SetUtcDateTimeValue(const AValue: TDateTime);
    procedure SetBoolValue(const AValue: Boolean);
    procedure SetArrayValue(const AValue: TDGJsonArray);
    procedure SetObjectValue(const AValue: TDGJsonObject);
    procedure SetVariantValue(const AValue: Variant);
    procedure InternToJSON(var Writer: TDGJsonOutputWriter);
    procedure InternSetValue(const AValue: string); // skips the call to Clear()
    procedure InternSetValueTransfer(var AValue: string); // skips the call to Clear() and transfers the string without going through UStrAsg+UStrClr
    procedure InternSetArrayValue(const AValue: TDGJsonArray);
    procedure InternSetObjectValue(const AValue: TDGJsonObject);
    procedure Clear;
    procedure TypeCastError(ExpectedType: TDGJsonDataType);
  public
    function IsNull: Boolean;
    property Typ: TDGJsonDataType read FTyp;
    property Value: string read GetValue write SetValue;
    property IntValue: Integer read GetIntValue write SetIntValue;
    property LongValue: Int64 read GetLongValue write SetLongValue;
    property ULongValue: UInt64 read GetULongValue write SetULongValue;
    property FloatValue: Double read GetFloatValue write SetFloatValue;
    property DateTimeValue: TDateTime read GetDateTimeValue write SetDateTimeValue;
    property UtcDateTimeValue: TDateTime read GetUtcDateTimeValue write SetUtcDateTimeValue;
    property BoolValue: Boolean read GetBoolValue write SetBoolValue;
    property ArrayValue: TDGJsonArray read GetArrayValue write SetArrayValue;
    property ObjectValue: TDGJsonObject read GetObjectValue write SetObjectValue;
    property VariantValue: Variant read GetVariantValue write SetVariantValue;
  end;

  // TJsonDataValueHelper is used to implement the "easy access" functionality. It is
  // slightly slower than using the direct indexed properties.
  TDGJsonDataValueHelper = record
  private
    function GetValue: string; inline;
    function GetIntValue: Integer; inline;
    function GetLongValue: Int64; inline;
    function GetULongValue: UInt64; //inline;  no implicit operator due to conflict with Int64
    function GetFloatValue: Double; inline;
    function GetDateTimeValue: TDateTime; inline;
    function GetUtcDateTimeValue: TDateTime;
    function GetBoolValue: Boolean; inline;
    function GetArrayValue: TDGJsonArray; inline;
    function GetObjectValue: TDGJsonObject; inline;
    function GetVariantValue: Variant; inline;
    procedure SetValue(const Value: string);
    procedure SetIntValue(const Value: Integer);
    procedure SetLongValue(const Value: Int64);
    procedure SetULongValue(const Value: UInt64);
    procedure SetFloatValue(const Value: Double);
    procedure SetDateTimeValue(const Value: TDateTime);
    procedure SetUtcDateTimeValue(const Value: TDateTime);
    procedure SetBoolValue(const Value: Boolean);
    procedure SetArrayValue(const Value: TDGJsonArray);
    procedure SetObjectValue(const Value: TDGJsonObject);
    procedure SetVariantValue(const Value: Variant);
    function GetArrayItem(Index: Integer): TDGJsonDataValueHelper; inline;
    function GetArrayCount: Integer; inline;
    function GetObjectString(const Name: string): string; inline;
    function GetObjectInt(const Name: string): Integer; inline;
    function GetObjectLong(const Name: string): Int64; inline;
    function GetObjectULong(const Name: string): UInt64; inline;
    function GetObjectFloat(const Name: string): Double; inline;
    function GetObjectDateTime(const Name: string): TDateTime; inline;
    function GetObjectUtcDateTime(const Name: string): TDateTime; inline;
    function GetObjectBool(const Name: string): Boolean; inline;
    function GetArray(const Name: string): TDGJsonArray; inline;
    {$IFDEF BCB}
    function GetObj(const Name: string): TJsonDataValueHelper; inline; // work around C++Builder Windows.h::GetObject macro
    {$ELSE}
    function GetObject(const Name: string): TDGJsonDataValueHelper; inline;
    {$ENDIF BCB}
    function GetObjectVariant(const Name: string): Variant; inline;
    procedure SetObjectString(const Name, Value: string); inline;
    procedure SetObjectInt(const Name: string; const Value: Integer); inline;
    procedure SetObjectLong(const Name: string; const Value: Int64); inline;
    procedure SetObjectULong(const Name: string; const Value: UInt64); inline;
    procedure SetObjectFloat(const Name: string; const Value: Double); inline;
    procedure SetObjectDateTime(const Name: string; const Value: TDateTime); inline;
    procedure SetObjectUtcDateTime(const Name: string; const Value: TDateTime); inline;
    procedure SetObjectBool(const Name: string; const Value: Boolean); inline;
    procedure SetArray(const Name: string; const Value: TDGJsonArray); inline;
    procedure SetObject(const Name: string; const Value: TDGJsonDataValueHelper); inline;
    procedure SetObjectVariant(const Name: string; const Value: Variant); inline;
    function GetObjectPath(const Name: string): TDGJsonDataValueHelper; inline;
    procedure SetObjectPath(const Name: string; const Value: TDGJsonDataValueHelper); inline;
    function GetTyp: TDGJsonDataType;
    procedure ResolveName;
    class procedure SetInternValue(Item: PDGJsonDataValue; const Value: TDGJsonDataValueHelper); static;
  public
    class operator Implicit(const Value: string): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): string; overload;
    class operator Implicit(const Value: Integer): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): Integer; overload;
    class operator Implicit(const Value: Int64): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): Int64; overload;
    //class operator Implicit(const Value: UInt64): TJsonDataValueHelper; overload;  conflicts with Int64 operator
    //class operator Implicit(const Value: TJsonDataValueHelper): UInt64; overload;  conflicts with Int64 operator
    class operator Implicit(const Value: Double): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): Double; overload;
    class operator Implicit(const Value: Extended): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): Extended; overload;
    class operator Implicit(const Value: TDateTime): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): TDateTime; overload;
    class operator Implicit(const Value: Boolean): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): Boolean; overload;
    class operator Implicit(const Value: TDGJsonArray): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): TDGJsonArray; overload;
    class operator Implicit(const Value: TDGJsonObject): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): TDGJsonObject; overload;
    class operator Implicit(const Value: Pointer): TDGJsonDataValueHelper; overload;
    class operator Implicit(const Value: TDGJsonDataValueHelper): Variant; overload;
    class operator Implicit(const Value: Variant): TDGJsonDataValueHelper; overload;
    function IsNull: Boolean;

    property Typ: TDGJsonDataType read GetTyp;
    property Value: string read GetValue write SetValue;
    property IntValue: Integer read GetIntValue write SetIntValue;
    property LongValue: Int64 read GetLongValue write SetLongValue;
    property ULongValue: UInt64 read GetULongValue write SetULongValue;
    property FloatValue: Double read GetFloatValue write SetFloatValue;
    property DateTimeValue: TDateTime read GetDateTimeValue write SetDateTimeValue;
    property UtcDateTimeValue: TDateTime read GetUtcDateTimeValue write SetUtcDateTimeValue;
    property BoolValue: Boolean read GetBoolValue write SetBoolValue;
    property ArrayValue: TDGJsonArray read GetArrayValue write SetArrayValue;
    property ObjectValue: TDGJsonObject read GetObjectValue write SetObjectValue;
    property VariantValue: Variant read GetVariantValue write SetVariantValue;
    // Access to array item count
    property Count: Integer read GetArrayCount;
    // Access to array items
    property Items[Index: Integer]: TDGJsonDataValueHelper read GetArrayItem;
    property S[const Name: string]: string read GetObjectString write SetObjectString;        // returns '' if property doesn't exist, auto type-cast except for array/object
    property I[const Name: string]: Integer read GetObjectInt write SetObjectInt;             // returns 0 if property doesn't exist, auto type-cast except for array/object
    property L[const Name: string]: Int64 read GetObjectLong write SetObjectLong;             // returns 0 if property doesn't exist, auto type-cast except for array/object
    property U[const Name: string]: UInt64 read GetObjectULong write SetObjectULong;          // returns 0 if property doesn't exist, auto type-cast except for array/object
    property F[const Name: string]: Double read GetObjectFloat write SetObjectFloat;          // returns 0 if property doesn't exist, auto type-cast except for array/object
    property D[const Name: string]: TDateTime read GetObjectDateTime write SetObjectDateTime; // returns 0 if property doesn't exist, auto type-cast except for array/object
    property DUtc[const Name: string]: TDateTime read GetObjectUtcDateTime write SetObjectUtcDateTime; // returns 0 if property doesn't exist, auto type-cast except for array/object
    property B[const Name: string]: Boolean read GetObjectBool write SetObjectBool;           // returns false if property doesn't exist, auto type-cast with "<>'true'" and "<>0" except for array/object
    // Used to auto create arrays
    property A[const Name: string]: TDGJsonArray read GetArray write SetArray;
    // Used to auto create objects and as default property where no Implicit operator matches
    property O[const Name: string]: TDGJsonDataValueHelper read {$IFDEF BCB}GetObj{$ELSE}GetObject{$ENDIF} write SetObject; default;
    property V[const Name: string]: Variant read GetObjectVariant write SetObjectVariant;
    property Path[const Name: string]: TDGJsonDataValueHelper read GetObjectPath write SetObjectPath;
  private
    FData: record // hide the data from CodeInsight (bug in CodeInsight)
      FIntern: PDGJsonDataValue;
      FName: string;
      FNameResolver: TDGJsonObject;
      FValue: string; // must be managed by Delphi otherwise we have a memory leak
      {$IFDEF AUTOREFCOUNT}
      FObj: TJsonBaseObject;
      {$ENDIF AUTOREFCOUNT}
      case FTyp: TDGJsonDataType of
        jdtInt: (FIntValue: Integer);
        jdtLong: (FLongValue: Int64);
        jdtULong: (FULongValue: UInt64);
        jdtFloat: (FFloatValue: Double);
        jdtDateTime, jdtUtcDateTime: (FDateTimeValue: TDateTime);
        jdtBool: (FBoolValue: Boolean);
        {$IFNDEF AUTOREFCOUNT}
        jdtObject: (FObj: TDGJsonBaseObject); // used for both Array and Object
        //jdtArray: (FArrayValue: TJsonArray);
        //jdtObject: (FObjectValue: TJsonObject);
        {$ENDIF AUTOREFCOUNT}
    end;
  end;

  // TJsonBaseObject is the base class for TJsonArray and TJsonObject
  TDGJsonBaseObject = class abstract(TObject)
  private type
    TWriterAppendMethod = procedure(P: PChar; Len: Integer) of object;
    TStreamInfo = record
      Buffer: PByte;
      Size: NativeInt;
      AllocationBase: Pointer;
    end;
  private
    class procedure StrToJSONStr(const AppendMethod: TWriterAppendMethod; const S: string); static;
    class procedure EscapeStrToJSONStr(F, P, EndP: PChar; const AppendMethod: TWriterAppendMethod); static;
    class procedure DateTimeToJSONStr(const AppendMethod: TWriterAppendMethod; const Value: TDateTime); static;
    class procedure UtcDateTimeToJSONStr(const AppendMethod: TWriterAppendMethod; const Value: TDateTime); static;
    class procedure InternInitAndAssignItem(Dest, Source: PDGJsonDataValue); static;
    class procedure GetStreamBytes(Stream: TStream; var Encoding: TEncoding; Utf8WithoutBOM: Boolean;
      var StreamInfo: TStreamInfo); static;
    {$IFDEF USE_FAST_AUTOREFCOUNT}
    function ARCObjRelease: Integer; inline;
    function ARCObjAddRef: Integer; inline;
    {$ENDIF USE_FAST_AUTOREFCOUNT}
  protected
    procedure InternToJSON(var Writer: TDGJsonOutputWriter); virtual; abstract;
  public
    const DataTypeNames: array[TDGJsonDataType] of string = (
      'null', 'String', 'Integer', 'Long', 'ULong', 'Float', 'DateTime', 'UTC-DateTime', 'Bool', 'Array', 'Object'
    );
    {$IFDEF USE_FAST_NEWINSTANCE}
    class function NewInstance: TObject {$IFDEF AUTOREFCOUNT} unsafe {$ENDIF}; override;
    {$ENDIF USE_FAST_NEWINSTANCE}
    // ParseXxx returns nil if the JSON string is empty or consists only of white chars.
    // If the JSON string starts with a "[" then the returned object is a TJsonArray otherwise
    // it is a TJsonObject.
    class function ParseUtf8(S: PAnsiChar; Len: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; overload; static; inline;
    {$IFDEF SUPPORTS_UTF8STRING}
    class function ParseUtf8(const S: UTF8String{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; overload; static; inline;
    {$ENDIF SUPPORTS_UTF8STRING}
    class function ParseUtf8Bytes(S: PByte; Len: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; static;
    class function Parse(S: PWideChar; Len: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; overload; static;
    class function Parse(const S: UnicodeString{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; overload; static; inline;
    class function Parse(const Bytes: TBytes; Encoding: TEncoding = nil; ByteIndex: Integer = 0;
      ByteCount: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; overload; static;
    class function ParseFromFile(const FileName: string; Utf8WithoutBOM: Boolean = True{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; static;
    class function ParseFromStream(Stream: TStream; Encoding: TEncoding = nil; Utf8WithoutBOM: Boolean = True{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}): TDGJsonBaseObject; static;
    procedure LoadFromFile(const FileName: string; Utf8WithoutBOM: Boolean = True{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF});
    procedure LoadFromStream(Stream: TStream; Encoding: TEncoding = nil; Utf8WithoutBOM: Boolean = True{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF});
    procedure SaveToFile(const FileName: string; Compact: Boolean = True; Encoding: TEncoding = nil; Utf8WithoutBOM: Boolean = True);
    procedure SaveToStream(Stream: TStream; Compact: Boolean = True; Encoding: TEncoding = nil; Utf8WithoutBOM: Boolean = True);
    procedure SaveToLines(Lines: TStrings);
    // FromXxxJSON() raises an EJsonParserException if you try to parse an array JSON string into a
    // TJsonObject or a object JSON string into a TJsonArray.
    {$IFDEF SUPPORTS_UTF8STRING}
    procedure FromUtf8JSON(const S: UTF8String{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}); overload; inline;
    {$ENDIF SUPPORTS_UTF8STRING}
    procedure FromUtf8JSON(S: PAnsiChar; Len: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}); overload; inline;
    procedure FromUtf8JSON(S: PByte; Len: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}); overload;
    procedure FromJSON(const S: UnicodeString{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}); overload;
    procedure FromJSON(S: PWideChar; Len: Integer = -1{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec = nil{$ENDIF}); overload;
    function ToJSON(Compact: Boolean = True): string;
    {$IFDEF SUPPORTS_UTF8STRING}
    function ToUtf8JSON(Compact: Boolean = True): UTF8String; overload;
    {$ENDIF SUPPORTS_UTF8STRING}
    procedure ToUtf8JSON(var Bytes: TBytes; Compact: Boolean = True); {$IFDEF SUPPORTS_UTF8STRING}overload;{$ENDIF}
    // ToString() returns a compact JSON string
    function ToString: string; override;
    function Clone: TDGJsonBaseObject;
    class function JSONToDateTime(const Value: string; ConvertToLocalTime: Boolean = True): TDateTime; static;
    class function DateTimeToJSON(const Value: TDateTime; UseUtcTime: Boolean): string; static;
    class function UtcDateTimeToJSON(const UtcDateTime: TDateTime): string; static;
  end;

  PDGJsonDataValueArray = ^TDGJsonDataValueArray;
  TDGJsonDataValueArray = array[0..MaxInt div SizeOf(TDGJsonDataValue) - 1] of TDGJsonDataValue;

  TDGJsonArrayEnumerator = record
  private
    FIndex: Integer;
    FArray: TDGJsonArray;
  public
    constructor Create(AArray: TDGJsonArray);
    function GetCurrent: TDGJsonDataValueHelper; inline;
    function MoveNext: Boolean;
    property Current: TDGJsonDataValueHelper read GetCurrent;
  end;

  // TJsonArray hold a JSON array and manages the array elements.
  TDGJsonArray = class {$IFDEF USE_FAST_NEWINSTANCE}sealed{$ENDIF}(TDGJsonBaseObject)
  private
    FItems: PDGJsonDataValueArray;
    FCapacity: Integer;
    FCount: Integer;
    function GetString(Index: Integer): string; inline;
    function GetInt(Index: Integer): Integer; inline;
    function GetLong(Index: Integer): Int64; inline;
    function GetULong(Index: Integer): UInt64; inline;
    function GetFloat(Index: Integer): Double; inline;
    function GetDateTime(Index: Integer): TDateTime; inline;
    function GetUtcDateTime(Index: Integer): TDateTime; inline;
    function GetBool(Index: Integer): Boolean; inline;
    function GetArray(Index: Integer): TDGJsonArray; inline;
    {$IFDEF BCB}
    function GetObj(Index: Integer): TJsonObject; inline;
    {$ELSE}
    function GetObject(Index: Integer): TDGJsonObject; inline;
    {$ENDIF BCB}
    function GetVariant(Index: Integer): Variant; inline;
    procedure SetString(Index: Integer; const Value: string); inline;
    procedure SetInt(Index: Integer; const Value: Integer); inline;
    procedure SetLong(Index: Integer; const Value: Int64); inline;
    procedure SetULong(Index: Integer; const Value: UInt64); inline;
    procedure SetFloat(Index: Integer; const Value: Double); inline;
    procedure SetDateTime(Index: Integer; const Value: TDateTime); inline;
    procedure SetUtcDateTime(Index: Integer; const Value: TDateTime); inline;
    procedure SetBool(Index: Integer; const Value: Boolean); inline;
    procedure SetArray(Index: Integer; const Value: TDGJsonArray); inline;
    procedure SetObject(Index: Integer; const Value: TDGJsonObject); inline;
    procedure SetVariant(Index: Integer; const Value: Variant); inline;
    function GetItem(Index: Integer): PDGJsonDataValue; inline;
    function GetType(Index: Integer): TDGJsonDataType; inline;
    function GetValue(Index: Integer): TDGJsonDataValueHelper;
    procedure SetValue(Index: Integer; const Value: TDGJsonDataValueHelper);
    function AddItem: PDGJsonDataValue;
    function InsertItem(Index: Integer): PDGJsonDataValue;
    procedure Grow;
    procedure InternApplyCapacity; inline;
    procedure SetCapacity(const Value: Integer);
    procedure SetCount(const Value: Integer);
  protected
    procedure InternToJSON(var Writer: TDGJsonOutputWriter); override;
    class procedure RaiseListError(Index: Integer); static;
  public
    destructor Destroy; override;
    procedure Clear;
    procedure Delete(Index: Integer);
    // Extract removes the object/array from the array and transfers the ownership to the caller.
    function Extract(Index: Integer): TDGJsonBaseObject;
    function ExtractArray(Index: Integer): TDGJsonArray;
    function ExtractObject(Index: Integer): TDGJsonObject;
    procedure Assign(ASource: TDGJsonArray);
    function Clone: TDGJsonArray;
    procedure Add(const AValue: string); overload;
    procedure Add(const AValue: Integer); overload;
    procedure Add(const AValue: Int64); overload;
    procedure Add(const AValue: UInt64); overload;
    procedure Add(const AValue: Double); overload;
    procedure Add(const AValue: TDateTime); overload;
    procedure AddUtcDateTime(const AValue: TDateTime);
    procedure Add(const AValue: Boolean); overload;
    procedure Add(const AValue: TDGJsonArray); overload;
    procedure Add(const AValue: TDGJsonObject); overload;
    procedure Add(const AValue: Variant); overload;
    function AddArray: TDGJsonArray;
    function AddObject: TDGJsonObject; overload;
    procedure AddObject(const Value: TDGJsonObject); overload; inline; // makes it easier to add "null"
    procedure Insert(Index: Integer; const AValue: string); overload;
    procedure Insert(Index: Integer; const AValue: Integer); overload;
    procedure Insert(Index: Integer; const AValue: Int64); overload;
    procedure Insert(Index: Integer; const AValue: UInt64); overload;
    procedure Insert(Index: Integer; const AValue: Double); overload;
    procedure Insert(Index: Integer; const AValue: TDateTime); overload;
    procedure InsertUtcDateTime(Index: Integer; const AValue: TDateTime);
    procedure Insert(Index: Integer; const AValue: Boolean); overload;
    procedure Insert(Index: Integer; const AValue: TDGJsonArray); overload;
    procedure Insert(Index: Integer; const AValue: TDGJsonObject); overload;
    procedure Insert(Index: Integer; const AValue: Variant); overload;
    function InsertArray(Index: Integer): TDGJsonArray;
    function InsertObject(Index: Integer): TDGJsonObject; overload;
    procedure InsertObject(Index: Integer; const Value: TDGJsonObject); overload; inline; // makes it easier to insert "null"
    function GetEnumerator: TDGJsonArrayEnumerator;
    function IsNull(Index: Integer): Boolean;
    property Types[Index: Integer]: TDGJsonDataType read GetType;
    property Values[Index: Integer]: TDGJsonDataValueHelper read GetValue write SetValue; default;
    // Short names
    property S[Index: Integer]: string read GetString write SetString;
    property I[Index: Integer]: Integer read GetInt write SetInt;
    property L[Index: Integer]: Int64 read GetLong write SetLong;
    property U[Index: Integer]: UInt64 read GetULong write SetULong;
    property F[Index: Integer]: Double read GetFloat write SetFloat;
    property D[Index: Integer]: TDateTime read GetDateTime write SetDateTime;
    property DUtc[Index: Integer]: TDateTime read GetUtcDateTime write SetUtcDateTime;
    property B[Index: Integer]: Boolean read GetBool write SetBool;
    property A[Index: Integer]: TDGJsonArray read GetArray write SetArray;
    property O[Index: Integer]: TDGJsonObject read {$IFDEF BCB}GetObj{$ELSE}GetObject{$ENDIF} write SetObject;
    property V[Index: Integer]: Variant read GetVariant write SetVariant;
    property Items[Index: Integer]: PDGJsonDataValue read GetItem;
    property Count: Integer read FCount write SetCount;
    property Capacity: Integer read FCapacity write SetCapacity;
  end;

  TDGJsonNameValuePair = record
    Name: string;
    Value: TDGJsonDataValueHelper;
  end;

  TDGJsonObjectEnumerator = record
  private
    FIndex: Integer;
    FObject: TDGJsonObject;
  public
    constructor Create(AObject: TDGJsonObject);
    function GetCurrent: TDGJsonNameValuePair; inline;
    function MoveNext: Boolean;
    property Current: TDGJsonNameValuePair read GetCurrent;
  end;

  // TJsonObject hold a JSON object and manages the JSON object properties
  TDGJsonObject = class {$IFDEF USE_FAST_NEWINSTANCE}sealed{$ENDIF}(TDGJsonBaseObject)
  private type
    PJsonStringArray = ^TJsonStringArray;
    TJsonStringArray = array[0..MaxInt div SizeOf(string) - 1] of string;
  private
    FItems: PDGJsonDataValueArray;
    FNames: PJsonStringArray;
    FCapacity: Integer;
    FCount: Integer;
    {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
    FLastValueItem: PDGJsonDataValue;
    FLastValueItemNamePtr: Pointer;
    procedure UpdateLastValueItem(const Name: string; Item: PDGJsonDataValue);
    {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
    function FindItem(const Name: string; var Item: PDGJsonDataValue): Boolean;
    function RequireItem(const Name: string): PDGJsonDataValue;
    function GetString(const Name: string): string;
    function GetBool(const Name: string): Boolean;
    function GetInt(const Name: string): Integer;
    function GetLong(const Name: string): Int64;
    function GetULong(const Name: string): UInt64;
    function GetFloat(const Name: string): Double;
    function GetDateTime(const Name: string): TDateTime;
    function GetUtcDateTime(const Name: string): TDateTime;
    {$IFDEF BCB}
    function GetObj(const Name: string): TJsonObject;
    {$ELSE}
    function GetObject(const Name: string): TDGJsonObject;
    {$ENDIF BCB}
    function GetArray(const Name: string): TDGJsonArray;
    procedure SetString(const Name, Value: string);
    procedure SetBool(const Name: string; const Value: Boolean);
    procedure SetInt(const Name: string; const Value: Integer);
    procedure SetLong(const Name: string; const Value: Int64);
    procedure SetULong(const Name: string; const Value: UInt64);
    procedure SetFloat(const Name: string; const Value: Double);
    procedure SetDateTime(const Name: string; const Value: TDateTime);
    procedure SetUtcDateTime(const Name: string; const Value: TDateTime);
    procedure SetObject(const Name: string; const Value: TDGJsonObject);
    procedure SetArray(const Name: string; const Value: TDGJsonArray);
    function GetType(const Name: string): TDGJsonDataType;
    function GetName(Index: Integer): string; inline;
    function GetItem(Index: Integer): PDGJsonDataValue; inline;
    procedure SetValue(const Name: string; const Value: TDGJsonDataValueHelper);
    function GetValue(const Name: string): TDGJsonDataValueHelper;
    { Used from the reader, never every use them outside the reader, they may crash your strings }
    procedure InternAdd(var AName: string; const AValue: string); overload;
    procedure InternAdd(var AName: string; const AValue: Integer); overload;
    procedure InternAdd(var AName: string; const AValue: Int64); overload;
    procedure InternAdd(var AName: string; const AValue: UInt64); overload;
    procedure InternAdd(var AName: string; const AValue: Double); overload;
    procedure InternAdd(var AName: string; const AValue: TDateTime); overload;
    procedure InternAdd(var AName: string; const AValue: Boolean); overload;
    procedure InternAdd(var AName: string; const AValue: TDGJsonArray); overload;
    procedure InternAdd(var AName: string; const AValue: TDGJsonObject); overload;
    function InternAddArray(var AName: string): TDGJsonArray;
    function InternAddObject(var AName: string): TDGJsonObject;
    function InternAddItem(var Name: string): PDGJsonDataValue;
    function AddItem(const Name: string): PDGJsonDataValue;
    procedure Grow;
    procedure InternApplyCapacity;
    procedure SetCapacity(const Value: Integer);
    function GetPath(const NamePath: string): TDGJsonDataValueHelper;
    procedure SetPath(const NamePath: string; const Value: TDGJsonDataValueHelper);
    function IndexOfPChar(S: PChar; Len: Integer): Integer;
    procedure PathError(P, EndP: PChar);
    procedure PathNullError(P, EndP: PChar);
    procedure PathIndexError(P, EndP: PChar; Count: Integer);
  protected
    procedure InternToJSON(var Writer: TDGJsonOutputWriter); override;
    function FindCaseInsensitiveItem(const ACaseInsensitiveName: string): PDGJsonDataValue;
  public
    destructor Destroy; override;
    procedure Assign(ASource: TDGJsonObject);
    function Clone: TDGJsonObject;
    // ToSimpleObject() maps the JSON object properties to the Delphi object by using the object's
    // TypeInfo.
    // The object's class must be compiled with the $M+ compiler switch or derive from TPersistent.
    procedure ToSimpleObject(AObject: TObject; ACaseSensitive: Boolean = True);
    // FromSimpleObject() clears the JSON object and adds the Delphi object's properties.
    // The object's class must be compiled with the $M+ compiler switch or derive from TPersistent.
    procedure FromSimpleObject(AObject: TObject; ALowerCamelCase: Boolean = False);
    procedure Clear;
    procedure Remove(const Name: string);
    procedure Delete(Index: Integer);
    function IndexOf(const Name: string): Integer;
    function Contains(const Name: string): Boolean;
    // Extract removes the object/array from the object and transfers the ownership to the caller.
    function Extract(const Name: string): TDGJsonBaseObject;
    function ExtractArray(const Name: string): TDGJsonArray;
    function ExtractObject(const Name: string): TDGJsonObject;
    function GetEnumerator: TDGJsonObjectEnumerator;
    function IsNull(const Name: string): Boolean;
    property Types[const Name: string]: TDGJsonDataType read GetType;
    property Values[const Name: string]: TDGJsonDataValueHelper read GetValue write SetValue; default;
    // Short names
    property S[const Name: string]: string read GetString write SetString;        // returns '' if property doesn't exist, auto type-cast except for array/object
    property I[const Name: string]: Integer read GetInt write SetInt;             // returns 0 if property doesn't exist, auto type-cast except for array/object
    property L[const Name: string]: Int64 read GetLong write SetLong;             // returns 0 if property doesn't exist, auto type-cast except for array/object
    property U[const Name: string]: UInt64 read GetULong write SetULong;          // returns 0 if property doesn't exist, auto type-cast except for array/object
    property F[const Name: string]: Double read GetFloat write SetFloat;          // returns 0 if property doesn't exist, auto type-cast except for array/object
    property D[const Name: string]: TDateTime read GetDateTime write SetDateTime; // returns 0 if property doesn't exist, auto type-cast except for array/object
    property DUtc[const Name: string]: TDateTime read GetUtcDateTime write SetUtcDateTime; // returns 0 if property doesn't exist, auto type-cast except for array/object
    property B[const Name: string]: Boolean read GetBool write SetBool;           // returns false if property doesn't exist, auto type-cast with "<>'true'" and "<>0" except for array/object
    property A[const Name: string]: TDGJsonArray read GetArray write SetArray;      // auto creates array on first access
    property O[const Name: string]: TDGJsonObject read {$IFDEF BCB}GetObj{$ELSE}GetObject{$ENDIF} write SetObject;   // auto creates object on first access
    property Path[const NamePath: string]: TDGJsonDataValueHelper read GetPath write SetPath;
    // Indexed access to the named properties
    property Names[Index: Integer]: string read GetName;
    property Items[Index: Integer]: PDGJsonDataValue read GetItem;
    property Count: Integer read FCount;
    property Capacity: Integer read FCapacity write SetCapacity;
  end;

  TDGJsonSerializationConfig = record
    LineBreak: string;
    IndentChar: string;
    UseUtcTime: Boolean;
    NullConvertsToValueTypes: Boolean;
  end;

var
  DGJsonSerializationConfig: TDGJsonSerializationConfig = ( // not thread-safe
    LineBreak: #10;
    IndentChar: #9;
    UseUtcTime: True;
    NullConvertsToValueTypes: False;  // If True and an object is nil/null, a convertion to String, Int, Long, Float, DateTime, Boolean will return ''/0/False
  );

implementation

uses
  {$IFDEF HAS_UNIT_SCOPE}
    {$IFDEF MSWINDOWS}
  Winapi.Windows,
    {$ELSE}
  System.DateUtils,
    {$ENDIF MSWINDOWS}
  System.Variants, System.RTLConsts, System.TypInfo, System.Math, System.SysConst;
  {$ELSE}
    {$IFDEF MSWINDOWS}
  Windows,
    {$ELSE}
  DateUtils,
    {$ENDIF MSWINDOWS}
  Variants, RTLConsts, TypInfo, Math, SysConst;
  {$ENDIF HAS_UNIT_SCOPE}
{$IF SizeOf(LongWord) <> 4}

// Make LongWord on all platforms a UInt32.
type
  LongWord = UInt32;
  PLongWord = ^LongWord;
{$IFEND}
resourcestring
  RsUnsupportedFileEncoding = 'File encoding is not supported';
  RsUnexpectedEndOfFile = 'Unexpected end of file where %s was expected';
  RsUnexpectedToken = 'Expected %s but found %s';
  RsInvalidStringCharacter = 'Invalid character in string';
  RsStringNotClosed = 'String not closed';
  RsInvalidHexNumber = 'Invalid hex number "%s"';
  RsTypeCastError = 'Cannot cast %s into %s';
  RsMissingClassInfo = 'Class "%s" doesn''t have type information. {$M+} was not specified';
  RsInvalidJsonPath = 'Invalid JSON path "%s"';
  RsJsonPathContainsNullValue = 'JSON path contains null value ("%s")';
  RsJsonPathIndexError = 'JSON path index out of bounds (%d) "%s"';
  RsVarTypeNotSupported = 'VarType %d is not supported';
  {$IFDEF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
    {$IFDEF DEBUG}
  //RsInternAsgStringUsageError = 'InternAsgString was called on a string literal';
    {$ENDIF DEBUG}
  {$ENDIF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}

  type
  TJsonTokenKind = (
    jtkEof, jtkInvalidSymbol,
    jtkLBrace, jtkRBrace, jtkLBracket, jtkRBracket, jtkComma, jtkColon,
    jtkIdent,
    jtkValue, jtkString, jtkInt, jtkLong, jtkULong, jtkFloat, jtkTrue, jtkFalse, jtkNull
  );

const
  JsonTokenKindToStr: array[TJsonTokenKind] of string = (
    'end of file', 'invalid symbol',
    '"{"', '"}"', '"["', '"]"', '","', '":"',
    'identifier',
    'value', 'value', 'value', 'value', 'value', 'value', 'value', 'value', 'value'
  );

  Power10: array[0..18] of Double = (
    1E0, 1E1, 1E2, 1E3, 1E4, 1E5, 1E6, 1E7, 1E8, 1E9,
    1E10, 1E11, 1E12, 1E13, 1E14, 1E15, 1E16, 1E17, 1E18
  );

  // XE7 broke string literal collapsing
var
  sTrue: string = 'true';
  sFalse: string = 'false';

const
  sNull = 'null';
  sQuoteChar = '"';
  {$IF not declared(varObject)}
  varObject = $0049;
  {$IFEND}

type
  PStrRec = ^TStrRec;
  TStrRec = packed record
    {$IF defined(CPUX64) or defined(CPU64BITS)} // XE2-XE7 (CPUX64), XE8+ (CPU64BITS)
    _Padding: Integer;
    {$IFEND}
    CodePage: Word;
    ElemSize: Word;
    RefCnt: Integer;
    Length: Integer;
  end;

  // TEncodingStrictAccess gives us access to the strict protected functions which are much easier
  // to use with TJsonStringBuilder than converting FData to a dynamic TCharArray.
  TEncodingStrictAccess = class(TEncoding)
  public
    function GetByteCountEx(Chars: PChar; CharCount: Integer): Integer; inline;
    function GetBytesEx(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer; inline;
    function GetCharCountEx(Bytes: PByte; ByteCount: Integer): Integer; inline;
    function GetCharsEx(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer; inline;
  end;

  {$IFDEF USE_STRINGINTERN_FOR_NAMES}
  TStringIntern = record
  private type
    PJsonStringEntry = ^TJsonStringEntry;
    TJsonStringEntry = record
      Next: Integer;
      Hash: Integer;
      Name: string;
    end;
    PJsonStringEntryArray = ^TJsonStringEntryArray;
    TJsonStringEntryArray = array[0..MaxInt div SizeOf(TJsonStringEntry) - 1] of TJsonStringEntry;
    PJsonIntegerArray = ^TJsonIntegerArray;
    TJsonIntegerArray = array[0..MaxInt div SizeOf(Integer) - 1] of Integer;
  private
    FStrings: PJsonStringEntryArray;
    FBuckets: PJsonIntegerArray;
    FCapacity: Integer;
    FCount: Integer;
    class function GetHash(const Name: string): Integer; static;
    procedure Grow;
    function Find(Hash: Integer; const S: string): Integer;
    procedure InternAdd(AHash: Integer; const S: string);
  public
    procedure Init;
    procedure Done;
    procedure Intern(var S: string; var PropName: string);
  end;

  {$ENDIF USE_STRINGINTERN_FOR_NAMES}
  TJsonToken = record
    Kind: TJsonTokenKind;
    S: string; // jtkIdent/jtkString
    case Integer of
      0: (I: Integer; HI: Integer);
      1: (L: Int64);
      2: (U: UInt64);
      3: (F: Double);
  end;

  TJsonReader = class(TObject)
  private
    {$IFDEF USE_STRINGINTERN_FOR_NAMES}
    FIdents: TStringIntern;
    {$ENDIF USE_STRINGINTERN_FOR_NAMES}
    FPropName: string;
    procedure Accept(TokenKind: TJsonTokenKind);
    procedure ParseObjectBody(const Data: TDGJsonObject);
    procedure ParseObjectProperty(const Data: TDGJsonObject);
    procedure ParseObjectPropertyValue(const Data: TDGJsonObject);
    procedure ParseArrayBody(const Data: TDGJsonArray);
    procedure ParseArrayPropertyValue(const Data: TDGJsonArray);
    procedure AcceptFailed(TokenKind: TJsonTokenKind);
  protected
    FLook: TJsonToken;
    FLineNum: Integer;
    FStart: Pointer;
    FLineStart: Pointer;
    {$IFDEF SUPPORT_PROGRESS}
    FLastProgressValue: NativeInt;
    FSize: NativeInt;
    FProgress: PDGJsonReaderProgressRec;
    procedure CheckProgress(Position: Pointer);
    {$ENDIF SUPPORT_PROGRESS}
    function GetLineColumn: NativeInt;
    function GetPosition: NativeInt;
    function GetCharOffset(StartPos: Pointer): NativeInt; virtual; abstract;
    function Next: Boolean; virtual; abstract;
    class procedure InvalidStringCharacterError(const Reader: TJsonReader); static;
    class procedure StringNotClosedError(const Reader: TJsonReader); static;
    class procedure JSONStrToStr(P, EndP: PChar; FirstEscapeIndex: Integer; var S: string;
      const Reader: TJsonReader); static;
    class procedure JSONUtf8StrToStr(P, EndP: PByte; FirstEscapeIndex: Integer; var S: string;
      const Reader: TJsonReader); static;
  public
    {$IFDEF USE_FAST_NEWINSTANCE}
    class function NewInstance: TObject {$IFDEF AUTOREFCOUNT} unsafe {$ENDIF}; override;
    procedure FreeInstance; override;
    {$ENDIF USE_FAST_NEWINSTANCE}
    constructor Create(AStart: Pointer{$IFDEF SUPPORT_PROGRESS}; ASize: NativeInt; AProgress: PDGJsonReaderProgressRec{$ENDIF});
    destructor Destroy; override;
    procedure Parse(Data: TDGJsonBaseObject);
  end;

  TUtf8JsonReader = class sealed(TJsonReader)
  private
    FText: PByte;
    FTextEnd: PByte;
  protected
    function GetCharOffset(StartPos: Pointer): NativeInt; override; final;
    function Next: Boolean; override; final;
    // ARM optimization: Next() already has EndP in a local variable so don't use the slow indirect
    // access to FTextEnd.
    procedure LexString(P: PByte{$IFDEF CPUARM}; EndP: PByte{$ENDIF});
    procedure LexNumber(P: PByte{$IFDEF CPUARM}; EndP: PByte{$ENDIF});
    procedure LexIdent(P: PByte{$IFDEF CPUARM}; EndP: PByte{$ENDIF});
  public
    constructor Create(S: PByte; Len: NativeInt{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
  end;

  TStringJsonReader = class sealed(TJsonReader)
  private
    FText: PChar;
    FTextEnd: PChar;
  protected
    function GetCharOffset(StartPos: Pointer): NativeInt; override; final;
    function Next: Boolean; override; final;
    // ARM optimization: Next() already has EndP in a local variable so don't use the slow indirect
    // access to FTextEnd.
    procedure LexString(P: PChar{$IFDEF CPUARM}; EndP: PChar{$ENDIF});
    procedure LexNumber(P: PChar{$IFDEF CPUARM}; EndP: PChar{$ENDIF});
    procedure LexIdent(P: PChar{$IFDEF CPUARM}; EndP: PChar{$ENDIF});
  public
    constructor Create(S: PChar; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
  end;

  TMemoryStreamAccess = class(TMemoryStream);

  {$IFDEF SUPPORTS_UTF8STRING}
  TJsonUTF8StringStream = class(TMemoryStream)
  private
    FDataString: UTF8String;
  protected
    function Realloc(var NewCapacity: {$IF Defined(USE_NATIVEINT)}NativeInt{$ELSE}Longint{$IFEND}): Pointer; override;
  public
    constructor Create;
    property DataString: UTF8String read FDataString;
  end;

  {$ENDIF SUPPORTS_UTF8STRING}
  TJsonBytesStream = class(TMemoryStream)
  private
    FBytes: TBytes;
  protected
    function Realloc(var NewCapacity: {$IF Defined(USE_NATIVEINT)}NativeInt{$ELSE}Longint{$IFEND}): Pointer; override;
  public
    constructor Create;
    property Bytes: TBytes read FBytes;
  end;

var
  JSONFormatSettings: TFormatSettings;
  {$IFDEF USE_NAME_STRING_LITERAL}
  JsonMemInfoInitialized: Boolean = False;
  JsonMemInfoBlockStart: PByte = nil;
  JsonMemInfoBlockEnd: PByte = nil;
  JsonMemInfoMainBlockStart: PByte = nil;
  JsonMemInfoMainBlockEnd: PByte = nil;
  {$ENDIF USE_NAME_STRING_LITERAL}
{$IFDEF MSWINDOWS}
  {$IFDEF SUPPORT_WINDOWS2000}

var
  TzSpecificLocalTimeToSystemTime: function(lpTimeZoneInformation: PTimeZoneInformation; var lpLocalTime, lpUniversalTime: TSystemTime): BOOL; stdcall;

function TzSpecificLocalTimeToSystemTimeWin2000(lpTimeZoneInformation: PTimeZoneInformation; var lpLocalTime, lpUniversalTime: TSystemTime): BOOL; stdcall;

var
  TimeZoneInfo: TTimeZoneInformation;

begin
  if lpTimeZoneInformation <> nil then
    TimeZoneInfo := lpTimeZoneInformation^
  else
    GetTimeZoneInformation(TimeZoneInfo);
  // Reverse the bias so that SystemTimeToTzSpecificLocalTime becomes TzSpecificLocalTimeToSystemTime
  TimeZoneInfo.Bias := -TimeZoneInfo.Bias;
  TimeZoneInfo.StandardBias := -TimeZoneInfo.StandardBias;
  TimeZoneInfo.DaylightBias := -TimeZoneInfo.DaylightBias;
  Result := SystemTimeToTzSpecificLocalTime(@TimeZoneInfo, lpLocalTime, lpUniversalTime);
end;

  {$ELSE}
function TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation: PTimeZoneInformation;
  var lpLocalTime, lpUniversalTime: TSystemTime): BOOL; stdcall;
  external kernel32 name 'TzSpecificLocalTimeToSystemTime';
  {$ENDIF SUPPORT_WINDOWS2000}
{$ENDIF MSWINDOWS}

{$IFDEF USE_NAME_STRING_LITERAL}
procedure InitializeJsonMemInfo;
var
  MemInfo: TMemoryBasicInformation;
begin
  JsonMemInfoInitialized := True;
  if VirtualQuery(PByte(HInstance + $1000), MemInfo, SizeOf(MemInfo)) = SizeOf(MemInfo) then
  begin
    JsonMemInfoBlockStart := MemInfo.AllocationBase;
    JsonMemInfoBlockEnd := JsonMemInfoBlockStart + MemInfo.RegionSize;
  end;
  if HInstance <> MainInstance then
  begin
    if VirtualQuery(PByte(MainInstance + $1000), MemInfo, SizeOf(MemInfo)) = SizeOf(MemInfo) then
    begin
      JsonMemInfoMainBlockStart := MemInfo.AllocationBase;
      JsonMemInfoMainBlockEnd := JsonMemInfoMainBlockStart + MemInfo.RegionSize;
    end;
  end;
end;

{$ENDIF USE_NAME_STRING_LITERAL}
type
  PDynArrayRec = ^TDynArrayRec;
  TDynArrayRec = packed record
    {$IF defined(CPUX64) or defined(CPU64BITS)} // XE2-XE7 (CPUX64), XE8+ (CPU64BITS)
    _Padding: Integer;
    {$IFEND}
    RefCnt: Integer;
    Length: NativeInt;
    Data: record end;
  end;

procedure ByteArraySetLengthUninit(var A: TBytes; Count: Integer);
var
  P: PDynArrayRec;
begin
  if A = nil then
  begin
    if Count > 0 then
    begin
      GetMem(Pointer(P), SizeOf(TDynArrayRec) + Count * SizeOf(Byte));
      P.RefCnt := 1;
      P.Length := Count;
      Pointer(A) := @P.Data;
    end;
  end
  else if Count <= 0 then
  begin
    P := PDynArrayRec(PByte(A) - SizeOf(TDynArrayRec));
    //if InterlockedDecrement(P.RefCnt) = 0 then
    Dec(P.RefCnt);
    if P.RefCnt = 0 then
      FreeMem(P);
    Pointer(A) := nil;
  end
  else
  begin
    P := PDynArrayRec(PByte(A) - SizeOf(TDynArrayRec));
    if P.RefCnt = 1 then
    begin
      ReallocMem(Pointer(P), SizeOf(TDynArrayRec) + Count * SizeOf(Byte));
      P.Length := Count;
      Pointer(A) := @P.Data;
    end
    else
    begin
      GetMem(Pointer(P), SizeOf(TDynArrayRec) + Count * SizeOf(Integer));
      Move(A[0], P.Data, PDynArrayRec(PByte(A) - SizeOf(TDynArrayRec)).Length * SizeOf(Byte));
      P.RefCnt := 1;
      P.Length := Count;
      Pointer(A) := @P.Data;
    end;
  end;
end;

{ EJsonParserSyntaxException }
constructor EDGJsonParserException.CreateResFmt(ResStringRec: PResStringRec; const Args: array of const;
  ALineNum, AColumn, APosition: NativeInt);
begin
  inherited CreateResFmt(ResStringRec, Args);
  FLineNum := ALineNum;
  FColumn := AColumn;
  FPosition := APosition;
  if FLineNum > 0 then
    Message := Format('%s (%d, %d)', [Message, FLineNum, FColumn]);
end;

constructor EDGJsonParserException.CreateRes(ResStringRec: PResStringRec; ALineNum, AColumn, APosition: NativeInt);
begin
  inherited CreateRes(ResStringRec);
  FLineNum := ALineNum;
  FColumn := AColumn;
  FPosition := APosition;
  if FLineNum > 0 then
    Message := Format('%s (%d, %d)', [Message, FLineNum, FColumn]);
end;

procedure ListError(Msg: PResStringRec; Data: Integer);
begin
  raise EStringListError.CreateFmt(LoadResString(Msg), [Data])
        {$IFDEF HAS_RETURN_ADDRESS} at ReturnAddress{$ENDIF};
end;

procedure ErrorNoMappingForUnicodeCharacter;
begin
  {$IF not declared(SNoMappingForUnicodeCharacter)}
  RaiseLastOSError;
  {$ELSE}
  raise EEncodingError.CreateRes(@SNoMappingForUnicodeCharacter)
        {$IFDEF HAS_RETURN_ADDRESS} at ReturnAddress{$ENDIF};
  {$IFEND}
end;

procedure ErrorUnsupportedVariantType(VarType: TVarType);
begin
  raise EDGJsonCastException.CreateResFmt(@RsVarTypeNotSupported, [VarType]);
end;

{$IFDEF USE_NAME_STRING_LITERAL}
procedure AsgString(var Dest: string; const Source: string);
begin
  if (Pointer(Source) <> nil) and (PInteger(@PByte(Source)[-8])^ = -1) and // string literal
     (((PByte(Source) < JsonMemInfoBlockEnd) and (PByte(Source) >= JsonMemInfoBlockStart)) or
      ((PByte(Source) < JsonMemInfoMainBlockEnd) and (PByte(Source) >= JsonMemInfoMainBlockStart))) then
  begin
    // Save memory by just using the string literal but only if it is in the EXE's or this DLL's
    // code segment. Otherwise the memory could be released by a FreeLibrary call without us knowning.
    Pointer(Dest) := Pointer(Source);
  end
  else
    Dest := Source;
end;

{$ENDIF USE_NAME_STRING_LITERAL}
{$IFDEF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
  {$IFDEF DEBUG}
//procedure InternAsgStringUsageError;
//begin
//  raise EJsonException.CreateRes(@RsInternAsgStringUsageError);
//end;
  {$ENDIF DEBUG}
{$ENDIF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
procedure AnsiLowerCamelCaseString(var S: string);
begin
  S := AnsiLowerCase(PChar(S)^) + Copy(S, 2);
end;

{$IF not declared(TryStrToUInt64)}
function TryStrToUInt64(const S: string; out Value: UInt64): Boolean;
var
  P, EndP: PChar;
  V: UInt64;
  Digit: Integer;
begin
  // No support for hexadecimal strings
  P := PChar(S);
  EndP := P + Length(S);
  // skip spaces
  while (P < EndP) and (P^ = ' ') do
    Inc(P);
  if P^ = '-' then
    Result := False // UInt64 cannot be negative
  else
  begin
    V := 0;
    while P < EndP do
    begin
      Digit := Integer(Ord(P^)) - Ord('0');
      if (Cardinal(Digit) >= 10) or (V > High(UInt64) div 10) then
        Break;
      //V := V * 10 + Digit;
      V := (V shl 3) + (V shl 1) + Digit;
      Inc(P);
    end;
    Result := P = EndP;
    if Result then
      Value := V;
  end;
end;

{$IFEND}
function GetHexDigitsUtf8(P: PByte; Count: Integer; const Reader: TJsonReader): LongWord;
var
  Ch: Byte;
begin
  Result := 0;
  while Count > 0 do
  begin
    Ch := P^;
    case P^ of
      Ord('0')..Ord('9'): Result := (Result shl 4) or LongWord(Ch - Ord('0'));
      Ord('A')..Ord('F'): Result := (Result shl 4) or LongWord(Ch - (Ord('A') - 10));
      Ord('a')..Ord('f'): Result := (Result shl 4) or LongWord(Ch - (Ord('a') - 10));
    else
      Break;
    end;
    Inc(P);
    Dec(Count);
  end;
  if Count > 0 then
    raise EDGJsonParserException.CreateResFmt(@RsInvalidHexNumber, [P^], Reader.FLineNum, Reader.GetLineColumn, Reader.GetPosition);
end;

function GetHexDigits(P: PChar; Count: Integer; const Reader: TJsonReader): LongWord;
var
  Ch: Char;
begin
  Result := 0;
  while Count > 0 do
  begin
    Ch := P^;
    case P^ of
      '0'..'9': Result := (Result shl 4) or LongWord(Ord(Ch) - Ord('0'));
      'A'..'F': Result := (Result shl 4) or LongWord(Ord(Ch) - (Ord('A') - 10));
      'a'..'f': Result := (Result shl 4) or LongWord(Ord(Ch) - (Ord('a') - 10));
    else
      Break;
    end;
    Inc(P);
    Dec(Count);
  end;
  if Count > 0 then
    raise EDGJsonParserException.CreateResFmt(@RsInvalidHexNumber, [P^], Reader.FLineNum, Reader.GetLineColumn, Reader.GetPosition);
end;

function UtcDateTimeToLocalDateTime(UtcDateTime: TDateTime): TDateTime;
{$IFDEF MSWINDOWS}
var
  UtcTime, LocalTime: TSystemTime;
begin
  DateTimeToSystemTime(UtcDateTime, UtcTime);
  if SystemTimeToTzSpecificLocalTime(nil, UtcTime, LocalTime) then
    Result := SystemTimeToDateTime(LocalTime)
  else
    Result := UtcDateTime;
end;

{$ELSE}
begin
  Result := TTimeZone.Local.ToLocalTime(UtcDateTime);
end;

{$ENDIF MSWINDOWS}
function LocalDateTimeToUtcDateTime(DateTime: TDateTime): TDateTime;
{$IFDEF MSWINDOWS}
var
  UtcTime, LocalTime: TSystemTime;
begin
  DateTimeToSystemTime(DateTime, LocalTime);
  if TzSpecificLocalTimeToSystemTime(nil, LocalTime, UtcTime) then
    Result := SystemTimeToDateTime(UtcTime)
  else
    Result := DateTime;
end;
{$ELSE}
begin
  Result := TTimeZone.Local.ToUniversalTime(DateTime);
end;

{$ENDIF MSWINDOWS}
function DateTimeToISO8601(Value: TDateTime): string;
{$IFDEF MSWINDOWS}
var
  LocalTime, UtcTime: TSystemTime;
  Offset: TDateTime;
  Hour, Min, Sec, MSec: Word;
begin
  DateTimeToSystemTime(Value, LocalTime);
  Result := Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2d.%d',
    [LocalTime.wYear, LocalTime.wMonth, LocalTime.wDay,
     LocalTime.wHour, LocalTime.wMinute, LocalTime.wSecond, LocalTime.wMilliseconds]);
  if TzSpecificLocalTimeToSystemTime(nil, LocalTime, UtcTime) then
  begin
    Offset := Value - SystemTimeToDateTime(UtcTime);
    DecodeTime(Offset, Hour, Min, Sec, MSec);
    if Offset < 0 then
      Result := Format('%s-%.2d:%.2d', [Result, Hour, Min])
    else if Offset > 0 then
      Result := Format('%s+%.2d:%.2d', [Result, Hour, Min])
    else
      Result := Result + 'Z';
  end;
end;
{$ELSE}
var
  Offset: TDateTime;
  Year, Month, Day, Hour, Minute, Second, Milliseconds: Word;
begin
  DecodeDate(Value, Year, Month, Day);
  DecodeTime(Value, Hour, Minute, Second, MilliSeconds);
  Result := Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2d.%d', [Year, Month, Day, Hour, Minute, Second, Milliseconds]);
  Offset := Value - TTimeZone.Local.ToUniversalTime(Value);
  DecodeTime(Offset, Hour, Minute, Second, MilliSeconds);
  if Offset < 0 then
    Result := Format('%s-%.2d:%.2d', [Result, Hour, Minute])
  else if Offset > 0 then
    Result := Format('%s+%.2d:%.2d', [Result, Hour, Minute])
  else
    Result := Result + 'Z';
end;
{$ENDIF MSWINDOWS}

class function TDGJsonBaseObject.UtcDateTimeToJSON(const UtcDateTime: TDateTime): string;
var
  Year, Month, Day, Hour, Minute, Second, Milliseconds: Word;
begin
  DecodeDate(UtcDateTime, Year, Month, Day);
  DecodeTime(UtcDateTime, Hour, Minute, Second, MilliSeconds);
  Result := Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2d.%dZ',
    [Year, Month, Day, Hour, Minute, Second, Milliseconds]);
end;
function TDGJsonBaseObject.Clone: TDGJsonBaseObject;
begin
  if Self is TDGJsonArray then
    Result := TDGJsonArray(Self).Clone
  else
    Result := TDGJsonObject(Self).Clone;
end;

class function TDGJsonBaseObject.DateTimeToJSON(const Value: TDateTime; UseUtcTime: Boolean): string;
{$IFDEF MSWINDOWS}
var
  LocalTime, UtcTime: TSystemTime;
begin
  if UseUtcTime then
  begin
    DateTimeToSystemTime(Value, LocalTime);
    if not TzSpecificLocalTimeToSystemTime(nil, LocalTime, UtcTime) then
      UtcTime := LocalTime;
    Result := Format('%.4d-%.2d-%.2dT%.2d:%.2d:%.2d.%dZ',
      [UtcTime.wYear, UtcTime.wMonth, UtcTime.wDay,
       UtcTime.wHour, UtcTime.wMinute, UtcTime.wSecond, UtcTime.wMilliseconds]);
  end
  else
    Result := DateTimeToISO8601(Value);
end;
{$ELSE}
begin
  if UseUtcTime then
    Result := UtcDateTimeToJSON(TTimeZone.Local.ToUniversalTime(Value))
  else
    Result := DateTimeToISO8601(Value);
end;
{$ENDIF MSWINDOWS}

function ParseDateTimePart(P: PChar; var Value: Integer; MaxLen: Integer): PChar;
var
  V: Integer;
begin
  Result := P;
  V := 0;
  while (Result^ in ['0'..'9']) and (MaxLen > 0) do
  begin
    V := V * 10 + (Ord(Result^) - Ord('0'));
    Inc(Result);
    Dec(MaxLen);
  end;
  Value := V;
end;

function VarTypeToJsonDataType(AVarType: TVarType): TDGJsonDataType;
begin
  case AVarType of
    varNull:
      Result := jdtObject;
    varOleStr, varString, varUString:
      Result := jdtString;
    varSmallInt, varInteger, varShortInt, varByte, varWord, varLongWord:
      Result := jdtInt;
    varInt64:
      Result := jdtLong;
    varUInt64:
      Result := jdtULong;
    varSingle, varDouble, varCurrency:
      Result := jdtFloat;
    varDate:
      Result := jdtDateTime;
    varBoolean:
      Result := jdtBool;
  else
    ErrorUnsupportedVariantType(AVarType);
    Result := jdtNone;
  end;
end;

class function TDGJsonBaseObject.JSONToDateTime(const Value: string; ConvertToLocalTime: Boolean): TDateTime;
var
  P: PChar;
  MSecsSince1970: Int64;
  Year, Month, Day, Hour, Min, Sec, MSec: Integer;
  OffsetHour, OffsetMin: Integer;
  Sign: Double;
begin
  Result := 0;
  if Value = '' then
    Exit;
  P := PChar(Value);
  if (P^ = '/') and (StrLComp('Date(', P + 1, 5) = 0) then  // .NET: milliseconds since 1970-01-01
  begin
    Inc(P, 6);
    MSecsSince1970 := 0;
    while (P^ <> #0) and (P^ in ['0'..'9']) do
    begin
      MSecsSince1970 := MSecsSince1970 * 10 + (Ord(P^) - Ord('0'));
      Inc(P);
    end;
    if (P^ = '+') or (P^ = '-') then // timezone information
    begin
      Inc(P);
      while (P^ <> #0) and (P^ in ['0'..'9']) do
        Inc(P);
    end;
    if (P[0] = ')') and (P[1] = '/') and (P[2] = #0) then
    begin
      Result := UnixDateDelta + (MSecsSince1970 / MSecsPerDay);
      if ConvertToLocalTime then
        Result := UtcDateTimeToLocalDateTime(Result);
    end
    else
      Result := 0; // invalid format
  end
  else
  begin
    // "2015-02-01T16:08:19.202Z"
    if P^ = '-' then // negative year
      Inc(P);
    P := ParseDateTimePart(P, Year, 4);
    if P^ <> '-' then
      Exit; // invalid format
    P := ParseDateTimePart(P + 1, Month, 2);
    if P^ <> '-' then
      Exit; // invalid format
    P := ParseDateTimePart(P + 1, Day, 2);
    Hour := 0;
    Min := 0;
    Sec := 0;
    MSec := 0;
    Result := EncodeDate(Year, Month, Day);
    if P^ = 'T' then
    begin
      P := ParseDateTimePart(P + 1, Hour, 2);
      if P^ <> ':' then
        Exit; // invalid format
      P := ParseDateTimePart(P + 1, Min, 2);
      if P^ = ':' then
      begin
        P := ParseDateTimePart(P + 1, Sec, 2);
        if P^ = '.' then
          P := ParseDateTimePart(P + 1, MSec, 3);
      end;
      Result := Result + EncodeTime(Hour, Min, Sec, MSec);
      if (P^ <> 'Z') and (P^ <> #0) then
      begin
        if (P^ = '+') or (P^ = '-') then
        begin
          if P^ = '+' then
            Sign := -1 //  +0100 means that the time is 1 hour later than UTC
          else
            Sign := 1;
          P := ParseDateTimePart(P + 1, OffsetHour, 2);
          if P^ = ':' then
            Inc(P);
          ParseDateTimePart(P, OffsetMin, 2);
          Result := Result + (EncodeTime(OffsetHour, OffsetMin, 0, 0) * Sign);
        end
        else
        begin
          Result := 0; // invalid format
          Exit;
        end;
      end;
      if ConvertToLocalTime then
        Result := UtcDateTimeToLocalDateTime(Result);
    end;
  end;
end;

{$IFDEF NEXTGEN}
function Utf8StrLen(P: PByte): Integer;
begin
  Result := 0;
  if P <> nil then
    while P[Result] <> 0 do
      Inc(Result);
end;
{$ENDIF NEXTGEN}

procedure SetStringUtf8(var S: string; P: PByte; Len: Integer);
var
  L: Integer;
begin
  if S <> '' then
    S := '';
  if (P = nil) or (Len = 0) then
    Exit;
  SetLength(S, Len);
  L := Utf8ToUnicode(PWideChar(Pointer(S)), Len + 1, PAnsiChar(P), Len);
  if L > 0 then
  begin
    if L - 1 <> Len then
      SetLength(S, L - 1);
  end
  else
    S := '';
end;

procedure AppendString(var S: string; P: PChar; Len: Integer);
var
  OldLen: Integer;
begin
  if (P = nil) or (Len = 0) then
    Exit;
  OldLen := Length(S);
  SetLength(S, OldLen + Len);
  Move(P^, PChar(Pointer(S))[OldLen], Len * SizeOf(Char));
end;

procedure AppendStringUtf8(var S: string; P: PByte; Len: Integer);
var
  L, OldLen: Integer;
begin
  if (P = nil) or (Len = 0) then
    Exit;
  OldLen := Length(S);
  SetLength(S, OldLen + Len);
  L := Utf8ToUnicode(PWideChar(Pointer(S)) + OldLen, Len + 1, PAnsiChar(P), Len);
  if L > 0 then
  begin
    if L - 1 <> Len then
      SetLength(S, OldLen + L - 1);
  end
  else
    SetLength(S, OldLen);
end;

{$IFDEF SUPPORT_PROGRESS}
{ TJsonReaderProgressRec }
function TDGJsonReaderProgressRec.Init(AProgress: TDGJsonReaderProgressProc; AData: Pointer = nil; AThreshold: NativeInt = 0): PDGJsonReaderProgressRec;
begin
  Self.Data := AData;
  Self.Threshold := AThreshold;
  Self.Progress := AProgress;
  Result := @Self;
end;
{$ENDIF SUPPORT_PROGRESS}
{ TJsonReader }
{$IFDEF USE_FAST_NEWINSTANCE}
class function TJsonReader.NewInstance: TObject;
begin
  GetMem(Pointer(Result), InstanceSize);
  PPointer(Result)^ := Self;
  {$IFDEF AUTOREFCOUNT}
  TJsonReader(Result).FRefCount := 1;
  {$ENDIF AUTOREFCOUNT}
end;

procedure TJsonReader.FreeInstance;
begin
  // We have no WeakRef => faster cleanup
  FreeMem(Pointer(Self));
end;

{$ENDIF ~USE_FAST_NEWINSTANCE}
constructor TJsonReader.Create(AStart: Pointer{$IFDEF SUPPORT_PROGRESS}; ASize: NativeInt; AProgress: PDGJsonReaderProgressRec{$ENDIF});
begin
  //inherited Create;
  {$IFDEF USE_FAST_NEWINSTANCE}
  Pointer(FPropName) := nil;
  Pointer(FLook.S) := nil;
  {$ENDIF USE_FAST_NEWINSTANCE}
  {$IFDEF USE_STRINGINTERN_FOR_NAMES}
  FIdents.Init;
  {$ENDIF USE_STRINGINTERN_FOR_NAMES}
  FStart := AStart;
  FLineNum := 1; // base 1
  FLineStart := nil;
  {$IFDEF SUPPORT_PROGRESS}
  FSize := ASize;
  FProgress := AProgress;
  FLastProgressValue := 0; // class is not zero-filled
  if (FProgress <> nil) and Assigned(FProgress.Progress) then
    FProgress.Progress(FProgress.Data, 0, 0, FSize);
  {$ENDIF SUPPORT_PROGRESS}
end;

destructor TJsonReader.Destroy;
begin
  {$IFDEF USE_FAST_NEWINSTANCE}
  FPropName := '';
  FLook.S := '';
  {$ENDIF USE_FAST_NEWINSTANCE}
  {$IFDEF USE_STRINGINTERN_FOR_NAMES}
  FIdents.Done;
  {$ENDIF USE_STRINGINTERN_FOR_NAMES}
  {$IFDEF SUPPORT_PROGRESS}
  if (FLook.Kind = jtkEof) and (FProgress <> nil) and Assigned(FProgress.Progress) then
    FProgress.Progress(FProgress.Data, 100, FSize, FSize);
  {$ENDIF SUPPORT_PROGRESS}
  //inherited Destroy;
end;

{$IFDEF SUPPORT_PROGRESS}
procedure TJsonReader.CheckProgress(Position: Pointer);
var
  NewPercentage: NativeInt;
  Ps: NativeInt;
begin
  if {(FProgress <> nil) and} Assigned(FProgress.Progress) then
  begin
    Ps := PByte(Position) - PByte(FStart);
    if FProgress.Threshold = 0 then
    begin
      NewPercentage := Ps * 100 div FSize;
      if NewPercentage <> FLastProgressValue then
      begin
        FLastProgressValue := NewPercentage;
        FProgress.Progress(FProgress.Data, NewPercentage, Ps, FSize);
      end;
    end
    else if FProgress.Threshold > 0 then
    begin
      if Ps - FLastProgressValue >= FProgress.Threshold then
      begin
        FLastProgressValue := Ps;
        NewPercentage := 0;
        if FSize > 0 then
          NewPercentage := Ps * 100 div FSize;
        FProgress.Progress(FProgress.Data, NewPercentage, Ps, FSize);
      end;
    end;
  end;
end;

{$ENDIF SUPPORT_PROGRESS}
function TJsonReader.GetLineColumn: NativeInt;
begin
  if FLineStart = nil then
    FLineStart := FStart;
  Result := GetCharOffset(FLineStart) + 1; // base 1
end;

function TJsonReader.GetPosition: NativeInt;
begin
  Result := GetCharOffset(FStart);
end;

class procedure TJsonReader.InvalidStringCharacterError(const Reader: TJsonReader);
begin
  raise EDGJsonParserException.CreateRes(@RsInvalidStringCharacter,
    Reader.FLineNum, Reader.GetLineColumn, Reader.GetPosition);
end;

class procedure TJsonReader.StringNotClosedError(const Reader: TJsonReader);
begin
  raise EDGJsonParserException.CreateRes(@RsStringNotClosed,
    Reader.FLineNum, Reader.GetLineColumn, Reader.GetPosition);
end;

class procedure TJsonReader.JSONStrToStr(P, EndP: PChar; FirstEscapeIndex: Integer; var S: string;
  const Reader: TJsonReader);
const
  MaxBufPos = 127;
var
  Buf: array[0..MaxBufPos] of Char;
  F: PChar;
  BufPos, Len: Integer;
begin
  Dec(FirstEscapeIndex);
  if FirstEscapeIndex > 0 then
  begin
    SetString(S, P, FirstEscapeIndex);
    Inc(P, FirstEscapeIndex);
  end
  else
    S := '';
  while True do
  begin
    BufPos := 0;
    while (P < EndP) and (P^ = '\') do
    begin
      Inc(P);
      if P = EndP then // broken escaped character
        Break;
      case P^ of
        '"': Buf[BufPos] := '"';
        '\': Buf[BufPos] := '\';
        '/': Buf[BufPos] := '/';
        'b': Buf[BufPos] := #8;
        'f': Buf[BufPos] := #12;
        'n': Buf[BufPos] := #10;
        'r': Buf[BufPos] := #13;
        't': Buf[BufPos] := #9;
        'u':
          begin
            Inc(P);
            if P + 3 >= EndP then
              Break;
            Buf[BufPos] := Char(GetHexDigits(P, 4, TJsonReader(Reader)));
            Inc(P, 3);
          end;
      else
        Break;
      end;
      Inc(P);
      Inc(BufPos);
      if BufPos > MaxBufPos then
      begin
        Len := Length(S);
        SetLength(S, Len + BufPos);
        Move(Buf[0], PChar(Pointer(S))[Len], BufPos * SizeOf(Char));
        BufPos := 0;
      end;
    end;
    // append remaining buffer
    if BufPos > 0 then
    begin
      Len := Length(S);
      SetLength(S, Len + BufPos);
      Move(Buf[0], PChar(Pointer(S))[Len], BufPos * SizeOf(Char));
    end;
    // fast forward
    F := P;
    while (P < EndP) and (P^ <> '\') do
      Inc(P);
    if P > F then
      AppendString(S, F, P - F);
    if P >= EndP then
      Break;
  end;
end;

class procedure TJsonReader.JSONUtf8StrToStr(P, EndP: PByte; FirstEscapeIndex: Integer; var S: string;
  const Reader: TJsonReader);
const
  MaxBufPos = 127;
var
  Buf: array[0..MaxBufPos] of Char;
  F: PByte;
  BufPos, Len: Integer;
begin
  Dec(FirstEscapeIndex);
  if FirstEscapeIndex > 0 then
  begin
    SetStringUtf8(S, P, FirstEscapeIndex);
    Inc(P, FirstEscapeIndex);
  end
  else
    S := '';
  while True do
  begin
    BufPos := 0;
    while (P < EndP) and (P^ = Byte(Ord('\'))) do
    begin
      Inc(P);
      if P = EndP then // broken escaped character
        Break;
      case P^ of
        Ord('"'): Buf[BufPos] := '"';
        Ord('\'): Buf[BufPos] := '\';
        Ord('/'): Buf[BufPos] := '/';
        Ord('b'): Buf[BufPos] := #8;
        Ord('f'): Buf[BufPos] := #12;
        Ord('n'): Buf[BufPos] := #10;
        Ord('r'): Buf[BufPos] := #13;
        Ord('t'): Buf[BufPos] := #9;
        Ord('u'):
          begin
            Inc(P);
            if P + 3 >= EndP then
              Break;
            Buf[BufPos] := Char(GetHexDigitsUtf8(P, 4, TJsonReader(Reader)));
            Inc(P, 3);
          end;
      else
        Break;
      end;
      Inc(P);
      Inc(BufPos);
      if BufPos > MaxBufPos then
      begin
        Len := Length(S);
        SetLength(S, Len + BufPos);
        Move(Buf[0], PChar(Pointer(S))[Len], BufPos * SizeOf(Char));
        BufPos := 0;
      end;
    end;
    // append remaining buffer
    if BufPos > 0 then
    begin
      Len := Length(S);
      SetLength(S, Len + BufPos);
      Move(Buf[0], PChar(Pointer(S))[Len], BufPos * SizeOf(Char));
    end;
    // fast forward
    F := P;
    while (P < EndP) and (P^ <> Byte(Ord('\'))) do
      Inc(P);
    if P > F then
      AppendStringUtf8(S, F, P - F);
    if P >= EndP then
      Break;
  end;
end;

procedure TJsonReader.Parse(Data: TDGJsonBaseObject);
begin
  if Data is TDGJsonObject then
  begin
    TDGJsonObject(Data).Clear;
    Next; // initialize Lexer
    Accept(jtkLBrace);
    ParseObjectBody(TDGJsonObject(Data));
    Accept(jtkRBrace);
  end
  else if Data is TDGJsonArray then
  begin
    TDGJsonArray(Data).Clear;
    Next; // initialize Lexer
    Accept(jtkLBracket);
    ParseArrayBody(TDGJsonArray(Data));
    Accept(jtkRBracket)
  end;
end;

procedure TJsonReader.ParseObjectBody(const Data: TDGJsonObject);
// ObjectBody ::= [ ObjectProperty [ "," ObjectProperty ]* ]
begin
  if FLook.Kind <> jtkRBrace then
  begin
    while FLook.Kind <> jtkEof do
    begin
      ParseObjectProperty(Data);
      if FLook.Kind = jtkRBrace then
        Break;
      Accept(jtkComma);
    end;
  end;
end;

procedure TJsonReader.ParseObjectProperty(const Data: TDGJsonObject);
// Property ::= IDENT ":" ObjectPropertyValue
begin
  if FLook.Kind >= jtkIdent then // correct JSON would be "tkString" only
  begin
    {$IFDEF USE_STRINGINTERN_FOR_NAMES}
    FIdents.Intern(FLook.S, FPropName);
    {$ELSE}
    FPropName := '';
    // transfer the string without going through UStrAsg and UStrClr
    Pointer(FPropName) := Pointer(FLook.S);
    Pointer(FLook.S) := nil;
    {$ENDIF USE_STRINGINTERN_FOR_NAMES}
    Next;
  end
  else
    Accept(jtkString);
  Accept(jtkColon);
  ParseObjectPropertyValue(Data);
end;

procedure TJsonReader.ParseObjectPropertyValue(const Data: TDGJsonObject);
// ObjectPropertyValue ::= Object | Array | Value
begin
  case FLook.Kind of
    jtkLBrace:
      begin
        Accept(jtkLBrace);
        ParseObjectBody(Data.InternAddObject(FPropName));
        Accept(jtkRBrace);
      end;
    jtkLBracket:
      begin
        Accept(jtkLBracket);
        ParseArrayBody(Data.InternAddArray(FPropName));
        Accept(jtkRBracket);
      end;
    jtkNull:
      begin
        Data.InternAdd(FPropName, TDGJsonObject(nil));
        Next;
      end;
    jtkIdent,
    jtkString:
      begin
        Data.InternAddItem(FPropName).InternSetValueTransfer(FLook.S);
        Next;
      end;
    jtkInt:
      begin
        Data.InternAdd(FPropName, FLook.I);
        Next;
      end;
    jtkLong:
      begin
        Data.InternAdd(FPropName, FLook.L);
        Next;
      end;
    jtkULong:
      begin
        Data.InternAdd(FPropName, FLook.U);
        Next;
      end;
    jtkFloat:
      begin
        Data.InternAdd(FPropName, FLook.F);
        Next;
      end;
    jtkTrue:
      begin
        Data.InternAdd(FPropName, True);
        Next;
      end;
    jtkFalse:
      begin
        Data.InternAdd(FPropName, False);
        Next;
      end
  else
    Accept(jtkValue);
  end;
end;

procedure TJsonReader.ParseArrayBody(const Data: TDGJsonArray);
// ArrayBody ::= [ ArrayPropertyValue [ "," ArrayPropertyValue ]* ]
begin
  if FLook.Kind <> jtkRBracket then
  begin
    while FLook.Kind <> jtkEof do
    begin
      ParseArrayPropertyValue(Data);
      if FLook.Kind = jtkRBracket then
        Break;
      Accept(jtkComma);
    end;
  end;
end;

procedure TJsonReader.ParseArrayPropertyValue(const Data: TDGJsonArray);
// ArrayPropertyValue ::= Object | Array | Value
begin
  case FLook.Kind of
    jtkLBrace:
      begin
        Accept(jtkLBrace);
        ParseObjectBody(Data.AddObject);
        Accept(jtkRBrace);
      end;
    jtkLBracket:
      begin
        Accept(jtkLBracket);
        ParseArrayBody(Data.AddArray);
        Accept(jtkRBracket);
      end;
    jtkNull:
      begin
        Data.Add(TDGJsonObject(nil));
        Next;
      end;
    jtkIdent,
    jtkString:
      begin
        Data.Add(FLook.S);
        Next;
      end;
    jtkInt:
      begin
        Data.Add(FLook.I);
        Next;
      end;
    jtkLong:
      begin
        Data.Add(FLook.L);
        Next;
      end;
    jtkULong:
      begin
        Data.Add(FLook.U);
        Next;
      end;
    jtkFloat:
      begin
        Data.Add(FLook.F);
        Next;
      end;
    jtkTrue:
      begin
        Data.Add(True);
        Next;
      end;
    jtkFalse:
      begin
        Data.Add(False);
        Next;
      end;
  else
    Accept(jtkValue);
  end;
end;

procedure TJsonReader.AcceptFailed(TokenKind: TJsonTokenKind);
var
  Col, Position: NativeInt;
begin
  Col := GetLineColumn;
  Position := GetPosition;
  if FLook.Kind = jtkEof then
    raise EDGJsonParserException.CreateResFmt(@RsUnexpectedEndOfFile, [JsonTokenKindToStr[TokenKind]], FLineNum, Col, Position);
  raise EDGJsonParserException.CreateResFmt(@RsUnexpectedToken, [JsonTokenKindToStr[TokenKind], JsonTokenKindToStr[FLook.Kind]], FLineNum, Col, Position);
end;

procedure TJsonReader.Accept(TokenKind: TJsonTokenKind);
begin
  if FLook.Kind <> TokenKind then
    AcceptFailed(TokenKind);
  Next;
end;

{ TJsonDataValue }
procedure TDGJsonDataValue.Clear;
{$IFDEF USE_FAST_AUTOREFCOUNT}
var
  P: Pointer;
{$ENDIF USE_FAST_AUTOREFCOUNT}
begin
  // All types must clear their value because if a value changes the type we need a zero-ed value
  case FTyp of
    jdtString:
      string(FValue.S) := '';
    jdtInt:
      FValue.I := 0;
    jdtLong:
      FValue.L := 0;
    jdtULong:
      FValue.U := 0;
    jdtFloat:
      FValue.F := 0;
    jdtDateTime, jdtUtcDateTime:
      FValue.D := 0;
    jdtBool:
      FValue.B := False;
    jdtArray,
    jdtObject:
      begin
        {$IFDEF USE_FAST_AUTOREFCOUNT}
        P := FValue.O;
        if P <> nil then
        begin
          FValue.O := nil;
          TJsonBaseObject(P).ARCObjRelease;
        end;
        {$ELSE}
          {$IFNDEF AUTOREFCOUNT}
        TDGJsonBaseObject(FValue.O).Free;
          {$ENDIF ~AUTOREFCOUNT}
        TDGJsonBaseObject(FValue.O) := nil;
        {$ENDIF USE_FAST_AUTOREFCOUNT}
      end;
  end;
  FTyp := jdtNone;
end;

function TDGJsonDataValue.IsNull: Boolean;
begin
  case FTyp of
    jdtObject:
      Result := FValue.O = nil;
    jdtNone:
      Result := True;
  else
    Result := False;
  end;
end;

function TDGJsonDataValue.GetArrayValue: TDGJsonArray;
begin
  if FTyp = jdtArray then
    Result := TDGJsonArray(FValue.A)
  else if FTyp = jdtNone then
    Result := nil
  else
  begin
    TypeCastError(jdtArray);
    Result := nil;
  end;
end;

procedure TDGJsonDataValue.SetArrayValue(const AValue: TDGJsonArray);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtArray) or (AValue <> FValue.A) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtArray;
    {$IFDEF USE_FAST_AUTOREFCOUNT}
    // Assert(FValue.A = nil);
    if AValue <> nil then
      AValue.ARCObjAddRef;
    FValue.A := Pointer(AValue);
    {$ELSE}
    TDGJsonArray(FValue.A) := AValue;
    {$ENDIF USE_FAST_AUTOREFCOUNT}
  end;
end;

function TDGJsonDataValue.GetObjectValue: TDGJsonObject;
begin
  if FTyp = jdtObject then
    Result := TDGJsonObject(FValue.O)
  else if FTyp = jdtNone then
    Result := nil
  else
  begin
    TypeCastError(jdtObject);
    Result := nil;
  end;
end;

procedure TDGJsonDataValue.SetObjectValue(const AValue: TDGJsonObject);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtObject) or (AValue <> FValue.O) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtObject;
    {$IFDEF USE_FAST_AUTOREFCOUNT}
    // Assert(FValue.O = nil);
    if AValue <> nil then
      AValue.ARCObjAddRef;
    FValue.O := Pointer(AValue);
    {$ELSE}
    TDGJsonObject(FValue.O) := AValue;
    {$ENDIF USE_FAST_AUTOREFCOUNT}
  end;
end;


function TDGJsonDataValue.GetVariantValue: Variant;
begin
  case FTyp of
    jdtNone:
      Result := Unassigned;
    jdtString:
      Result := string(FValue.S);
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := FValue.F;
    jdtDateTime:
      Result := FValue.D;
    jdtUtcDateTime:
      Result := UtcDateTimeToLocalDateTime(FValue.D); // Variant is local time
    jdtBool:
      Result := FValue.B;
    jdtArray:
      ErrorUnsupportedVariantType(varArray);
    jdtObject:
      if FValue.O = nil then
        Result := Null // special handling for "null"
      else
        ErrorUnsupportedVariantType(varObject);
  else
    ErrorUnsupportedVariantType(varAny);
  end;
end;

procedure TDGJsonDataValue.SetVariantValue(const AValue: Variant);
var
  LTyp: TDGJsonDataType;
begin
  if FTyp <> jdtNone then
    Clear;
  LTyp := VarTypeToJsonDataType(VarType(AValue));
  if LTyp <> jdtNone then
  begin
    FTyp := LTyp;
    case LTyp of
      jdtString:
        string(FValue.S) := AValue;
      jdtInt:
        FValue.I := AValue;
      jdtLong:
        FValue.L := AValue;
      jdtULong:
        FValue.U := AValue;
      jdtFloat:
        FValue.F := AValue;
      jdtDateTime:
        FValue.D := AValue;
      jdtBool:
        FValue.B := AValue;
//    else
//      ErrorUnsupportedVariantType; handled by VarTypeToJsonDataType
    end;
  end;
end;

procedure TDGJsonDataValue.InternSetArrayValue(const AValue: TDGJsonArray);
begin
  FTyp := jdtArray;
  {$IFDEF USE_FAST_AUTOREFCOUNT}
  // Assert(FValue.A = nil);
  if AValue <> nil then
    Inc(AValue.FRefCount); // AValue.ARCObjAddRef;   no other thread knows about this object right now
  FValue.A := Pointer(AValue);
  {$ELSE}
  TDGJsonArray(FValue.A) := AValue;
  {$ENDIF USE_FAST_AUTOREFCOUNT}
end;

procedure TDGJsonDataValue.InternSetObjectValue(const AValue: TDGJsonObject);
begin
  FTyp := jdtObject;
  {$IFDEF USE_FAST_AUTOREFCOUNT}
  // Assert(FValue.O = nil);
  if AValue <> nil then
    Inc(AValue.FRefCount); // AValue.ARCObjAddRef;   no other thread knows about this object right now
  FValue.O := Pointer(AValue);
  {$ELSE}
  TDGJsonObject(FValue.O) := AValue;
  {$ENDIF USE_FAST_AUTOREFCOUNT}
end;

function TDGJsonDataValue.GetValue: string;
begin
  case FTyp of
    jdtNone:
      Result := '';
    jdtString:
      Result := string(FValue.S);
    jdtInt:
      Result := IntToStr(FValue.I);
    jdtLong:
      Result := IntToStr(FValue.L);
    jdtULong:
      Result := UIntToStr(FValue.U);
    jdtFloat:
      Result := FloatToStr(FValue.F, JSONFormatSettings);
    jdtDateTime:
      Result := TDGJsonBaseObject.DateTimeToJSON(FValue.F, DGJsonSerializationConfig.UseUtcTime);
    jdtUtcDateTime:
      Result := TDGJsonBaseObject.UtcDateTimeToJSON(FValue.F);
    jdtBool:
      if FValue.B then
        Result := sTrue
      else
        Result := sFalse;
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtString);
        Result := '';
      end;
  else
    TypeCastError(jdtString);
    Result := '';
  end;
end;

procedure TDGJsonDataValue.SetValue(const AValue: string);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtString) or (AValue <> string(FValue.S)) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtString;
    string(FValue.S) := AValue;
  end;
end;

procedure TDGJsonDataValue.InternSetValue(const AValue: string);
begin
  FTyp := jdtString;
  string(FValue.S) := AValue;
end;

procedure TDGJsonDataValue.InternSetValueTransfer(var AValue: string);
begin
  FTyp := jdtString;
  // transfer the string without going through UStrAsg and UStrClr
  FValue.S := Pointer(AValue);
  Pointer(AValue) := nil;
end;

function TDGJsonDataValue.GetIntValue: Integer;
begin
  case FTyp of
    jdtNone:
      Result := 0;
    jdtString:
      if not TryStrToInt(string(FValue.S), Result) then
        Result := Trunc(StrToFloat(string(FValue.S), JSONFormatSettings));
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := Trunc(FValue.F);
    jdtDateTime, jdtUtcDateTime:
      Result := Trunc(FValue.D);
    jdtBool:
      Result := Ord(FValue.B);
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtInt);
        Result := 0;
      end;
  else
    TypeCastError(jdtInt);
    Result := 0;
  end;
end;

procedure TDGJsonDataValue.SetIntValue(const AValue: Integer);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtInt) or (AValue <> FValue.I) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtInt;
    FValue.I := AValue;
  end;
end;

function TDGJsonDataValue.GetLongValue: Int64;
begin
  case FTyp of
    jdtNone:
      Result := 0;
    jdtString:
      if not TryStrToInt64(string(FValue.S), Result) then
        Result := Trunc(StrToFloat(string(FValue.S), JSONFormatSettings));
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := Trunc(FValue.F);
    jdtDateTime, jdtUtcDateTime:
      Result := Trunc(FValue.D);
    jdtBool:
      Result := Ord(FValue.B);
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtLong);
        Result := 0;
      end;
  else
    TypeCastError(jdtLong);
    Result := 0;
  end;
end;

procedure TDGJsonDataValue.SetLongValue(const AValue: Int64);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtLong) or (AValue <> FValue.L) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtLong;
    FValue.L := AValue;
  end;
end;

function TDGJsonDataValue.GetULongValue: UInt64;
begin
  case FTyp of
    jdtNone:
      Result := 0;
    jdtString:
      if not TryStrToUInt64(string(FValue.S), Result) then
        Result := Trunc(StrToFloat(string(FValue.S), JSONFormatSettings));
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := Trunc(FValue.F);
    jdtDateTime, jdtUtcDateTime:
      Result := Trunc(FValue.D);
    jdtBool:
      Result := Ord(FValue.B);
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtULong);
        Result := 0;
      end;
  else
    TypeCastError(jdtULong);
    Result := 0;
  end;
end;

procedure TDGJsonDataValue.SetULongValue(const AValue: UInt64);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtULong) or (AValue <> FValue.U) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtULong;
    FValue.U := AValue;
  end;
end;

function TDGJsonDataValue.GetFloatValue: Double;
begin
  case FTyp of
    jdtNone:
      Result := 0;
    jdtString:
      Result := StrToFloat(string(FValue.S), JSONFormatSettings);
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := FValue.F;
    jdtDateTime, jdtUtcDateTime:
      Result := FValue.D;
    jdtBool:
      Result := Ord(FValue.B);
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtFloat);
        Result := 0;
      end;
  else
    TypeCastError(jdtFloat);
    Result := 0;
  end;
end;

procedure TDGJsonDataValue.SetFloatValue(const AValue: Double);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtFloat) or (AValue <> FValue.F) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtFloat;
    FValue.F := AValue;
  end;
end;

function TDGJsonDataValue.GetDateTimeValue: TDateTime;
begin
  case FTyp of
    jdtNone:
      Result := 0;
    jdtString:
      Result := TDGJsonBaseObject.JSONToDateTime(string(FValue.S));
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := FValue.F;
    jdtDateTime:
      Result := FValue.D;
    jdtUtcDateTime:
      Result := UtcDateTimeToLocalDateTime(FValue.D);
    jdtBool:
      Result := Ord(FValue.B);
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtDateTime);
        Result := 0;
      end;
  else
    TypeCastError(jdtDateTime);
    Result := 0;
  end;
end;

procedure TDGJsonDataValue.SetDateTimeValue(const AValue: TDateTime);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtDateTime) or (AValue <> FValue.D) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtDateTime;
    FValue.D := AValue;
  end;
end;

function TDGJsonDataValue.GetUtcDateTimeValue: TDateTime;
begin
  case FTyp of
    jdtNone:
      Result := 0;
    jdtString:
      Result := TDGJsonBaseObject.JSONToDateTime(string(FValue.S), False);
    jdtInt:
      Result := FValue.I;
    jdtLong:
      Result := FValue.L;
    jdtULong:
      Result := FValue.U;
    jdtFloat:
      Result := FValue.F;
    jdtDateTime:
      Result := LocalDateTimeToUtcDateTime(FValue.D);
    jdtUtcDateTime:
      Result := FValue.D;
    jdtBool:
      Result := Ord(FValue.B);
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtDateTime);
        Result := 0;
      end;
  else
    TypeCastError(jdtUtcDateTime);
    Result := 0;
  end;
end;

procedure TDGJsonDataValue.SetUtcDateTimeValue(const AValue: TDateTime);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtUtcDateTime) or (AValue <> FValue.D) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtUtcDateTime;
    FValue.D := AValue;
  end;
end;

function TDGJsonDataValue.GetBoolValue: Boolean;
begin
  case FTyp of
    jdtNone:
      Result := False;
    jdtString:
      Result := string(FValue.S) = 'true';
    jdtInt:
      Result := FValue.I <> 0;
    jdtLong:
      Result := FValue.L <> 0;
    jdtULong:
      Result := FValue.U <> 0;
    jdtFloat:
      Result := FValue.F <> 0;
    jdtDateTime, jdtUtcDateTime:
      Result := FValue.D <> 0;
    jdtBool:
      Result := FValue.B;
    jdtObject:
      begin
        if not DGJsonSerializationConfig.NullConvertsToValueTypes or (FValue.O <> nil) then
          TypeCastError(jdtBool);
        Result := False;
      end;
  else
    TypeCastError(jdtBool);
    Result := False;
  end;
end;

procedure TDGJsonDataValue.SetBoolValue(const AValue: Boolean);
var
  LTyp: TDGJsonDataType;
begin
  LTyp := FTyp;
  if (LTyp <> jdtBool) or (AValue <> FValue.B) then
  begin
    if LTyp <> jdtNone then
      Clear;
    FTyp := jdtBool;
    FValue.B := AValue;
  end;
end;

function DoubleToText(Buffer: PChar; const Value: Extended): Integer; inline;
begin
  Result := FloatToText(Buffer, Value, fvExtended, ffGeneral, 15, 0, JSONFormatSettings);
end;

const
  DoubleDigits: array[0..99] of array[0..1] of Char = (
    '00', '01', '02', '03', '04', '05', '06', '07', '08', '09',
    '10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
    '20', '21', '22', '23', '24', '25', '26', '27', '28', '29',
    '30', '31', '32', '33', '34', '35', '36', '37', '38', '39',
    '40', '41', '42', '43', '44', '45', '46', '47', '48', '49',
    '50', '51', '52', '53', '54', '55', '56', '57', '58', '59',
    '60', '61', '62', '63', '64', '65', '66', '67', '68', '69',
    '70', '71', '72', '73', '74', '75', '76', '77', '78', '79',
    '80', '81', '82', '83', '84', '85', '86', '87', '88', '89',
    '90', '91', '92', '93', '94', '95', '96', '97', '98', '99'
  );

function InternIntToText(Value: Cardinal; Negative: Boolean; EndP: PChar): PChar;
var
  I, Quotient, K: Cardinal;
begin
  I := Value;
  Result := EndP;
  while I >= 100 do
  begin
    Quotient := I div 100;
    K := Quotient * 100;
    K := I - K;
    I := Quotient;
    Dec(Result, 2);
    PLongWord(Result)^ := LongWord(DoubleDigits[K]);
  end;
  if I >= 10 then
  begin
    Dec(Result, 2);
    PLongWord(Result)^ := LongWord(DoubleDigits[I]);
  end
  else
  begin
    Dec(Result);
    Result^ := Char(I or Ord('0'));
  end;
  if Negative then
  begin
    Dec(Result);
    Result^ := '-';
  end;
end;

function IntToText(Value: Integer; EndP: PChar): PChar; inline;
begin
  if Value < 0 then
    Result := InternIntToText(Cardinal(-Value), True, EndP)
  else
    Result := InternIntToText(Cardinal(Value), False, EndP);
end;

function UInt64ToText(Value: UInt64; EndP: PChar): PChar;
var
  Quotient: UInt64;
  Remainder: Cardinal;
begin
  Result := EndP;
  while Value > High(Integer) do
  begin
    Quotient := Value div 100;
    //Remainder := Value - (Quotient * 100);
    Remainder := Value - (Quotient shl 6 + Quotient shl 5 + Quotient shl 2);
    Value := Quotient;
    Dec(Result, 2);
    PLongWord(Result)^ := LongWord(DoubleDigits[Remainder]);
  end;
  Result := InternIntToText(Cardinal(Value), False, Result);
end;

function Int64ToText(Value: Int64; EndP: PChar): PChar;
var
  Neg: Boolean;
begin
  Neg := Value < 0;
  if Neg then
    Value := -Value;
  Result := UInt64ToText(UInt64(Value), EndP);
  if Neg then
  begin
    Dec(Result);
    Result^ := '-';
  end;
end;

procedure TDGJsonDataValue.InternToJSON(var Writer: TDGJsonOutputWriter);
var
  Buffer: array[0..63] of Char;
  P, BufEnd: PChar;
begin
  case FTyp of
    jdtNone:
      Writer.AppendValue(sNull);
    jdtString:
      TDGJsonBaseObject.StrToJSONStr(Writer.AppendStrValue, string(FValue.S));
    jdtInt:
      begin
        BufEnd := @PChar(@Buffer[0])[Length(Buffer)]; // extra typecast to work around a compiler bug (fixed in XE3)
        P := IntToText(FValue.I, BufEnd);
        Writer.AppendValue(P, BufEnd - P);
      end;
    jdtLong:
      begin
        BufEnd := @PChar(@Buffer[0])[Length(Buffer)]; // extra typecast to work around a compiler bug (fixed in XE3)
        P := Int64ToText(FValue.L, BufEnd);
        Writer.AppendValue(P, BufEnd - P);
      end;
    jdtULong:
      begin
        BufEnd := @PChar(@Buffer[0])[Length(Buffer)]; // extra typecast to work around a compiler bug (fixed in XE3)
        P := UInt64ToText(FValue.U, BufEnd);
        Writer.AppendValue(P, BufEnd - P);
      end;
    jdtFloat:
      Writer.AppendValue(Buffer, DoubleToText(Buffer, FValue.F));
    jdtDateTime:
      TDGJsonBaseObject.DateTimeToJSONStr(Writer.AppendStrValue, FValue.D); // do the conversion in a function to prevent the compiler from creating a string intermediate in this method
    jdtUtcDateTime:
      TDGJsonBaseObject.UtcDateTimeToJSONStr(Writer.AppendStrValue, FValue.D); // do the conversion in a function to prevent the compiler from creating a string intermediate in this method
    jdtBool:
      if FValue.B then
        Writer.AppendValue(sTrue)
      else
        Writer.AppendValue(sFalse);
    jdtArray:
      if (FValue.A = nil) or (TDGJsonArray(FValue.A).Count = 0) then
        Writer.AppendValue('[]')
      else
        TDGJsonArray(FValue.A).InternToJSON(Writer);
    jdtObject:
      if FValue.O = nil then
        Writer.AppendValue(sNull)
      else
        TDGJsonObject(FValue.O).InternToJSON(Writer);
  end;
end;

{ TJsonBaseObject }
{$IFDEF USE_FAST_NEWINSTANCE}
class function TDGJsonBaseObject.NewInstance: TObject;
begin
  Result := AllocMem(InstanceSize); // zeroes the new memory
  PPointer(Result)^ := Self; // VMT
  {$IFDEF AUTOREFCOUNT}
  TJsonBaseObject(Result).FRefCount := 1;
  {$ENDIF AUTOREFCOUNT}
end;
{$ENDIF ~USE_FAST_NEWINSTANCE}

{$IFDEF USE_FAST_AUTOREFCOUNT}
function TJsonBaseObject.ARCObjRelease: Integer;
begin
  // Use a static call instead of the virtual method call
  Result := inherited __ObjRelease;
end;
function TJsonBaseObject.ARCObjAddRef: Integer;
begin
  // Inline __ObjAddRef to skip the virtual method call
  Result := AtomicIncrement(FRefCount);
  //Result := inherited __ObjAddRef;
end;

{$ENDIF USE_FAST_AUTOREFCOUNT}
class procedure TDGJsonBaseObject.StrToJSONStr(const AppendMethod: TWriterAppendMethod; const S: string);
var
  P, EndP, F: PChar;
begin
  P := PChar(Pointer(S));
  if P <> nil then
  begin
    //EndP := P + Length(S);  inlined Length introduces too much unnecessary code
    EndP := P + PInteger(@PByte(S)[-4])^;
    // find the first char that must be escaped
    F := P;
//    DCC64 generates "bt mem,reg" code
//    while (P < EndP) and not (P^ in [#0..#31, '\', '"' {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}, '/'{$ENDIF}]) do
//      Inc(P);
    while P < EndP do
      case P^ of
        #0..#31, '\', '"' {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}, '/'{$ENDIF}: Break;
      else
        Inc(P);
      end;
    // nothing found, than it is easy
    if P = EndP then
      AppendMethod(PChar(S), Length(S))
    else
      EscapeStrToJSONStr(F, P, EndP, AppendMethod);
  end
  else
    AppendMethod(nil, 0);
end;

class procedure TDGJsonBaseObject.DateTimeToJSONStr(const AppendMethod: TWriterAppendMethod; const Value: TDateTime);
var
  S: string;
begin
  S := TDGJsonBaseObject.DateTimeToJSON(Value, DGJsonSerializationConfig.UseUtcTime);
  // StrToJSONStr isn't necessary because the date-time string doesn't contain any char
  // that must be escaped.
  AppendMethod(PChar(S), Length(S));
end;

class procedure TDGJsonBaseObject.UtcDateTimeToJSONStr(const AppendMethod: TWriterAppendMethod; const Value: TDateTime);
var
  S: string;
begin
  S := TDGJsonBaseObject.UtcDateTimeToJSON(Value);
  // StrToJSONStr isn't necessary because the date-time string doesn't contain any char
  // that must be escaped.
  AppendMethod(PChar(S), Length(S));
end;

class procedure TDGJsonBaseObject.EscapeStrToJSONStr(F, P, EndP: PChar; const AppendMethod: TWriterAppendMethod);
const
  HexChars: array[0..15] of Char = '0123456789abcdef';
var
  Buf: TDGJsonOutputWriter.TJsonStringBuilder;
  Ch: Char;
  {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}
  StartP: PChar;
  {$ENDIF ESCAPE_SLASH_AFTER_LESSTHAN}
begin
  {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}
  StartP := F;
  {$ENDIF ESCAPE_SLASH_AFTER_LESSTHAN}
  Buf.Init;
  try
    repeat
      if P <> F then
        Buf.Append(F, P - F); // append the string part that doesn't need an escape sequence
      if P < EndP then
      begin
        Ch := P^;
        case Ch of
          #0..#7, #11, #14..#31:
            begin
              Buf.Append('\u00', 4);
              Buf.Append2(HexChars[Word(Ch) shr 4], HexChars[Word(Ch) and $F]);
            end;
          #8: Buf.Append('\b', 2);
          #9: Buf.Append('\t', 2);
          #10: Buf.Append('\n', 2);
          #12: Buf.Append('\f', 2);
          #13: Buf.Append('\r', 2);
          '\': Buf.Append('\\', 2);
          '"': Buf.Append('\"', 2);
          {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}
          '/':
            begin
              if (P > StartP) and (P[-1] = '<') then // escape '/' only if we have '</' to support HTML <script>-Tag
                Buf.Append('\/', 2)
              else
                Buf.Append('/', 1);
            end;
          {$ENDIF ESCAPE_SLASH_AFTER_LESSTHAN}
        end;
        Inc(P);
        F := P;
//        DCC64 generates "bt mem,reg" code
//        while (P < EndP) and not (P^ in [#0..#31, '\', '"' {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}, '/'{$ENDIF}]) do
//          Inc(P);
        while P < EndP do
          case P^ of
            #0..#31, '\', '"' {$IFDEF ESCAPE_SLASH_AFTER_LESSTHAN}, '/'{$ENDIF}: Break;
          else
            Inc(P);
          end;
      end
      else
        Break;
    until False;
    AppendMethod(Buf.Data, Buf.Len);
  finally
    Buf.Done;
  end;
end;

class function TDGJsonBaseObject.ParseUtf8(S: PAnsiChar; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
begin
  Result := ParseUtf8Bytes(PByte(S), Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
end;

{$IFDEF SUPPORTS_UTF8STRING}
class function TDGJsonBaseObject.ParseUtf8(const S: UTF8String{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
begin
  Result := ParseUtf8Bytes(PByte(S), Length(S){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
end;
{$ENDIF SUPPORTS_UTF8STRING}

class function TDGJsonBaseObject.ParseUtf8Bytes(S: PByte; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
var
  P: PByte;
  L: Integer;
begin
  if (S = nil) or (Len = 0) then
    Result := nil
  else
  begin
    if Len < 0 then
    begin
      {$IFDEF NEXTGEN}
      Len := Utf8StrLen(S);
      {$ELSE}
      Len := StrLen(PAnsiChar(S));
      {$ENDIF NEXTGEN}
    end;
    P := S;
    L := Len;
    while (L > 0) and (P^ <= 32) do
    begin
      Inc(P);
      Dec(L);
    end;
    if L = 0 then
      Result := nil
    else
    begin
      if (L > 0) and (P^ = Byte(Ord('['))) then
        Result := TDGJsonArray.Create
      else
        Result := TDGJsonObject.Create;
      {$IFDEF AUTOREFCOUNT}
      Result.FromUtf8JSON(S, Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
      {$ELSE}
      try
        Result.FromUtf8JSON(S, Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
      except
        Result.Free;
        raise;
      end;
      {$ENDIF AUTOREFCOUNT}
    end;
  end;
end;

class function TDGJsonBaseObject.Parse(const S: UnicodeString{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
begin
  Result := Parse(PWideChar(Pointer(S)), Length(S){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
end;

class function TDGJsonBaseObject.Parse(S: PWideChar; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
var
  P: PWideChar;
  L: Integer;
begin
  if (S = nil) or (Len = 0) then
    Result := nil
  else
  begin
    if Len < 0 then
      Len := StrLen(S);
    P := S;
    L := Len;
    while (L > 0) and (P^ <= #32) do
    begin
      Inc(P);
      Dec(L);
    end;
    if L = 0 then
      Result := nil
    else
    begin
      if (L > 0) and (P^ = '[') then
        Result := TDGJsonArray.Create
      else
        Result := TDGJsonObject.Create;
      {$IFDEF AUTOREFCOUNT}
      Result.FromJSON(S, Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
      {$ELSE}
      try
        Result.FromJSON(S, Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
      except
        Result.Free;
        raise;
      end;
      {$ENDIF AUTOREFCOUNT}
    end;
  end;
end;

class function TDGJsonBaseObject.Parse(const Bytes: TBytes; Encoding: TEncoding; ByteIndex: Integer;
  ByteCount: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
var
  L: Integer;
begin
  L := Length(Bytes);
  if ByteCount = -1 then
    ByteCount := L - ByteIndex;
  if (ByteCount <= 0) or (ByteIndex + ByteCount > L) then
    Result := nil
  else
  begin
    if (Encoding = TEncoding.UTF8) or (Encoding = nil) then
      Result := ParseUtf8Bytes(PByte(@Bytes[ByteIndex]), ByteCount{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF})
    else if Encoding = TEncoding.Unicode then
      Result := Parse(PWideChar(@Bytes[ByteIndex]), ByteCount div SizeOf(WideChar){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF})
    else
      Result := Parse(Encoding.GetString(Bytes, ByteIndex, ByteCount){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
  end;
end;

class function TDGJsonBaseObject.ParseFromFile(const FileName: string; Utf8WithoutBOM: Boolean{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := ParseFromStream(Stream, nil, Utf8WithoutBOM{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
  finally
    Stream.Free;
  end;
end;

class function TDGJsonBaseObject.ParseFromStream(Stream: TStream; Encoding: TEncoding; Utf8WithoutBOM: Boolean{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF}): TDGJsonBaseObject;
var
  StreamInfo: TStreamInfo;
  S: string;
  L: Integer;
begin
  GetStreamBytes(Stream, Encoding, Utf8WithoutBOM, StreamInfo);
  try
    if Encoding = TEncoding.UTF8 then
      Result := ParseUtf8Bytes(StreamInfo.Buffer, StreamInfo.Size{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF})
    else if Encoding = TEncoding.Unicode then
      Result := Parse(PWideChar(Pointer(StreamInfo.Buffer)), StreamInfo.Size div SizeOf(WideChar){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF})
    else
    begin
      L := TEncodingStrictAccess(Encoding).GetCharCountEx(StreamInfo.Buffer, StreamInfo.Size);
      SetLength(S, L);
      if L > 0 then
        TEncodingStrictAccess(Encoding).GetCharsEx(StreamInfo.Buffer, StreamInfo.Size, PChar(Pointer(S)), L)
      else if StreamInfo.Size > 0 then
        ErrorNoMappingForUnicodeCharacter;
      // release memory
      FreeMem(StreamInfo.AllocationBase);
      StreamInfo.AllocationBase := nil;
      Result := Parse(S{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
    end;
  finally
    FreeMem(StreamInfo.AllocationBase);
  end;
end;

{$IFDEF SUPPORTS_UTF8STRING}
procedure TDGJsonBaseObject.FromUtf8JSON(const S: UTF8String{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
begin
  FromUtf8JSON(PAnsiChar(Pointer(S)), Length(S){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
end;

{$ENDIF SUPPORTS_UTF8STRING}
procedure TDGJsonBaseObject.FromUtf8JSON(S: PAnsiChar; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
begin
  FromUtf8JSON(PByte(S), Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
end;

procedure TDGJsonBaseObject.FromUtf8JSON(S: PByte; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
var
  Reader: TJsonReader;
begin
  if Len < 0 then
  begin
    {$IFDEF NEXTGEN}
    Len := Utf8StrLen(S);
    {$ELSE}
    Len := StrLen(PAnsiChar(S));
    {$ENDIF NEXTGEN}
  end;
  Reader := TUtf8JsonReader.Create(S, Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
  try
    Reader.Parse(Self);
  finally
    Reader.Free;
  end;
end;

procedure TDGJsonBaseObject.FromJSON(const S: UnicodeString{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
begin
  FromJSON(PWideChar(S), Length(S){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
end;

procedure TDGJsonBaseObject.FromJSON(S: PWideChar; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
var
  Reader: TJsonReader;
begin
  if Len < 0 then
    Len := StrLen(S);
  Reader := TStringJsonReader.Create(S, Len{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
  try
    Reader.Parse(Self);
  finally
    Reader.Free;
  end;
end;

procedure TDGJsonBaseObject.LoadFromFile(const FileName: string; Utf8WithoutBOM: Boolean{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream, nil, Utf8WithoutBOM{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
  finally
    Stream.Free;
  end;
end;

class procedure TDGJsonBaseObject.GetStreamBytes(Stream: TStream; var Encoding: TEncoding; Utf8WithoutBOM: Boolean;
  var StreamInfo: TStreamInfo);
{$IFDEF WORKAROUND_NETWORK_FILE_INSUFFICIENT_RESOURCES}
const
  MaxBufSize = 20 * 1024 * 1024;
var
  ReadCount, ReadBufSize: NativeInt;
{$ENDIF WORKAROUND_NETWORK_FILE_INSUFFICIENT_RESOURCES}
var
  Position: Int64;
  Size: NativeInt;
  Bytes: PByte;
  BufStart: Integer;
begin
  BufStart := 0;
  Position := Stream.Position;
  Size := Stream.Size - Position;
  StreamInfo.Buffer := nil;
  StreamInfo.Size := 0;
  StreamInfo.AllocationBase := nil;
  try
    Bytes := nil;
    if Size > 0 then
    begin
      if Stream is TCustomMemoryStream then
      begin
        Bytes := TCustomMemoryStream(Stream).Memory;
        TCustomMemoryStream(Stream).Position := Position + Size;
        Inc(Bytes, Position);
      end
      else
      begin
        GetMem(StreamInfo.AllocationBase, Size);
        Bytes := StreamInfo.AllocationBase;
        {$IFDEF WORKAROUND_NETWORK_FILE_INSUFFICIENT_RESOURCES}
        if (Stream is THandleStream) and (Size > MaxBufSize) then
        begin
          ReadCount := Size;
          // Read in 20 MB blocks to work around a network limitation in Windows 2003 or older (INSUFFICIENT RESOURCES)
          while ReadCount > 0 do
          begin
            ReadBufSize := ReadCount;
            if ReadBufSize > MaxBufSize then
              ReadBufSize := MaxBufSize;
            Stream.ReadBuffer(Bytes[Size - ReadCount], ReadBufSize);
            Dec(ReadCount, ReadBufSize);
          end;
        end
        else
        {$ENDIF WORKAROUND_NETWORK_FILE_INSUFFICIENT_RESOURCES}
          Stream.ReadBuffer(StreamInfo.AllocationBase^, Size);
      end;
    end;
    if Encoding = nil then
    begin
      // Determine the encoding from the BOM
      if Utf8WithoutBOM then
        Encoding := TEncoding.UTF8
      else
        Encoding := TEncoding.Default;
      if Size >= 2 then
      begin
        if (Bytes[0] = $EF) and (Bytes[1] = $BB) then
        begin
          if Bytes[2] = $BF then
          begin
            Encoding := TEncoding.UTF8;
            BufStart := 3;
          end;
        end
        else if (Bytes[0] = $FF) and (Bytes[1] = $FE) then
        begin
          if (Bytes[2] = 0) and (Bytes[3] = 0) then
          begin
            raise EDGJsonException.CreateRes(@RsUnsupportedFileEncoding);
            //Result := bomUtf32LE;
            //BufStart := 4;
          end
          else
          begin
            Encoding := TEncoding.Unicode;
            BufStart := 2;
          end;
        end
        else if (Bytes[0] = $FE) and (Bytes[1] = $FF) then
        begin
          Encoding := TEncoding.BigEndianUnicode;
          BufStart := 2;
        end
        else if (Bytes[0] = 0) and (Bytes[1] = 0) and (Size >= 4) then
        begin
          if (Bytes[2] = $FE) and (Bytes[3] = $FF) then
          begin
            raise EDGJsonException.CreateRes(@RsUnsupportedFileEncoding);
            //Result := bomUtf32BE;
            //BufStart := 4;
          end;
        end;
      end;
    end;
    Inc(Bytes, BufStart);
    StreamInfo.Buffer := Bytes;
    StreamInfo.Size := Size - BufStart;
  except
    FreeMem(StreamInfo.AllocationBase);
    raise;
  end;
end;

procedure TDGJsonBaseObject.LoadFromStream(Stream: TStream; Encoding: TEncoding; Utf8WithoutBOM: Boolean{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
var
  StreamInfo: TStreamInfo;
  S: string;
  L: Integer;
begin
  GetStreamBytes(Stream, Encoding, Utf8WithoutBOM, StreamInfo);
  try
    if Encoding = TEncoding.UTF8 then
      FromUtf8JSON(StreamInfo.Buffer, StreamInfo.Size{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF})
    else if Encoding = TEncoding.Unicode then
      FromJSON(PWideChar(Pointer(StreamInfo.Buffer)), StreamInfo.Size div SizeOf(WideChar){$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF})
    else
    begin
      L := TEncodingStrictAccess(Encoding).GetCharCountEx(StreamInfo.Buffer, StreamInfo.Size);
      SetLength(S, L);
      if L > 0 then
        TEncodingStrictAccess(Encoding).GetCharsEx(StreamInfo.Buffer, StreamInfo.Size, PChar(Pointer(S)), L)
      else if StreamInfo.Size > 0 then
        ErrorNoMappingForUnicodeCharacter;
      // release memory
      FreeMem(StreamInfo.AllocationBase);
      StreamInfo.AllocationBase := nil;
      FromJSON(S{$IFDEF SUPPORT_PROGRESS}, AProgress{$ENDIF});
    end;
  finally
    FreeMem(StreamInfo.AllocationBase);
  end;
end;

procedure TDGJsonBaseObject.SaveToFile(const FileName: string; Compact: Boolean; Encoding: TEncoding; Utf8WithoutBOM: Boolean);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
  try
    SaveToStream(Stream, Compact, Encoding, Utf8WithoutBOM);
  finally
    Stream.Free;
  end;
end;

procedure TDGJsonBaseObject.SaveToStream(Stream: TStream; Compact: Boolean; Encoding: TEncoding; Utf8WithoutBOM: Boolean);
var
  Preamble: TBytes;
  Writer: TDGJsonOutputWriter;
begin
  if Utf8WithoutBOM and ((Encoding = TEncoding.UTF8) or (Encoding = nil)) then
    Encoding := TEncoding.UTF8
  else
  begin
    if Encoding = nil then
      Encoding := TEncoding.Default;
    Preamble := Encoding.GetPreamble;
    if Preamble <> nil then
      Stream.Write(Preamble[0], Length(Preamble));
  end;
  Writer.Init(Compact, Stream, Encoding, nil);
  try
    InternToJSON(Writer);
  finally
    Writer.StreamDone;
  end;
end;

procedure TDGJsonBaseObject.SaveToLines(Lines: TStrings);
var
  Writer: TDGJsonOutputWriter;
begin
  Writer.Init(False, nil, nil, Lines);
  try
    InternToJSON(Writer);
  finally
    Writer.LinesDone;
  end;
end;

function TDGJsonBaseObject.ToJSON(Compact: Boolean): string;
var
  Writer: TDGJsonOutputWriter;
begin
  Writer.Init(Compact, nil, nil, nil);
  try
    InternToJSON(Writer);
  finally
    Result := Writer.Done;
  end;
end;

{$IFDEF SUPPORTS_UTF8STRING}
function TDGJsonBaseObject.ToUtf8JSON(Compact: Boolean = True): UTF8String;
var
  Stream: TJsonUtf8StringStream;
  Size: NativeInt;
begin
  Stream := TJsonUtf8StringStream.Create;
  try
    SaveToStream(Stream, Compact, nil, True);
    Result := Stream.DataString;
    Size := Stream.Size;
  finally
    Stream.Free;
  end;
  if Length(Result) <> Size then
    SetLength(Result, Size);
end;

{$ENDIF SUPPORTS_UTF8STRING}
procedure TDGJsonBaseObject.ToUtf8JSON(var Bytes: TBytes; Compact: Boolean = True);
var
  Stream: TJsonBytesStream;
  Size: NativeInt;
begin
  Stream := TJsonBytesStream.Create;
  try
    SaveToStream(Stream, Compact, nil, True);
    Size := Stream.Size;
    Bytes := Stream.Bytes;
  finally
    Stream.Free;
  end;
  if Length(Bytes) <> Size then
    ByteArraySetLengthUninit(Bytes, Size);
end;

function TDGJsonBaseObject.ToString: string;
begin
  Result := ToJSON;
end;

class procedure TDGJsonBaseObject.InternInitAndAssignItem(Dest, Source: PDGJsonDataValue);
begin
  Dest.FTyp := Source.FTyp;
  case Source.Typ of
    jdtString:
      begin
        Dest.FValue.P := nil;
        string(Dest.FValue.S) := string(Source.FValue.S);
      end;
    jdtInt:
      Dest.FValue.I := Source.FValue.I;
    jdtLong:
      Dest.FValue.L := Source.FValue.L;
    jdtULong:
      Dest.FValue.U := Source.FValue.U;
    jdtFloat:
      Dest.FValue.F := Source.FValue.F;
    jdtDateTime, jdtUtcDateTime:
      Dest.FValue.D := Source.FValue.D;
    jdtBool:
      Dest.FValue.B := Source.FValue.B;
    jdtArray:
      begin
        {$IFDEF AUTOREFCOUNT}
        Dest.FValue.A := nil;
        {$ENDIF AUTOREFCOUNT}
        if Source.FValue.A <> nil then
        begin
          {$IFDEF USE_FAST_AUTOREFCOUNT}
          Dest.FValue.A := TJsonArray.Create;
          TJsonArray(Dest.FValue.A).ARCObjAddRef;
          {$ELSE}
          TDGJsonArray(Dest.FValue.A) := TDGJsonArray.Create;
          {$ENDIF USE_FAST_AUTOREFCOUNT}
          TDGJsonArray(Dest.FValue.A).Assign(TDGJsonArray(Source.FValue.A));
        end
        {$IFNDEF AUTOREFCOUNT}
        else
          Dest.FValue.A := nil;
        {$ENDIF ~AUTOREFCOUNT}
      end;
    jdtObject:
      begin
        {$IFDEF AUTOREFCOUNT}
        Dest.FValue.O := nil;
        {$ENDIF AUTOREFCOUNT}
        if Source.FValue.O <> nil then
        begin
          {$IFDEF USE_FAST_AUTOREFCOUNT}
          Dest.FValue.O := TJsonObject.Create;
          TJsonObject(Dest.FValue.O).ARCObjAddRef;
          {$ELSE}
          TDGJsonObject(Dest.FValue.O) := TDGJsonObject.Create;
          {$ENDIF USE_FAST_AUTOREFCOUNT}
          TDGJsonObject(Dest.FValue.O).Assign(TDGJsonObject(Source.FValue.O));
        end
        {$IFNDEF AUTOREFCOUNT}
        else
          Dest.FValue.O := nil;
        {$ENDIF ~AUTOREFCOUNT}
      end;
  end;
end;

procedure TDGJsonDataValue.TypeCastError(ExpectedType: TDGJsonDataType);
begin
  raise EDGJsonCastException.CreateResFmt(@RsTypeCastError,
    [TDGJsonBaseObject.DataTypeNames[FTyp], TDGJsonBaseObject.DataTypeNames[ExpectedType]])
    {$IFDEF HAS_RETURN_ADDRESS} at ReturnAddress{$ENDIF};
end;

{ TJsonArrayEnumerator }
constructor TDGJsonArrayEnumerator.Create(AArray: TDGJsonArray);
begin
  FIndex := -1;
  FArray := AArray;
end;

function TDGJsonArrayEnumerator.GetCurrent: TDGJsonDataValueHelper;
begin
  Result := FArray[FIndex];
end;

function TDGJsonArrayEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FArray.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TJsonArray }
destructor TDGJsonArray.Destroy;
begin
  Clear;
  FreeMem(FItems);
  FItems := nil;
  //inherited Destroy;
end;

procedure TDGJsonArray.Clear;
var
  I: Integer;
begin
  for I := 0 to FCount - 1 do
    FItems[I].Clear;
  FCount := 0;
end;

procedure TDGJsonArray.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then
    ListError(@SListIndexError, Index);
  FItems[Index].Clear;
  Dec(FCount);
  if Index < FCount then
    Move(FItems[Index + 1], FItems[Index], (FCount - Index) * SizeOf(TDGJsonDataValue));
end;

function TDGJsonArray.AddItem: PDGJsonDataValue;
begin
  if FCount = FCapacity then
    Grow;
  Result := @FItems[FCount];
  Result.FTyp := jdtNone;
  Result.FValue.P := nil;
  Inc(FCount);
end;

function TDGJsonArray.InsertItem(Index: Integer): PDGJsonDataValue;
begin
  if Cardinal(Index) > Cardinal(FCount) then
    RaiseListError(Index);
  if FCount = FCapacity then
    Grow;
  Result := @FItems[Index];
  if Index < FCount then
    Move(Result^, FItems[Index + 1], (FCount - Index) * SizeOf(TDGJsonDataValue));
  Result.FTyp := jdtNone;
  Result.FValue.P := nil;
  Inc(FCount);
end;

procedure TDGJsonArray.Grow;
var
  C, Delta: Integer;
begin
  C := FCapacity;
  if C > 64 then
    Delta := C div 4
  else if C > 8 then
    Delta := 16
  else
    Delta := 4;
  FCapacity := C + Delta;
  InternApplyCapacity;
end;

procedure TDGJsonArray.InternApplyCapacity;
begin
  ReallocMem(Pointer(FItems), FCapacity * SizeOf(TDGJsonDataValue));
end;

procedure TDGJsonArray.SetCapacity(const Value: Integer);
var
  I: Integer;
begin
  if Value <> FCapacity then
  begin
    if FCapacity < FCount then
    begin
      // delete all overlapping items
      for I := FCapacity to FCount - 1 do
        FItems[I].Clear;
      FCount := FCapacity;
    end;
    FCapacity := Value;
    InternApplyCapacity;
  end;
end;

function TDGJsonArray.Extract(Index: Integer): TDGJsonBaseObject;
begin
  if Items[Index].FTyp in [jdtNone, jdtArray, jdtObject] then
  begin
    Result := TDGJsonBaseObject(FItems[Index].FValue.O);
    TDGJsonBaseObject(FItems[Index].FValue.O) := nil;
  end
  else
    Result := nil;
  Delete(Index);
end;

function TDGJsonArray.ExtractArray(Index: Integer): TDGJsonArray;
begin
  Result := Extract(Index) as TDGJsonArray;
end;

function TDGJsonArray.ExtractObject(Index: Integer): TDGJsonObject;
begin
  Result := Extract(Index) as TDGJsonObject;
end;

function TDGJsonArray.GetArray(Index: Integer): TDGJsonArray;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].ArrayValue;
end;

function TDGJsonArray.GetBool(Index: Integer): Boolean;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].BoolValue;
end;

{$IFDEF BCB}
function TJsonArray.GetObj(Index: Integer): TJsonObject;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].ObjectValue;
end;
{$ELSE}
function TDGJsonArray.GetObject(Index: Integer): TDGJsonObject;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].ObjectValue;
end;
{$ENDIF BCB}

function TDGJsonArray.GetVariant(Index: Integer): Variant;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].VariantValue;
end;

function TDGJsonArray.GetInt(Index: Integer): Integer;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].IntValue;
end;

function TDGJsonArray.GetLong(Index: Integer): Int64;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].LongValue;
end;

function TDGJsonArray.GetULong(Index: Integer): UInt64;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].ULongValue;
end;

function TDGJsonArray.GetFloat(Index: Integer): Double;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].FloatValue;
end;

function TDGJsonArray.GetDateTime(Index: Integer): TDateTime;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].DateTimeValue;
end;

function TDGJsonArray.GetUtcDateTime(Index: Integer): TDateTime;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].UtcDateTimeValue;
end;

function TDGJsonArray.GetItem(Index: Integer): PDGJsonDataValue;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := @FItems[Index];
end;

function TDGJsonArray.GetString(Index: Integer): string;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].Value;
end;

procedure TDGJsonArray.Add(const AValue: TDGJsonObject);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.ObjectValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: TDGJsonArray);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.ArrayValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: Boolean);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.BoolValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: Integer);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.IntValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: Int64);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.LongValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: UInt64);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.ULongValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: Double);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.FloatValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: TDateTime);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.DateTimeValue := AValue;
end;

procedure TDGJsonArray.AddUtcDateTime(const AValue: TDateTime);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.UtcDateTimeValue := AValue;
end;

procedure TDGJsonArray.Add(const AValue: string);
var
  Data: PDGJsonDataValue;
begin
  Data := AddItem;
  Data.Value := AValue;
end;

procedure TDGJsonArray.Add(const AValue: Variant);
var
  Data: PDGJsonDataValue;
begin
  VarTypeToJsonDataType(VarType(AValue)); // Handle type-check exception before adding the item
  Data := AddItem;
  Data.VariantValue := AValue;
end;

function TDGJsonArray.AddArray: TDGJsonArray;
begin
  {$IFDEF USE_FAST_AUTOREFCOUNT}
  if Result <> nil then
    Result.ARCObjRelease;
  Pointer(Result) := TJsonArray.Create;
  Result.ARCObjAddRef;
  {$ELSE}
  Result := TDGJsonArray.Create;
  {$ENDIF USE_FAST_AUTOREFCOUNT}
  Add(Result);
end;

function TDGJsonArray.AddObject: TDGJsonObject;
begin
  {$IFDEF USE_FAST_AUTOREFCOUNT}
  if Result <> nil then
    Result.ARCObjRelease;
  Pointer(Result) := TJsonObject.Create;
  Result.ARCObjAddRef;
  {$ELSE}
  Result := TDGJsonObject.Create;
  {$ENDIF USE_FAST_AUTOREFCOUNT}
  Add(Result);
end;

procedure TDGJsonArray.AddObject(const Value: TDGJsonObject);
begin
  Add(Value);
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: TDGJsonObject);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.ObjectValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: TDGJsonArray);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.ArrayValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: Boolean);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.BoolValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: Integer);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.IntValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: Int64);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.LongValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: UInt64);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.ULongValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: Double);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.FloatValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: TDateTime);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.DateTimeValue := AValue;
end;

procedure TDGJsonArray.InsertUtcDateTime(Index: Integer; const AValue: TDateTime);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.UtcDateTimeValue := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: string);
var
  Data: PDGJsonDataValue;
begin
  Data := InsertItem(Index);
  Data.Value := AValue;
end;

procedure TDGJsonArray.Insert(Index: Integer; const AValue: Variant);
var
  Data: PDGJsonDataValue;
begin
  VarTypeToJsonDataType(VarType(AValue)); // Handle type-check exception before inserting the item
  Data := InsertItem(Index);
  Data.VariantValue := AValue;
end;

function TDGJsonArray.InsertArray(Index: Integer): TDGJsonArray;
begin
  Result := TDGJsonArray.Create;
  {$IFDEF AUTOREFCOUNT}
  Insert(Index, Result);
  {$ELSE}
  try
    Insert(Index, Result);
  except
    Result.Free;
    raise;
  end;
  {$ENDIF AUTOREFCOUNT}
end;

function TDGJsonArray.InsertObject(Index: Integer): TDGJsonObject;
begin
  Result := TDGJsonObject.Create;
  {$IFDEF AUTOREFCOUNT}
  Insert(Index, Result);
  {$ELSE}
  try
    Insert(Index, Result);
  except
    Result.Free;
    raise;
  end;
  {$ENDIF AUTOREFCOUNT}
end;

procedure TDGJsonArray.InsertObject(Index: Integer; const Value: TDGJsonObject);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Insert(Index, Value);
end;

function TDGJsonArray.GetEnumerator: TDGJsonArrayEnumerator;
begin
  Result := TDGJsonArrayEnumerator.Create(Self);
end;

function TDGJsonArray.IsNull(Index: Integer): Boolean;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].IsNull
end;

procedure TDGJsonArray.SetString(Index: Integer; const Value: string);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].Value := Value;
end;

procedure TDGJsonArray.SetInt(Index: Integer; const Value: Integer);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].IntValue := Value;
end;

procedure TDGJsonArray.SetLong(Index: Integer; const Value: Int64);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].LongValue := Value;
end;

procedure TDGJsonArray.SetULong(Index: Integer; const Value: UInt64);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].ULongValue := Value;
end;

procedure TDGJsonArray.SetFloat(Index: Integer; const Value: Double);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].FloatValue := Value;
end;

procedure TDGJsonArray.SetDateTime(Index: Integer; const Value: TDateTime);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].DateTimeValue := Value;
end;

procedure TDGJsonArray.SetUtcDateTime(Index: Integer; const Value: TDateTime);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].UtcDateTimeValue := Value;
end;

procedure TDGJsonArray.SetBool(Index: Integer; const Value: Boolean);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].BoolValue := Value;
end;

procedure TDGJsonArray.SetArray(Index: Integer; const Value: TDGJsonArray);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].ArrayValue := Value;
end;

procedure TDGJsonArray.SetObject(Index: Integer; const Value: TDGJsonObject);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].ObjectValue := Value;
end;

procedure TDGJsonArray.SetVariant(Index: Integer; const Value: Variant);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  FItems[Index].VariantValue := Value;
end;

function TDGJsonArray.GetType(Index: Integer): TDGJsonDataType;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result := FItems[Index].Typ;
end;

function TDGJsonArray.GetValue(Index: Integer): TDGJsonDataValueHelper;
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  Result.FData.FIntern := @FItems[Index];
  Result.FData.FTyp := jdtNone;
end;

procedure TDGJsonArray.SetValue(Index: Integer; const Value: TDGJsonDataValueHelper);
begin
  {$IFDEF CHECK_ARRAY_INDEX}
  if Cardinal(Index) >= Cardinal(FCount) then
    RaiseListError(Index);
  {$ENDIF CHECK_ARRAY_INDEX}
  TDGJsonDataValueHelper.SetInternValue(@FItems[Index], Value);
end;

procedure TDGJsonArray.InternToJSON(var Writer: TDGJsonOutputWriter);
var
  I: Integer;
begin
  if FCount = 0 then
    Writer.AppendValue('[]')
  else
  begin
    Writer.Indent('[');
    FItems[0].InternToJSON(Writer);
    for I := 1 to FCount - 1 do
    begin
      Writer.AppendSeparator(',');
      FItems[I].InternToJSON(Writer);
    end;
    Writer.Unindent(']');
  end;
end;

procedure TDGJsonArray.Assign(ASource: TDGJsonArray);
var
  I: Integer;
begin
  Clear;
  if ASource <> nil then
  begin
    if FCapacity < ASource.Count then
    begin
      FCapacity := ASource.Count;
      ReallocMem(FItems, ASource.Count * SizeOf(TDGJsonDataValue));
    end;
    FCount := ASource.Count;
    for I := 0 to ASource.Count - 1 do
      InternInitAndAssignItem(@FItems[I], @ASource.FItems[I]);
  end
  else
  begin
    FreeMem(FItems);
    FCapacity := 0;
  end;
end;

function TDGJsonArray.Clone: TDGJsonArray;
begin
  Result := TDGJsonArray.Create;
  try
    TDGJsonArray(Result).Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;

class procedure TDGJsonArray.RaiseListError(Index: Integer);
begin
  ListError(@SListIndexError, Index);
end;

procedure TDGJsonArray.SetCount(const Value: Integer);
var
  I: Integer;
begin
  if Value <> FCount then
  begin
    SetCapacity(Value);
    // Initialize new Items to "null"
    for I := FCount to Value - 1 do
    begin
      FItems[I].FTyp := jdtObject;
      FItems[I].FValue.P := nil;
    end;
    FCount := Value;
  end;
end;

{ TJsonObjectEnumerator }
constructor TDGJsonObjectEnumerator.Create(AObject: TDGJsonObject);
begin
  FIndex := -1;
  FObject := AObject;
end;

function TDGJsonObjectEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FObject.Count - 1;
  if Result then
    Inc(FIndex);
end;

function TDGJsonObjectEnumerator.GetCurrent: TDGJsonNameValuePair;
begin
  Result.Name := FObject.Names[FIndex];
  Result.Value.FData.FIntern := FObject.Items[FIndex];
  Result.Value.FData.FTyp := jdtNone;
end;

{ TJsonObject }
destructor TDGJsonObject.Destroy;
begin
  Clear;
  FreeMem(FItems);
  FreeMem(FNames);
  //inherited Destroy;
end;

{$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
procedure TDGJsonObject.UpdateLastValueItem(const Name: string; Item: PDGJsonDataValue);
begin
  if (Pointer(Name) <> nil) and (PInteger(@PByte(Name)[-8])^ = -1) then // string literal
  begin
    FLastValueItem := Item;
    FLastValueItemNamePtr := Pointer(Name);
  end
  else
    FLastValueItem := nil;
end;

{$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
procedure TDGJsonObject.Grow;
var
  C, Delta: Integer;
begin
  C := FCapacity;
  if C > 64 then
    Delta := C div 4
  else if C > 8 then
    Delta := 16
  else
    Delta := 4;
  FCapacity := C + Delta;
  InternApplyCapacity;
end;

procedure TDGJsonObject.InternApplyCapacity;
begin
  {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
  FLastValueItem := nil;
  {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  ReallocMem(Pointer(FItems), FCapacity * SizeOf(FItems[0]));
  ReallocMem(Pointer(FNames), FCapacity * SizeOf(FNames[0]));
end;

procedure TDGJsonObject.SetCapacity(const Value: Integer);
var
  I: Integer;
begin
  if Value <> FCapacity then
  begin
    if FCapacity < FCount then
    begin
      // delete all overlapping items
      for I := FCapacity to FCount - 1 do
      begin
        FNames[I] := '';
        FItems[I].Clear;
      end;
      FCount := FCapacity;
    end;
    FCapacity := Value;
    InternApplyCapacity;
  end;
end;

procedure TDGJsonObject.Clear;
var
  I: Integer;
begin
  {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
  FLastValueItem := nil;
  {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  for I := 0 to FCount - 1 do
  begin
    FNames[I] := '';
    FItems[I].Clear;
  end;
  FCount := 0;
end;

procedure TDGJsonObject.Remove(const Name: string);
var
  Idx: Integer;
begin
  Idx := IndexOf(Name);
  if Idx <> -1 then
    Delete(Idx);
end;

function TDGJsonObject.Extract(const Name: string): TDGJsonBaseObject;
var
  Index: Integer;
begin
  Index := IndexOf(Name);
  if Index <> -1 then
  begin
    if FItems[Index].FTyp in [jdtNone, jdtArray, jdtObject] then
    begin
      Result := TDGJsonBaseObject(FItems[Index].FValue.O);
      TDGJsonBaseObject(FItems[Index].FValue.O) := nil;
    end
    else
      Result := nil;
    Delete(Index);
  end
  else
    Result := nil;
end;

function TDGJsonObject.ExtractArray(const Name: string): TDGJsonArray;
begin
  Result := Extract(Name) as TDGJsonArray;
end;

function TDGJsonObject.ExtractObject(const Name: string): TDGJsonObject;
begin
  Result := Extract(Name) as TDGJsonObject;
end;

function TDGJsonObject.GetEnumerator: TDGJsonObjectEnumerator;
begin
  Result := TDGJsonObjectEnumerator.Create(Self);
end;

function TDGJsonObject.IsNull(const Name: string): Boolean;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.IsNull
  else
    Result := True;
end;

function TDGJsonObject.AddItem(const Name: string): PDGJsonDataValue;
var
  P: PString;
begin
  if FCount = FCapacity then
    Grow;
  Result := @FItems[FCount];
  P := @FNames[FCount];
  Inc(FCount);
  Pointer(P^) := nil; // initialize the string
  {$IFDEF USE_NAME_STRING_LITERAL}
  AsgString(P^, Name);
  {$ELSE}
  P^ := Name;
  {$ENDIF USE_NAME_STRING_LITERAL}
  Result.FValue.P := nil;
  Result.FTyp := jdtNone;
end;

function TDGJsonObject.InternAddItem(var Name: string): PDGJsonDataValue;
var
  P: PString;
begin
  if FCount = FCapacity then
    Grow;
  Result := @FItems[FCount];
  P := @FNames[FCount];
  Inc(FCount);
  // Transfer the string without going through UStrAsg and UStrClr
  Pointer(P^) := Pointer(Name);
  Pointer(Name) := nil;
  Result.FValue.P := nil;
  Result.FTyp := jdtNone;
end;

function TDGJsonObject.GetArray(const Name: string): TDGJsonArray;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.ArrayValue
  else
  begin
    Result := TDGJsonArray.Create;
    AddItem(Name).ArrayValue := Result;
    {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
    UpdateLastValueItem(Name, Item);
    {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  end;
end;

function TDGJsonObject.GetBool(const Name: string): Boolean;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.BoolValue
  else
    Result := False;
end;

function TDGJsonObject.GetInt(const Name: string): Integer;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.IntValue
  else
    Result := 0;
end;

function TDGJsonObject.GetLong(const Name: string): Int64;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.LongValue
  else
    Result := 0;
end;

function TDGJsonObject.GetULong(const Name: string): UInt64;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.ULongValue
  else
    Result := 0;
end;

function TDGJsonObject.GetFloat(const Name: string): Double;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.FloatValue
  else
    Result := 0;
end;

function TDGJsonObject.GetDateTime(const Name: string): TDateTime;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.DateTimeValue
  else
    Result := 0;
end;

function TDGJsonObject.GetUtcDateTime(const Name: string): TDateTime;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.UtcDateTimeValue
  else
    Result := 0;
end;

{$IFDEF BCB}
function TJsonObject.GetObj(const Name: string): TJsonObject;
var
  Item: PJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.ObjectValue
  else
  begin
    Result := TJsonObject.Create;
    AddItem(Name).ObjectValue := Result;
    {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
    UpdateLastValueItem(Name, Item);
    {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  end;
end;
{$ELSE}
function TDGJsonObject.GetObject(const Name: string): TDGJsonObject;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.ObjectValue
  else
  begin
    Result := TDGJsonObject.Create;
    AddItem(Name).ObjectValue := Result;
    {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
    UpdateLastValueItem(Name, Item);
    {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  end;
end;
{$ENDIF BCB}

function TDGJsonObject.GetString(const Name: string): string;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.Value
  else
    Result := '';
end;

procedure TDGJsonObject.SetArray(const Name: string; const Value: TDGJsonArray);
begin
  RequireItem(Name).ArrayValue := Value;
end;

procedure TDGJsonObject.SetBool(const Name: string; const Value: Boolean);
begin
  RequireItem(Name).BoolValue := Value;
end;

procedure TDGJsonObject.SetInt(const Name: string; const Value: Integer);
begin
  RequireItem(Name).IntValue := Value;
end;

procedure TDGJsonObject.SetLong(const Name: string; const Value: Int64);
begin
  RequireItem(Name).LongValue := Value;
end;

procedure TDGJsonObject.SetULong(const Name: string; const Value: UInt64);
begin
  RequireItem(Name).ULongValue := Value;
end;

procedure TDGJsonObject.SetFloat(const Name: string; const Value: Double);
begin
  RequireItem(Name).FloatValue := Value;
end;

procedure TDGJsonObject.SetDateTime(const Name: string; const Value: TDateTime);
begin
  RequireItem(Name).DateTimeValue := Value;
end;

procedure TDGJsonObject.SetUtcDateTime(const Name: string; const Value: TDateTime);
begin
  RequireItem(Name).UtcDateTimeValue := Value;
end;

procedure TDGJsonObject.SetObject(const Name: string; const Value: TDGJsonObject);
begin
  RequireItem(Name).ObjectValue := Value;
end;

procedure TDGJsonObject.SetString(const Name, Value: string);
begin
  RequireItem(Name).Value := Value;
end;

function TDGJsonObject.GetType(const Name: string): TDGJsonDataType;
var
  Item: PDGJsonDataValue;
begin
  if FindItem(Name, Item) then
    Result := Item.Typ
  else
    Result := jdtNone;
end;

function TDGJsonObject.Contains(const Name: string): Boolean;
{$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
var
  Item: PDGJsonDataValue;
{$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
begin
  {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
  Result := FindItem(Name, Item);
  {$ELSE}
  Result := IndexOf(Name) <> -1;
  {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
end;

function TDGJsonObject.IndexOfPChar(S: PChar; Len: Integer): Integer;
var
  P: PJsonStringArray;
begin
  P := FNames;
  if Len = 0 then
  begin
    for Result := 0 to FCount - 1 do
      if P[Result] = '' then
        Exit;
  end
  else
  begin
    for Result := 0 to FCount - 1 do
      if (Length(P[Result]) = Len) and CompareMem(S, Pointer(P[Result]), Len * SizeOf(Char)) then
        Exit;
  end;
  Result := -1;
end;

function TDGJsonObject.IndexOf(const Name: string): Integer;
var
  P: PJsonStringArray;
begin
  P := FNames;
  for Result := 0 to FCount - 1 do
    if {(Pointer(Name) = Pointer(P[Result])) or} (Name = P[Result]) then
      Exit;
  Result := -1;
end;

function TDGJsonObject.FindItem(const Name: string; var Item: PDGJsonDataValue): Boolean;
var
  Idx: Integer;
begin
  {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
  { If "Name" is a string literal we can compare the pointer of the last stored value instead of
    searching the list. }
  if (FLastValueItem <> nil) and (Pointer(Name) = FLastValueItemNamePtr) then
  begin
    Item := FLastValueItem;
    Result := True;
  end
  else
  {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  begin
    Idx := IndexOf(Name);
    Result := Idx <> -1;
    if Result then
    begin
      Item := @FItems[Idx];
      {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
      UpdateLastValueItem(Name, Item);
      {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
    end
    else
      Item := nil;
  end;
end;

function TDGJsonObject.RequireItem(const Name: string): PDGJsonDataValue;
begin
  if not FindItem(Name, Result) then
  begin
    Result := AddItem(Name);
    {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
    UpdateLastValueItem(Name, Result);
    {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  end;
end;

procedure TDGJsonObject.InternToJSON(var Writer: TDGJsonOutputWriter);
var
  I: Integer;
begin
  if Count = 0 then
    Writer.AppendValue('{}')
  else
  begin
    Writer.Indent('{');
    TDGJsonBaseObject.StrToJSONStr(Writer.AppendIntro, FNames[0]);
    FItems[0].InternToJSON(Writer);
    for I := 1 to FCount - 1 do
    begin
      Writer.AppendSeparator(',');
      TDGJsonBaseObject.StrToJSONStr(Writer.AppendIntro, FNames[I]);
      FItems[I].InternToJSON(Writer);
    end;
    Writer.Unindent('}');
  end;
end;

function TDGJsonObject.GetName(Index: Integer): string;
begin
  Result := FNames[Index];
end;

function TDGJsonObject.GetItem(Index: Integer): PDGJsonDataValue;
begin
  Result := @FItems[Index];
end;

procedure TDGJsonObject.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then
    ListError(@SListIndexError, Index);
  {$IFDEF USE_LAST_NAME_STRING_LITERAL_CACHE}
  if @FItems[Index] = FLastValueItem then
  begin
    FLastValueItem := nil;
    //FLastValueItemNamePtr := nil;
  end;
  {$ENDIF USE_LAST_NAME_STRING_LITERAL_CACHE}
  FNames[Index] := '';
  FItems[Index].Clear;
  Dec(FCount);
  if Index < FCount then
  begin
    Move(FItems[Index + 1], FItems[Index], (FCount - Index) * SizeOf(FItems[0]));
    Move(FNames[Index + 1], FNames[Index], (FCount - Index) * SizeOf(FNames[0]));
  end;
end;

function TDGJsonObject.GetValue(const Name: string): TDGJsonDataValueHelper;
begin
  if not FindItem(Name, Result.FData.FIntern) then
  begin
    Result.FData.FIntern := nil;
    Result.FData.FNameResolver := Self;
    Result.FData.FName := Name;
  end;
  Result.FData.FTyp := jdtNone;
end;

procedure TDGJsonObject.SetValue(const Name: string; const Value: TDGJsonDataValueHelper);
var
  Item: PDGJsonDataValue;
begin
  Item := RequireItem(Name);
  TDGJsonDataValueHelper.SetInternValue(Item, Value);
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: TDGJsonArray);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.InternSetArrayValue(AValue);
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: TDGJsonObject);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.InternSetObjectValue(AValue);
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: Boolean);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.BoolValue := AValue;
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: Integer);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.IntValue := AValue;
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: Int64);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.LongValue := AValue;
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: UInt64);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.ULongValue := AValue;
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: Double);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.FloatValue := AValue;
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: TDateTime);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.DateTimeValue := AValue;
end;

procedure TDGJsonObject.InternAdd(var AName: string; const AValue: string);
var
  Data: PDGJsonDataValue;
begin
  Data := InternAddItem(AName);
  Data.InternSetValue(AValue);
end;

function TDGJsonObject.InternAddArray(var AName: string): TDGJsonArray;
begin
  {$IFDEF USE_FAST_AUTOREFCOUNT}
  if Result <> nil then
    Result.ARCObjRelease;
  Pointer(Result) := TJsonArray.Create;
  Inc(Result.FRefCount); //Result.ARCObjAddRef;
  {$ELSE}
  Result := TDGJsonArray.Create;
  {$ENDIF USE_FAST_AUTOREFCOUNT}
  InternAdd(AName, Result);
end;

function TDGJsonObject.InternAddObject(var AName: string): TDGJsonObject;
begin
  {$IFDEF USE_FAST_AUTOREFCOUNT}
  if Result <> nil then
    Result.ARCObjRelease;
  Pointer(Result) := TJsonObject.Create;
  Inc(Result.FRefCount); //Result.ARCObjAddRef;
  {$ELSE}
  Result := TDGJsonObject.Create;
  {$ENDIF USE_FAST_AUTOREFCOUNT}
  InternAdd(AName, Result);
end;

procedure TDGJsonObject.ToSimpleObject(AObject: TObject; ACaseSensitive: Boolean);
var
  Index, Count: Integer;
  PropList: PPropList;
  PropType: PTypeInfo;
  PropName: string;
  Item: PDGJsonDataValue;
  V: Variant;
begin
  if AObject = nil then
    Exit;
  if AObject.ClassInfo = nil then
    raise EDGJsonException.CreateResFmt(@RsMissingClassInfo, [AObject.ClassName]);
  Count := GetPropList(AObject, PropList);
  if Count > 0 then
  begin
    try
      for Index := 0 to Count - 1 do
      begin
        if (PropList[Index].StoredProc = Pointer($1)) or IsStoredProp(AObject, PropList[Index]) then
        begin
          PropName := UTF8ToString(PropList[Index].Name);
          if not ACaseSensitive then
            Item := FindCaseInsensitiveItem(PropName)
          else if not FindItem(PropName, Item) then
            Item := nil;
          if Item <> nil then
          begin
            case PropList[Index].PropType^.Kind of
              tkInteger, tkChar, tkWChar:
                SetOrdProp(AObject, PropList[Index], Item.IntValue);
              tkEnumeration:
                SetOrdProp(AObject, PropList[Index], Item.IntValue);
              tkFloat:
                begin
                  PropType := PropList[Index].PropType^;
                  if (PropType = TypeInfo(TDateTime)) or (PropType = TypeInfo(TDate)) or (PropType = TypeInfo(TTime)) then
                    SetFloatProp(AObject, PropList[Index], Item.DateTimeValue)
                  else
                    SetFloatProp(AObject, PropList[Index], Item.FloatValue);
                end;
              tkInt64:
                SetInt64Prop(AObject, PropList[Index], Item.LongValue);
              tkString, tkLString, tkWString, tkUString:
                SetStrProp(AObject, PropList[Index], Item.Value);
              tkSet:
                SetSetProp(AObject, PropList[Index], Item.Value);
              tkVariant:
                begin
                  case Types[PropName] of
                    jdtObject, jdtArray:
                      V := Null;
                    jdtInt:
                      V := Item.IntValue;
                    jdtLong:
                      V := Item.LongValue;
                    jdtULong:
                      V := Item.ULongValue;
                    jdtFloat:
                      V := Item.FloatValue;
                    jdtDateTime:
                      V := Item.DateTimeValue;
                    jdtUtcDateTime:
                      V := Item.UtcDateTimeValue;
                    jdtBool:
                      V := Item.BoolValue;
                  else
                    V := Item.Value;
                  end;
                  SetVariantProp(AObject, PropList[Index], V);
                end;
            end;
          end;
        end;
      end;
    finally
      FreeMem(PropList);
    end;
  end;
end;

procedure TDGJsonObject.FromSimpleObject(AObject: TObject; ALowerCamelCase: Boolean);
var
  Index, Count: Integer;
  PropList: PPropList;
  PropType: PTypeInfo;
  PropName: string;
  V: Variant;
  D: Double;
  Ch: Char;
begin
  Clear;
  if AObject = nil then
    Exit;
  if AObject.ClassInfo = nil then
    raise EDGJsonException.CreateResFmt(@RsMissingClassInfo, [AObject.ClassName]);
  Count := GetPropList(AObject, PropList);
  if Count > 0 then
  begin
    try
      for Index := 0 to Count - 1 do
      begin
        if (PropList[Index].StoredProc = Pointer($1)) or IsStoredProp(AObject, PropList[Index]) then
        begin
          PropName := UTF8ToString(PropList[Index].Name);
          if ALowerCamelCase and (PropName <> '') then
          begin
            Ch := PChar(Pointer(PropName))^;
            if Ord(Ch) < 128 then
            begin
              case Ch of
                'A'..'Z':
                  PChar(Pointer(PropName))^ := Char(Ord(Ch) xor $20);
              end;
            end
            else // Delphi 2005+ compilers allow unicode identifiers, even if that is a very bad idea
              AnsiLowerCamelCaseString(PropName);
          end;
          case PropList[Index].PropType^.Kind of
            tkInteger, tkChar, tkWChar:
              InternAdd(PropName, GetOrdProp(AObject, PropList[Index]));
            tkEnumeration:
              begin
                PropType := PropList[Index].PropType^;
                if (PropType = TypeInfo(Boolean)) or (PropType = TypeInfo(ByteBool)) or
                   (PropType = TypeInfo(WordBool)) or (PropType = TypeInfo(LongBool)) then
                  InternAdd(PropName, GetOrdProp(AObject, PropList[Index]) <> 0)
                else
                  InternAdd(PropName, GetOrdProp(AObject, PropList[Index]));
              end;
            tkFloat:
              begin
                PropType := PropList[Index].PropType^;
                D := GetFloatProp(AObject, PropList[Index]);
                if (PropType = TypeInfo(TDateTime)) or (PropType = TypeInfo(TDate)) or (PropType = TypeInfo(TTime)) then
                  InternAdd(PropName, TDateTime(D))
                else
                  InternAdd(PropName, D);
              end;
            tkInt64:
              InternAdd(PropName, GetInt64Prop(AObject, PropList[Index]));
            tkString, tkLString, tkWString, tkUString:
              InternAdd(PropName, GetStrProp(AObject, PropList[Index]));
            tkSet:
              InternAdd(PropName, GetSetProp(AObject, PropList[Index]));
            tkVariant:
              begin
                V := GetVariantProp(AObject, PropList[Index]);
                if VarIsNull(V) or VarIsEmpty(V) then
                  InternAdd(PropName, TDGJsonObject(nil))
                else
                begin
                  case VarType(V) and varTypeMask of
                    varSingle, varDouble, varCurrency:
                      InternAdd(PropName, Double(V));
                    varShortInt, varSmallint, varInteger, varByte, varWord:
                      InternAdd(PropName, Integer(V));
                    varLongWord:
                      InternAdd(PropName, Int64(LongWord(V)));
                    {$IF CompilerVersion >= 23.0} // XE2+
                    varInt64:
                      InternAdd(PropName, Int64(V));
                    {$IFEND}
                    varBoolean:
                      InternAdd(PropName, Boolean(V));
                  else
                    InternAdd(PropName, VarToStr(V));
                  end;
                end;
              end;
          end;
        end;
      end;
    finally
      FreeMem(PropList);
    end;
  end;
end;

function TDGJsonObject.FindCaseInsensitiveItem(const ACaseInsensitiveName: string): PDGJsonDataValue;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    if AnsiSameText(FNames[I], ACaseInsensitiveName) then
    begin
      Result := @FItems[I];
      Exit;
    end;
  end;
  Result := nil;
end;

procedure TDGJsonObject.Assign(ASource: TDGJsonObject);
var
  I: Integer;
begin
  Clear;
  if ASource <> nil then
  begin
    FCapacity := ASource.Count;
    InternApplyCapacity;
    FCount := ASource.Count;
    for I := 0 to ASource.Count - 1 do
    begin
      Pointer(FNames[I]) := nil;
      {$IFDEF USE_NAME_STRING_LITERAL}
      AsgString(FNames[I], ASource.FNames[I]);
      {$ELSE}
      FNames[I] := ASource.FNames[I];
      {$ENDIF USE_NAME_STRING_LITERAL}
      InternInitAndAssignItem(@FItems[I], @ASource.FItems[I]);
    end;
  end
  else
  begin
    FreeMem(FItems);
    FreeMem(FNames);
    FCapacity := 0;
  end;
end;

function TDGJsonObject.Clone: TDGJsonObject;
begin
  Result := TDGJsonObject.Create;
  try
    TDGJsonObject(Result).Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;

procedure TDGJsonObject.PathError(P, EndP: PChar);
var
  S: string;
begin
  System.SetString(S, P, EndP - P);
  raise EDGJsonPathException.CreateResFmt(@RsInvalidJsonPath, [S]);
end;

procedure TDGJsonObject.PathNullError(P, EndP: PChar);
var
  S: string;
begin
  System.SetString(S, P, EndP - P);
  raise EDGJsonPathException.CreateResFmt(@RsJsonPathContainsNullValue, [S]);
end;

procedure TDGJsonObject.PathIndexError(P, EndP: PChar; Count: Integer);
var
  S: string;
begin
  System.SetString(S, P, EndP - P);
  raise EDGJsonPathException.CreateResFmt(@RsJsonPathIndexError, [Count, S]);
end;

function TDGJsonObject.GetPath(const NamePath: string): TDGJsonDataValueHelper;
var
  F, P, EndF, LastEndF: PChar;
  Ch: Char;
  Idx: Integer;
  Obj: TDGJsonObject;
  Arr: TDGJsonArray;
  Item: PDGJsonDataValue;
  S: string;
begin
  P := PChar(NamePath);
  // empty string => Self
  if P^ = #0 then
  begin
    Result := Self;
    Exit;
  end;
  Result.FData.FIntern := nil;
  Result.FData.FTyp := jdtNone;
  Obj := Self;
  Item := nil;
  LastEndF := nil;
  while True do
  begin
    F := P;
    // fast forward
    Ch := P^;
//    DCC64 generates "bt mem,reg" code
//    while not (Ch in [#0, '[', '.']) do
//    begin
//      Inc(P);
//      Ch := P^;
//    end;
    while True do
      case Ch of
        #0, '[', '.': Break;
      else
        Inc(P);
        Ch := P^;
      end;
    EndF := P;
    if F = EndF then
      PathError(PChar(Pointer(NamePath)), P + 1);
    Inc(P);
    case Ch of
      #0:
        begin
          if Obj <> nil then
          begin
            Idx := Obj.IndexOfPChar(F, EndF - F);
            if Idx <> -1 then
              Result.FData.FIntern := @Obj.FItems[Idx]
            else
            begin
              Result.FData.FNameResolver := Obj;
              System.SetString(Result.FData.FName, F, EndF - F);
            end;
          end
          else
            Result.FData.FIntern := Item;
          Break;
        end;
      '.': // object access
        begin
          if Obj = nil then
            PathNullError(PChar(Pointer(NamePath)), LastEndF);
          Idx := Obj.IndexOfPChar(F, EndF - F);
          if Idx <> -1 then
            Obj := Obj.FItems[Idx].ObjectValue
          else
          begin
            // auto create object
            System.SetString(S, F, EndF - F);
            Obj := Obj.InternAddObject(S);
          end;
        end;
      '[': // array access
        begin
          if Obj = nil then
            PathNullError(PChar(Pointer(NamePath)), LastEndF);
          Idx := Obj.IndexOfPChar(F, EndF - F);
          if Idx <> -1 then
          begin
            Arr := Obj.FItems[Idx].ArrayValue;
            if Arr = nil then
            begin
              // Shouldn't happen => auto create array
              Arr := TDGJsonArray.Create;
              Obj.FItems[Idx].ArrayValue := Arr;
            end;
          end
          else
          begin
            // auto create array
            System.SetString(S, F, EndF - F);
            Arr := Obj.InternAddArray(S);
          end;
          Ch := P^;
          // parse array index
          Idx := 0;
          while Ch in ['0'..'9'] do
          begin
            Idx := Idx * 10 + (Word(Ch) - Ord('0'));
            Inc(P);
            Ch := P^;
          end;
          if P^ <> ']' then
            PathError(PChar(Pointer(NamePath)), P + 1);
          Inc(P);
          if Idx >= Arr.Count then
            PathIndexError(PChar(Pointer(NamePath)), P, Arr.Count); // P is already incremented
          Item := @Arr.FItems[Idx];
          if P^ = '.' then
          begin
            Inc(P);
            Obj := Item.ObjectValue;
            Item := nil;
          end
          else if P^ = #0 then
          begin
            // return array element
            Result.FData.FIntern := Item;
            Break;
          end;
        end;
    end;
    LastEndF := EndF;
  end;
end;

procedure TDGJsonObject.SetPath(const NamePath: string; const Value: TDGJsonDataValueHelper);
var
  PathValue: TDGJsonDataValueHelper;
begin
  PathValue := Path[NamePath];
  PathValue.ResolveName;
  TDGJsonDataValueHelper.SetInternValue(PathValue.FData.FIntern, Value);
end;

{ TStringIntern }
{$IFDEF USE_STRINGINTERN_FOR_NAMES}
procedure TStringIntern.Init;
begin
  FCount := 0;
  FCapacity := 17;
  GetMem(FStrings, FCapacity * SizeOf(FStrings[0]));
  GetMem(FBuckets, FCapacity * SizeOf(FBuckets[0]));
  FillChar(FBuckets[0], FCapacity * SizeOf(FBuckets[0]), $FF);
end;

procedure TStringIntern.Done;
var
  I: Integer;
begin
  for I := 0 to FCount - 1 do
    FStrings[I].Name := '';
  FreeMem(FStrings);
  FreeMem(FBuckets);
end;

procedure TStringIntern.Intern(var S: string; var PropName: string);
var
  Index: Integer;
  Hash: Integer;
  {$IFDEF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
  Source: Pointer;
  {$ENDIF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
begin
  if PropName <> '' then
    PropName := ''; // guarantee that Pointer(FPropName) = nil because InternTransfer steals FLook.S and overwrites FPropName
  if S <> '' then
  begin
    Hash := GetHash(S);
    Index := Find(Hash, S);
    if Index <> -1 then
    begin
      {$IFDEF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
      Source := Pointer(FStrings[Index].Name);
      if Source <> nil then
      begin
        {$IFDEF DEBUG}
        //if PInteger(@PByte(Source)[-8])^ = -1 then
        //  InternAsgStringUsageError;
        {$ENDIF DEBUG}
        Pointer(PropName) := Source;
        // We are parsing JSON, no other thread knowns about the string => skip the CPU lock
        Inc(PInteger(@PByte(Source)[-8])^);
      end;
      {$ELSE}
      PropName := FStrings[Index].Name;
      {$ENDIF USE_FAST_STRASG_FOR_INTERNAL_STRINGS}
      S := '';
    end
    else
    begin
      // Transfer the string without going through UStrAsg and UStrClr
      Pointer(PropName) := Pointer(S);
      Pointer(S) := nil;
      InternAdd(Hash, PropName);
    end;
  end;
end;

class function TStringIntern.GetHash(const Name: string): Integer;
var
  P: PChar;
  Ch: Word;
begin
  // Only used to reduce memory when parsing large JSON strings
  Result := 0;
  P := PChar(Pointer(Name));
  if P <> nil then
  begin
    Result := PInteger(@PByte(Name)[-4])^;
    while True do
    begin
      Ch := Word(P[0]);
      if Ch = 0 then
        Break;
      Result := Result + Ch;
      Ch := Word(P[1]);
      if Ch = 0 then
        Break;
      Result := Result + Ch;
      Ch := Word(P[2]);
      if Ch = 0 then
        Break;
      Result := Result + Ch;
      Ch := Word(P[3]);
      if Ch = 0 then
        Break;
      Result := Result + Ch;
      Result := (Result shl 6) or ((Result shr 26) and $3F);
      Inc(P, 4);
    end;
  end;
end;

procedure TStringIntern.InternAdd(AHash: Integer; const S: string);
var
  Index: Integer;
  Bucket: PInteger;
begin
  if FCount = FCapacity then
    Grow;
  Index := FCount;
  Inc(FCount);
  Bucket := @FBuckets[(AHash and $7FFFFFFF) mod FCapacity];
  with FStrings[Index] do
  begin
    Next := Bucket^;
    Hash := AHash;
    Pointer(Name) := Pointer(S);
    Inc(PInteger(@PByte(Name)[-8])^);
  end;
  Bucket^ := Index;
end;

procedure TStringIntern.Grow;
var
  I: Integer;
  Index: Integer;
  Len: Integer;
begin
  Len := FCapacity;
  // Some prime numbers
  case Len of
      17: Len := 37;
      37: Len := 59;
      59: Len := 83;
      83: Len := 127;
     127: Len := 353;
     353: Len := 739;
     739: Len := 1597;
    1597: Len := 2221;
  else
    Len := Len * 2 + 1;
  end;
  FCapacity := Len;
  ReallocMem(FStrings, Len * SizeOf(FStrings[0]));
  ReallocMem(FBuckets, Len * SizeOf(FBuckets[0]));
  FillChar(FBuckets[0], Len * SizeOf(FBuckets[0]), $FF);
  // Rehash
  for I := 0 to FCount - 1 do
  begin
    Index := (FStrings[I].Hash and $7FFFFFFF) mod Len;
    FStrings[I].Next := FBuckets[Index];
    FBuckets[Index] := I;
  end;
end;

function TStringIntern.Find(Hash: Integer; const S: string): Integer;
var
  Strs: PJsonStringEntryArray;
begin
  Result := -1;
  if FCount <> 0 then
  begin
    Result := FBuckets[(Hash and $7FFFFFFF) mod FCapacity];
    if Result <> -1 then
    begin
      Strs := FStrings;
      while True do
      begin
        if (Strs[Result].Hash = Hash) and (Strs[Result].Name = S) then
          Break;
        Result := Strs[Result].Next;
        if Result = -1 then
          Break;
      end;
    end;
  end;
end;
{$ENDIF USE_STRINGINTERN_FOR_NAMES}

{ TJsonOutputWriter }
procedure TDGJsonOutputWriter.Init(ACompact: Boolean; AStream: TStream; AEncoding: TEncoding; ALines: TStrings);
begin
  FCompact := ACompact;
  FStream := AStream;
  FEncoding := AEncoding;
  if ALines <> nil then
  begin
    FCompact := False; // there is no compact version for TStrings
    FLines := ALines;
  end
  else
  begin
    FStreamEncodingBuffer := nil;
    FStreamEncodingBufferLen := 0;
    FLines := nil;
    FStringBuffer.Init;
  end;
  if not ACompact then
  begin
    FLastLine.Init;
    FIndent := 0;
    FLastType := ltInitial;
    // Set up some initial indention levels
    // TODO change to one buffer with #0 vs. IndentChar
    FIndents := AllocMem(5 * SizeOf(string));
    FIndentsLen := 5;
    //FIndents[0] := '';
    FIndents[1] := DGJsonSerializationConfig.IndentChar;
    FIndents[2] := FIndents[1] + DGJsonSerializationConfig.IndentChar;
    FIndents[3] := FIndents[2] + DGJsonSerializationConfig.IndentChar;
    FIndents[4] := FIndents[3] + DGJsonSerializationConfig.IndentChar;
  end;
end;

procedure TDGJsonOutputWriter.FreeIndents;
var
  I: Integer;
begin
  for I := 0 to FIndentsLen - 1 do
    FIndents[I] := '';
  FreeMem(FIndents);
end;

function TDGJsonOutputWriter.Done: string;
begin
  if not FCompact then
  begin
    FlushLastLine;
    FreeIndents;
    FLastLine.Done;
  end;
  if FLines = nil then
    FStringBuffer.DoneConvertToString(Result);
end;

procedure TDGJsonOutputWriter.LinesDone;
begin
  FreeIndents;
  FlushLastLine;
  FLastLine.Done;
end;

procedure TDGJsonOutputWriter.StreamDone;
begin
  if not FCompact then
  begin
    FlushLastLine;
    FreeIndents;
    FLastLine.Done;
  end;
  if FStream <> nil then
    StreamFlush;
  if FStreamEncodingBuffer <> nil then
    FreeMem(FStreamEncodingBuffer);
  FStringBuffer.Done;
end;

procedure TDGJsonOutputWriter.FlushLastLine;
var
  S: Pointer;
begin
  if FLastLine.Len > 0 then
  begin
    if FLines = nil then
    begin
      FLastLine.FlushToStringBuffer(FStringBuffer);
      FStringBuffer.Append(DGJsonSerializationConfig.LineBreak);
    end
    else
    begin
      S := nil;
      try
        FLastLine.FlushToString(string(S));
        FLines.Add(string(S));
      finally
        string(S) := '';
      end;
    end
  end;
end;

procedure TDGJsonOutputWriter.StreamFlush;
var
  Size: NativeInt;
begin
  if FStringBuffer.Len > 0 then
  begin
    if FEncoding = TEncoding.Unicode then
    begin
      FStream.Write(FStringBuffer.Data[0], FStringBuffer.Len);
      FStringBuffer.FLen := 0;
    end
    else if FStream is TMemoryStream then
      FStringBuffer.FlushToMemoryStream(TMemoryStream(FStream), FEncoding)
    else
    begin
      Size := FStringBuffer.FlushToBytes(FStreamEncodingBuffer, FStreamEncodingBufferLen, FEncoding);
      if Size > 0 then
        FStream.Write(FStreamEncodingBuffer[0], Size);
    end;
  end;
end;

procedure TDGJsonOutputWriter.StreamFlushPossible;
const
  MinFlushBufferLen = 1024 * 1024;
begin
  if (FStream <> nil) and (FStringBuffer.Len >= MinFlushBufferLen) then
    StreamFlush;
end;

procedure TDGJsonOutputWriter.ExpandIndents;
begin
  Inc(FIndentsLen);
  ReallocMem(Pointer(FIndents), FIndentsLen * SizeOf(string));
  Pointer(FIndents[FIndent]) := nil;
  FIndents[FIndent] := FIndents[FIndent - 1] + DGJsonSerializationConfig.IndentChar;
end;

procedure TDGJsonOutputWriter.AppendLine(AppendOn: TLastType; const S: string);
begin
  if FLastType = AppendOn then
    FLastLine.Append(S)
  else
  begin
    FlushLastLine;
    StreamFlushPossible;
    FLastLine.Append2(FIndents[FIndent], PChar(Pointer(S)), Length(S));
  end;
end;

procedure TDGJsonOutputWriter.AppendLine(AppendOn: TLastType; P: PChar; Len: Integer);
begin
  if FLastType = AppendOn then
    FLastLine.Append(P, Len)
  else
  begin
    FlushLastLine;
    StreamFlushPossible;
    FLastLine.Append2(FIndents[FIndent], P, Len);
  end;
end;

procedure TDGJsonOutputWriter.Indent(const S: string);
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append(S);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    This.AppendLine(ltIntro, S); // inlined
    Inc(This.FIndent);
    if This.FIndent >= This.FIndentsLen then // this is a new indention level
      ExpandIndents;
    This.FLastType := ltIndent;
  end;
end;

procedure TDGJsonOutputWriter.Unindent(const S: string);
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append(S);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    Dec(This.FIndent);
    //Assert(FIndent >= 0);
    This.AppendLine(ltIndent, S); // inlined
    This.FLastType := ltUnindent;
  end;
end;

procedure TDGJsonOutputWriter.AppendIntro(P: PChar; Len: Integer);
const
  sQuoteCharColon = '":';
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append2(sQuoteChar, P, Len).Append(sQuoteCharColon, 2);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    FlushLastLine;
    This.StreamFlushPossible; // inlined
    This.FLastLine.Append(This.FIndents[This.FIndent]).Append2(sQuoteChar, P, Len).Append('": ', 3);
    This.FLastType := ltIntro;
  end;
end;

procedure TDGJsonOutputWriter.AppendValue(P: PChar; Len: Integer);
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append(P, Len);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    This.AppendLine(ltIntro, P, Len); // inlined
    This.FLastType := ltValue;
  end;
end;

procedure TDGJsonOutputWriter.AppendValue(const S: string);
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append(S);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    This.AppendLine(ltIntro, S); // inlined
    This.FLastType := ltValue;
  end;
end;

procedure TDGJsonOutputWriter.AppendStrValue(P: PChar; Len: Integer);
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append3(sQuoteChar, P, Len, sQuoteChar);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    if This.FLastType = ltIntro then
      This.FLastLine.Append3(sQuoteChar, P, Len, sQuoteChar)
    else
    begin
      FlushLastLine;
      This.StreamFlushPossible; // inlined
      This.FLastLine.Append(This.FIndents[This.FIndent]).Append3(sQuoteChar, P, Len, sQuoteChar);
    end;
    This.FLastType := ltValue;
  end;
end;

procedure TDGJsonOutputWriter.AppendSeparator(const S: string);
var
  This: ^TDGJsonOutputWriter;
begin
  This := @Self;
  if This.FCompact then
  begin
    This.FStringBuffer.Append(S);
    This.StreamFlushPossible; // inlined
  end
  else
  begin
    if This.FLastType in [ltValue, ltUnindent] then
      This.FLastLine.Append(S)
    else
    begin
      FlushLastLine;
      This.StreamFlushPossible; // inlined
      This.FLastLine.Append2(This.FIndents[This.FIndent], PChar(Pointer(S)), Length(S));
    end;
    This.FLastType := ltSeparator;
  end;
end;

{ TUtf8JsonReader }
constructor TUtf8JsonReader.Create(S: PByte; Len: NativeInt{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
begin
  inherited Create(S{$IFDEF SUPPORT_PROGRESS}, Len * SizeOf(Byte), AProgress{$ENDIF});
  FText := S;
  FTextEnd := S + Len;
end;

function TUtf8JsonReader.GetCharOffset(StartPos: Pointer): NativeInt;
begin
  Result := FText - PByte(StartPos);
end;

function TUtf8JsonReader.Next: Boolean;
label
  EndReached;
var
  P, EndP: PByte;
  Ch: Byte;
begin
  P := FText;
  EndP := FTextEnd;
  {$IF CompilerVersion <= 30.0} // Delphi 10 Seattle or older
    {$IFNDEF CPUX64}
  Ch := 0; // silence compiler warning
    {$ENDIF ~CPUX64}
  {$IFEND}
  while True do
  begin
    while True do
    begin
      if P = EndP then
        goto EndReached; // use GOTO to eliminate doing the "P = EndP", "P < EndP" 3 times - wish there was a "Break loop-label;"
      Ch := P^;
      if Ch > 32 then
        Break;
      if not (Ch in [9, 32]) then
        Break;
      Inc(P);
    end;
    case Ch of
      10:
        begin
          FLineStart := P + 1;
          Inc(FLineNum);
        end;
      13:
        begin
          Inc(FLineNum);
          if (P + 1 < EndP) and (P[1] = 10) then
            Inc(P);
          FLineStart := P + 1;
        end;
    else
      Break;
    end;
    Inc(P);
  end;
EndReached:
  if P < EndP then
  begin
    case P^ of
      Ord('{'):
        begin
          FLook.Kind := jtkLBrace;
          FText := P + 1;
        end;
      Ord('}'):
        begin
          FLook.Kind := jtkRBrace;
          FText := P + 1;
        end;
      Ord('['):
        begin
          FLook.Kind := jtkLBracket;
          FText := P + 1;
        end;
      Ord(']'):
        begin
          FLook.Kind := jtkRBracket;
          FText := P + 1;
        end;
      Ord(':'):
        begin
          FLook.Kind := jtkColon;
          FText := P + 1;
        end;
      Ord(','):
        begin
          FLook.Kind := jtkComma;
          FText := P + 1;
        end;
      Ord('"'): // String
        begin
          LexString(P{$IFDEF CPUARM}, EndP{$ENDIF});
          {$IFDEF SUPPORT_PROGRESS}
          if FProgress <> nil then
            CheckProgress(FText);
          {$ENDIF SUPPORT_PROGRESS}
        end;
      Ord('-'), Ord('0')..Ord('9'), Ord('.'): // Number
        begin
          LexNumber(P{$IFDEF CPUARM}, EndP{$ENDIF});
          {$IFDEF SUPPORT_PROGRESS}
          if FProgress <> nil then
            CheckProgress(FText);
          {$ENDIF SUPPORT_PROGRESS}
        end
    else
      LexIdent(P{$IFDEF CPUARM}, EndP{$ENDIF}); // Ident/Bool/NULL
      {$IFDEF SUPPORT_PROGRESS}
      if FProgress <> nil then
        CheckProgress(FText);
      {$ENDIF SUPPORT_PROGRESS}
    end;
    Result := True;
  end
  else
  begin
    FText := EndP;
    FLook.Kind := jtkEof;
    Result := False;
  end;
end;

procedure TUtf8JsonReader.LexString(P: PByte{$IFDEF CPUARM}; EndP: PByte{$ENDIF});
var
  {$IFNDEF CPUARM}
  EndP: PByte;
  {$ENDIF ~CPUARM}
  EscapeSequences: PByte;
  Ch: Byte;
  Idx: Integer;
begin
  Inc(P); // skip initiating '"'
  {$IFNDEF CPUARM}
  EndP := FTextEnd;
  {$ENDIF ~CPUARM}
  EscapeSequences := nil;
  Ch := 0;
  Idx := P - EndP;
  // find the string end
  repeat
    if Idx = 0 then
      Break;
    Ch := EndP[Idx];
    if (Ch = Byte(Ord('"'))) or (Ch = 10) or (Ch = 13) then
      Break;
    Inc(Idx);
    if Ch <> Byte(Ord('\')) then
      Continue;
    if Idx = 0 then // Eof reached in an escaped char => broken JSON string
      Break;
    if EscapeSequences = nil then
      EscapeSequences := @EndP[Idx];
    Inc(Idx);
  until False;
  if Idx = 0 then
  begin
    FText := P - 1;
    TJsonReader.StringNotClosedError(Self);
  end;
  EndP := @EndP[Idx];
  if EscapeSequences = nil then
    SetStringUtf8(FLook.S, P, EndP - P)
  else
    TUtf8JsonReader.JSONUtf8StrToStr(P, EndP, EscapeSequences - P, FLook.S, Self);
  if Ch = Byte(Ord('"')) then
    Inc(EndP);
  FLook.Kind := jtkString;
  FText := EndP;
  if Ch in [10, 13] then
    TJsonReader.InvalidStringCharacterError(Self);
end;
{$IFDEF ASMSUPPORT}
  {$IFDEF CPUX64}
function ParseUInt64Utf8(P, EndP: PByte): UInt64;
// RCX = P
// RDX = EndP
asm
  cmp rcx, rdx
  jge @@LeaveFail
  mov r8, rdx
  sub rcx, r8
  // r8+rcx = EndP + NegOffset = P => NegOffset can be incremented and checked for zero
  movzx rax, BYTE PTR [r8+rcx]
  sub al, '0'
  add rcx, 1
  jz @@Leave
@@Loop:
  add rax, rax
  // rax = 2*Result
  lea rax, [rax+rax*4]
  // rax = (2*Result)*4 + (2*Result) = 10*Result
  movzx rdx, BYTE PTR [r8+rcx]
  sub dl, '0'
  add rax, rdx
  add rcx, 1
  jnz @@Loop
@@Leave:
  ret
@@LeaveFail:
  xor rax, rax
end;
  {$ENDIF CPUX64}
  {$IFDEF CPUX86}
function ParseUInt64Utf8(P, EndP: PByte): UInt64;
asm
  cmp eax, edx
  jge @@LeaveFail
  push esi
  push edi
  push ebx
  mov esi, edx
  mov edi, eax
  sub edi, edx
  // esi+edi = EndP + NegOffset = P => NegOffset can be incremented and checked for zero
  xor edx, edx
  movzx eax, BYTE PTR [esi+edi]
  sub al, '0'
  add edi, 1
  jz @@PopLeave
@@Loop:
  add eax, eax
  adc edx, edx
  // eax:edx = 2*Result
  mov ebx, eax
  mov ecx, edx
  // ebx:ecx = 2*Result
  shld edx, eax, 2
  shl eax, 2
  // eax:edx = (2*Result)*4
  add eax, ebx
  adc edx, ecx
  // eax:edx = (2*Result)*4 + (2*Result) = 10*Result
  movzx ecx, BYTE PTR [esi+edi]
  sub cl, '0'
  add eax, ecx
  adc edx, 0
  add edi, 1
  jnz @@Loop
@@PopLeave:
  pop ebx
  pop edi
  pop esi
@@Leave:
  ret
@@LeaveFail:
  xor eax, eax
  xor edx, edx
end;
  {$ENDIF CPUX86}
{$ELSE}
function ParseUInt64Utf8(P, EndP: PByte): UInt64;
begin
  if P = EndP then
    Result := 0
  else
  begin
    Result := P^ - Byte(Ord('0'));
    Inc(P);
    while P < EndP do
    begin
      Result := Result * 10 + Byte(P^ - Byte(Ord('0')));
      Inc(P);
    end;
  end;
end;
{$ENDIF ASMSUPPORT}

function ParseAsDoubleUtf8(F, P: PByte): Double;
begin
  Result := 0.0;
  while F < P do
  begin
    Result := Result * 10 + (F^ - Byte(Ord('0')));
    Inc(F);
  end;
end;

procedure TUtf8JsonReader.LexNumber(P: PByte{$IFDEF CPUARM}; EndP: PByte{$ENDIF});
var
  F: PByte;
  {$IFNDEF CPUARM}
  EndP: PByte;
  {$ENDIF ~CPUARM}
  EndInt64P: PByte;
  Ch: Byte;
  Value, Scale: Double;
  Exponent, IntValue: Integer;
  Neg, NegE: Boolean;
  DigitCount: Integer;
begin
  {$IFNDEF CPUARM}
  EndP := FTextEnd;
  {$ENDIF ~CPUARM}
  Neg := False;
  Ch := P^;
  if Ch = Byte(Ord('-')) then
  begin
    Inc(P);
    if P >= EndP then
    begin
      FLook.Kind := jtkInvalidSymbol;
      FText := P;
      Exit;
    end;
    Neg := True;
    Ch := P^;
  end;
  F := P;
  Inc(P);
  if Ch <> Byte(Ord('0')) then
  begin
    if Ch in [Ord('1')..Ord('9')] then
    begin
      while (P < EndP) and (P^ in [Ord('0')..Ord('9')]) do
        Inc(P);
    end
    else
    begin
      FLook.Kind := jtkInvalidSymbol;
      FText := P;
      Exit;
    end;
  end;
  DigitCount := P - F;
  if DigitCount <= 9 then // Int32 fits 9 digits
  begin
    IntValue := 0;
    while F < P do
    begin
      IntValue := IntValue * 10 + (F^ - Byte(Ord('0')));
      Inc(F);
    end;
    FLook.HI := 0;
    FLook.I := IntValue;
    FLook.Kind := jtkInt;
    if not (P^ in [Ord('.'), Ord('E'), Ord('e')]) then
    begin
      // just an integer
      if Neg then
        FLook.I := -FLook.I;
      FText := P;
      Exit;
    end;
    Value := FLook.I;
  end
  else if DigitCount <= 20 then // UInt64 fits 20 digits (not all)
  begin
    FLook.U := ParseUInt64Utf8(F, P);
    if (DigitCount = 20) and (FLook.U mod 10 <> PByte(P - 1)^ - Byte(Ord('0'))) then // overflow => too large
      Value := ParseAsDoubleUtf8(F, P)
    else if Neg and ((DigitCount = 20) or ((DigitCount = 19) and (FLook.HI and $80000000 <> 0))) then
      // "negative UInt64" doesn't fit into UInt64/Int64 => use Double
      Value := FLook.U
    else
    begin
      FLook.Kind := jtkLong;
      case DigitCount of
        19:
         if FLook.HI and $80000000 <> 0 then // can't be negative because we cached that case already
           FLook.Kind := jtkULong;
        20:
          FLook.Kind := jtkULong;
      end;
      if not (P^ in [Ord('.'), Ord('E'), Ord('e')]) then
      begin
        // just an integer
        if Neg then
        begin
          if (FLook.HI = 0) and (FLook.I >= 0) then // 32bit Integer
          begin
            FLook.I := -FLook.I;
            FLook.Kind := jtkInt;
          end
          else                 // 64bit Integer
            FLook.L := -FLook.L;
        end;
        FText := P;
        Exit;
      end;
      Value := FLook.U;
    end;
  end
  else
    Value := ParseAsDoubleUtf8(F, P);
  // decimal digits
  if (P + 1 < EndP) and (P^ = Byte(Ord('.'))) then
  begin
    Inc(P);
    F := P;
    EndInt64P := F + 18;
    if EndInt64P > EndP then
      EndInt64P := EndP;
    while (P < EndInt64P) and (P^ in [Ord('0')..Ord('9')]) do
      Inc(P);
    Value := Value + ParseUInt64Utf8(F, P) / Power10[P - F];
    // "Double" can't handle that many digits
    while (P < EndP) and (P^ in [Ord('0')..Ord('9')]) do
      Inc(P);
  end;
  // exponent
  if (P < EndP) and (P^ in [Ord('e'), Ord('E')]) then
  begin
    Inc(P);
    NegE := False;
    if (P < EndP) then
    begin
      case P^ of
        Ord('-'):
          begin
            NegE := True;
            Inc(P);
          end;
        Ord('+'):
          Inc(P);
      end;
      Exponent := 0;
      F := P;
      while (P < EndP) and (P^ in [Ord('0')..Ord('9')]) do
      begin
        Exponent := Exponent * 10 + (P^ - Byte(Ord('0')));
        Inc(P);
      end;
      if P = F then
      begin
        // no exponent
        FLook.Kind := jtkInvalidSymbol;
        FText := P;
        Exit;
      end;
      if Exponent > 308 then
        Exponent := 308;
      Scale := 1.0;
      while Exponent >= 50 do
      begin
        Scale := Scale * 1E50;
        Dec(Exponent, 50);
      end;
      while Exponent >= 18 do
      begin
        Scale := Scale * 1E18;
        Dec(Exponent, 18);
      end;
      Scale := Scale * Power10[Exponent];
      if NegE then
        Value := Value / Scale
      else
        Value := Value * Scale;
    end
    else
    begin
      FLook.Kind := jtkInvalidSymbol;
      FText := P;
      Exit;
    end;
  end;
  if Neg then
    FLook.F := -Value
  else
    FLook.F := Value;
  FLook.Kind := jtkFloat;
  FText := P;
end;

procedure TUtf8JsonReader.LexIdent(P: PByte{$IFDEF CPUARM}; EndP: PByte{$ENDIF});
const
  {$IFDEF BIGENDIAN}
  // Big Endian
  NullStr = LongWord((Ord('n') shl 24) or (Ord('u') shl 16) or (Ord('l') shl 8) or Ord('l'));
  TrueStr = LongWord((Ord('t') shl 24) or (Ord('r') shl 16) or (Ord('u') shl 8) or Ord('e'));
  FalseStr = LongWord((Ord('a') shl 24) or (Ord('l') shl 16) or (Ord('s') shl 8) or Ord('e'));
  {$ELSE}
  // Little Endian
  NullStr = LongWord(Ord('n') or (Ord('u') shl 8) or (Ord('l') shl 16) or (Ord('l') shl 24));
  TrueStr = LongWord(Ord('t') or (Ord('r') shl 8) or (Ord('u') shl 16) or (Ord('e') shl 24));
  FalseStr = LongWord(Ord('a') or (Ord('l') shl 8) or (Ord('s') shl 16) or (Ord('e') shl 24));
  {$ENDIF BIGENDIAN}
var
  F: PByte;
  {$IFNDEF CPUARM}
  EndP: PByte;
  {$ENDIF ~CPUARM}
  L: LongWord;
begin
  F := P;
  {$IFNDEF CPUARM}
  EndP := FTextEnd;
  {$ENDIF ~CPUARM}
  case P^ of
    Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('_'), Ord('$'):
      begin
        Inc(P);
//        DCC64 generates "bt mem,reg" code
//        while (P < EndP) and (P^ in [Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('_'), Ord('0')..Ord('9')]) do
//          Inc(P);
        while P < EndP do
          case P^ of
            Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('_'), Ord('0')..Ord('9'): Inc(P);
          else
            Break;
          end;
        L := P - F;
        if L = 4 then
        begin
          L := PLongWord(F)^;
          if L = NullStr then
            FLook.Kind := jtkNull
          else if L = TrueStr then
            FLook.Kind := jtkTrue
          else
          begin
            SetStringUtf8(FLook.S, F, P - F);
            FLook.Kind := jtkIdent;
          end;
        end
        else if (L = 5) and (F^ = Ord('f')) and (PLongWord(F + 1)^ = FalseStr) then
          FLook.Kind := jtkFalse
        else
        begin
          SetStringUtf8(FLook.S, F, P - F);
          FLook.Kind := jtkIdent;
        end;
      end;
  else
    FLook.Kind := jtkInvalidSymbol;
    Inc(P);
  end;
  FText := P;
end;

{ TStringJsonReader }
constructor TStringJsonReader.Create(S: PChar; Len: Integer{$IFDEF SUPPORT_PROGRESS}; AProgress: PDGJsonReaderProgressRec{$ENDIF});
begin
  inherited Create(S{$IFDEF SUPPORT_PROGRESS}, Len * SizeOf(WideChar), AProgress{$ENDIF});
  FText := S;
  FTextEnd := S + Len;
end;

function TStringJsonReader.GetCharOffset(StartPos: Pointer): NativeInt;
begin
  Result := FText - PChar(StartPos);
end;

function TStringJsonReader.Next: Boolean;
var
  P, EndP: PChar;
begin
  P := FText;
  EndP := FTextEnd;
  while (P < EndP) and (P^ <= #32) do
    Inc(P);
  if P < EndP then
  begin
    case P^ of
      '{':
        begin
          FLook.Kind := jtkLBrace;
          FText := P + 1;
        end;
      '}':
        begin
          FLook.Kind := jtkRBrace;
          FText := P + 1;
        end;
      '[':
        begin
          FLook.Kind := jtkLBracket;
          FText := P + 1;
        end;
      ']':
        begin
          FLook.Kind := jtkRBracket;
          FText := P + 1;
        end;
      ':':
        begin
          FLook.Kind := jtkColon;
          FText := P + 1;
        end;
      ',':
        begin
          FLook.Kind := jtkComma;
          FText := P + 1;
        end;
      '"': // String
        begin
          LexString(P{$IFDEF CPUARM}, EndP{$ENDIF});
          {$IFDEF SUPPORT_PROGRESS}
          if FProgress <> nil then
            CheckProgress(FText);
          {$ENDIF SUPPORT_PROGRESS}
        end;
      '-', '0'..'9', '.': // Number
        begin
          LexNumber(P{$IFDEF CPUARM}, EndP{$ENDIF});
          {$IFDEF SUPPORT_PROGRESS}
          if FProgress <> nil then
            CheckProgress(FText);
          {$ENDIF SUPPORT_PROGRESS}
        end
    else
      LexIdent(P{$IFDEF CPUARM}, EndP{$ENDIF}); // Ident/Bool/NULL
      {$IFDEF SUPPORT_PROGRESS}
      if FProgress <> nil then
        CheckProgress(FText);
      {$ENDIF SUPPORT_PROGRESS}
    end;
    Result := True;
  end
  else
  begin
    FText := EndP;
    FLook.Kind := jtkEof;
    Result := False;
  end;
end;

procedure TStringJsonReader.LexString(P: PChar{$IFDEF CPUARM}; EndP: PChar{$ENDIF});
var
  {$IFNDEF CPUARM}
  EndP: PChar;
  {$ENDIF ~CPUARM}
  EscapeSequences: PChar;
  Ch: Char;
  Idx: Integer;
begin
  Inc(P); // skip initiating '"'
  {$IFNDEF CPUARM}
  EndP := FTextEnd;
  {$ENDIF ~CPUARM}
  EscapeSequences := nil;
  Ch := #0;
  Idx := P - EndP;
  // find the string end
  repeat
    if Idx = 0 then
      Break;
    Ch := EndP[Idx];
    if (Ch = '"') or (Ch = #10) or (Ch = #13) then
      Break;
    Inc(Idx);
    if Ch <> '\' then
      Continue;
    if Idx = 0 then // Eof reached in an escaped char => broken JSON string
      Break;
    if EscapeSequences = nil then
      EscapeSequences := @EndP[Idx];
    Inc(Idx);
  until False;
  if Idx = 0 then
  begin
    FText := P - 1;
    TJsonReader.StringNotClosedError(Self);
  end;
  EndP := @EndP[Idx];
  if EscapeSequences = nil then
    SetString(FLook.S, P, EndP - P)
  else
    TJsonReader.JSONStrToStr(P, EndP, EscapeSequences - P, FLook.S, Self);
  if Ch = '"' then
    Inc(EndP);
  FLook.Kind := jtkString;
  FText := EndP;
  if Ch in [#10, #13] then
    TJsonReader.InvalidStringCharacterError(Self);
end;
{$IFDEF ASMSUPPORT}
  {$IFDEF CPUX64}
function ParseUInt64(P, EndP: PWideChar): UInt64;
// RCX = P
// RDX = EndP
asm
  cmp rcx, rdx
  jge @@LeaveFail
  mov r8, rdx
  sub rcx, r8
  // r8+rcx = EndP + NegOffset = P => NegOffset can be incremented and checked for zero
  movzx rax, WORD PTR [r8+rcx]
  sub ax, '0'
  add rcx, 2
  jz @@Leave
@@Loop:
  add rax, rax
  // rax = 2*Result
  lea rax, [rax+rax*4]
  // rax = (2*Result)*4 + (2*Result) = 10*Result
  movzx rdx, WORD PTR [r8+rcx]
  sub dx, '0'
  add rax, rdx
  add rcx, 2
  jnz @@Loop
@@Leave:
  ret
@@LeaveFail:
  xor rax, rax
end;
  {$ENDIF CPUX64}
  {$IFDEF CPUX86}
function ParseUInt64(P, EndP: PWideChar): UInt64;
asm
  cmp eax, edx
  jge @@LeaveFail
  push esi
  push edi
  push ebx
  mov esi, edx
  mov edi, eax
  sub edi, edx
  // esi+edi = EndP + NegOffset = P => NegOffset can be incremented and checked for zero
  xor edx, edx
  movzx eax, WORD PTR [esi+edi]
  sub ax, '0'
  add edi, 2
  jz @@PopLeave
@@Loop:
  add eax, eax
  adc edx, edx
  // eax:edx = 2*Result
  mov ebx, eax
  mov ecx, edx
  // ebx:ecx = 2*Result
  shld edx, eax, 2
  shl eax, 2
  // eax:edx = (2*Result)*4
  add eax, ebx
  adc edx, ecx
  // eax:edx = (2*Result)*4 + (2*Result) = 10*Result
  movzx ecx, WORD PTR [esi+edi]
  sub cx, '0'
  add eax, ecx
  adc edx, 0
  add edi, 2
  jnz @@Loop
@@PopLeave:
  pop ebx
  pop edi
  pop esi
@@Leave:
  ret
@@LeaveFail:
  xor eax, eax
  xor edx, edx
end;
  {$ENDIF CPUX86}
{$ELSE}
function ParseUInt64(P, EndP: PWideChar): UInt64;
begin
  if P = EndP then
    Result := 0
  else
  begin
    Result := Ord(P^) - Ord('0');
    Inc(P);
    while P < EndP do
    begin
      Result := Result * 10 + Byte(Ord(P^) - Ord('0'));
      Inc(P);
    end;
  end;
end;
{$ENDIF ASMSUPPORT}
function ParseAsDouble(F, P: PWideChar): Double;
begin
  Result := 0.0;
  while F < P do
  begin
    Result := Result * 10 + (Ord(F^) - Ord('0'));
    Inc(F);
  end;
end;

procedure TStringJsonReader.LexNumber(P: PChar{$IFDEF CPUARM}; EndP: PChar{$ENDIF});
var
  F: PChar;
  {$IFNDEF CPUARM}
  EndP: PChar;
  {$ENDIF ~CPUARM}
  EndInt64P: PChar;
  Ch: Char;
  Value, Scale: Double;
  Exponent, IntValue: Integer;
  Neg, NegE: Boolean;
  DigitCount: Integer;
begin
  {$IFNDEF CPUARM}
  EndP := FTextEnd;
  {$ENDIF ~CPUARM}
  Neg := False;
  Ch := P^;
  if Ch = '-' then
  begin
    Inc(P);
    if P >= EndP then
    begin
      FLook.Kind := jtkInvalidSymbol;
      FText := P;
      Exit;
    end;
    Neg := True;
    Ch := P^;
  end;
  F := P;
  Inc(P);
  if Ch <> '0' then
  begin
    if Ch in ['1'..'9'] then
    begin
      while (P < EndP) and (P^ in ['0'..'9']) do
        Inc(P);
    end
    else
    begin
      FLook.Kind := jtkInvalidSymbol;
      FText := P;
      Exit;
    end;
  end;
  DigitCount := P - F;
  if DigitCount <= 9 then // Int32 fits 9 digits
  begin
    IntValue := 0;
    while F < P do
    begin
      IntValue := IntValue * 10 + (Ord(F^) - Ord('0'));
      Inc(F);
    end;
    FLook.HI := 0;
    FLook.I := IntValue;
    FLook.Kind := jtkInt;
    if not (P^ in ['.', 'E', 'e']) then
    begin
      // just an integer
      if Neg then
        FLook.I := -FLook.I;
      FText := P;
      Exit;
    end;
    Value := FLook.I;
  end
  else if DigitCount <= 20 then // UInt64 fits 20 digits (not all)
  begin
    FLook.U := ParseUInt64(F, P);
    if (DigitCount = 20) and (FLook.U mod 10 <> Ord(PWideChar(P - 1)^) - Ord('0')) then // overflow => too large
      Value := ParseAsDouble(F, P)
    else if Neg and ((DigitCount = 20) or ((DigitCount = 19) and (FLook.HI and $80000000 <> 0))) then
      // "negative UInt64" doesn't fit into UInt64/Int64 => use Double
      Value := FLook.U
    else
    begin
      FLook.Kind := jtkLong;
      case DigitCount of
        19:
         if FLook.HI and $80000000 <> 0 then // can't be negative because we cached that case already
           FLook.Kind := jtkULong;
        20:
          FLook.Kind := jtkULong;
      end;
      if not (P^ in ['.', 'E', 'e']) then
      begin
        // just an integer
        if Neg then
        begin
          if (FLook.HI = 0) and (FLook.I >= 0) then // 32bit Integer
          begin
            FLook.I := -FLook.I;
            FLook.Kind := jtkInt;
          end
          else                 // 64bit Integer
            FLook.L := -FLook.L;
        end;
        FText := P;
        Exit;
      end;
      Value := FLook.U;
    end;
  end
  else
    Value := ParseAsDouble(F, P);
  // decimal digits
  if (P + 1 < EndP) and (P^ = '.') then
  begin
    Inc(P);
    F := P;
    EndInt64P := F + 18;
    if EndInt64P > EndP then
      EndInt64P := EndP;
    while (P < EndInt64P) and (P^ in ['0'..'9']) do
      Inc(P);
    Value := Value + ParseUInt64(F, P) / Power10[P - F];
    // "Double" can't handle that many digits
    while (P < EndP) and (P^ in ['0'..'9']) do
      Inc(P);
  end;
  // exponent
  if (P < EndP) and ((P^ = 'e') or (P^ = 'E')) then
  begin
    Inc(P);
    NegE := False;
    if (P < EndP) then
    begin
      case P^ of
        '-':
          begin
            NegE := True;
            Inc(P);
          end;
        '+':
          Inc(P);
      end;
      Exponent := 0;
      F := P;
      while (P < EndP) and (P^ in ['0'..'9']) do
      begin
        Exponent := Exponent * 10 + (Ord(P^) - Ord('0'));
        Inc(P);
      end;
      if P = F then
      begin
        // no exponent
        FLook.Kind := jtkInvalidSymbol;
        FText := P;
        Exit;
      end;
      if Exponent > 308 then
        Exponent := 308;
      Scale := 1.0;
      while Exponent >= 50 do
      begin
        Scale := Scale * 1E50;
        Dec(Exponent, 50);
      end;
      while Exponent >= 18 do
      begin
        Scale := Scale * 1E18;
        Dec(Exponent, 18);
      end;
      Scale := Scale * Power10[Exponent];
      if NegE then
        Value := Value / Scale
      else
        Value := Value * Scale;
    end
    else
    begin
      FLook.Kind := jtkInvalidSymbol;
      FText := P;
      Exit;
    end;
  end;
  if Neg then
    FLook.F := -Value
  else
    FLook.F := Value;
  FLook.Kind := jtkFloat;
  FText := P;
end;

procedure TStringJsonReader.LexIdent(P: PChar{$IFDEF CPUARM}; EndP: PChar{$ENDIF});
const
  {$IFDEF BIGENDIAN}
  // Big Endian
  NullStr1 = LongWord((Ord('n') shl 16) or Ord('u'));
  NullStr2 = LongWord((Ord('l') shl 16) or Ord('l'));
  TrueStr1 = LongWord((Ord('t') shl 16) or Ord('r'));
  TrueStr2 = LongWord((Ord('u') shl 16) or Ord('e'));
  FalseStr1 = LongWord((Ord('a') shl 16) or Ord('l'));
  FalseStr2 = LongWord((Ord('s') shl 16) or Ord('e'));
  {$ELSE}
  // Little Endian
  NullStr1 = LongWord(Ord('n') or (Ord('u') shl 16));
  NullStr2 = LongWord(Ord('l') or (Ord('l') shl 16));
  TrueStr1 = LongWord(Ord('t') or (Ord('r') shl 16));
  TrueStr2 = LongWord(Ord('u') or (Ord('e') shl 16));
  FalseStr1 = LongWord(Ord('a') or (Ord('l') shl 16));
  FalseStr2 = LongWord(Ord('s') or (Ord('e') shl 16));
  {$ENDIF BIGENDIAN}
var
  F: PChar;
  {$IFNDEF CPUARM}
  EndP: PChar;
  {$ENDIF ~CPUARM}
  L: LongWord;
begin
  F := P;
  {$IFNDEF CPUARM}
  EndP := FTextEnd;
  {$ENDIF ~CPUARM}
  case P^ of
    'A'..'Z', 'a'..'z', '_', '$':
      begin
        Inc(P);
//        DCC64 generates "bt mem,reg" code
//        while (P < EndP) and (P^ in ['A'..'Z', 'a'..'z', '_', '0'..'9']) do
//          Inc(P);
        while P < EndP do
          case P^ of
            'A'..'Z', 'a'..'z', '_', '0'..'9': Inc(P);
          else
            Break;
          end;
        L := P - F;
        if L = 4 then
        begin
          L := PLongWord(F)^;
          if (L = NullStr1) and (PLongWord(F + 2)^ = NullStr2) then
            FLook.Kind := jtkNull
          else if (L = TrueStr1) and (PLongWord(F + 2)^ = TrueStr2) then
            FLook.Kind := jtkTrue
          else
          begin
            SetString(FLook.S, F, P - F);
            FLook.Kind := jtkIdent;
          end;
        end
        else if (L = 5) and (F^ = 'f') and (PLongWord(F + 1)^ = FalseStr1) and (PLongWord(F + 3)^ = FalseStr2) then
          FLook.Kind := jtkFalse
        else
        begin
          SetString(FLook.S, F, P - F);
          FLook.Kind := jtkIdent;
        end;
      end;
  else
    FLook.Kind := jtkInvalidSymbol;
    Inc(P);
  end;
  FText := P;
end;

{ TJsonDataValueHelper }
class operator TDGJsonDataValueHelper.Implicit(const Value: string): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtString;
  Result.FData.FValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): string;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.Value
  else
    case Value.FData.FTyp of
      jdtString:
        Result := Value.FData.FValue;
      jdtInt:
        Result := IntToStr(Value.FData.FIntValue);
      jdtLong:
        Result := IntToStr(Value.FData.FLongValue);
      jdtULong:
        Result := UIntToStr(Value.FData.FULongValue);
      jdtFloat:
        Result := FloatToStr(Value.FData.FFloatValue, JSONFormatSettings);
      jdtDateTime:
        Result := TDGJsonBaseObject.DateTimeToJSON(Value.FData.FDateTimeValue, DGJsonSerializationConfig.UseUtcTime);
      jdtUtcDateTime:
        Result := TDGJsonBaseObject.UtcDateTimeToJSON(Value.FData.FDateTimeValue);
      jdtBool:
        if Value.FData.FBoolValue then
          Result := sTrue
        else
          Result := sFalse;
    else
      Result := '';
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Integer): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtInt;
  Result.FData.FIntValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): Integer;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.IntValue
  else
    case Value.FData.FTyp of
      jdtString:
        Result := StrToIntDef(Value.FData.FValue, 0);
      jdtInt:
        Result := Value.FData.FIntValue;
      jdtLong:
        Result := Value.FData.FLongValue;
      jdtULong:
        Result := Value.FData.FULongValue;
      jdtFloat:
        Result := Trunc(Value.FData.FFloatValue);
      jdtDateTime, jdtUtcDateTime:
        Result := Trunc(Value.FData.FDateTimeValue);
      jdtBool:
        Result := Ord(Value.FData.FBoolValue);
    else
      Result := 0;
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Int64): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtLong;
  Result.FData.FLongValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): Int64;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.LongValue
  else
    case Value.FData.FTyp of
      jdtString:
        Result := StrToInt64Def(Value.FData.FValue, 0);
      jdtInt:
        Result := Value.FData.FIntValue;
      jdtLong:
        Result := Value.FData.FLongValue;
      jdtULong:
        Result := Value.FData.FULongValue;
      jdtFloat:
        Result := Trunc(Value.FData.FFloatValue);
      jdtDateTime, jdtUtcDateTime:
        Result := Trunc(Value.FData.FDateTimeValue);
      jdtBool:
        Result := Ord(Value.FData.FBoolValue);
    else
      Result := 0;
    end;
end;

//class operator TJsonDataValueHelper.Implicit(const Value: UInt64): TJsonDataValueHelper;
//begin
//  Result.FData.FName := '';
//  Result.FData.FNameResolver := nil;
//  Result.FData.FIntern := nil;
//  {$IFDEF AUTOREFCOUNT}
//  if Result.FData.FObj <> nil then
//    Result.FData.FObj := nil;
//  {$ENDIF AUTOREFCOUNT}
//  Result.FData.FTyp := jdtULong;
//  Result.FData.FULongValue := Value;
//end;
//
//class operator TJsonDataValueHelper.Implicit(const Value: TJsonDataValueHelper): UInt64;
//begin
//  if Value.FData.FIntern <> nil then
//    Result := Value.FData.FIntern.LongValue
//  else
//    case Value.FData.FTyp of
//      jdtString:
//        Result := StrToInt64Def(Value.FData.FValue, 0);
//      jdtInt:
//        Result := Value.FData.FIntValue;
//      jdtLong:
//        Result := Value.FData.FLongValue;
//      jdtULong:
//        Result := Value.FData.FULongValue;
//      jdtFloat:
//        Result := Trunc(Value.FData.FFloatValue);
//      jdtDateTime, jdtUtcDateTime:
//        Result := Trunc(Value.FData.FDateTimeValue);
//      jdtBool:
//        Result := Ord(Value.FData.FBoolValue);
//    else
//      Result := 0;
//    end;
//end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Double): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtFloat;
  Result.FData.FFloatValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): Double;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.FloatValue
  else
    case Value.FData.FTyp of
      jdtString:
        Result := StrToFloat(Value.FData.FValue, JSONFormatSettings);
      jdtInt:
        Result := Value.FData.FIntValue;
      jdtLong:
        Result := Value.FData.FLongValue;
      jdtULong:
        Result := Value.FData.FULongValue;
      jdtFloat:
        Result := Value.FData.FFloatValue;
      jdtDateTime, jdtUtcDateTime:
        Result := Value.FData.FDateTimeValue;
      jdtBool:
        Result := Ord(Value.FData.FBoolValue);
    else
      Result := 0;
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Extended): TDGJsonDataValueHelper;  // same that double
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtFloat;
  Result.FData.FFloatValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): Extended;  // same that double
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.FloatValue
  else
    case Value.FData.FTyp of
      jdtString:
        Result := StrToFloat(Value.FData.FValue, JSONFormatSettings);
      jdtInt:
        Result := Value.FData.FIntValue;
      jdtLong:
        Result := Value.FData.FLongValue;
      jdtULong:
        Result := Value.FData.FULongValue;
      jdtFloat:
        Result := Value.FData.FFloatValue;
      jdtDateTime, jdtUtcDateTime:
        Result := Value.FData.FDateTimeValue;
      jdtBool:
        Result := Ord(Value.FData.FBoolValue);
    else
      Result := 0;
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDateTime): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtDateTime;
  Result.FData.FDateTimeValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): TDateTime;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.DateTimeValue
  else
    case Value.FData.FTyp of
      jdtString:
        Result := TDGJsonBaseObject.JSONToDateTime(Value.FData.FValue);
      jdtInt:
        Result := Value.FData.FIntValue;
      jdtLong:
        Result := Value.FData.FLongValue;
      jdtULong:
        Result := Value.FData.FULongValue;
      jdtFloat:
        Result := Value.FData.FFloatValue;
      jdtDateTime:
        Result := Value.FData.FDateTimeValue;
      jdtUtcDateTime:
        Result := UtcDateTimeToLocalDateTime(Value.FData.FDateTimeValue);
      jdtBool:
        Result := Ord(Value.FData.FBoolValue);
    else
      Result := 0;
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Boolean): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtBool;
  Result.FData.FBoolValue := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): Boolean;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.BoolValue
  else
    case Value.FData.FTyp of
      jdtString:
        Result := Value.FData.FValue = 'true';
      jdtInt:
        Result := Value.FData.FIntValue <> 0;
      jdtLong:
        Result := Value.FData.FLongValue <> 0;
      jdtULong:
        Result := Value.FData.FULongValue <> 0;
      jdtFloat:
        Result := Value.FData.FFloatValue <> 0;
      jdtDateTime, jdtUtcDateTime:
        Result := Value.FData.FDateTimeValue <> 0;
      jdtBool:
        Result := Value.FData.FBoolValue;
    else
      Result := False;
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonArray): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FValue <> '' then
    Result.FData.FValue := '';
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtArray;
  Result.FData.FObj := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): TDGJsonArray;
begin
  Value.ResolveName;
  if Value.FData.FIntern <> nil then
  begin
    if Value.FData.FIntern.FTyp = jdtNone then
      Value.FData.FIntern.ArrayValue := TDGJsonArray.Create;
    Result := Value.FData.FIntern.ArrayValue;
  end
  else if Value.FData.FTyp = jdtArray then
    Result := TDGJsonArray(Value.FData.FObj)
  else
    Result := nil;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonObject): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FValue <> '' then
    Result.FData.FValue := '';
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtObject;
  Result.FData.FObj := Value;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): TDGJsonObject;
begin
  Value.ResolveName;
  if Value.FData.FIntern <> nil then
  begin
    if Value.FData.FIntern.FTyp = jdtNone then
      Value.FData.FIntern.ObjectValue := TDGJsonObject.Create;
    Result := Value.FData.FIntern.ObjectValue;
  end
  else if Value.FData.FTyp = jdtObject then
    Result := TDGJsonObject(Value.FData.FObj)
  else
    Result := nil;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Pointer): TDGJsonDataValueHelper;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FValue <> '' then
    Result.FData.FValue := '';
  {$ENDIF AUTOREFCOUNT}
  Result.FData.FTyp := jdtObject;
  Result.FData.FObj := nil;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: TDGJsonDataValueHelper): Variant;
begin
  if Value.FData.FIntern <> nil then
    Result := Value.FData.FIntern.VariantValue
  else
    case Value.FData.FTyp of
      jdtNone:
        Result := Unassigned;
      jdtString:
        Result := Value.FData.FValue;
      jdtInt:
        Result := Value.FData.FIntValue;
      jdtLong:
        Result := Value.FData.FLongValue;
      jdtULong:
        Result := Value.FData.FULongValue;
      jdtFloat:
        Result := Value.FData.FFloatValue;
      jdtDateTime:
        Result := Value.FData.FDateTimeValue;
      jdtUtcDateTime:
        Result := UtcDateTimeToLocalDateTime(Value.FData.FDateTimeValue); // Variant is local time
      jdtBool:
        Result := Value.FData.FBoolValue;
      jdtArray:
        ErrorUnsupportedVariantType(varArray);
      jdtObject:
        if Value.FData.FObj = nil then
          Result := Null
        else
          ErrorUnsupportedVariantType(varObject);
    else
      ErrorUnsupportedVariantType(varAny);
    end;
end;

class operator TDGJsonDataValueHelper.Implicit(const Value: Variant): TDGJsonDataValueHelper;
var
  LTyp: TDGJsonDataType;
begin
  Result.FData.FName := '';
  Result.FData.FNameResolver := nil;
  Result.FData.FIntern := nil;
  {$IFDEF AUTOREFCOUNT}
  if Result.FData.FObj <> nil then
    Result.FData.FObj := nil;
  {$ENDIF AUTOREFCOUNT}
  LTyp := VarTypeToJsonDataType(VarType(Value));
  if LTyp <> jdtNone then
  begin
    Result.FData.FTyp := LTyp;
    case LTyp of
      jdtString:
        string(Result.FData.FValue) := Value;
      jdtInt:
        Result.FData.FIntValue := Value;
      jdtLong:
        Result.FData.FLongValue := Value;
      jdtULong:
        Result.FData.FULongValue := Value;
      jdtFloat:
        Result.FData.FFloatValue := Value;
      jdtDateTime:
        Result.FData.FDateTimeValue := Value;
      jdtBool:
        Result.FData.FBoolValue := Value;
    end;
  end;
end;

function TDGJsonDataValueHelper.GetValue: string;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetValue(const Value: string);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.Value := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetIntValue: Integer;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetIntValue(const Value: Integer);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.IntValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetLongValue: Int64;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetLongValue(const Value: Int64);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.LongValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetULongValue: UInt64;
begin
//  Result := Self;
  // copied from UInt64 implicit operator
  if FData.FIntern <> nil then
    Result := FData.FIntern.LongValue
  else
    case FData.FTyp of
      jdtString:
        Result := StrToInt64Def(FData.FValue, 0);
      jdtInt:
        Result := FData.FIntValue;
      jdtLong:
        Result := FData.FLongValue;
      jdtULong:
        Result := FData.FULongValue;
      jdtFloat:
        Result := Trunc(FData.FFloatValue);
      jdtDateTime, jdtUtcDateTime:
        Result := Trunc(FData.FDateTimeValue);
      jdtBool:
        Result := Ord(FData.FBoolValue);
    else
      Result := 0;
    end;
end;

procedure TDGJsonDataValueHelper.SetULongValue(const Value: UInt64);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.ULongValue := Value
  else
  begin
    //Self := Value;
    // copied from UInt64 implicit operator
    FData.FName := '';
    FData.FNameResolver := nil;
    FData.FIntern := nil;
    {$IFDEF AUTOREFCOUNT}
    if FData.FObj <> nil then
      FData.FObj := nil;
    {$ENDIF AUTOREFCOUNT}
    FData.FTyp := jdtLong;
    FData.FLongValue := Value;
  end;
end;

function TDGJsonDataValueHelper.GetFloatValue: Double;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetFloatValue(const Value: Double);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.FloatValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetDateTimeValue: TDateTime;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetDateTimeValue(const Value: TDateTime);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.DateTimeValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetUtcDateTimeValue: TDateTime;
begin
  if FData.FIntern <> nil then
    Result := FData.FIntern.UtcDateTimeValue
  else
    case FData.FTyp of
      jdtString:
        Result := TDGJsonBaseObject.JSONToDateTime(FData.FValue, False);
      jdtInt:
        Result := FData.FIntValue;
      jdtLong:
        Result := FData.FLongValue;
      jdtULong:
        Result := FData.FULongValue;
      jdtFloat:
        Result := FData.FFloatValue;
      jdtDateTime:
        Result := LocalDateTimeToUtcDateTime(FData.FDateTimeValue);
      jdtUtcDateTime:
        Result := FData.FDateTimeValue;
      jdtBool:
        Result := Ord(FData.FBoolValue);
    else
      Result := 0;
    end;
end;

procedure TDGJsonDataValueHelper.SetUtcDateTimeValue(const Value: TDateTime);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.UtcDateTimeValue := Value
  else
  begin
    FData.FName := '';
    FData.FNameResolver := nil;
    FData.FIntern := nil;
    {$IFDEF AUTOREFCOUNT}
    if FData.FObj <> nil then
      FData.FObj := nil;
    {$ENDIF AUTOREFCOUNT}
    FData.FTyp := jdtUtcDateTime;
    FData.FDateTimeValue := Value;
  end;
end;

function TDGJsonDataValueHelper.GetBoolValue: Boolean;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetBoolValue(const Value: Boolean);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.BoolValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetArrayValue: TDGJsonArray;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetArrayValue(const Value: TDGJsonArray);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.ArrayValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetObjectValue: TDGJsonObject;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetObjectValue(const Value: TDGJsonObject);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.ObjectValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetVariantValue: Variant;
begin
  Result := Self;
end;

procedure TDGJsonDataValueHelper.SetVariantValue(const Value: Variant);
begin
  ResolveName;
  if FData.FIntern <> nil then
    FData.FIntern.VariantValue := Value
  else
    Self := Value;
end;

function TDGJsonDataValueHelper.GetTyp: TDGJsonDataType;
begin
  if FData.FIntern <> nil then
    Result := FData.FIntern.Typ
  else
    Result := FData.FTyp;
end;

function TDGJsonDataValueHelper.IsNull: Boolean;
begin
  if FData.FIntern <> nil then
    Result := FData.FIntern.IsNull
  else
  begin
    case FData.FTyp of
      jdtNone:
        Result := True;
      jdtObject:
        Result := FData.FObj = nil;
    else
      Result := False;
    end;
  end;
end;

class procedure TDGJsonDataValueHelper.SetInternValue(Item: PDGJsonDataValue;
  const Value: TDGJsonDataValueHelper);
begin
  Value.ResolveName;
  if Value.FData.FIntern <> nil then
  begin
    Item.Clear;
    TDGJsonBaseObject.InternInitAndAssignItem(Item, Value.FData.FIntern); // clones arrays and objects
  end
  else
  begin
    case Value.FData.FTyp of
      jdtString:
        Item.Value := Value.FData.FValue;
      jdtInt:
        Item.IntValue := Value.FData.FIntValue;
      jdtLong:
        Item.LongValue := Value.FData.FLongValue;
      jdtULong:
        Item.ULongValue := Value.FData.FULongValue;
      jdtFloat:
        Item.FloatValue := Value.FData.FFloatValue;
      jdtDateTime, jdtUtcDateTime:
        Item.DateTimeValue := Value.FData.FDateTimeValue;
      jdtBool:
        Item.BoolValue := Value.FData.FBoolValue;
      jdtArray:
        Item.ArrayValue := TDGJsonArray(Value.FData.FObj);
      jdtObject:
        Item.ObjectValue := TDGJsonObject(Value.FData.FObj);
    else
      Item.Clear;
    end;
  end;
end;

function TDGJsonDataValueHelper.GetArrayItem(Index: Integer): TDGJsonDataValueHelper;
begin
  Result := ArrayValue.Values[Index];
end;

function TDGJsonDataValueHelper.GetArrayCount: Integer;
begin
  Result := ArrayValue.Count;
end;

procedure TDGJsonDataValueHelper.ResolveName;
begin
  if (FData.FIntern = nil) and (FData.FNameResolver <> nil) then
  begin
    FData.FIntern := FData.FNameResolver.RequireItem(FData.FName);
    FData.FNameResolver := nil;
    FData.FName := '';
  end;
end;

function TDGJsonDataValueHelper.GetObjectString(const Name: string): string;
begin
  Result := ObjectValue.S[Name];
end;

function TDGJsonDataValueHelper.GetObjectInt(const Name: string): Integer;
begin
  Result := ObjectValue.I[Name];
end;

function TDGJsonDataValueHelper.GetObjectLong(const Name: string): Int64;
begin
  Result := ObjectValue.L[Name];
end;

function TDGJsonDataValueHelper.GetObjectULong(const Name: string): UInt64;
begin
  Result := ObjectValue.U[Name];
end;

function TDGJsonDataValueHelper.GetObjectFloat(const Name: string): Double;
begin
  Result := ObjectValue.F[Name];
end;

function TDGJsonDataValueHelper.GetObjectDateTime(const Name: string): TDateTime;
begin
  Result := ObjectValue.D[Name];
end;

function TDGJsonDataValueHelper.GetObjectUtcDateTime(const Name: string): TDateTime;
begin
  Result := ObjectValue.DUtc[Name];
end;

function TDGJsonDataValueHelper.GetObjectBool(const Name: string): Boolean;
begin
  Result := ObjectValue.B[Name];
end;

function TDGJsonDataValueHelper.GetArray(const Name: string): TDGJsonArray;
begin
  Result := ObjectValue.A[Name];
end;

{$IFDEF BCB}
function TJsonDataValueHelper.GetObj(const Name: string): TJsonDataValueHelper;
begin
  Result := ObjectValue.Values[Name];
end;
{$ELSE}
function TDGJsonDataValueHelper.GetObject(const Name: string): TDGJsonDataValueHelper;
begin
  Result := ObjectValue.Values[Name];
end;
{$ENDIF BCB}

function TDGJsonDataValueHelper.GetObjectVariant(const Name: string): Variant;
begin
  Result := ObjectValue.Values[Name];
end;

procedure TDGJsonDataValueHelper.SetObjectString(const Name, Value: string);
begin
  ObjectValue.S[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectInt(const Name: string; const Value: Integer);
begin
  ObjectValue.I[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectLong(const Name: string; const Value: Int64);
begin
  ObjectValue.L[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectULong(const Name: string; const Value: UInt64);
begin
  ObjectValue.U[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectFloat(const Name: string; const Value: Double);
begin
  ObjectValue.F[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectDateTime(const Name: string; const Value: TDateTime);
begin
  ObjectValue.D[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectUtcDateTime(const Name: string; const Value: TDateTime);
begin
  ObjectValue.DUtc[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectBool(const Name: string; const Value: Boolean);
begin
  ObjectValue.B[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetArray(const Name: string; const Value: TDGJsonArray);
begin
  ObjectValue.A[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObject(const Name: string; const Value: TDGJsonDataValueHelper);
begin
  ObjectValue.Values[Name] := Value;
end;

procedure TDGJsonDataValueHelper.SetObjectVariant(const Name: string; const Value: Variant);
begin
  ObjectValue.Values[Name] := Value;
end;

function TDGJsonDataValueHelper.GetObjectPath(const Name: string): TDGJsonDataValueHelper;
begin
  Result := ObjectValue.Path[Name];
end;

procedure TDGJsonDataValueHelper.SetObjectPath(const Name: string; const Value: TDGJsonDataValueHelper);
begin
  ObjectValue.Path[Name] := Value;
end;

{ TEncodingStrictAccess }
function TEncodingStrictAccess.GetByteCountEx(Chars: PChar; CharCount: Integer): Integer;
begin
  Result := GetByteCount(Chars, CharCount);
end;

function TEncodingStrictAccess.GetBytesEx(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer;
begin
  Result := GetBytes(Chars, CharCount, Bytes, ByteCount);
end;

function TEncodingStrictAccess.GetCharCountEx(Bytes: PByte; ByteCount: Integer): Integer;
begin
  Result := GetCharCount(Bytes, ByteCount);
end;

function TEncodingStrictAccess.GetCharsEx(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer;
begin
  Result := GetChars(Bytes, ByteCount, Chars, CharCount);
end;

{ TJsonOutputWriter.TJsonStringBuilder }
procedure TDGJsonOutputWriter.TJsonStringBuilder.Init;
begin
  FLen := 0;
  FCapacity := 0;
  FData := nil;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Done;
var
  P: PStrRec;
begin
  if FData <> nil then
  begin
    P := PStrRec(PByte(FData) - SizeOf(TStrRec));
    FreeMem(P);
  end;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.DoneConvertToString(var S: string);
var
  StrP: PStrRec;
  P: PChar;
begin
  S := '';
  if FData <> nil then
  begin
    // Release the unused memory and terminate the string with a #0. The result is that we have a
    // native string that is exactly the same as if it was allocated by System.@NewUnicodeString.
    StrP := PStrRec(PByte(FData) - SizeOf(TStrRec));
    if Len = 0 then
      FreeMem(StrP)
    else
    begin
      if Len <> FCapacity then
        ReallocMem(Pointer(StrP), SizeOf(TStrRec) + (Len + 1) * SizeOf(Char)); // allocate +1 char for the #0
      // Set the string's length
      StrP.Length := Len;
      P := PChar(PByte(StrP) + SizeOf(TStrRec));
      P[Len] := #0;
      Pointer(S) := P; // keep the RefCnt=1
    end;
  end;
end;

function TDGJsonOutputWriter.TJsonStringBuilder.FlushToBytes(var Bytes: PByte; var Size: NativeInt; Encoding: TEncoding): NativeInt;
begin
  if FLen > 0 then
  begin
    // Use the "strict protected" methods that use PChar instead of TCharArray what allows us to
    // use FData directly without converting it to a dynamic TCharArray (and skipping the sanity
    // checks)
    Result := TEncodingStrictAccess(Encoding).GetByteCountEx(FData, FLen);
    if Result > 0 then
    begin
      if Result > Size then
      begin
        Size := (Result + 4095) and not 4095;
        ReallocMem(Bytes, Size);
      end;
      TEncodingStrictAccess(Encoding).GetBytesEx(FData, FLen, Bytes, Result);
    end;
    FLen := 0; // "clear" the buffer but don't release the memory
  end
  else
    Result := 0;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.FlushToMemoryStream(Stream: TMemoryStream; Encoding: TEncoding);
var
  L: Integer;
  Idx, NewSize: NativeInt;
begin
  if FLen > 0 then
  begin
    // Use the "strict protected" methods that use PChar instead of TCharArray what allows us to
    // use FData directly without converting it to a dynamic TCharArray (and skipping the sanity
    // checks)
    L := TEncodingStrictAccess(Encoding).GetByteCountEx(FData, FLen);
    if L > 0 then
    begin
      // Directly convert into the TMemoryStream.Memory buffer
      Idx := Stream.Position;
      NewSize := Idx + L;
      if NewSize > TMemoryStreamAccess(Stream).Capacity then
        TMemoryStreamAccess(Stream).Capacity := NewSize;
      TEncodingStrictAccess(Encoding).GetBytesEx(FData, FLen, @PByte(Stream.Memory)[Idx], L);
      TMemoryStreamAccess(Stream).SetPointer(Stream.Memory, NewSize);
      Stream.Position := NewSize;
    end;
  end;
  FLen := 0; // "clear" the buffer but don't release the memory
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Grow(MinLen: Integer);
var
  C: Integer;
  StrP: PStrRec;
begin
  C := FCapacity;
  C := C * 2;
  if MinLen < 256 then // begin with a 256 char buffer
    MinLen := 256;
  {$IFNDEF CPUX64}
  if C > 256 * 1024 * 1024 then
  begin
    // Memory fragmentation can become a problem, so allocate only the amount of memory that
    // is needed
    C := FCapacity;
    C := C + (C div 3);
    if C < MinLen then
      C := MinLen;
  end
  else
  {$ENDIF ~CPUX64}
  if C < MinLen then
    C := MinLen;
  FCapacity := C;
  if FData <> nil then
  begin
    StrP := Pointer(PByte(FData) - SizeOf(TStrRec));
    ReallocMem(StrP, SizeOf(TStrRec) + (C + 1) * SizeOf(Char)); // allocate +1 char for the #0 that DoneToString() adds
  end
  else
  begin
    // Build the buffer with the StrRec header so it can be easily mapped to a "native string" in
    // DoneToString.
    GetMem(Pointer(StrP), SizeOf(TStrRec) + (C + 1) * SizeOf(Char)); // allocate +1 char for the #0 that DoneToString() adds
    StrP.CodePage := Word(DefaultUnicodeCodePage);
    StrP.ElemSize := SizeOf(Char);
    StrP.RefCnt := 1;
    StrP.Length := 0; // DoneToString set the correct value
  end;
  FData := PChar(PByte(StrP) + SizeOf(TStrRec));
end;

function TDGJsonOutputWriter.TJsonStringBuilder.Append(const S: string): PJsonStringBuilder;
var
  L, LLen: Integer;
begin
  LLen := FLen;
  L := Length(S);
  if L > 0 then
  begin
    if LLen + L >= FCapacity then
      Grow(LLen + L);
    case L of
      1: FData[LLen] := PChar(Pointer(S))^;
      2: PLongWord(@FData[LLen])^ := PLongWord(Pointer(S))^;
    else
      Move(PChar(Pointer(S))[0], FData[LLen], L * SizeOf(Char));
    end;
    FLen := LLen + L;
  end;
  Result := @Self;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Append(P: PChar; Len: Integer);
var
  LLen: Integer;
begin
  LLen := FLen;
  if Len > 0 then
  begin
    if LLen + Len >= FCapacity then
      Grow(LLen + Len);
    case Len of
      1: FData[LLen] := P^;
      2: PLongWord(@FData[LLen])^ := PLongWord(P)^;
    else
      Move(P[0], FData[LLen], Len * SizeOf(Char));
    end;
    FLen := LLen + Len;
  end;
end;

function TDGJsonOutputWriter.TJsonStringBuilder.Append2(const S1: string; S2: PChar; S2Len: Integer): PJsonStringBuilder;
var
  L, S1Len, LLen: Integer;
begin
  LLen := FLen;
  S1Len := Length(S1);
  L := S1Len + S2Len;
  if LLen + L >= FCapacity then
    Grow(LLen + L);
  case S1Len of
    0: ;
    1: FData[LLen] := PChar(Pointer(S1))^;
    2: PLongWord(@FData[LLen])^ := PLongWord(Pointer(S1))^;
  else
    Move(PChar(Pointer(S1))[0], FData[LLen], S1Len * SizeOf(Char));
  end;
  Inc(LLen, S1Len);
  case S2Len of
    0: ;
    1: FData[LLen] := S2^;
    2: PLongWord(@FData[LLen])^ := PLongWord(Pointer(S2))^;
  else
    Move(S2[0], FData[LLen], S2Len * SizeOf(Char));
  end;
  FLen := LLen + S2Len;
  Result := @Self;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Append2(Ch1: Char; Ch2: Char);
var
  LLen: Integer;
begin
  LLen := FLen;
  if LLen + 2 >= FCapacity then
    Grow(2);
  FData[LLen] := Ch1;
  FData[LLen + 1] := Ch2;
  FLen := LLen + 2;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Append3(Ch1: Char; const S2, S3: string);
var
  L, S2Len, S3Len, LLen: Integer;
begin
  LLen := FLen;
  S2Len := Length(S2);
  S3Len := Length(S3);
  L := 1 + S2Len + S3Len;
  if LLen + L >= FCapacity then
    Grow(LLen + L);
  FData[LLen] := Ch1;
  Inc(LLen);
  case S2Len of
    0: ;
    1: FData[LLen] := PChar(Pointer(S2))^;
    2: PLongWord(@FData[LLen])^ := PLongWord(Pointer(S2))^;
  else
    Move(PChar(Pointer(S2))[0], FData[LLen], S2Len * SizeOf(Char));
  end;
  Inc(LLen, S2Len);
  case S3Len of
    1: FData[LLen] := PChar(Pointer(S3))^;
    2: PLongWord(@FData[LLen])^ := PLongWord(Pointer(S3))^;
  else
    Move(PChar(Pointer(S3))[0], FData[LLen], S3Len * SizeOf(Char));
  end;
  FLen := LLen + S3Len;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Append3(Ch1: Char; const P2: PChar; P2Len: Integer; Ch3: Char);
var
  L, LLen: Integer;
begin
  LLen := FLen;
  L := 2 + P2Len;
  if LLen + L >= FCapacity then
    Grow(LLen + L);
  FData[LLen] := Ch1;
  Inc(LLen);
  case P2Len of
    0: ;
    1: FData[LLen] := P2^;
    2: PLongWord(@FData[LLen])^ := PLongWord(P2)^;
  else
    Move(P2[0], FData[LLen], P2Len * SizeOf(Char));
  end;
  Inc(LLen, P2Len);
  FData[LLen] := Ch1;
  FLen := LLen + 1;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.Append3(Ch1: Char; const S2: string; Ch3: Char);
begin
  Append3(Ch1, PChar(Pointer(S2)), Length(S2), Ch3);
end;
procedure TDGJsonOutputWriter.TJsonStringBuilder.FlushToStringBuffer(var Buffer: TJsonStringBuilder);
begin
  Buffer.Append(FData, FLen);
  FLen := 0;
end;

procedure TDGJsonOutputWriter.TJsonStringBuilder.FlushToString(var S: string);
begin
  SetString(S, FData, FLen);
  FLen := 0;
end;

{ TJsonUTF8StringStream }
{$IFDEF SUPPORTS_UTF8STRING}
constructor TJsonUTF8StringStream.Create;
begin
  inherited Create;
  SetPointer(nil, 0);
end;
function TJsonUTF8StringStream.Realloc(var NewCapacity: {$IF Defined(USE_NATIVEINT)}NativeInt{$ELSE}Longint{$IFEND}): Pointer;
var
  L: {$IF Defined(USE_NATIVEINT)}NativeInt{$ELSE}Longint{$IFEND};
begin
  if NewCapacity <> Capacity then
  begin
    if NewCapacity = 0 then
      FDataString := ''
    else
    begin
      L := Length(FDataString) * 2;
      {$IFNDEF CPUX64}
      if L > 256 * 1024 * 1024 then
      begin
        // Memory fragmentation can become a problem, so allocate only the amount of memory that
        // is needed
        L := NewCapacity;
      end
      else
      {$ENDIF ~CPUX64}
      if L < NewCapacity then
        L := NewCapacity;
      NewCapacity := L;
      SetLength(FDataString, L);
    end;
  end;
  Result := Pointer(FDataString);
end;
{$ENDIF SUPPORTS_UTF8STRING}

{ TJsonBytesStream }
constructor TJsonBytesStream.Create;
begin
  inherited Create;
  SetPointer(nil, 0);
end;

function TJsonBytesStream.Realloc(var NewCapacity: {$IF Defined(USE_NATIVEINT)}NativeInt{$ELSE}Longint{$IFEND}): Pointer;
var
  L: {$IF Defined(USE_NATIVEINT)}NativeInt{$ELSE}Longint{$IFEND};
begin
  if NewCapacity <> Capacity then
  begin
    if NewCapacity = 0 then
      FBytes := nil
    else
    begin
      L := Length(FBytes) * 2;
      {$IFNDEF CPUX64}
      if L > 256 * 1024 * 1024 then
      begin
        // Memory fragmentation can become a problem, so allocate only the amount of memory that
        // is needed
        L := NewCapacity;
      end
      else
      {$ENDIF ~CPUX64}
      if L < NewCapacity then
        L := NewCapacity;
      NewCapacity := L;
      ByteArraySetLengthUninit(FBytes, L);
    end;
  end;
  Result := Pointer(FBytes);
end;

initialization
  {$IFDEF USE_NAME_STRING_LITERAL}
  InitializeJsonMemInfo;
  {$ENDIF USE_NAME_STRING_LITERAL}
  {$IFDEF MSWINDOWS}
    {$IFDEF SUPPORT_WINDOWS2000}
  TzSpecificLocalTimeToSystemTime := GetProcAddress(GetModuleHandle(kernel32), PAnsiChar('TzSpecificLocalTimeToSystemTime'));
  if not Assigned(TzSpecificLocalTimeToSystemTime) then
    TzSpecificLocalTimeToSystemTime := TzSpecificLocalTimeToSystemTimeWin2000;
    {$ENDIF SUPPORT_WINDOWS2000}
  {$ENDIF MSWINDOWS}
  // Make sTrue and sFalse a mutable string (RefCount<>-1) so that UStrAsg doesn't always
  // create a new string.
  UniqueString(sTrue);
  UniqueString(sFalse);
  JSONFormatSettings.DecimalSeparator := '.';
end.
