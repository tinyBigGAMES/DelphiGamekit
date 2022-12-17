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

unit udemo_chainaction;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

const
  // scene
  SCN_COUNT  = 2;
  SCN_CIRCLE = 0;
  SCN_EXPLO  = 1;

  // circle
  SHRINK_FACTOR = 0.65;

  CIRCLE_SCALE = 0.125;
  CIRCLE_SCALE_SPEED   = 0.95;

  CIRCLE_EXP_SCALE_MIN = 0.05;
  CIRCLE_EXP_SCALE_MAX = 0.49;

  CIRCLE_MIN_COLOR = 64;
  CIRCLE_MAX_COLOR = 255;

  CIRCLE_COUNT = 80;

type

  { TCommonEntity }
  TCommonEntity = class(TEntityActor)
  public
    constructor Create; override;
    procedure OnCollide(const aActor: TActor; const aHitPos: TPoint); override;
    function  Collide(const aActor: TActor; var aHitPos: TPoint): Boolean; override;
  end;

  { TCircle }
  TCircle = class(TCommonEntity)
  protected
    FColor: TColor;
    FSpeed: Single;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
    procedure OnCollide(const aActor: TActor; const aHitPos: TPoint); override;
    property Speed: Single read FSpeed;
  end;

  { TCircleExplosion }
  TCircleExplosion = class(TCommonEntity)
  protected
    FColor: array[0..1] of TColor;
    FState: Integer;
    FFade: Single;
    FSpeed: Single;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Setup(aX, aY: Single; aColor: TColor); overload;
    procedure Setup(aCircle: TCircle); overload;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
    procedure OnCollide(const aActor: TActor; const aHitPos: TPoint); override;
  end;

  { TExample }
  TExample = class(TBaseTemplate)
  protected
    FExplosions: Integer;
    FChainActive: Boolean;
    FMusic: TMusic;
  public
    property Explosions: Integer read FExplosions write FExplosions;
    procedure OnSetSettings; override;
    procedure OnStartup; override;
    procedure OnShutdown; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
    procedure OnRenderHud; override;
    procedure SpawnCircle(aNum: Integer); overload;
    procedure SpawnCircle; overload;
    procedure SpawnExplosion(aX, aY: Single; aColor: TColor); overload;
    procedure SpawnExplosion(aCircle: TCircle); overload;
    procedure CheckCollision(aEntity: TEntityActor);
    procedure StartChain;
    procedure PlayLevel;
    function  ChainEnded: Boolean;
    function  LevelClear: Boolean;
  end;

implementation

{ TCommonEntity }
constructor TCommonEntity.Create;
begin
  inherited;

  CanCollide := True;
end;

procedure TCommonEntity.OnCollide(const aActor: TActor; const aHitPos: TPoint);
begin
  inherited;
end;

function  TCommonEntity.Collide(const aActor: TActor; var aHitPos: TPoint): Boolean;
begin
  Result := False;

  if Overlap(aActor) then
  begin
    aHitPos := Entity.Pos;
    Result := True;
  end;
end;


{ TCircle }
constructor TCircle.Create;
var
  LOK: Boolean;
  LVP: TRect;
  LA: Single;
begin
  inherited;

  LVP := Game.Window.GetViewport;

  Init(Game.Sprite, 0);
  Entity.SetShrinkFactor(SHRINK_FACTOR);
  Entity.ScaleAbs(CIRCLE_SCALE);
  Entity.SetPosAbs(RandomRangef(32, (LVP.Width-1)-32), RandomRangef(32, (LVP.Width-1)-32));
  Entity.BlendMode := bmBlend;

  LOK := False;
  repeat
    //Sleep(1);
    FColor.Make(
      RandomRange(CIRCLE_MIN_COLOR, CIRCLE_MAX_COLOR),
      RandomRange(CIRCLE_MIN_COLOR, CIRCLE_MAX_COLOR),
      RandomRange(CIRCLE_MIN_COLOR, CIRCLE_MAX_COLOR),
      255
    );

    if FColor.Equal(BLACK) or
       FColor.Equal(WHITE) then
      continue;

    LOK := True;
  until LOK;

  LOK := False;
  repeat
    //Sleep(1);
    LA := RandomRange(0, 359);
    if (Abs(LA) >=90-10) and (Abs(LA) <= 90+10) then continue;
    if (Abs(LA) >=270-10) and (Abs(LA) <= 270+10) then continue;

    LOK := True;
  until LOK;

  Entity.RotateAbs(LA);
  Entity.SetColor(FColor);
  FSpeed := RandomRange(3*35, 7*35);
