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

unit udemo_astroblaster;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

const
  cMultiplier = 60;
  cPlayerMultiplier = 600;

  // player
  cPlayerTurnRate      = 2.7 * cPlayerMultiplier;
  cPlayerFriction      = 0.005* cPlayerMultiplier;
  cPlayerAccel         = 0.1* cPlayerMultiplier;
  cPlayerMagnitude     = 10 * 14;
  cPlayerHalfSize      = 32.0;
  cPlayerFrameFPS      = 12;
  cPlayerNeutralFrame  = 0;
  cPlayerFirstFrame    = 1;
  cPlayerLastFrame     = 3;
  cPlayerTurnAccel     = 300;
  cPlayerMaxTurn       = 150;
  cPlayerTurnDrag      = 150;

  // scene
  cSceneBkgrnd         = 0;
  cSceneRocks          = 1;
  cSceneRockExp        = 2;
  cSceneEnemyWeapon    = 3;
  cSceneEnemy          = 4;
  cSceneEnemyExp       = 5;
  cScenePlayerWeapon   = 6;
  cScenePlayer         = 7;
  cScenePlayerExp      = 8;
  cSceneCount          = 9;

  // sound effects
  cSfxRockExp          = 0;
  cSfxPlayerExp        = 1;
  cSfxEnemyExp         = 2;
  cSfxPlayerEngine     = 3;
  cSfxPlayerWeapon     = 4;

  // volume
  cVolPlayerEngine     = 0.8;  //0.40;
  cVolPlayerWeapon     = 0.7; //0.30;
  cVolRockExp          = 0.85; //0.25;
  cVolSong             = 0.55; //0.55;

  // rocks
  cRocksMin            = 7;
  cRocksMax            = 21;

  DEBUG_RENDERPOLYPOINT = False;

type

  { TSpriteID }
  PSpriteID = ^TSpriteID;
  TSpriteID = record
    Page : Integer;
    Group: Integer;
  end;

  { TRockSize }
  TRockSize = (rsLarge, rsMedium, rsSmall);

  { TEntity }
  TBaseEntity = class(TEntityActor)
  protected
    //FTest: string;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure WrapPosAtEdge(var aPos: TVector);
  end;

  { TWeapon }
  TWeapon = class(TBaseEntity)
  protected
    FSpeed: Single;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure OnRender; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnCollide(const aActor: TActor; const aHitPos: TPoint); override;
    procedure Spawn(aId: Integer; aPos: TVector; aAngle, aSpeed: Single);
  end;

  { TExplosion }
  TExplosion = class(TBaseEntity)
  protected
    FSpeed: Single;
    FCurDir: TVector;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure OnRender; override;
    procedure OnUpdate(const aElapsedTime: Double); override;
    procedure Spawn(aPos: TVector; aDir: TVector; aSpeed, aScale: Single);
  end;

  { TParticle }
  TParticle = class(TBaseEntity)
  protected
    FSpeed: Single;
    FFadeSpeed: Single;
    FAlpha: Single;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure OnRender; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure Spawn(aId: Integer; aPos: TPoint; aAngle, aSpeed, aScale, aFadeSpeed: Single; aScene: Integer);
  end;

  { TRock }
  TRock = class(TBaseEntity)
  protected
    FCurDir: TVector;
    FSpeed: Single;
    FRotSpeed: Single;
    FSize: TRockSize;
    function CalcScale(aSize: TRockSize): Single;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure OnRender; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnCollide(const aActor: TActor; const aHitPos: TPoint); override;
    procedure Spawn(aId: Integer; aSize: TRockSize; aPos: TVector; aAngle: Single);
    procedure Split(aHitPos: TPoint);
  end;

  { TPlayer }
  TPlayer = class(TBaseEntity)
  protected
    FTimer    : Single;
    FCurFrame : Integer;
    FThrusting: Boolean;
    FCurAngle : Single;
    FTurnSpeed: Single;
  public
    DirVec    : TVector;
    constructor Create; override;
    destructor Destroy; override;
    procedure OnRender; override;
    procedure OnUpdate(const aDelta: Double); override;
    procedure Spawn(aX, aY: Single);
    procedure FireWeapon(aSpeed: Single);
  end;

  { TExample }
  TExample = class(TBaseTemplate)
  protected
    FBkPos: TVector;
    FBkColor: TColor;
    FMusic: TMusic;
  public
    Sfx: array[0..7] of TSound;
    Background : array[0..3] of TTexture;
    PlayerSprID: TSpriteID;
    EnemySprID: TSpriteID;
    RocksSprID: TSpriteID;
    ShieldsSprID: TSpriteID;
    WeaponSprID: TSpriteID;
    ExplosionSprID: TSpriteID;
    ParticlesSprID: TSpriteID;
    constructor Create; override;
    destructor Destroy; override;
    procedure OnSetSettings; override;
    procedure OnStartup; override;
    procedure OnShutdown; override;
    procedure OnUpdate(const aDeltaTime: Double); override;
    procedure OnRender; override;
    procedure OnRenderHud; override;
    procedure SpawnRocks;
    procedure SpawnPlayer;
    procedure SpawnLevel;
    function  LevelCleared: Boolean;
  end;

