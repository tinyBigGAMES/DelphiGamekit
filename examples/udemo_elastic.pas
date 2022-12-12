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

unit udemo_elastic;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

type
  { TExample }
  TExample = class(TBaseTemplate)
  protected const
    cGravity          = 0.04;
    cXDecay           = 0.97;
    cYDecay           = 0.97;
    cBeadCount        = 10;
    cXElasticity      = 0.02;
    cYElasticity      = 0.02;
    cWallDecay        = 0.9;
    cSlackness        = 1;
    cBeadSize         = 12;
    cBedHalfSize      = cBeadSize / 2;
    cBeadFilled       = True;
  protected type
    TBead = record
      X    : Single;
      Y    : Single;
      XMove: Single;
      YMove: Single;
    end;
  protected
    FViewWidth: Single;
    FViewHeight: Single;
    FBead : array[0..cBeadCount] of TBead;
    FTimer: Single;
    FMusic: TMusic;
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

  Settings.WindowTitle := Settings.WindowTitle + 'Demo: Elastic';
end;

procedure TExample.OnStartup;
var
  LViewport: TRect;
begin
  inherited;

  FillChar(FBead, SizeOf(FBead), 0);

  LViewport := Window.GetViewport;
  FViewWidth := LViewport.Width;
  FViewHeight := LViewport.Height;

  FMusic := Audio.LoadPlayMusic(Archive, 'arc/music/song04.ogg', 0.5, -1, True);
end;

procedure TExample.OnShutdown;
begin
  Audio.UnloadMusic(FMusic);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
var
  i: Integer;
  LDist, LDistX, LDistY: Single;
  LMousePos: TPoint;
begin
  inherited;

  if not Timer.FrameSpeed(FTimer, Settings.TimerUpdateRate) then Exit;

  Input.GetMouseInfo(@LMousePos, nil);

  FBead[0].X := LMousePos.X;
  FBead[0].Y := LMousePos.Y;

  if FBead[0].X - (cBeadSize+10)/2<0 then
  begin
   FBead[0].X := (cBeadSize+10)/2;
  end;

  if FBead[0].X + ((cBeadSize+10)/2) >FViewWidth then
  begin
   FBead[0].X := FViewWidth - (cBeadSize+10)/2;
  end;

  if FBead[0].Y - ((cBeadSize+10)/2) < 0 then
  begin
   FBead[0].Y := (cBeadSize+10)/2;
  end;

  if FBead[0].Y + ((cBeadSize+10)/2) > FViewHeight then
  begin
   FBead[0].Y := FViewHeight - (cBeadSize+10)/2;
  end;

  // loop though other beads
  for i := 1 to cBeadCount do
  begin
    // calc X and Y distance between the bead and the one before it
    LDistX := FBead[i].X - FBead[i-1].X;
    LDistY := FBead[i].Y - FBead[i-1].Y;

    // calc total distance
    LDist := sqrt(LDistX*LDistX + LDistY * LDistY);

    // if the beads are far enough apart, decrease the movement to create elasticity
    if LDist > cSlackness then
    begin
       FBead[i].XMove := FBead[i].XMove - (cXElasticity * LDistX);
       FBead[i].YMove := FBead[i].YMove - (cYElasticity * LDistY);
    end;

    // if bead is not last bead
    if i <> cBeadCount then
    begin
       // calc distances between the bead and the one after it
       LDistX := FBead[i].X - FBead[i+1].X;
       LDistY := FBead[i].Y - FBead[i+1].Y;
       LDist  := sqrt(LDistX*LDistX + LDistY*LDistY);

       // if beads are far enough apart, decrease the movement to create elasticity
       if LDist > 1 then
       begin
          FBead[i].XMove := FBead[i].XMove - (cXElasticity * LDistX);
          FBead[i].YMove := FBead[i].YMove - (cYElasticity * LDistY);
       end;
    end;

    // decay the movement of the beads to simulate loss of energy
    FBead[i].XMove := FBead[i].XMove * cXDecay;
    FBead[i].YMove := FBead[i].YMove * cYDecay;

    // apply cGravity to bead movement
    FBead[i].YMove := FBead[i].YMove + cGravity;

    // move beads
    FBead[i].X := FBead[i].X + FBead[i].XMove;
    FBead[i].Y := FBead[i].Y + FBead[i].YMove;

    // ff the beads hit a wall, make them bounce off of it
    if FBead[i].X - ((cBeadSize + 10 ) / 2) < 0 then
    begin
       FBead[i].X     :=  FBead[i].X     + (cBeadSize+10)/2;
       FBead[i].XMove := -FBead[i].XMove * cWallDecay;
    end;

    if FBead[i].X + ((cBeadSize+10)/2) > FViewWidth then
    begin
       FBead[i].X     := FViewWidth - (cBeadSize+10)/2;
       FBead[i].xMove := -FBead[i].XMove * cWallDecay;
    end;

    if FBead[i].Y - ((cBeadSize+10)/2) < 0 then
    begin
       FBead[i].YMove := -FBead[i].YMove * cWallDecay;
       FBead[i].Y     :=(cBeadSize+10)/2;
    end;

    if FBead[i].Y + ((cBeadSize+10)/2) > FViewHeight then
    begin
       FBead[i].YMove := -FBead[i].YMove * cWallDecay;
       FBead[i].Y     := FViewHeight - (cBeadSize+10)/2;
    end;
  end;

end;

procedure TExample.OnRender;
var
  I: Integer;
begin
  inherited;

  // draw last bead
  Window.DrawFilledRect(FBead[0].X, FBead[0].Y, cBeadSize, cBeadSize, GREEN);

  // loop though other beads
  for I := 1 to cBeadCount do
  begin
    // draw bead and string from it to the one before it
    Window.DrawLine(FBead[i].x+cBedHalfSize,
      FBead[i].y+cBedHalfSize, FBead[i-1].x+cBedHalfSize,
      FBead[i-1].y+cBedHalfSize, YELLOW);
    Window.DrawFilledRect(FBead[i].X, FBead[i].Y, cBeadSize,
     cBeadSize, GREEN);
  end;

end;

procedure TExample.OnRenderHud;
begin
  inherited;

end;

end.
