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

unit utexture_parallax;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

type
  { TExample }
  TExample = class(TBaseTemplate)
  protected
    FTexture: array[0..3] of TTexture;
    FSpeed: array[0..3] of Single;
    FPos: array[0..3] of TVector;
  public
    procedure OnSetSettings; override;
    procedure OnStartup; override;
    procedure OnShutdown; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
    procedure OnRenderHud; override;
  end;

implementation

{ TExample }
procedure TExample.OnSetSettings;
begin
  inherited;

  Settings.WindowTitle := Settings.WindowTitle + 'Texture: Parallax';
end;

procedure TExample.OnStartup;
begin
  inherited;

  // Create textures
  FTexture[0] := TTexture.LoadTexture(Archive, 'arc/images/space.png', nil);
  FTexture[1] := TTexture.LoadTexture(Archive, 'arc/images/nebula.png', @BLACK);
  FTexture[2] := TTexture.LoadTexture(Archive, 'arc/images/spacelayer1.png', @BLACK);
  FTexture[3] := TTexture.LoadTexture(Archive, 'arc/images/spacelayer2.png', @BLACK);

  // Set bitmap speeds
  FSpeed[0] := 0.3 * 30;
  FSpeed[1] := 0.5 * 30;
  FSpeed[2] := 1.0 * 30;
  FSpeed[3] := 2.0 * 30;

  // Clear pos
  FPos[0].Clear;
  FPos[1].Clear;
  FPos[2].Clear;
  FPos[3].Clear;
end;

procedure TExample.OnShutdown;
begin
  // Free textures
  FreeNilObject(FTexture[3]);
  FreeNilObject(FTexture[2]);
  FreeNilObject(FTexture[1]);
  FreeNilObject(FTexture[0]);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
var
  I: Integer;
begin
  inherited;

  // Update texture layers
  for I := Low(FTexture) to High(FTexture) do
  begin
    FPos[I].Y := FPos[I].Y + (FSpeed[I] * aDeltaTime);
  end;
end;

procedure TExample.OnRender;
var
  I: Integer;
  LBlendMode: TBlendMode;
begin
  inherited;

  // Render texture layers
  for I := Low(FTexture) to High(FTexture) do
  begin
    case I of
      0:   LBlendMode := bmNone;
      1:   LBlendMode := bmAdd;
      2,3: LBlendMode := bmBlend;
    else
      LBlendMode := bmBlend;
    end;
    FTexture[I].RenderTiled(FPos[I].X, FPos[I].Y, WHITE, LBlendMode);
  end;
end;

procedure TExample.OnRenderHud;
begin
  inherited;

end;

end.