var
  Game: TExample = nil;

implementation

const
  cChanPlayerEngine = 0;
  cChanPlayerWeapon = 1;

var
  Player: TPlayer;

function RandomRangedslNP(aMin, aMax: Single): Single;
begin
  Result := RandomRangef(aMin, aMax);
  if RandomBool then Result := -Result;
end;

function RangeRangeIntNP(aMin, aMax: Integer): Integer;
begin
  Result := RandomRange(aMin, aMax);
  if RandomBool then Result := -Result;
end;

{ TBaseEntity }
constructor TBaseEntity.Create;
begin
  inherited;

  CanCollide := True;
end;

destructor TBaseEntity.Destroy;
begin

  inherited;
end;

procedure  TBaseEntity.WrapPosAtEdge(var aPos: TVector);
var
  LHH,LHW: Single;
begin
  LHW := Entity.Width  / 2;
  LHH := Entity.Height /2 ;

  if (aPos.X > (Game.Settings.WindowWidth-1)+LHW) then
    aPos.X := -LHW
  else if (aPos.X < -LHW) then
    aPos.X := (Game.Settings.WindowWidth-1)+LHW;

  if (aPos.Y > (Game.Settings.WindowHeight-1)+LHH) then
    aPos.Y := -LHH
  else if (aPos.Y < -LHW) then
    aPos.Y := (Game.Settings.WindowHeight-1)+LHH;
end;


{ TWeapon }
constructor TWeapon.Create;
begin
  inherited;

  Init(Game.Sprite, Game.WeaponSprId.Group);
  Entity.TracePolyPoint(6, 12, 70);
  Entity.SetRenderPolyPoint(DEBUG_RENDERPOLYPOINT);
  Entity.BlendMode := bmBlend;
end;

destructor TWeapon.Destroy;
begin

  inherited;
end;

procedure TWeapon.OnRender;
begin
  inherited;
end;

procedure TWeapon.OnUpdate(const aDeltaTime: Double);
begin
  inherited;

  if Entity.Visible(0,0) then
    begin
      Entity.Thrust(FSpeed*aDeltaTime);
      Game.Scene[cSceneRocks].CheckCollision([], Self);
    end
  else
    Terminated := True;
end;

procedure TWeapon.OnCollide(const aActor: TActor; const aHitPos: TPoint);
begin
  CanCollide := False;
  Terminated := True;
end;

procedure  TWeapon.Spawn(aId: Integer; aPos: TVector; aAngle, aSpeed: Single);
begin
  FSpeed := aSpeed;
  Entity.SetFrame(aId);
  Entity.SetPosAbs(aPos.X, aPos.Y);
  Entity.RotateAbs(aAngle);
end;


{ TExplosion }
constructor TExplosion.Create;
begin
  inherited;

  FSpeed := 0;
  FCurDir.X := 0;
  FCurDir.Y := 0;
end;

destructor TExplosion.Destroy;
begin

  inherited;
end;

procedure TExplosion.OnRender;
begin
  inherited;

end;

procedure TExplosion.OnUpdate(const aElapsedTime: Double);
var
  LP, LV: TVector;
begin
  if Entity.NextFrame then
  begin
    Terminated := True;
  end;

  LV.X := (FCurDir.X + FSpeed) * aElapsedTime;
  LV.Y := (FCurDir.Y + FSpeed) * aElapsedTime;

  LP := Entity.Pos;

  LP.X := LP.X + LV.X;
  LP.Y := LP.Y + LV.Y;

  Entity.SetPosAbs(LP.X, LP.Y);

  inherited;