end;

destructor TCircle.Destroy;
begin
  inherited;
end;

procedure TCircle.OnUpdate(const aDeltaTime: Double);
var
  LV: TVector;
  LVP: TRect;
  LR: Single;
begin
  LVP := Game.Window.GetViewport;

  Entity.Thrust(FSpeed * aDeltaTime);

  LV := Entity.Pos;

  LR := Entity.Radius / 2;

  if LV.x < -LR then
    LV.x := LVP.Width-1
  else if LV.x > (LVP.Width-1)+LR then
    LV.x := -LR;

  if LV.y < -LR then
    LV.y := (LVP.Height-1)
  else if LV.y > (LVP.Height-1)+LR then
    LV.y := -LR;

  Entity.SetPosAbs(LV.X, LV.Y);
end;

procedure TCircle.OnRender;
begin
  inherited;

end;

procedure TCircle.OnCollide(const aActor: TActor; const aHitPos: TPoint);
var
  LPos: TVector;
begin
  Terminated := True;
  LPos := Entity.Pos;

  TExample(Game).SpawnExplosion(LPos.X, LPos.Y, FColor);
  TExample(Game).Explosions := TExample(Game).Explosions + 1;
end;


{ TCircleExplosion }
constructor TCircleExplosion.Create;
begin
  inherited;

  Init(Game.Sprite, 0);

  Entity.SetShrinkFactor(SHRINK_FACTOR);
  Entity.ScaleAbs(CIRCLE_SCALE);
  Entity.BlendMode := bmAdd;

  FState := 0;
  FFade := 0;
  FSpeed := 0;
end;

destructor TCircleExplosion.Destroy;
begin

  inherited;
end;

procedure TCircleExplosion.Setup(aX, aY: Single; aColor: TColor);
begin
  FColor[0] := aColor;
  FColor[1] := aColor;
  Entity.SetPosAbs(aX, aY);
end;

procedure TCircleExplosion.Setup(aCircle: TCircle);
var
  LPos: TPoint;
begin
  LPos := aCircle.Entity.Pos;
  Setup(LPos.X, LPos.Y, aCircle.Entity.Color);
  Entity.RotateAbs(aCircle.Entity.Angle);
  FSpeed := aCircle.Speed;
end;

procedure TCircleExplosion.OnUpdate(const aDeltaTime: Double);
begin
  Entity.Thrust(FSpeed*aDeltaTime);

  case FState of
    0: // expand
    begin
      Entity.ScaleRel(CIRCLE_SCALE_SPEED*aDeltaTime);
      if Entity.Scale > CIRCLE_EXP_SCALE_MAX then
      begin
        FState := 1;
      end;
      Entity.SetColor(FColor[0]);
    end;

    1: // contract
    begin
      Entity.ScaleRel(-CIRCLE_SCALE_SPEED*aDeltaTime);
      FFade := CIRCLE_SCALE_SPEED*aDeltaTime / Entity.Scale;
      if Entity.Scale < CIRCLE_EXP_SCALE_MIN then
      begin
        FState := 2;
        FFade := 1.0;
        Terminated := True;
      end;
    end;

    2: // kill
    begin
      Terminated := True;
    end;

  end;

  TExample(Game).CheckCollision(Self);
end;

procedure TCircleExplosion.OnRender;
begin
  inherited;
end;

procedure TCircleExplosion.OnCollide(const aActor: TActor; const aHitPos: TPoint);
begin
end;

