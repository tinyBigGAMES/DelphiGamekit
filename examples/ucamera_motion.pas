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

unit ucamera_motion;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

const
  cSpeed = 60.0 * 3;
  cRotSpeed = 30.0 * 3;
  cZoomSpeed = 0.3;
  cMinCount = 10;
  cMaxCount = 250;
  cMinRange = -1000;
  cMaxRange = 1000;

type
  { TMyActor }
  TMyActor = class(TActor)
  protected
    FPos: TVector;
    FColor: TColor;
    FCamera: TCamera;
    FTexture: TTexture;
    FOrigin: TPoint;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
  end;

  { TExample }
  TExample = class(TBaseTemplate)
  protected
    FCamera: TCamera;
    FVisible: Integer;
    FTexture: TTexture;
  public
    property Camera: TCamera read FCamera;
    property Texture: TTexture read FTexture;
    property Visible: Integer read FVisible write FVisible;
    procedure OnSetSettings; override;
    procedure OnStartup; override;
    procedure OnShutdown; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
    procedure OnRenderHud; override;
    procedure Spawn;
  end;

implementation

{ TAnActor }
constructor TMyActor.Create;
var
  LR,LG,LB: Byte;
begin
  inherited;

  FCamera := TExample(Game).Camera;
  FTexture := TExample(Game).Texture;

  FPos.Assign(RandomRange(cMinRange, cMaxRange), RandomRange(cMinRange, cMaxRange));

  LR := RandomRange(1, 255);
  LG := RandomRange(1, 255);
  LB := RandomRange(1, 255);
  FColor.Make(LR, LG, LB, 255);

  FOrigin.X := 0.5;
  FOrigin.Y := 0.5;
end;

destructor TMyActor.Destroy;
begin
  inherited;
end;

procedure TMyActor.OnUpdate(const aDeltaTime: Double);
begin
end;

procedure TMyActor.OnRender;
var
  LX, LY: Single;
  LWidth, LHeight: Single;
  LAngle, LScale: Single;
begin
  LX := FPos.X;
  LY := FPos.Y;
  LWidth := FTexture.Width;
  LHeight := FTexture.Height;

  if not FCamera.WorldToScreen(LX, LY, LWidth, LHeight, LAngle, LScale, FOrigin.X, FOrigin.Y) then Exit;
  FTexture.Render(nil, LX, LY, LScale, LAngle, fmNone, @FOrigin, FColor, bmBlend);
  TExample(Game).Visible := TExample(Game).Visible + 1;
end;


{ TExample }
procedure TExample.OnSetSettings;
begin
  inherited;

  Settings.WindowTitle := Settings.WindowTitle + 'Camera: Motion';
  Settings.WindowClearColor := BLACK;
end;

procedure TExample.OnStartup;
begin
  inherited;

  FTexture := TTexture.Create;
  FTexture.Alloc(50, 50, taStreaming);

  FCamera := TCamera.Create;
  FCamera.Init(0, 0, 0, 0, Settings.WindowWidth, Settings.WindowWidth);

  Spawn;
end;

procedure TExample.OnShutdown;
begin
  FreeNilObject(FCamera);
  FreeNilObject(FTexture);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
begin
  inherited;

  if Input.KeyPressed(KEY_SPACE) then
    Spawn;

  // Move camera left/right
  if Input.KeyDown(KEY_LEFT) then
    FCamera.PosX := FCamera.PosX + (cSpeed * aDeltaTime)
  else
  if Input.KeyDown(KEY_RIGHT) then
    FCamera.PosX := FCamera.PosX - (cSpeed * aDeltaTime);

  // Move camera up/down
  if Input.KeyDown(KEY_UP) then
    FCamera.PosY := FCamera.PosY - (cSpeed * aDeltaTime)
  else
  if Input.KeyDown(KEY_DOWN) then
    FCamera.PosY := FCamera.PosY + (cSpeed * aDeltaTime);

  if Input.KeyDown(KEY_W) then
    Camera.Zoom := Camera.Zoom + (cZoomSpeed * aDeltaTime)
  else
  if Input.KeyDown(KEY_S) then
    Camera.Zoom := Camera.Zoom - (cZoomSpeed * aDeltaTime);

  if Input.KeyDown(KEY_A) then
    Camera.Angle := Camera.Angle + (cRotSpeed * aDeltaTime)
  else
  if Input.KeyDown(KEY_D) then
    Camera.Angle := Camera.Angle - (cRotSpeed * aDeltaTime);


  if Input.KeyDown(KEY_R) then
  begin
    Camera.PosX := 0;
    Camera.PosY := 0;
    Camera.Angle := 0;
    Camera.Zoom := 1;
  end;

end;

procedure TExample.OnRender;
begin
  FCamera.Active := True;
  FVisible := 0;

  inherited;

  FCamera.Active := False;
end;

procedure TExample.OnRenderHud;
begin
  inherited;
  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('R', 'Reset'), []);
  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('Space', 'Spawn'), []);

  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('Left/Right', 'Cam horizontal'), []);
  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('Up/Down', 'Cam vertical'), []);
  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('W/S', 'Cam zoom'), []);
  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('A/D', 'Cam rotate'), []);

  Hud.Text(FDefaultFont, YELLOW, haLeft, Hud.TextItem('Zoom', '%3.2f', ' '), [FCamera.Zoom]);
  Hud.Text(FDefaultFont, YELLOW, haLeft, Hud.TextItem('Angle', '%3.2f', ' '), [FCamera.Angle]);
  Hud.Text(FDefaultFont, YELLOW, haLeft, Hud.TextItem('Total', '%d', ' '), [Scene.Lists[0].Count]);
  Hud.Text(FDefaultFont, YELLOW, haLeft, Hud.TextItem('Visible', '%d', ' '), [FVisible]);
end;

procedure TExample.Spawn;
var
  I, LCount: Integer;
begin
  Scene.ClearAll;
  LCount := RandomRange(cMinCount, cMaxCount);
  for I := 1 to LCount do
    Scene.Lists[0].Add(TMyActor.Create);
end;

end.