end;

procedure TExplosion.Spawn(aPos: TVector; aDir: TVector; aSpeed, aScale: Single);
begin
  FSpeed := aSpeed;
  FCurDir := aDir;

  Init(Game.Sprite, Game.ExplosionSprID.Group);

  Entity.SetFrameFPS(14);
  Entity.ScaleAbs(aScale);
  Entity.SetPosAbs(aPos.X, aPos.Y);
  Entity.BlendMode := bmAdd;

  Game.Scene[cSceneRockExp].Add(Self);
end;


{ TParticle }
constructor TParticle.Create;
begin
  inherited;

end;

destructor TParticle.Destroy;
begin

  inherited;
end;

procedure TParticle.OnRender;
begin
  inherited;

end;

procedure TParticle.OnUpdate(const aDeltaTime: Double);
var
  LC: TColor;
begin
  Entity.Thrust(FSpeed*aDeltaTime);

  if Entity.Visible(0, 0) then
    begin
      FAlpha := FAlpha - (FFadeSpeed * aDeltaTime);
      if FAlpha <= 0 then
      begin
        FAlpha := 0;
        Terminated := True;
      end;
      LC.Make(255, 255, 255, Round(FAlpha));
      Entity.SetColor(LC);
    end
  else
    Terminated := True;

  inherited;
end;

procedure TParticle.Spawn(aId: Integer; aPos: TPoint; aAngle, aSpeed, aScale, aFadeSpeed: Single; aScene: Integer);
begin
  FSpeed := aSpeed;
  FFadeSpeed := aFadeSpeed;
  FAlpha := 255;

  Init(Game.Sprite, Game.ParticlesSprID.Group);

  Entity.SetFrame(aId);
  Entity.ScaleAbs(aScale);
  Entity.SetPosAbs(aPos.X, aPos.Y);
  Entity.RotateAbs(aAngle);

  Game.Scene[aScene].Add(Self);
end;


{ TRock }
function TRock.CalcScale(aSize: TRockSize): Single;
begin
  case aSize of
    rsLarge: Result := 1.0;
    rsMedium: Result := 0.65;
    rsSmall: Result := 0.45;
  else
    Result := 1.0;
  end;
end;

constructor TRock.Create;
begin
  inherited;
  FSpeed := 0;
  FRotSpeed := 0;
  FSize := rsLarge;

  Init(Game.Sprite, Game.RocksSprId.Group);

  Entity.TracePolyPoint(6, 12, 70);
  Entity.SetRenderPolyPoint(DEBUG_RENDERPOLYPOINT);
end;

destructor TRock.Destroy;
begin

  inherited;
end;

procedure TRock.OnRender;
begin
  inherited;

end;

procedure TRock.OnUpdate(const aDeltaTime: Double);
var
  LP: TVector;
  LV: TVector;
begin
  inherited;

  Entity.RotateRel(FRotSpeed*aDeltaTime);
  LV.X := (FCurDir.X + FSpeed);
  LV.Y := (FCurDir.Y + FSpeed);
  LP := Entity.Pos;
  LP.X := LP.X + LV.X*aDeltaTime;
  LP.Y := LP.Y + LV.Y*aDeltaTime;
  WrapPosAtEdge(LP);
  Entity.SetPosAbs(LP.X, LP.Y);
end;

procedure TRock.OnCollide(const aActor: TActor; const aHitPos: TPoint);
begin
  CanCollide := False;
  Split(aHitPos);
end;

procedure TRock.Spawn(aId: Integer; aSize: TRockSize; aPos: TVector; aAngle: Single);
begin
  FSpeed := RandomRangedslNP(0.2*cMultiplier, 2*cMultiplier);
  FRotSpeed := RandomRangedslNP(0.2*cMultiplier, 2*cMultiplier);

  FSize := aSize;
  Entity.SetFrame(aId);
  Entity.SetPosAbs(aPos.X, aPos.Y);
  Entity.RotateAbs(RandomRange(0, 259));
  Entity.Thrust(1);

  FCurDir := Entity.Dir;
  FCurDir.Normalize;
  Entity.ScaleAbs(CalcScale(FSize));
end;