{ TExample }
procedure TExample.OnSetSettings;
begin
  inherited;

  Settings.WindowClearColor := BLACK;
  Settings.WindowTitle := Settings.WindowTitle + 'Demo: ChainAction';

  Settings.SceneCount := SCN_COUNT;
end;

procedure TExample.OnStartup;
var
  LPage: Integer;
  LGroup: Integer;
begin
  inherited;

  // init circle sprite
  LPage := Sprite.LoadPage(Archive, 'arc/images/light.png', @COLORKEY);
  LGroup := Sprite.AddGroup;
  Sprite.AddImageFromGrid(LPage, LGroup, 0, 0, 256, 256);

  // init music
  FMusic := Audio.LoadPlayMusic(Archive, 'arc/music/song06.ogg', 1.0, -1, True);

  PlayLevel;
end;

procedure TExample.OnShutdown;
begin
  Audio.UnloadMusic(FMusic);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
begin
  inherited;

  // start  new level
  if Input.KeyPressed(KEY_SPACE) then
  begin
    if LevelClear then
      PlayLevel;
  end;

  // start chain reaction
  if Input.MousePressed(BUTTON_LEFT) then
  begin
    if ChainEnded then
      StartChain;
  end;

end;

procedure TExample.OnRender;
begin
  inherited;

end;

procedure TExample.OnRenderHud;
var
  LVP: TRect;
  LX: Single;
  LC: TColor;
begin
  inherited;

  Hud.Text(DefaultFont, YELLOW, haLeft, Hud.TextItem('Circles:', ' %d', ''), [Scene.Lists[SCN_CIRCLE].Count]);

  LVP := Window.GetViewport;
  LX := LVP.Width / 2;

  if ChainEnded and (not LevelClear) then
    LC := WHITE
  else
    LC := DIMWHITE;

  DefaultFont.DrawText(LX, 120{*Display.GetUpScale}, LC, haCenter, 'Click mouse to start chain reaction', []);

  if LevelClear then
  begin
    DefaultFont.DrawText(LX, (120+21){*Display.GetUpScale}, ORANGE, haCenter, 'Press SPACE to start new level', []);
  end;
end;

procedure TExample.SpawnCircle(aNum: Integer);
var
  I: Integer;
begin
  for I := 0 to aNum - 1 do
    Scene.Lists[SCN_CIRCLE].Add(TCircle.Create);
end;

procedure TExample.SpawnCircle;
begin
  SpawnCircle(RandomRange(10, 40));
end;

procedure TExample.SpawnExplosion(aX, aY: Single; aColor: TColor);
var
  obj: TCircleExplosion;
begin
  obj := TCircleExplosion.Create;
  obj.Setup(aX, aY, aColor);
  Scene.Lists[SCN_EXPLO].Add(obj);
end;

procedure TExample.SpawnExplosion(aCircle: TCircle);
var
  obj: TCircleExplosion;
begin
  obj := TCircleExplosion.Create;
  obj.Setup(aCircle);
  Scene.Lists[SCN_EXPLO].Add(obj);
end;

procedure TExample.CheckCollision(aEntity: TEntityActor);
begin
  Scene.Lists[SCN_CIRCLE].CheckCollision([], aEntity);
end;

procedure TExample.StartChain;
begin
  if not FChainActive then
  begin
    SpawnExplosion(MousePos.X, MousePos.Y, WHITE);
    FChainActive := True;
  end;
end;

procedure TExample.PlayLevel;
begin
  Scene.ClearAll;
  SpawnCircle(CIRCLE_COUNT);
  FChainActive := False;
  FExplosions := 0;
end;

function  TExample.ChainEnded: Boolean;
begin
  Result := True;

  if FChainActive then
  begin
    Result := Boolean(Scene.Lists[SCN_EXPLO].Count = 0);
    if Result  then
      FChainActive := False;
  end;
end;

function  TExample.LevelClear: Boolean;
begin
  Result := Boolean(Scene.Lists[SCN_CIRCLE].Count = 0);
end;

end.
