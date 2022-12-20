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
*****************************************************************************)

unit uDGTools;

interface

uses
  System.SysUtils,
  System.IOUtils,
  DelphiGamekit;

type

  { TDGTools }
  TDGTools = class(TGame)
  private
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure ShowHeader;
    procedure ShowUsage;
    procedure Run; override;
    procedure Archive;
    procedure Video;
    procedure Audio;
  end;

procedure RunDGTools;

implementation

procedure RunDGTools;

begin
  RunGame(TDGTools);
end;

{ TDGTools }
constructor TDGTools.Create;
begin
  inherited;
end;

destructor TDGTools.Destroy;
begin
  inherited;
end;

procedure TDGTools.ShowHeader;
begin
  PrintLn;
  PrintLn('%s v%s', [GetVersionInfo(HInstance, 'FileDescription'), GetSemVerStr(HInstance)]);
  PrintLn('%s', [GetVersionInfo(HInstance, 'LegalCopyright')]);
  PrintLn('%s', [GetVersionInfo(HInstance, 'LegalTrademarks')]);
end;

procedure TDGTools.ShowUsage;
begin
  PrintLn;
  PrintLn('Usage: DGTools <command> [options]');
  PrintLn;
  PrintLn('Commands:');
  PrintLn('  archive  [password] filename[.arc] folder    -- Build zip archive file');
  PrintLn('  video    inputfile outputfile[.mpg]          -- Convert a video file to a MPEG-1 compatable video file');
  PRintLn('  audio    inputfile outputfile[.ogg]          -- Convert a audio file to a OGG compatable audio file');
end;

procedure TDGTools.Run;
begin
  ShowHeader;

  if CmdLine.ParamExist('archive') then
    Archive
  else
  if CmdLine.ParamExist('video') then
    Video
  else
  if CmdLine.ParamExist('audio') then
    Audio
  else
    ShowUsage;

  Pause;
end;

procedure TDGTools.Archive;
var
  LPassword: string;
  LArcFolder: string;
  LArcFilename: string;
  LArchive: TArchive;
begin
  if CmdLine.Count('archive') = 3 then
    begin
      LPassword := CmdLine.Param('archive', 1);
      LArcFilename := CmdLine.Param('archive', 2);
      LArcFolder := CmdLine.Param('archive', 3);
      LPassword := RemoveQuotes(LPassword);
      LArcFolder := RemoveQuotes(LArcFolder);
      LArcFilename := RemoveQuotes(LArcFilename);
    end
  else
  if CmdLine.Count('archive') = 2 then
    begin
      LArcFilename := CmdLine.Param('archive', 2);
      LArcFolder := CmdLine.Param('archive', 3);
      LArcFolder := RemoveQuotes(LArcFolder);
      LArcFilename := RemoveQuotes(LArcFilename);
    end
  else
    begin
      ShowUsage;
      Pause;
      Exit;
    end;

  // init archive filename
  if TPath.GetExtension(LArcFilename).IsEmpty then
    LArcFilename := TPath.ChangeExtension(LArcFilename, ARCEXT);

  // check if directory exist
  if not TDirectory.Exists(LArcFolder) then
    begin
      PrintLn;
      PrintLn('Directory was not found: ', [LArcFolder]);
      ShowUsage;
      Pause;
      Exit;
    end;

  // display params
  PrintLn;
  if LPassword = '' then
    PrintLn('Password : NONE')
  else
    PrintLn('Password : %s', [LPassword]);
  PrintLn('Archive  : %s', [LArcFilename]);
  PrintLn('Directory: %s', [LArcFolder]);

  // try to build archive
  LArchive := TArchive.Create;
  try
    if LArchive.Build(LPassword, LArcFilename, LArcFolder) then
      PrintLn(LF+'Success!')
    else
      PrintLn(LF+'Failed!');
    Pause;
  finally
    FreeNilObject(LArchive);
  end;
end;

procedure TDGTools_CaptureConsoleOutput(aSender: Pointer; aLine: string);
begin
  PrintLn(aLine);
end;

procedure TDGTools.Video;
const
  cCmdLine = '%s -i "%s" -c:v mpeg1video -q:v 9 -b:v 11055k -b:a 384k -maxrate 22110k -bufsize 22110k -c:a mp2 -format mpeg "%s" -loglevel error -y';
var
  LInputFilename: string;
  LOutputFilename: string;
  LFFMpeg: string;
  LCmdLine: string;
  LExitCode: Cardinal;