procedure TRock.Split(aHitPos: TPoint);

  procedure DoSplit(aId: Integer; aSize: TRockSize; aPos: TVector);
  var
    LR: TRock;
  begin
    LR := TRock.Create;
    LR.Spawn(aId, aSize, aPos, 0);
    Game.Scene[cSceneRocks].Add(LR);
  end;

  procedure DoExplosion(aScale: Single);
  var
    LP: TVector;
    LE: TExplosion;
  begin
    LP := Entity.Pos;
    LE := TExplosion.Create;
    LE.Spawn(LP, FCurDir, FSpeed, aScale);
  end;

  procedure DoParticles;
  var
    LC, LI: Integer;
    LP: TParticle;
    LAngle, LSpeed, LFade: Single;
  begin
    LC := 0;
    case FSize of
      rsLarge :
        begin
          LC := 50;
          Game.Screenshake.Start(30, 3);
        end;
      rsMedium:
        begin
          LC := 25;
          Game.Screenshake.Start(30, 2);
        end;
      rsSmall :
        begin
          LC := 15;
          Game.Screenshake.Start(30, 1);
        end;
    end;

    for LI := 1 to LC do
    begin
      LP := TParticle.Create;
      LAngle := RandomRange(0, 255);
      LSpeed := RandomRange(1*cMultiplier, 7*cMultiplier);
      LFade := RandomRange(3*cMultiplier, 7*cMultiplier);

      LP.Spawn(0, aHitPos, LAngle, LSpeed, 0.10, LFade, cSceneRockExp);
    end;
  end;

begin
  case FSize of
    rsLarge:
      begin
        DoSplit(Entity.Frame, rsMedium, Entity.Pos);
        DoSplit(Entity.Frame, rsMedium, Entity.Pos );
        DoExplosion(3.0);
        DoParticles;
        Game.Audio.PlaySound(Game.Sfx[cSfxRockExp], AUDIO_CHANNEL_DYNAMIC, cVolRockExp, 0);
      end;

    rsMedium:
      begin
        DoSplit(Entity.Frame, rsSmall, Entity.Pos);
        DoSplit(Entity.Frame, rsSmall, Entity.Pos);
        DoExplosion(2.5);
        DoParticles;
        Game.Audio.PlaySound(Game.Sfx[cSfxRockExp], AUDIO_CHANNEL_DYNAMIC, cVolRockExp, 0);

      end;

    rsSmall:
      begin
        DoExplosion(1.5);
        DoParticles;
        Game.Audio.PlaySound(Game.Sfx[cSfxRockExp], AUDIO_CHANNEL_DYNAMIC, cVolRockExp, 0);
      end;
  end;

  Terminated := True;
end;


{ TPlayer }
constructor TPlayer.Create;
begin
  Player := Self;

  inherited;

  FTimer    := 0;
  FCurFrame := 0;
  FThrusting:= False;
  FCurAngle := 0;
  DirVec.Clear;
  FTurnSpeed := 0;

  Init(Game.Sprite, Game.PlayerSprID.Group);
  Entity.TracePolyPoint(6, 12, 70);
  Entity.SetPosAbs(Game.Settings.WindowWidth /2, Game.Settings.WindowHeight /2);
  Entity.SetRenderPolyPoint(DEBUG_RENDERPOLYPOINT);
end;

destructor TPlayer.Destroy;
begin
  inherited;

  Player := nil;
end;

procedure TPlayer.OnRender;
begin
  inherited;
end;

procedure TPlayer.OnUpdate(const aDelta: Double);
var
  LP: TVector;
  LFire: Boolean;
  LTurn: Integer;
  LAccel: Boolean;
