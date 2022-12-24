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

unit ustarfield_render;

interface
uses
  System.SysUtils,
  DelphiGamekit,
  uCommon;

type
  { TExample }
  TExample = class(TBaseTemplate)
  protected
    FStarfield: TStarfield;
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

  Settings.WindowTitle := Settings.WindowTitle + 'Starfield: Render';
  Settings.WindowClearColor := BLACK;
end;

procedure TExample.OnStartup;
begin
  inherited;

  FStarfield := TStarfield.Create;

end;

procedure TExample.OnShutdown;
begin

  FreeNilObject(FStarfield);

  inherited;
end;

procedure TExample.OnUpdate(const aDeltaTime: Double);
const
  cFactor = 20;
begin
  inherited;

  if Input.KeyPressed(KEY_1) then
  begin
    FStarfield.SetXSpeed(25*cFactor);
    FStarfield.SetYSpeed(0);
    FStarfield.SetZSpeed(-(5*cFactor));
    FStarfield.SetVirtualPos(0, 0);
  end;

  if Input.KeyPressed(KEY_2) then
  begin
    FStarfield.SetXSpeed(0);
    FStarfield.SetYSpeed(-25*cFactor);
    FStarfield.SetZSpeed(-(5*cFactor));
    FStarfield.SetVirtualPos(0, 0);

  end;

  if Input.KeyPressed(KEY_3) then
  begin
    FStarfield.SetXSpeed(-25*cFactor);
    FStarfield.SetYSpeed(0);
    FStarfield.SetZSpeed(-(5*cFactor));
    FStarfield.SetVirtualPos(0, 0);
  end;

  if Input.KeyPressed(KEY_4) then
  begin
    FStarfield.SetXSpeed(0);
    FStarfield.SetYSpeed(25*cFactor);
    FStarfield.SetZSpeed(-(5*cFactor));
    FStarfield.SetVirtualPos(0, 0);
  end;

  if Input.KeyPressed(KEY_5) then
  begin
    FStarfield.SetXSpeed(0);
    FStarfield.SetYSpeed(0);
    FStarfield.SetZSpeed(5*cFactor);
    FStarfield.SetVirtualPos(0, 0);
  end;

  if Input.KeyPressed(KEY_6) then
  begin
    FStarfield.Init(250, -1000, -1000, 10, 1000, 1000, 1000, 160);
    FStarfield.SetZSpeed(0);
    FStarfield.SetYSpeed(15*cFactor);
  end;


  if Input.KeyPressed(KEY_7) then
  begin
    FStarfield.Init(250, -1000, -1000, 10, 1000, 1000, 1000, 120);
    FStarfield.SetXSpeed(0);
    FStarfield.SetYSpeed(0);
    FStarfield.SetZSpeed(-60*3);
    FStarfield.SetVirtualPos(0, 0);
  end;


  FStarfield.Update(aDeltaTime);

end;

procedure TExample.OnRender;
begin
  inherited;

  FStarfield.Render;

end;

procedure TExample.OnRenderHud;
begin
  inherited;

  Hud.Text(DefaultFont, GREEN, haLeft, Hud.TextItem('1-7', 'Change starfield'), []);

end;

end.