begin
  if CmdLine.Count('video') <> 2 then
  begin
    PrintLn;
    PrintLn('Incorrect number of parameters');
    ShowUsage;
    Pause;
    Exit;
  end;

  LInputFilename := CmdLine.Param('video', 1);
  LInputFilename := RemoveQuotes(LInputFilename);
  if not TFile.Exists(LInputFilename) then
  begin
    PrintLn;
    PrintLn('Input file was not found: "%s"', [LInputFilename]);
    ShowUsage;
    Pause;
    Exit;
  end;

  LOutputFilename := CmdLine.Param('video', 2);
  LOutputFilename := RemoveQuotes(LOutputFilename);
  LOutputFilename := TPath.ChangeExtension(LOutputFilename, MPGEXT);
  LOutputFilename := TPath.GetFullPath(LOutputFilename);
  if not IsValidFilename(TPath.GetFilename(LOutputFilename)) then
  begin
    PrintLn;
    PrintLn('Invalid output filename: "%s"', [LOutputFilename]);
    ShowUsage;
    Pause;
    Exit;
  end;
  if not CreateDirsInPath(LOutputFilename) then
  begin
    PrintLn;
    PrintLn('Failed to create output filename path: "%s"', [TPath.GetDirectoryName(LOutputFilename)]);
    ShowUsage;
    Pause;
    Exit;
  end;

  LFFMpeg := TPath.GetDirectoryName(ParamStr(0));
  LFFMpeg := TPath.Combine(LFFMpeg, 'ffmpeg.exe');
  if not TFile.Exists(LFFMpeg) then
  begin
    PrintLn;
    PrintLn('FFMpeg.exe was not found, can not continue.');
    Pause;
    Exit;
  end;

  LCmdLine := Format(cCmdLine, [LFFMpeg, LInputFilename, LOutputFilename]);

  PrintLn;
  PrintLn('Converting "%s" to "%s"...', [TPath.GetFileName(LInputFilename), TPath.GetFileName(LOutputFilename)]);

  LExitCode := CaptureConsoleOutput('', PChar(LCmdLine), '', nil, TDGTools_CaptureConsoleOutput);

  if (LExitCode <> 0) then
    PrintLn('Failed!')
  else
    PrintLn('Success!');

  Pause;
end;

procedure TDGTools.Audio;
const
   cCmdLine = '%s -i "%s" -ar 48000 -vn -c:a libvorbis -b:a 64k "%s" -loglevel error -y';
var
  LInputFilename: string;
  LOutputFilename: string;
  LFFMpeg: string;
  LCmdLine: string;
  LExitCode: Cardinal;
begin
  if CmdLine.Count('audio') <> 2 then
  begin
    PrintLn;
    PrintLn('Incorrect number of parameters');
    ShowUsage;
    Pause;
    Exit;
  end;

  LInputFilename := CmdLine.Param('audio', 1);
  LInputFilename := RemoveQuotes(LInputFilename);
  if not TFile.Exists(LInputFilename) then
  begin
    PrintLn;
    PrintLn('Input file was not found: "%s"', [LInputFilename]);
    ShowUsage;
    Pause;
    Exit;
  end;

  LOutputFilename := CmdLine.Param('audio', 2);
  LOutputFilename := RemoveQuotes(LOutputFilename);
  LOutputFilename := TPath.ChangeExtension(LOutputFilename, OGGEXT);
  LOutputFilename := TPath.GetFullPath(LOutputFilename);
  if not IsValidFilename(TPath.GetFilename(LOutputFilename)) then
  begin
    PrintLn;
    PrintLn('Invalid output filename: "%s"', [LOutputFilename]);
    ShowUsage;
    Pause;
    Exit;
  end;
  if not CreateDirsInPath(LOutputFilename) then
  begin
    PrintLn;
    PrintLn('Failed to create output filename path: "%s"', [TPath.GetDirectoryName(LOutputFilename)]);
    ShowUsage;
    Pause;
    Exit;
  end;

  LFFMpeg := TPath.GetDirectoryName(ParamStr(0));
  LFFMpeg := TPath.Combine(LFFMpeg, 'ffmpeg.exe');
  if not TFile.Exists(LFFMpeg) then
  begin
    PrintLn;
    PrintLn('FFMpeg.exe was not found, can not continue.');
    Pause;
    Exit;
  end;

  LCmdLine := Format(cCmdLine, [LFFMpeg, LInputFilename, LOutputFilename]);

  PrintLn;
  PrintLn('Converting "%s" to "%s"...', [TPath.GetFileName(LInputFilename), TPath.GetFileName(LOutputFilename)]);

  LExitCode := CaptureConsoleOutput('', PChar(LCmdLine), '', nil, TDGTools_CaptureConsoleOutput);

  if (LExitCode <> 0) then
    PrintLn('Failed!')
  else
    PrintLn('Success!');

  Pause;
end;

end.