begin
  if Game.Input.KeyPressed(KEY_LCTRL) or
     Game.Input.KeyPressed(KEY_RCTRL) or
     Game.Input.ControllerPressed(CONTROLLER_BUTTON_X) then
    LFire := True
  else
    LFire := False;

  if Game.Input.KeyDown(KEY_RIGHT) or
     Game.Input.ControllerDown(CONTROLLER_BUTTON_DPAD_RIGHT) then
    LTurn := 1
  else
  if Game.Input.KeyDown(KEY_LEFT) or
     Game.Input.ControllerDown(CONTROLLER_BUTTON_DPAD_LEFT) then
    LTurn := -1
  else
    LTurn := 0;

  if (Game.Input.KeyDown(KEY_UP)) or
     Game.Input.ControllerDown(CONTROLLER_BUTTON_DPAD_UP) then
    LAccel := true
  else
    LAccel := False;

  // update keys
  if LFire then
  begin
    FireWeapon(10*cMultiplier);
  end;

  if LTurn = 1 then
  begin
    SmoothMove(FTurnSpeed, cPlayerTurnAccel*aDelta, cPlayerMaxTurn, cPlayerTurnDrag*aDelta);
  end
  else if LTurn = -1 then
    begin
      SmoothMove(FTurnSpeed, -cPlayerTurnAccel*aDelta, cPlayerMaxTurn, cPlayerTurnDrag*aDelta);
    end
  else
    begin
      SmoothMove(FTurnSpeed, 0, cPlayerMaxTurn, cPlayerTurnDrag*aDelta);
    end;

  FCurAngle := FCurAngle + FTurnSpeed*aDelta;
  if FCurAngle > 360 then
    FCurAngle := FCurAngle - 360
  else if FCurAngle < 0 then
    FCurAngle := FCurAngle + 360;

  FThrusting := False;
  if (LAccel) then
  begin
    FThrusting := True;

    if (DirVec.Magnitude < cPlayerMagnitude) then
    begin
      DirVec.Thrust(FCurAngle, cPlayerAccel*aDelta);
    end;

    if not Game.Audio.IsSoundPlaying(cChanPlayerEngine) then
    begin
      Game.Audio.PlaySound(Game.Sfx[cSfxPlayerEngine], cChanPlayerEngine, cVolPlayerEngine, -1);
    end;

  end;

  SmoothMove(DirVec.X, 0, cPlayerMagnitude, cPlayerFriction*aDelta);
  SmoothMove(DirVec.Y, 0, cPlayerMagnitude, cPlayerFriction*aDelta);

  LP := Entity.Pos;
  LP.X := LP.X + DirVec.X*aDelta;
  LP.Y := LP.Y + DirVec.Y*aDelta;

  WrapPosAtEdge(LP);

  if (FThrusting) then
    begin
      if (Game.Timer.FrameSpeed(FTimer, cPlayerFrameFPS)) then
      begin
        FCurFrame := FCurFrame + 1;
        if (FCurFrame > cPlayerLastFrame) then
        begin
          FCurFrame := cPlayerFirstFrame;
        end
      end;

    end
  else
    begin
      FCurFrame := cPlayerNeutralFrame;

      if Game.Audio.IsSoundPlaying(cChanPlayerEngine) then
      begin
        Game.Audio.StopSound(cChanPlayerEngine);
      end;
    end;

  Entity.RotateAbs(FCurAngle);
  Entity.SetFrame(FCurFrame);
  Entity.SetPosAbs(LP.X, LP.Y);

  //inherited;
end;

procedure TPlayer.Spawn(aX, aY: Single);
begin
end;

procedure TPlayer.FireWeapon(aSpeed: Single);
var
  LP: TVector;
  LW: TWeapon;
begin
  LP := Entity.Pos;
  LP.Thrust(Entity.Angle, 16);
  LW := TWeapon.Create;
  LW.Spawn(0, LP, Entity.Angle, aSpeed);
  Game.Scene[cScenePlayerWeapon].Add(LW);
  //Game.Audio.PlaySound(Game.Sfx[cSfxPlayerWeapon], cChanPlayerWeapon, cVolPlayerWeapon, 0);
  Game.Audio.PlaySound(Game.Sfx[cSfxPlayerWeapon], AUDIO_CHANNEL_DYNAMIC, cVolPlayerWeapon, 0);
end;

{ TExample }
constructor TExample.Create;
begin
  inherited;
  Game := Self;
end;

destructor TExample.Destroy;
begin
  Game := nil;
  inherited;
end;

procedure TExample.OnSetSettings;
begin
  inherited;

  Settings.WindowTitle := Settings.WindowTitle + 'Demo: AstroBlaster';
  Settings.WindowClearColor := BLACK;
  Settings.SceneCount := cSceneCount;
end;



procedure TExample.OnStartup;
begin
  inherited;

