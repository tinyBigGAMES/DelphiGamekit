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

unit uentity_collision;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

type
  { TExample }
  TExample = class(TBaseTemplate)
  protected
    FBoss: TEntity;
    FFigure: TEntity;
    FHitPos: TPoint;
    FCollide: Boolean;
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

  Settings.WindowTitle := Settings.WindowTitle + 'Entity: Collision';
end;

procedure TExample.OnStartup;
begin
  inherited;

  Sprite.LoadPage(Archive, 'arc/images/boss.png', nil);
  Sprite.AddGroup;
  Sprite.AddImageFromGrid(0, 0, 0, 0, 128, 128);
  Sprite.AddImageFromGrid(0, 0, 1, 0, 128, 128);
  Sprite.AddImageFromGrid(0, 0, 0, 1, 128, 128);

  Sprite.LoadPage(Archive, 'arc/images/figure.png', nil);
  Sprite.AddGroup;
  Sprite.AddImageFromGrid(1, 1, 0, 0, 128, 128);


  FBoss := TEntity.Create;
  FBoss.Init(Sprite, 0);
  FBoss.SetFrameFPS(14);
  FBoss.SetPosAbs(Settings.WindowWidth/2, (Settings.WindowHeight/2)-128);
  FBoss.TracePolyPoint(6, 12, 70, nil);
  FBoss.SetRenderPolyPoint(True);

  FFigure := TEntity.Create;
  FFigure.Init(Sprite, 1);
  FFigure.SetFrameFPS(14);
  FFigure.SetPosAbs(Settings.WindowWidth/2, Settings.WindowHeight/2);
  FFigure.TracePolyPoint(6, 12, 70, nil);
  FFigure.SetRenderPolyPoint(True);
end;

procedure TExample.OnShutdown;
begin
  FreeNilObject(FFigure);
  FreeNilObject(FBoss);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
begin
  inherited;

  FBoss.NextFrame;
  FBoss.ThrustToPos(30*50, 14*50, MousePos.X, MousePos.Y, 128, 32, 5*50, EPSILON, aDeltaTime);
  if FBoss.CollidePolyPoint(FFigure, FHitPos) then
    FCollide := True
  else
    FCollide := False;

  FFigure.NextFrame;
  FHitPos.Z :=  FHitPos.Z + (30.0 * aDeltaTime);
  ClipValuef(FHitPos.Z, 0, 359, True);
  FFigure.RotateAbs(FHitPos.Z);
end;

procedure TExample.OnRender;
begin
  inherited;

  FFigure.Render(0, 0);
  FBoss.Render(0, 0);
  if FCollide then
    Window.DrawFilledRect(FHitPos.X, FHitPos.Y, 10, 10, RED, bmBlend);
end;

procedure TExample.OnRenderHud;
begin
  inherited;

  DefaultFont.DrawText(0, 150, ORANGE, haCenter, 'Use mouse to move ship along edge of rotating figure to see collision', []);

end;

end.