// init background
  FBkColor.Make(255,255,255,128);

  Background[0] := TTexture.Create;
  Background[1] := TTexture.Create;
  Background[2] := TTexture.Create;
  Background[3] := TTexture.Create;

  Background[0].Load(Archive, 'arc/images/space.png',  @BLACK);
  Background[1].Load(Archive, 'arc/images/nebula.png', @BLACK);
  Background[2].Load(Archive, 'arc/images/spacelayer1.png', @BLACK);
  Background[3].Load(Archive, 'arc/images/spacelayer2.png', @BLACK);

    // init player sprites
  PlayerSprID.Page := Sprite.LoadPage(Archive, 'arc/images/ship.png', nil);
  PlayerSprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(PlayerSprID.Page, PlayerSprID.Group, 0, 0, 64, 64);
  Sprite.AddImageFromGrid(PlayerSprID.Page, PlayerSprID.Group, 1, 0, 64, 64);
  Sprite.AddImageFromGrid(PlayerSprID.Page, PlayerSprID.Group, 2, 0, 64, 64);
  Sprite.AddImageFromGrid(PlayerSprID.Page, PlayerSprID.Group, 3, 0, 64, 64);


  // init enemy sprites
  EnemySprID.Page := PlayerSprID.Page;
  EnemySprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(EnemySprID.Page, EnemySprID.Group, 0, 1, 64, 64);
  Sprite.AddImageFromGrid(EnemySprID.Page, EnemySprID.Group, 1, 1, 64, 64);
  Sprite.AddImageFromGrid(EnemySprID.Page, EnemySprID.Group, 2, 1, 64, 64);

  // init shield sprites
  ShieldsSprID.Page := PlayerSprID.Page;
  ShieldsSprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(ShieldsSprID.Page, ShieldsSprID.Group, 0, 4, 32, 32);
  Sprite.AddImageFromGrid(ShieldsSprID.Page, ShieldsSprID.Group, 1, 4, 32, 32);
  Sprite.AddImageFromGrid(ShieldsSprID.Page, ShieldsSprID.Group, 2, 4, 32, 32);

  // init wepason sprites
  WeaponSprID.Page := PlayerSprID.Page;
  WeaponSprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(WeaponSprID.Page, WeaponSprID.Group, 3, 4, 32, 32);
  Sprite.AddImageFromGrid(WeaponSprID.Page, WeaponSprID.Group, 4, 4, 32, 32);
  Sprite.AddImageFromGrid(WeaponSprID.Page, WeaponSprID.Group, 5, 4, 32, 32);

  // init rock sprites
  RocksSprID.Page := Sprite.LoadPage(Archive, 'arc/images/rocks.png', nil);
  RocksSprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(RocksSprID.Page, RocksSprID.Group, 0, 0, 128, 128);
  Sprite.AddImageFromGrid(RocksSprID.Page, RocksSprID.Group, 1, 0, 128, 128);
  Sprite.AddImageFromGrid(RocksSprID.Page, RocksSprID.Group, 0, 1, 128, 128);


  // init explosion sprites
  ExplosionSprID.Page := Sprite.LoadPage(Archive, 'arc/images/explosion.png', nil);
  ExplosionSprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 0, 0, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 1, 0, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 2, 0, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 3, 0, 64, 64);

  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 0, 1, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 1, 1, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 2, 1, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 3, 1, 64, 64);

  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 0, 2, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 1, 2, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 2, 2, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 3, 2, 64, 64);

  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 0, 3, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 1, 3, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 2, 3, 64, 64);
  Sprite.AddImageFromGrid(ExplosionSprID.Page, ExplosionSprID.Group, 3, 3, 64, 64);

  // init particles
  ParticlesSprID.Page := Sprite.LoadPage(Archive, 'arc/images/particles.png', nil);
  ParticlesSprID.Group := Sprite.AddGroup;
  Sprite.AddImageFromGrid(ParticlesSprID.Page, ParticlesSprID.Group, 0, 0, 64, 64);

  Audio.ReserveSoundChannels(2);

  // init sfx
  Sfx[cSfxRockExp] := Audio.LoadSound(Archive, 'arc/sfx/explo_rock.ogg');
  Sfx[cSfxPlayerExp] := Audio.LoadSound(Archive, 'arc/sfx/explo_player.ogg');
  Sfx[cSfxEnemyExp] := Audio.LoadSound(Archive, 'arc/sfx/explo_enemy.ogg');
  Sfx[cSfxPlayerEngine] := Audio.LoadSound(Archive, 'arc/sfx/engine_player.ogg');
  Sfx[cSfxPlayerWeapon] := Audio.LoadSound(Archive, 'arc/sfx/weapon_player.ogg');

  FMusic := Audio.LoadPlayMusic(Archive, 'arc/music/song13.ogg', 1.0, -1);

end;

procedure TExample.OnShutdown;
begin
  Scene.ClearAll;

  Audio.UnloadMusic(FMusic);

  Audio.UnloadSound(Sfx[cSfxRockExp]);
  Audio.UnloadSound(Sfx[cSfxPlayerExp]);
  Audio.UnloadSound(Sfx[cSfxEnemyExp]);
  Audio.UnloadSound(Sfx[cSfxPlayerEngine]);
  Audio.UnloadSound(Sfx[cSfxPlayerWeapon]);

  FreeAndNil(Background[3]);
  FreeAndNil(Background[2]);
  FreeAndNil(Background[1]);
  FreeAndNil(Background[0]);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
var
  LP: TVector;
begin
  inherited;

  if Assigned(Player) then
  begin
    LP := Player.DirVec;
    FBkPos.X := FBkPos.X + (LP.X * aDeltaTime);
    FBkPos.Y := FBkPos.Y + (LP.Y * aDeltaTime);
  end;

  if LevelCleared then
  begin
    SpawnLevel;
  end;

end;

const
  mBM = 3;

procedure TExample.OnRender;
begin
  // render background
  Background[0].RenderTiled(-(FBkPos.X/1.9*mBM), -(FBkPos.Y/1.9*mBM), WHITE, bmNone);
  Background[1].RenderTiled(-(FBkPos.X/1.9*mBM), -(FBkPos.Y/1.9*mBM), WHITE, bmAdd);
  Background[2].RenderTiled(-(FBkPos.X/1.6*mBM), -(FBkPos.Y/1.6*mBM), WHITE, bmBlend);
  Background[3].RenderTiled(-(FBkPos.X/1.3*mBM), -(FBkPos.Y/1.3*mBM), WHITE, bmBlend);

  inherited;
end;


procedure TExample.OnRenderHud;
begin
  inherited;

  Hud.Text(DefaultFont, GREEN,  haLeft, Hud.TextItem('Left', 'Rotate left'), []);
  Hud.Text(DefaultFont, GREEN,  haLeft, Hud.TextItem('Right', 'Rotate right'), []);
  Hud.Text(DefaultFont, GREEN,  haLeft, Hud.TextItem('Up', 'Thrust'), []);
  Hud.Text(DefaultFont, GREEN,  haLeft, Hud.TextItem('Ctrl', 'Fire'), []);
  Hud.Text(DefaultFont, YELLOW, haLeft, Hud.TextItem('Count:', ' %d', ''), [Scene[cSceneRocks].Count]);

end;

procedure TExample.SpawnRocks;
var
  LI, LC: Integer;
  LId: Integer;
  LSize: TRockSize;
  LAngle: Single;
  LRock: TRock;
  LRadius : Single;
  LPos: TVector;
begin

  LC := RandomRange(cRocksMin, cRocksMax);

  for LI := 1 to LC do
  begin
    LId := RandomRange(0, 2);
    LSize := TRockSize(RandomRange(0, 2));

    LPos.x := Settings.WindowWidth / 2;
    LPos.y := Settings.WindowHeight /2;

    LRadius := (LPos.x + LPos.y) / 2;
    LAngle := RandomRange(0, 359);
    LPos.Thrust(LAngle, LRadius);

    LRock := TRock.Create;
    LRock.Spawn(LId, LSize, LPos, LAngle);
    Game.Scene[cSceneRocks].Add(LRock);
  end;
end;

procedure TExample.SpawnPlayer;
begin
  Scene.Lists[cScenePlayer].Add(TPlayer.Create);
end;

procedure TExample.SpawnLevel;
begin
  Scene.ClearAll;
  SpawnRocks;
  SpawnPlayer;
end;

function TExample.LevelCleared: Boolean;
begin
  if (Scene[cSceneRocks].Count        > 0) or
     (Scene[cSceneRockExp].Count      > 0) or
     (Scene[cScenePlayerWeapon].Count > 0) then
    Result := False
  else
    Result := True;
end;

end.
