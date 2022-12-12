//DOM-IGNORE-BEGIN
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
//DOM-IGNORE-END

unit DelphiGamekit;

interface

{$REGION ' Unit Defines '}

{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_PLATFORM OFF}

{$WARN UNIT_PLATFORM OFF}
{$WARN UNIT_DEPRECATED OFF}

{$MINENUMSIZE 4}
{$ALIGN ON}

{$Z4}
{$A8}

{$INLINE AUTO}

{$IFNDEF WIN64}
  {$MESSAGE Error 'Unsupported platform'}
{$ENDIF}

{$if CompilerVersion < 34}
  {$MESSAGE Error 'Unsupported compiler version'}
{$ifend}

{$ENDREGION}

{$REGION ' Unit Uses Section '}
uses
  System.Types,
  System.SysUtils,
  System.Generics.Defaults,
  System.Generics.Collections,
  System.Classes,
  System.Contnrs,
  System.IOUtils,
  System.StrUtils,
  System.IniFiles,
  System.Math,
  System.JSON,
  System.Net.HttpClient,
  System.NetEncoding,
  System.Net.URLClient,
  System.Variants,
  System.ZLib,
  System.Zip,
  System.Win.ComObj,
  System.Win.StdVCL,
  System.Win.Registry,
  Vcl.OleServer,
  Vcl.OleCtrls,
  WinApi.Windows,
  WinApi.Messages,
  WinApi.ShellAPI,
  Winapi.ActiveX;
{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.SDL2 '}
//DOM-IGNORE-BEGIN
const
  NK_INCLUDE_FIXED_TYPES = 1;
  NK_INCLUDE_STANDARD_IO = 1;
  NK_INCLUDE_STANDARD_VARARGS = 1;
  NK_INCLUDE_DEFAULT_ALLOCATOR = 1;
  NK_INCLUDE_VERTEX_BUFFER_OUTPUT = 1;
  NK_INCLUDE_FONT_BAKING = 1;
  NK_INCLUDE_DEFAULT_FONT = 1;
  HAVE_WINAPIFAMILY_H = 1;
  WINAPI_FAMILY_DESKTOP_APP = 100;
  WINAPI_FAMILY = WINAPI_FAMILY_DESKTOP_APP;
  WINAPI_PARTITION_DESKTOP = (WINAPI_FAMILY=WINAPI_FAMILY_DESKTOP_APP);
  HAVE_WINSDKVER_H = 1;
  HAVE_SDKDDKVER_H = 1;
  HAVE_STDINT_H = 1;
  SIZEOF_VOIDP = 8;
  HAVE_GCC_ATOMICS = 1;
  HAVE_DDRAW_H = 1;
  HAVE_DINPUT_H = 1;
  HAVE_DSOUND_H = 1;
  HAVE_DXGI_H = 1;
  HAVE_XINPUT_H = 1;
  HAVE_WINDOWS_GAMING_INPUT_H = 1;
  HAVE_D3D11_H = 1;
  HAVE_ROAPI_H = 1;
  HAVE_SHELLSCALINGAPI_H = 1;
  HAVE_MMDEVICEAPI_H = 1;
  HAVE_AUDIOCLIENT_H = 1;
  HAVE_TPCSHRD_H = 1;
  HAVE_SENSORSAPI_H = 1;
  HAVE_IMMINTRIN_H = 1;
  HAVE_STDARG_H = 1;
  HAVE_STDDEF_H = 1;
  SDL_AUDIO_DRIVER_WASAPI = 1;
  SDL_AUDIO_DRIVER_DSOUND = 1;
  SDL_AUDIO_DRIVER_WINMM = 1;
  SDL_AUDIO_DRIVER_DISK = 1;
  SDL_AUDIO_DRIVER_DUMMY = 1;
  SDL_JOYSTICK_DINPUT = 1;
  SDL_JOYSTICK_HIDAPI = 1;
  SDL_JOYSTICK_RAWINPUT = 1;
  SDL_JOYSTICK_VIRTUAL = 1;
  SDL_JOYSTICK_WGI = 1;
  SDL_JOYSTICK_XINPUT = 1;
  SDL_HAPTIC_DINPUT = 1;
  SDL_HAPTIC_XINPUT = 1;
  SDL_SENSOR_WINDOWS = 1;
  SDL_LOADSO_WINDOWS = 1;
  SDL_THREAD_GENERIC_COND_SUFFIX = 1;
  SDL_THREAD_WINDOWS = 1;
  SDL_TIMER_WINDOWS = 1;
  SDL_VIDEO_DRIVER_DUMMY = 1;
  SDL_VIDEO_DRIVER_WINDOWS = 1;
  SDL_VIDEO_RENDER_D3D = 1;
  SDL_VIDEO_RENDER_D3D11 = 1;
  SDL_VIDEO_OPENGL = 1;
  SDL_VIDEO_OPENGL_WGL = 1;
  SDL_VIDEO_RENDER_OGL = 1;
  SDL_VIDEO_RENDER_OGL_ES2 = 1;
  SDL_VIDEO_OPENGL_ES2 = 1;
  SDL_VIDEO_OPENGL_EGL = 1;
  SDL_VIDEO_VULKAN = 1;
  SDL_POWER_WINDOWS = 1;
  SDL_FILESYSTEM_WINDOWS = 1;
  SDL_FLT_EPSILON = 1.1920928955078125e-07;
  SDL_PRIX64 = 'I64X';
  M_PI = 3.14159265358979323846264338327950288;
  SDL_ASSERT_LEVEL = 1;
  SDL_LIL_ENDIAN = 1234;
  SDL_BIG_ENDIAN = 4321;
  SDL_BYTEORDER = SDL_LIL_ENDIAN;
  SDL_FLOATWORDORDER = SDL_BYTEORDER;
  SDL_MUTEX_TIMEDOUT = 1;
  SDL_MUTEX_MAXWAIT = ( not 0);
  SDL_RWOPS_UNKNOWN = 0;
  SDL_RWOPS_WINFILE = 1;
  SDL_RWOPS_STDFILE = 2;
  SDL_RWOPS_JNIFILE = 3;
  SDL_RWOPS_MEMORY = 4;
  SDL_RWOPS_MEMORY_RO = 5;
  RW_SEEK_SET = 0;
  RW_SEEK_CUR = 1;
  RW_SEEK_END = 2;
  SDL_AUDIO_MASK_BITSIZE = ($FF);
  SDL_AUDIO_MASK_DATATYPE = (1 shl 8);
  SDL_AUDIO_MASK_ENDIAN = (1 shl 12);
  SDL_AUDIO_MASK_SIGNED = (1 shl 15);
  AUDIO_U8 = $0008;
  AUDIO_S8 = $8008;
  AUDIO_U16LSB = $0010;
  AUDIO_S16LSB = $8010;
  AUDIO_U16MSB = $1010;
  AUDIO_S16MSB = $9010;
  AUDIO_U16 = AUDIO_U16LSB;
  AUDIO_S16 = AUDIO_S16LSB;
  AUDIO_S32LSB = $8020;
  AUDIO_S32MSB = $9020;
  AUDIO_S32 = AUDIO_S32LSB;
  AUDIO_F32LSB = $8120;
  AUDIO_F32MSB = $9120;
  AUDIO_F32 = AUDIO_F32LSB;
  AUDIO_U16SYS = AUDIO_U16LSB;
  AUDIO_S16SYS = AUDIO_S16LSB;
  AUDIO_S32SYS = AUDIO_S32LSB;
  AUDIO_F32SYS = AUDIO_F32LSB;
  SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = $00000001;
  SDL_AUDIO_ALLOW_FORMAT_CHANGE = $00000002;
  SDL_AUDIO_ALLOW_CHANNELS_CHANGE = $00000004;
  SDL_AUDIO_ALLOW_SAMPLES_CHANGE = $00000008;
  SDL_AUDIO_ALLOW_ANY_CHANGE = (SDL_AUDIO_ALLOW_FREQUENCY_CHANGE or SDL_AUDIO_ALLOW_FORMAT_CHANGE or SDL_AUDIO_ALLOW_CHANNELS_CHANGE or SDL_AUDIO_ALLOW_SAMPLES_CHANGE);
  SDL_AUDIOCVT_MAX_FILTERS = 9;
  SDL_MIX_MAXVOLUME = 128;
  SDL_CACHELINE_SIZE = 128;
  SDL_ALPHA_OPAQUE = 255;
  SDL_ALPHA_TRANSPARENT = 0;
  SDL_SWSURFACE = 0;
  SDL_PREALLOC = $00000001;
  SDL_RLEACCEL = $00000002;
  SDL_DONTFREE = $00000004;
  SDL_SIMD_ALIGNED = $00000008;
  SDL_WINDOWPOS_UNDEFINED_MASK = $1FFF0000;
  SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_MASK or 0;
  SDL_WINDOWPOS_CENTERED_MASK = $2FFF0000;
  SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_MASK or 0;
  SDLK_SCANCODE_MASK = (1 shl 30);
  SDL_BUTTON_LEFT = 1;
  SDL_BUTTON_MIDDLE = 2;
  SDL_BUTTON_RIGHT = 3;
  SDL_BUTTON_X1 = 4;
  SDL_BUTTON_X2 = 5;
  SDL_IPHONE_MAX_GFORCE = 5.0;
  SDL_VIRTUAL_JOYSTICK_DESC_VERSION = 1;
  SDL_JOYSTICK_AXIS_MAX = 32767;
  SDL_JOYSTICK_AXIS_MIN = -32768;
  SDL_HAT_CENTERED = $00;
  SDL_HAT_UP = $01;
  SDL_HAT_RIGHT = $02;
  SDL_HAT_DOWN = $04;
  SDL_HAT_LEFT = $08;
  SDL_HAT_RIGHTUP = (SDL_HAT_RIGHT or SDL_HAT_UP);
  SDL_HAT_RIGHTDOWN = (SDL_HAT_RIGHT or SDL_HAT_DOWN);
  SDL_HAT_LEFTUP = (SDL_HAT_LEFT or SDL_HAT_UP);
  SDL_HAT_LEFTDOWN = (SDL_HAT_LEFT or SDL_HAT_DOWN);
  SDL_STANDARD_GRAVITY = 9.80665;
  SDL_TOUCH_MOUSEID = -1;
  SDL_MOUSE_TOUCHID = -1;
  SDL_RELEASED = 0;
  SDL_PRESSED = 1;
  SDL_TEXTEDITINGEVENT_TEXT_SIZE = (32);
  SDL_TEXTINPUTEVENT_TEXT_SIZE = (32);
  SDL_QUERY = -1;
  SDL_IGNORE = 0;
  SDL_DISABLE = 0;
  SDL_ENABLE = 1;
  SDL_HAPTIC_CONSTANT = (1 shl 0);
  SDL_HAPTIC_SINE = (1 shl 1);
  SDL_HAPTIC_LEFTRIGHT = (1 shl 2);
  SDL_HAPTIC_TRIANGLE = (1 shl 3);
  SDL_HAPTIC_SAWTOOTHUP = (1 shl 4);
  SDL_HAPTIC_SAWTOOTHDOWN = (1 shl 5);
  SDL_HAPTIC_RAMP = (1 shl 6);
  SDL_HAPTIC_SPRING = (1 shl 7);
  SDL_HAPTIC_DAMPER = (1 shl 8);
  SDL_HAPTIC_INERTIA = (1 shl 9);
  SDL_HAPTIC_FRICTION = (1 shl 10);
  SDL_HAPTIC_CUSTOM = (1 shl 11);
  SDL_HAPTIC_GAIN = (1 shl 12);
  SDL_HAPTIC_AUTOCENTER = (1 shl 13);
  SDL_HAPTIC_STATUS = (1 shl 14);
  SDL_HAPTIC_PAUSE = (1 shl 15);
  SDL_HAPTIC_POLAR = 0;
  SDL_HAPTIC_CARTESIAN = 1;
  SDL_HAPTIC_SPHERICAL = 2;
  SDL_HAPTIC_STEERING_AXIS = 3;
  SDL_HAPTIC_INFINITY = 4294967295;
  SDL_HINT_ACCELEROMETER_AS_JOYSTICK = 'SDL_ACCELEROMETER_AS_JOYSTICK';
  SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED = 'SDL_ALLOW_ALT_TAB_WHILE_GRABBED';
  SDL_HINT_ALLOW_TOPMOST = 'SDL_ALLOW_TOPMOST';
  SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION = 'SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION';
  SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = 'SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION';
  SDL_HINT_ANDROID_BLOCK_ON_PAUSE = 'SDL_ANDROID_BLOCK_ON_PAUSE';
  SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO = 'SDL_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO';
  SDL_HINT_ANDROID_TRAP_BACK_BUTTON = 'SDL_ANDROID_TRAP_BACK_BUTTON';
  SDL_HINT_APP_NAME = 'SDL_APP_NAME';
  SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS = 'SDL_APPLE_TV_CONTROLLER_UI_EVENTS';
  SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = 'SDL_APPLE_TV_REMOTE_ALLOW_ROTATION';
  SDL_HINT_AUDIO_CATEGORY = 'SDL_AUDIO_CATEGORY';
  SDL_HINT_AUDIO_DEVICE_APP_NAME = 'SDL_AUDIO_DEVICE_APP_NAME';
  SDL_HINT_AUDIO_DEVICE_STREAM_NAME = 'SDL_AUDIO_DEVICE_STREAM_NAME';
  SDL_HINT_AUDIO_DEVICE_STREAM_ROLE = 'SDL_AUDIO_DEVICE_STREAM_ROLE';
  SDL_HINT_AUDIO_RESAMPLING_MODE = 'SDL_AUDIO_RESAMPLING_MODE';
  SDL_HINT_AUTO_UPDATE_JOYSTICKS = 'SDL_AUTO_UPDATE_JOYSTICKS';
  SDL_HINT_AUTO_UPDATE_SENSORS = 'SDL_AUTO_UPDATE_SENSORS';
  SDL_HINT_BMP_SAVE_LEGACY_FORMAT = 'SDL_BMP_SAVE_LEGACY_FORMAT';
  SDL_HINT_DISPLAY_USABLE_BOUNDS = 'SDL_DISPLAY_USABLE_BOUNDS';
  SDL_HINT_EMSCRIPTEN_ASYNCIFY = 'SDL_EMSCRIPTEN_ASYNCIFY';
  SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT = 'SDL_EMSCRIPTEN_KEYBOARD_ELEMENT';
  SDL_HINT_ENABLE_STEAM_CONTROLLERS = 'SDL_ENABLE_STEAM_CONTROLLERS';
  SDL_HINT_EVENT_LOGGING = 'SDL_EVENT_LOGGING';
  SDL_HINT_FORCE_RAISEWINDOW = 'SDL_HINT_FORCE_RAISEWINDOW';
  SDL_HINT_FRAMEBUFFER_ACCELERATION = 'SDL_FRAMEBUFFER_ACCELERATION';
  SDL_HINT_GAMECONTROLLERCONFIG = 'SDL_GAMECONTROLLERCONFIG';
  SDL_HINT_GAMECONTROLLERCONFIG_FILE = 'SDL_GAMECONTROLLERCONFIG_FILE';
  SDL_HINT_GAMECONTROLLERTYPE = 'SDL_GAMECONTROLLERTYPE';
  SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES = 'SDL_GAMECONTROLLER_IGNORE_DEVICES';
  SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = 'SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT';
  SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS = 'SDL_GAMECONTROLLER_USE_BUTTON_LABELS';
  SDL_HINT_GRAB_KEYBOARD = 'SDL_GRAB_KEYBOARD';
  SDL_HINT_HIDAPI_IGNORE_DEVICES = 'SDL_HIDAPI_IGNORE_DEVICES';
  SDL_HINT_IDLE_TIMER_DISABLED = 'SDL_IOS_IDLE_TIMER_DISABLED';
  SDL_HINT_IME_INTERNAL_EDITING = 'SDL_IME_INTERNAL_EDITING';
  SDL_HINT_IME_SHOW_UI = 'SDL_IME_SHOW_UI';
  SDL_HINT_IME_SUPPORT_EXTENDED_TEXT = 'SDL_IME_SUPPORT_EXTENDED_TEXT';
  SDL_HINT_IOS_HIDE_HOME_INDICATOR = 'SDL_IOS_HIDE_HOME_INDICATOR';
  SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = 'SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS';
  SDL_HINT_JOYSTICK_HIDAPI = 'SDL_JOYSTICK_HIDAPI';
  SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE = 'SDL_JOYSTICK_HIDAPI_GAMECUBE';
  SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE = 'SDL_JOYSTICK_GAMECUBE_RUMBLE_BRAKE';
  SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS = 'SDL_JOYSTICK_HIDAPI_JOY_CONS';
  SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS = 'SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS';
  SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS = 'SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS';
  SDL_HINT_JOYSTICK_HIDAPI_LUNA = 'SDL_JOYSTICK_HIDAPI_LUNA';
  SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC = 'SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC';
  SDL_HINT_JOYSTICK_HIDAPI_SHIELD = 'SDL_JOYSTICK_HIDAPI_SHIELD';
  SDL_HINT_JOYSTICK_HIDAPI_PS3 = 'SDL_JOYSTICK_HIDAPI_PS3';
  SDL_HINT_JOYSTICK_HIDAPI_PS4 = 'SDL_JOYSTICK_HIDAPI_PS4';
  SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE = 'SDL_JOYSTICK_HIDAPI_PS4_RUMBLE';
  SDL_HINT_JOYSTICK_HIDAPI_PS5 = 'SDL_JOYSTICK_HIDAPI_PS5';
  SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED = 'SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE = 'SDL_JOYSTICK_HIDAPI_PS5_RUMBLE';
  SDL_HINT_JOYSTICK_HIDAPI_STADIA = 'SDL_JOYSTICK_HIDAPI_STADIA';
  SDL_HINT_JOYSTICK_HIDAPI_STEAM = 'SDL_JOYSTICK_HIDAPI_STEAM';
  SDL_HINT_JOYSTICK_HIDAPI_SWITCH = 'SDL_JOYSTICK_HIDAPI_SWITCH';
  SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED = 'SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED';
  SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED = 'SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED';
  SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED = 'SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_WII = 'SDL_JOYSTICK_HIDAPI_WII';
  SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED = 'SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX = 'SDL_JOYSTICK_HIDAPI_XBOX';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_360 = 'SDL_JOYSTICK_HIDAPI_XBOX_360';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED = 'SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS = 'SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE = 'SDL_JOYSTICK_HIDAPI_XBOX_ONE';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED = 'SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED';
  SDL_HINT_JOYSTICK_RAWINPUT = 'SDL_JOYSTICK_RAWINPUT';
  SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT = 'SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT';
  SDL_HINT_JOYSTICK_ROG_CHAKRAM = 'SDL_JOYSTICK_ROG_CHAKRAM';
  SDL_HINT_JOYSTICK_THREAD = 'SDL_JOYSTICK_THREAD';
  SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER = 'SDL_KMSDRM_REQUIRE_DRM_MASTER';
  SDL_HINT_JOYSTICK_DEVICE = 'SDL_JOYSTICK_DEVICE';
  SDL_HINT_LINUX_DIGITAL_HATS = 'SDL_LINUX_DIGITAL_HATS';
  SDL_HINT_LINUX_HAT_DEADZONES = 'SDL_LINUX_HAT_DEADZONES';
  SDL_HINT_LINUX_JOYSTICK_CLASSIC = 'SDL_LINUX_JOYSTICK_CLASSIC';
  SDL_HINT_LINUX_JOYSTICK_DEADZONES = 'SDL_LINUX_JOYSTICK_DEADZONES';
  SDL_HINT_MAC_BACKGROUND_APP = 'SDL_MAC_BACKGROUND_APP';
  SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = 'SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK';
  SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH = 'SDL_MAC_OPENGL_ASYNC_DISPATCH';
  SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS = 'SDL_MOUSE_DOUBLE_CLICK_RADIUS';
  SDL_HINT_MOUSE_DOUBLE_CLICK_TIME = 'SDL_MOUSE_DOUBLE_CLICK_TIME';
  SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH = 'SDL_MOUSE_FOCUS_CLICKTHROUGH';
  SDL_HINT_MOUSE_NORMAL_SPEED_SCALE = 'SDL_MOUSE_NORMAL_SPEED_SCALE';
  SDL_HINT_MOUSE_RELATIVE_MODE_CENTER = 'SDL_MOUSE_RELATIVE_MODE_CENTER';
  SDL_HINT_MOUSE_RELATIVE_MODE_WARP = 'SDL_MOUSE_RELATIVE_MODE_WARP';
  SDL_HINT_MOUSE_RELATIVE_SCALING = 'SDL_MOUSE_RELATIVE_SCALING';
  SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE = 'SDL_MOUSE_RELATIVE_SPEED_SCALE';
  SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE = 'SDL_MOUSE_RELATIVE_SYSTEM_SCALE';
  SDL_HINT_MOUSE_RELATIVE_WARP_MOTION = 'SDL_MOUSE_RELATIVE_WARP_MOTION';
  SDL_HINT_MOUSE_TOUCH_EVENTS = 'SDL_MOUSE_TOUCH_EVENTS';
  SDL_HINT_MOUSE_AUTO_CAPTURE = 'SDL_MOUSE_AUTO_CAPTURE';
  SDL_HINT_NO_SIGNAL_HANDLERS = 'SDL_NO_SIGNAL_HANDLERS';
  SDL_HINT_OPENGL_ES_DRIVER = 'SDL_OPENGL_ES_DRIVER';
  SDL_HINT_ORIENTATIONS = 'SDL_IOS_ORIENTATIONS';
  SDL_HINT_POLL_SENTINEL = 'SDL_POLL_SENTINEL';
  SDL_HINT_PREFERRED_LOCALES = 'SDL_PREFERRED_LOCALES';
  SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION = 'SDL_QTWAYLAND_CONTENT_ORIENTATION';
  SDL_HINT_QTWAYLAND_WINDOW_FLAGS = 'SDL_QTWAYLAND_WINDOW_FLAGS';
  SDL_HINT_RENDER_BATCHING = 'SDL_RENDER_BATCHING';
  SDL_HINT_RENDER_LINE_METHOD = 'SDL_RENDER_LINE_METHOD';
  SDL_HINT_RENDER_DIRECT3D11_DEBUG = 'SDL_RENDER_DIRECT3D11_DEBUG';
  SDL_HINT_RENDER_DIRECT3D_THREADSAFE = 'SDL_RENDER_DIRECT3D_THREADSAFE';
  SDL_HINT_RENDER_DRIVER = 'SDL_RENDER_DRIVER';
  SDL_HINT_RENDER_LOGICAL_SIZE_MODE = 'SDL_RENDER_LOGICAL_SIZE_MODE';
  SDL_HINT_RENDER_OPENGL_SHADERS = 'SDL_RENDER_OPENGL_SHADERS';
  SDL_HINT_RENDER_SCALE_QUALITY = 'SDL_RENDER_SCALE_QUALITY';
  SDL_HINT_RENDER_VSYNC = 'SDL_RENDER_VSYNC';
  SDL_HINT_PS2_DYNAMIC_VSYNC = 'SDL_PS2_DYNAMIC_VSYNC';
  SDL_HINT_RETURN_KEY_HIDES_IME = 'SDL_RETURN_KEY_HIDES_IME';
  SDL_HINT_RPI_VIDEO_LAYER = 'SDL_RPI_VIDEO_LAYER';
  SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME = 'SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME';
  SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL = 'SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL';
  SDL_HINT_THREAD_PRIORITY_POLICY = 'SDL_THREAD_PRIORITY_POLICY';
  SDL_HINT_THREAD_STACK_SIZE = 'SDL_THREAD_STACK_SIZE';
  SDL_HINT_TIMER_RESOLUTION = 'SDL_TIMER_RESOLUTION';
  SDL_HINT_TOUCH_MOUSE_EVENTS = 'SDL_TOUCH_MOUSE_EVENTS';
  SDL_HINT_VITA_TOUCH_MOUSE_DEVICE = 'SDL_HINT_VITA_TOUCH_MOUSE_DEVICE';
  SDL_HINT_TV_REMOTE_AS_JOYSTICK = 'SDL_TV_REMOTE_AS_JOYSTICK';
  SDL_HINT_VIDEO_ALLOW_SCREENSAVER = 'SDL_VIDEO_ALLOW_SCREENSAVER';
  SDL_HINT_VIDEO_DOUBLE_BUFFER = 'SDL_VIDEO_DOUBLE_BUFFER';
  SDL_HINT_VIDEO_EGL_ALLOW_TRANSPARENCY = 'SDL_VIDEO_EGL_ALLOW_TRANSPARENCY';
  SDL_HINT_VIDEO_EXTERNAL_CONTEXT = 'SDL_VIDEO_EXTERNAL_CONTEXT';
  SDL_HINT_VIDEO_HIGHDPI_DISABLED = 'SDL_VIDEO_HIGHDPI_DISABLED';
  SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES = 'SDL_VIDEO_MAC_FULLSCREEN_SPACES';
  SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS = 'SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS';
  SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR = 'SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR';
  SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR = 'SDL_VIDEO_WAYLAND_PREFER_LIBDECOR';
  SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION = 'SDL_VIDEO_WAYLAND_MODE_EMULATION';
  SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP = 'SDL_VIDEO_WAYLAND_EMULATE_MOUSE_WARP';
  SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT = 'SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT';
  SDL_HINT_VIDEO_FOREIGN_WINDOW_OPENGL = 'SDL_VIDEO_FOREIGN_WINDOW_OPENGL';
  SDL_HINT_VIDEO_FOREIGN_WINDOW_VULKAN = 'SDL_VIDEO_FOREIGN_WINDOW_VULKAN';
  SDL_HINT_VIDEO_WIN_D3DCOMPILER = 'SDL_VIDEO_WIN_D3DCOMPILER';
  SDL_HINT_VIDEO_X11_FORCE_EGL = 'SDL_VIDEO_X11_FORCE_EGL';
  SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = 'SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR';
  SDL_HINT_VIDEO_X11_NET_WM_PING = 'SDL_VIDEO_X11_NET_WM_PING';
  SDL_HINT_VIDEO_X11_WINDOW_VISUALID = 'SDL_VIDEO_X11_WINDOW_VISUALID';
  SDL_HINT_VIDEO_X11_XINERAMA = 'SDL_VIDEO_X11_XINERAMA';
  SDL_HINT_VIDEO_X11_XRANDR = 'SDL_VIDEO_X11_XRANDR';
  SDL_HINT_VIDEO_X11_XVIDMODE = 'SDL_VIDEO_X11_XVIDMODE';
  SDL_HINT_WAVE_FACT_CHUNK = 'SDL_WAVE_FACT_CHUNK';
  SDL_HINT_WAVE_RIFF_CHUNK_SIZE = 'SDL_WAVE_RIFF_CHUNK_SIZE';
  SDL_HINT_WAVE_TRUNCATION = 'SDL_WAVE_TRUNCATION';
  SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING = 'SDL_WINDOWS_DISABLE_THREAD_NAMING';
  SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP = 'SDL_WINDOWS_ENABLE_MESSAGELOOP';
  SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS = 'SDL_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS';
  SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL = 'SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL';
  SDL_HINT_WINDOWS_INTRESOURCE_ICON = 'SDL_WINDOWS_INTRESOURCE_ICON';
  SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL = 'SDL_WINDOWS_INTRESOURCE_ICON_SMALL';
  SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4 = 'SDL_WINDOWS_NO_CLOSE_ON_ALT_F4';
  SDL_HINT_WINDOWS_USE_D3D9EX = 'SDL_WINDOWS_USE_D3D9EX';
  SDL_HINT_WINDOWS_DPI_AWARENESS = 'SDL_WINDOWS_DPI_AWARENESS';
  SDL_HINT_WINDOWS_DPI_SCALING = 'SDL_WINDOWS_DPI_SCALING';
  SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = 'SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN';
  SDL_HINT_WINDOW_NO_ACTIVATION_WHEN_SHOWN = 'SDL_WINDOW_NO_ACTIVATION_WHEN_SHOWN';
  SDL_HINT_WINRT_HANDLE_BACK_BUTTON = 'SDL_WINRT_HANDLE_BACK_BUTTON';
  SDL_HINT_WINRT_PRIVACY_POLICY_LABEL = 'SDL_WINRT_PRIVACY_POLICY_LABEL';
  SDL_HINT_WINRT_PRIVACY_POLICY_URL = 'SDL_WINRT_PRIVACY_POLICY_URL';
  SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT = 'SDL_X11_FORCE_OVERRIDE_REDIRECT';
  SDL_HINT_XINPUT_ENABLED = 'SDL_XINPUT_ENABLED';
  SDL_HINT_DIRECTINPUT_ENABLED = 'SDL_DIRECTINPUT_ENABLED';
  SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING = 'SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING';
  SDL_HINT_AUDIO_INCLUDE_MONITORS = 'SDL_AUDIO_INCLUDE_MONITORS';
  SDL_HINT_X11_WINDOW_TYPE = 'SDL_X11_WINDOW_TYPE';
  SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE = 'SDL_QUIT_ON_LAST_WINDOW_CLOSE';
  SDL_HINT_VIDEODRIVER = 'SDL_VIDEODRIVER';
  SDL_HINT_AUDIODRIVER = 'SDL_AUDIODRIVER';
  SDL_HINT_KMSDRM_DEVICE_INDEX = 'SDL_KMSDRM_DEVICE_INDEX';
  SDL_HINT_TRACKPAD_IS_TOUCH_ONLY = 'SDL_TRACKPAD_IS_TOUCH_ONLY';
  SDL_MAX_LOG_MESSAGE = 4096;
  SDL_NONSHAPEABLE_WINDOW = -1;
  SDL_INVALID_SHAPE_ARGUMENT = -2;
  SDL_WINDOW_LACKS_SHAPE = -3;
  SDL_MAJOR_VERSION = 2;
  SDL_MINOR_VERSION = 26;
  SDL_PATCHLEVEL = 0;
  SDL_INIT_TIMER = $00000001;
  SDL_INIT_AUDIO = $00000010;
  SDL_INIT_VIDEO = $00000020;
  SDL_INIT_JOYSTICK = $00000200;
  SDL_INIT_HAPTIC = $00001000;
  SDL_INIT_GAMECONTROLLER = $00002000;
  SDL_INIT_EVENTS = $00004000;
  SDL_INIT_SENSOR = $00008000;
  SDL_INIT_NOPARACHUTE = $00100000;
  SDL_INIT_EVERYTHING = (SDL_INIT_TIMER or SDL_INIT_AUDIO or SDL_INIT_VIDEO or SDL_INIT_EVENTS or SDL_INIT_JOYSTICK or SDL_INIT_HAPTIC or SDL_INIT_GAMECONTROLLER or SDL_INIT_SENSOR);
  SDL_IMAGE_MAJOR_VERSION = 2;
  SDL_IMAGE_MINOR_VERSION = 7;
  SDL_IMAGE_PATCHLEVEL = 0;
  SDL_MIXER_X = 1;
  SDL_MIXER_MAJOR_VERSION = 2;
  SDL_MIXER_MINOR_VERSION = 6;
  SDL_MIXER_PATCHLEVEL = 0;
  MIX_MAJOR_VERSION = SDL_MIXER_MAJOR_VERSION;
  MIX_MINOR_VERSION = SDL_MIXER_MINOR_VERSION;
  MIX_PATCHLEVEL = SDL_MIXER_PATCHLEVEL;
  MIX_CHANNELS = 8;
  MIX_DEFAULT_FREQUENCY = 44100;
  MIX_DEFAULT_FORMAT = AUDIO_S16LSB;
  MIX_DEFAULT_CHANNELS = 2;
  MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME;
  MIX_CHANNEL_POST = (-2);
  MIX_EFFECTSMAXSPEED = 'MIX_EFFECTSMAXSPEED';
  SDL_NET_MAJOR_VERSION = 2;
  SDL_NET_MINOR_VERSION = 26;
  SDL_NET_PATCHLEVEL = 0;
  INADDR_ANY = $00000000;
  INADDR_NONE = $FFFFFFFF;
  INADDR_LOOPBACK = $7f000001;
  INADDR_BROADCAST = $FFFFFFFF;
  SDLNET_MAX_UDPCHANNELS = 32;
  SDLNET_MAX_UDPADDRESSES = 4;
  SDL_DATA_ALIGNED = 0;
  STBTT_MACSTYLE_DONTCARE = 0;
  STBTT_MACSTYLE_BOLD = 1;
  STBTT_MACSTYLE_ITALIC = 2;
  STBTT_MACSTYLE_UNDERSCORE = 4;
  STBTT_MACSTYLE_NONE = 8;
  PLM_PACKET_INVALID_TS = -1;
  PLM_AUDIO_SAMPLES_PER_FRAME = 1152;
  PLM_BUFFER_DEFAULT_SIZE = (128*1024);
  NK_UNDEFINED = (-1.0);
  NK_UTF_INVALID = $FFFD;
  NK_UTF_SIZE = 4;
  NK_INPUT_MAX = 16;
  NK_MAX_NUMBER_BUFFER = 64;
  NK_SCROLLBAR_HIDING_TIMEOUT = 4.0;
  NK_TEXTEDIT_UNDOSTATECOUNT = 99;
  NK_TEXTEDIT_UNDOCHARCOUNT = 999;
  NK_MAX_LAYOUT_ROW_TEMPLATE_COLUMNS = 16;
  NK_CHART_MAX_SLOT = 4;
  NK_WINDOW_MAX_NAME = 64;
  NK_BUTTON_BEHAVIOR_STACK_SIZE = 8;
  NK_FONT_STACK_SIZE = 8;
  NK_STYLE_ITEM_STACK_SIZE = 16;
  NK_FLOAT_STACK_SIZE = 32;
  NK_VECTOR_STACK_SIZE = 16;
  NK_FLAGS_STACK_SIZE = 32;
  NK_COLOR_STACK_SIZE = 32;
  NK_PI = 3.141592654;
  NK_MAX_FLOAT_PRECISION = 2;

type
  PUint16 = ^Uint16;
  PPUint8 = ^PUint8;
  PPUTF8Char = ^PUTF8Char;
  PUInt8 = ^UInt8;
  PWideChar = ^WideChar;
  PPointer = ^Pointer;
  PNativeUInt = ^NativeUInt;
  P_SDL_iconv_t = Pointer;
  PP_SDL_iconv_t = ^P_SDL_iconv_t;
  PSDL_semaphore = Pointer;
  PPSDL_semaphore = ^PSDL_semaphore;
  P_SDL_AudioStream = Pointer;
  PP_SDL_AudioStream = ^P_SDL_AudioStream;
  P_SDL_Joystick = Pointer;
  PP_SDL_Joystick = ^P_SDL_Joystick;
  P_SDL_Sensor = Pointer;
  PP_SDL_Sensor = ^P_SDL_Sensor;
  P_SDL_GameController = Pointer;
  PP_SDL_GameController = ^P_SDL_GameController;
  P_SDL_Haptic = Pointer;
  PP_SDL_Haptic = ^P_SDL_Haptic;
  PSDL_hid_device_ = Pointer;
  PPSDL_hid_device_ = ^PSDL_hid_device_;
  P_Mix_Music = Pointer;
  PP_Mix_Music = ^P_Mix_Music;
  P_TCPsocket = Pointer;
  PP_TCPsocket = ^P_TCPsocket;
  P_UDPsocket = Pointer;
  PP_UDPsocket = ^P_UDPsocket;
  P_SDLNet_SocketSet = Pointer;
  PP_SDLNet_SocketSet = ^P_SDLNet_SocketSet;
  Pnk_style_slide = Pointer;
  PPnk_style_slide = ^Pnk_style_slide;
  PSDL_AssertData = ^SDL_AssertData;
  PSDL_atomic_t = ^SDL_atomic_t;
  PSDL_RWops = ^SDL_RWops;
  PSDL_AudioSpec = ^SDL_AudioSpec;
  PSDL_AudioCVT = ^SDL_AudioCVT;
  PSDL_Color = ^SDL_Color;
  PSDL_Palette = ^SDL_Palette;
  PSDL_PixelFormat = ^SDL_PixelFormat;
  PSDL_Point = ^SDL_Point;
  PSDL_FPoint = ^SDL_FPoint;
  PSDL_Rect = ^SDL_Rect;
  PSDL_FRect = ^SDL_FRect;
  PSDL_Surface = ^SDL_Surface;
  PPSDL_Surface = ^PSDL_Surface;
  PSDL_DisplayMode = ^SDL_DisplayMode;
  PSDL_Keysym = ^SDL_Keysym;
  PSDL_GUID = ^SDL_GUID;
  PSDL_VirtualJoystickDesc = ^SDL_VirtualJoystickDesc;
  PSDL_GameControllerButtonBind = ^SDL_GameControllerButtonBind;
  PSDL_Finger = ^SDL_Finger;
  PSDL_CommonEvent = ^SDL_CommonEvent;
  PSDL_DisplayEvent = ^SDL_DisplayEvent;
  PSDL_WindowEvent = ^SDL_WindowEvent;
  PSDL_KeyboardEvent = ^SDL_KeyboardEvent;
  PSDL_TextEditingEvent = ^SDL_TextEditingEvent;
  PSDL_TextEditingExtEvent = ^SDL_TextEditingExtEvent;
  PSDL_TextInputEvent = ^SDL_TextInputEvent;
  PSDL_MouseMotionEvent = ^SDL_MouseMotionEvent;
  PSDL_MouseButtonEvent = ^SDL_MouseButtonEvent;
  PSDL_MouseWheelEvent = ^SDL_MouseWheelEvent;
  PSDL_JoyAxisEvent = ^SDL_JoyAxisEvent;
  PSDL_JoyBallEvent = ^SDL_JoyBallEvent;
  PSDL_JoyHatEvent = ^SDL_JoyHatEvent;
  PSDL_JoyButtonEvent = ^SDL_JoyButtonEvent;
  PSDL_JoyDeviceEvent = ^SDL_JoyDeviceEvent;
  PSDL_JoyBatteryEvent = ^SDL_JoyBatteryEvent;
  PSDL_ControllerAxisEvent = ^SDL_ControllerAxisEvent;
  PSDL_ControllerButtonEvent = ^SDL_ControllerButtonEvent;
  PSDL_ControllerDeviceEvent = ^SDL_ControllerDeviceEvent;
  PSDL_ControllerTouchpadEvent = ^SDL_ControllerTouchpadEvent;
  PSDL_ControllerSensorEvent = ^SDL_ControllerSensorEvent;
  PSDL_AudioDeviceEvent = ^SDL_AudioDeviceEvent;
  PSDL_TouchFingerEvent = ^SDL_TouchFingerEvent;
  PSDL_MultiGestureEvent = ^SDL_MultiGestureEvent;
  PSDL_DollarGestureEvent = ^SDL_DollarGestureEvent;
  PSDL_DropEvent = ^SDL_DropEvent;
  PSDL_SensorEvent = ^SDL_SensorEvent;
  PSDL_QuitEvent = ^SDL_QuitEvent;
  PSDL_OSEvent = ^SDL_OSEvent;
  PSDL_UserEvent = ^SDL_UserEvent;
  PSDL_SysWMEvent = ^SDL_SysWMEvent;
  PSDL_HapticDirection = ^SDL_HapticDirection;
  PSDL_HapticConstant = ^SDL_HapticConstant;
  PSDL_HapticCondition = ^SDL_HapticCondition;
  PSDL_HapticRamp = ^SDL_HapticRamp;
  PSDL_HapticLeftRight = ^SDL_HapticLeftRight;
  PSDL_HapticCustom = ^SDL_HapticCustom;
  PSDL_hid_device_info = ^SDL_hid_device_info;
  PSDL_MessageBoxButtonData = ^SDL_MessageBoxButtonData;
  PSDL_MessageBoxColor = ^SDL_MessageBoxColor;
  PSDL_MessageBoxColorScheme = ^SDL_MessageBoxColorScheme;
  PSDL_MessageBoxData = ^SDL_MessageBoxData;
  PSDL_RendererInfo = ^SDL_RendererInfo;
  PSDL_Vertex = ^SDL_Vertex;
  PSDL_WindowShapeMode = ^SDL_WindowShapeMode;
  PSDL_version = ^SDL_version;
  PSDL_Locale = ^SDL_Locale;
  PIMG_Animation = ^IMG_Animation;
  PMix_Chunk = ^Mix_Chunk;
  PIPaddress = ^IPaddress;
  PUDPpacket = ^UDPpacket;
  PPUDPpacket = ^PUDPpacket;
  P_SDLNet_GenericSocket = ^_SDLNet_GenericSocket;
  Pstbtt__buf = ^stbtt__buf;
  Pstbtt_bakedchar = ^stbtt_bakedchar;
  Pstbtt_aligned_quad = ^stbtt_aligned_quad;
  Pstbtt_packedchar = ^stbtt_packedchar;
  Pstbtt_pack_range = ^stbtt_pack_range;
  Pstbtt_pack_context = ^stbtt_pack_context;
  Pstbtt_fontinfo = ^stbtt_fontinfo;
  Pstbtt_kerningentry = ^stbtt_kerningentry;
  Pstbtt_vertex = ^stbtt_vertex;
  PPstbtt_vertex = ^Pstbtt_vertex;
  Pstbtt__bitmap = ^stbtt__bitmap;
  Pplm_packet_t = ^plm_packet_t;
  Pplm_plane_t = ^plm_plane_t;
  Pplm_frame_t = ^plm_frame_t;
  Pplm_samples_t = ^plm_samples_t;
  Pnk_color = ^nk_color;
  Pnk_colorf = ^nk_colorf;
  Pnk_vec2 = ^nk_vec2;
  Pnk_vec2i = ^nk_vec2i;
  Pnk_rect = ^nk_rect;
  Pnk_recti = ^nk_recti;
  Pnk_image = ^nk_image;
  Pnk_nine_slice = ^nk_nine_slice;
  Pnk_cursor = ^nk_cursor;
  Pnk_scroll = ^nk_scroll;
  Pnk_allocator = ^nk_allocator;
  Pnk_draw_null_texture = ^nk_draw_null_texture;
  Pnk_convert_config = ^nk_convert_config;
  Pnk_list_view = ^nk_list_view;
  Pnk_user_font_glyph = ^nk_user_font_glyph;
  Pnk_user_font = ^nk_user_font;
  PPnk_user_font = ^Pnk_user_font;
  Pnk_baked_font = ^nk_baked_font;
  Pnk_font_config = ^nk_font_config;
  Pnk_font_glyph = ^nk_font_glyph;
  Pnk_font = ^nk_font;
  Pnk_font_atlas = ^nk_font_atlas;
  PPnk_font_atlas = ^Pnk_font_atlas;
  Pnk_memory_status = ^nk_memory_status;
  Pnk_buffer_marker = ^nk_buffer_marker;
  Pnk_memory = ^nk_memory;
  Pnk_buffer = ^nk_buffer;
  Pnk_str = ^nk_str;
  Pnk_clipboard = ^nk_clipboard;
  Pnk_text_undo_record = ^nk_text_undo_record;
  Pnk_text_undo_state = ^nk_text_undo_state;
  Pnk_text_edit = ^nk_text_edit;
  Pnk_command = ^nk_command;
  Pnk_command_scissor = ^nk_command_scissor;
  Pnk_command_line = ^nk_command_line;
  Pnk_command_curve = ^nk_command_curve;
  Pnk_command_rect = ^nk_command_rect;
  Pnk_command_rect_filled = ^nk_command_rect_filled;
  Pnk_command_rect_multi_color = ^nk_command_rect_multi_color;
  Pnk_command_triangle = ^nk_command_triangle;
  Pnk_command_triangle_filled = ^nk_command_triangle_filled;
  Pnk_command_circle = ^nk_command_circle;
  Pnk_command_circle_filled = ^nk_command_circle_filled;
  Pnk_command_arc = ^nk_command_arc;
  Pnk_command_arc_filled = ^nk_command_arc_filled;
  Pnk_command_polygon = ^nk_command_polygon;
  Pnk_command_polygon_filled = ^nk_command_polygon_filled;
  Pnk_command_polyline = ^nk_command_polyline;
  Pnk_command_image = ^nk_command_image;
  Pnk_command_custom = ^nk_command_custom;
  Pnk_command_text = ^nk_command_text;
  Pnk_command_buffer = ^nk_command_buffer;
  Pnk_mouse_button = ^nk_mouse_button;
  Pnk_mouse = ^nk_mouse;
  Pnk_key = ^nk_key;
  Pnk_keyboard = ^nk_keyboard;
  Pnk_input = ^nk_input;
  Pnk_draw_vertex_layout_element = ^nk_draw_vertex_layout_element;
  Pnk_draw_command = ^nk_draw_command;
  Pnk_draw_list = ^nk_draw_list;
  Pnk_style_item = ^nk_style_item;
  Pnk_style_text = ^nk_style_text;
  Pnk_style_button = ^nk_style_button;
  Pnk_style_toggle = ^nk_style_toggle;
  Pnk_style_selectable = ^nk_style_selectable;
  Pnk_style_slider = ^nk_style_slider;
  Pnk_style_progress = ^nk_style_progress;
  Pnk_style_scrollbar = ^nk_style_scrollbar;
  Pnk_style_edit = ^nk_style_edit;
  Pnk_style_property = ^nk_style_property;
  Pnk_style_chart = ^nk_style_chart;
  Pnk_style_combo = ^nk_style_combo;
  Pnk_style_tab = ^nk_style_tab;
  Pnk_style_window_header = ^nk_style_window_header;
  Pnk_style_window = ^nk_style_window;
  Pnk_style = ^nk_style;
  Pnk_chart_slot = ^nk_chart_slot;
  Pnk_chart = ^nk_chart;
  Pnk_row_layout = ^nk_row_layout;
  Pnk_popup_buffer = ^nk_popup_buffer;
  Pnk_menu_state = ^nk_menu_state;
  Pnk_panel = ^nk_panel;
  Pnk_popup_state = ^nk_popup_state;
  Pnk_edit_state = ^nk_edit_state;
  Pnk_property_state = ^nk_property_state;
  Pnk_window = ^nk_window;
  Pnk_config_stack_style_item_element = ^nk_config_stack_style_item_element;
  Pnk_config_stack_float_element = ^nk_config_stack_float_element;
  Pnk_config_stack_vec2_element = ^nk_config_stack_vec2_element;
  Pnk_config_stack_flags_element = ^nk_config_stack_flags_element;
  Pnk_config_stack_color_element = ^nk_config_stack_color_element;
  Pnk_config_stack_user_font_element = ^nk_config_stack_user_font_element;
  Pnk_config_stack_button_behavior_element = ^nk_config_stack_button_behavior_element;
  Pnk_config_stack_style_item = ^nk_config_stack_style_item;
  Pnk_config_stack_float = ^nk_config_stack_float;
  Pnk_config_stack_vec2 = ^nk_config_stack_vec2;
  Pnk_config_stack_flags = ^nk_config_stack_flags;
  Pnk_config_stack_color = ^nk_config_stack_color;
  Pnk_config_stack_user_font = ^nk_config_stack_user_font;
  Pnk_config_stack_button_behavior = ^nk_config_stack_button_behavior;
  Pnk_configuration_stacks = ^nk_configuration_stacks;
  Pnk_table = ^nk_table;
  Pnk_page_element = ^nk_page_element;
  Pnk_page = ^nk_page;
  Pnk_pool = ^nk_pool;
  Pnk_context = ^nk_context;

  SDL_bool = (
    SDL_FALSE = 0,
    SDL_TRUE = 1);
  PSDL_bool = ^SDL_bool;
  Sint8 = Int8;
  Sint16 = Int16;
  PSint16 = ^Sint16;
  Sint32 = Int32;
  Sint64 = Int64;

  SDL_DUMMY_ENUM = (
    DUMMY_ENUM_VALUE = 0);
  PSDL_DUMMY_ENUM = ^SDL_DUMMY_ENUM;

  SDL_malloc_func = function(size: NativeUInt): Pointer; cdecl;
  PSDL_malloc_func = ^SDL_malloc_func;

  SDL_calloc_func = function(nmemb: NativeUInt; size: NativeUInt): Pointer; cdecl;
  PSDL_calloc_func = ^SDL_calloc_func;

  SDL_realloc_func = function(mem: Pointer; size: NativeUInt): Pointer; cdecl;
  PSDL_realloc_func = ^SDL_realloc_func;

  SDL_free_func = procedure(mem: Pointer); cdecl;
  PSDL_free_func = ^SDL_free_func;
  SDL_iconv_t = Pointer;
  PSDL_iconv_t = ^SDL_iconv_t;

  SDL_main_func = function(argc: Integer; argv: PPUTF8Char): Integer; cdecl;

  SDL_AssertState = (
    SDL_ASSERTION_RETRY = 0,
    SDL_ASSERTION_BREAK = 1,
    SDL_ASSERTION_ABORT = 2,
    SDL_ASSERTION_IGNORE = 3,
    SDL_ASSERTION_ALWAYS_IGNORE = 4);
  PSDL_AssertState = ^SDL_AssertState;

  SDL_AssertData = record
    always_ignore: Integer;
    trigger_count: Cardinal;
    condition: PUTF8Char;
    filename: PUTF8Char;
    linenum: Integer;
    function_: PUTF8Char;
    next: PSDL_AssertData;
  end;

  SDL_AssertionHandler = function(const data: PSDL_AssertData; userdata: Pointer): SDL_AssertState; cdecl;
  SDL_SpinLock = Integer;
  PSDL_SpinLock = ^SDL_SpinLock;

  SDL_atomic_t = record
    value: Integer;
  end;

  SDL_errorcode = (
    SDL_ENOMEM = 0,
    SDL_EFREAD = 1,
    SDL_EFWRITE = 2,
    SDL_EFSEEK = 3,
    SDL_UNSUPPORTED = 4,
    SDL_LASTERROR = 5);
  PSDL_errorcode = ^SDL_errorcode;
  PSDL_mutex = Pointer;
  PPSDL_mutex = ^PSDL_mutex;
  PSDL_sem = Pointer;
  PPSDL_sem = ^PSDL_sem;
  PSDL_cond = Pointer;
  PPSDL_cond = ^PSDL_cond;
  PSDL_Thread = Pointer;
  PPSDL_Thread = ^PSDL_Thread;
  SDL_threadID_ = Cardinal;
  SDL_TLSID = Cardinal;

  SDL_ThreadPriority = (
    SDL_THREAD_PRIORITY_LOW = 0,
    SDL_THREAD_PRIORITY_NORMAL = 1,
    SDL_THREAD_PRIORITY_HIGH = 2,
    SDL_THREAD_PRIORITY_TIME_CRITICAL = 3);
  PSDL_ThreadPriority = ^SDL_ThreadPriority;

  SDL_ThreadFunction = function(data: Pointer): Integer; cdecl;

  pfnSDL_CurrentBeginThread_func = Pointer;
  pfnSDL_CurrentBeginThread = function(p1: Pointer; p2: Cardinal; func: pfnSDL_CurrentBeginThread_func; p4: Pointer; p5: Cardinal; p6: PCardinal): UIntPtr; cdecl;

  pfnSDL_CurrentEndThread = procedure(code: Cardinal); cdecl;

  _anonymous_type_1 = record
    data: Pointer;
    size: NativeUInt;
    left: NativeUInt;
  end;
  P_anonymous_type_1 = ^_anonymous_type_1;

  _anonymous_type_2 = record
    append: SDL_bool;
    h: Pointer;
    buffer: _anonymous_type_1;
  end;
  P_anonymous_type_2 = ^_anonymous_type_2;

  _anonymous_type_3 = record
    base: PUint8;
    here: PUint8;
    stop: PUint8;
  end;
  P_anonymous_type_3 = ^_anonymous_type_3;

  _anonymous_type_4 = record
    data1: Pointer;
    data2: Pointer;
  end;
  P_anonymous_type_4 = ^_anonymous_type_4;

  _anonymous_type_5 = record
    case Integer of
      0: (windowsio: _anonymous_type_2);
      1: (mem: _anonymous_type_3);
      2: (unknown: _anonymous_type_4);
  end;
  P_anonymous_type_5 = ^_anonymous_type_5;

  SDL_RWops = record
    size: function(context: PSDL_RWops): Sint64; cdecl;
    seek: function(context: PSDL_RWops; offset: Sint64; whence: Integer): Sint64; cdecl;
    read: function(context: PSDL_RWops; ptr: Pointer; size: NativeUInt; maxnum: NativeUInt): NativeUInt; cdecl;
    write: function(context: PSDL_RWops; const ptr: Pointer; size: NativeUInt; num: NativeUInt): NativeUInt; cdecl;
    close: function(context: PSDL_RWops): Integer; cdecl;
    type_: Uint32;
    hidden: _anonymous_type_5;
  end;

  SDL_AudioFormat = Uint16;

  SDL_AudioCallback = procedure(userdata: Pointer; stream: PUint8; len: Integer); cdecl;

  SDL_AudioSpec = record
    freq: Integer;
    format: SDL_AudioFormat;
    channels: Uint8;
    silence: Uint8;
    samples: Uint16;
    padding: Uint16;
    size: Uint32;
    callback: SDL_AudioCallback;
    userdata: Pointer;
  end;

  SDL_AudioFilter = procedure(cvt: PSDL_AudioCVT; format: SDL_AudioFormat); cdecl;

  SDL_AudioCVT = record
    needed: Integer;
    src_format: SDL_AudioFormat;
    dst_format: SDL_AudioFormat;
    rate_incr: Double;
    buf: PUint8;
    len: Integer;
    len_cvt: Integer;
    len_mult: Integer;
    len_ratio: Double;
    filters: array [0..9] of SDL_AudioFilter;
    filter_index: Integer;
  end;

  SDL_AudioDeviceID = Uint32;

  SDL_AudioStatus = (
    SDL_AUDIO_STOPPED = 0,
    SDL_AUDIO_PLAYING = 1,
    SDL_AUDIO_PAUSED = 2);
  PSDL_AudioStatus = ^SDL_AudioStatus;
  PSDL_AudioStream = Pointer;
  PPSDL_AudioStream = ^PSDL_AudioStream;

  SDL_PixelType = (
    SDL_PIXELTYPE_UNKNOWN = 0,
    SDL_PIXELTYPE_INDEX1 = 1,
    SDL_PIXELTYPE_INDEX4 = 2,
    SDL_PIXELTYPE_INDEX8 = 3,
    SDL_PIXELTYPE_PACKED8 = 4,
    SDL_PIXELTYPE_PACKED16 = 5,
    SDL_PIXELTYPE_PACKED32 = 6,
    SDL_PIXELTYPE_ARRAYU8 = 7,
    SDL_PIXELTYPE_ARRAYU16 = 8,
    SDL_PIXELTYPE_ARRAYU32 = 9,
    SDL_PIXELTYPE_ARRAYF16 = 10,
    SDL_PIXELTYPE_ARRAYF32 = 11);
  PSDL_PixelType = ^SDL_PixelType;

  SDL_BitmapOrder = (
    SDL_BITMAPORDER_NONE = 0,
    SDL_BITMAPORDER_4321 = 1,
    SDL_BITMAPORDER_1234 = 2);
  PSDL_BitmapOrder = ^SDL_BitmapOrder;

  SDL_PackedOrder = (
    SDL_PACKEDORDER_NONE = 0,
    SDL_PACKEDORDER_XRGB = 1,
    SDL_PACKEDORDER_RGBX = 2,
    SDL_PACKEDORDER_ARGB = 3,
    SDL_PACKEDORDER_RGBA = 4,
    SDL_PACKEDORDER_XBGR = 5,
    SDL_PACKEDORDER_BGRX = 6,
    SDL_PACKEDORDER_ABGR = 7,
    SDL_PACKEDORDER_BGRA = 8);
  PSDL_PackedOrder = ^SDL_PackedOrder;

  SDL_ArrayOrder = (
    SDL_ARRAYORDER_NONE = 0,
    SDL_ARRAYORDER_RGB = 1,
    SDL_ARRAYORDER_RGBA = 2,
    SDL_ARRAYORDER_ARGB = 3,
    SDL_ARRAYORDER_BGR = 4,
    SDL_ARRAYORDER_BGRA = 5,
    SDL_ARRAYORDER_ABGR = 6);
  PSDL_ArrayOrder = ^SDL_ArrayOrder;

  SDL_PackedLayout = (
    SDL_PACKEDLAYOUT_NONE = 0,
    SDL_PACKEDLAYOUT_332 = 1,
    SDL_PACKEDLAYOUT_4444 = 2,
    SDL_PACKEDLAYOUT_1555 = 3,
    SDL_PACKEDLAYOUT_5551 = 4,
    SDL_PACKEDLAYOUT_565 = 5,
    SDL_PACKEDLAYOUT_8888 = 6,
    SDL_PACKEDLAYOUT_2101010 = 7,
    SDL_PACKEDLAYOUT_1010102 = 8);
  PSDL_PackedLayout = ^SDL_PackedLayout;

  SDL_PixelFormatEnum = (
    SDL_PIXELFORMAT_UNKNOWN = 0,
    SDL_PIXELFORMAT_INDEX1LSB = 286261504,
    SDL_PIXELFORMAT_INDEX1MSB = 287310080,
    SDL_PIXELFORMAT_INDEX4LSB = 303039488,
    SDL_PIXELFORMAT_INDEX4MSB = 304088064,
    SDL_PIXELFORMAT_INDEX8 = 318769153,
    SDL_PIXELFORMAT_RGB332 = 336660481,
    SDL_PIXELFORMAT_XRGB4444 = 353504258,
    SDL_PIXELFORMAT_RGB444 = 353504258,
    SDL_PIXELFORMAT_XBGR4444 = 357698562,
    SDL_PIXELFORMAT_BGR444 = 357698562,
    SDL_PIXELFORMAT_XRGB1555 = 353570562,
    SDL_PIXELFORMAT_RGB555 = 353570562,
    SDL_PIXELFORMAT_XBGR1555 = 357764866,
    SDL_PIXELFORMAT_BGR555 = 357764866,
    SDL_PIXELFORMAT_ARGB4444 = 355602434,
    SDL_PIXELFORMAT_RGBA4444 = 356651010,
    SDL_PIXELFORMAT_ABGR4444 = 359796738,
    SDL_PIXELFORMAT_BGRA4444 = 360845314,
    SDL_PIXELFORMAT_ARGB1555 = 355667970,
    SDL_PIXELFORMAT_RGBA5551 = 356782082,
    SDL_PIXELFORMAT_ABGR1555 = 359862274,
    SDL_PIXELFORMAT_BGRA5551 = 360976386,
    SDL_PIXELFORMAT_RGB565 = 353701890,
    SDL_PIXELFORMAT_BGR565 = 357896194,
    SDL_PIXELFORMAT_RGB24 = 386930691,
    SDL_PIXELFORMAT_BGR24 = 390076419,
    SDL_PIXELFORMAT_XRGB8888 = 370546692,
    SDL_PIXELFORMAT_RGB888 = 370546692,
    SDL_PIXELFORMAT_RGBX8888 = 371595268,
    SDL_PIXELFORMAT_XBGR8888 = 374740996,
    SDL_PIXELFORMAT_BGR888 = 374740996,
    SDL_PIXELFORMAT_BGRX8888 = 375789572,
    SDL_PIXELFORMAT_ARGB8888 = 372645892,
    SDL_PIXELFORMAT_RGBA8888 = 373694468,
    SDL_PIXELFORMAT_ABGR8888 = 376840196,
    SDL_PIXELFORMAT_BGRA8888 = 377888772,
    SDL_PIXELFORMAT_ARGB2101010 = 372711428,
    SDL_PIXELFORMAT_RGBA32 = 376840196,
    SDL_PIXELFORMAT_ARGB32 = 377888772,
    SDL_PIXELFORMAT_BGRA32 = 372645892,
    SDL_PIXELFORMAT_ABGR32 = 373694468,
    SDL_PIXELFORMAT_YV12 = 842094169,
    SDL_PIXELFORMAT_IYUV = 1448433993,
    SDL_PIXELFORMAT_YUY2 = 844715353,
    SDL_PIXELFORMAT_UYVY = 1498831189,
    SDL_PIXELFORMAT_YVYU = 1431918169,
    SDL_PIXELFORMAT_NV12 = 842094158,
    SDL_PIXELFORMAT_NV21 = 825382478,
    SDL_PIXELFORMAT_EXTERNAL_OES = 542328143);
  PSDL_PixelFormatEnum = ^SDL_PixelFormatEnum;

  SDL_Color = record
    r: Uint8;
    g: Uint8;
    b: Uint8;
    a: Uint8;
  end;

  SDL_Palette = record
    ncolors: Integer;
    colors: PSDL_Color;
    version: Uint32;
    refcount: Integer;
  end;

  SDL_PixelFormat = record
    format: Uint32;
    palette: PSDL_Palette;
    BitsPerPixel: Uint8;
    BytesPerPixel: Uint8;
    padding: array [0..1] of Uint8;
    Rmask: Uint32;
    Gmask: Uint32;
    Bmask: Uint32;
    Amask: Uint32;
    Rloss: Uint8;
    Gloss: Uint8;
    Bloss: Uint8;
    Aloss: Uint8;
    Rshift: Uint8;
    Gshift: Uint8;
    Bshift: Uint8;
    Ashift: Uint8;
    refcount: Integer;
    next: PSDL_PixelFormat;
  end;

  SDL_Point = record
    x: Integer;
    y: Integer;
  end;

  SDL_FPoint = record
    x: Single;
    y: Single;
  end;

  SDL_Rect = record
    x: Integer;
    y: Integer;
    w: Integer;
    h: Integer;
  end;

  SDL_FRect = record
    x: Single;
    y: Single;
    w: Single;
    h: Single;
  end;

  SDL_BlendMode = (
    SDL_BLENDMODE_NONE = 0,
    SDL_BLENDMODE_BLEND = 1,
    SDL_BLENDMODE_ADD = 2,
    SDL_BLENDMODE_MOD = 4,
    SDL_BLENDMODE_MUL = 8,
    SDL_BLENDMODE_INVALID = 2147483647);
  PSDL_BlendMode = ^SDL_BlendMode;

  SDL_BlendOperation = (
    SDL_BLENDOPERATION_ADD = 1,
    SDL_BLENDOPERATION_SUBTRACT = 2,
    SDL_BLENDOPERATION_REV_SUBTRACT = 3,
    SDL_BLENDOPERATION_MINIMUM = 4,
    SDL_BLENDOPERATION_MAXIMUM = 5);
  PSDL_BlendOperation = ^SDL_BlendOperation;

  SDL_BlendFactor = (
    SDL_BLENDFACTOR_ZERO = 1,
    SDL_BLENDFACTOR_ONE = 2,
    SDL_BLENDFACTOR_SRC_COLOR = 3,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 4,
    SDL_BLENDFACTOR_SRC_ALPHA = 5,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 6,
    SDL_BLENDFACTOR_DST_COLOR = 7,
    SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 8,
    SDL_BLENDFACTOR_DST_ALPHA = 9,
    SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 10);
  PSDL_BlendFactor = ^SDL_BlendFactor;
  PSDL_BlitMap = Pointer;
  PPSDL_BlitMap = ^PSDL_BlitMap;

  SDL_Surface = record
    flags: Uint32;
    format: PSDL_PixelFormat;
    w: Integer;
    h: Integer;
    pitch: Integer;
    pixels: Pointer;
    userdata: Pointer;
    locked: Integer;
    list_blitmap: Pointer;
    clip_rect: SDL_Rect;
    map: PSDL_BlitMap;
    refcount: Integer;
  end;

  SDL_blit = function(src: PSDL_Surface; srcrect: PSDL_Rect; dst: PSDL_Surface; dstrect: PSDL_Rect): Integer; cdecl;

  SDL_YUV_CONVERSION_MODE = (
    SDL_YUV_CONVERSION_JPEG = 0,
    SDL_YUV_CONVERSION_BT601 = 1,
    SDL_YUV_CONVERSION_BT709 = 2,
    SDL_YUV_CONVERSION_AUTOMATIC = 3);
  PSDL_YUV_CONVERSION_MODE = ^SDL_YUV_CONVERSION_MODE;

  SDL_DisplayMode = record
    format: Uint32;
    w: Integer;
    h: Integer;
    refresh_rate: Integer;
    driverdata: Pointer;
  end;

  PSDL_Window = Pointer;
  PPSDL_Window = ^PSDL_Window;

  SDL_WindowFlags = (
    SDL_WINDOW_FULLSCREEN = 1,
    SDL_WINDOW_OPENGL = 2,
    SDL_WINDOW_SHOWN = 4,
    SDL_WINDOW_HIDDEN = 8,
    SDL_WINDOW_BORDERLESS = 16,
    SDL_WINDOW_RESIZABLE = 32,
    SDL_WINDOW_MINIMIZED = 64,
    SDL_WINDOW_MAXIMIZED = 128,
    SDL_WINDOW_MOUSE_GRABBED = 256,
    SDL_WINDOW_INPUT_FOCUS = 512,
    SDL_WINDOW_MOUSE_FOCUS = 1024,
    SDL_WINDOW_FULLSCREEN_DESKTOP = 4097,
    SDL_WINDOW_FOREIGN = 2048,
    SDL_WINDOW_ALLOW_HIGHDPI = 8192,
    SDL_WINDOW_MOUSE_CAPTURE = 16384,
    SDL_WINDOW_ALWAYS_ON_TOP = 32768,
    SDL_WINDOW_SKIP_TASKBAR = 65536,
    SDL_WINDOW_UTILITY = 131072,
    SDL_WINDOW_TOOLTIP = 262144,
    SDL_WINDOW_POPUP_MENU = 524288,
    SDL_WINDOW_KEYBOARD_GRABBED = 1048576,
    SDL_WINDOW_VULKAN = 268435456,
    SDL_WINDOW_METAL = 536870912,
    SDL_WINDOW_INPUT_GRABBED = 256);
  PSDL_WindowFlags = ^SDL_WindowFlags;

  SDL_WindowEventID = (
    SDL_WINDOWEVENT_NONE = 0,
    SDL_WINDOWEVENT_SHOWN = 1,
    SDL_WINDOWEVENT_HIDDEN = 2,
    SDL_WINDOWEVENT_EXPOSED = 3,
    SDL_WINDOWEVENT_MOVED = 4,
    SDL_WINDOWEVENT_RESIZED = 5,
    SDL_WINDOWEVENT_SIZE_CHANGED = 6,
    SDL_WINDOWEVENT_MINIMIZED = 7,
    SDL_WINDOWEVENT_MAXIMIZED = 8,
    SDL_WINDOWEVENT_RESTORED = 9,
    SDL_WINDOWEVENT_ENTER = 10,
    SDL_WINDOWEVENT_LEAVE = 11,
    SDL_WINDOWEVENT_FOCUS_GAINED = 12,
    SDL_WINDOWEVENT_FOCUS_LOST = 13,
    SDL_WINDOWEVENT_CLOSE = 14,
    SDL_WINDOWEVENT_TAKE_FOCUS = 15,
    SDL_WINDOWEVENT_HIT_TEST = 16,
    SDL_WINDOWEVENT_ICCPROF_CHANGED = 17,
    SDL_WINDOWEVENT_DISPLAY_CHANGED = 18);
  PSDL_WindowEventID = ^SDL_WindowEventID;

  SDL_DisplayEventID = (
    SDL_DISPLAYEVENT_NONE = 0,
    SDL_DISPLAYEVENT_ORIENTATION = 1,
    SDL_DISPLAYEVENT_CONNECTED = 2,
    SDL_DISPLAYEVENT_DISCONNECTED = 3);
  PSDL_DisplayEventID = ^SDL_DisplayEventID;

  SDL_DisplayOrientation = (
    SDL_ORIENTATION_UNKNOWN = 0,
    SDL_ORIENTATION_LANDSCAPE = 1,
    SDL_ORIENTATION_LANDSCAPE_FLIPPED = 2,
    SDL_ORIENTATION_PORTRAIT = 3,
    SDL_ORIENTATION_PORTRAIT_FLIPPED = 4);
  PSDL_DisplayOrientation = ^SDL_DisplayOrientation;

  SDL_FlashOperation = (
    SDL_FLASH_CANCEL = 0,
    SDL_FLASH_BRIEFLY = 1,
    SDL_FLASH_UNTIL_FOCUSED = 2);
  PSDL_FlashOperation = ^SDL_FlashOperation;
  SDL_GLContext = Pointer;

  SDL_GLattr = (
    SDL_GL_RED_SIZE = 0,
    SDL_GL_GREEN_SIZE = 1,
    SDL_GL_BLUE_SIZE = 2,
    SDL_GL_ALPHA_SIZE = 3,
    SDL_GL_BUFFER_SIZE = 4,
    SDL_GL_DOUBLEBUFFER = 5,
    SDL_GL_DEPTH_SIZE = 6,
    SDL_GL_STENCIL_SIZE = 7,
    SDL_GL_ACCUM_RED_SIZE = 8,
    SDL_GL_ACCUM_GREEN_SIZE = 9,
    SDL_GL_ACCUM_BLUE_SIZE = 10,
    SDL_GL_ACCUM_ALPHA_SIZE = 11,
    SDL_GL_STEREO = 12,
    SDL_GL_MULTISAMPLEBUFFERS = 13,
    SDL_GL_MULTISAMPLESAMPLES = 14,
    SDL_GL_ACCELERATED_VISUAL = 15,
    SDL_GL_RETAINED_BACKING = 16,
    SDL_GL_CONTEXT_MAJOR_VERSION = 17,
    SDL_GL_CONTEXT_MINOR_VERSION = 18,
    SDL_GL_CONTEXT_EGL = 19,
    SDL_GL_CONTEXT_FLAGS = 20,
    SDL_GL_CONTEXT_PROFILE_MASK = 21,
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT = 22,
    SDL_GL_FRAMEBUFFER_SRGB_CAPABLE = 23,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR = 24,
    SDL_GL_CONTEXT_RESET_NOTIFICATION = 25,
    SDL_GL_CONTEXT_NO_ERROR = 26,
    SDL_GL_FLOATBUFFERS = 27);
  PSDL_GLattr = ^SDL_GLattr;

  SDL_GLprofile = (
    SDL_GL_CONTEXT_PROFILE_CORE = 1,
    SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 2,
    SDL_GL_CONTEXT_PROFILE_ES = 4);
  PSDL_GLprofile = ^SDL_GLprofile;

  SDL_GLcontextFlag = (
    SDL_GL_CONTEXT_DEBUG_FLAG = 1,
    SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 2,
    SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 4,
    SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 8);
  PSDL_GLcontextFlag = ^SDL_GLcontextFlag;

  SDL_GLcontextReleaseFlag = (
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 1);
  PSDL_GLcontextReleaseFlag = ^SDL_GLcontextReleaseFlag;

  SDL_GLContextResetNotification = (
    SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0,
    SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = 1);
  PSDL_GLContextResetNotification = ^SDL_GLContextResetNotification;

  SDL_HitTestResult = (
    SDL_HITTEST_NORMAL = 0,
    SDL_HITTEST_DRAGGABLE = 1,
    SDL_HITTEST_RESIZE_TOPLEFT = 2,
    SDL_HITTEST_RESIZE_TOP = 3,
    SDL_HITTEST_RESIZE_TOPRIGHT = 4,
    SDL_HITTEST_RESIZE_RIGHT = 5,
    SDL_HITTEST_RESIZE_BOTTOMRIGHT = 6,
    SDL_HITTEST_RESIZE_BOTTOM = 7,
    SDL_HITTEST_RESIZE_BOTTOMLEFT = 8,
    SDL_HITTEST_RESIZE_LEFT = 9);
  PSDL_HitTestResult = ^SDL_HitTestResult;

  SDL_HitTest = function(win: PSDL_Window; const area: PSDL_Point; data: Pointer): SDL_HitTestResult; cdecl;

  SDL_Scancode = (
    SDL_SCANCODE_UNKNOWN = 0,
    SDL_SCANCODE_A = 4,
    SDL_SCANCODE_B = 5,
    SDL_SCANCODE_C = 6,
    SDL_SCANCODE_D = 7,
    SDL_SCANCODE_E = 8,
    SDL_SCANCODE_F = 9,
    SDL_SCANCODE_G = 10,
    SDL_SCANCODE_H = 11,
    SDL_SCANCODE_I = 12,
    SDL_SCANCODE_J = 13,
    SDL_SCANCODE_K = 14,
    SDL_SCANCODE_L = 15,
    SDL_SCANCODE_M = 16,
    SDL_SCANCODE_N = 17,
    SDL_SCANCODE_O = 18,
    SDL_SCANCODE_P = 19,
    SDL_SCANCODE_Q = 20,
    SDL_SCANCODE_R = 21,
    SDL_SCANCODE_S = 22,
    SDL_SCANCODE_T = 23,
    SDL_SCANCODE_U = 24,
    SDL_SCANCODE_V = 25,
    SDL_SCANCODE_W = 26,
    SDL_SCANCODE_X = 27,
    SDL_SCANCODE_Y = 28,
    SDL_SCANCODE_Z = 29,
    SDL_SCANCODE_1 = 30,
    SDL_SCANCODE_2 = 31,
    SDL_SCANCODE_3 = 32,
    SDL_SCANCODE_4 = 33,
    SDL_SCANCODE_5 = 34,
    SDL_SCANCODE_6 = 35,
    SDL_SCANCODE_7 = 36,
    SDL_SCANCODE_8 = 37,
    SDL_SCANCODE_9 = 38,
    SDL_SCANCODE_0 = 39,
    SDL_SCANCODE_RETURN = 40,
    SDL_SCANCODE_ESCAPE = 41,
    SDL_SCANCODE_BACKSPACE = 42,
    SDL_SCANCODE_TAB = 43,
    SDL_SCANCODE_SPACE = 44,
    SDL_SCANCODE_MINUS = 45,
    SDL_SCANCODE_EQUALS = 46,
    SDL_SCANCODE_LEFTBRACKET = 47,
    SDL_SCANCODE_RIGHTBRACKET = 48,
    SDL_SCANCODE_BACKSLASH = 49,
    SDL_SCANCODE_NONUSHASH = 50,
    SDL_SCANCODE_SEMICOLON = 51,
    SDL_SCANCODE_APOSTROPHE = 52,
    SDL_SCANCODE_GRAVE = 53,
    SDL_SCANCODE_COMMA = 54,
    SDL_SCANCODE_PERIOD = 55,
    SDL_SCANCODE_SLASH = 56,
    SDL_SCANCODE_CAPSLOCK = 57,
    SDL_SCANCODE_F1 = 58,
    SDL_SCANCODE_F2 = 59,
    SDL_SCANCODE_F3 = 60,
    SDL_SCANCODE_F4 = 61,
    SDL_SCANCODE_F5 = 62,
    SDL_SCANCODE_F6 = 63,
    SDL_SCANCODE_F7 = 64,
    SDL_SCANCODE_F8 = 65,
    SDL_SCANCODE_F9 = 66,
    SDL_SCANCODE_F10 = 67,
    SDL_SCANCODE_F11 = 68,
    SDL_SCANCODE_F12 = 69,
    SDL_SCANCODE_PRINTSCREEN = 70,
    SDL_SCANCODE_SCROLLLOCK = 71,
    SDL_SCANCODE_PAUSE = 72,
    SDL_SCANCODE_INSERT = 73,
    SDL_SCANCODE_HOME = 74,
    SDL_SCANCODE_PAGEUP = 75,
    SDL_SCANCODE_DELETE = 76,
    SDL_SCANCODE_END = 77,
    SDL_SCANCODE_PAGEDOWN = 78,
    SDL_SCANCODE_RIGHT = 79,
    SDL_SCANCODE_LEFT = 80,
    SDL_SCANCODE_DOWN = 81,
    SDL_SCANCODE_UP = 82,
    SDL_SCANCODE_NUMLOCKCLEAR = 83,
    SDL_SCANCODE_KP_DIVIDE = 84,
    SDL_SCANCODE_KP_MULTIPLY = 85,
    SDL_SCANCODE_KP_MINUS = 86,
    SDL_SCANCODE_KP_PLUS = 87,
    SDL_SCANCODE_KP_ENTER = 88,
    SDL_SCANCODE_KP_1 = 89,
    SDL_SCANCODE_KP_2 = 90,
    SDL_SCANCODE_KP_3 = 91,
    SDL_SCANCODE_KP_4 = 92,
    SDL_SCANCODE_KP_5 = 93,
    SDL_SCANCODE_KP_6 = 94,
    SDL_SCANCODE_KP_7 = 95,
    SDL_SCANCODE_KP_8 = 96,
    SDL_SCANCODE_KP_9 = 97,
    SDL_SCANCODE_KP_0 = 98,
    SDL_SCANCODE_KP_PERIOD = 99,
    SDL_SCANCODE_NONUSBACKSLASH = 100,
    SDL_SCANCODE_APPLICATION = 101,
    SDL_SCANCODE_POWER = 102,
    SDL_SCANCODE_KP_EQUALS = 103,
    SDL_SCANCODE_F13 = 104,
    SDL_SCANCODE_F14 = 105,
    SDL_SCANCODE_F15 = 106,
    SDL_SCANCODE_F16 = 107,
    SDL_SCANCODE_F17 = 108,
    SDL_SCANCODE_F18 = 109,
    SDL_SCANCODE_F19 = 110,
    SDL_SCANCODE_F20 = 111,
    SDL_SCANCODE_F21 = 112,
    SDL_SCANCODE_F22 = 113,
    SDL_SCANCODE_F23 = 114,
    SDL_SCANCODE_F24 = 115,
    SDL_SCANCODE_EXECUTE = 116,
    SDL_SCANCODE_HELP = 117,
    SDL_SCANCODE_MENU = 118,
    SDL_SCANCODE_SELECT = 119,
    SDL_SCANCODE_STOP = 120,
    SDL_SCANCODE_AGAIN = 121,
    SDL_SCANCODE_UNDO = 122,
    SDL_SCANCODE_CUT = 123,
    SDL_SCANCODE_COPY = 124,
    SDL_SCANCODE_PASTE = 125,
    SDL_SCANCODE_FIND = 126,
    SDL_SCANCODE_MUTE = 127,
    SDL_SCANCODE_VOLUMEUP = 128,
    SDL_SCANCODE_VOLUMEDOWN = 129,
    SDL_SCANCODE_KP_COMMA = 133,
    SDL_SCANCODE_KP_EQUALSAS400 = 134,
    SDL_SCANCODE_INTERNATIONAL1 = 135,
    SDL_SCANCODE_INTERNATIONAL2 = 136,
    SDL_SCANCODE_INTERNATIONAL3 = 137,
    SDL_SCANCODE_INTERNATIONAL4 = 138,
    SDL_SCANCODE_INTERNATIONAL5 = 139,
    SDL_SCANCODE_INTERNATIONAL6 = 140,
    SDL_SCANCODE_INTERNATIONAL7 = 141,
    SDL_SCANCODE_INTERNATIONAL8 = 142,
    SDL_SCANCODE_INTERNATIONAL9 = 143,
    SDL_SCANCODE_LANG1 = 144,
    SDL_SCANCODE_LANG2 = 145,
    SDL_SCANCODE_LANG3 = 146,
    SDL_SCANCODE_LANG4 = 147,
    SDL_SCANCODE_LANG5 = 148,
    SDL_SCANCODE_LANG6 = 149,
    SDL_SCANCODE_LANG7 = 150,
    SDL_SCANCODE_LANG8 = 151,
    SDL_SCANCODE_LANG9 = 152,
    SDL_SCANCODE_ALTERASE = 153,
    SDL_SCANCODE_SYSREQ = 154,
    SDL_SCANCODE_CANCEL = 155,
    SDL_SCANCODE_CLEAR = 156,
    SDL_SCANCODE_PRIOR = 157,
    SDL_SCANCODE_RETURN2 = 158,
    SDL_SCANCODE_SEPARATOR = 159,
    SDL_SCANCODE_OUT = 160,
    SDL_SCANCODE_OPER = 161,
    SDL_SCANCODE_CLEARAGAIN = 162,
    SDL_SCANCODE_CRSEL = 163,
    SDL_SCANCODE_EXSEL = 164,
    SDL_SCANCODE_KP_00 = 176,
    SDL_SCANCODE_KP_000 = 177,
    SDL_SCANCODE_THOUSANDSSEPARATOR = 178,
    SDL_SCANCODE_DECIMALSEPARATOR = 179,
    SDL_SCANCODE_CURRENCYUNIT = 180,
    SDL_SCANCODE_CURRENCYSUBUNIT = 181,
    SDL_SCANCODE_KP_LEFTPAREN = 182,
    SDL_SCANCODE_KP_RIGHTPAREN = 183,
    SDL_SCANCODE_KP_LEFTBRACE = 184,
    SDL_SCANCODE_KP_RIGHTBRACE = 185,
    SDL_SCANCODE_KP_TAB = 186,
    SDL_SCANCODE_KP_BACKSPACE = 187,
    SDL_SCANCODE_KP_A = 188,
    SDL_SCANCODE_KP_B = 189,
    SDL_SCANCODE_KP_C = 190,
    SDL_SCANCODE_KP_D = 191,
    SDL_SCANCODE_KP_E = 192,
    SDL_SCANCODE_KP_F = 193,
    SDL_SCANCODE_KP_XOR = 194,
    SDL_SCANCODE_KP_POWER = 195,
    SDL_SCANCODE_KP_PERCENT = 196,
    SDL_SCANCODE_KP_LESS = 197,
    SDL_SCANCODE_KP_GREATER = 198,
    SDL_SCANCODE_KP_AMPERSAND = 199,
    SDL_SCANCODE_KP_DBLAMPERSAND = 200,
    SDL_SCANCODE_KP_VERTICALBAR = 201,
    SDL_SCANCODE_KP_DBLVERTICALBAR = 202,
    SDL_SCANCODE_KP_COLON = 203,
    SDL_SCANCODE_KP_HASH = 204,
    SDL_SCANCODE_KP_SPACE = 205,
    SDL_SCANCODE_KP_AT = 206,
    SDL_SCANCODE_KP_EXCLAM = 207,
    SDL_SCANCODE_KP_MEMSTORE = 208,
    SDL_SCANCODE_KP_MEMRECALL = 209,
    SDL_SCANCODE_KP_MEMCLEAR = 210,
    SDL_SCANCODE_KP_MEMADD = 211,
    SDL_SCANCODE_KP_MEMSUBTRACT = 212,
    SDL_SCANCODE_KP_MEMMULTIPLY = 213,
    SDL_SCANCODE_KP_MEMDIVIDE = 214,
    SDL_SCANCODE_KP_PLUSMINUS = 215,
    SDL_SCANCODE_KP_CLEAR = 216,
    SDL_SCANCODE_KP_CLEARENTRY = 217,
    SDL_SCANCODE_KP_BINARY = 218,
    SDL_SCANCODE_KP_OCTAL = 219,
    SDL_SCANCODE_KP_DECIMAL = 220,
    SDL_SCANCODE_KP_HEXADECIMAL = 221,
    SDL_SCANCODE_LCTRL = 224,
    SDL_SCANCODE_LSHIFT = 225,
    SDL_SCANCODE_LALT = 226,
    SDL_SCANCODE_LGUI = 227,
    SDL_SCANCODE_RCTRL = 228,
    SDL_SCANCODE_RSHIFT = 229,
    SDL_SCANCODE_RALT = 230,
    SDL_SCANCODE_RGUI = 231,
    SDL_SCANCODE_MODE = 257,
    SDL_SCANCODE_AUDIONEXT = 258,
    SDL_SCANCODE_AUDIOPREV = 259,
    SDL_SCANCODE_AUDIOSTOP = 260,
    SDL_SCANCODE_AUDIOPLAY = 261,
    SDL_SCANCODE_AUDIOMUTE = 262,
    SDL_SCANCODE_MEDIASELECT = 263,
    SDL_SCANCODE_WWW = 264,
    SDL_SCANCODE_MAIL = 265,
    SDL_SCANCODE_CALCULATOR = 266,
    SDL_SCANCODE_COMPUTER = 267,
    SDL_SCANCODE_AC_SEARCH = 268,
    SDL_SCANCODE_AC_HOME = 269,
    SDL_SCANCODE_AC_BACK = 270,
    SDL_SCANCODE_AC_FORWARD = 271,
    SDL_SCANCODE_AC_STOP = 272,
    SDL_SCANCODE_AC_REFRESH = 273,
    SDL_SCANCODE_AC_BOOKMARKS = 274,
    SDL_SCANCODE_BRIGHTNESSDOWN = 275,
    SDL_SCANCODE_BRIGHTNESSUP = 276,
    SDL_SCANCODE_DISPLAYSWITCH = 277,
    SDL_SCANCODE_KBDILLUMTOGGLE = 278,
    SDL_SCANCODE_KBDILLUMDOWN = 279,
    SDL_SCANCODE_KBDILLUMUP = 280,
    SDL_SCANCODE_EJECT = 281,
    SDL_SCANCODE_SLEEP = 282,
    SDL_SCANCODE_APP1 = 283,
    SDL_SCANCODE_APP2 = 284,
    SDL_SCANCODE_AUDIOREWIND = 285,
    SDL_SCANCODE_AUDIOFASTFORWARD = 286,
    SDL_SCANCODE_SOFTLEFT = 287,
    SDL_SCANCODE_SOFTRIGHT = 288,
    SDL_SCANCODE_CALL = 289,
    SDL_SCANCODE_ENDCALL = 290,
    SDL_NUM_SCANCODES = 512);
  PSDL_Scancode = ^SDL_Scancode;

  SDL_KeyCode = (
    SDLK_UNKNOWN = 0,
    SDLK_RETURN = 13,
    SDLK_ESCAPE = 27,
    SDLK_BACKSPACE = 8,
    SDLK_TAB = 9,
    SDLK_SPACE = 32,
    SDLK_EXCLAIM = 33,
    SDLK_QUOTEDBL = 34,
    SDLK_HASH = 35,
    SDLK_PERCENT = 37,
    SDLK_DOLLAR = 36,
    SDLK_AMPERSAND = 38,
    SDLK_QUOTE = 39,
    SDLK_LEFTPAREN = 40,
    SDLK_RIGHTPAREN = 41,
    SDLK_ASTERISK = 42,
    SDLK_PLUS = 43,
    SDLK_COMMA = 44,
    SDLK_MINUS = 45,
    SDLK_PERIOD = 46,
    SDLK_SLASH = 47,
    SDLK_0 = 48,
    SDLK_1 = 49,
    SDLK_2 = 50,
    SDLK_3 = 51,
    SDLK_4 = 52,
    SDLK_5 = 53,
    SDLK_6 = 54,
    SDLK_7 = 55,
    SDLK_8 = 56,
    SDLK_9 = 57,
    SDLK_COLON = 58,
    SDLK_SEMICOLON = 59,
    SDLK_LESS = 60,
    SDLK_EQUALS = 61,
    SDLK_GREATER = 62,
    SDLK_QUESTION = 63,
    SDLK_AT = 64,
    SDLK_LEFTBRACKET = 91,
    SDLK_BACKSLASH = 92,
    SDLK_RIGHTBRACKET = 93,
    SDLK_CARET = 94,
    SDLK_UNDERSCORE = 95,
    SDLK_BACKQUOTE = 96,
    SDLK_a = 97,
    SDLK_b = 98,
    SDLK_c = 99,
    SDLK_d = 100,
    SDLK_e = 101,
    SDLK_f = 102,
    SDLK_g = 103,
    SDLK_h = 104,
    SDLK_i = 105,
    SDLK_j = 106,
    SDLK_k = 107,
    SDLK_l = 108,
    SDLK_m = 109,
    SDLK_n = 110,
    SDLK_o = 111,
    SDLK_p = 112,
    SDLK_q = 113,
    SDLK_r = 114,
    SDLK_s = 115,
    SDLK_t = 116,
    SDLK_u = 117,
    SDLK_v = 118,
    SDLK_w = 119,
    SDLK_x = 120,
    SDLK_y = 121,
    SDLK_z = 122,
    SDLK_CAPSLOCK = 1073741881,
    SDLK_F1 = 1073741882,
    SDLK_F2 = 1073741883,
    SDLK_F3 = 1073741884,
    SDLK_F4 = 1073741885,
    SDLK_F5 = 1073741886,
    SDLK_F6 = 1073741887,
    SDLK_F7 = 1073741888,
    SDLK_F8 = 1073741889,
    SDLK_F9 = 1073741890,
    SDLK_F10 = 1073741891,
    SDLK_F11 = 1073741892,
    SDLK_F12 = 1073741893,
    SDLK_PRINTSCREEN = 1073741894,
    SDLK_SCROLLLOCK = 1073741895,
    SDLK_PAUSE = 1073741896,
    SDLK_INSERT = 1073741897,
    SDLK_HOME = 1073741898,
    SDLK_PAGEUP = 1073741899,
    SDLK_DELETE = 127,
    SDLK_END = 1073741901,
    SDLK_PAGEDOWN = 1073741902,
    SDLK_RIGHT = 1073741903,
    SDLK_LEFT = 1073741904,
    SDLK_DOWN = 1073741905,
    SDLK_UP = 1073741906,
    SDLK_NUMLOCKCLEAR = 1073741907,
    SDLK_KP_DIVIDE = 1073741908,
    SDLK_KP_MULTIPLY = 1073741909,
    SDLK_KP_MINUS = 1073741910,
    SDLK_KP_PLUS = 1073741911,
    SDLK_KP_ENTER = 1073741912,
    SDLK_KP_1 = 1073741913,
    SDLK_KP_2 = 1073741914,
    SDLK_KP_3 = 1073741915,
    SDLK_KP_4 = 1073741916,
    SDLK_KP_5 = 1073741917,
    SDLK_KP_6 = 1073741918,
    SDLK_KP_7 = 1073741919,
    SDLK_KP_8 = 1073741920,
    SDLK_KP_9 = 1073741921,
    SDLK_KP_0 = 1073741922,
    SDLK_KP_PERIOD = 1073741923,
    SDLK_APPLICATION = 1073741925,
    SDLK_POWER = 1073741926,
    SDLK_KP_EQUALS = 1073741927,
    SDLK_F13 = 1073741928,
    SDLK_F14 = 1073741929,
    SDLK_F15 = 1073741930,
    SDLK_F16 = 1073741931,
    SDLK_F17 = 1073741932,
    SDLK_F18 = 1073741933,
    SDLK_F19 = 1073741934,
    SDLK_F20 = 1073741935,
    SDLK_F21 = 1073741936,
    SDLK_F22 = 1073741937,
    SDLK_F23 = 1073741938,
    SDLK_F24 = 1073741939,
    SDLK_EXECUTE = 1073741940,
    SDLK_HELP = 1073741941,
    SDLK_MENU = 1073741942,
    SDLK_SELECT = 1073741943,
    SDLK_STOP = 1073741944,
    SDLK_AGAIN = 1073741945,
    SDLK_UNDO = 1073741946,
    SDLK_CUT = 1073741947,
    SDLK_COPY = 1073741948,
    SDLK_PASTE = 1073741949,
    SDLK_FIND = 1073741950,
    SDLK_MUTE = 1073741951,
    SDLK_VOLUMEUP = 1073741952,
    SDLK_VOLUMEDOWN = 1073741953,
    SDLK_KP_COMMA = 1073741957,
    SDLK_KP_EQUALSAS400 = 1073741958,
    SDLK_ALTERASE = 1073741977,
    SDLK_SYSREQ = 1073741978,
    SDLK_CANCEL = 1073741979,
    SDLK_CLEAR = 1073741980,
    SDLK_PRIOR = 1073741981,
    SDLK_RETURN2 = 1073741982,
    SDLK_SEPARATOR = 1073741983,
    SDLK_OUT = 1073741984,
    SDLK_OPER = 1073741985,
    SDLK_CLEARAGAIN = 1073741986,
    SDLK_CRSEL = 1073741987,
    SDLK_EXSEL = 1073741988,
    SDLK_KP_00 = 1073742000,
    SDLK_KP_000 = 1073742001,
    SDLK_THOUSANDSSEPARATOR = 1073742002,
    SDLK_DECIMALSEPARATOR = 1073742003,
    SDLK_CURRENCYUNIT = 1073742004,
    SDLK_CURRENCYSUBUNIT = 1073742005,
    SDLK_KP_LEFTPAREN = 1073742006,
    SDLK_KP_RIGHTPAREN = 1073742007,
    SDLK_KP_LEFTBRACE = 1073742008,
    SDLK_KP_RIGHTBRACE = 1073742009,
    SDLK_KP_TAB = 1073742010,
    SDLK_KP_BACKSPACE = 1073742011,
    SDLK_KP_A = 1073742012,
    SDLK_KP_B = 1073742013,
    SDLK_KP_C = 1073742014,
    SDLK_KP_D = 1073742015,
    SDLK_KP_E = 1073742016,
    SDLK_KP_F = 1073742017,
    SDLK_KP_XOR = 1073742018,
    SDLK_KP_POWER = 1073742019,
    SDLK_KP_PERCENT = 1073742020,
    SDLK_KP_LESS = 1073742021,
    SDLK_KP_GREATER = 1073742022,
    SDLK_KP_AMPERSAND = 1073742023,
    SDLK_KP_DBLAMPERSAND = 1073742024,
    SDLK_KP_VERTICALBAR = 1073742025,
    SDLK_KP_DBLVERTICALBAR = 1073742026,
    SDLK_KP_COLON = 1073742027,
    SDLK_KP_HASH = 1073742028,
    SDLK_KP_SPACE = 1073742029,
    SDLK_KP_AT = 1073742030,
    SDLK_KP_EXCLAM = 1073742031,
    SDLK_KP_MEMSTORE = 1073742032,
    SDLK_KP_MEMRECALL = 1073742033,
    SDLK_KP_MEMCLEAR = 1073742034,
    SDLK_KP_MEMADD = 1073742035,
    SDLK_KP_MEMSUBTRACT = 1073742036,
    SDLK_KP_MEMMULTIPLY = 1073742037,
    SDLK_KP_MEMDIVIDE = 1073742038,
    SDLK_KP_PLUSMINUS = 1073742039,
    SDLK_KP_CLEAR = 1073742040,
    SDLK_KP_CLEARENTRY = 1073742041,
    SDLK_KP_BINARY = 1073742042,
    SDLK_KP_OCTAL = 1073742043,
    SDLK_KP_DECIMAL = 1073742044,
    SDLK_KP_HEXADECIMAL = 1073742045,
    SDLK_LCTRL = 1073742048,
    SDLK_LSHIFT = 1073742049,
    SDLK_LALT = 1073742050,
    SDLK_LGUI = 1073742051,
    SDLK_RCTRL = 1073742052,
    SDLK_RSHIFT = 1073742053,
    SDLK_RALT = 1073742054,
    SDLK_RGUI = 1073742055,
    SDLK_MODE = 1073742081,
    SDLK_AUDIONEXT = 1073742082,
    SDLK_AUDIOPREV = 1073742083,
    SDLK_AUDIOSTOP = 1073742084,
    SDLK_AUDIOPLAY = 1073742085,
    SDLK_AUDIOMUTE = 1073742086,
    SDLK_MEDIASELECT = 1073742087,
    SDLK_WWW = 1073742088,
    SDLK_MAIL = 1073742089,
    SDLK_CALCULATOR = 1073742090,
    SDLK_COMPUTER = 1073742091,
    SDLK_AC_SEARCH = 1073742092,
    SDLK_AC_HOME = 1073742093,
    SDLK_AC_BACK = 1073742094,
    SDLK_AC_FORWARD = 1073742095,
    SDLK_AC_STOP = 1073742096,
    SDLK_AC_REFRESH = 1073742097,
    SDLK_AC_BOOKMARKS = 1073742098,
    SDLK_BRIGHTNESSDOWN = 1073742099,
    SDLK_BRIGHTNESSUP = 1073742100,
    SDLK_DISPLAYSWITCH = 1073742101,
    SDLK_KBDILLUMTOGGLE = 1073742102,
    SDLK_KBDILLUMDOWN = 1073742103,
    SDLK_KBDILLUMUP = 1073742104,
    SDLK_EJECT = 1073742105,
    SDLK_SLEEP = 1073742106,
    SDLK_APP1 = 1073742107,
    SDLK_APP2 = 1073742108,
    SDLK_AUDIOREWIND = 1073742109,
    SDLK_AUDIOFASTFORWARD = 1073742110,
    SDLK_SOFTLEFT = 1073742111,
    SDLK_SOFTRIGHT = 1073742112,
    SDLK_CALL = 1073742113,
    SDLK_ENDCALL = 1073742114);
  PSDL_KeyCode = ^SDL_KeyCode;

  SDL_Keymod = (
    KMOD_NONE = 0,
    KMOD_LSHIFT = 1,
    KMOD_RSHIFT = 2,
    KMOD_LCTRL = 64,
    KMOD_RCTRL = 128,
    KMOD_LALT = 256,
    KMOD_RALT = 512,
    KMOD_LGUI = 1024,
    KMOD_RGUI = 2048,
    KMOD_NUM = 4096,
    KMOD_CAPS = 8192,
    KMOD_MODE = 16384,
    KMOD_SCROLL = 32768,
    KMOD_CTRL = 192,
    KMOD_SHIFT = 3,
    KMOD_ALT = 768,
    KMOD_GUI = 3072,
    KMOD_RESERVED = 32768);
  PSDL_Keymod = ^SDL_Keymod;

  SDL_Keysym = record
    scancode: SDL_Scancode;
    sym: SDL_Keycode;
    mod_: Uint16;
    unused: Uint32;
  end;

  PSDL_Cursor = Pointer;
  PPSDL_Cursor = ^PSDL_Cursor;

  SDL_SystemCursor = (
    SDL_SYSTEM_CURSOR_ARROW = 0,
    SDL_SYSTEM_CURSOR_IBEAM = 1,
    SDL_SYSTEM_CURSOR_WAIT = 2,
    SDL_SYSTEM_CURSOR_CROSSHAIR = 3,
    SDL_SYSTEM_CURSOR_WAITARROW = 4,
    SDL_SYSTEM_CURSOR_SIZENWSE = 5,
    SDL_SYSTEM_CURSOR_SIZENESW = 6,
    SDL_SYSTEM_CURSOR_SIZEWE = 7,
    SDL_SYSTEM_CURSOR_SIZENS = 8,
    SDL_SYSTEM_CURSOR_SIZEALL = 9,
    SDL_SYSTEM_CURSOR_NO = 10,
    SDL_SYSTEM_CURSOR_HAND = 11,
    SDL_NUM_SYSTEM_CURSORS = 12);
  PSDL_SystemCursor = ^SDL_SystemCursor;

  SDL_MouseWheelDirection = (
    SDL_MOUSEWHEEL_NORMAL = 0,
    SDL_MOUSEWHEEL_FLIPPED = 1);
  PSDL_MouseWheelDirection = ^SDL_MouseWheelDirection;

  SDL_GUID = record
    data: array [0..15] of Uint8;
  end;

  PSDL_Joystick = Pointer;
  PPSDL_Joystick = ^PSDL_Joystick;
  SDL_JoystickGUID = SDL_GUID;
  SDL_JoystickID = Sint32;

  SDL_JoystickType = (
    SDL_JOYSTICK_TYPE_UNKNOWN = 0,
    SDL_JOYSTICK_TYPE_GAMECONTROLLER = 1,
    SDL_JOYSTICK_TYPE_WHEEL = 2,
    SDL_JOYSTICK_TYPE_ARCADE_STICK = 3,
    SDL_JOYSTICK_TYPE_FLIGHT_STICK = 4,
    SDL_JOYSTICK_TYPE_DANCE_PAD = 5,
    SDL_JOYSTICK_TYPE_GUITAR = 6,
    SDL_JOYSTICK_TYPE_DRUM_KIT = 7,
    SDL_JOYSTICK_TYPE_ARCADE_PAD = 8,
    SDL_JOYSTICK_TYPE_THROTTLE = 9);
  PSDL_JoystickType = ^SDL_JoystickType;

  SDL_JoystickPowerLevel = (
    SDL_JOYSTICK_POWER_UNKNOWN = -1,
    SDL_JOYSTICK_POWER_EMPTY = 0,
    SDL_JOYSTICK_POWER_LOW = 1,
    SDL_JOYSTICK_POWER_MEDIUM = 2,
    SDL_JOYSTICK_POWER_FULL = 3,
    SDL_JOYSTICK_POWER_WIRED = 4,
    SDL_JOYSTICK_POWER_MAX = 5);
  PSDL_JoystickPowerLevel = ^SDL_JoystickPowerLevel;

  SDL_VirtualJoystickDesc = record
    version: Uint16;
    type_: Uint16;
    naxes: Uint16;
    nbuttons: Uint16;
    nhats: Uint16;
    vendor_id: Uint16;
    product_id: Uint16;
    padding: Uint16;
    button_mask: Uint32;
    axis_mask: Uint32;
    name: PUTF8Char;
    userdata: Pointer;
    Update: procedure(userdata: Pointer); cdecl;
    SetPlayerIndex: procedure(userdata: Pointer; player_index: Integer); cdecl;
    Rumble: function(userdata: Pointer; low_frequency_rumble: Uint16; high_frequency_rumble: Uint16): Integer; cdecl;
    RumbleTriggers: function(userdata: Pointer; left_rumble: Uint16; right_rumble: Uint16): Integer; cdecl;
    SetLED: function(userdata: Pointer; red: Uint8; green: Uint8; blue: Uint8): Integer; cdecl;
    SendEffect: function(userdata: Pointer; const data: Pointer; size: Integer): Integer; cdecl;
  end;

  PSDL_Sensor = Pointer;
  PPSDL_Sensor = ^PSDL_Sensor;
  SDL_SensorID = Sint32;

  SDL_SensorType = (
    SDL_SENSOR_INVALID = -1,
    SDL_SENSOR_UNKNOWN = 0,
    SDL_SENSOR_ACCEL = 1,
    SDL_SENSOR_GYRO = 2,
    SDL_SENSOR_ACCEL_L = 3,
    SDL_SENSOR_GYRO_L = 4,
    SDL_SENSOR_ACCEL_R = 5,
    SDL_SENSOR_GYRO_R = 6);
  PSDL_SensorType = ^SDL_SensorType;
  PSDL_GameController = Pointer;
  PPSDL_GameController = ^PSDL_GameController;

  SDL_GameControllerType = (
    SDL_CONTROLLER_TYPE_UNKNOWN = 0,
    SDL_CONTROLLER_TYPE_XBOX360 = 1,
    SDL_CONTROLLER_TYPE_XBOXONE = 2,
    SDL_CONTROLLER_TYPE_PS3 = 3,
    SDL_CONTROLLER_TYPE_PS4 = 4,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO = 5,
    SDL_CONTROLLER_TYPE_VIRTUAL = 6,
    SDL_CONTROLLER_TYPE_PS5 = 7,
    SDL_CONTROLLER_TYPE_AMAZON_LUNA = 8,
    SDL_CONTROLLER_TYPE_GOOGLE_STADIA = 9,
    SDL_CONTROLLER_TYPE_NVIDIA_SHIELD = 10,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = 11,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = 12,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = 13);
  PSDL_GameControllerType = ^SDL_GameControllerType;

  SDL_GameControllerBindType = (
    SDL_CONTROLLER_BINDTYPE_NONE = 0,
    SDL_CONTROLLER_BINDTYPE_BUTTON = 1,
    SDL_CONTROLLER_BINDTYPE_AXIS = 2,
    SDL_CONTROLLER_BINDTYPE_HAT = 3);
  PSDL_GameControllerBindType = ^SDL_GameControllerBindType;

  _anonymous_type_6 = record
    hat: Integer;
    hat_mask: Integer;
  end;
  P_anonymous_type_6 = ^_anonymous_type_6;

  _anonymous_type_7 = record
    case Integer of
      0: (button: Integer);
      1: (axis: Integer);
      2: (hat: _anonymous_type_6);
  end;
  P_anonymous_type_7 = ^_anonymous_type_7;

  SDL_GameControllerButtonBind = record
    bindType: SDL_GameControllerBindType;
    value: _anonymous_type_7;
  end;

  SDL_GameControllerAxis = (
    SDL_CONTROLLER_AXIS_INVALID = -1,
    SDL_CONTROLLER_AXIS_LEFTX = 0,
    SDL_CONTROLLER_AXIS_LEFTY = 1,
    SDL_CONTROLLER_AXIS_RIGHTX = 2,
    SDL_CONTROLLER_AXIS_RIGHTY = 3,
    SDL_CONTROLLER_AXIS_TRIGGERLEFT = 4,
    SDL_CONTROLLER_AXIS_TRIGGERRIGHT = 5,
    SDL_CONTROLLER_AXIS_MAX = 6);
  PSDL_GameControllerAxis = ^SDL_GameControllerAxis;

  SDL_GameControllerButton = (
    SDL_CONTROLLER_BUTTON_INVALID = -1,
    SDL_CONTROLLER_BUTTON_A = 0,
    SDL_CONTROLLER_BUTTON_B = 1,
    SDL_CONTROLLER_BUTTON_X = 2,
    SDL_CONTROLLER_BUTTON_Y = 3,
    SDL_CONTROLLER_BUTTON_BACK = 4,
    SDL_CONTROLLER_BUTTON_GUIDE = 5,
    SDL_CONTROLLER_BUTTON_START = 6,
    SDL_CONTROLLER_BUTTON_LEFTSTICK = 7,
    SDL_CONTROLLER_BUTTON_RIGHTSTICK = 8,
    SDL_CONTROLLER_BUTTON_LEFTSHOULDER = 9,
    SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = 10,
    SDL_CONTROLLER_BUTTON_DPAD_UP = 11,
    SDL_CONTROLLER_BUTTON_DPAD_DOWN = 12,
    SDL_CONTROLLER_BUTTON_DPAD_LEFT = 13,
    SDL_CONTROLLER_BUTTON_DPAD_RIGHT = 14,
    SDL_CONTROLLER_BUTTON_MISC1 = 15,
    SDL_CONTROLLER_BUTTON_PADDLE1 = 16,
    SDL_CONTROLLER_BUTTON_PADDLE2 = 17,
    SDL_CONTROLLER_BUTTON_PADDLE3 = 18,
    SDL_CONTROLLER_BUTTON_PADDLE4 = 19,
    SDL_CONTROLLER_BUTTON_TOUCHPAD = 20,
    SDL_CONTROLLER_BUTTON_MAX = 21);
  PSDL_GameControllerButton = ^SDL_GameControllerButton;
  SDL_TouchID = Sint64;
  SDL_FingerID = Sint64;

  SDL_TouchDeviceType = (
    SDL_TOUCH_DEVICE_INVALID = -1,
    SDL_TOUCH_DEVICE_DIRECT = 0,
    SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE = 1,
    SDL_TOUCH_DEVICE_INDIRECT_RELATIVE = 2);
  PSDL_TouchDeviceType = ^SDL_TouchDeviceType;

  SDL_Finger = record
    id: SDL_FingerID;
    x: Single;
    y: Single;
    pressure: Single;
  end;

  SDL_GestureID = Sint64;

  SDL_EventType = (
    SDL_FIRSTEVENT = 0,
    SDL_QUIT_ = 256,
    SDL_APP_TERMINATING = 257,
    SDL_APP_LOWMEMORY = 258,
    SDL_APP_WILLENTERBACKGROUND = 259,
    SDL_APP_DIDENTERBACKGROUND = 260,
    SDL_APP_WILLENTERFOREGROUND = 261,
    SDL_APP_DIDENTERFOREGROUND = 262,
    SDL_LOCALECHANGED = 263,
    SDL_DISPLAYEVENT_ = 336,
    SDL_WINDOWEVENT_ = 512,
    SDL_SYSWMEVENT_ = 513,
    SDL_KEYDOWN = 768,
    SDL_KEYUP = 769,
    SDL_TEXTEDITING = 770,
    SDL_TEXTINPUT = 771,
    SDL_KEYMAPCHANGED = 772,
    SDL_TEXTEDITING_EXT = 773,
    SDL_MOUSEMOTION = 1024,
    SDL_MOUSEBUTTONDOWN = 1025,
    SDL_MOUSEBUTTONUP = 1026,
    SDL_MOUSEWHEEL = 1027,
    SDL_JOYAXISMOTION = 1536,
    SDL_JOYBALLMOTION = 1537,
    SDL_JOYHATMOTION = 1538,
    SDL_JOYBUTTONDOWN = 1539,
    SDL_JOYBUTTONUP = 1540,
    SDL_JOYDEVICEADDED = 1541,
    SDL_JOYDEVICEREMOVED = 1542,
    SDL_JOYBATTERYUPDATED = 1543,
    SDL_CONTROLLERAXISMOTION = 1616,
    SDL_CONTROLLERBUTTONDOWN = 1617,
    SDL_CONTROLLERBUTTONUP = 1618,
    SDL_CONTROLLERDEVICEADDED = 1619,
    SDL_CONTROLLERDEVICEREMOVED = 1620,
    SDL_CONTROLLERDEVICEREMAPPED = 1621,
    SDL_CONTROLLERTOUCHPADDOWN = 1622,
    SDL_CONTROLLERTOUCHPADMOTION = 1623,
    SDL_CONTROLLERTOUCHPADUP = 1624,
    SDL_CONTROLLERSENSORUPDATE = 1625,
    SDL_FINGERDOWN = 1792,
    SDL_FINGERUP = 1793,
    SDL_FINGERMOTION = 1794,
    SDL_DOLLARGESTURE = 2048,
    SDL_DOLLARRECORD = 2049,
    SDL_MULTIGESTURE = 2050,
    SDL_CLIPBOARDUPDATE = 2304,
    SDL_DROPFILE = 4096,
    SDL_DROPTEXT = 4097,
    SDL_DROPBEGIN = 4098,
    SDL_DROPCOMPLETE = 4099,
    SDL_AUDIODEVICEADDED = 4352,
    SDL_AUDIODEVICEREMOVED = 4353,
    SDL_SENSORUPDATE_ = 4608,
    SDL_RENDER_TARGETS_RESET = 8192,
    SDL_RENDER_DEVICE_RESET = 8193,
    SDL_POLLSENTINEL = 32512,
    SDL_USEREVENT_ = 32768,
    SDL_LASTEVENT = 65535);
  PSDL_EventType = ^SDL_EventType;

  SDL_CommonEvent = record
    type_: Uint32;
    timestamp: Uint32;
  end;

  SDL_DisplayEvent = record
    type_: Uint32;
    timestamp: Uint32;
    display: Uint32;
    event: Uint8;
    padding1: Uint8;
    padding2: Uint8;
    padding3: Uint8;
    data1: Sint32;
  end;

  SDL_WindowEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    event: Uint8;
    padding1: Uint8;
    padding2: Uint8;
    padding3: Uint8;
    data1: Sint32;
    data2: Sint32;
  end;

  SDL_KeyboardEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    state: Uint8;
    repeat_: Uint8;
    padding2: Uint8;
    padding3: Uint8;
    keysym: SDL_Keysym;
  end;

  SDL_TextEditingEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    text: array [0..31] of UTF8Char;
    start: Sint32;
    length: Sint32;
  end;

  SDL_TextEditingExtEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    text: PUTF8Char;
    start: Sint32;
    length: Sint32;
  end;

  SDL_TextInputEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    text: array [0..31] of UTF8Char;
  end;

  SDL_MouseMotionEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    which: Uint32;
    state: Uint32;
    x: Sint32;
    y: Sint32;
    xrel: Sint32;
    yrel: Sint32;
  end;

  SDL_MouseButtonEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    which: Uint32;
    button: Uint8;
    state: Uint8;
    clicks: Uint8;
    padding1: Uint8;
    x: Sint32;
    y: Sint32;
  end;

  SDL_MouseWheelEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    which: Uint32;
    x: Sint32;
    y: Sint32;
    direction: Uint32;
    preciseX: Single;
    preciseY: Single;
    mouseX: Sint32;
    mouseY: Sint32;
  end;

  SDL_JoyAxisEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    axis: Uint8;
    padding1: Uint8;
    padding2: Uint8;
    padding3: Uint8;
    value: Sint16;
    padding4: Uint16;
  end;

  SDL_JoyBallEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    ball: Uint8;
    padding1: Uint8;
    padding2: Uint8;
    padding3: Uint8;
    xrel: Sint16;
    yrel: Sint16;
  end;

  SDL_JoyHatEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    hat: Uint8;
    value: Uint8;
    padding1: Uint8;
    padding2: Uint8;
  end;

  SDL_JoyButtonEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    button: Uint8;
    state: Uint8;
    padding1: Uint8;
    padding2: Uint8;
  end;

  SDL_JoyDeviceEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: Sint32;
  end;

  SDL_JoyBatteryEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    level: SDL_JoystickPowerLevel;
  end;

  SDL_ControllerAxisEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    axis: Uint8;
    padding1: Uint8;
    padding2: Uint8;
    padding3: Uint8;
    value: Sint16;
    padding4: Uint16;
  end;

  SDL_ControllerButtonEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    button: Uint8;
    state: Uint8;
    padding1: Uint8;
    padding2: Uint8;
  end;

  SDL_ControllerDeviceEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: Sint32;
  end;

  SDL_ControllerTouchpadEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    touchpad: Sint32;
    finger: Sint32;
    x: Single;
    y: Single;
    pressure: Single;
  end;

  SDL_ControllerSensorEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: SDL_JoystickID;
    sensor: Sint32;
    data: array [0..2] of Single;
    timestamp_us: Uint64;
  end;

  SDL_AudioDeviceEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: Uint32;
    iscapture: Uint8;
    padding1: Uint8;
    padding2: Uint8;
    padding3: Uint8;
  end;

  SDL_TouchFingerEvent = record
    type_: Uint32;
    timestamp: Uint32;
    touchId: SDL_TouchID;
    fingerId: SDL_FingerID;
    x: Single;
    y: Single;
    dx: Single;
    dy: Single;
    pressure: Single;
    windowID: Uint32;
  end;

  SDL_MultiGestureEvent = record
    type_: Uint32;
    timestamp: Uint32;
    touchId: SDL_TouchID;
    dTheta: Single;
    dDist: Single;
    x: Single;
    y: Single;
    numFingers: Uint16;
    padding: Uint16;
  end;

  SDL_DollarGestureEvent = record
    type_: Uint32;
    timestamp: Uint32;
    touchId: SDL_TouchID;
    gestureId: SDL_GestureID;
    numFingers: Uint32;
    error: Single;
    x: Single;
    y: Single;
  end;

  SDL_DropEvent = record
    type_: Uint32;
    timestamp: Uint32;
    file_: PUTF8Char;
    windowID: Uint32;
  end;

  SDL_SensorEvent = record
    type_: Uint32;
    timestamp: Uint32;
    which: Sint32;
    data: array [0..5] of Single;
    timestamp_us: Uint64;
  end;

  SDL_QuitEvent = record
    type_: Uint32;
    timestamp: Uint32;
  end;

  SDL_OSEvent = record
    type_: Uint32;
    timestamp: Uint32;
  end;

  SDL_UserEvent = record
    type_: Uint32;
    timestamp: Uint32;
    windowID: Uint32;
    code: Sint32;
    data1: Pointer;
    data2: Pointer;
  end;

  PSDL_SysWMmsg = Pointer;
  PPSDL_SysWMmsg = ^PSDL_SysWMmsg;

  SDL_SysWMEvent = record
    type_: Uint32;
    timestamp: Uint32;
    msg: PSDL_SysWMmsg;
  end;

  PSDL_Event = ^SDL_Event;
  SDL_Event = record
    case Integer of
      0: (type_: Uint32);
      1: (common: SDL_CommonEvent);
      2: (display: SDL_DisplayEvent);
      3: (window: SDL_WindowEvent);
      4: (key: SDL_KeyboardEvent);
      5: (edit: SDL_TextEditingEvent);
      6: (editExt: SDL_TextEditingExtEvent);
      7: (text: SDL_TextInputEvent);
      8: (motion: SDL_MouseMotionEvent);
      9: (button: SDL_MouseButtonEvent);
      10: (wheel: SDL_MouseWheelEvent);
      11: (jaxis: SDL_JoyAxisEvent);
      12: (jball: SDL_JoyBallEvent);
      13: (jhat: SDL_JoyHatEvent);
      14: (jbutton: SDL_JoyButtonEvent);
      15: (jdevice: SDL_JoyDeviceEvent);
      16: (jbattery: SDL_JoyBatteryEvent);
      17: (caxis: SDL_ControllerAxisEvent);
      18: (cbutton: SDL_ControllerButtonEvent);
      19: (cdevice: SDL_ControllerDeviceEvent);
      20: (ctouchpad: SDL_ControllerTouchpadEvent);
      21: (csensor: SDL_ControllerSensorEvent);
      22: (adevice: SDL_AudioDeviceEvent);
      23: (sensor: SDL_SensorEvent);
      24: (quit: SDL_QuitEvent);
      25: (user: SDL_UserEvent);
      26: (syswm: SDL_SysWMEvent);
      27: (tfinger: SDL_TouchFingerEvent);
      28: (mgesture: SDL_MultiGestureEvent);
      29: (dgesture: SDL_DollarGestureEvent);
      30: (drop: SDL_DropEvent);
      31: (padding: array [0..55] of Uint8);
  end;

  SDL_eventaction = (
    SDL_ADDEVENT = 0,
    SDL_PEEKEVENT = 1,
    SDL_GETEVENT = 2);
  PSDL_eventaction = ^SDL_eventaction;

  SDL_EventFilter = function(userdata: Pointer; event: PSDL_Event): Integer; cdecl;
  PSDL_EventFilter = ^SDL_EventFilter;
  PSDL_Haptic = Pointer;
  PPSDL_Haptic = ^PSDL_Haptic;

  SDL_HapticDirection = record
    type_: Uint8;
    dir: array [0..2] of Sint32;
  end;

  SDL_HapticConstant = record
    type_: Uint16;
    direction: SDL_HapticDirection;
    length: Uint32;
    delay: Uint16;
    button: Uint16;
    interval: Uint16;
    level: Sint16;
    attack_length: Uint16;
    attack_level: Uint16;
    fade_length: Uint16;
    fade_level: Uint16;
  end;

  PSDL_HapticPeriodic = ^SDL_HapticPeriodic;
  SDL_HapticPeriodic = record
    type_: Uint16;
    direction: SDL_HapticDirection;
    length: Uint32;
    delay: Uint16;
    button: Uint16;
    interval: Uint16;
    period: Uint16;
    magnitude: Sint16;
    offset: Sint16;
    phase: Uint16;
    attack_length: Uint16;
    attack_level: Uint16;
    fade_length: Uint16;
    fade_level: Uint16;
  end;

  SDL_HapticCondition = record
    type_: Uint16;
    direction: SDL_HapticDirection;
    length: Uint32;
    delay: Uint16;
    button: Uint16;
    interval: Uint16;
    right_sat: array [0..2] of Uint16;
    left_sat: array [0..2] of Uint16;
    right_coeff: array [0..2] of Sint16;
    left_coeff: array [0..2] of Sint16;
    deadband: array [0..2] of Uint16;
    center: array [0..2] of Sint16;
  end;

  SDL_HapticRamp = record
    type_: Uint16;
    direction: SDL_HapticDirection;
    length: Uint32;
    delay: Uint16;
    button: Uint16;
    interval: Uint16;
    start: Sint16;
    end_: Sint16;
    attack_length: Uint16;
    attack_level: Uint16;
    fade_length: Uint16;
    fade_level: Uint16;
  end;

  SDL_HapticLeftRight = record
    type_: Uint16;
    length: Uint32;
    large_magnitude: Uint16;
    small_magnitude: Uint16;
  end;

  SDL_HapticCustom = record
    type_: Uint16;
    direction: SDL_HapticDirection;
    length: Uint32;
    delay: Uint16;
    button: Uint16;
    interval: Uint16;
    channels: Uint8;
    period: Uint16;
    samples: Uint16;
    data: PUint16;
    attack_length: Uint16;
    attack_level: Uint16;
    fade_length: Uint16;
    fade_level: Uint16;
  end;

  PSDL_HapticEffect = ^SDL_HapticEffect;
  SDL_HapticEffect = record
    case Integer of
      0: (type_: Uint16);
      1: (constant: SDL_HapticConstant);
      2: (periodic: SDL_HapticPeriodic);
      3: (condition: SDL_HapticCondition);
      4: (ramp: SDL_HapticRamp);
      5: (leftright: SDL_HapticLeftRight);
      6: (custom: SDL_HapticCustom);
  end;

  PSDL_hid_device = Pointer;
  PPSDL_hid_device = ^PSDL_hid_device;

  SDL_hid_device_info = record
    path: PUTF8Char;
    vendor_id: Word;
    product_id: Word;
    serial_number: PWideChar;
    release_number: Word;
    manufacturer_string: PWideChar;
    product_string: PWideChar;
    usage_page: Word;
    usage: Word;
    interface_number: Integer;
    interface_class: Integer;
    interface_subclass: Integer;
    interface_protocol: Integer;
    next: PSDL_hid_device_info;
  end;

  SDL_HintPriority = (
    SDL_HINT_DEFAULT = 0,
    SDL_HINT_NORMAL = 1,
    SDL_HINT_OVERRIDE = 2);
  PSDL_HintPriority = ^SDL_HintPriority;

  SDL_HintCallback = procedure(userdata: Pointer; const name: PUTF8Char; const oldValue: PUTF8Char; const newValue: PUTF8Char); cdecl;

  SDL_LogCategory = (
    SDL_LOG_CATEGORY_APPLICATION = 0,
    SDL_LOG_CATEGORY_ERROR = 1,
    SDL_LOG_CATEGORY_ASSERT = 2,
    SDL_LOG_CATEGORY_SYSTEM = 3,
    SDL_LOG_CATEGORY_AUDIO = 4,
    SDL_LOG_CATEGORY_VIDEO = 5,
    SDL_LOG_CATEGORY_RENDER = 6,
    SDL_LOG_CATEGORY_INPUT = 7,
    SDL_LOG_CATEGORY_TEST = 8,
    SDL_LOG_CATEGORY_RESERVED1 = 9,
    SDL_LOG_CATEGORY_RESERVED2 = 10,
    SDL_LOG_CATEGORY_RESERVED3 = 11,
    SDL_LOG_CATEGORY_RESERVED4 = 12,
    SDL_LOG_CATEGORY_RESERVED5 = 13,
    SDL_LOG_CATEGORY_RESERVED6 = 14,
    SDL_LOG_CATEGORY_RESERVED7 = 15,
    SDL_LOG_CATEGORY_RESERVED8 = 16,
    SDL_LOG_CATEGORY_RESERVED9 = 17,
    SDL_LOG_CATEGORY_RESERVED10 = 18,
    SDL_LOG_CATEGORY_CUSTOM = 19);
  PSDL_LogCategory = ^SDL_LogCategory;

  SDL_LogPriority = (
    SDL_LOG_PRIORITY_VERBOSE = 1,
    SDL_LOG_PRIORITY_DEBUG = 2,
    SDL_LOG_PRIORITY_INFO = 3,
    SDL_LOG_PRIORITY_WARN = 4,
    SDL_LOG_PRIORITY_ERROR = 5,
    SDL_LOG_PRIORITY_CRITICAL = 6,
    SDL_NUM_LOG_PRIORITIES = 7);
  PSDL_LogPriority = ^SDL_LogPriority;

  SDL_LogOutputFunction = procedure(userdata: Pointer; category: Integer; priority: SDL_LogPriority; const message_: PUTF8Char); cdecl;
  PSDL_LogOutputFunction = ^SDL_LogOutputFunction;

  SDL_MessageBoxFlags = (
    SDL_MESSAGEBOX_ERROR = 16,
    SDL_MESSAGEBOX_WARNING = 32,
    SDL_MESSAGEBOX_INFORMATION = 64,
    SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 128,
    SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 256);
  PSDL_MessageBoxFlags = ^SDL_MessageBoxFlags;

  SDL_MessageBoxButtonFlags = (
    SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 1,
    SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 2);
  PSDL_MessageBoxButtonFlags = ^SDL_MessageBoxButtonFlags;

  SDL_MessageBoxButtonData = record
    flags: Uint32;
    buttonid: Integer;
    text: PUTF8Char;
  end;

  SDL_MessageBoxColor = record
    r: Uint8;
    g: Uint8;
    b: Uint8;
  end;

  SDL_MessageBoxColorType = (
    SDL_MESSAGEBOX_COLOR_BACKGROUND = 0,
    SDL_MESSAGEBOX_COLOR_TEXT = 1,
    SDL_MESSAGEBOX_COLOR_BUTTON_BORDER = 2,
    SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND = 3,
    SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED = 4,
    SDL_MESSAGEBOX_COLOR_MAX = 5);
  PSDL_MessageBoxColorType = ^SDL_MessageBoxColorType;

  SDL_MessageBoxColorScheme = record
    colors: array [0..4] of SDL_MessageBoxColor;
  end;

  SDL_MessageBoxData = record
    flags: Uint32;
    window: PSDL_Window;
    title: PUTF8Char;
    message_: PUTF8Char;
    numbuttons: Integer;
    buttons: PSDL_MessageBoxButtonData;
    colorScheme: PSDL_MessageBoxColorScheme;
  end;

  SDL_MetalView = Pointer;

  SDL_PowerState = (
    SDL_POWERSTATE_UNKNOWN = 0,
    SDL_POWERSTATE_ON_BATTERY = 1,
    SDL_POWERSTATE_NO_BATTERY = 2,
    SDL_POWERSTATE_CHARGING = 3,
    SDL_POWERSTATE_CHARGED = 4);
  PSDL_PowerState = ^SDL_PowerState;

  SDL_RendererFlags = (
    SDL_RENDERER_SOFTWARE = 1,
    SDL_RENDERER_ACCELERATED = 2,
    SDL_RENDERER_PRESENTVSYNC = 4,
    SDL_RENDERER_TARGETTEXTURE = 8);
  PSDL_RendererFlags = ^SDL_RendererFlags;

  SDL_RendererInfo = record
    name: PUTF8Char;
    flags: Uint32;
    num_texture_formats: Uint32;
    texture_formats: array [0..15] of Uint32;
    max_texture_width: Integer;
    max_texture_height: Integer;
  end;

  SDL_Vertex = record
    position: SDL_FPoint;
    color: SDL_Color;
    tex_coord: SDL_FPoint;
  end;

  SDL_ScaleMode = (
    SDL_ScaleModeNearest = 0,
    SDL_ScaleModeLinear = 1,
    SDL_ScaleModeBest = 2);
  PSDL_ScaleMode = ^SDL_ScaleMode;

  SDL_TextureAccess = (
    SDL_TEXTUREACCESS_STATIC = 0,
    SDL_TEXTUREACCESS_STREAMING = 1,
    SDL_TEXTUREACCESS_TARGET = 2);
  PSDL_TextureAccess = ^SDL_TextureAccess;

  SDL_TextureModulate = (
    SDL_TEXTUREMODULATE_NONE = 0,
    SDL_TEXTUREMODULATE_COLOR = 1,
    SDL_TEXTUREMODULATE_ALPHA = 2);
  PSDL_TextureModulate = ^SDL_TextureModulate;

  SDL_RendererFlip = (
    SDL_FLIP_NONE = 0,
    SDL_FLIP_HORIZONTAL = 1,
    SDL_FLIP_VERTICAL = 2);
  PSDL_RendererFlip = ^SDL_RendererFlip;
  PSDL_Renderer = Pointer;
  PPSDL_Renderer = ^PSDL_Renderer;
  PSDL_Texture = Pointer;
  PPSDL_Texture = ^PSDL_Texture;

  WindowShapeMode = (
    ShapeModeDefault = 0,
    ShapeModeBinarizeAlpha = 1,
    ShapeModeReverseBinarizeAlpha = 2,
    ShapeModeColorKey = 3);
  PWindowShapeMode = ^WindowShapeMode;

  SDL_WindowShapeParams = record
    case Integer of
      0: (binarizationCutoff: Uint8);
      1: (colorKey: SDL_Color);
  end;

  SDL_WindowShapeMode = record
    mode: WindowShapeMode;
    parameters: SDL_WindowShapeParams;
  end;

  SDL_WindowsMessageHook = procedure(userdata: Pointer; hWnd: Pointer; message_: Cardinal; wParam: Uint64; lParam: Sint64); cdecl;
  PIDirect3DDevice9 = Pointer;
  PPIDirect3DDevice9 = ^PIDirect3DDevice9;
  PID3D11Device = Pointer;
  PPID3D11Device = ^PID3D11Device;
  PID3D12Device = Pointer;
  PPID3D12Device = ^PID3D12Device;

  SDL_TimerCallback = function(interval: Uint32; param: Pointer): Uint32; cdecl;
  SDL_TimerID = Integer;

  SDL_version = record
    major: Uint8;
    minor: Uint8;
    patch: Uint8;
  end;

  SDL_Locale = record
    language: PUTF8Char;
    country: PUTF8Char;
  end;

  IMG_InitFlags = (
    IMG_INIT_JPG = 1,
    IMG_INIT_PNG = 2,
    IMG_INIT_TIF = 4,
    IMG_INIT_WEBP = 8,
    IMG_INIT_JXL = 16,
    IMG_INIT_AVIF = 32);
  PIMG_InitFlags = ^IMG_InitFlags;

  IMG_Animation = record
    w: Integer;
    h: Integer;
    count: Integer;
    frames: PPSDL_Surface;
    delays: PInteger;
  end;

  MIX_InitFlags = (
    MIX_INIT_FLAC = 1,
    MIX_INIT_MOD = 2,
    MIX_INIT_MP3 = 8,
    MIX_INIT_OGG = 16,
    MIX_INIT_MID = 32,
    MIX_INIT_OPUS = 64);
  PMIX_InitFlags = ^MIX_InitFlags;

  Mix_Chunk = record
    allocated: Integer;
    abuf: PUint8;
    alen: Uint32;
    volume: Uint8;
  end;

  Mix_Fading = (
    MIX_NO_FADING = 0,
    MIX_FADING_OUT = 1,
    MIX_FADING_IN = 2);
  PMix_Fading = ^Mix_Fading;

  Mix_MusicType = (
    MUS_NONE = 0,
    MUS_CMD = 1,
    MUS_WAV = 2,
    MUS_MOD = 3,
    MUS_MID = 4,
    MUS_OGG = 5,
    MUS_MP3 = 6,
    MUS_MP3_MAD_UNUSED = 7,
    MUS_FLAC = 8,
    MUS_MODPLUG_UNUSED = 9,
    MUS_OPUS = 10,
    MUS_GME = 100,
    MUS_FFMPEG = 101,
    MUS_ADLMIDI = 200,
    MUS_OPNMIDI = 201,
    MUS_FLUIDLITE = 202,
    MUS_EDMIDI = 203,
    MUS_NATIVEMIDI = 204);
  PMix_MusicType = ^Mix_MusicType;

  Mix_MIDI_Player = (
    MIDI_ADLMIDI = 0,
    MIDI_Native = 1,
    MIDI_Timidity = 2,
    MIDI_OPNMIDI = 3,
    MIDI_Fluidsynth = 4,
    MIDI_EDMIDI = 5,
    MIDI_ANY = 6,
    MIDI_KnownPlayers = 7,
    MIDI_KnownDevices = 7);
  PMix_MIDI_Player = ^Mix_MIDI_Player;
  Mix_MIDI_Device = Mix_MIDI_Player;

  Mix_ADLMIDI_VolumeModel = (
    ADLMIDI_VM_AUTO = 0,
    ADLMIDI_VM_GENERIC = 1,
    ADLMIDI_VM_NATIVE = 2,
    ADLMIDI_VM_DMX = 3,
    ADLMIDI_VM_APOGEE = 4,
    ADLMIDI_VM_9X = 5,
    ADLMIDI_VM_DMX_FIXED = 6,
    ADLMIDI_VM_APOGEE_FIXED = 7,
    ADLMIDI_VM_AIL = 8,
    ADLMIDI_VM_9X_GENERIC_FM = 9,
    ADLMIDI_VM_HMI = 10,
    ADLMIDI_VM_HMI_OLD = 11,
    ADLMIDI_VM_CMF = 2);
  PMix_ADLMIDI_VolumeModel = ^Mix_ADLMIDI_VolumeModel;

  Mix_ADLMIDI_Emulator = (
    ADLMIDI_OPL3_EMU_DEFAULT = -1,
    ADLMIDI_OPL3_EMU_NUKED = 0,
    ADLMIDI_OPL3_EMU_NUKED_1_7_4 = 1,
    ADLMIDI_OPL3_EMU_DOSBOX = 2,
    ADLMIDI_OPL3_EMU_OPAL = 3,
    ADLMIDI_OPL3_EMU_JAVA = 4);
  PMix_ADLMIDI_Emulator = ^Mix_ADLMIDI_Emulator;

  Mix_OPNMIDI_VolumeModel = (
    OPNMIDI_VM_AUTO = 0,
    OPNMIDI_VM_GENERIC = 1,
    OPNMIDI_VM_NATIVE = 2,
    OPNMIDI_VM_DMX = 3,
    OPNMIDI_VM_APOGEE = 4,
    OPNMIDI_VM_9X = 5);
  PMix_OPNMIDI_VolumeModel = ^Mix_OPNMIDI_VolumeModel;

  Mix_OPNMIDI_Emulator = (
    OPNMIDI_OPN2_EMU_DEFAULT = -1,
    OPNMIDI_OPN2_EMU_MAME_OPN2 = 0,
    OPNMIDI_OPN2_EMU_NUKED = 1,
    OPNMIDI_OPN2_EMU_GENS = 2,
    OPNMIDI_OPN2_EMU_GX = 3,
    OPNMIDI_OPN2_EMU_NP2 = 4,
    OPNMIDI_OPN2_EMU_MAME_OPNA = 5,
    OPNMIDI_OPN2_EMU_PMDWIN = 6,
    OPNMIDI_OPN2_EMU_MIME = 0);
  PMix_OPNMIDI_Emulator = ^Mix_OPNMIDI_Emulator;

  Mix_ChipChanAllocMode = (
    MIX_CHIP_CHANALLOC_AUTO = -1,
    MIX_CHIP_CHANALLOC_OffDelay = 0,
    MIX_CHIP_CHANALLOC_SameInst = 1,
    MIX_CHIP_CHANALLOC_AnyFree = 2);
  PMix_ChipChanAllocMode = ^Mix_ChipChanAllocMode;
  PMix_Music = Pointer;
  PPMix_Music = ^PMix_Music;

  Mix_EffectFunc_t = procedure(chan: Integer; stream: Pointer; len: Integer; udata: Pointer); cdecl;

  Mix_CommonMixer_t = procedure(udata: Pointer; stream: PUint8; len: Integer); cdecl;

  Mix_EffectDone_t = procedure(chan: Integer; udata: Pointer); cdecl;

  Mix_MusicEffectFunc_t = procedure(mus: PMix_Music; stream: Pointer; len: Integer; udata: Pointer); cdecl;

  Mix_MusicEffectDone_t = procedure(mus: PMix_Music; udata: Pointer); cdecl;
  SDLNet_version = SDL_version;
  PSDLNet_version = ^SDLNet_version;

  IPaddress = record
    host: Uint32;
    port: Uint16;
  end;

  TCPsocket = Pointer;
  PTCPsocket = ^TCPsocket;
  UDPsocket = Pointer;
  PUDPsocket = ^UDPsocket;

  UDPpacket = record
    channel: Integer;
    data: PUint8;
    len: Integer;
    maxlen: Integer;
    status: Integer;
    address: IPaddress;
  end;

  SDLNet_SocketSet = Pointer;
  PSDLNet_SocketSet = ^SDLNet_SocketSet;

  _SDLNet_GenericSocket = record
    ready: Integer;
  end;

  SDLNet_GenericSocket = P_SDLNet_GenericSocket;

  stbtt__buf = record
    data: PByte;
    cursor: Integer;
    size: Integer;
  end;

  stbtt_bakedchar = record
    x0: Word;
    y0: Word;
    x1: Word;
    y1: Word;
    xoff: Single;
    yoff: Single;
    xadvance: Single;
  end;

  stbtt_aligned_quad = record
    x0: Single;
    y0: Single;
    s0: Single;
    t0: Single;
    x1: Single;
    y1: Single;
    s1: Single;
    t1: Single;
  end;

  stbtt_packedchar = record
    x0: Word;
    y0: Word;
    x1: Word;
    y1: Word;
    xoff: Single;
    yoff: Single;
    xadvance: Single;
    xoff2: Single;
    yoff2: Single;
  end;

  Pstbrp_rect = Pointer;
  PPstbrp_rect = ^Pstbrp_rect;

  stbtt_pack_range = record
    font_size: Single;
    first_unicode_codepoint_in_range: Integer;
    array_of_unicode_codepoints: PInteger;
    num_chars: Integer;
    chardata_for_range: Pstbtt_packedchar;
    h_oversample: Byte;
    v_oversample: Byte;
  end;

  stbtt_pack_context = record
    user_allocator_context: Pointer;
    pack_info: Pointer;
    width: Integer;
    height: Integer;
    stride_in_bytes: Integer;
    padding: Integer;
    skip_missing: Integer;
    h_oversample: Cardinal;
    v_oversample: Cardinal;
    pixels: PByte;
    nodes: Pointer;
  end;

  stbtt_fontinfo = record
    userdata: Pointer;
    data: PByte;
    fontstart: Integer;
    numGlyphs: Integer;
    loca: Integer;
    head: Integer;
    glyf: Integer;
    hhea: Integer;
    hmtx: Integer;
    kern: Integer;
    gpos: Integer;
    svg: Integer;
    index_map: Integer;
    indexToLocFormat: Integer;
    cff: stbtt__buf;
    charstrings: stbtt__buf;
    gsubrs: stbtt__buf;
    subrs: stbtt__buf;
    fontdicts: stbtt__buf;
    fdselect: stbtt__buf;
  end;

  stbtt_kerningentry = record
    glyph1: Integer;
    glyph2: Integer;
    advance: Integer;
  end;

  _anonymous_type_8 = (
    STBTT_vmove = 1,
    STBTT_vline = 2,
    STBTT_vcurve = 3,
    STBTT_vcubic = 4);
  P_anonymous_type_8 = ^_anonymous_type_8;

  stbtt_vertex = record
    x: Smallint;
    y: Smallint;
    cx: Smallint;
    cy: Smallint;
    cx1: Smallint;
    cy1: Smallint;
    type_: Byte;
    padding: Byte;
  end;

  stbtt__bitmap = record
    w: Integer;
    h: Integer;
    stride: Integer;
    pixels: PByte;
  end;

  _anonymous_type_9 = (
    STBTT_PLATFORM_ID_UNICODE = 0,
    STBTT_PLATFORM_ID_MAC = 1,
    STBTT_PLATFORM_ID_ISO = 2,
    STBTT_PLATFORM_ID_MICROSOFT = 3);
  P_anonymous_type_9 = ^_anonymous_type_9;

  _anonymous_type_10 = (
    STBTT_UNICODE_EID_UNICODE_1_0 = 0,
    STBTT_UNICODE_EID_UNICODE_1_1 = 1,
    STBTT_UNICODE_EID_ISO_10646 = 2,
    STBTT_UNICODE_EID_UNICODE_2_0_BMP = 3,
    STBTT_UNICODE_EID_UNICODE_2_0_FULL = 4);
  P_anonymous_type_10 = ^_anonymous_type_10;

  _anonymous_type_11 = (
    STBTT_MS_EID_SYMBOL = 0,
    STBTT_MS_EID_UNICODE_BMP = 1,
    STBTT_MS_EID_SHIFTJIS = 2,
    STBTT_MS_EID_UNICODE_FULL = 10);
  P_anonymous_type_11 = ^_anonymous_type_11;

  _anonymous_type_12 = (
    STBTT_MAC_EID_ROMAN = 0,
    STBTT_MAC_EID_ARABIC = 4,
    STBTT_MAC_EID_JAPANESE = 1,
    STBTT_MAC_EID_HEBREW = 5,
    STBTT_MAC_EID_CHINESE_TRAD = 2,
    STBTT_MAC_EID_GREEK = 6,
    STBTT_MAC_EID_KOREAN = 3,
    STBTT_MAC_EID_RUSSIAN = 7);
  P_anonymous_type_12 = ^_anonymous_type_12;

  _anonymous_type_13 = (
    STBTT_MS_LANG_ENGLISH = 1033,
    STBTT_MS_LANG_ITALIAN = 1040,
    STBTT_MS_LANG_CHINESE = 2052,
    STBTT_MS_LANG_JAPANESE = 1041,
    STBTT_MS_LANG_DUTCH = 1043,
    STBTT_MS_LANG_KOREAN = 1042,
    STBTT_MS_LANG_FRENCH = 1036,
    STBTT_MS_LANG_RUSSIAN = 1049,
    STBTT_MS_LANG_GERMAN = 1031,
    STBTT_MS_LANG_SPANISH = 1033,
    STBTT_MS_LANG_HEBREW = 1037,
    STBTT_MS_LANG_SWEDISH = 1053);
  P_anonymous_type_13 = ^_anonymous_type_13;

  _anonymous_type_14 = (
    STBTT_MAC_LANG_ENGLISH = 0,
    STBTT_MAC_LANG_JAPANESE = 11,
    STBTT_MAC_LANG_ARABIC = 12,
    STBTT_MAC_LANG_KOREAN = 23,
    STBTT_MAC_LANG_DUTCH = 4,
    STBTT_MAC_LANG_RUSSIAN = 32,
    STBTT_MAC_LANG_FRENCH = 1,
    STBTT_MAC_LANG_SPANISH = 6,
    STBTT_MAC_LANG_GERMAN = 2,
    STBTT_MAC_LANG_SWEDISH = 5,
    STBTT_MAC_LANG_HEBREW = 10,
    STBTT_MAC_LANG_CHINESE_SIMPLIFIED = 33,
    STBTT_MAC_LANG_ITALIAN = 3,
    STBTT_MAC_LANG_CHINESE_TRAD = 19);
  P_anonymous_type_14 = ^_anonymous_type_14;
  Pplm_t = Pointer;
  PPplm_t = ^Pplm_t;
  Pplm_buffer_t = Pointer;
  PPplm_buffer_t = ^Pplm_buffer_t;
  Pplm_demux_t = Pointer;
  PPplm_demux_t = ^Pplm_demux_t;
  Pplm_video_t = Pointer;
  PPplm_video_t = ^Pplm_video_t;
  Pplm_audio_t = Pointer;
  PPplm_audio_t = ^Pplm_audio_t;

  plm_packet_t = record
    type_: Integer;
    pts: Double;
    length: NativeUInt;
    data: PUInt8;
  end;

  plm_plane_t = record
    width: Cardinal;
    height: Cardinal;
    data: PUInt8;
  end;

  plm_frame_t = record
    time: Double;
    width: Cardinal;
    height: Cardinal;
    y: plm_plane_t;
    cr: plm_plane_t;
    cb: plm_plane_t;
  end;

  plm_video_decode_callback = procedure(self: Pplm_t; frame: Pplm_frame_t; user: Pointer); cdecl;

  plm_samples_t = record
    time: Double;
    count: Cardinal;
    interleaved: array [0..2303] of Single;
  end;

  plm_audio_decode_callback = procedure(self: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;

  plm_buffer_load_callback = procedure(self: Pplm_buffer_t; user: Pointer); cdecl;
  nk_byte = UInt8;
  Pnk_byte = ^nk_byte;
  nk_short = Int16;
  nk_ushort = UInt16;
  nk_int = Int32;
  nk_uint = UInt32;
  Pnk_uint = ^nk_uint;
  nk_size = UIntPtr;
  Pnk_size = ^nk_size;
  nk_ptr = UIntPtr;
  nk_bool = Integer;
  Pnk_bool = ^nk_bool;
  nk_hash = nk_uint;
  nk_flags = nk_uint;
  Pnk_flags = ^nk_flags;
  nk_rune = nk_uint;
  Pnk_rune = ^nk_rune;
  _dummy_array0 = array [0..0] of UTF8Char;
  _dummy_array1 = array [0..0] of UTF8Char;
  _dummy_array2 = array [0..0] of UTF8Char;
  _dummy_array3 = array [0..0] of UTF8Char;
  _dummy_array4 = array [0..0] of UTF8Char;
  _dummy_array5 = array [0..0] of UTF8Char;
  _dummy_array6 = array [0..0] of UTF8Char;
  _dummy_array7 = array [0..0] of UTF8Char;
  _dummy_array8 = array [0..0] of UTF8Char;
  _dummy_array9 = array [0..0] of UTF8Char;

  _anonymous_type_15 = (
    nk_false = 0,
    nk_true = 1);
  P_anonymous_type_15 = ^_anonymous_type_15;

  nk_color = record
    r: nk_byte;
    g: nk_byte;
    b: nk_byte;
    a: nk_byte;
  end;

  nk_colorf = record
    r: Single;
    g: Single;
    b: Single;
    a: Single;
  end;

  nk_vec2 = record
    x: Single;
    y: Single;
  end;

  nk_vec2i = record
    x: Smallint;
    y: Smallint;
  end;

  nk_rect = record
    x: Single;
    y: Single;
    w: Single;
    h: Single;
  end;

  nk_recti = record
    x: Smallint;
    y: Smallint;
    w: Smallint;
    h: Smallint;
  end;

  nk_glyph = array [0..3] of UTF8Char;

  nk_handle = record
    case Integer of
      0: (ptr: Pointer);
      1: (id: Integer);
  end;

  nk_image = record
    handle: nk_handle;
    w: nk_ushort;
    h: nk_ushort;
    region: array [0..3] of nk_ushort;
  end;

  nk_nine_slice = record
    img: nk_image;
    l: nk_ushort;
    t: nk_ushort;
    r: nk_ushort;
    b: nk_ushort;
  end;

  nk_cursor = record
    img: nk_image;
    size: nk_vec2;
    offset: nk_vec2;
  end;

  nk_scroll = record
    x: nk_uint;
    y: nk_uint;
  end;

  nk_heading = (
    NK_UP = 0,
    NK_RIGHT = 1,
    NK_DOWN = 2,
    NK_LEFT = 3);
  Pnk_heading = ^nk_heading;

  nk_button_behavior = (
    NK_BUTTON_DEFAULT = 0,
    NK_BUTTON_REPEATER = 1);
  Pnk_button_behavior = ^nk_button_behavior;

  nk_modify = (
    NK_FIXED = 0,
    NK_MODIFIABLE = 1);
  Pnk_modify = ^nk_modify;

  nk_orientation = (
    NK_VERTICAL = 0,
    NK_HORIZONTAL = 1);
  Pnk_orientation = ^nk_orientation;

  nk_collapse_states = (
    NK_MINIMIZED = 0,
    NK_MAXIMIZED = 1);
  Pnk_collapse_states = ^nk_collapse_states;

  nk_show_states = (
    NK_HIDDEN = 0,
    NK_SHOWN = 1);
  Pnk_show_states = ^nk_show_states;

  nk_chart_type = (
    NK_CHART_LINES = 0,
    NK_CHART_COLUMN = 1,
    NK_CHART_MAX = 2);
  Pnk_chart_type = ^nk_chart_type;

  nk_chart_event = (
    NK_CHART_HOVERING = 1,
    NK_CHART_CLICKED = 2);
  Pnk_chart_event = ^nk_chart_event;

  nk_color_format = (
    NK_RGB = 0,
    NK_RGBA = 1);
  Pnk_color_format = ^nk_color_format;

  nk_popup_type = (
    NK_POPUP_STATIC = 0,
    NK_POPUP_DYNAMIC = 1);
  Pnk_popup_type = ^nk_popup_type;

  nk_layout_format = (
    NK_DYNAMIC = 0,
    NK_STATIC = 1);
  Pnk_layout_format = ^nk_layout_format;

  nk_tree_type = (
    NK_TREE_NODE = 0,
    NK_TREE_TAB = 1);
  Pnk_tree_type = ^nk_tree_type;

  nk_plugin_alloc = function(p1: nk_handle; old: Pointer; p3: nk_size): Pointer; cdecl;

  nk_plugin_free = procedure(p1: nk_handle; old: Pointer); cdecl;

  nk_plugin_filter = function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;

  nk_plugin_paste = procedure(p1: nk_handle; p2: Pnk_text_edit); cdecl;

  nk_plugin_copy = procedure(p1: nk_handle; const p2: PUTF8Char; len: Integer); cdecl;

  nk_allocator = record
    userdata: nk_handle;
    alloc: nk_plugin_alloc;
    free: nk_plugin_free;
  end;

  nk_symbol_type = (
    NK_SYMBOL_NONE = 0,
    NK_SYMBOL_X = 1,
    NK_SYMBOL_UNDERSCORE = 2,
    NK_SYMBOL_CIRCLE_SOLID = 3,
    NK_SYMBOL_CIRCLE_OUTLINE = 4,
    NK_SYMBOL_RECT_SOLID = 5,
    NK_SYMBOL_RECT_OUTLINE = 6,
    NK_SYMBOL_TRIANGLE_UP = 7,
    NK_SYMBOL_TRIANGLE_DOWN = 8,
    NK_SYMBOL_TRIANGLE_LEFT = 9,
    NK_SYMBOL_TRIANGLE_RIGHT = 10,
    NK_SYMBOL_PLUS = 11,
    NK_SYMBOL_MINUS = 12,
    NK_SYMBOL_MAX = 13);
  Pnk_symbol_type = ^nk_symbol_type;

  nk_keys = (
    NK_KEY_NONE = 0,
    NK_KEY_SHIFT = 1,
    NK_KEY_CTRL = 2,
    NK_KEY_DEL = 3,
    NK_KEY_ENTER = 4,
    NK_KEY_TAB = 5,
    NK_KEY_BACKSPACE = 6,
    NK_KEY_COPY = 7,
    NK_KEY_CUT = 8,
    NK_KEY_PASTE = 9,
    NK_KEY_UP = 10,
    NK_KEY_DOWN = 11,
    NK_KEY_LEFT = 12,
    NK_KEY_RIGHT = 13,
    NK_KEY_TEXT_INSERT_MODE = 14,
    NK_KEY_TEXT_REPLACE_MODE = 15,
    NK_KEY_TEXT_RESET_MODE = 16,
    NK_KEY_TEXT_LINE_START = 17,
    NK_KEY_TEXT_LINE_END = 18,
    NK_KEY_TEXT_START = 19,
    NK_KEY_TEXT_END = 20,
    NK_KEY_TEXT_UNDO = 21,
    NK_KEY_TEXT_REDO = 22,
    NK_KEY_TEXT_SELECT_ALL = 23,
    NK_KEY_TEXT_WORD_LEFT = 24,
    NK_KEY_TEXT_WORD_RIGHT = 25,
    NK_KEY_SCROLL_START = 26,
    NK_KEY_SCROLL_END = 27,
    NK_KEY_SCROLL_DOWN = 28,
    NK_KEY_SCROLL_UP = 29,
    NK_KEY_MAX = 30);
  Pnk_keys = ^nk_keys;

  nk_buttons = (
    NK_BUTTON_LEFT = 0,
    NK_BUTTON_MIDDLE = 1,
    NK_BUTTON_RIGHT = 2,
    NK_BUTTON_DOUBLE = 3,
    NK_BUTTON_MAX = 4);
  Pnk_buttons = ^nk_buttons;

  nk_anti_aliasing = (
    NK_ANTI_ALIASING_OFF = 0,
    NK_ANTI_ALIASING_ON = 1);
  Pnk_anti_aliasing = ^nk_anti_aliasing;

  nk_convert_result = (
    NK_CONVERT_SUCCESS = 0,
    NK_CONVERT_INVALID_PARAM = 1,
    NK_CONVERT_COMMAND_BUFFER_FULL = 2,
    NK_CONVERT_VERTEX_BUFFER_FULL = 4,
    NK_CONVERT_ELEMENT_BUFFER_FULL = 8);
  Pnk_convert_result = ^nk_convert_result;

  nk_draw_null_texture = record
    texture: nk_handle;
    uv: nk_vec2;
  end;

  nk_convert_config = record
    global_alpha: Single;
    line_AA: nk_anti_aliasing;
    shape_AA: nk_anti_aliasing;
    circle_segment_count: Cardinal;
    arc_segment_count: Cardinal;
    curve_segment_count: Cardinal;
    tex_null: nk_draw_null_texture;
    vertex_layout: Pnk_draw_vertex_layout_element;
    vertex_size: nk_size;
    vertex_alignment: nk_size;
  end;

  nk_panel_flags = (
    NK_WINDOW_BORDER = 1,
    NK_WINDOW_MOVABLE = 2,
    NK_WINDOW_SCALABLE = 4,
    NK_WINDOW_CLOSABLE = 8,
    NK_WINDOW_MINIMIZABLE = 16,
    NK_WINDOW_NO_SCROLLBAR = 32,
    NK_WINDOW_TITLE = 64,
    NK_WINDOW_SCROLL_AUTO_HIDE = 128,
    NK_WINDOW_BACKGROUND = 256,
    NK_WINDOW_SCALE_LEFT = 512,
    NK_WINDOW_NO_INPUT = 1024);
  Pnk_panel_flags = ^nk_panel_flags;

  nk_list_view = record
    begin_: Integer;
    end_: Integer;
    count: Integer;
    total_height: Integer;
    ctx: Pnk_context;
    scroll_pointer: Pnk_uint;
    scroll_value: nk_uint;
  end;

  nk_widget_layout_states = (
    NK_WIDGET_INVALID = 0,
    NK_WIDGET_VALID = 1,
    NK_WIDGET_ROM = 2);
  Pnk_widget_layout_states = ^nk_widget_layout_states;

  nk_widget_states = (
    NK_WIDGET_STATE_MODIFIED = 2,
    NK_WIDGET_STATE_INACTIVE = 4,
    NK_WIDGET_STATE_ENTERED = 8,
    NK_WIDGET_STATE_HOVER = 16,
    NK_WIDGET_STATE_ACTIVED = 32,
    NK_WIDGET_STATE_LEFT = 64,
    NK_WIDGET_STATE_HOVERED = 18,
    NK_WIDGET_STATE_ACTIVE = 34);
  Pnk_widget_states = ^nk_widget_states;

  nk_text_align = (
    NK_TEXT_ALIGN_LEFT = 1,
    NK_TEXT_ALIGN_CENTERED = 2,
    NK_TEXT_ALIGN_RIGHT = 4,
    NK_TEXT_ALIGN_TOP = 8,
    NK_TEXT_ALIGN_MIDDLE = 16,
    NK_TEXT_ALIGN_BOTTOM = 32);
  Pnk_text_align = ^nk_text_align;

  nk_text_alignment = (
    NK_TEXT_LEFT = 17,
    NK_TEXT_CENTERED = 18,
    NK_TEXT_RIGHT = 20);
  Pnk_text_alignment = ^nk_text_alignment;

  nk_edit_flags = (
    NK_EDIT_DEFAULT = 0,
    NK_EDIT_READ_ONLY = 1,
    NK_EDIT_AUTO_SELECT = 2,
    NK_EDIT_SIG_ENTER = 4,
    NK_EDIT_ALLOW_TAB = 8,
    NK_EDIT_NO_CURSOR = 16,
    NK_EDIT_SELECTABLE = 32,
    NK_EDIT_CLIPBOARD = 64,
    NK_EDIT_CTRL_ENTER_NEWLINE = 128,
    NK_EDIT_NO_HORIZONTAL_SCROLL = 256,
    NK_EDIT_ALWAYS_INSERT_MODE = 512,
    NK_EDIT_MULTILINE = 1024,
    NK_EDIT_GOTO_END_ON_ACTIVATE = 2048);
  Pnk_edit_flags = ^nk_edit_flags;

  nk_edit_types = (
    NK_EDIT_SIMPLE = 512,
    NK_EDIT_FIELD = 608,
    NK_EDIT_BOX = 1640,
    NK_EDIT_EDITOR = 1128);
  Pnk_edit_types = ^nk_edit_types;

  nk_edit_events = (
    NK_EDIT_ACTIVE = 1,
    NK_EDIT_INACTIVE = 2,
    NK_EDIT_ACTIVATED = 4,
    NK_EDIT_DEACTIVATED = 8,
    NK_EDIT_COMMITED = 16);
  Pnk_edit_events = ^nk_edit_events;

  nk_style_colors = (
    NK_COLOR_TEXT = 0,
    NK_COLOR_WINDOW = 1,
    NK_COLOR_HEADER = 2,
    NK_COLOR_BORDER = 3,
    NK_COLOR_BUTTON = 4,
    NK_COLOR_BUTTON_HOVER = 5,
    NK_COLOR_BUTTON_ACTIVE = 6,
    NK_COLOR_TOGGLE = 7,
    NK_COLOR_TOGGLE_HOVER = 8,
    NK_COLOR_TOGGLE_CURSOR = 9,
    NK_COLOR_SELECT = 10,
    NK_COLOR_SELECT_ACTIVE = 11,
    NK_COLOR_SLIDER = 12,
    NK_COLOR_SLIDER_CURSOR = 13,
    NK_COLOR_SLIDER_CURSOR_HOVER = 14,
    NK_COLOR_SLIDER_CURSOR_ACTIVE = 15,
    NK_COLOR_PROPERTY = 16,
    NK_COLOR_EDIT = 17,
    NK_COLOR_EDIT_CURSOR = 18,
    NK_COLOR_COMBO = 19,
    NK_COLOR_CHART = 20,
    NK_COLOR_CHART_COLOR = 21,
    NK_COLOR_CHART_COLOR_HIGHLIGHT = 22,
    NK_COLOR_SCROLLBAR = 23,
    NK_COLOR_SCROLLBAR_CURSOR = 24,
    NK_COLOR_SCROLLBAR_CURSOR_HOVER = 25,
    NK_COLOR_SCROLLBAR_CURSOR_ACTIVE = 26,
    NK_COLOR_TAB_HEADER = 27,
    NK_COLOR_COUNT = 28);
  Pnk_style_colors = ^nk_style_colors;

  nk_style_cursor = (
    NK_CURSOR_ARROW = 0,
    NK_CURSOR_TEXT = 1,
    NK_CURSOR_MOVE = 2,
    NK_CURSOR_RESIZE_VERTICAL = 3,
    NK_CURSOR_RESIZE_HORIZONTAL = 4,
    NK_CURSOR_RESIZE_TOP_LEFT_DOWN_RIGHT = 5,
    NK_CURSOR_RESIZE_TOP_RIGHT_DOWN_LEFT = 6,
    NK_CURSOR_COUNT = 7);
  Pnk_style_cursor = ^nk_style_cursor;

  nk_text_width_f = function(p1: nk_handle; h: Single; const p3: PUTF8Char; len: Integer): Single; cdecl;

  nk_query_font_glyph_f = procedure(handle: nk_handle; font_height: Single; glyph: Pnk_user_font_glyph; codepoint: nk_rune; next_codepoint: nk_rune); cdecl;

  nk_user_font_glyph = record
    uv: array [0..1] of nk_vec2;
    offset: nk_vec2;
    width: Single;
    height: Single;
    xadvance: Single;
  end;

  nk_user_font = record
    userdata: nk_handle;
    height: Single;
    width: nk_text_width_f;
    query: nk_query_font_glyph_f;
    texture: nk_handle;
  end;

  nk_font_coord_type = (
    NK_COORD_UV = 0,
    NK_COORD_PIXEL = 1);
  Pnk_font_coord_type = ^nk_font_coord_type;

  nk_baked_font = record
    height: Single;
    ascent: Single;
    descent: Single;
    glyph_offset: nk_rune;
    glyph_count: nk_rune;
    ranges: Pnk_rune;
  end;

  nk_font_config = record
    next: Pnk_font_config;
    ttf_blob: Pointer;
    ttf_size: nk_size;
    ttf_data_owned_by_atlas: Byte;
    merge_mode: Byte;
    pixel_snap: Byte;
    oversample_v: Byte;
    oversample_h: Byte;
    padding: array [0..2] of Byte;
    size: Single;
    coord_type: nk_font_coord_type;
    spacing: nk_vec2;
    range: Pnk_rune;
    font: Pnk_baked_font;
    fallback_glyph: nk_rune;
    n: Pnk_font_config;
    p: Pnk_font_config;
  end;

  nk_font_glyph = record
    codepoint: nk_rune;
    xadvance: Single;
    x0: Single;
    y0: Single;
    x1: Single;
    y1: Single;
    w: Single;
    h: Single;
    u0: Single;
    v0: Single;
    u1: Single;
    v1: Single;
  end;

  nk_font = record
    next: Pnk_font;
    handle: nk_user_font;
    info: nk_baked_font;
    scale: Single;
    glyphs: Pnk_font_glyph;
    fallback: Pnk_font_glyph;
    fallback_codepoint: nk_rune;
    texture: nk_handle;
    config: Pnk_font_config;
  end;

  nk_font_atlas_format = (
    NK_FONT_ATLAS_ALPHA8 = 0,
    NK_FONT_ATLAS_RGBA32 = 1);
  Pnk_font_atlas_format = ^nk_font_atlas_format;

  nk_font_atlas = record
    pixel: Pointer;
    tex_width: Integer;
    tex_height: Integer;
    permanent: nk_allocator;
    temporary: nk_allocator;
    custom: nk_recti;
    cursors: array [0..6] of nk_cursor;
    glyph_count: Integer;
    glyphs: Pnk_font_glyph;
    default_font: Pnk_font;
    fonts: Pnk_font;
    config: Pnk_font_config;
    font_num: Integer;
  end;

  nk_memory_status = record
    memory: Pointer;
    type_: Cardinal;
    size: nk_size;
    allocated: nk_size;
    needed: nk_size;
    calls: nk_size;
  end;

  nk_allocation_type = (
    NK_BUFFER_FIXED = 0,
    NK_BUFFER_DYNAMIC = 1);
  Pnk_allocation_type = ^nk_allocation_type;

  nk_buffer_allocation_type = (
    NK_BUFFER_FRONT = 0,
    NK_BUFFER_BACK = 1,
    NK_BUFFER_MAX = 2);
  Pnk_buffer_allocation_type = ^nk_buffer_allocation_type;

  nk_buffer_marker = record
    active: nk_bool;
    offset: nk_size;
  end;

  nk_memory = record
    ptr: Pointer;
    size: nk_size;
  end;

  nk_buffer = record
    marker: array [0..1] of nk_buffer_marker;
    pool: nk_allocator;
    type_: nk_allocation_type;
    memory: nk_memory;
    grow_factor: Single;
    allocated: nk_size;
    needed: nk_size;
    calls: nk_size;
    size: nk_size;
  end;

  nk_str = record
    buffer: nk_buffer;
    len: Integer;
  end;

  nk_clipboard = record
    userdata: nk_handle;
    paste: nk_plugin_paste;
    copy: nk_plugin_copy;
  end;

  nk_text_undo_record = record
    where: Integer;
    insert_length: Smallint;
    delete_length: Smallint;
    char_storage: Smallint;
  end;

  nk_text_undo_state = record
    undo_rec: array [0..98] of nk_text_undo_record;
    undo_char: array [0..998] of nk_rune;
    undo_point: Smallint;
    redo_point: Smallint;
    undo_char_point: Smallint;
    redo_char_point: Smallint;
  end;

  nk_text_edit_type = (
    NK_TEXT_EDIT_SINGLE_LINE = 0,
    NK_TEXT_EDIT_MULTI_LINE = 1);
  Pnk_text_edit_type = ^nk_text_edit_type;

  nk_text_edit_mode = (
    NK_TEXT_EDIT_MODE_VIEW = 0,
    NK_TEXT_EDIT_MODE_INSERT = 1,
    NK_TEXT_EDIT_MODE_REPLACE = 2);
  Pnk_text_edit_mode = ^nk_text_edit_mode;

  nk_text_edit = record
    clip: nk_clipboard;
    string_: nk_str;
    filter: nk_plugin_filter;
    scrollbar: nk_vec2;
    cursor: Integer;
    select_start: Integer;
    select_end: Integer;
    mode: Byte;
    cursor_at_end_of_line: Byte;
    initialized: Byte;
    has_preferred_x: Byte;
    single_line: Byte;
    active: Byte;
    padding1: Byte;
    preferred_x: Single;
    undo: nk_text_undo_state;
  end;

  nk_command_type = (
    NK_COMMAND_NOP_ = 0,
    NK_COMMAND_SCISSOR_ = 1,
    NK_COMMAND_LINE_ = 2,
    NK_COMMAND_CURVE_ = 3,
    NK_COMMAND_RECT_ = 4,
    NK_COMMAND_RECT_FILLED_ = 5,
    NK_COMMAND_RECT_MULTI_COLOR_ = 6,
    NK_COMMAND_CIRCLE_ = 7,
    NK_COMMAND_CIRCLE_FILLED_ = 8,
    NK_COMMAND_ARC_ = 9,
    NK_COMMAND_ARC_FILLED_ = 10,
    NK_COMMAND_TRIANGLE_ = 11,
    NK_COMMAND_TRIANGLE_FILLED_ = 12,
    NK_COMMAND_POLYGON_ = 13,
    NK_COMMAND_POLYGON_FILLED_ = 14,
    NK_COMMAND_POLYLINE_ = 15,
    NK_COMMAND_TEXT_ = 16,
    NK_COMMAND_IMAGE_ = 17,
    NK_COMMAND_CUSTOM_ = 18);
  Pnk_command_type = ^nk_command_type;

  nk_command = record
    type_: nk_command_type;
    next: nk_size;
  end;

  nk_command_scissor = record
    header: nk_command;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
  end;

  nk_command_line = record
    header: nk_command;
    line_thickness: Word;
    begin_: nk_vec2i;
    end_: nk_vec2i;
    color: nk_color;
  end;

  nk_command_curve = record
    header: nk_command;
    line_thickness: Word;
    begin_: nk_vec2i;
    end_: nk_vec2i;
    ctrl: array [0..1] of nk_vec2i;
    color: nk_color;
  end;

  nk_command_rect = record
    header: nk_command;
    rounding: Word;
    line_thickness: Word;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    color: nk_color;
  end;

  nk_command_rect_filled = record
    header: nk_command;
    rounding: Word;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    color: nk_color;
  end;

  nk_command_rect_multi_color = record
    header: nk_command;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    left: nk_color;
    top: nk_color;
    bottom: nk_color;
    right: nk_color;
  end;

  nk_command_triangle = record
    header: nk_command;
    line_thickness: Word;
    a: nk_vec2i;
    b: nk_vec2i;
    c: nk_vec2i;
    color: nk_color;
  end;

  nk_command_triangle_filled = record
    header: nk_command;
    a: nk_vec2i;
    b: nk_vec2i;
    c: nk_vec2i;
    color: nk_color;
  end;

  nk_command_circle = record
    header: nk_command;
    x: Smallint;
    y: Smallint;
    line_thickness: Word;
    w: Word;
    h: Word;
    color: nk_color;
  end;

  nk_command_circle_filled = record
    header: nk_command;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    color: nk_color;
  end;

  nk_command_arc = record
    header: nk_command;
    cx: Smallint;
    cy: Smallint;
    r: Word;
    line_thickness: Word;
    a: array [0..1] of Single;
    color: nk_color;
  end;

  nk_command_arc_filled = record
    header: nk_command;
    cx: Smallint;
    cy: Smallint;
    r: Word;
    a: array [0..1] of Single;
    color: nk_color;
  end;

  nk_command_polygon = record
    header: nk_command;
    color: nk_color;
    line_thickness: Word;
    point_count: Word;
    points: array [0..0] of nk_vec2i;
  end;

  nk_command_polygon_filled = record
    header: nk_command;
    color: nk_color;
    point_count: Word;
    points: array [0..0] of nk_vec2i;
  end;

  nk_command_polyline = record
    header: nk_command;
    color: nk_color;
    line_thickness: Word;
    point_count: Word;
    points: array [0..0] of nk_vec2i;
  end;

  nk_command_image = record
    header: nk_command;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    img: nk_image;
    col: nk_color;
  end;

  nk_command_custom_callback = procedure(canvas: Pointer; x: Smallint; y: Smallint; w: Word; h: Word; callback_data: nk_handle); cdecl;

  nk_command_custom = record
    header: nk_command;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    callback_data: nk_handle;
    callback: nk_command_custom_callback;
  end;

  nk_command_text = record
    header: nk_command;
    font: Pnk_user_font;
    background: nk_color;
    foreground: nk_color;
    x: Smallint;
    y: Smallint;
    w: Word;
    h: Word;
    height: Single;
    length: Integer;
    string_: array [0..0] of UTF8Char;
  end;

  nk_command_clipping = (
    NK_CLIPPING_OFF = 0,
    NK_CLIPPING_ON = 1);
  Pnk_command_clipping = ^nk_command_clipping;

  nk_command_buffer = record
    base: Pnk_buffer;
    clip: nk_rect;
    use_clipping: Integer;
    userdata: nk_handle;
    begin_: nk_size;
    end_: nk_size;
    last: nk_size;
  end;

  nk_mouse_button = record
    down: nk_bool;
    clicked: Cardinal;
    clicked_pos: nk_vec2;
  end;

  nk_mouse = record
    buttons: array [0..3] of nk_mouse_button;
    pos: nk_vec2;
    prev: nk_vec2;
    delta: nk_vec2;
    scroll_delta: nk_vec2;
    grab: Byte;
    grabbed: Byte;
    ungrab: Byte;
  end;

  nk_key = record
    down: nk_bool;
    clicked: Cardinal;
  end;

  nk_keyboard = record
    keys: array [0..29] of nk_key;
    text: array [0..15] of UTF8Char;
    text_len: Integer;
  end;

  nk_input = record
    keyboard: nk_keyboard;
    mouse: nk_mouse;
  end;

  nk_draw_index = nk_ushort;

  nk_draw_list_stroke = (
    NK_STROKE_OPEN = 0,
    NK_STROKE_CLOSED = 1);
  Pnk_draw_list_stroke = ^nk_draw_list_stroke;

  nk_draw_vertex_layout_attribute = (
    NK_VERTEX_POSITION = 0,
    NK_VERTEX_COLOR = 1,
    NK_VERTEX_TEXCOORD = 2,
    NK_VERTEX_ATTRIBUTE_COUNT = 3);
  Pnk_draw_vertex_layout_attribute = ^nk_draw_vertex_layout_attribute;

  nk_draw_vertex_layout_format = (
    NK_FORMAT_SCHAR = 0,
    NK_FORMAT_SSHORT = 1,
    NK_FORMAT_SINT = 2,
    NK_FORMAT_UCHAR = 3,
    NK_FORMAT_USHORT = 4,
    NK_FORMAT_UINT = 5,
    NK_FORMAT_FLOAT = 6,
    NK_FORMAT_DOUBLE = 7,
    NK_FORMAT_COLOR_BEGIN = 8,
    NK_FORMAT_R8G8B8 = 8,
    NK_FORMAT_R16G15B16 = 9,
    NK_FORMAT_R32G32B32 = 10,
    NK_FORMAT_R8G8B8A8 = 11,
    NK_FORMAT_B8G8R8A8 = 12,
    NK_FORMAT_R16G15B16A16 = 13,
    NK_FORMAT_R32G32B32A32 = 14,
    NK_FORMAT_R32G32B32A32_FLOAT = 15,
    NK_FORMAT_R32G32B32A32_DOUBLE = 16,
    NK_FORMAT_RGB32 = 17,
    NK_FORMAT_RGBA32 = 18,
    NK_FORMAT_COLOR_END = 18,
    NK_FORMAT_COUNT = 19);
  Pnk_draw_vertex_layout_format = ^nk_draw_vertex_layout_format;

  nk_draw_vertex_layout_element = record
    attribute: nk_draw_vertex_layout_attribute;
    format: nk_draw_vertex_layout_format;
    offset: nk_size;
  end;

  nk_draw_command = record
    elem_count: Cardinal;
    clip_rect: nk_rect;
    texture: nk_handle;
  end;

  nk_draw_list = record
    clip_rect: nk_rect;
    circle_vtx: array [0..11] of nk_vec2;
    config: nk_convert_config;
    buffer: Pnk_buffer;
    vertices: Pnk_buffer;
    elements: Pnk_buffer;
    element_count: Cardinal;
    vertex_count: Cardinal;
    cmd_count: Cardinal;
    cmd_offset: nk_size;
    path_count: Cardinal;
    path_offset: Cardinal;
    line_AA: nk_anti_aliasing;
    shape_AA: nk_anti_aliasing;
  end;

  nk_style_item_type = (
    NK_STYLE_ITEM_COLOR = 0,
    NK_STYLE_ITEM_IMAGE = 1,
    NK_STYLE_ITEM_NINE_SLICE = 2);
  Pnk_style_item_type = ^nk_style_item_type;

  nk_style_item_data = record
    case Integer of
      0: (color: nk_color);
      1: (image: nk_image);
      2: (slice: nk_nine_slice);
  end;

  nk_style_item = record
    type_: nk_style_item_type;
    data: nk_style_item_data;
  end;

  nk_style_text = record
    color: nk_color;
    padding: nk_vec2;
  end;

  nk_style_button = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    text_background: nk_color;
    text_normal: nk_color;
    text_hover: nk_color;
    text_active: nk_color;
    text_alignment: nk_flags;
    border: Single;
    rounding: Single;
    padding: nk_vec2;
    image_padding: nk_vec2;
    touch_padding: nk_vec2;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; userdata: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; userdata: nk_handle); cdecl;
  end;

  nk_style_toggle = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    cursor_normal: nk_style_item;
    cursor_hover: nk_style_item;
    text_normal: nk_color;
    text_hover: nk_color;
    text_active: nk_color;
    text_background: nk_color;
    text_alignment: nk_flags;
    padding: nk_vec2;
    touch_padding: nk_vec2;
    spacing: Single;
    border: Single;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
  end;

  nk_style_selectable = record
    normal: nk_style_item;
    hover: nk_style_item;
    pressed: nk_style_item;
    normal_active: nk_style_item;
    hover_active: nk_style_item;
    pressed_active: nk_style_item;
    text_normal: nk_color;
    text_hover: nk_color;
    text_pressed: nk_color;
    text_normal_active: nk_color;
    text_hover_active: nk_color;
    text_pressed_active: nk_color;
    text_background: nk_color;
    text_alignment: nk_flags;
    rounding: Single;
    padding: nk_vec2;
    touch_padding: nk_vec2;
    image_padding: nk_vec2;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
  end;

  nk_style_slider = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    bar_normal: nk_color;
    bar_hover: nk_color;
    bar_active: nk_color;
    bar_filled: nk_color;
    cursor_normal: nk_style_item;
    cursor_hover: nk_style_item;
    cursor_active: nk_style_item;
    border: Single;
    rounding: Single;
    bar_height: Single;
    padding: nk_vec2;
    spacing: nk_vec2;
    cursor_size: nk_vec2;
    show_buttons: Integer;
    inc_button: nk_style_button;
    dec_button: nk_style_button;
    inc_symbol: nk_symbol_type;
    dec_symbol: nk_symbol_type;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
  end;

  nk_style_progress = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    cursor_normal: nk_style_item;
    cursor_hover: nk_style_item;
    cursor_active: nk_style_item;
    cursor_border_color: nk_color;
    rounding: Single;
    border: Single;
    cursor_border: Single;
    cursor_rounding: Single;
    padding: nk_vec2;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
  end;

  nk_style_scrollbar = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    cursor_normal: nk_style_item;
    cursor_hover: nk_style_item;
    cursor_active: nk_style_item;
    cursor_border_color: nk_color;
    border: Single;
    rounding: Single;
    border_cursor: Single;
    rounding_cursor: Single;
    padding: nk_vec2;
    show_buttons: Integer;
    inc_button: nk_style_button;
    dec_button: nk_style_button;
    inc_symbol: nk_symbol_type;
    dec_symbol: nk_symbol_type;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
  end;

  nk_style_edit = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    scrollbar: nk_style_scrollbar;
    cursor_normal: nk_color;
    cursor_hover: nk_color;
    cursor_text_normal: nk_color;
    cursor_text_hover: nk_color;
    text_normal: nk_color;
    text_hover: nk_color;
    text_active: nk_color;
    selected_normal: nk_color;
    selected_hover: nk_color;
    selected_text_normal: nk_color;
    selected_text_hover: nk_color;
    border: Single;
    rounding: Single;
    cursor_size: Single;
    scrollbar_size: nk_vec2;
    padding: nk_vec2;
    row_padding: Single;
  end;

  nk_style_property = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    label_normal: nk_color;
    label_hover: nk_color;
    label_active: nk_color;
    sym_left: nk_symbol_type;
    sym_right: nk_symbol_type;
    border: Single;
    rounding: Single;
    padding: nk_vec2;
    edit: nk_style_edit;
    inc_button: nk_style_button;
    dec_button: nk_style_button;
    userdata: nk_handle;
    draw_begin: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
    draw_end: procedure(p1: Pnk_command_buffer; p2: nk_handle); cdecl;
  end;

  nk_style_chart = record
    background: nk_style_item;
    border_color: nk_color;
    selected_color: nk_color;
    color: nk_color;
    border: Single;
    rounding: Single;
    padding: nk_vec2;
  end;

  nk_style_combo = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    border_color: nk_color;
    label_normal: nk_color;
    label_hover: nk_color;
    label_active: nk_color;
    symbol_normal: nk_color;
    symbol_hover: nk_color;
    symbol_active: nk_color;
    button: nk_style_button;
    sym_normal: nk_symbol_type;
    sym_hover: nk_symbol_type;
    sym_active: nk_symbol_type;
    border: Single;
    rounding: Single;
    content_padding: nk_vec2;
    button_padding: nk_vec2;
    spacing: nk_vec2;
  end;

  nk_style_tab = record
    background: nk_style_item;
    border_color: nk_color;
    text: nk_color;
    tab_maximize_button: nk_style_button;
    tab_minimize_button: nk_style_button;
    node_maximize_button: nk_style_button;
    node_minimize_button: nk_style_button;
    sym_minimize: nk_symbol_type;
    sym_maximize: nk_symbol_type;
    border: Single;
    rounding: Single;
    indent: Single;
    padding: nk_vec2;
    spacing: nk_vec2;
  end;

  nk_style_header_align = (
    NK_HEADER_LEFT = 0,
    NK_HEADER_RIGHT = 1);
  Pnk_style_header_align = ^nk_style_header_align;

  nk_style_window_header = record
    normal: nk_style_item;
    hover: nk_style_item;
    active: nk_style_item;
    close_button: nk_style_button;
    minimize_button: nk_style_button;
    close_symbol: nk_symbol_type;
    minimize_symbol: nk_symbol_type;
    maximize_symbol: nk_symbol_type;
    label_normal: nk_color;
    label_hover: nk_color;
    label_active: nk_color;
    align: nk_style_header_align;
    padding: nk_vec2;
    label_padding: nk_vec2;
    spacing: nk_vec2;
  end;

  nk_style_window = record
    header: nk_style_window_header;
    fixed_background: nk_style_item;
    background: nk_color;
    border_color: nk_color;
    popup_border_color: nk_color;
    combo_border_color: nk_color;
    contextual_border_color: nk_color;
    menu_border_color: nk_color;
    group_border_color: nk_color;
    tooltip_border_color: nk_color;
    scaler: nk_style_item;
    border: Single;
    combo_border: Single;
    contextual_border: Single;
    menu_border: Single;
    group_border: Single;
    tooltip_border: Single;
    popup_border: Single;
    min_row_height_padding: Single;
    rounding: Single;
    spacing: nk_vec2;
    scrollbar_size: nk_vec2;
    min_size: nk_vec2;
    padding: nk_vec2;
    group_padding: nk_vec2;
    popup_padding: nk_vec2;
    combo_padding: nk_vec2;
    contextual_padding: nk_vec2;
    menu_padding: nk_vec2;
    tooltip_padding: nk_vec2;
  end;

  nk_style = record
    font: Pnk_user_font;
    cursors: array [0..6] of Pnk_cursor;
    cursor_active: Pnk_cursor;
    cursor_last: Pnk_cursor;
    cursor_visible: Integer;
    text: nk_style_text;
    button: nk_style_button;
    contextual_button: nk_style_button;
    menu_button: nk_style_button;
    option: nk_style_toggle;
    checkbox: nk_style_toggle;
    selectable: nk_style_selectable;
    slider: nk_style_slider;
    progress: nk_style_progress;
    property_: nk_style_property;
    edit: nk_style_edit;
    chart: nk_style_chart;
    scrollh: nk_style_scrollbar;
    scrollv: nk_style_scrollbar;
    tab: nk_style_tab;
    combo: nk_style_combo;
    window: nk_style_window;
  end;

  nk_panel_type = (
    NK_PANEL_NONE = 0,
    NK_PANEL_WINDOW = 1,
    NK_PANEL_GROUP = 2,
    NK_PANEL_POPUP = 4,
    NK_PANEL_CONTEXTUAL = 16,
    NK_PANEL_COMBO = 32,
    NK_PANEL_MENU = 64,
    NK_PANEL_TOOLTIP = 128);
  Pnk_panel_type = ^nk_panel_type;

  nk_panel_set = (
    NK_PANEL_SET_NONBLOCK = 240,
    NK_PANEL_SET_POPUP = 244,
    NK_PANEL_SET_SUB = 246);
  Pnk_panel_set = ^nk_panel_set;

  nk_chart_slot = record
    type_: nk_chart_type;
    color: nk_color;
    highlight: nk_color;
    min: Single;
    max: Single;
    range: Single;
    count: Integer;
    last: nk_vec2;
    index: Integer;
  end;

  nk_chart = record
    slot: Integer;
    x: Single;
    y: Single;
    w: Single;
    h: Single;
    slots: array [0..3] of nk_chart_slot;
  end;

  nk_panel_row_layout_type = (
    NK_LAYOUT_DYNAMIC_FIXED = 0,
    NK_LAYOUT_DYNAMIC_ROW = 1,
    NK_LAYOUT_DYNAMIC_FREE = 2,
    NK_LAYOUT_DYNAMIC = 3,
    NK_LAYOUT_STATIC_FIXED = 4,
    NK_LAYOUT_STATIC_ROW = 5,
    NK_LAYOUT_STATIC_FREE = 6,
    NK_LAYOUT_STATIC = 7,
    NK_LAYOUT_TEMPLATE = 8,
    NK_LAYOUT_COUNT = 9);
  Pnk_panel_row_layout_type = ^nk_panel_row_layout_type;

  nk_row_layout = record
    type_: nk_panel_row_layout_type;
    index: Integer;
    height: Single;
    min_height: Single;
    columns: Integer;
    ratio: PSingle;
    item_width: Single;
    item_height: Single;
    item_offset: Single;
    filled: Single;
    item: nk_rect;
    tree_depth: Integer;
    templates: array [0..15] of Single;
  end;

  nk_popup_buffer = record
    begin_: nk_size;
    parent: nk_size;
    last: nk_size;
    end_: nk_size;
    active: nk_bool;
  end;

  nk_menu_state = record
    x: Single;
    y: Single;
    w: Single;
    h: Single;
    offset: nk_scroll;
  end;

  nk_panel = record
    type_: nk_panel_type;
    flags: nk_flags;
    bounds: nk_rect;
    offset_x: Pnk_uint;
    offset_y: Pnk_uint;
    at_x: Single;
    at_y: Single;
    max_x: Single;
    footer_height: Single;
    header_height: Single;
    border: Single;
    has_scrolling: Cardinal;
    clip: nk_rect;
    menu: nk_menu_state;
    row: nk_row_layout;
    chart: nk_chart;
    buffer: Pnk_command_buffer;
    parent: Pnk_panel;
  end;

  nk_window_flags = (
    NK_WINDOW_PRIVATE = 2048,
    NK_WINDOW_DYNAMIC = 2048,
    NK_WINDOW_ROM = 4096,
    NK_WINDOW_NOT_INTERACTIVE = 5120,
    NK_WINDOW_HIDDEN = 8192,
    NK_WINDOW_CLOSED = 16384,
    NK_WINDOW_MINIMIZED = 32768,
    NK_WINDOW_REMOVE_ROM = 65536);
  Pnk_window_flags = ^nk_window_flags;

  nk_popup_state = record
    win: Pnk_window;
    type_: nk_panel_type;
    buf: nk_popup_buffer;
    name: nk_hash;
    active: nk_bool;
    combo_count: Cardinal;
    con_count: Cardinal;
    con_old: Cardinal;
    active_con: Cardinal;
    header: nk_rect;
  end;

  nk_edit_state = record
    name: nk_hash;
    seq: Cardinal;
    old: Cardinal;
    active: Integer;
    prev: Integer;
    cursor: Integer;
    sel_start: Integer;
    sel_end: Integer;
    scrollbar: nk_scroll;
    mode: Byte;
    single_line: Byte;
  end;

  nk_property_state = record
    active: Integer;
    prev: Integer;
    buffer: array [0..63] of UTF8Char;
    length: Integer;
    cursor: Integer;
    select_start: Integer;
    select_end: Integer;
    name: nk_hash;
    seq: Cardinal;
    old: Cardinal;
    state: Integer;
  end;

  nk_window = record
    seq: Cardinal;
    name: nk_hash;
    name_string: array [0..63] of UTF8Char;
    flags: nk_flags;
    bounds: nk_rect;
    scrollbar: nk_scroll;
    buffer: nk_command_buffer;
    layout: Pnk_panel;
    scrollbar_hiding_timer: Single;
    property_: nk_property_state;
    popup: nk_popup_state;
    edit: nk_edit_state;
    scrolled: Cardinal;
    tables: Pnk_table;
    table_count: Cardinal;
    next: Pnk_window;
    prev: Pnk_window;
    parent: Pnk_window;
  end;

  nk_config_stack_style_item_element = record
    address: Pnk_style_item;
    old_value: nk_style_item;
  end;

  nk_config_stack_float_element = record
    address: PSingle;
    old_value: Single;
  end;

  nk_config_stack_vec2_element = record
    address: Pnk_vec2;
    old_value: nk_vec2;
  end;

  nk_config_stack_flags_element = record
    address: Pnk_flags;
    old_value: nk_flags;
  end;

  nk_config_stack_color_element = record
    address: Pnk_color;
    old_value: nk_color;
  end;

  nk_config_stack_user_font_element = record
    address: PPnk_user_font;
    old_value: Pnk_user_font;
  end;

  nk_config_stack_button_behavior_element = record
    address: Pnk_button_behavior;
    old_value: nk_button_behavior;
  end;

  nk_config_stack_style_item = record
    head: Integer;
    elements: array [0..15] of nk_config_stack_style_item_element;
  end;

  nk_config_stack_float = record
    head: Integer;
    elements: array [0..31] of nk_config_stack_float_element;
  end;

  nk_config_stack_vec2 = record
    head: Integer;
    elements: array [0..15] of nk_config_stack_vec2_element;
  end;

  nk_config_stack_flags = record
    head: Integer;
    elements: array [0..31] of nk_config_stack_flags_element;
  end;

  nk_config_stack_color = record
    head: Integer;
    elements: array [0..31] of nk_config_stack_color_element;
  end;

  nk_config_stack_user_font = record
    head: Integer;
    elements: array [0..7] of nk_config_stack_user_font_element;
  end;

  nk_config_stack_button_behavior = record
    head: Integer;
    elements: array [0..7] of nk_config_stack_button_behavior_element;
  end;

  nk_configuration_stacks = record
    style_items: nk_config_stack_style_item;
    floats: nk_config_stack_float;
    vectors: nk_config_stack_vec2;
    flags: nk_config_stack_flags;
    colors: nk_config_stack_color;
    fonts: nk_config_stack_user_font;
    button_behaviors: nk_config_stack_button_behavior;
  end;

  nk_table = record
    seq: Cardinal;
    size: Cardinal;
    keys: array [0..58] of nk_hash;
    values: array [0..58] of nk_uint;
    next: Pnk_table;
    prev: Pnk_table;
  end;

  nk_page_data = record
    case Integer of
      0: (tbl: nk_table);
      1: (pan: nk_panel);
      2: (win: nk_window);
  end;

  nk_page_element = record
    data: nk_page_data;
    next: Pnk_page_element;
    prev: Pnk_page_element;
  end;

  nk_page = record
    size: Cardinal;
    next: Pnk_page;
    win: array [0..0] of nk_page_element;
  end;

  nk_pool = record
    alloc: nk_allocator;
    type_: nk_allocation_type;
    page_count: Cardinal;
    pages: Pnk_page;
    freelist: Pnk_page_element;
    capacity: Cardinal;
    size: nk_size;
    cap: nk_size;
  end;

  nk_context = record
    input: nk_input;
    style: nk_style;
    memory: nk_buffer;
    clip: nk_clipboard;
    last_widget_state: nk_flags;
    button_behavior: nk_button_behavior;
    stacks: nk_configuration_stacks;
    delta_time_seconds: Single;
    draw_list: nk_draw_list;
    text_edit: nk_text_edit;
    overlay: nk_command_buffer;
    build: Integer;
    use_pool: Integer;
    pool: nk_pool;
    begin_: Pnk_window;
    end_: Pnk_window;
    active: Pnk_window;
    current: Pnk_window;
    freelist: Pnk_page_element;
    count: Cardinal;
    seq: Cardinal;
  end;

const
  PLM_DEMUX_PACKET_PRIVATE : Integer = $BD;
  PLM_DEMUX_PACKET_AUDIO_1 : Integer = $C0;
  PLM_DEMUX_PACKET_AUDIO_2 : Integer = $C1;
  PLM_DEMUX_PACKET_AUDIO_3 : Integer = $C2;
  PLM_DEMUX_PACKET_AUDIO_4 : Integer = $C2;
  PLM_DEMUX_PACKET_VIDEO_1 : Integer = $E0;

var
  SDL_GetPlatform: function(): PUTF8Char; cdecl;
  SDL_malloc: function(size: NativeUInt): Pointer; cdecl;
  SDL_calloc: function(nmemb: NativeUInt; size: NativeUInt): Pointer; cdecl;
  SDL_realloc: function(mem: Pointer; size: NativeUInt): Pointer; cdecl;
  SDL_free: procedure(mem: Pointer); cdecl;
  SDL_GetOriginalMemoryFunctions: procedure(malloc_func: PSDL_malloc_func; calloc_func: PSDL_calloc_func; realloc_func: PSDL_realloc_func; free_func: PSDL_free_func); cdecl;
  SDL_GetMemoryFunctions: procedure(malloc_func: PSDL_malloc_func; calloc_func: PSDL_calloc_func; realloc_func: PSDL_realloc_func; free_func: PSDL_free_func); cdecl;
  SDL_SetMemoryFunctions: function(malloc_func: SDL_malloc_func; calloc_func: SDL_calloc_func; realloc_func: SDL_realloc_func; free_func: SDL_free_func): Integer; cdecl;
  SDL_GetNumAllocations: function(): Integer; cdecl;
  SDL_getenv: function(const name: PUTF8Char): PUTF8Char; cdecl;
  SDL_setenv: function(const name: PUTF8Char; const value: PUTF8Char; overwrite: Integer): Integer; cdecl;

type
  SDL_qsort_compare = function(const p1: Pointer; const p2: Pointer): Integer; cdecl;

var
  SDL_qsort: procedure(base: Pointer; nmemb: NativeUInt; size: NativeUInt; compare: SDL_qsort_compare); cdecl;

type
  SDL_bsearch_compare = function(const p1: Pointer; const p2: Pointer): Integer; cdecl;

var
  SDL_bsearch: function(const key: Pointer; const base: Pointer; nmemb: NativeUInt; size: NativeUInt; compare: SDL_bsearch_compare): Pointer; cdecl;
  SDL_abs: function(x: Integer): Integer; cdecl;
  SDL_isalpha: function(x: Integer): Integer; cdecl;
  SDL_isalnum: function(x: Integer): Integer; cdecl;
  SDL_isblank: function(x: Integer): Integer; cdecl;
  SDL_iscntrl: function(x: Integer): Integer; cdecl;
  SDL_isdigit: function(x: Integer): Integer; cdecl;
  SDL_isxdigit: function(x: Integer): Integer; cdecl;
  SDL_ispunct: function(x: Integer): Integer; cdecl;
  SDL_isspace: function(x: Integer): Integer; cdecl;
  SDL_isupper: function(x: Integer): Integer; cdecl;
  SDL_islower: function(x: Integer): Integer; cdecl;
  SDL_isprint: function(x: Integer): Integer; cdecl;
  SDL_isgraph: function(x: Integer): Integer; cdecl;
  SDL_toupper: function(x: Integer): Integer; cdecl;
  SDL_tolower: function(x: Integer): Integer; cdecl;
  SDL_crc16: function(crc: Uint16; const data: Pointer; len: NativeUInt): Uint16; cdecl;
  SDL_crc32: function(crc: Uint32; const data: Pointer; len: NativeUInt): Uint32; cdecl;
  SDL_memset: function(dst: Pointer; c: Integer; len: NativeUInt): Pointer; cdecl;
  SDL_memcpy: function(dst: Pointer; const src: Pointer; len: NativeUInt): Pointer; cdecl;
  SDL_memmove: function(dst: Pointer; const src: Pointer; len: NativeUInt): Pointer; cdecl;
  SDL_memcmp: function(const s1: Pointer; const s2: Pointer; len: NativeUInt): Integer; cdecl;
  SDL_wcslen: function(const wstr: PWideChar): NativeUInt; cdecl;
  SDL_wcslcpy: function(dst: PWideChar; const src: PWideChar; maxlen: NativeUInt): NativeUInt; cdecl;
  SDL_wcslcat: function(dst: PWideChar; const src: PWideChar; maxlen: NativeUInt): NativeUInt; cdecl;
  SDL_wcsdup: function(const wstr: PWideChar): PWideChar; cdecl;
  SDL_wcsstr: function(const haystack: PWideChar; const needle: PWideChar): PWideChar; cdecl;
  SDL_wcscmp: function(const str1: PWideChar; const str2: PWideChar): Integer; cdecl;
  SDL_wcsncmp: function(const str1: PWideChar; const str2: PWideChar; maxlen: NativeUInt): Integer; cdecl;
  SDL_wcscasecmp: function(const str1: PWideChar; const str2: PWideChar): Integer; cdecl;
  SDL_wcsncasecmp: function(const str1: PWideChar; const str2: PWideChar; len: NativeUInt): Integer; cdecl;
  SDL_strlen: function(const str: PUTF8Char): NativeUInt; cdecl;
  SDL_strlcpy: function(dst: PUTF8Char; const src: PUTF8Char; maxlen: NativeUInt): NativeUInt; cdecl;
  SDL_utf8strlcpy: function(dst: PUTF8Char; const src: PUTF8Char; dst_bytes: NativeUInt): NativeUInt; cdecl;
  SDL_strlcat: function(dst: PUTF8Char; const src: PUTF8Char; maxlen: NativeUInt): NativeUInt; cdecl;
  SDL_strdup: function(const str: PUTF8Char): PUTF8Char; cdecl;
  SDL_strrev: function(str: PUTF8Char): PUTF8Char; cdecl;
  SDL_strupr: function(str: PUTF8Char): PUTF8Char; cdecl;
  SDL_strlwr: function(str: PUTF8Char): PUTF8Char; cdecl;
  SDL_strchr: function(const str: PUTF8Char; c: Integer): PUTF8Char; cdecl;
  SDL_strrchr: function(const str: PUTF8Char; c: Integer): PUTF8Char; cdecl;
  SDL_strstr: function(const haystack: PUTF8Char; const needle: PUTF8Char): PUTF8Char; cdecl;
  SDL_strcasestr: function(const haystack: PUTF8Char; const needle: PUTF8Char): PUTF8Char; cdecl;
  SDL_strtokr: function(s1: PUTF8Char; const s2: PUTF8Char; saveptr: PPUTF8Char): PUTF8Char; cdecl;
  SDL_utf8strlen: function(const str: PUTF8Char): NativeUInt; cdecl;
  SDL_utf8strnlen: function(const str: PUTF8Char; bytes: NativeUInt): NativeUInt; cdecl;
  SDL_itoa: function(value: Integer; str: PUTF8Char; radix: Integer): PUTF8Char; cdecl;
  SDL_uitoa: function(value: Cardinal; str: PUTF8Char; radix: Integer): PUTF8Char; cdecl;
  SDL_ltoa: function(value: Integer; str: PUTF8Char; radix: Integer): PUTF8Char; cdecl;
  SDL_ultoa: function(value: Cardinal; str: PUTF8Char; radix: Integer): PUTF8Char; cdecl;
  SDL_lltoa: function(value: Sint64; str: PUTF8Char; radix: Integer): PUTF8Char; cdecl;
  SDL_ulltoa: function(value: Uint64; str: PUTF8Char; radix: Integer): PUTF8Char; cdecl;
  SDL_atoi: function(const str: PUTF8Char): Integer; cdecl;
  SDL_atof: function(const str: PUTF8Char): Double; cdecl;
  SDL_strtol: function(const str: PUTF8Char; endp: PPUTF8Char; base: Integer): Integer; cdecl;
  SDL_strtoul: function(const str: PUTF8Char; endp: PPUTF8Char; base: Integer): Cardinal; cdecl;
  SDL_strtoll: function(const str: PUTF8Char; endp: PPUTF8Char; base: Integer): Sint64; cdecl;
  SDL_strtoull: function(const str: PUTF8Char; endp: PPUTF8Char; base: Integer): Uint64; cdecl;
  SDL_strtod: function(const str: PUTF8Char; endp: PPUTF8Char): Double; cdecl;
  SDL_strcmp: function(const str1: PUTF8Char; const str2: PUTF8Char): Integer; cdecl;
  SDL_strncmp: function(const str1: PUTF8Char; const str2: PUTF8Char; maxlen: NativeUInt): Integer; cdecl;
  SDL_strcasecmp: function(const str1: PUTF8Char; const str2: PUTF8Char): Integer; cdecl;
  SDL_strncasecmp: function(const str1: PUTF8Char; const str2: PUTF8Char; len: NativeUInt): Integer; cdecl;
  SDL_sscanf: function(const text: PUTF8Char; const fmt: PUTF8Char): Integer varargs; cdecl;
  SDL_vsscanf: function(const text: PUTF8Char; const fmt: PUTF8Char; ap: Pointer): Integer; cdecl;
  SDL_snprintf: function(text: PUTF8Char; maxlen: NativeUInt; const fmt: PUTF8Char): Integer varargs; cdecl;
  SDL_vsnprintf: function(text: PUTF8Char; maxlen: NativeUInt; const fmt: PUTF8Char; ap: Pointer): Integer; cdecl;
  SDL_asprintf: function(strp: PPUTF8Char; const fmt: PUTF8Char): Integer varargs; cdecl;
  SDL_vasprintf: function(strp: PPUTF8Char; const fmt: PUTF8Char; ap: Pointer): Integer; cdecl;
  SDL_acos: function(x: Double): Double; cdecl;
  SDL_acosf: function(x: Single): Single; cdecl;
  SDL_asin: function(x: Double): Double; cdecl;
  SDL_asinf: function(x: Single): Single; cdecl;
  SDL_atan: function(x: Double): Double; cdecl;
  SDL_atanf: function(x: Single): Single; cdecl;
  SDL_atan2: function(y: Double; x: Double): Double; cdecl;
  SDL_atan2f: function(y: Single; x: Single): Single; cdecl;
  SDL_ceil: function(x: Double): Double; cdecl;
  SDL_ceilf: function(x: Single): Single; cdecl;
  SDL_copysign: function(x: Double; y: Double): Double; cdecl;
  SDL_copysignf: function(x: Single; y: Single): Single; cdecl;
  SDL_cos: function(x: Double): Double; cdecl;
  SDL_cosf: function(x: Single): Single; cdecl;
  SDL_exp: function(x: Double): Double; cdecl;
  SDL_expf: function(x: Single): Single; cdecl;
  SDL_fabs: function(x: Double): Double; cdecl;
  SDL_fabsf: function(x: Single): Single; cdecl;
  SDL_floor: function(x: Double): Double; cdecl;
  SDL_floorf: function(x: Single): Single; cdecl;
  SDL_trunc: function(x: Double): Double; cdecl;
  SDL_truncf: function(x: Single): Single; cdecl;
  SDL_fmod: function(x: Double; y: Double): Double; cdecl;
  SDL_fmodf: function(x: Single; y: Single): Single; cdecl;
  SDL_log: function(x: Double): Double; cdecl;
  SDL_logf: function(x: Single): Single; cdecl;
  SDL_log10: function(x: Double): Double; cdecl;
  SDL_log10f: function(x: Single): Single; cdecl;
  SDL_pow: function(x: Double; y: Double): Double; cdecl;
  SDL_powf: function(x: Single; y: Single): Single; cdecl;
  SDL_round: function(x: Double): Double; cdecl;
  SDL_roundf: function(x: Single): Single; cdecl;
  SDL_lround: function(x: Double): Integer; cdecl;
  SDL_lroundf: function(x: Single): Integer; cdecl;
  SDL_scalbn: function(x: Double; n: Integer): Double; cdecl;
  SDL_scalbnf: function(x: Single; n: Integer): Single; cdecl;
  SDL_sin: function(x: Double): Double; cdecl;
  SDL_sinf: function(x: Single): Single; cdecl;
  SDL_sqrt: function(x: Double): Double; cdecl;
  SDL_sqrtf: function(x: Single): Single; cdecl;
  SDL_tan: function(x: Double): Double; cdecl;
  SDL_tanf: function(x: Single): Single; cdecl;
  SDL_iconv_open: function(const tocode: PUTF8Char; const fromcode: PUTF8Char): SDL_iconv_t; cdecl;
  SDL_iconv_close: function(cd: SDL_iconv_t): Integer; cdecl;
  SDL_iconv: function(cd: SDL_iconv_t; inbuf: PPUTF8Char; inbytesleft: PNativeUInt; outbuf: PPUTF8Char; outbytesleft: PNativeUInt): NativeUInt; cdecl;
  SDL_iconv_string: function(const tocode: PUTF8Char; const fromcode: PUTF8Char; const inbuf: PUTF8Char; inbytesleft: NativeUInt): PUTF8Char; cdecl;
  SDL_main: function(argc: Integer; argv: PPUTF8Char): Integer; cdecl;
  SDL_SetMainReady: procedure(); cdecl;
  SDL_RegisterApp: function(const name: PUTF8Char; style: Uint32; hInst: Pointer): Integer; cdecl;
  SDL_UnregisterApp: procedure(); cdecl;
  __debugbreak: procedure(); cdecl;
  SDL_ReportAssertion: function(p1: PSDL_AssertData; const p2: PUTF8Char; const p3: PUTF8Char; p4: Integer): SDL_AssertState; cdecl;
  SDL_SetAssertionHandler: procedure(handler: SDL_AssertionHandler; userdata: Pointer); cdecl;
  SDL_GetDefaultAssertionHandler: function(): SDL_AssertionHandler; cdecl;
  SDL_GetAssertionHandler: function(puserdata: PPointer): SDL_AssertionHandler; cdecl;
  SDL_GetAssertionReport: function(): PSDL_AssertData; cdecl;
  SDL_ResetAssertionReport: procedure(); cdecl;
  SDL_AtomicTryLock: function(lock: PSDL_SpinLock): SDL_bool; cdecl;
  SDL_AtomicLock: procedure(lock: PSDL_SpinLock); cdecl;
  SDL_AtomicUnlock: procedure(lock: PSDL_SpinLock); cdecl;
  SDL_MemoryBarrierReleaseFunction: procedure(); cdecl;
  SDL_MemoryBarrierAcquireFunction: procedure(); cdecl;
  SDL_AtomicCAS: function(a: PSDL_atomic_t; oldval: Integer; newval: Integer): SDL_bool; cdecl;
  SDL_AtomicSet: function(a: PSDL_atomic_t; v: Integer): Integer; cdecl;
  SDL_AtomicGet: function(a: PSDL_atomic_t): Integer; cdecl;
  SDL_AtomicAdd: function(a: PSDL_atomic_t; v: Integer): Integer; cdecl;
  SDL_AtomicCASPtr: function(a: PPointer; oldval: Pointer; newval: Pointer): SDL_bool; cdecl;
  SDL_AtomicSetPtr: function(a: PPointer; v: Pointer): Pointer; cdecl;
  SDL_AtomicGetPtr: function(a: PPointer): Pointer; cdecl;
  SDL_SetError: function(const fmt: PUTF8Char): Integer varargs; cdecl;
  SDL_GetError: function(): PUTF8Char; cdecl;
  SDL_GetErrorMsg: function(errstr: PUTF8Char; maxlen: Integer): PUTF8Char; cdecl;
  SDL_ClearError: procedure(); cdecl;
  SDL_Error: function(code: SDL_errorcode): Integer; cdecl;
  SDL_CreateMutex: function(): PSDL_mutex; cdecl;
  SDL_LockMutex: function(mutex: PSDL_mutex): Integer; cdecl;
  SDL_TryLockMutex: function(mutex: PSDL_mutex): Integer; cdecl;
  SDL_UnlockMutex: function(mutex: PSDL_mutex): Integer; cdecl;
  SDL_DestroyMutex: procedure(mutex: PSDL_mutex); cdecl;
  SDL_CreateSemaphore: function(initial_value: Uint32): PSDL_sem; cdecl;
  SDL_DestroySemaphore: procedure(sem: PSDL_sem); cdecl;
  SDL_SemWait: function(sem: PSDL_sem): Integer; cdecl;
  SDL_SemTryWait: function(sem: PSDL_sem): Integer; cdecl;
  SDL_SemWaitTimeout: function(sem: PSDL_sem; ms: Uint32): Integer; cdecl;
  SDL_SemPost: function(sem: PSDL_sem): Integer; cdecl;
  SDL_SemValue: function(sem: PSDL_sem): Uint32; cdecl;
  SDL_CreateCond: function(): PSDL_cond; cdecl;
  SDL_DestroyCond: procedure(cond: PSDL_cond); cdecl;
  SDL_CondSignal: function(cond: PSDL_cond): Integer; cdecl;
  SDL_CondBroadcast: function(cond: PSDL_cond): Integer; cdecl;
  SDL_CondWait: function(cond: PSDL_cond; mutex: PSDL_mutex): Integer; cdecl;
  SDL_CondWaitTimeout: function(cond: PSDL_cond; mutex: PSDL_mutex; ms: Uint32): Integer; cdecl;
  SDL_CreateThread: function(fn: SDL_ThreadFunction; const name: PUTF8Char; data: Pointer; pfnBeginThread: pfnSDL_CurrentBeginThread; pfnEndThread: pfnSDL_CurrentEndThread): PSDL_Thread; cdecl;
  SDL_CreateThreadWithStackSize: function(fn: SDL_ThreadFunction; const name: PUTF8Char; const stacksize: NativeUInt; data: Pointer; pfnBeginThread: pfnSDL_CurrentBeginThread; pfnEndThread: pfnSDL_CurrentEndThread): PSDL_Thread; cdecl;
  SDL_GetThreadName: function(thread: PSDL_Thread): PUTF8Char; cdecl;
  SDL_ThreadID: function(): SDL_threadID_; cdecl;
  SDL_GetThreadID: function(thread: PSDL_Thread): SDL_threadID_; cdecl;
  SDL_SetThreadPriority: function(priority: SDL_ThreadPriority): Integer; cdecl;
  SDL_WaitThread: procedure(thread: PSDL_Thread; status: PInteger); cdecl;
  SDL_DetachThread: procedure(thread: PSDL_Thread); cdecl;
  SDL_TLSCreate: function(): SDL_TLSID; cdecl;
  SDL_TLSGet: function(id: SDL_TLSID): Pointer; cdecl;

type
  SDL_TLSSet_destructor = procedure(p1: Pointer); cdecl;

var
  SDL_TLSSet: function(id: SDL_TLSID; const value: Pointer; destructor_: SDL_TLSSet_destructor): Integer; cdecl;
  SDL_TLSCleanup: procedure(); cdecl;
  SDL_RWFromFile: function(const file_: PUTF8Char; const mode: PUTF8Char): PSDL_RWops; cdecl;
  SDL_RWFromFP: function(fp: Pointer; autoclose: SDL_bool): PSDL_RWops; cdecl;
  SDL_RWFromMem: function(mem: Pointer; size: Integer): PSDL_RWops; cdecl;
  SDL_RWFromConstMem: function(const mem: Pointer; size: Integer): PSDL_RWops; cdecl;
  SDL_AllocRW: function(): PSDL_RWops; cdecl;
  SDL_FreeRW: procedure(area: PSDL_RWops); cdecl;
  SDL_RWsize: function(context: PSDL_RWops): Sint64; cdecl;
  SDL_RWseek: function(context: PSDL_RWops; offset: Sint64; whence: Integer): Sint64; cdecl;
  SDL_RWtell: function(context: PSDL_RWops): Sint64; cdecl;
  SDL_RWread: function(context: PSDL_RWops; ptr: Pointer; size: NativeUInt; maxnum: NativeUInt): NativeUInt; cdecl;
  SDL_RWwrite: function(context: PSDL_RWops; const ptr: Pointer; size: NativeUInt; num: NativeUInt): NativeUInt; cdecl;
  SDL_RWclose: function(context: PSDL_RWops): Integer; cdecl;
  SDL_LoadFile_RW: function(src: PSDL_RWops; datasize: PNativeUInt; freesrc: Integer): Pointer; cdecl;
  SDL_LoadFile: function(const file_: PUTF8Char; datasize: PNativeUInt): Pointer; cdecl;
  SDL_ReadU8: function(src: PSDL_RWops): Uint8; cdecl;
  SDL_ReadLE16: function(src: PSDL_RWops): Uint16; cdecl;
  SDL_ReadBE16: function(src: PSDL_RWops): Uint16; cdecl;
  SDL_ReadLE32: function(src: PSDL_RWops): Uint32; cdecl;
  SDL_ReadBE32: function(src: PSDL_RWops): Uint32; cdecl;
  SDL_ReadLE64: function(src: PSDL_RWops): Uint64; cdecl;
  SDL_ReadBE64: function(src: PSDL_RWops): Uint64; cdecl;
  SDL_WriteU8: function(dst: PSDL_RWops; value: Uint8): NativeUInt; cdecl;
  SDL_WriteLE16: function(dst: PSDL_RWops; value: Uint16): NativeUInt; cdecl;
  SDL_WriteBE16: function(dst: PSDL_RWops; value: Uint16): NativeUInt; cdecl;
  SDL_WriteLE32: function(dst: PSDL_RWops; value: Uint32): NativeUInt; cdecl;
  SDL_WriteBE32: function(dst: PSDL_RWops; value: Uint32): NativeUInt; cdecl;
  SDL_WriteLE64: function(dst: PSDL_RWops; value: Uint64): NativeUInt; cdecl;
  SDL_WriteBE64: function(dst: PSDL_RWops; value: Uint64): NativeUInt; cdecl;
  SDL_GetNumAudioDrivers: function(): Integer; cdecl;
  SDL_GetAudioDriver: function(index: Integer): PUTF8Char; cdecl;
  SDL_AudioInit: function(const driver_name: PUTF8Char): Integer; cdecl;
  SDL_AudioQuit: procedure(); cdecl;
  SDL_GetCurrentAudioDriver: function(): PUTF8Char; cdecl;
  SDL_OpenAudio: function(desired: PSDL_AudioSpec; obtained: PSDL_AudioSpec): Integer; cdecl;
  SDL_GetNumAudioDevices: function(iscapture: Integer): Integer; cdecl;
  SDL_GetAudioDeviceName: function(index: Integer; iscapture: Integer): PUTF8Char; cdecl;
  SDL_GetAudioDeviceSpec: function(index: Integer; iscapture: Integer; spec: PSDL_AudioSpec): Integer; cdecl;
  SDL_GetDefaultAudioInfo: function(name: PPUTF8Char; spec: PSDL_AudioSpec; iscapture: Integer): Integer; cdecl;
  SDL_OpenAudioDevice: function(const device: PUTF8Char; iscapture: Integer; const desired: PSDL_AudioSpec; obtained: PSDL_AudioSpec; allowed_changes: Integer): SDL_AudioDeviceID; cdecl;
  SDL_GetAudioStatus: function(): SDL_AudioStatus; cdecl;
  SDL_GetAudioDeviceStatus: function(dev: SDL_AudioDeviceID): SDL_AudioStatus; cdecl;
  SDL_PauseAudio: procedure(pause_on: Integer); cdecl;
  SDL_PauseAudioDevice: procedure(dev: SDL_AudioDeviceID; pause_on: Integer); cdecl;
  SDL_LoadWAV_RW: function(src: PSDL_RWops; freesrc: Integer; spec: PSDL_AudioSpec; audio_buf: PPUint8; audio_len: PUint32): PSDL_AudioSpec; cdecl;
  SDL_FreeWAV: procedure(audio_buf: PUint8); cdecl;
  SDL_BuildAudioCVT: function(cvt: PSDL_AudioCVT; src_format: SDL_AudioFormat; src_channels: Uint8; src_rate: Integer; dst_format: SDL_AudioFormat; dst_channels: Uint8; dst_rate: Integer): Integer; cdecl;
  SDL_ConvertAudio: function(cvt: PSDL_AudioCVT): Integer; cdecl;
  SDL_NewAudioStream: function(const src_format: SDL_AudioFormat; const src_channels: Uint8; const src_rate: Integer; const dst_format: SDL_AudioFormat; const dst_channels: Uint8; const dst_rate: Integer): PSDL_AudioStream; cdecl;
  SDL_AudioStreamPut: function(stream: PSDL_AudioStream; const buf: Pointer; len: Integer): Integer; cdecl;
  SDL_AudioStreamGet: function(stream: PSDL_AudioStream; buf: Pointer; len: Integer): Integer; cdecl;
  SDL_AudioStreamAvailable: function(stream: PSDL_AudioStream): Integer; cdecl;
  SDL_AudioStreamFlush: function(stream: PSDL_AudioStream): Integer; cdecl;
  SDL_AudioStreamClear: procedure(stream: PSDL_AudioStream); cdecl;
  SDL_FreeAudioStream: procedure(stream: PSDL_AudioStream); cdecl;
  SDL_MixAudio: procedure(dst: PUint8; const src: PUint8; len: Uint32; volume: Integer); cdecl;
  SDL_MixAudioFormat: procedure(dst: PUint8; const src: PUint8; format: SDL_AudioFormat; len: Uint32; volume: Integer); cdecl;
  SDL_QueueAudio: function(dev: SDL_AudioDeviceID; const data: Pointer; len: Uint32): Integer; cdecl;
  SDL_DequeueAudio: function(dev: SDL_AudioDeviceID; data: Pointer; len: Uint32): Uint32; cdecl;
  SDL_GetQueuedAudioSize: function(dev: SDL_AudioDeviceID): Uint32; cdecl;
  SDL_ClearQueuedAudio: procedure(dev: SDL_AudioDeviceID); cdecl;
  SDL_LockAudio: procedure(); cdecl;
  SDL_LockAudioDevice: procedure(dev: SDL_AudioDeviceID); cdecl;
  SDL_UnlockAudio: procedure(); cdecl;
  SDL_UnlockAudioDevice: procedure(dev: SDL_AudioDeviceID); cdecl;
  SDL_CloseAudio: procedure(); cdecl;
  SDL_CloseAudioDevice: procedure(dev: SDL_AudioDeviceID); cdecl;
  SDL_SetClipboardText: function(const text: PUTF8Char): Integer; cdecl;
  SDL_GetClipboardText: function(): PUTF8Char; cdecl;
  SDL_HasClipboardText: function(): SDL_bool; cdecl;
  SDL_SetPrimarySelectionText: function(const text: PUTF8Char): Integer; cdecl;
  SDL_GetPrimarySelectionText: function(): PUTF8Char; cdecl;
  SDL_HasPrimarySelectionText: function(): SDL_bool; cdecl;
  SDL_GetCPUCount: function(): Integer; cdecl;
  SDL_GetCPUCacheLineSize: function(): Integer; cdecl;
  SDL_HasRDTSC: function(): SDL_bool; cdecl;
  SDL_HasAltiVec: function(): SDL_bool; cdecl;
  SDL_HasMMX: function(): SDL_bool; cdecl;
  SDL_Has3DNow: function(): SDL_bool; cdecl;
  SDL_HasSSE: function(): SDL_bool; cdecl;
  SDL_HasSSE2: function(): SDL_bool; cdecl;
  SDL_HasSSE3: function(): SDL_bool; cdecl;
  SDL_HasSSE41: function(): SDL_bool; cdecl;
  SDL_HasSSE42: function(): SDL_bool; cdecl;
  SDL_HasAVX: function(): SDL_bool; cdecl;
  SDL_HasAVX2: function(): SDL_bool; cdecl;
  SDL_HasAVX512F: function(): SDL_bool; cdecl;
  SDL_HasARMSIMD: function(): SDL_bool; cdecl;
  SDL_HasNEON: function(): SDL_bool; cdecl;
  SDL_HasLSX: function(): SDL_bool; cdecl;
  SDL_HasLASX: function(): SDL_bool; cdecl;
  SDL_GetSystemRAM: function(): Integer; cdecl;
  SDL_SIMDGetAlignment: function(): NativeUInt; cdecl;
  SDL_SIMDAlloc: function(const len: NativeUInt): Pointer; cdecl;
  SDL_SIMDRealloc: function(mem: Pointer; const len: NativeUInt): Pointer; cdecl;
  SDL_SIMDFree: procedure(ptr: Pointer); cdecl;
  SDL_GetPixelFormatName: function(format: Uint32): PUTF8Char; cdecl;
  SDL_PixelFormatEnumToMasks: function(format: Uint32; bpp: PInteger; Rmask: PUint32; Gmask: PUint32; Bmask: PUint32; Amask: PUint32): SDL_bool; cdecl;
  SDL_MasksToPixelFormatEnum: function(bpp: Integer; Rmask: Uint32; Gmask: Uint32; Bmask: Uint32; Amask: Uint32): Uint32; cdecl;
  SDL_AllocFormat: function(pixel_format: Uint32): PSDL_PixelFormat; cdecl;
  SDL_FreeFormat: procedure(format: PSDL_PixelFormat); cdecl;
  SDL_AllocPalette: function(ncolors: Integer): PSDL_Palette; cdecl;
  SDL_SetPixelFormatPalette: function(format: PSDL_PixelFormat; palette: PSDL_Palette): Integer; cdecl;
  SDL_SetPaletteColors: function(palette: PSDL_Palette; const colors: PSDL_Color; firstcolor: Integer; ncolors: Integer): Integer; cdecl;
  SDL_FreePalette: procedure(palette: PSDL_Palette); cdecl;
  SDL_MapRGB: function(const format: PSDL_PixelFormat; r: Uint8; g: Uint8; b: Uint8): Uint32; cdecl;
  SDL_MapRGBA: function(const format: PSDL_PixelFormat; r: Uint8; g: Uint8; b: Uint8; a: Uint8): Uint32; cdecl;
  SDL_GetRGB: procedure(pixel: Uint32; const format: PSDL_PixelFormat; r: PUint8; g: PUint8; b: PUint8); cdecl;
  SDL_GetRGBA: procedure(pixel: Uint32; const format: PSDL_PixelFormat; r: PUint8; g: PUint8; b: PUint8; a: PUint8); cdecl;
  SDL_CalculateGammaRamp: procedure(gamma: Single; ramp: PUint16); cdecl;
  SDL_HasIntersection: function(const A: PSDL_Rect; const B: PSDL_Rect): SDL_bool; cdecl;
  SDL_IntersectRect: function(const A: PSDL_Rect; const B: PSDL_Rect; result: PSDL_Rect): SDL_bool; cdecl;
  SDL_UnionRect: procedure(const A: PSDL_Rect; const B: PSDL_Rect; result: PSDL_Rect); cdecl;
  SDL_EnclosePoints: function(const points: PSDL_Point; count: Integer; const clip: PSDL_Rect; result: PSDL_Rect): SDL_bool; cdecl;
  SDL_IntersectRectAndLine: function(const rect: PSDL_Rect; X1: PInteger; Y1: PInteger; X2: PInteger; Y2: PInteger): SDL_bool; cdecl;
  SDL_HasIntersectionF: function(const A: PSDL_FRect; const B: PSDL_FRect): SDL_bool; cdecl;
  SDL_IntersectFRect: function(const A: PSDL_FRect; const B: PSDL_FRect; result: PSDL_FRect): SDL_bool; cdecl;
  SDL_UnionFRect: procedure(const A: PSDL_FRect; const B: PSDL_FRect; result: PSDL_FRect); cdecl;
  SDL_EncloseFPoints: function(const points: PSDL_FPoint; count: Integer; const clip: PSDL_FRect; result: PSDL_FRect): SDL_bool; cdecl;
  SDL_IntersectFRectAndLine: function(const rect: PSDL_FRect; X1: PSingle; Y1: PSingle; X2: PSingle; Y2: PSingle): SDL_bool; cdecl;
  SDL_ComposeCustomBlendMode: function(srcColorFactor: SDL_BlendFactor; dstColorFactor: SDL_BlendFactor; colorOperation: SDL_BlendOperation; srcAlphaFactor: SDL_BlendFactor; dstAlphaFactor: SDL_BlendFactor; alphaOperation: SDL_BlendOperation): SDL_BlendMode; cdecl;
  SDL_CreateRGBSurface: function(flags: Uint32; width: Integer; height: Integer; depth: Integer; Rmask: Uint32; Gmask: Uint32; Bmask: Uint32; Amask: Uint32): PSDL_Surface; cdecl;
  SDL_CreateRGBSurfaceWithFormat: function(flags: Uint32; width: Integer; height: Integer; depth: Integer; format: Uint32): PSDL_Surface; cdecl;
  SDL_CreateRGBSurfaceFrom: function(pixels: Pointer; width: Integer; height: Integer; depth: Integer; pitch: Integer; Rmask: Uint32; Gmask: Uint32; Bmask: Uint32; Amask: Uint32): PSDL_Surface; cdecl;
  SDL_CreateRGBSurfaceWithFormatFrom: function(pixels: Pointer; width: Integer; height: Integer; depth: Integer; pitch: Integer; format: Uint32): PSDL_Surface; cdecl;
  SDL_FreeSurface: procedure(surface: PSDL_Surface); cdecl;
  SDL_SetSurfacePalette: function(surface: PSDL_Surface; palette: PSDL_Palette): Integer; cdecl;
  SDL_LockSurface: function(surface: PSDL_Surface): Integer; cdecl;
  SDL_UnlockSurface: procedure(surface: PSDL_Surface); cdecl;
  SDL_LoadBMP_RW: function(src: PSDL_RWops; freesrc: Integer): PSDL_Surface; cdecl;
  SDL_SaveBMP_RW: function(surface: PSDL_Surface; dst: PSDL_RWops; freedst: Integer): Integer; cdecl;
  SDL_SetSurfaceRLE: function(surface: PSDL_Surface; flag: Integer): Integer; cdecl;
  SDL_HasSurfaceRLE: function(surface: PSDL_Surface): SDL_bool; cdecl;
  SDL_SetColorKey: function(surface: PSDL_Surface; flag: Integer; key: Uint32): Integer; cdecl;
  SDL_HasColorKey: function(surface: PSDL_Surface): SDL_bool; cdecl;
  SDL_GetColorKey: function(surface: PSDL_Surface; key: PUint32): Integer; cdecl;
  SDL_SetSurfaceColorMod: function(surface: PSDL_Surface; r: Uint8; g: Uint8; b: Uint8): Integer; cdecl;
  SDL_GetSurfaceColorMod: function(surface: PSDL_Surface; r: PUint8; g: PUint8; b: PUint8): Integer; cdecl;
  SDL_SetSurfaceAlphaMod: function(surface: PSDL_Surface; alpha: Uint8): Integer; cdecl;
  SDL_GetSurfaceAlphaMod: function(surface: PSDL_Surface; alpha: PUint8): Integer; cdecl;
  SDL_SetSurfaceBlendMode: function(surface: PSDL_Surface; blendMode: SDL_BlendMode): Integer; cdecl;
  SDL_GetSurfaceBlendMode: function(surface: PSDL_Surface; blendMode: PSDL_BlendMode): Integer; cdecl;
  SDL_SetClipRect: function(surface: PSDL_Surface; const rect: PSDL_Rect): SDL_bool; cdecl;
  SDL_GetClipRect: procedure(surface: PSDL_Surface; rect: PSDL_Rect); cdecl;
  SDL_DuplicateSurface: function(surface: PSDL_Surface): PSDL_Surface; cdecl;
  SDL_ConvertSurface: function(src: PSDL_Surface; const fmt: PSDL_PixelFormat; flags: Uint32): PSDL_Surface; cdecl;
  SDL_ConvertSurfaceFormat: function(src: PSDL_Surface; pixel_format: Uint32; flags: Uint32): PSDL_Surface; cdecl;
  SDL_ConvertPixels: function(width: Integer; height: Integer; src_format: Uint32; const src: Pointer; src_pitch: Integer; dst_format: Uint32; dst: Pointer; dst_pitch: Integer): Integer; cdecl;
  SDL_PremultiplyAlpha: function(width: Integer; height: Integer; src_format: Uint32; const src: Pointer; src_pitch: Integer; dst_format: Uint32; dst: Pointer; dst_pitch: Integer): Integer; cdecl;
  SDL_FillRect: function(dst: PSDL_Surface; const rect: PSDL_Rect; color: Uint32): Integer; cdecl;
  SDL_FillRects: function(dst: PSDL_Surface; const rects: PSDL_Rect; count: Integer; color: Uint32): Integer; cdecl;
  SDL_UpperBlit: function(src: PSDL_Surface; const srcrect: PSDL_Rect; dst: PSDL_Surface; dstrect: PSDL_Rect): Integer; cdecl;
  SDL_LowerBlit: function(src: PSDL_Surface; srcrect: PSDL_Rect; dst: PSDL_Surface; dstrect: PSDL_Rect): Integer; cdecl;
  SDL_SoftStretch: function(src: PSDL_Surface; const srcrect: PSDL_Rect; dst: PSDL_Surface; const dstrect: PSDL_Rect): Integer; cdecl;
  SDL_SoftStretchLinear: function(src: PSDL_Surface; const srcrect: PSDL_Rect; dst: PSDL_Surface; const dstrect: PSDL_Rect): Integer; cdecl;
  SDL_UpperBlitScaled: function(src: PSDL_Surface; const srcrect: PSDL_Rect; dst: PSDL_Surface; dstrect: PSDL_Rect): Integer; cdecl;
  SDL_LowerBlitScaled: function(src: PSDL_Surface; srcrect: PSDL_Rect; dst: PSDL_Surface; dstrect: PSDL_Rect): Integer; cdecl;
  SDL_SetYUVConversionMode: procedure(mode: SDL_YUV_CONVERSION_MODE); cdecl;
  SDL_GetYUVConversionMode: function(): SDL_YUV_CONVERSION_MODE; cdecl;
  SDL_GetYUVConversionModeForResolution: function(width: Integer; height: Integer): SDL_YUV_CONVERSION_MODE; cdecl;
  SDL_GetNumVideoDrivers: function(): Integer; cdecl;
  SDL_GetVideoDriver: function(index: Integer): PUTF8Char; cdecl;
  SDL_VideoInit: function(const driver_name: PUTF8Char): Integer; cdecl;
  SDL_VideoQuit: procedure(); cdecl;
  SDL_GetCurrentVideoDriver: function(): PUTF8Char; cdecl;
  SDL_GetNumVideoDisplays: function(): Integer; cdecl;
  SDL_GetDisplayName: function(displayIndex: Integer): PUTF8Char; cdecl;
  SDL_GetDisplayBounds: function(displayIndex: Integer; rect: PSDL_Rect): Integer; cdecl;
  SDL_GetDisplayUsableBounds: function(displayIndex: Integer; rect: PSDL_Rect): Integer; cdecl;
  SDL_GetDisplayDPI: function(displayIndex: Integer; ddpi: PSingle; hdpi: PSingle; vdpi: PSingle): Integer; cdecl;
  SDL_GetDisplayOrientation: function(displayIndex: Integer): SDL_DisplayOrientation; cdecl;
  SDL_GetNumDisplayModes: function(displayIndex: Integer): Integer; cdecl;
  SDL_GetDisplayMode: function(displayIndex: Integer; modeIndex: Integer; mode: PSDL_DisplayMode): Integer; cdecl;
  SDL_GetDesktopDisplayMode: function(displayIndex: Integer; mode: PSDL_DisplayMode): Integer; cdecl;
  SDL_GetCurrentDisplayMode: function(displayIndex: Integer; mode: PSDL_DisplayMode): Integer; cdecl;
  SDL_GetClosestDisplayMode: function(displayIndex: Integer; const mode: PSDL_DisplayMode; closest: PSDL_DisplayMode): PSDL_DisplayMode; cdecl;
  SDL_GetPointDisplayIndex: function(const point: PSDL_Point): Integer; cdecl;
  SDL_GetRectDisplayIndex: function(const rect: PSDL_Rect): Integer; cdecl;
  SDL_GetWindowDisplayIndex: function(window: PSDL_Window): Integer; cdecl;
  SDL_SetWindowDisplayMode: function(window: PSDL_Window; const mode: PSDL_DisplayMode): Integer; cdecl;
  SDL_GetWindowDisplayMode: function(window: PSDL_Window; mode: PSDL_DisplayMode): Integer; cdecl;
  SDL_GetWindowICCProfile: function(window: PSDL_Window; size: PNativeUInt): Pointer; cdecl;
  SDL_GetWindowPixelFormat: function(window: PSDL_Window): Uint32; cdecl;
  SDL_CreateWindow: function(const title: PUTF8Char; x: Integer; y: Integer; w: Integer; h: Integer; flags: Uint32): PSDL_Window; cdecl;
  SDL_CreateWindowFrom: function(const data: Pointer): PSDL_Window; cdecl;
  SDL_GetWindowID: function(window: PSDL_Window): Uint32; cdecl;
  SDL_GetWindowFromID: function(id: Uint32): PSDL_Window; cdecl;
  SDL_GetWindowFlags: function(window: PSDL_Window): Uint32; cdecl;
  SDL_SetWindowTitle: procedure(window: PSDL_Window; const title: PUTF8Char); cdecl;
  SDL_GetWindowTitle: function(window: PSDL_Window): PUTF8Char; cdecl;
  SDL_SetWindowIcon: procedure(window: PSDL_Window; icon: PSDL_Surface); cdecl;
  SDL_SetWindowData: function(window: PSDL_Window; const name: PUTF8Char; userdata: Pointer): Pointer; cdecl;
  SDL_GetWindowData: function(window: PSDL_Window; const name: PUTF8Char): Pointer; cdecl;
  SDL_SetWindowPosition: procedure(window: PSDL_Window; x: Integer; y: Integer); cdecl;
  SDL_GetWindowPosition: procedure(window: PSDL_Window; x: PInteger; y: PInteger); cdecl;
  SDL_SetWindowSize: procedure(window: PSDL_Window; w: Integer; h: Integer); cdecl;
  SDL_GetWindowSize: procedure(window: PSDL_Window; w: PInteger; h: PInteger); cdecl;
  SDL_GetWindowBordersSize: function(window: PSDL_Window; top: PInteger; left: PInteger; bottom: PInteger; right: PInteger): Integer; cdecl;
  SDL_GetWindowSizeInPixels: procedure(window: PSDL_Window; w: PInteger; h: PInteger); cdecl;
  SDL_SetWindowMinimumSize: procedure(window: PSDL_Window; min_w: Integer; min_h: Integer); cdecl;
  SDL_GetWindowMinimumSize: procedure(window: PSDL_Window; w: PInteger; h: PInteger); cdecl;
  SDL_SetWindowMaximumSize: procedure(window: PSDL_Window; max_w: Integer; max_h: Integer); cdecl;
  SDL_GetWindowMaximumSize: procedure(window: PSDL_Window; w: PInteger; h: PInteger); cdecl;
  SDL_SetWindowBordered: procedure(window: PSDL_Window; bordered: SDL_bool); cdecl;
  SDL_SetWindowResizable: procedure(window: PSDL_Window; resizable: SDL_bool); cdecl;
  SDL_SetWindowAlwaysOnTop: procedure(window: PSDL_Window; on_top: SDL_bool); cdecl;
  SDL_ShowWindow: procedure(window: PSDL_Window); cdecl;
  SDL_HideWindow: procedure(window: PSDL_Window); cdecl;
  SDL_RaiseWindow: procedure(window: PSDL_Window); cdecl;
  SDL_MaximizeWindow: procedure(window: PSDL_Window); cdecl;
  SDL_MinimizeWindow: procedure(window: PSDL_Window); cdecl;
  SDL_RestoreWindow: procedure(window: PSDL_Window); cdecl;
  SDL_SetWindowFullscreen: function(window: PSDL_Window; flags: Uint32): Integer; cdecl;
  SDL_GetWindowSurface: function(window: PSDL_Window): PSDL_Surface; cdecl;
  SDL_UpdateWindowSurface: function(window: PSDL_Window): Integer; cdecl;
  SDL_UpdateWindowSurfaceRects: function(window: PSDL_Window; const rects: PSDL_Rect; numrects: Integer): Integer; cdecl;
  SDL_SetWindowGrab: procedure(window: PSDL_Window; grabbed: SDL_bool); cdecl;
  SDL_SetWindowKeyboardGrab: procedure(window: PSDL_Window; grabbed: SDL_bool); cdecl;
  SDL_SetWindowMouseGrab: procedure(window: PSDL_Window; grabbed: SDL_bool); cdecl;
  SDL_GetWindowGrab: function(window: PSDL_Window): SDL_bool; cdecl;
  SDL_GetWindowKeyboardGrab: function(window: PSDL_Window): SDL_bool; cdecl;
  SDL_GetWindowMouseGrab: function(window: PSDL_Window): SDL_bool; cdecl;
  SDL_GetGrabbedWindow: function(): PSDL_Window; cdecl;
  SDL_SetWindowMouseRect: function(window: PSDL_Window; const rect: PSDL_Rect): Integer; cdecl;
  SDL_GetWindowMouseRect: function(window: PSDL_Window): PSDL_Rect; cdecl;
  SDL_SetWindowBrightness: function(window: PSDL_Window; brightness: Single): Integer; cdecl;
  SDL_GetWindowBrightness: function(window: PSDL_Window): Single; cdecl;
  SDL_SetWindowOpacity: function(window: PSDL_Window; opacity: Single): Integer; cdecl;
  SDL_GetWindowOpacity: function(window: PSDL_Window; out_opacity: PSingle): Integer; cdecl;
  SDL_SetWindowModalFor: function(modal_window: PSDL_Window; parent_window: PSDL_Window): Integer; cdecl;
  SDL_SetWindowInputFocus: function(window: PSDL_Window): Integer; cdecl;
  SDL_SetWindowGammaRamp: function(window: PSDL_Window; const red: PUint16; const green: PUint16; const blue: PUint16): Integer; cdecl;
  SDL_GetWindowGammaRamp: function(window: PSDL_Window; red: PUint16; green: PUint16; blue: PUint16): Integer; cdecl;
  SDL_SetWindowHitTest: function(window: PSDL_Window; callback: SDL_HitTest; callback_data: Pointer): Integer; cdecl;
  SDL_FlashWindow: function(window: PSDL_Window; operation: SDL_FlashOperation): Integer; cdecl;
  SDL_DestroyWindow: procedure(window: PSDL_Window); cdecl;
  SDL_IsScreenSaverEnabled: function(): SDL_bool; cdecl;
  SDL_EnableScreenSaver: procedure(); cdecl;
  SDL_DisableScreenSaver: procedure(); cdecl;
  SDL_GL_LoadLibrary: function(const path: PUTF8Char): Integer; cdecl;
  SDL_GL_GetProcAddress: function(const proc: PUTF8Char): Pointer; cdecl;
  SDL_GL_UnloadLibrary: procedure(); cdecl;
  SDL_GL_ExtensionSupported: function(const extension: PUTF8Char): SDL_bool; cdecl;
  SDL_GL_ResetAttributes: procedure(); cdecl;
  SDL_GL_SetAttribute: function(attr: SDL_GLattr; value: Integer): Integer; cdecl;
  SDL_GL_GetAttribute: function(attr: SDL_GLattr; value: PInteger): Integer; cdecl;
  SDL_GL_CreateContext: function(window: PSDL_Window): SDL_GLContext; cdecl;
  SDL_GL_MakeCurrent: function(window: PSDL_Window; context: SDL_GLContext): Integer; cdecl;
  SDL_GL_GetCurrentWindow: function(): PSDL_Window; cdecl;
  SDL_GL_GetCurrentContext: function(): SDL_GLContext; cdecl;
  SDL_GL_GetDrawableSize: procedure(window: PSDL_Window; w: PInteger; h: PInteger); cdecl;
  SDL_GL_SetSwapInterval: function(interval: Integer): Integer; cdecl;
  SDL_GL_GetSwapInterval: function(): Integer; cdecl;
  SDL_GL_SwapWindow: procedure(window: PSDL_Window); cdecl;
  SDL_GL_DeleteContext: procedure(context: SDL_GLContext); cdecl;
  SDL_GetKeyboardFocus: function(): PSDL_Window; cdecl;
  SDL_GetKeyboardState: function(numkeys: PInteger): PUint8; cdecl;
  SDL_ResetKeyboard: procedure(); cdecl;
  SDL_GetModState: function(): SDL_Keymod; cdecl;
  SDL_SetModState: procedure(modstate: SDL_Keymod); cdecl;
  SDL_GetKeyFromScancode: function(scancode: SDL_Scancode): SDL_Keycode; cdecl;
  SDL_GetScancodeFromKey: function(key: SDL_Keycode): SDL_Scancode; cdecl;
  SDL_GetScancodeName: function(scancode: SDL_Scancode): PUTF8Char; cdecl;
  SDL_GetScancodeFromName: function(const name: PUTF8Char): SDL_Scancode; cdecl;
  SDL_GetKeyName: function(key: SDL_Keycode): PUTF8Char; cdecl;
  SDL_GetKeyFromName: function(const name: PUTF8Char): SDL_Keycode; cdecl;
  SDL_StartTextInput: procedure(); cdecl;
  SDL_IsTextInputActive: function(): SDL_bool; cdecl;
  SDL_StopTextInput: procedure(); cdecl;
  SDL_ClearComposition: procedure(); cdecl;
  SDL_IsTextInputShown: function(): SDL_bool; cdecl;
  SDL_SetTextInputRect: procedure(const rect: PSDL_Rect); cdecl;
  SDL_HasScreenKeyboardSupport: function(): SDL_bool; cdecl;
  SDL_IsScreenKeyboardShown: function(window: PSDL_Window): SDL_bool; cdecl;
  SDL_GetMouseFocus: function(): PSDL_Window; cdecl;
  SDL_GetMouseState: function(x: PInteger; y: PInteger): Uint32; cdecl;
  SDL_GetGlobalMouseState: function(x: PInteger; y: PInteger): Uint32; cdecl;
  SDL_GetRelativeMouseState: function(x: PInteger; y: PInteger): Uint32; cdecl;
  SDL_WarpMouseInWindow: procedure(window: PSDL_Window; x: Integer; y: Integer); cdecl;
  SDL_WarpMouseGlobal: function(x: Integer; y: Integer): Integer; cdecl;
  SDL_SetRelativeMouseMode: function(enabled: SDL_bool): Integer; cdecl;
  SDL_CaptureMouse: function(enabled: SDL_bool): Integer; cdecl;
  SDL_GetRelativeMouseMode: function(): SDL_bool; cdecl;
  SDL_CreateCursor: function(const data: PUint8; const mask: PUint8; w: Integer; h: Integer; hot_x: Integer; hot_y: Integer): PSDL_Cursor; cdecl;
  SDL_CreateColorCursor: function(surface: PSDL_Surface; hot_x: Integer; hot_y: Integer): PSDL_Cursor; cdecl;
  SDL_CreateSystemCursor: function(id: SDL_SystemCursor): PSDL_Cursor; cdecl;
  SDL_SetCursor: procedure(cursor: PSDL_Cursor); cdecl;
  SDL_GetCursor: function(): PSDL_Cursor; cdecl;
  SDL_GetDefaultCursor: function(): PSDL_Cursor; cdecl;
  SDL_FreeCursor: procedure(cursor: PSDL_Cursor); cdecl;
  SDL_ShowCursor: function(toggle: Integer): Integer; cdecl;
  SDL_GUIDToString: procedure(guid: SDL_GUID; pszGUID: PUTF8Char; cbGUID: Integer); cdecl;
  SDL_GUIDFromString: function(const pchGUID: PUTF8Char): SDL_GUID; cdecl;
  SDL_LockJoysticks: procedure(); cdecl;
  SDL_UnlockJoysticks: procedure(); cdecl;
  SDL_NumJoysticks: function(): Integer; cdecl;
  SDL_JoystickNameForIndex: function(device_index: Integer): PUTF8Char; cdecl;
  SDL_JoystickPathForIndex: function(device_index: Integer): PUTF8Char; cdecl;
  SDL_JoystickGetDevicePlayerIndex: function(device_index: Integer): Integer; cdecl;
  SDL_JoystickGetDeviceGUID: function(device_index: Integer): SDL_JoystickGUID; cdecl;
  SDL_JoystickGetDeviceVendor: function(device_index: Integer): Uint16; cdecl;
  SDL_JoystickGetDeviceProduct: function(device_index: Integer): Uint16; cdecl;
  SDL_JoystickGetDeviceProductVersion: function(device_index: Integer): Uint16; cdecl;
  SDL_JoystickGetDeviceType: function(device_index: Integer): SDL_JoystickType; cdecl;
  SDL_JoystickGetDeviceInstanceID: function(device_index: Integer): SDL_JoystickID; cdecl;
  SDL_JoystickOpen: function(device_index: Integer): PSDL_Joystick; cdecl;
  SDL_JoystickFromInstanceID: function(instance_id: SDL_JoystickID): PSDL_Joystick; cdecl;
  SDL_JoystickFromPlayerIndex: function(player_index: Integer): PSDL_Joystick; cdecl;
  SDL_JoystickAttachVirtual: function(type_: SDL_JoystickType; naxes: Integer; nbuttons: Integer; nhats: Integer): Integer; cdecl;
  SDL_JoystickAttachVirtualEx: function(const desc: PSDL_VirtualJoystickDesc): Integer; cdecl;
  SDL_JoystickDetachVirtual: function(device_index: Integer): Integer; cdecl;
  SDL_JoystickIsVirtual: function(device_index: Integer): SDL_bool; cdecl;
  SDL_JoystickSetVirtualAxis: function(joystick: PSDL_Joystick; axis: Integer; value: Sint16): Integer; cdecl;
  SDL_JoystickSetVirtualButton: function(joystick: PSDL_Joystick; button: Integer; value: Uint8): Integer; cdecl;
  SDL_JoystickSetVirtualHat: function(joystick: PSDL_Joystick; hat: Integer; value: Uint8): Integer; cdecl;
  SDL_JoystickName: function(joystick: PSDL_Joystick): PUTF8Char; cdecl;
  SDL_JoystickPath: function(joystick: PSDL_Joystick): PUTF8Char; cdecl;
  SDL_JoystickGetPlayerIndex: function(joystick: PSDL_Joystick): Integer; cdecl;
  SDL_JoystickSetPlayerIndex: procedure(joystick: PSDL_Joystick; player_index: Integer); cdecl;
  SDL_JoystickGetGUID: function(joystick: PSDL_Joystick): SDL_JoystickGUID; cdecl;
  SDL_JoystickGetVendor: function(joystick: PSDL_Joystick): Uint16; cdecl;
  SDL_JoystickGetProduct: function(joystick: PSDL_Joystick): Uint16; cdecl;
  SDL_JoystickGetProductVersion: function(joystick: PSDL_Joystick): Uint16; cdecl;
  SDL_JoystickGetFirmwareVersion: function(joystick: PSDL_Joystick): Uint16; cdecl;
  SDL_JoystickGetSerial: function(joystick: PSDL_Joystick): PUTF8Char; cdecl;
  SDL_JoystickGetType: function(joystick: PSDL_Joystick): SDL_JoystickType; cdecl;
  SDL_JoystickGetGUIDString: procedure(guid: SDL_JoystickGUID; pszGUID: PUTF8Char; cbGUID: Integer); cdecl;
  SDL_JoystickGetGUIDFromString: function(const pchGUID: PUTF8Char): SDL_JoystickGUID; cdecl;
  SDL_GetJoystickGUIDInfo: procedure(guid: SDL_JoystickGUID; vendor: PUint16; product: PUint16; version: PUint16; crc16: PUint16); cdecl;
  SDL_JoystickGetAttached: function(joystick: PSDL_Joystick): SDL_bool; cdecl;
  SDL_JoystickInstanceID: function(joystick: PSDL_Joystick): SDL_JoystickID; cdecl;
  SDL_JoystickNumAxes: function(joystick: PSDL_Joystick): Integer; cdecl;
  SDL_JoystickNumBalls: function(joystick: PSDL_Joystick): Integer; cdecl;
  SDL_JoystickNumHats: function(joystick: PSDL_Joystick): Integer; cdecl;
  SDL_JoystickNumButtons: function(joystick: PSDL_Joystick): Integer; cdecl;
  SDL_JoystickUpdate: procedure(); cdecl;
  SDL_JoystickEventState: function(state: Integer): Integer; cdecl;
  SDL_JoystickGetAxis: function(joystick: PSDL_Joystick; axis: Integer): Sint16; cdecl;
  SDL_JoystickGetAxisInitialState: function(joystick: PSDL_Joystick; axis: Integer; state: PSint16): SDL_bool; cdecl;
  SDL_JoystickGetHat: function(joystick: PSDL_Joystick; hat: Integer): Uint8; cdecl;
  SDL_JoystickGetBall: function(joystick: PSDL_Joystick; ball: Integer; dx: PInteger; dy: PInteger): Integer; cdecl;
  SDL_JoystickGetButton: function(joystick: PSDL_Joystick; button: Integer): Uint8; cdecl;
  SDL_JoystickRumble: function(joystick: PSDL_Joystick; low_frequency_rumble: Uint16; high_frequency_rumble: Uint16; duration_ms: Uint32): Integer; cdecl;
  SDL_JoystickRumbleTriggers: function(joystick: PSDL_Joystick; left_rumble: Uint16; right_rumble: Uint16; duration_ms: Uint32): Integer; cdecl;
  SDL_JoystickHasLED: function(joystick: PSDL_Joystick): SDL_bool; cdecl;
  SDL_JoystickHasRumble: function(joystick: PSDL_Joystick): SDL_bool; cdecl;
  SDL_JoystickHasRumbleTriggers: function(joystick: PSDL_Joystick): SDL_bool; cdecl;
  SDL_JoystickSetLED: function(joystick: PSDL_Joystick; red: Uint8; green: Uint8; blue: Uint8): Integer; cdecl;
  SDL_JoystickSendEffect: function(joystick: PSDL_Joystick; const data: Pointer; size: Integer): Integer; cdecl;
  SDL_JoystickClose: procedure(joystick: PSDL_Joystick); cdecl;
  SDL_JoystickCurrentPowerLevel: function(joystick: PSDL_Joystick): SDL_JoystickPowerLevel; cdecl;
  SDL_LockSensors: procedure(); cdecl;
  SDL_UnlockSensors: procedure(); cdecl;
  SDL_NumSensors: function(): Integer; cdecl;
  SDL_SensorGetDeviceName: function(device_index: Integer): PUTF8Char; cdecl;
  SDL_SensorGetDeviceType: function(device_index: Integer): SDL_SensorType; cdecl;
  SDL_SensorGetDeviceNonPortableType: function(device_index: Integer): Integer; cdecl;
  SDL_SensorGetDeviceInstanceID: function(device_index: Integer): SDL_SensorID; cdecl;
  SDL_SensorOpen: function(device_index: Integer): PSDL_Sensor; cdecl;
  SDL_SensorFromInstanceID: function(instance_id: SDL_SensorID): PSDL_Sensor; cdecl;
  SDL_SensorGetName: function(sensor: PSDL_Sensor): PUTF8Char; cdecl;
  SDL_SensorGetType: function(sensor: PSDL_Sensor): SDL_SensorType; cdecl;
  SDL_SensorGetNonPortableType: function(sensor: PSDL_Sensor): Integer; cdecl;
  SDL_SensorGetInstanceID: function(sensor: PSDL_Sensor): SDL_SensorID; cdecl;
  SDL_SensorGetData: function(sensor: PSDL_Sensor; data: PSingle; num_values: Integer): Integer; cdecl;
  SDL_SensorGetDataWithTimestamp: function(sensor: PSDL_Sensor; timestamp: PUint64; data: PSingle; num_values: Integer): Integer; cdecl;
  SDL_SensorClose: procedure(sensor: PSDL_Sensor); cdecl;
  SDL_SensorUpdate: procedure(); cdecl;
  SDL_GameControllerAddMappingsFromRW: function(rw: PSDL_RWops; freerw: Integer): Integer; cdecl;
  SDL_GameControllerAddMapping: function(const mappingString: PUTF8Char): Integer; cdecl;
  SDL_GameControllerNumMappings: function(): Integer; cdecl;
  SDL_GameControllerMappingForIndex: function(mapping_index: Integer): PUTF8Char; cdecl;
  SDL_GameControllerMappingForGUID: function(guid: SDL_JoystickGUID): PUTF8Char; cdecl;
  SDL_GameControllerMapping: function(gamecontroller: PSDL_GameController): PUTF8Char; cdecl;
  SDL_IsGameController: function(joystick_index: Integer): SDL_bool; cdecl;
  SDL_GameControllerNameForIndex: function(joystick_index: Integer): PUTF8Char; cdecl;
  SDL_GameControllerPathForIndex: function(joystick_index: Integer): PUTF8Char; cdecl;
  SDL_GameControllerTypeForIndex: function(joystick_index: Integer): SDL_GameControllerType; cdecl;
  SDL_GameControllerMappingForDeviceIndex: function(joystick_index: Integer): PUTF8Char; cdecl;
  SDL_GameControllerOpen: function(joystick_index: Integer): PSDL_GameController; cdecl;
  SDL_GameControllerFromInstanceID: function(joyid: SDL_JoystickID): PSDL_GameController; cdecl;
  SDL_GameControllerFromPlayerIndex: function(player_index: Integer): PSDL_GameController; cdecl;
  SDL_GameControllerName: function(gamecontroller: PSDL_GameController): PUTF8Char; cdecl;
  SDL_GameControllerPath: function(gamecontroller: PSDL_GameController): PUTF8Char; cdecl;
  SDL_GameControllerGetType: function(gamecontroller: PSDL_GameController): SDL_GameControllerType; cdecl;
  SDL_GameControllerGetPlayerIndex: function(gamecontroller: PSDL_GameController): Integer; cdecl;
  SDL_GameControllerSetPlayerIndex: procedure(gamecontroller: PSDL_GameController; player_index: Integer); cdecl;
  SDL_GameControllerGetVendor: function(gamecontroller: PSDL_GameController): Uint16; cdecl;
  SDL_GameControllerGetProduct: function(gamecontroller: PSDL_GameController): Uint16; cdecl;
  SDL_GameControllerGetProductVersion: function(gamecontroller: PSDL_GameController): Uint16; cdecl;
  SDL_GameControllerGetFirmwareVersion: function(gamecontroller: PSDL_GameController): Uint16; cdecl;
  SDL_GameControllerGetSerial: function(gamecontroller: PSDL_GameController): PUTF8Char; cdecl;
  SDL_GameControllerGetAttached: function(gamecontroller: PSDL_GameController): SDL_bool; cdecl;
  SDL_GameControllerGetJoystick: function(gamecontroller: PSDL_GameController): PSDL_Joystick; cdecl;
  SDL_GameControllerEventState: function(state: Integer): Integer; cdecl;
  SDL_GameControllerUpdate: procedure(); cdecl;
  SDL_GameControllerGetAxisFromString: function(const str: PUTF8Char): SDL_GameControllerAxis; cdecl;
  SDL_GameControllerGetStringForAxis: function(axis: SDL_GameControllerAxis): PUTF8Char; cdecl;
  SDL_GameControllerGetBindForAxis: function(gamecontroller: PSDL_GameController; axis: SDL_GameControllerAxis): SDL_GameControllerButtonBind; cdecl;
  SDL_GameControllerHasAxis: function(gamecontroller: PSDL_GameController; axis: SDL_GameControllerAxis): SDL_bool; cdecl;
  SDL_GameControllerGetAxis: function(gamecontroller: PSDL_GameController; axis: SDL_GameControllerAxis): Sint16; cdecl;
  SDL_GameControllerGetButtonFromString: function(const str: PUTF8Char): SDL_GameControllerButton; cdecl;
  SDL_GameControllerGetStringForButton: function(button: SDL_GameControllerButton): PUTF8Char; cdecl;
  SDL_GameControllerGetBindForButton: function(gamecontroller: PSDL_GameController; button: SDL_GameControllerButton): SDL_GameControllerButtonBind; cdecl;
  SDL_GameControllerHasButton: function(gamecontroller: PSDL_GameController; button: SDL_GameControllerButton): SDL_bool; cdecl;
  SDL_GameControllerGetButton: function(gamecontroller: PSDL_GameController; button: SDL_GameControllerButton): Uint8; cdecl;
  SDL_GameControllerGetNumTouchpads: function(gamecontroller: PSDL_GameController): Integer; cdecl;
  SDL_GameControllerGetNumTouchpadFingers: function(gamecontroller: PSDL_GameController; touchpad: Integer): Integer; cdecl;
  SDL_GameControllerGetTouchpadFinger: function(gamecontroller: PSDL_GameController; touchpad: Integer; finger: Integer; state: PUint8; x: PSingle; y: PSingle; pressure: PSingle): Integer; cdecl;
  SDL_GameControllerHasSensor: function(gamecontroller: PSDL_GameController; type_: SDL_SensorType): SDL_bool; cdecl;
  SDL_GameControllerSetSensorEnabled: function(gamecontroller: PSDL_GameController; type_: SDL_SensorType; enabled: SDL_bool): Integer; cdecl;
  SDL_GameControllerIsSensorEnabled: function(gamecontroller: PSDL_GameController; type_: SDL_SensorType): SDL_bool; cdecl;
  SDL_GameControllerGetSensorDataRate: function(gamecontroller: PSDL_GameController; type_: SDL_SensorType): Single; cdecl;
  SDL_GameControllerGetSensorData: function(gamecontroller: PSDL_GameController; type_: SDL_SensorType; data: PSingle; num_values: Integer): Integer; cdecl;
  SDL_GameControllerGetSensorDataWithTimestamp: function(gamecontroller: PSDL_GameController; type_: SDL_SensorType; timestamp: PUint64; data: PSingle; num_values: Integer): Integer; cdecl;
  SDL_GameControllerRumble: function(gamecontroller: PSDL_GameController; low_frequency_rumble: Uint16; high_frequency_rumble: Uint16; duration_ms: Uint32): Integer; cdecl;
  SDL_GameControllerRumbleTriggers: function(gamecontroller: PSDL_GameController; left_rumble: Uint16; right_rumble: Uint16; duration_ms: Uint32): Integer; cdecl;
  SDL_GameControllerHasLED: function(gamecontroller: PSDL_GameController): SDL_bool; cdecl;
  SDL_GameControllerHasRumble: function(gamecontroller: PSDL_GameController): SDL_bool; cdecl;
  SDL_GameControllerHasRumbleTriggers: function(gamecontroller: PSDL_GameController): SDL_bool; cdecl;
  SDL_GameControllerSetLED: function(gamecontroller: PSDL_GameController; red: Uint8; green: Uint8; blue: Uint8): Integer; cdecl;
  SDL_GameControllerSendEffect: function(gamecontroller: PSDL_GameController; const data: Pointer; size: Integer): Integer; cdecl;
  SDL_GameControllerClose: procedure(gamecontroller: PSDL_GameController); cdecl;
  SDL_GameControllerGetAppleSFSymbolsNameForButton: function(gamecontroller: PSDL_GameController; button: SDL_GameControllerButton): PUTF8Char; cdecl;
  SDL_GameControllerGetAppleSFSymbolsNameForAxis: function(gamecontroller: PSDL_GameController; axis: SDL_GameControllerAxis): PUTF8Char; cdecl;
  SDL_GetNumTouchDevices: function(): Integer; cdecl;
  SDL_GetTouchDevice: function(index: Integer): SDL_TouchID; cdecl;
  SDL_GetTouchName: function(index: Integer): PUTF8Char; cdecl;
  SDL_GetTouchDeviceType: function(touchID: SDL_TouchID): SDL_TouchDeviceType; cdecl;
  SDL_GetNumTouchFingers: function(touchID: SDL_TouchID): Integer; cdecl;
  SDL_GetTouchFinger: function(touchID: SDL_TouchID; index: Integer): PSDL_Finger; cdecl;
  SDL_RecordGesture: function(touchId: SDL_TouchID): Integer; cdecl;
  SDL_SaveAllDollarTemplates: function(dst: PSDL_RWops): Integer; cdecl;
  SDL_SaveDollarTemplate: function(gestureId: SDL_GestureID; dst: PSDL_RWops): Integer; cdecl;
  SDL_LoadDollarTemplates: function(touchId: SDL_TouchID; src: PSDL_RWops): Integer; cdecl;
  SDL_PumpEvents: procedure(); cdecl;
  SDL_PeepEvents: function(events: PSDL_Event; numevents: Integer; action: SDL_eventaction; minType: Uint32; maxType: Uint32): Integer; cdecl;
  SDL_HasEvent: function(type_: Uint32): SDL_bool; cdecl;
  SDL_HasEvents: function(minType: Uint32; maxType: Uint32): SDL_bool; cdecl;
  SDL_FlushEvent: procedure(type_: Uint32); cdecl;
  SDL_FlushEvents: procedure(minType: Uint32; maxType: Uint32); cdecl;
  SDL_PollEvent: function(event: PSDL_Event): Integer; cdecl;
  SDL_WaitEvent: function(event: PSDL_Event): Integer; cdecl;
  SDL_WaitEventTimeout: function(event: PSDL_Event; timeout: Integer): Integer; cdecl;
  SDL_PushEvent: function(event: PSDL_Event): Integer; cdecl;
  SDL_SetEventFilter: procedure(filter: SDL_EventFilter; userdata: Pointer); cdecl;
  SDL_GetEventFilter: function(filter: PSDL_EventFilter; userdata: PPointer): SDL_bool; cdecl;
  SDL_AddEventWatch: procedure(filter: SDL_EventFilter; userdata: Pointer); cdecl;
  SDL_DelEventWatch: procedure(filter: SDL_EventFilter; userdata: Pointer); cdecl;
  SDL_FilterEvents: procedure(filter: SDL_EventFilter; userdata: Pointer); cdecl;
  SDL_EventState: function(type_: Uint32; state: Integer): Uint8; cdecl;
  SDL_RegisterEvents: function(numevents: Integer): Uint32; cdecl;
  SDL_GetBasePath: function(): PUTF8Char; cdecl;
  SDL_GetPrefPath: function(const org: PUTF8Char; const app: PUTF8Char): PUTF8Char; cdecl;
  SDL_NumHaptics: function(): Integer; cdecl;
  SDL_HapticName: function(device_index: Integer): PUTF8Char; cdecl;
  SDL_HapticOpen: function(device_index: Integer): PSDL_Haptic; cdecl;
  SDL_HapticOpened: function(device_index: Integer): Integer; cdecl;
  SDL_HapticIndex: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_MouseIsHaptic: function(): Integer; cdecl;
  SDL_HapticOpenFromMouse: function(): PSDL_Haptic; cdecl;
  SDL_JoystickIsHaptic: function(joystick: PSDL_Joystick): Integer; cdecl;
  SDL_HapticOpenFromJoystick: function(joystick: PSDL_Joystick): PSDL_Haptic; cdecl;
  SDL_HapticClose: procedure(haptic: PSDL_Haptic); cdecl;
  SDL_HapticNumEffects: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticNumEffectsPlaying: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticQuery: function(haptic: PSDL_Haptic): Cardinal; cdecl;
  SDL_HapticNumAxes: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticEffectSupported: function(haptic: PSDL_Haptic; effect: PSDL_HapticEffect): Integer; cdecl;
  SDL_HapticNewEffect: function(haptic: PSDL_Haptic; effect: PSDL_HapticEffect): Integer; cdecl;
  SDL_HapticUpdateEffect: function(haptic: PSDL_Haptic; effect: Integer; data: PSDL_HapticEffect): Integer; cdecl;
  SDL_HapticRunEffect: function(haptic: PSDL_Haptic; effect: Integer; iterations: Uint32): Integer; cdecl;
  SDL_HapticStopEffect: function(haptic: PSDL_Haptic; effect: Integer): Integer; cdecl;
  SDL_HapticDestroyEffect: procedure(haptic: PSDL_Haptic; effect: Integer); cdecl;
  SDL_HapticGetEffectStatus: function(haptic: PSDL_Haptic; effect: Integer): Integer; cdecl;
  SDL_HapticSetGain: function(haptic: PSDL_Haptic; gain: Integer): Integer; cdecl;
  SDL_HapticSetAutocenter: function(haptic: PSDL_Haptic; autocenter: Integer): Integer; cdecl;
  SDL_HapticPause: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticUnpause: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticStopAll: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticRumbleSupported: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticRumbleInit: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_HapticRumblePlay: function(haptic: PSDL_Haptic; strength: Single; length: Uint32): Integer; cdecl;
  SDL_HapticRumbleStop: function(haptic: PSDL_Haptic): Integer; cdecl;
  SDL_hid_init: function(): Integer; cdecl;
  SDL_hid_exit: function(): Integer; cdecl;
  SDL_hid_device_change_count: function(): Uint32; cdecl;
  SDL_hid_enumerate: function(vendor_id: Word; product_id: Word): PSDL_hid_device_info; cdecl;
  SDL_hid_free_enumeration: procedure(devs: PSDL_hid_device_info); cdecl;
  SDL_hid_open: function(vendor_id: Word; product_id: Word; const serial_number: PWideChar): PSDL_hid_device; cdecl;
  SDL_hid_open_path: function(const path: PUTF8Char; bExclusive: Integer): PSDL_hid_device; cdecl;
  SDL_hid_write: function(dev: PSDL_hid_device; const data: PByte; length: NativeUInt): Integer; cdecl;
  SDL_hid_read_timeout: function(dev: PSDL_hid_device; data: PByte; length: NativeUInt; milliseconds: Integer): Integer; cdecl;
  SDL_hid_read: function(dev: PSDL_hid_device; data: PByte; length: NativeUInt): Integer; cdecl;
  SDL_hid_set_nonblocking: function(dev: PSDL_hid_device; nonblock: Integer): Integer; cdecl;
  SDL_hid_send_feature_report: function(dev: PSDL_hid_device; const data: PByte; length: NativeUInt): Integer; cdecl;
  SDL_hid_get_feature_report: function(dev: PSDL_hid_device; data: PByte; length: NativeUInt): Integer; cdecl;
  SDL_hid_close: procedure(dev: PSDL_hid_device); cdecl;
  SDL_hid_get_manufacturer_string: function(dev: PSDL_hid_device; string_: PWideChar; maxlen: NativeUInt): Integer; cdecl;
  SDL_hid_get_product_string: function(dev: PSDL_hid_device; string_: PWideChar; maxlen: NativeUInt): Integer; cdecl;
  SDL_hid_get_serial_number_string: function(dev: PSDL_hid_device; string_: PWideChar; maxlen: NativeUInt): Integer; cdecl;
  SDL_hid_get_indexed_string: function(dev: PSDL_hid_device; string_index: Integer; string_: PWideChar; maxlen: NativeUInt): Integer; cdecl;
  SDL_hid_ble_scan: procedure(active: SDL_bool); cdecl;
  SDL_SetHintWithPriority: function(const name: PUTF8Char; const value: PUTF8Char; priority: SDL_HintPriority): SDL_bool; cdecl;
  SDL_SetHint: function(const name: PUTF8Char; const value: PUTF8Char): SDL_bool; cdecl;
  SDL_ResetHint: function(const name: PUTF8Char): SDL_bool; cdecl;
  SDL_ResetHints: procedure(); cdecl;
  SDL_GetHint: function(const name: PUTF8Char): PUTF8Char; cdecl;
  SDL_GetHintBoolean: function(const name: PUTF8Char; default_value: SDL_bool): SDL_bool; cdecl;
  SDL_AddHintCallback: procedure(const name: PUTF8Char; callback: SDL_HintCallback; userdata: Pointer); cdecl;
  SDL_DelHintCallback: procedure(const name: PUTF8Char; callback: SDL_HintCallback; userdata: Pointer); cdecl;
  SDL_ClearHints: procedure(); cdecl;
  SDL_LoadObject: function(const sofile: PUTF8Char): Pointer; cdecl;
  SDL_LoadFunction: function(handle: Pointer; const name: PUTF8Char): Pointer; cdecl;
  SDL_UnloadObject: procedure(handle: Pointer); cdecl;
  SDL_LogSetAllPriority: procedure(priority: SDL_LogPriority); cdecl;
  SDL_LogSetPriority: procedure(category: Integer; priority: SDL_LogPriority); cdecl;
  SDL_LogGetPriority: function(category: Integer): SDL_LogPriority; cdecl;
  SDL_LogResetPriorities: procedure(); cdecl;
  SDL_Log_: procedure(const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogVerbose: procedure(category: Integer; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogDebug: procedure(category: Integer; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogInfo: procedure(category: Integer; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogWarn: procedure(category: Integer; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogError: procedure(category: Integer; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogCritical: procedure(category: Integer; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogMessage: procedure(category: Integer; priority: SDL_LogPriority; const fmt: PUTF8Char) varargs; cdecl;
  SDL_LogMessageV: procedure(category: Integer; priority: SDL_LogPriority; const fmt: PUTF8Char; ap: Pointer); cdecl;
  SDL_LogGetOutputFunction: procedure(callback: PSDL_LogOutputFunction; userdata: PPointer); cdecl;
  SDL_LogSetOutputFunction: procedure(callback: SDL_LogOutputFunction; userdata: Pointer); cdecl;
  SDL_ShowMessageBox: function(const messageboxdata: PSDL_MessageBoxData; buttonid: PInteger): Integer; cdecl;
  SDL_ShowSimpleMessageBox: function(flags: Uint32; const title: PUTF8Char; const message_: PUTF8Char; window: PSDL_Window): Integer; cdecl;
  SDL_Metal_CreateView: function(window: PSDL_Window): SDL_MetalView; cdecl;
  SDL_Metal_DestroyView: procedure(view: SDL_MetalView); cdecl;
  SDL_Metal_GetLayer: function(view: SDL_MetalView): Pointer; cdecl;
  SDL_Metal_GetDrawableSize: procedure(window: PSDL_Window; w: PInteger; h: PInteger); cdecl;
  SDL_GetPowerInfo: function(secs: PInteger; pct: PInteger): SDL_PowerState; cdecl;
  SDL_GetNumRenderDrivers: function(): Integer; cdecl;
  SDL_GetRenderDriverInfo: function(index: Integer; info: PSDL_RendererInfo): Integer; cdecl;
  SDL_CreateWindowAndRenderer: function(width: Integer; height: Integer; window_flags: Uint32; window: PPSDL_Window; renderer: PPSDL_Renderer): Integer; cdecl;
  SDL_CreateRenderer: function(window: PSDL_Window; index: Integer; flags: Uint32): PSDL_Renderer; cdecl;
  SDL_CreateSoftwareRenderer: function(surface: PSDL_Surface): PSDL_Renderer; cdecl;
  SDL_GetRenderer: function(window: PSDL_Window): PSDL_Renderer; cdecl;
  SDL_RenderGetWindow: function(renderer: PSDL_Renderer): PSDL_Window; cdecl;
  SDL_GetRendererInfo: function(renderer: PSDL_Renderer; info: PSDL_RendererInfo): Integer; cdecl;
  SDL_GetRendererOutputSize: function(renderer: PSDL_Renderer; w: PInteger; h: PInteger): Integer; cdecl;
  SDL_CreateTexture: function(renderer: PSDL_Renderer; format: Uint32; access: Integer; w: Integer; h: Integer): PSDL_Texture; cdecl;
  SDL_CreateTextureFromSurface: function(renderer: PSDL_Renderer; surface: PSDL_Surface): PSDL_Texture; cdecl;
  SDL_QueryTexture: function(texture: PSDL_Texture; format: PUint32; access: PInteger; w: PInteger; h: PInteger): Integer; cdecl;
  SDL_SetTextureColorMod: function(texture: PSDL_Texture; r: Uint8; g: Uint8; b: Uint8): Integer; cdecl;
  SDL_GetTextureColorMod: function(texture: PSDL_Texture; r: PUint8; g: PUint8; b: PUint8): Integer; cdecl;
  SDL_SetTextureAlphaMod: function(texture: PSDL_Texture; alpha: Uint8): Integer; cdecl;
  SDL_GetTextureAlphaMod: function(texture: PSDL_Texture; alpha: PUint8): Integer; cdecl;
  SDL_SetTextureBlendMode: function(texture: PSDL_Texture; blendMode: SDL_BlendMode): Integer; cdecl;
  SDL_GetTextureBlendMode: function(texture: PSDL_Texture; blendMode: PSDL_BlendMode): Integer; cdecl;
  SDL_SetTextureScaleMode: function(texture: PSDL_Texture; scaleMode: SDL_ScaleMode): Integer; cdecl;
  SDL_GetTextureScaleMode: function(texture: PSDL_Texture; scaleMode: PSDL_ScaleMode): Integer; cdecl;
  SDL_SetTextureUserData: function(texture: PSDL_Texture; userdata: Pointer): Integer; cdecl;
  SDL_GetTextureUserData: function(texture: PSDL_Texture): Pointer; cdecl;
  SDL_UpdateTexture: function(texture: PSDL_Texture; const rect: PSDL_Rect; const pixels: Pointer; pitch: Integer): Integer; cdecl;
  SDL_UpdateYUVTexture: function(texture: PSDL_Texture; const rect: PSDL_Rect; const Yplane: PUint8; Ypitch: Integer; const Uplane: PUint8; Upitch: Integer; const Vplane: PUint8; Vpitch: Integer): Integer; cdecl;
  SDL_UpdateNVTexture: function(texture: PSDL_Texture; const rect: PSDL_Rect; const Yplane: PUint8; Ypitch: Integer; const UVplane: PUint8; UVpitch: Integer): Integer; cdecl;
  SDL_LockTexture: function(texture: PSDL_Texture; const rect: PSDL_Rect; pixels: PPointer; pitch: PInteger): Integer; cdecl;
  SDL_LockTextureToSurface: function(texture: PSDL_Texture; const rect: PSDL_Rect; surface: PPSDL_Surface): Integer; cdecl;
  SDL_UnlockTexture: procedure(texture: PSDL_Texture); cdecl;
  SDL_RenderTargetSupported: function(renderer: PSDL_Renderer): SDL_bool; cdecl;
  SDL_SetRenderTarget: function(renderer: PSDL_Renderer; texture: PSDL_Texture): Integer; cdecl;
  SDL_GetRenderTarget: function(renderer: PSDL_Renderer): PSDL_Texture; cdecl;
  SDL_RenderSetLogicalSize: function(renderer: PSDL_Renderer; w: Integer; h: Integer): Integer; cdecl;
  SDL_RenderGetLogicalSize: procedure(renderer: PSDL_Renderer; w: PInteger; h: PInteger); cdecl;
  SDL_RenderSetIntegerScale: function(renderer: PSDL_Renderer; enable: SDL_bool): Integer; cdecl;
  SDL_RenderGetIntegerScale: function(renderer: PSDL_Renderer): SDL_bool; cdecl;
  SDL_RenderSetViewport: function(renderer: PSDL_Renderer; const rect: PSDL_Rect): Integer; cdecl;
  SDL_RenderGetViewport: procedure(renderer: PSDL_Renderer; rect: PSDL_Rect); cdecl;
  SDL_RenderSetClipRect: function(renderer: PSDL_Renderer; const rect: PSDL_Rect): Integer; cdecl;
  SDL_RenderGetClipRect: procedure(renderer: PSDL_Renderer; rect: PSDL_Rect); cdecl;
  SDL_RenderIsClipEnabled: function(renderer: PSDL_Renderer): SDL_bool; cdecl;
  SDL_RenderSetScale: function(renderer: PSDL_Renderer; scaleX: Single; scaleY: Single): Integer; cdecl;
  SDL_RenderGetScale: procedure(renderer: PSDL_Renderer; scaleX: PSingle; scaleY: PSingle); cdecl;
  SDL_RenderWindowToLogical: procedure(renderer: PSDL_Renderer; windowX: Integer; windowY: Integer; logicalX: PSingle; logicalY: PSingle); cdecl;
  SDL_RenderLogicalToWindow: procedure(renderer: PSDL_Renderer; logicalX: Single; logicalY: Single; windowX: PInteger; windowY: PInteger); cdecl;
  SDL_SetRenderDrawColor: function(renderer: PSDL_Renderer; r: Uint8; g: Uint8; b: Uint8; a: Uint8): Integer; cdecl;
  SDL_GetRenderDrawColor: function(renderer: PSDL_Renderer; r: PUint8; g: PUint8; b: PUint8; a: PUint8): Integer; cdecl;
  SDL_SetRenderDrawBlendMode: function(renderer: PSDL_Renderer; blendMode: SDL_BlendMode): Integer; cdecl;
  SDL_GetRenderDrawBlendMode: function(renderer: PSDL_Renderer; blendMode: PSDL_BlendMode): Integer; cdecl;
  SDL_RenderClear: function(renderer: PSDL_Renderer): Integer; cdecl;
  SDL_RenderDrawPoint: function(renderer: PSDL_Renderer; x: Integer; y: Integer): Integer; cdecl;
  SDL_RenderDrawPoints: function(renderer: PSDL_Renderer; const points: PSDL_Point; count: Integer): Integer; cdecl;
  SDL_RenderDrawLine: function(renderer: PSDL_Renderer; x1: Integer; y1: Integer; x2: Integer; y2: Integer): Integer; cdecl;
  SDL_RenderDrawLines: function(renderer: PSDL_Renderer; const points: PSDL_Point; count: Integer): Integer; cdecl;
  SDL_RenderDrawRect: function(renderer: PSDL_Renderer; const rect: PSDL_Rect): Integer; cdecl;
  SDL_RenderDrawRects: function(renderer: PSDL_Renderer; const rects: PSDL_Rect; count: Integer): Integer; cdecl;
  SDL_RenderFillRect: function(renderer: PSDL_Renderer; const rect: PSDL_Rect): Integer; cdecl;
  SDL_RenderFillRects: function(renderer: PSDL_Renderer; const rects: PSDL_Rect; count: Integer): Integer; cdecl;
  SDL_RenderCopy: function(renderer: PSDL_Renderer; texture: PSDL_Texture; const srcrect: PSDL_Rect; const dstrect: PSDL_Rect): Integer; cdecl;
  SDL_RenderCopyEx: function(renderer: PSDL_Renderer; texture: PSDL_Texture; const srcrect: PSDL_Rect; const dstrect: PSDL_Rect; const angle: Double; const center: PSDL_Point; const flip: SDL_RendererFlip): Integer; cdecl;
  SDL_RenderDrawPointF: function(renderer: PSDL_Renderer; x: Single; y: Single): Integer; cdecl;
  SDL_RenderDrawPointsF: function(renderer: PSDL_Renderer; const points: PSDL_FPoint; count: Integer): Integer; cdecl;
  SDL_RenderDrawLineF: function(renderer: PSDL_Renderer; x1: Single; y1: Single; x2: Single; y2: Single): Integer; cdecl;
  SDL_RenderDrawLinesF: function(renderer: PSDL_Renderer; const points: PSDL_FPoint; count: Integer): Integer; cdecl;
  SDL_RenderDrawRectF: function(renderer: PSDL_Renderer; const rect: PSDL_FRect): Integer; cdecl;
  SDL_RenderDrawRectsF: function(renderer: PSDL_Renderer; const rects: PSDL_FRect; count: Integer): Integer; cdecl;
  SDL_RenderFillRectF: function(renderer: PSDL_Renderer; const rect: PSDL_FRect): Integer; cdecl;
  SDL_RenderFillRectsF: function(renderer: PSDL_Renderer; const rects: PSDL_FRect; count: Integer): Integer; cdecl;
  SDL_RenderCopyF: function(renderer: PSDL_Renderer; texture: PSDL_Texture; const srcrect: PSDL_Rect; const dstrect: PSDL_FRect): Integer; cdecl;
  SDL_RenderCopyExF: function(renderer: PSDL_Renderer; texture: PSDL_Texture; const srcrect: PSDL_Rect; const dstrect: PSDL_FRect; const angle: Double; const center: PSDL_FPoint; const flip: SDL_RendererFlip): Integer; cdecl;
  SDL_RenderGeometry: function(renderer: PSDL_Renderer; texture: PSDL_Texture; const vertices: PSDL_Vertex; num_vertices: Integer; const indices: PInteger; num_indices: Integer): Integer; cdecl;
  SDL_RenderGeometryRaw: function(renderer: PSDL_Renderer; texture: PSDL_Texture; const xy: PSingle; xy_stride: Integer; const color: PSDL_Color; color_stride: Integer; const uv: PSingle; uv_stride: Integer; num_vertices: Integer; const indices: Pointer; num_indices: Integer; size_indices: Integer): Integer; cdecl;
  SDL_RenderReadPixels: function(renderer: PSDL_Renderer; const rect: PSDL_Rect; format: Uint32; pixels: Pointer; pitch: Integer): Integer; cdecl;
  SDL_RenderPresent: procedure(renderer: PSDL_Renderer); cdecl;
  SDL_DestroyTexture: procedure(texture: PSDL_Texture); cdecl;
  SDL_DestroyRenderer: procedure(renderer: PSDL_Renderer); cdecl;
  SDL_RenderFlush: function(renderer: PSDL_Renderer): Integer; cdecl;
  SDL_GL_BindTexture: function(texture: PSDL_Texture; texw: PSingle; texh: PSingle): Integer; cdecl;
  SDL_GL_UnbindTexture: function(texture: PSDL_Texture): Integer; cdecl;
  SDL_RenderGetMetalLayer: function(renderer: PSDL_Renderer): Pointer; cdecl;
  SDL_RenderGetMetalCommandEncoder: function(renderer: PSDL_Renderer): Pointer; cdecl;
  SDL_RenderSetVSync: function(renderer: PSDL_Renderer; vsync: Integer): Integer; cdecl;
  SDL_CreateShapedWindow: function(const title: PUTF8Char; x: Cardinal; y: Cardinal; w: Cardinal; h: Cardinal; flags: Uint32): PSDL_Window; cdecl;
  SDL_IsShapedWindow: function(const window: PSDL_Window): SDL_bool; cdecl;
  SDL_SetWindowShape: function(window: PSDL_Window; shape: PSDL_Surface; shape_mode: PSDL_WindowShapeMode): Integer; cdecl;
  SDL_GetShapedWindowMode: function(window: PSDL_Window; shape_mode: PSDL_WindowShapeMode): Integer; cdecl;
  SDL_SetWindowsMessageHook: procedure(callback: SDL_WindowsMessageHook; userdata: Pointer); cdecl;
  SDL_Direct3D9GetAdapterIndex: function(displayIndex: Integer): Integer; cdecl;
  SDL_RenderGetD3D9Device: function(renderer: PSDL_Renderer): PIDirect3DDevice9; cdecl;
  SDL_RenderGetD3D11Device: function(renderer: PSDL_Renderer): PID3D11Device; cdecl;
  SDL_RenderGetD3D12Device: function(renderer: PSDL_Renderer): PID3D12Device; cdecl;
  SDL_DXGIGetOutputInfo: function(displayIndex: Integer; adapterIndex: PInteger; outputIndex: PInteger): SDL_bool; cdecl;
  SDL_IsTablet: function(): SDL_bool; cdecl;
  SDL_OnApplicationWillTerminate: procedure(); cdecl;
  SDL_OnApplicationDidReceiveMemoryWarning: procedure(); cdecl;
  SDL_OnApplicationWillResignActive: procedure(); cdecl;
  SDL_OnApplicationDidEnterBackground: procedure(); cdecl;
  SDL_OnApplicationWillEnterForeground: procedure(); cdecl;
  SDL_OnApplicationDidBecomeActive: procedure(); cdecl;
  SDL_GetTicks: function(): Uint32; cdecl;
  SDL_GetTicks64: function(): Uint64; cdecl;
  SDL_GetPerformanceCounter: function(): Uint64; cdecl;
  SDL_GetPerformanceFrequency: function(): Uint64; cdecl;
  SDL_Delay: procedure(ms: Uint32); cdecl;
  SDL_AddTimer: function(interval: Uint32; callback: SDL_TimerCallback; param: Pointer): SDL_TimerID; cdecl;
  SDL_RemoveTimer: function(id: SDL_TimerID): SDL_bool; cdecl;
  SDL_GetVersion: procedure(ver: PSDL_version); cdecl;
  SDL_GetRevision: function(): PUTF8Char; cdecl;
  SDL_GetRevisionNumber: function(): Integer; cdecl;
  SDL_GetPreferredLocales: function(): PSDL_Locale; cdecl;
  SDL_OpenURL: function(const url: PUTF8Char): Integer; cdecl;
  SDL_Init: function(flags: Uint32): Integer; cdecl;
  SDL_InitSubSystem: function(flags: Uint32): Integer; cdecl;
  SDL_QuitSubSystem: procedure(flags: Uint32); cdecl;
  SDL_WasInit: function(flags: Uint32): Uint32; cdecl;
  SDL_Quit: procedure(); cdecl;
  IMG_Linked_Version: function(): PSDL_version; cdecl;
  IMG_Init: function(flags: Integer): Integer; cdecl;
  IMG_Quit: procedure(); cdecl;
  IMG_LoadTyped_RW: function(src: PSDL_RWops; freesrc: Integer; const type_: PUTF8Char): PSDL_Surface; cdecl;
  IMG_Load: function(const file_: PUTF8Char): PSDL_Surface; cdecl;
  IMG_Load_RW: function(src: PSDL_RWops; freesrc: Integer): PSDL_Surface; cdecl;
  IMG_LoadTexture: function(renderer: PSDL_Renderer; const file_: PUTF8Char): PSDL_Texture; cdecl;
  IMG_LoadTexture_RW: function(renderer: PSDL_Renderer; src: PSDL_RWops; freesrc: Integer): PSDL_Texture; cdecl;
  IMG_LoadTextureTyped_RW: function(renderer: PSDL_Renderer; src: PSDL_RWops; freesrc: Integer; const type_: PUTF8Char): PSDL_Texture; cdecl;
  IMG_isAVIF: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isICO: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isCUR: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isBMP: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isGIF: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isJPG: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isJXL: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isLBM: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isPCX: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isPNG: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isPNM: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isSVG: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isQOI: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isTIF: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isXCF: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isXPM: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isXV: function(src: PSDL_RWops): Integer; cdecl;
  IMG_isWEBP: function(src: PSDL_RWops): Integer; cdecl;
  IMG_LoadAVIF_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadICO_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadCUR_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadBMP_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadGIF_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadJPG_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadJXL_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadLBM_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadPCX_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadPNG_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadPNM_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadSVG_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadQOI_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadTGA_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadTIF_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadXCF_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadXPM_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadXV_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadWEBP_RW: function(src: PSDL_RWops): PSDL_Surface; cdecl;
  IMG_LoadSizedSVG_RW: function(src: PSDL_RWops; width: Integer; height: Integer): PSDL_Surface; cdecl;
  IMG_ReadXPMFromArray: function(xpm: PPUTF8Char): PSDL_Surface; cdecl;
  IMG_ReadXPMFromArrayToRGB888: function(xpm: PPUTF8Char): PSDL_Surface; cdecl;
  IMG_SavePNG: function(surface: PSDL_Surface; const file_: PUTF8Char): Integer; cdecl;
  IMG_SavePNG_RW: function(surface: PSDL_Surface; dst: PSDL_RWops; freedst: Integer): Integer; cdecl;
  IMG_SaveJPG: function(surface: PSDL_Surface; const file_: PUTF8Char; quality: Integer): Integer; cdecl;
  IMG_SaveJPG_RW: function(surface: PSDL_Surface; dst: PSDL_RWops; freedst: Integer; quality: Integer): Integer; cdecl;
  IMG_LoadAnimation: function(const file_: PUTF8Char): PIMG_Animation; cdecl;
  IMG_LoadAnimation_RW: function(src: PSDL_RWops; freesrc: Integer): PIMG_Animation; cdecl;
  IMG_LoadAnimationTyped_RW: function(src: PSDL_RWops; freesrc: Integer; const type_: PUTF8Char): PIMG_Animation; cdecl;
  IMG_FreeAnimation: procedure(anim: PIMG_Animation); cdecl;
  IMG_LoadGIFAnimation_RW: function(src: PSDL_RWops): PIMG_Animation; cdecl;
  IMG_LoadWEBPAnimation_RW: function(src: PSDL_RWops): PIMG_Animation; cdecl;
  Mix_Linked_Version: function(): PSDL_version; cdecl;
  Mix_Init: function(flags: Integer): Integer; cdecl;
  Mix_Quit: procedure(); cdecl;
  Mix_OpenAudio: function(frequency: Integer; format: Uint16; channels: Integer; chunksize: Integer): Integer; cdecl;
  Mix_OpenAudioDevice: function(frequency: Integer; format: Uint16; channels: Integer; chunksize: Integer; const device: PUTF8Char; allowed_changes: Integer): Integer; cdecl;
  Mix_PauseAudio: procedure(pause_on: Integer); cdecl;
  Mix_QuerySpec: function(frequency: PInteger; format: PUint16; channels: PInteger): Integer; cdecl;
  Mix_QuerySpecEx: function(out_spec: PSDL_AudioSpec): Integer; cdecl;
  Mix_AllocateChannels: function(numchans: Integer): Integer; cdecl;
  Mix_LoadWAV_RW: function(src: PSDL_RWops; freesrc: Integer): PMix_Chunk; cdecl;
  Mix_LoadWAV: function(const file_: PUTF8Char): PMix_Chunk; cdecl;
  Mix_LoadMUS: function(const file_: PUTF8Char): PMix_Music; cdecl;
  Mix_SetMusicFileName: procedure(music: PMix_Music; const file_: PUTF8Char); cdecl;
  Mix_LoadMUS_RW: function(src: PSDL_RWops; freesrc: Integer): PMix_Music; cdecl;
  Mix_LoadMUS_RW_ARG: function(src: PSDL_RWops; freesrc: Integer; const args: PUTF8Char): PMix_Music; cdecl;
  Mix_LoadMUS_RW_GME: function(src: PSDL_RWops; freesrc: Integer; trackID: Integer): PMix_Music; cdecl;
  Mix_LoadMUSType_RW: function(src: PSDL_RWops; type_: Mix_MusicType; freesrc: Integer): PMix_Music; cdecl;
  Mix_LoadMUSType_RW_ARG: function(src: PSDL_RWops; type_: Mix_MusicType; freesrc: Integer; const args: PUTF8Char): PMix_Music; cdecl;
  Mix_QuickLoad_WAV: function(mem: PUint8): PMix_Chunk; cdecl;
  Mix_QuickLoad_RAW: function(mem: PUint8; len: Uint32): PMix_Chunk; cdecl;
  Mix_FreeChunk: procedure(chunk: PMix_Chunk); cdecl;
  Mix_FreeMusic: procedure(music: PMix_Music); cdecl;
  Mix_SetFreeOnStop: function(music: PMix_Music; free_on_stop: Integer): Integer; cdecl;
  Mix_GetNumChunkDecoders: function(): Integer; cdecl;
  Mix_GetChunkDecoder: function(index: Integer): PUTF8Char; cdecl;
  Mix_HasChunkDecoder: function(const name: PUTF8Char): SDL_bool; cdecl;
  Mix_GetNumMusicDecoders: function(): Integer; cdecl;
  Mix_GetMusicDecoder: function(index: Integer): PUTF8Char; cdecl;
  Mix_HasMusicDecoder: function(const name: PUTF8Char): SDL_bool; cdecl;
  Mix_GetMusicType: function(const music: PMix_Music): Mix_MusicType; cdecl;
  Mix_GetMusicTitle: function(const music: PMix_Music): PUTF8Char; cdecl;
  Mix_GetMusicTitleTag: function(const music: PMix_Music): PUTF8Char; cdecl;
  Mix_GetMusicArtistTag: function(const music: PMix_Music): PUTF8Char; cdecl;
  Mix_GetMusicAlbumTag: function(const music: PMix_Music): PUTF8Char; cdecl;
  Mix_GetMusicCopyrightTag: function(const music: PMix_Music): PUTF8Char; cdecl;

type
  Mix_SetPostMix_mix_func = procedure(udata: Pointer; stream: PUint8; len: Integer); cdecl;

var
  Mix_SetPostMix: procedure(mix_func: Mix_SetPostMix_mix_func; arg: Pointer); cdecl;

type
  Mix_HookMusic_mix_func = procedure(udata: Pointer; stream: PUint8; len: Integer); cdecl;

var
  Mix_HookMusic: procedure(mix_func: Mix_HookMusic_mix_func; arg: Pointer); cdecl;

type
  Mix_HookMusicFinished_music_finished = procedure(); cdecl;

var
  Mix_HookMusicFinished: procedure(music_finished: Mix_HookMusicFinished_music_finished); cdecl;

type
  Mix_HookMusicStreamFinishedAny_music_finished = procedure(); cdecl;

var
  Mix_HookMusicStreamFinishedAny: procedure(music_finished: Mix_HookMusicStreamFinishedAny_music_finished); cdecl;

type
  Mix_HookMusicStreamFinished_music_finished = procedure(p1: PMix_Music; p2: Pointer); cdecl;

var
  Mix_HookMusicStreamFinished: procedure(music: PMix_Music; music_finished: Mix_HookMusicStreamFinished_music_finished; user_data: Pointer); cdecl;
  Mix_GetMusicHookData: function(): Pointer; cdecl;

type
  Mix_ChannelFinished_channel_finished = procedure(channel: Integer); cdecl;

var
  Mix_ChannelFinished: procedure(channel_finished: Mix_ChannelFinished_channel_finished); cdecl;
  Mix_RegisterEffect: function(chan: Integer; f: Mix_EffectFunc_t; d: Mix_EffectDone_t; arg: Pointer): Integer; cdecl;
  Mix_UnregisterEffect: function(channel: Integer; f: Mix_EffectFunc_t): Integer; cdecl;
  Mix_UnregisterAllEffects: function(channel: Integer): Integer; cdecl;
  Mix_RegisterMusicEffect: function(mus: PMix_Music; f: Mix_MusicEffectFunc_t; d: Mix_MusicEffectDone_t; arg: Pointer): Integer; cdecl;
  Mix_UnregisterMusicEffect: function(mus: PMix_Music; f: Mix_MusicEffectFunc_t): Integer; cdecl;
  Mix_UnregisterAllMusicEffects: function(mus: PMix_Music): Integer; cdecl;
  Mix_SetPanning: function(channel: Integer; left: Uint8; right: Uint8): Integer; cdecl;
  Mix_SetPosition: function(channel: Integer; angle: Sint16; distance: Uint8): Integer; cdecl;
  Mix_SetDistance: function(channel: Integer; distance: Uint8): Integer; cdecl;
  Mix_SetReverseStereo: function(channel: Integer; flip: Integer): Integer; cdecl;
  Mix_SetMusicEffectPanning: function(mus: PMix_Music; left: Uint8; right: Uint8): Integer; cdecl;
  Mix_SetMusicEffectPosition: function(mus: PMix_Music; angle: Sint16; distance: Uint8): Integer; cdecl;
  Mix_SetMusicEffectDistance: function(mus: PMix_Music; distance: Uint8): Integer; cdecl;
  Mix_SetMusicEffectReverseStereo: function(mus: PMix_Music; flip: Integer): Integer; cdecl;
  Mix_ReserveChannels: function(num: Integer): Integer; cdecl;
  Mix_GroupChannel: function(which: Integer; tag: Integer): Integer; cdecl;
  Mix_GroupChannels: function(from: Integer; to_: Integer; tag: Integer): Integer; cdecl;
  Mix_GroupAvailable: function(tag: Integer): Integer; cdecl;
  Mix_GroupCount: function(tag: Integer): Integer; cdecl;
  Mix_GroupOldest: function(tag: Integer): Integer; cdecl;
  Mix_GroupNewer: function(tag: Integer): Integer; cdecl;
  Mix_PlayChannel: function(channel: Integer; chunk: PMix_Chunk; loops: Integer): Integer; cdecl;
  Mix_PlayChannelTimed: function(channel: Integer; chunk: PMix_Chunk; loops: Integer; ticks: Integer): Integer; cdecl;
  Mix_PlayMusic: function(music: PMix_Music; loops: Integer): Integer; cdecl;
  Mix_PlayChannelTimedVolume: function(which: Integer; chunk: PMix_Chunk; loops: Integer; ticks: Integer; volume: Integer): Integer; cdecl;
  Mix_GetMusicMixer: function(): Mix_CommonMixer_t; cdecl;
  Mix_GetMultiMusicMixer: function(): Mix_CommonMixer_t; cdecl;
  Mix_GetGeneralMixer: function(): Mix_CommonMixer_t; cdecl;
  Mix_FadeInMusic: function(music: PMix_Music; loops: Integer; ms: Integer): Integer; cdecl;
  Mix_FadeInMusicPos: function(music: PMix_Music; loops: Integer; ms: Integer; position: Double): Integer; cdecl;
  Mix_FadeInChannel: function(channel: Integer; chunk: PMix_Chunk; loops: Integer; ms: Integer): Integer; cdecl;
  Mix_FadeInChannelTimed: function(channel: Integer; chunk: PMix_Chunk; loops: Integer; ms: Integer; ticks: Integer): Integer; cdecl;
  Mix_FadeInChannelVolume: function(channel: Integer; chunk: PMix_Chunk; loops: Integer; ms: Integer; volume: Integer): Integer; cdecl;
  Mix_FadeInChannelTimedVolume: function(which: Integer; chunk: PMix_Chunk; loops: Integer; ms: Integer; ticks: Integer; volume: Integer): Integer; cdecl;
  Mix_PlayMusicStream: function(music: PMix_Music; loops: Integer): Integer; cdecl;
  Mix_FadeInMusicStream: function(music: PMix_Music; loops: Integer; ms: Integer): Integer; cdecl;
  Mix_FadeInMusicStreamPos: function(music: PMix_Music; loops: Integer; ms: Integer; position: Double): Integer; cdecl;
  Mix_Volume: function(channel: Integer; volume: Integer): Integer; cdecl;
  Mix_VolumeChunk: function(chunk: PMix_Chunk; volume: Integer): Integer; cdecl;
  Mix_VolumeMusicStream: function(music: PMix_Music; volume: Integer): Integer; cdecl;
  Mix_VolumeMusic: function(volume: Integer): Integer; cdecl;
  Mix_GetMusicVolume: function(music: PMix_Music): Integer; cdecl;
  Mix_GetVolumeMusicStream: function(music: PMix_Music): Integer; cdecl;
  Mix_VolumeMusicGeneral: procedure(volume: Integer); cdecl;
  Mix_GetVolumeMusicGeneral: function(): Integer; cdecl;
  Mix_MasterVolume: function(volume: Integer): Integer; cdecl;
  Mix_HaltChannel: function(channel: Integer): Integer; cdecl;
  Mix_HaltGroup: function(tag: Integer): Integer; cdecl;
  Mix_HaltMusicStream: function(music: PMix_Music): Integer; cdecl;
  Mix_HaltMusic: function(): Integer; cdecl;
  Mix_ExpireChannel: function(channel: Integer; ticks: Integer): Integer; cdecl;
  Mix_FadeOutChannel: function(which: Integer; ms: Integer): Integer; cdecl;
  Mix_FadeOutGroup: function(tag: Integer; ms: Integer): Integer; cdecl;
  Mix_FadeOutMusicStream: function(music: PMix_Music; ms: Integer): Integer; cdecl;
  Mix_FadeOutMusic: function(ms: Integer): Integer; cdecl;
  Mix_CrossFadeMusicStream: function(old_music: PMix_Music; new_music: PMix_Music; loops: Integer; ms: Integer; free_old: Integer): Integer; cdecl;
  Mix_CrossFadeMusicStreamPos: function(old_music: PMix_Music; new_music: PMix_Music; loops: Integer; ms: Integer; pos: Double; free_old: Integer): Integer; cdecl;
  Mix_FadingMusicStream: function(music: PMix_Music): Mix_Fading; cdecl;
  Mix_FadingMusic: function(): Mix_Fading; cdecl;
  Mix_FadingChannel: function(which: Integer): Mix_Fading; cdecl;
  Mix_Pause: procedure(channel: Integer); cdecl;
  Mix_Resume: procedure(channel: Integer); cdecl;
  Mix_Paused: function(channel: Integer): Integer; cdecl;
  Mix_PauseMusicStream: procedure(music: PMix_Music); cdecl;
  Mix_ResumeMusicStream: procedure(music: PMix_Music); cdecl;
  Mix_RewindMusicStream: procedure(music: PMix_Music); cdecl;
  Mix_PausedMusicStream: function(music: PMix_Music): Integer; cdecl;
  Mix_PauseMusicStreamAll: procedure(); cdecl;
  Mix_ResumeMusicStreamAll: procedure(); cdecl;
  Mix_PauseMusic: procedure(); cdecl;
  Mix_ResumeMusic: procedure(); cdecl;
  Mix_RewindMusic: procedure(); cdecl;
  Mix_PausedMusic: function(): Integer; cdecl;
  Mix_ModMusicJumpToOrder: function(order: Integer): Integer; cdecl;
  Mix_ModMusicStreamJumpToOrder: function(music: PMix_Music; order: Integer): Integer; cdecl;
  Mix_StartTrack: function(music: PMix_Music; track: Integer): Integer; cdecl;
  Mix_GetNumTracks: function(music: PMix_Music): Integer; cdecl;
  Mix_SetMusicPositionStream: function(music: PMix_Music; position: Double): Integer; cdecl;
  Mix_SetMusicStreamPosition: function(music: PMix_Music; position: Double): Integer; cdecl;
  Mix_SetMusicPosition: function(position: Double): Integer; cdecl;
  Mix_GetMusicPosition: function(music: PMix_Music): Double; cdecl;
  Mix_MusicDuration: function(music: PMix_Music): Double; cdecl;
  Mix_GetMusicTotalTime: function(music: PMix_Music): Double; cdecl;
  Mix_SetMusicTempo: function(music: PMix_Music; tempo: Double): Integer; cdecl;
  Mix_GetMusicTempo: function(music: PMix_Music): Double; cdecl;
  Mix_SetMusicSpeed: function(music: PMix_Music; speed: Double): Integer; cdecl;
  Mix_GetMusicSpeed: function(music: PMix_Music): Double; cdecl;
  Mix_SetMusicPitch: function(music: PMix_Music; pitch: Double): Integer; cdecl;
  Mix_GetMusicPitch: function(music: PMix_Music): Double; cdecl;
  Mix_GetMusicTracks: function(music: PMix_Music): Integer; cdecl;
  Mix_SetMusicTrackMute: function(music: PMix_Music; track: Integer; mute: Integer): Integer; cdecl;
  Mix_GetMusicLoopStartTime: function(music: PMix_Music): Double; cdecl;
  Mix_GetMusicLoopEndTime: function(music: PMix_Music): Double; cdecl;
  Mix_GetMusicLoopLengthTime: function(music: PMix_Music): Double; cdecl;
  Mix_Playing: function(channel: Integer): Integer; cdecl;
  Mix_PlayingMusicStream: function(music: PMix_Music): Integer; cdecl;
  Mix_PlayingMusic: function(): Integer; cdecl;
  Mix_SetMusicCMD: function(const command: PUTF8Char): Integer; cdecl;
  Mix_SetSynchroValue: function(value: Integer): Integer; cdecl;
  Mix_GetSynchroValue: function(): Integer; cdecl;
  Mix_SetSoundFonts: function(const paths: PUTF8Char): Integer; cdecl;
  Mix_GetSoundFonts: function(): PUTF8Char; cdecl;

type
  Mix_EachSoundFont_function = function(const p1: PUTF8Char; p2: Pointer): Integer; cdecl;

var
  Mix_EachSoundFont: function(function_: Mix_EachSoundFont_function; data: Pointer): Integer; cdecl;

type
  Mix_EachSoundFontEx_function = function(const p1: PUTF8Char; p2: Pointer): Integer; cdecl;

var
  Mix_EachSoundFontEx: function(const cpaths: PUTF8Char; function_: Mix_EachSoundFontEx_function; data: Pointer): Integer; cdecl;
  Mix_SetTimidityCfg: function(const path: PUTF8Char): Integer; cdecl;
  Mix_GetTimidityCfg: function(): PUTF8Char; cdecl;
  Mix_GetChunk: function(channel: Integer): PMix_Chunk; cdecl;
  Mix_InitMixer: function(const spec: PSDL_AudioSpec; skip_init_check: SDL_bool): Integer; cdecl;
  Mix_FreeMixer: procedure(); cdecl;
  Mix_CloseAudio: procedure(); cdecl;
  Mix_ADLMIDI_getTotalBanks: function(): Integer; cdecl;
  Mix_ADLMIDI_getBankNames: function(): PPUTF8Char; cdecl;
  Mix_ADLMIDI_getBankID: function(): Integer; cdecl;
  Mix_ADLMIDI_setBankID: procedure(bnk: Integer); cdecl;
  Mix_ADLMIDI_getTremolo: function(): Integer; cdecl;
  Mix_ADLMIDI_setTremolo: procedure(tr: Integer); cdecl;
  Mix_ADLMIDI_getVibrato: function(): Integer; cdecl;
  Mix_ADLMIDI_setVibrato: procedure(vib: Integer); cdecl;
  Mix_ADLMIDI_getScaleMod: function(): Integer; cdecl;
  Mix_ADLMIDI_setScaleMod: procedure(sc: Integer); cdecl;
  Mix_ADLMIDI_getAdLibMode: function(): Integer; cdecl;
  Mix_ADLMIDI_setAdLibMode: procedure(tr: Integer); cdecl;
  Mix_ADLMIDI_getLogarithmicVolumes: function(): Integer; cdecl;
  Mix_ADLMIDI_setLogarithmicVolumes: procedure(lv: Integer); cdecl;
  Mix_ADLMIDI_getVolumeModel: function(): Integer; cdecl;
  Mix_ADLMIDI_setVolumeModel: procedure(vm: Integer); cdecl;
  Mix_ADLMIDI_getFullRangeBrightness: function(): Integer; cdecl;
  Mix_ADLMIDI_setFullRangeBrightness: procedure(frb: Integer); cdecl;
  Mix_ADLMIDI_getAutoArpeggio: function(): Integer; cdecl;
  Mix_ADLMIDI_setAutoArpeggio: procedure(aa_en: Integer); cdecl;
  Mix_ADLMIDI_getChannelAllocMode: function(): Integer; cdecl;
  Mix_ADLMIDI_setChannelAllocMode: procedure(ch_alloc: Integer); cdecl;
  Mix_ADLMIDI_getFullPanStereo: function(): Integer; cdecl;
  Mix_ADLMIDI_setFullPanStereo: procedure(fp: Integer); cdecl;
  Mix_ADLMIDI_getEmulator: function(): Integer; cdecl;
  Mix_ADLMIDI_setEmulator: procedure(emu: Integer); cdecl;
  Mix_ADLMIDI_getChipsCount: function(): Integer; cdecl;
  Mix_ADLMIDI_setChipsCount: procedure(chips: Integer); cdecl;
  Mix_ADLMIDI_setSetDefaults: procedure(); cdecl;
  Mix_ADLMIDI_setCustomBankFile: procedure(const bank_wonl_path: PUTF8Char); cdecl;
  Mix_OPNMIDI_setSetDefaults: procedure(); cdecl;
  Mix_OPNMIDI_getVolumeModel: function(): Integer; cdecl;
  Mix_OPNMIDI_setVolumeModel: procedure(vm: Integer); cdecl;
  Mix_OPNMIDI_getFullRangeBrightness: function(): Integer; cdecl;
  Mix_OPNMIDI_setFullRangeBrightness: procedure(frb: Integer); cdecl;
  Mix_OPNMIDI_getAutoArpeggio: function(): Integer; cdecl;
  Mix_OPNMIDI_setAutoArpeggio: procedure(aa_en: Integer); cdecl;
  Mix_OPNMIDI_getChannelAllocMode: function(): Integer; cdecl;
  Mix_OPNMIDI_setChannelAllocMode: procedure(ch_alloc: Integer); cdecl;
  Mix_OPNMIDI_getFullPanStereo: function(): Integer; cdecl;
  Mix_OPNMIDI_setFullPanStereo: procedure(fp: Integer); cdecl;
  Mix_OPNMIDI_getEmulator: function(): Integer; cdecl;
  Mix_OPNMIDI_setEmulator: procedure(emu: Integer); cdecl;
  Mix_OPNMIDI_getChipsCount: function(): Integer; cdecl;
  Mix_OPNMIDI_setChipsCount: procedure(chips: Integer); cdecl;
  Mix_OPNMIDI_setCustomBankFile: procedure(const bank_wonp_path: PUTF8Char); cdecl;
  Mix_GME_SetSpcEchoDisabled: procedure(music: PMix_Music; disabled: Integer); cdecl;
  Mix_GME_GetSpcEchoDisabled: function(music: PMix_Music): Integer; cdecl;
  Mix_GetMidiPlayer: function(): Integer; cdecl;
  Mix_GetNextMidiPlayer: function(): Integer; cdecl;
  Mix_SetMidiPlayer: function(player: Integer): Integer; cdecl;
  Mix_SetLockMIDIArgs: procedure(lock_midiargs: Integer); cdecl;
  Mix_Timidity_addToPathList: procedure(const path: PUTF8Char); cdecl;
  Mix_GetMidiDevice: function(): Integer; cdecl;
  Mix_GetNextMidiDevice: function(): Integer; cdecl;
  Mix_SetMidiDevice: function(player: Integer): Integer; cdecl;
  SDLNet_Linked_Version: function(): PSDLNet_version; cdecl;
  SDLNet_Init: function(): Integer; cdecl;
  SDLNet_Quit: procedure(); cdecl;
  SDLNet_ResolveHost: function(address: PIPaddress; const host: PUTF8Char; port: Uint16): Integer; cdecl;
  SDLNet_ResolveIP: function(const ip: PIPaddress): PUTF8Char; cdecl;
  SDLNet_GetLocalAddresses: function(addresses: PIPaddress; maxcount: Integer): Integer; cdecl;
  SDLNet_TCP_Open: function(ip: PIPaddress): TCPsocket; cdecl;
  SDLNet_TCP_Accept: function(server: TCPsocket): TCPsocket; cdecl;
  SDLNet_TCP_GetPeerAddress: function(sock: TCPsocket): PIPaddress; cdecl;
  SDLNet_TCP_Send: function(sock: TCPsocket; const data: Pointer; len: Integer): Integer; cdecl;
  SDLNet_TCP_Recv: function(sock: TCPsocket; data: Pointer; maxlen: Integer): Integer; cdecl;
  SDLNet_TCP_Close: procedure(sock: TCPsocket); cdecl;
  SDLNet_AllocPacket: function(size: Integer): PUDPpacket; cdecl;
  SDLNet_ResizePacket: function(packet: PUDPpacket; newsize: Integer): Integer; cdecl;
  SDLNet_FreePacket: procedure(packet: PUDPpacket); cdecl;
  SDLNet_AllocPacketV: function(howmany: Integer; size: Integer): PPUDPpacket; cdecl;
  SDLNet_FreePacketV: procedure(packetV: PPUDPpacket); cdecl;
  SDLNet_UDP_Open: function(port: Uint16): UDPsocket; cdecl;
  SDLNet_UDP_SetPacketLoss: procedure(sock: UDPsocket; percent: Integer); cdecl;
  SDLNet_UDP_Bind: function(sock: UDPsocket; channel: Integer; const address: PIPaddress): Integer; cdecl;
  SDLNet_UDP_Unbind: procedure(sock: UDPsocket; channel: Integer); cdecl;
  SDLNet_UDP_GetPeerAddress: function(sock: UDPsocket; channel: Integer): PIPaddress; cdecl;
  SDLNet_UDP_SendV: function(sock: UDPsocket; packets: PPUDPpacket; npackets: Integer): Integer; cdecl;
  SDLNet_UDP_Send: function(sock: UDPsocket; channel: Integer; packet: PUDPpacket): Integer; cdecl;
  SDLNet_UDP_RecvV: function(sock: UDPsocket; packets: PPUDPpacket): Integer; cdecl;
  SDLNet_UDP_Recv: function(sock: UDPsocket; packet: PUDPpacket): Integer; cdecl;
  SDLNet_UDP_Close: procedure(sock: UDPsocket); cdecl;
  SDLNet_AllocSocketSet: function(maxsockets: Integer): SDLNet_SocketSet; cdecl;
  SDLNet_AddSocket: function(set_: SDLNet_SocketSet; sock: SDLNet_GenericSocket): Integer; cdecl;
  SDLNet_DelSocket: function(set_: SDLNet_SocketSet; sock: SDLNet_GenericSocket): Integer; cdecl;
  SDLNet_CheckSockets: function(set_: SDLNet_SocketSet; timeout: Uint32): Integer; cdecl;
  SDLNet_FreeSocketSet: procedure(set_: SDLNet_SocketSet); cdecl;
  SDLNet_SetError: procedure(const fmt: PUTF8Char) varargs; cdecl;
  SDLNet_GetError: function(): PUTF8Char; cdecl;
  stbtt_BakeFontBitmap: function(const data: PByte; offset: Integer; pixel_height: Single; pixels: PByte; pw: Integer; ph: Integer; first_char: Integer; num_chars: Integer; chardata: Pstbtt_bakedchar): Integer; cdecl;
  stbtt_GetBakedQuad: procedure(const chardata: Pstbtt_bakedchar; pw: Integer; ph: Integer; char_index: Integer; xpos: PSingle; ypos: PSingle; q: Pstbtt_aligned_quad; opengl_fillrule: Integer); cdecl;
  stbtt_GetScaledFontVMetrics: procedure(const fontdata: PByte; index: Integer; size: Single; ascent: PSingle; descent: PSingle; lineGap: PSingle); cdecl;
  stbtt_PackBegin: function(spc: Pstbtt_pack_context; pixels: PByte; width: Integer; height: Integer; stride_in_bytes: Integer; padding: Integer; alloc_context: Pointer): Integer; cdecl;
  stbtt_PackEnd: procedure(spc: Pstbtt_pack_context); cdecl;
  stbtt_PackFontRange: function(spc: Pstbtt_pack_context; const fontdata: PByte; font_index: Integer; font_size: Single; first_unicode_char_in_range: Integer; num_chars_in_range: Integer; chardata_for_range: Pstbtt_packedchar): Integer; cdecl;
  stbtt_PackFontRanges: function(spc: Pstbtt_pack_context; const fontdata: PByte; font_index: Integer; ranges: Pstbtt_pack_range; num_ranges: Integer): Integer; cdecl;
  stbtt_PackSetOversampling: procedure(spc: Pstbtt_pack_context; h_oversample: Cardinal; v_oversample: Cardinal); cdecl;
  stbtt_PackSetSkipMissingCodepoints: procedure(spc: Pstbtt_pack_context; skip: Integer); cdecl;
  stbtt_GetPackedQuad: procedure(const chardata: Pstbtt_packedchar; pw: Integer; ph: Integer; char_index: Integer; xpos: PSingle; ypos: PSingle; q: Pstbtt_aligned_quad; align_to_integer: Integer); cdecl;
  stbtt_PackFontRangesGatherRects: function(spc: Pstbtt_pack_context; const info: Pstbtt_fontinfo; ranges: Pstbtt_pack_range; num_ranges: Integer; rects: Pstbrp_rect): Integer; cdecl;
  stbtt_PackFontRangesPackRects: procedure(spc: Pstbtt_pack_context; rects: Pstbrp_rect; num_rects: Integer); cdecl;
  stbtt_PackFontRangesRenderIntoRects: function(spc: Pstbtt_pack_context; const info: Pstbtt_fontinfo; ranges: Pstbtt_pack_range; num_ranges: Integer; rects: Pstbrp_rect): Integer; cdecl;
  stbtt_GetNumberOfFonts: function(const data: PByte): Integer; cdecl;
  stbtt_GetFontOffsetForIndex: function(const data: PByte; index: Integer): Integer; cdecl;
  stbtt_InitFont: function(info: Pstbtt_fontinfo; const data: PByte; offset: Integer): Integer; cdecl;
  stbtt_FindGlyphIndex: function(const info: Pstbtt_fontinfo; unicode_codepoint: Integer): Integer; cdecl;
  stbtt_ScaleForPixelHeight: function(const info: Pstbtt_fontinfo; pixels: Single): Single; cdecl;
  stbtt_ScaleForMappingEmToPixels: function(const info: Pstbtt_fontinfo; pixels: Single): Single; cdecl;
  stbtt_GetFontVMetrics: procedure(const info: Pstbtt_fontinfo; ascent: PInteger; descent: PInteger; lineGap: PInteger); cdecl;
  stbtt_GetFontVMetricsOS2: function(const info: Pstbtt_fontinfo; typoAscent: PInteger; typoDescent: PInteger; typoLineGap: PInteger): Integer; cdecl;
  stbtt_GetFontBoundingBox: procedure(const info: Pstbtt_fontinfo; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger); cdecl;
  stbtt_GetCodepointHMetrics: procedure(const info: Pstbtt_fontinfo; codepoint: Integer; advanceWidth: PInteger; leftSideBearing: PInteger); cdecl;
  stbtt_GetCodepointKernAdvance: function(const info: Pstbtt_fontinfo; ch1: Integer; ch2: Integer): Integer; cdecl;
  stbtt_GetCodepointBox: function(const info: Pstbtt_fontinfo; codepoint: Integer; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger): Integer; cdecl;
  stbtt_GetGlyphHMetrics: procedure(const info: Pstbtt_fontinfo; glyph_index: Integer; advanceWidth: PInteger; leftSideBearing: PInteger); cdecl;
  stbtt_GetGlyphKernAdvance: function(const info: Pstbtt_fontinfo; glyph1: Integer; glyph2: Integer): Integer; cdecl;
  stbtt_GetGlyphBox: function(const info: Pstbtt_fontinfo; glyph_index: Integer; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger): Integer; cdecl;
  stbtt_GetKerningTableLength: function(const info: Pstbtt_fontinfo): Integer; cdecl;
  stbtt_GetKerningTable: function(const info: Pstbtt_fontinfo; table: Pstbtt_kerningentry; table_length: Integer): Integer; cdecl;
  stbtt_IsGlyphEmpty: function(const info: Pstbtt_fontinfo; glyph_index: Integer): Integer; cdecl;
  stbtt_GetCodepointShape: function(const info: Pstbtt_fontinfo; unicode_codepoint: Integer; vertices: PPstbtt_vertex): Integer; cdecl;
  stbtt_GetGlyphShape: function(const info: Pstbtt_fontinfo; glyph_index: Integer; vertices: PPstbtt_vertex): Integer; cdecl;
  stbtt_FreeShape: procedure(const info: Pstbtt_fontinfo; vertices: Pstbtt_vertex); cdecl;
  stbtt_FindSVGDoc: function(const info: Pstbtt_fontinfo; gl: Integer): PByte; cdecl;
  stbtt_GetCodepointSVG: function(const info: Pstbtt_fontinfo; unicode_codepoint: Integer; svg: PPUTF8Char): Integer; cdecl;
  stbtt_GetGlyphSVG: function(const info: Pstbtt_fontinfo; gl: Integer; svg: PPUTF8Char): Integer; cdecl;
  stbtt_FreeBitmap: procedure(bitmap: PByte; userdata: Pointer); cdecl;
  stbtt_GetCodepointBitmap: function(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; codepoint: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  stbtt_GetCodepointBitmapSubpixel: function(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; codepoint: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  stbtt_MakeCodepointBitmap: procedure(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; codepoint: Integer); cdecl;
  stbtt_MakeCodepointBitmapSubpixel: procedure(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; codepoint: Integer); cdecl;
  stbtt_MakeCodepointBitmapSubpixelPrefilter: procedure(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; oversample_x: Integer; oversample_y: Integer; sub_x: PSingle; sub_y: PSingle; codepoint: Integer); cdecl;
  stbtt_GetCodepointBitmapBox: procedure(const font: Pstbtt_fontinfo; codepoint: Integer; scale_x: Single; scale_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  stbtt_GetCodepointBitmapBoxSubpixel: procedure(const font: Pstbtt_fontinfo; codepoint: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  stbtt_GetGlyphBitmap: function(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; glyph: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  stbtt_GetGlyphBitmapSubpixel: function(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; glyph: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  stbtt_MakeGlyphBitmap: procedure(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; glyph: Integer); cdecl;
  stbtt_MakeGlyphBitmapSubpixel: procedure(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; glyph: Integer); cdecl;
  stbtt_MakeGlyphBitmapSubpixelPrefilter: procedure(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; oversample_x: Integer; oversample_y: Integer; sub_x: PSingle; sub_y: PSingle; glyph: Integer); cdecl;
  stbtt_GetGlyphBitmapBox: procedure(const font: Pstbtt_fontinfo; glyph: Integer; scale_x: Single; scale_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  stbtt_GetGlyphBitmapBoxSubpixel: procedure(const font: Pstbtt_fontinfo; glyph: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  stbtt_Rasterize: procedure(result: Pstbtt__bitmap; flatness_in_pixels: Single; vertices: Pstbtt_vertex; num_verts: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; x_off: Integer; y_off: Integer; invert: Integer; userdata: Pointer); cdecl;
  stbtt_FreeSDF: procedure(bitmap: PByte; userdata: Pointer); cdecl;
  stbtt_GetGlyphSDF: function(const info: Pstbtt_fontinfo; scale: Single; glyph: Integer; padding: Integer; onedge_value: Byte; pixel_dist_scale: Single; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  stbtt_GetCodepointSDF: function(const info: Pstbtt_fontinfo; scale: Single; codepoint: Integer; padding: Integer; onedge_value: Byte; pixel_dist_scale: Single; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  stbtt_FindMatchingFont: function(const fontdata: PByte; const name: PUTF8Char; flags: Integer): Integer; cdecl;
  stbtt_CompareUTF8toUTF16_bigendian: function(const s1: PUTF8Char; len1: Integer; const s2: PUTF8Char; len2: Integer): Integer; cdecl;
  stbtt_GetFontNameString: function(const font: Pstbtt_fontinfo; length: PInteger; platformID: Integer; encodingID: Integer; languageID: Integer; nameID: Integer): PUTF8Char; cdecl;
  plm_create_with_filename: function(const filename: PUTF8Char): Pplm_t; cdecl;
  plm_create_with_file: function(fh: PPointer; close_when_done: Integer): Pplm_t; cdecl;
  plm_create_with_memory: function(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_t; cdecl;
  plm_create_with_buffer: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_t; cdecl;
  plm_destroy: procedure(self: Pplm_t); cdecl;
  plm_has_headers: function(self: Pplm_t): Integer; cdecl;
  plm_get_video_enabled: function(self: Pplm_t): Integer; cdecl;
  plm_set_video_enabled: procedure(self: Pplm_t; enabled: Integer); cdecl;
  plm_get_num_video_streams: function(self: Pplm_t): Integer; cdecl;
  plm_get_width: function(self: Pplm_t): Integer; cdecl;
  plm_get_height: function(self: Pplm_t): Integer; cdecl;
  plm_get_framerate: function(self: Pplm_t): Double; cdecl;
  plm_get_audio_enabled: function(self: Pplm_t): Integer; cdecl;
  plm_set_audio_enabled: procedure(self: Pplm_t; enabled: Integer); cdecl;
  plm_get_num_audio_streams: function(self: Pplm_t): Integer; cdecl;
  plm_set_audio_stream: procedure(self: Pplm_t; stream_index: Integer); cdecl;
  plm_get_samplerate: function(self: Pplm_t): Integer; cdecl;
  plm_get_audio_lead_time: function(self: Pplm_t): Double; cdecl;
  plm_set_audio_lead_time: procedure(self: Pplm_t; lead_time: Double); cdecl;
  plm_get_time: function(self: Pplm_t): Double; cdecl;
  plm_get_duration: function(self: Pplm_t): Double; cdecl;
  plm_rewind: procedure(self: Pplm_t); cdecl;
  plm_get_loop: function(self: Pplm_t): Integer; cdecl;
  plm_set_loop: procedure(self: Pplm_t; loop: Integer); cdecl;
  plm_has_ended: function(self: Pplm_t): Integer; cdecl;
  plm_set_video_decode_callback: procedure(self: Pplm_t; fp: plm_video_decode_callback; user: Pointer); cdecl;
  plm_set_audio_decode_callback: procedure(self: Pplm_t; fp: plm_audio_decode_callback; user: Pointer); cdecl;
  plm_decode: procedure(self: Pplm_t; seconds: Double); cdecl;
  plm_decode_video: function(self: Pplm_t): Pplm_frame_t; cdecl;
  plm_decode_audio: function(self: Pplm_t): Pplm_samples_t; cdecl;
  plm_seek: function(self: Pplm_t; time: Double; seek_exact: Integer): Integer; cdecl;
  plm_seek_frame: function(self: Pplm_t; time: Double; seek_exact: Integer): Pplm_frame_t; cdecl;
  plm_buffer_create_with_filename: function(const filename: PUTF8Char): Pplm_buffer_t; cdecl;
  plm_buffer_create_with_file: function(fh: PPointer; close_when_done: Integer): Pplm_buffer_t; cdecl;
  plm_buffer_create_with_memory: function(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_buffer_t; cdecl;
  plm_buffer_create_with_capacity: function(capacity: NativeUInt): Pplm_buffer_t; cdecl;
  plm_buffer_create_for_appending: function(initial_capacity: NativeUInt): Pplm_buffer_t; cdecl;
  plm_buffer_destroy: procedure(self: Pplm_buffer_t); cdecl;
  plm_buffer_write: function(self: Pplm_buffer_t; bytes: PUInt8; length: NativeUInt): NativeUInt; cdecl;
  plm_buffer_signal_end: procedure(self: Pplm_buffer_t); cdecl;
  plm_buffer_set_load_callback: procedure(self: Pplm_buffer_t; fp: plm_buffer_load_callback; user: Pointer); cdecl;
  plm_buffer_rewind: procedure(self: Pplm_buffer_t); cdecl;
  plm_buffer_get_size: function(self: Pplm_buffer_t): NativeUInt; cdecl;
  plm_buffer_get_remaining: function(self: Pplm_buffer_t): NativeUInt; cdecl;
  plm_buffer_has_ended: function(self: Pplm_buffer_t): Integer; cdecl;
  plm_demux_create: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_demux_t; cdecl;
  plm_demux_destroy: procedure(self: Pplm_demux_t); cdecl;
  plm_demux_has_headers: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_get_num_video_streams: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_get_num_audio_streams: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_rewind: procedure(self: Pplm_demux_t); cdecl;
  plm_demux_has_ended: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_seek: function(self: Pplm_demux_t; time: Double; type_: Integer; force_intra: Integer): Pplm_packet_t; cdecl;
  plm_demux_get_start_time: function(self: Pplm_demux_t; type_: Integer): Double; cdecl;
  plm_demux_get_duration: function(self: Pplm_demux_t; type_: Integer): Double; cdecl;
  plm_demux_decode: function(self: Pplm_demux_t): Pplm_packet_t; cdecl;
  plm_video_create_with_buffer: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_video_t; cdecl;
  plm_video_destroy: procedure(self: Pplm_video_t); cdecl;
  plm_video_has_header: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_get_framerate: function(self: Pplm_video_t): Double; cdecl;
  plm_video_get_width: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_get_height: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_set_no_delay: procedure(self: Pplm_video_t; no_delay: Integer); cdecl;
  plm_video_get_time: function(self: Pplm_video_t): Double; cdecl;
  plm_video_set_time: procedure(self: Pplm_video_t; time: Double); cdecl;
  plm_video_rewind: procedure(self: Pplm_video_t); cdecl;
  plm_video_has_ended: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_decode: function(self: Pplm_video_t): Pplm_frame_t; cdecl;
  plm_frame_to_rgb: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_bgr: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_rgba: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_bgra: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_argb: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_abgr: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_audio_create_with_buffer: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_audio_t; cdecl;
  plm_audio_destroy: procedure(self: Pplm_audio_t); cdecl;
  plm_audio_has_header: function(self: Pplm_audio_t): Integer; cdecl;
  plm_audio_get_samplerate: function(self: Pplm_audio_t): Integer; cdecl;
  plm_audio_get_time: function(self: Pplm_audio_t): Double; cdecl;
  plm_audio_set_time: procedure(self: Pplm_audio_t; time: Double); cdecl;
  plm_audio_rewind: procedure(self: Pplm_audio_t); cdecl;
  plm_audio_has_ended: function(self: Pplm_audio_t): Integer; cdecl;
  plm_audio_decode: function(self: Pplm_audio_t): Pplm_samples_t; cdecl;
  nk_init_default: function(p1: Pnk_context; const p2: Pnk_user_font): nk_bool; cdecl;
  nk_init_fixed: function(p1: Pnk_context; memory: Pointer; size: nk_size; const p4: Pnk_user_font): nk_bool; cdecl;
  nk_init: function(p1: Pnk_context; p2: Pnk_allocator; const p3: Pnk_user_font): nk_bool; cdecl;
  nk_init_custom: function(p1: Pnk_context; cmds: Pnk_buffer; pool: Pnk_buffer; const p4: Pnk_user_font): nk_bool; cdecl;
  nk_clear: procedure(p1: Pnk_context); cdecl;
  nk_free: procedure(p1: Pnk_context); cdecl;
  nk_input_begin: procedure(p1: Pnk_context); cdecl;
  nk_input_motion: procedure(p1: Pnk_context; x: Integer; y: Integer); cdecl;
  nk_input_key: procedure(p1: Pnk_context; p2: nk_keys; down: nk_bool); cdecl;
  nk_input_button: procedure(p1: Pnk_context; p2: nk_buttons; x: Integer; y: Integer; down: nk_bool); cdecl;
  nk_input_scroll: procedure(p1: Pnk_context; val: nk_vec2); cdecl;
  nk_input_char: procedure(p1: Pnk_context; p2: UTF8Char); cdecl;
  nk_input_glyph: procedure(p1: Pnk_context; const p2: nk_glyph); cdecl;
  nk_input_unicode: procedure(p1: Pnk_context; p2: nk_rune); cdecl;
  nk_input_end: procedure(p1: Pnk_context); cdecl;
  nk__begin: function(p1: Pnk_context): Pnk_command; cdecl;
  nk__next: function(p1: Pnk_context; const p2: Pnk_command): Pnk_command; cdecl;
  nk_convert: function(p1: Pnk_context; cmds: Pnk_buffer; vertices: Pnk_buffer; elements: Pnk_buffer; const p5: Pnk_convert_config): nk_flags; cdecl;
  nk__draw_begin: function(const p1: Pnk_context; const p2: Pnk_buffer): Pnk_draw_command; cdecl;
  nk__draw_end: function(const p1: Pnk_context; const p2: Pnk_buffer): Pnk_draw_command; cdecl;
  nk__draw_next: function(const p1: Pnk_draw_command; const p2: Pnk_buffer; const p3: Pnk_context): Pnk_draw_command; cdecl;
  nk_begin: function(ctx: Pnk_context; const title: PUTF8Char; bounds: nk_rect; flags: nk_flags): nk_bool; cdecl;
  nk_begin_titled: function(ctx: Pnk_context; const name: PUTF8Char; const title: PUTF8Char; bounds: nk_rect; flags: nk_flags): nk_bool; cdecl;
  nk_end: procedure(ctx: Pnk_context); cdecl;
  nk_window_find: function(ctx: Pnk_context; const name: PUTF8Char): Pnk_window; cdecl;
  nk_window_get_bounds: function(const ctx: Pnk_context): nk_rect; cdecl;
  nk_window_get_position: function(const ctx: Pnk_context): nk_vec2; cdecl;
  nk_window_get_size: function(const p1: Pnk_context): nk_vec2; cdecl;
  nk_window_get_width: function(const p1: Pnk_context): Single; cdecl;
  nk_window_get_height: function(const p1: Pnk_context): Single; cdecl;
  nk_window_get_panel: function(p1: Pnk_context): Pnk_panel; cdecl;
  nk_window_get_content_region: function(p1: Pnk_context): nk_rect; cdecl;
  nk_window_get_content_region_min: function(p1: Pnk_context): nk_vec2; cdecl;
  nk_window_get_content_region_max: function(p1: Pnk_context): nk_vec2; cdecl;
  nk_window_get_content_region_size: function(p1: Pnk_context): nk_vec2; cdecl;
  nk_window_get_canvas: function(p1: Pnk_context): Pnk_command_buffer; cdecl;
  nk_window_get_scroll: procedure(p1: Pnk_context; offset_x: Pnk_uint; offset_y: Pnk_uint); cdecl;
  nk_window_has_focus: function(const p1: Pnk_context): nk_bool; cdecl;
  nk_window_is_hovered: function(p1: Pnk_context): nk_bool; cdecl;
  nk_window_is_collapsed: function(ctx: Pnk_context; const name: PUTF8Char): nk_bool; cdecl;
  nk_window_is_closed: function(p1: Pnk_context; const p2: PUTF8Char): nk_bool; cdecl;
  nk_window_is_hidden: function(p1: Pnk_context; const p2: PUTF8Char): nk_bool; cdecl;
  nk_window_is_active: function(p1: Pnk_context; const p2: PUTF8Char): nk_bool; cdecl;
  nk_window_is_any_hovered: function(p1: Pnk_context): nk_bool; cdecl;
  nk_item_is_any_active: function(p1: Pnk_context): nk_bool; cdecl;
  nk_window_set_bounds: procedure(p1: Pnk_context; const name: PUTF8Char; bounds: nk_rect); cdecl;
  nk_window_set_position: procedure(p1: Pnk_context; const name: PUTF8Char; pos: nk_vec2); cdecl;
  nk_window_set_size: procedure(p1: Pnk_context; const name: PUTF8Char; p3: nk_vec2); cdecl;
  nk_window_set_focus: procedure(p1: Pnk_context; const name: PUTF8Char); cdecl;
  nk_window_set_scroll: procedure(p1: Pnk_context; offset_x: nk_uint; offset_y: nk_uint); cdecl;
  nk_window_close: procedure(ctx: Pnk_context; const name: PUTF8Char); cdecl;
  nk_window_collapse: procedure(p1: Pnk_context; const name: PUTF8Char; state: nk_collapse_states); cdecl;
  nk_window_collapse_if: procedure(p1: Pnk_context; const name: PUTF8Char; p3: nk_collapse_states; cond: Integer); cdecl;
  nk_window_show: procedure(p1: Pnk_context; const name: PUTF8Char; p3: nk_show_states); cdecl;
  nk_window_show_if: procedure(p1: Pnk_context; const name: PUTF8Char; p3: nk_show_states; cond: Integer); cdecl;
  nk_layout_set_min_row_height: procedure(p1: Pnk_context; height: Single); cdecl;
  nk_layout_reset_min_row_height: procedure(p1: Pnk_context); cdecl;
  nk_layout_widget_bounds: function(p1: Pnk_context): nk_rect; cdecl;
  nk_layout_ratio_from_pixel: function(p1: Pnk_context; pixel_width: Single): Single; cdecl;
  nk_layout_row_dynamic: procedure(ctx: Pnk_context; height: Single; cols: Integer); cdecl;
  nk_layout_row_static: procedure(ctx: Pnk_context; height: Single; item_width: Integer; cols: Integer); cdecl;
  nk_layout_row_begin: procedure(ctx: Pnk_context; fmt: nk_layout_format; row_height: Single; cols: Integer); cdecl;
  nk_layout_row_push: procedure(p1: Pnk_context; value: Single); cdecl;
  nk_layout_row_end: procedure(p1: Pnk_context); cdecl;
  nk_layout_row: procedure(p1: Pnk_context; p2: nk_layout_format; height: Single; cols: Integer; const ratio: PSingle); cdecl;
  nk_layout_row_template_begin: procedure(p1: Pnk_context; row_height: Single); cdecl;
  nk_layout_row_template_push_dynamic: procedure(p1: Pnk_context); cdecl;
  nk_layout_row_template_push_variable: procedure(p1: Pnk_context; min_width: Single); cdecl;
  nk_layout_row_template_push_static: procedure(p1: Pnk_context; width: Single); cdecl;
  nk_layout_row_template_end: procedure(p1: Pnk_context); cdecl;
  nk_layout_space_begin: procedure(p1: Pnk_context; p2: nk_layout_format; height: Single; widget_count: Integer); cdecl;
  nk_layout_space_push: procedure(p1: Pnk_context; bounds: nk_rect); cdecl;
  nk_layout_space_end: procedure(p1: Pnk_context); cdecl;
  nk_layout_space_bounds: function(p1: Pnk_context): nk_rect; cdecl;
  nk_layout_space_to_screen: function(p1: Pnk_context; p2: nk_vec2): nk_vec2; cdecl;
  nk_layout_space_to_local: function(p1: Pnk_context; p2: nk_vec2): nk_vec2; cdecl;
  nk_layout_space_rect_to_screen: function(p1: Pnk_context; p2: nk_rect): nk_rect; cdecl;
  nk_layout_space_rect_to_local: function(p1: Pnk_context; p2: nk_rect): nk_rect; cdecl;
  nk_spacer: procedure(p1: Pnk_context); cdecl;
  nk_group_begin: function(p1: Pnk_context; const title: PUTF8Char; p3: nk_flags): nk_bool; cdecl;
  nk_group_begin_titled: function(p1: Pnk_context; const name: PUTF8Char; const title: PUTF8Char; p4: nk_flags): nk_bool; cdecl;
  nk_group_end: procedure(p1: Pnk_context); cdecl;
  nk_group_scrolled_offset_begin: function(p1: Pnk_context; x_offset: Pnk_uint; y_offset: Pnk_uint; const title: PUTF8Char; flags: nk_flags): nk_bool; cdecl;
  nk_group_scrolled_begin: function(p1: Pnk_context; off: Pnk_scroll; const title: PUTF8Char; p4: nk_flags): nk_bool; cdecl;
  nk_group_scrolled_end: procedure(p1: Pnk_context); cdecl;
  nk_group_get_scroll: procedure(p1: Pnk_context; const id: PUTF8Char; x_offset: Pnk_uint; y_offset: Pnk_uint); cdecl;
  nk_group_set_scroll: procedure(p1: Pnk_context; const id: PUTF8Char; x_offset: nk_uint; y_offset: nk_uint); cdecl;
  nk_tree_push_hashed: function(p1: Pnk_context; p2: nk_tree_type; const title: PUTF8Char; initial_state: nk_collapse_states; const hash: PUTF8Char; len: Integer; seed: Integer): nk_bool; cdecl;
  nk_tree_image_push_hashed: function(p1: Pnk_context; p2: nk_tree_type; p3: nk_image; const title: PUTF8Char; initial_state: nk_collapse_states; const hash: PUTF8Char; len: Integer; seed: Integer): nk_bool; cdecl;
  nk_tree_pop: procedure(p1: Pnk_context); cdecl;
  nk_tree_state_push: function(p1: Pnk_context; p2: nk_tree_type; const title: PUTF8Char; state: Pnk_collapse_states): nk_bool; cdecl;
  nk_tree_state_image_push: function(p1: Pnk_context; p2: nk_tree_type; p3: nk_image; const title: PUTF8Char; state: Pnk_collapse_states): nk_bool; cdecl;
  nk_tree_state_pop: procedure(p1: Pnk_context); cdecl;
  nk_tree_element_push_hashed: function(p1: Pnk_context; p2: nk_tree_type; const title: PUTF8Char; initial_state: nk_collapse_states; selected: Pnk_bool; const hash: PUTF8Char; len: Integer; seed: Integer): nk_bool; cdecl;
  nk_tree_element_image_push_hashed: function(p1: Pnk_context; p2: nk_tree_type; p3: nk_image; const title: PUTF8Char; initial_state: nk_collapse_states; selected: Pnk_bool; const hash: PUTF8Char; len: Integer; seed: Integer): nk_bool; cdecl;
  nk_tree_element_pop: procedure(p1: Pnk_context); cdecl;
  nk_list_view_begin: function(p1: Pnk_context; out_: Pnk_list_view; const id: PUTF8Char; p4: nk_flags; row_height: Integer; row_count: Integer): nk_bool; cdecl;
  nk_list_view_end: procedure(p1: Pnk_list_view); cdecl;
  nk_widget: function(p1: Pnk_rect; const p2: Pnk_context): nk_widget_layout_states; cdecl;
  nk_widget_fitting: function(p1: Pnk_rect; p2: Pnk_context; p3: nk_vec2): nk_widget_layout_states; cdecl;
  nk_widget_bounds: function(p1: Pnk_context): nk_rect; cdecl;
  nk_widget_position: function(p1: Pnk_context): nk_vec2; cdecl;
  nk_widget_size: function(p1: Pnk_context): nk_vec2; cdecl;
  nk_widget_width: function(p1: Pnk_context): Single; cdecl;
  nk_widget_height: function(p1: Pnk_context): Single; cdecl;
  nk_widget_is_hovered: function(p1: Pnk_context): nk_bool; cdecl;
  nk_widget_is_mouse_clicked: function(p1: Pnk_context; p2: nk_buttons): nk_bool; cdecl;
  nk_widget_has_mouse_click_down: function(p1: Pnk_context; p2: nk_buttons; down: nk_bool): nk_bool; cdecl;
  nk_spacing: procedure(p1: Pnk_context; cols: Integer); cdecl;
  nk_text: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; p4: nk_flags); cdecl;
  nk_text_colored: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; p4: nk_flags; p5: nk_color); cdecl;
  nk_text_wrap: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: Integer); cdecl;
  nk_text_wrap_colored: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; p4: nk_color); cdecl;
  nk_label: procedure(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags); cdecl;
  nk_label_colored: procedure(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags; p4: nk_color); cdecl;
  nk_label_wrap: procedure(p1: Pnk_context; const p2: PUTF8Char); cdecl;
  nk_label_colored_wrap: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: nk_color); cdecl;
  nk_image_rtn: procedure(p1: Pnk_context; p2: nk_image); cdecl;
  nk_image_color: procedure(p1: Pnk_context; p2: nk_image; p3: nk_color); cdecl;
  nk_labelf: procedure(p1: Pnk_context; p2: nk_flags; const p3: PUTF8Char) varargs; cdecl;
  nk_labelf_colored: procedure(p1: Pnk_context; p2: nk_flags; p3: nk_color; const p4: PUTF8Char) varargs; cdecl;
  nk_labelf_wrap: procedure(p1: Pnk_context; const p2: PUTF8Char) varargs; cdecl;
  nk_labelf_colored_wrap: procedure(p1: Pnk_context; p2: nk_color; const p3: PUTF8Char) varargs; cdecl;
  nk_labelfv: procedure(p1: Pnk_context; p2: nk_flags; const p3: PUTF8Char; p4: Pointer); cdecl;
  nk_labelfv_colored: procedure(p1: Pnk_context; p2: nk_flags; p3: nk_color; const p4: PUTF8Char; p5: Pointer); cdecl;
  nk_labelfv_wrap: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: Pointer); cdecl;
  nk_labelfv_colored_wrap: procedure(p1: Pnk_context; p2: nk_color; const p3: PUTF8Char; p4: Pointer); cdecl;
  nk_value_bool: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: Integer); cdecl;
  nk_value_int: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: Integer); cdecl;
  nk_value_uint: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: Cardinal); cdecl;
  nk_value_float: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: Single); cdecl;
  nk_value_color_byte: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: nk_color); cdecl;
  nk_value_color_float: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: nk_color); cdecl;
  nk_value_color_hex: procedure(p1: Pnk_context; const prefix: PUTF8Char; p3: nk_color); cdecl;
  nk_button_text: function(p1: Pnk_context; const title: PUTF8Char; len: Integer): nk_bool; cdecl;
  nk_button_label: function(p1: Pnk_context; const title: PUTF8Char): nk_bool; cdecl;
  nk_button_color: function(p1: Pnk_context; p2: nk_color): nk_bool; cdecl;
  nk_button_symbol: function(p1: Pnk_context; p2: nk_symbol_type): nk_bool; cdecl;
  nk_button_image: function(p1: Pnk_context; img: nk_image): nk_bool; cdecl;
  nk_button_symbol_label: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; text_alignment: nk_flags): nk_bool; cdecl;
  nk_button_symbol_text: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; p4: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_button_image_label: function(p1: Pnk_context; img: nk_image; const p3: PUTF8Char; text_alignment: nk_flags): nk_bool; cdecl;
  nk_button_image_text: function(p1: Pnk_context; img: nk_image; const p3: PUTF8Char; p4: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_button_text_styled: function(p1: Pnk_context; const p2: Pnk_style_button; const title: PUTF8Char; len: Integer): nk_bool; cdecl;
  nk_button_label_styled: function(p1: Pnk_context; const p2: Pnk_style_button; const title: PUTF8Char): nk_bool; cdecl;
  nk_button_symbol_styled: function(p1: Pnk_context; const p2: Pnk_style_button; p3: nk_symbol_type): nk_bool; cdecl;
  nk_button_image_styled: function(p1: Pnk_context; const p2: Pnk_style_button; img: nk_image): nk_bool; cdecl;
  nk_button_symbol_text_styled: function(p1: Pnk_context; const p2: Pnk_style_button; p3: nk_symbol_type; const p4: PUTF8Char; p5: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_button_symbol_label_styled: function(ctx: Pnk_context; const style: Pnk_style_button; symbol: nk_symbol_type; const title: PUTF8Char; align: nk_flags): nk_bool; cdecl;
  nk_button_image_label_styled: function(p1: Pnk_context; const p2: Pnk_style_button; img: nk_image; const p4: PUTF8Char; text_alignment: nk_flags): nk_bool; cdecl;
  nk_button_image_text_styled: function(p1: Pnk_context; const p2: Pnk_style_button; img: nk_image; const p4: PUTF8Char; p5: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_button_set_behavior: procedure(p1: Pnk_context; p2: nk_button_behavior); cdecl;
  nk_button_push_behavior: function(p1: Pnk_context; p2: nk_button_behavior): nk_bool; cdecl;
  nk_button_pop_behavior: function(p1: Pnk_context): nk_bool; cdecl;
  nk_check_label: function(p1: Pnk_context; const p2: PUTF8Char; active: nk_bool): nk_bool; cdecl;
  nk_check_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; active: nk_bool): nk_bool; cdecl;
  nk_check_flags_label: function(p1: Pnk_context; const p2: PUTF8Char; flags: Cardinal; value: Cardinal): Cardinal; cdecl;
  nk_check_flags_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; flags: Cardinal; value: Cardinal): Cardinal; cdecl;
  nk_checkbox_label: function(p1: Pnk_context; const p2: PUTF8Char; active: Pnk_bool): nk_bool; cdecl;
  nk_checkbox_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; active: Pnk_bool): nk_bool; cdecl;
  nk_checkbox_flags_label: function(p1: Pnk_context; const p2: PUTF8Char; flags: PCardinal; value: Cardinal): nk_bool; cdecl;
  nk_checkbox_flags_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; flags: PCardinal; value: Cardinal): nk_bool; cdecl;
  nk_radio_label: function(p1: Pnk_context; const p2: PUTF8Char; active: Pnk_bool): nk_bool; cdecl;
  nk_radio_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; active: Pnk_bool): nk_bool; cdecl;
  nk_option_label: function(p1: Pnk_context; const p2: PUTF8Char; active: nk_bool): nk_bool; cdecl;
  nk_option_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; active: nk_bool): nk_bool; cdecl;
  nk_selectable_label: function(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags; value: Pnk_bool): nk_bool; cdecl;
  nk_selectable_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; align: nk_flags; value: Pnk_bool): nk_bool; cdecl;
  nk_selectable_image_label: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; align: nk_flags; value: Pnk_bool): nk_bool; cdecl;
  nk_selectable_image_text: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; p4: Integer; align: nk_flags; value: Pnk_bool): nk_bool; cdecl;
  nk_selectable_symbol_label: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; align: nk_flags; value: Pnk_bool): nk_bool; cdecl;
  nk_selectable_symbol_text: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; p4: Integer; align: nk_flags; value: Pnk_bool): nk_bool; cdecl;
  nk_select_label: function(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags; value: nk_bool): nk_bool; cdecl;
  nk_select_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; align: nk_flags; value: nk_bool): nk_bool; cdecl;
  nk_select_image_label: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; align: nk_flags; value: nk_bool): nk_bool; cdecl;
  nk_select_image_text: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; p4: Integer; align: nk_flags; value: nk_bool): nk_bool; cdecl;
  nk_select_symbol_label: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; align: nk_flags; value: nk_bool): nk_bool; cdecl;
  nk_select_symbol_text: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; p4: Integer; align: nk_flags; value: nk_bool): nk_bool; cdecl;
  nk_slide_float: function(p1: Pnk_context; min: Single; val: Single; max: Single; step: Single): Single; cdecl;
  nk_slide_int: function(p1: Pnk_context; min: Integer; val: Integer; max: Integer; step: Integer): Integer; cdecl;
  nk_slider_float: function(p1: Pnk_context; min: Single; val: PSingle; max: Single; step: Single): nk_bool; cdecl;
  nk_slider_int: function(p1: Pnk_context; min: Integer; val: PInteger; max: Integer; step: Integer): nk_bool; cdecl;
  nk_progress: function(p1: Pnk_context; cur: Pnk_size; max: nk_size; modifyable: nk_bool): nk_bool; cdecl;
  nk_prog: function(p1: Pnk_context; cur: nk_size; max: nk_size; modifyable: nk_bool): nk_size; cdecl;
  nk_color_picker: function(p1: Pnk_context; p2: nk_colorf; p3: nk_color_format): nk_colorf; cdecl;
  nk_color_pick: function(p1: Pnk_context; p2: Pnk_colorf; p3: nk_color_format): nk_bool; cdecl;
  nk_property_int: procedure(p1: Pnk_context; const name: PUTF8Char; min: Integer; val: PInteger; max: Integer; step: Integer; inc_per_pixel: Single); cdecl;
  nk_property_float: procedure(p1: Pnk_context; const name: PUTF8Char; min: Single; val: PSingle; max: Single; step: Single; inc_per_pixel: Single); cdecl;
  nk_property_double: procedure(p1: Pnk_context; const name: PUTF8Char; min: Double; val: PDouble; max: Double; step: Double; inc_per_pixel: Single); cdecl;
  nk_propertyi: function(p1: Pnk_context; const name: PUTF8Char; min: Integer; val: Integer; max: Integer; step: Integer; inc_per_pixel: Single): Integer; cdecl;
  nk_propertyf: function(p1: Pnk_context; const name: PUTF8Char; min: Single; val: Single; max: Single; step: Single; inc_per_pixel: Single): Single; cdecl;
  nk_propertyd: function(p1: Pnk_context; const name: PUTF8Char; min: Double; val: Double; max: Double; step: Double; inc_per_pixel: Single): Double; cdecl;
  nk_edit_string: function(p1: Pnk_context; p2: nk_flags; buffer: PUTF8Char; len: PInteger; max: Integer; p6: nk_plugin_filter): nk_flags; cdecl;
  nk_edit_string_zero_terminated: function(p1: Pnk_context; p2: nk_flags; buffer: PUTF8Char; max: Integer; p5: nk_plugin_filter): nk_flags; cdecl;
  nk_edit_buffer: function(p1: Pnk_context; p2: nk_flags; p3: Pnk_text_edit; p4: nk_plugin_filter): nk_flags; cdecl;
  nk_edit_focus: procedure(p1: Pnk_context; flags: nk_flags); cdecl;
  nk_edit_unfocus: procedure(p1: Pnk_context); cdecl;
  nk_chart_begin: function(p1: Pnk_context; p2: nk_chart_type; num: Integer; min: Single; max: Single): nk_bool; cdecl;
  nk_chart_begin_colored: function(p1: Pnk_context; p2: nk_chart_type; p3: nk_color; active: nk_color; num: Integer; min: Single; max: Single): nk_bool; cdecl;
  nk_chart_add_slot: procedure(ctx: Pnk_context; const p2: nk_chart_type; count: Integer; min_value: Single; max_value: Single); cdecl;
  nk_chart_add_slot_colored: procedure(ctx: Pnk_context; const p2: nk_chart_type; p3: nk_color; active: nk_color; count: Integer; min_value: Single; max_value: Single); cdecl;
  nk_chart_push: function(p1: Pnk_context; p2: Single): nk_flags; cdecl;
  nk_chart_push_slot: function(p1: Pnk_context; p2: Single; p3: Integer): nk_flags; cdecl;
  nk_chart_end: procedure(p1: Pnk_context); cdecl;
  nk_plot: procedure(p1: Pnk_context; p2: nk_chart_type; const values: PSingle; count: Integer; offset: Integer); cdecl;

type
  nk_plot_function_value_getter = function(user: Pointer; index: Integer): Single; cdecl;

var
  nk_plot_function: procedure(p1: Pnk_context; p2: nk_chart_type; userdata: Pointer; value_getter: nk_plot_function_value_getter; count: Integer; offset: Integer); cdecl;
  nk_popup_begin: function(p1: Pnk_context; p2: nk_popup_type; const p3: PUTF8Char; p4: nk_flags; bounds: nk_rect): nk_bool; cdecl;
  nk_popup_close: procedure(p1: Pnk_context); cdecl;
  nk_popup_end: procedure(p1: Pnk_context); cdecl;
  nk_popup_get_scroll: procedure(p1: Pnk_context; offset_x: Pnk_uint; offset_y: Pnk_uint); cdecl;
  nk_popup_set_scroll: procedure(p1: Pnk_context; offset_x: nk_uint; offset_y: nk_uint); cdecl;
  nk_combo: function(p1: Pnk_context; items: PPUTF8Char; count: Integer; selected: Integer; item_height: Integer; size: nk_vec2): Integer; cdecl;
  nk_combo_separator: function(p1: Pnk_context; const items_separated_by_separator: PUTF8Char; separator: Integer; selected: Integer; count: Integer; item_height: Integer; size: nk_vec2): Integer; cdecl;
  nk_combo_string: function(p1: Pnk_context; const items_separated_by_zeros: PUTF8Char; selected: Integer; count: Integer; item_height: Integer; size: nk_vec2): Integer; cdecl;

type
  nk_combo_callback_item_getter = procedure(p1: Pointer; p2: Integer; p3: PPUTF8Char); cdecl;

var
  nk_combo_callback: function(p1: Pnk_context; item_getter: nk_combo_callback_item_getter; userdata: Pointer; selected: Integer; count: Integer; item_height: Integer; size: nk_vec2): Integer; cdecl;
  nk_combobox: procedure(p1: Pnk_context; items: PPUTF8Char; count: Integer; selected: PInteger; item_height: Integer; size: nk_vec2); cdecl;
  nk_combobox_string: procedure(p1: Pnk_context; const items_separated_by_zeros: PUTF8Char; selected: PInteger; count: Integer; item_height: Integer; size: nk_vec2); cdecl;
  nk_combobox_separator: procedure(p1: Pnk_context; const items_separated_by_separator: PUTF8Char; separator: Integer; selected: PInteger; count: Integer; item_height: Integer; size: nk_vec2); cdecl;

type
  nk_combobox_callback_item_getter = procedure(p1: Pointer; p2: Integer; p3: PPUTF8Char); cdecl;

var
  nk_combobox_callback: procedure(p1: Pnk_context; item_getter: nk_combobox_callback_item_getter; p3: Pointer; selected: PInteger; count: Integer; item_height: Integer; size: nk_vec2); cdecl;
  nk_combo_begin_text: function(p1: Pnk_context; const selected: PUTF8Char; p3: Integer; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_label: function(p1: Pnk_context; const selected: PUTF8Char; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_color: function(p1: Pnk_context; color: nk_color; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_symbol: function(p1: Pnk_context; p2: nk_symbol_type; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_symbol_label: function(p1: Pnk_context; const selected: PUTF8Char; p3: nk_symbol_type; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_symbol_text: function(p1: Pnk_context; const selected: PUTF8Char; p3: Integer; p4: nk_symbol_type; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_image: function(p1: Pnk_context; img: nk_image; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_image_label: function(p1: Pnk_context; const selected: PUTF8Char; p3: nk_image; size: nk_vec2): nk_bool; cdecl;
  nk_combo_begin_image_text: function(p1: Pnk_context; const selected: PUTF8Char; p3: Integer; p4: nk_image; size: nk_vec2): nk_bool; cdecl;
  nk_combo_item_label: function(p1: Pnk_context; const p2: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_combo_item_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_combo_item_image_label: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_combo_item_image_text: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; p4: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_combo_item_symbol_label: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_combo_item_symbol_text: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; p4: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_combo_close: procedure(p1: Pnk_context); cdecl;
  nk_combo_end: procedure(p1: Pnk_context); cdecl;
  nk_contextual_begin: function(p1: Pnk_context; p2: nk_flags; p3: nk_vec2; trigger_bounds: nk_rect): nk_bool; cdecl;
  nk_contextual_item_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; align: nk_flags): nk_bool; cdecl;
  nk_contextual_item_label: function(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags): nk_bool; cdecl;
  nk_contextual_item_image_label: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_contextual_item_image_text: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; len: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_contextual_item_symbol_label: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_contextual_item_symbol_text: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; p4: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_contextual_close: procedure(p1: Pnk_context); cdecl;
  nk_contextual_end: procedure(p1: Pnk_context); cdecl;
  nk_tooltip: procedure(p1: Pnk_context; const p2: PUTF8Char); cdecl;
  nk_tooltipf: procedure(p1: Pnk_context; const p2: PUTF8Char) varargs; cdecl;
  nk_tooltipfv: procedure(p1: Pnk_context; const p2: PUTF8Char; p3: Pointer); cdecl;
  nk_tooltip_begin: function(p1: Pnk_context; width: Single): nk_bool; cdecl;
  nk_tooltip_end: procedure(p1: Pnk_context); cdecl;
  nk_menubar_begin: procedure(p1: Pnk_context); cdecl;
  nk_menubar_end: procedure(p1: Pnk_context); cdecl;
  nk_menu_begin_text: function(p1: Pnk_context; const title: PUTF8Char; title_len: Integer; align: nk_flags; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_label: function(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_image: function(p1: Pnk_context; const p2: PUTF8Char; p3: nk_image; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_image_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; align: nk_flags; p5: nk_image; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_image_label: function(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags; p4: nk_image; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_symbol: function(p1: Pnk_context; const p2: PUTF8Char; p3: nk_symbol_type; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_symbol_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; align: nk_flags; p5: nk_symbol_type; size: nk_vec2): nk_bool; cdecl;
  nk_menu_begin_symbol_label: function(p1: Pnk_context; const p2: PUTF8Char; align: nk_flags; p4: nk_symbol_type; size: nk_vec2): nk_bool; cdecl;
  nk_menu_item_text: function(p1: Pnk_context; const p2: PUTF8Char; p3: Integer; align: nk_flags): nk_bool; cdecl;
  nk_menu_item_label: function(p1: Pnk_context; const p2: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_menu_item_image_label: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_menu_item_image_text: function(p1: Pnk_context; p2: nk_image; const p3: PUTF8Char; len: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_menu_item_symbol_text: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; p4: Integer; alignment: nk_flags): nk_bool; cdecl;
  nk_menu_item_symbol_label: function(p1: Pnk_context; p2: nk_symbol_type; const p3: PUTF8Char; alignment: nk_flags): nk_bool; cdecl;
  nk_menu_close: procedure(p1: Pnk_context); cdecl;
  nk_menu_end: procedure(p1: Pnk_context); cdecl;
  nk_style_default: procedure(p1: Pnk_context); cdecl;
  nk_style_from_table: procedure(p1: Pnk_context; const p2: Pnk_color); cdecl;
  nk_style_load_cursor: procedure(p1: Pnk_context; p2: nk_style_cursor; const p3: Pnk_cursor); cdecl;
  nk_style_load_all_cursors: procedure(p1: Pnk_context; p2: Pnk_cursor); cdecl;
  nk_style_get_color_by_name: function(p1: nk_style_colors): PUTF8Char; cdecl;
  nk_style_set_font: procedure(p1: Pnk_context; const p2: Pnk_user_font); cdecl;
  nk_style_set_cursor: function(p1: Pnk_context; p2: nk_style_cursor): nk_bool; cdecl;
  nk_style_show_cursor: procedure(p1: Pnk_context); cdecl;
  nk_style_hide_cursor: procedure(p1: Pnk_context); cdecl;
  nk_style_push_font: function(p1: Pnk_context; const p2: Pnk_user_font): nk_bool; cdecl;
  nk_style_push_float: function(p1: Pnk_context; p2: PSingle; p3: Single): nk_bool; cdecl;
  nk_style_push_vec2: function(p1: Pnk_context; p2: Pnk_vec2; p3: nk_vec2): nk_bool; cdecl;
  nk_style_push_style_item: function(p1: Pnk_context; p2: Pnk_style_item; p3: nk_style_item): nk_bool; cdecl;
  nk_style_push_flags: function(p1: Pnk_context; p2: Pnk_flags; p3: nk_flags): nk_bool; cdecl;
  nk_style_push_color: function(p1: Pnk_context; p2: Pnk_color; p3: nk_color): nk_bool; cdecl;
  nk_style_pop_font: function(p1: Pnk_context): nk_bool; cdecl;
  nk_style_pop_float: function(p1: Pnk_context): nk_bool; cdecl;
  nk_style_pop_vec2: function(p1: Pnk_context): nk_bool; cdecl;
  nk_style_pop_style_item: function(p1: Pnk_context): nk_bool; cdecl;
  nk_style_pop_flags: function(p1: Pnk_context): nk_bool; cdecl;
  nk_style_pop_color: function(p1: Pnk_context): nk_bool; cdecl;
  nk_rgb_rtn: function(r: Integer; g: Integer; b: Integer): nk_color; cdecl;
  nk_rgb_iv: function(const rgb: PInteger): nk_color; cdecl;
  nk_rgb_bv: function(const rgb: Pnk_byte): nk_color; cdecl;
  nk_rgb_f: function(r: Single; g: Single; b: Single): nk_color; cdecl;
  nk_rgb_fv: function(const rgb: PSingle): nk_color; cdecl;
  nk_rgb_cf: function(c: nk_colorf): nk_color; cdecl;
  nk_rgb_hex: function(const rgb: PUTF8Char): nk_color; cdecl;
  nk_rgba_rtn: function(r: Integer; g: Integer; b: Integer; a: Integer): nk_color; cdecl;
  nk_rgba_u32: function(p1: nk_uint): nk_color; cdecl;
  nk_rgba_iv: function(const rgba: PInteger): nk_color; cdecl;
  nk_rgba_bv: function(const rgba: Pnk_byte): nk_color; cdecl;
  nk_rgba_f: function(r: Single; g: Single; b: Single; a: Single): nk_color; cdecl;
  nk_rgba_fv: function(const rgba: PSingle): nk_color; cdecl;
  nk_rgba_cf: function(c: nk_colorf): nk_color; cdecl;
  nk_rgba_hex: function(const rgb: PUTF8Char): nk_color; cdecl;
  nk_hsva_colorf: function(h: Single; s: Single; v: Single; a: Single): nk_colorf; cdecl;
  nk_hsva_colorfv: function(c: PSingle): nk_colorf; cdecl;
  nk_colorf_hsva_f: procedure(out_h: PSingle; out_s: PSingle; out_v: PSingle; out_a: PSingle; in_: nk_colorf); cdecl;
  nk_colorf_hsva_fv: procedure(hsva: PSingle; in_: nk_colorf); cdecl;
  nk_hsv: function(h: Integer; s: Integer; v: Integer): nk_color; cdecl;
  nk_hsv_iv: function(const hsv: PInteger): nk_color; cdecl;
  nk_hsv_bv: function(const hsv: Pnk_byte): nk_color; cdecl;
  nk_hsv_f: function(h: Single; s: Single; v: Single): nk_color; cdecl;
  nk_hsv_fv: function(const hsv: PSingle): nk_color; cdecl;
  nk_hsva: function(h: Integer; s: Integer; v: Integer; a: Integer): nk_color; cdecl;
  nk_hsva_iv: function(const hsva: PInteger): nk_color; cdecl;
  nk_hsva_bv: function(const hsva: Pnk_byte): nk_color; cdecl;
  nk_hsva_f: function(h: Single; s: Single; v: Single; a: Single): nk_color; cdecl;
  nk_hsva_fv: function(const hsva: PSingle): nk_color; cdecl;
  nk_color_f: procedure(r: PSingle; g: PSingle; b: PSingle; a: PSingle; p5: nk_color); cdecl;
  nk_color_fv: procedure(rgba_out: PSingle; p2: nk_color); cdecl;
  nk_color_cf: function(p1: nk_color): nk_colorf; cdecl;
  nk_color_d: procedure(r: PDouble; g: PDouble; b: PDouble; a: PDouble; p5: nk_color); cdecl;
  nk_color_dv: procedure(rgba_out: PDouble; p2: nk_color); cdecl;
  nk_color_u32: function(p1: nk_color): nk_uint; cdecl;
  nk_color_hex_rgba: procedure(output: PUTF8Char; p2: nk_color); cdecl;
  nk_color_hex_rgb: procedure(output: PUTF8Char; p2: nk_color); cdecl;
  nk_color_hsv_i: procedure(out_h: PInteger; out_s: PInteger; out_v: PInteger; p4: nk_color); cdecl;
  nk_color_hsv_b: procedure(out_h: Pnk_byte; out_s: Pnk_byte; out_v: Pnk_byte; p4: nk_color); cdecl;
  nk_color_hsv_iv: procedure(hsv_out: PInteger; p2: nk_color); cdecl;
  nk_color_hsv_bv: procedure(hsv_out: Pnk_byte; p2: nk_color); cdecl;
  nk_color_hsv_f: procedure(out_h: PSingle; out_s: PSingle; out_v: PSingle; p4: nk_color); cdecl;
  nk_color_hsv_fv: procedure(hsv_out: PSingle; p2: nk_color); cdecl;
  nk_color_hsva_i: procedure(h: PInteger; s: PInteger; v: PInteger; a: PInteger; p5: nk_color); cdecl;
  nk_color_hsva_b: procedure(h: Pnk_byte; s: Pnk_byte; v: Pnk_byte; a: Pnk_byte; p5: nk_color); cdecl;
  nk_color_hsva_iv: procedure(hsva_out: PInteger; p2: nk_color); cdecl;
  nk_color_hsva_bv: procedure(hsva_out: Pnk_byte; p2: nk_color); cdecl;
  nk_color_hsva_f: procedure(out_h: PSingle; out_s: PSingle; out_v: PSingle; out_a: PSingle; p5: nk_color); cdecl;
  nk_color_hsva_fv: procedure(hsva_out: PSingle; p2: nk_color); cdecl;
  nk_handle_ptr: function(p1: Pointer): nk_handle; cdecl;
  nk_handle_id: function(p1: Integer): nk_handle; cdecl;
  nk_image_handle: function(p1: nk_handle): nk_image; cdecl;
  nk_image_ptr: function(p1: Pointer): nk_image; cdecl;
  nk_image_id: function(p1: Integer): nk_image; cdecl;
  nk_image_is_subimage: function(const img: Pnk_image): nk_bool; cdecl;
  nk_subimage_ptr: function(p1: Pointer; w: nk_ushort; h: nk_ushort; sub_region: nk_rect): nk_image; cdecl;
  nk_subimage_id: function(p1: Integer; w: nk_ushort; h: nk_ushort; sub_region: nk_rect): nk_image; cdecl;
  nk_subimage_handle: function(p1: nk_handle; w: nk_ushort; h: nk_ushort; sub_region: nk_rect): nk_image; cdecl;
  nk_nine_slice_handle: function(p1: nk_handle; l: nk_ushort; t: nk_ushort; r: nk_ushort; b: nk_ushort): nk_nine_slice; cdecl;
  nk_nine_slice_ptr: function(p1: Pointer; l: nk_ushort; t: nk_ushort; r: nk_ushort; b: nk_ushort): nk_nine_slice; cdecl;
  nk_nine_slice_id: function(p1: Integer; l: nk_ushort; t: nk_ushort; r: nk_ushort; b: nk_ushort): nk_nine_slice; cdecl;
  nk_nine_slice_is_sub9slice: function(const img: Pnk_nine_slice): Integer; cdecl;
  nk_sub9slice_ptr: function(p1: Pointer; w: nk_ushort; h: nk_ushort; sub_region: nk_rect; l: nk_ushort; t: nk_ushort; r: nk_ushort; b: nk_ushort): nk_nine_slice; cdecl;
  nk_sub9slice_id: function(p1: Integer; w: nk_ushort; h: nk_ushort; sub_region: nk_rect; l: nk_ushort; t: nk_ushort; r: nk_ushort; b: nk_ushort): nk_nine_slice; cdecl;
  nk_sub9slice_handle: function(p1: nk_handle; w: nk_ushort; h: nk_ushort; sub_region: nk_rect; l: nk_ushort; t: nk_ushort; r: nk_ushort; b: nk_ushort): nk_nine_slice; cdecl;
  nk_murmur_hash: function(const key: Pointer; len: Integer; seed: nk_hash): nk_hash; cdecl;
  nk_triangle_from_direction: procedure(result: Pnk_vec2; r: nk_rect; pad_x: Single; pad_y: Single; p5: nk_heading); cdecl;
  nk_vec2_rtn: function(x: Single; y: Single): nk_vec2; cdecl;
  nk_vec2i_rtn: function(x: Integer; y: Integer): nk_vec2; cdecl;
  nk_vec2v: function(const xy: PSingle): nk_vec2; cdecl;
  nk_vec2iv: function(const xy: PInteger): nk_vec2; cdecl;
  nk_get_null_rect: function(): nk_rect; cdecl;
  nk_rect_rtn: function(x: Single; y: Single; w: Single; h: Single): nk_rect; cdecl;
  nk_recti_rtn: function(x: Integer; y: Integer; w: Integer; h: Integer): nk_rect; cdecl;
  nk_recta: function(pos: nk_vec2; size: nk_vec2): nk_rect; cdecl;
  nk_rectv: function(const xywh: PSingle): nk_rect; cdecl;
  nk_rectiv: function(const xywh: PInteger): nk_rect; cdecl;
  nk_rect_pos: function(p1: nk_rect): nk_vec2; cdecl;
  nk_rect_size: function(p1: nk_rect): nk_vec2; cdecl;
  nk_strlen: function(const str: PUTF8Char): Integer; cdecl;
  nk_stricmp: function(const s1: PUTF8Char; const s2: PUTF8Char): Integer; cdecl;
  nk_stricmpn: function(const s1: PUTF8Char; const s2: PUTF8Char; n: Integer): Integer; cdecl;
  nk_strtoi: function(const str: PUTF8Char; endptr: PPUTF8Char): Integer; cdecl;
  nk_strtof: function(const str: PUTF8Char; endptr: PPUTF8Char): Single; cdecl;
  nk_strtod: function(const str: PUTF8Char; endptr: PPUTF8Char): Double; cdecl;
  nk_strfilter: function(const text: PUTF8Char; const regexp: PUTF8Char): Integer; cdecl;
  nk_strmatch_fuzzy_string: function(const str: PUTF8Char; const pattern: PUTF8Char; out_score: PInteger): Integer; cdecl;
  nk_strmatch_fuzzy_text: function(const txt: PUTF8Char; txt_len: Integer; const pattern: PUTF8Char; out_score: PInteger): Integer; cdecl;
  nk_utf_decode: function(const p1: PUTF8Char; p2: Pnk_rune; p3: Integer): Integer; cdecl;
  nk_utf_encode: function(p1: nk_rune; p2: PUTF8Char; p3: Integer): Integer; cdecl;
  nk_utf_len: function(const p1: PUTF8Char; byte_len: Integer): Integer; cdecl;
  nk_utf_at: function(const buffer: PUTF8Char; length: Integer; index: Integer; unicode: Pnk_rune; len: PInteger): PUTF8Char; cdecl;
  nk_font_default_glyph_ranges: function(): Pnk_rune; cdecl;
  nk_font_chinese_glyph_ranges: function(): Pnk_rune; cdecl;
  nk_font_cyrillic_glyph_ranges: function(): Pnk_rune; cdecl;
  nk_font_korean_glyph_ranges: function(): Pnk_rune; cdecl;
  nk_font_atlas_init_default: procedure(p1: Pnk_font_atlas); cdecl;
  nk_font_atlas_init: procedure(p1: Pnk_font_atlas; p2: Pnk_allocator); cdecl;
  nk_font_atlas_init_custom: procedure(p1: Pnk_font_atlas; persistent: Pnk_allocator; transient: Pnk_allocator); cdecl;
  nk_font_atlas_begin: procedure(p1: Pnk_font_atlas); cdecl;
  nk_font_config_rtn: function(pixel_height: Single): nk_font_config; cdecl;
  nk_font_atlas_add: function(p1: Pnk_font_atlas; const p2: Pnk_font_config): Pnk_font; cdecl;
  nk_font_atlas_add_default: function(p1: Pnk_font_atlas; height: Single; const p3: Pnk_font_config): Pnk_font; cdecl;
  nk_font_atlas_add_from_memory: function(atlas: Pnk_font_atlas; memory: Pointer; size: nk_size; height: Single; const config: Pnk_font_config): Pnk_font; cdecl;
  nk_font_atlas_add_from_file: function(atlas: Pnk_font_atlas; const file_path: PUTF8Char; height: Single; const p4: Pnk_font_config): Pnk_font; cdecl;
  nk_font_atlas_add_compressed: function(p1: Pnk_font_atlas; memory: Pointer; size: nk_size; height: Single; const p5: Pnk_font_config): Pnk_font; cdecl;
  nk_font_atlas_add_compressed_base85: function(p1: Pnk_font_atlas; const data: PUTF8Char; height: Single; const config: Pnk_font_config): Pnk_font; cdecl;
  nk_font_atlas_bake: function(p1: Pnk_font_atlas; width: PInteger; height: PInteger; p4: nk_font_atlas_format): Pointer; cdecl;
  nk_font_atlas_end: procedure(p1: Pnk_font_atlas; tex: nk_handle; p3: Pnk_draw_null_texture); cdecl;
  nk_font_find_glyph: function(p1: Pnk_font; unicode: nk_rune): Pnk_font_glyph; cdecl;
  nk_font_atlas_cleanup: procedure(atlas: Pnk_font_atlas); cdecl;
  nk_font_atlas_clear: procedure(p1: Pnk_font_atlas); cdecl;
  nk_buffer_init_default: procedure(p1: Pnk_buffer); cdecl;
  nk_buffer_init: procedure(p1: Pnk_buffer; const p2: Pnk_allocator; size: nk_size); cdecl;
  nk_buffer_init_fixed: procedure(p1: Pnk_buffer; memory: Pointer; size: nk_size); cdecl;
  nk_buffer_info: procedure(p1: Pnk_memory_status; p2: Pnk_buffer); cdecl;
  nk_buffer_push: procedure(p1: Pnk_buffer; type_: nk_buffer_allocation_type; const memory: Pointer; size: nk_size; align: nk_size); cdecl;
  nk_buffer_mark: procedure(p1: Pnk_buffer; type_: nk_buffer_allocation_type); cdecl;
  nk_buffer_reset: procedure(p1: Pnk_buffer; type_: nk_buffer_allocation_type); cdecl;
  nk_buffer_clear: procedure(p1: Pnk_buffer); cdecl;
  nk_buffer_free: procedure(p1: Pnk_buffer); cdecl;
  nk_buffer_memory: function(p1: Pnk_buffer): Pointer; cdecl;
  nk_buffer_memory_const: function(const p1: Pnk_buffer): Pointer; cdecl;
  nk_buffer_total: function(p1: Pnk_buffer): nk_size; cdecl;
  nk_str_init_default: procedure(p1: Pnk_str); cdecl;
  nk_str_init: procedure(p1: Pnk_str; const p2: Pnk_allocator; size: nk_size); cdecl;
  nk_str_init_fixed: procedure(p1: Pnk_str; memory: Pointer; size: nk_size); cdecl;
  nk_str_clear: procedure(p1: Pnk_str); cdecl;
  nk_str_free: procedure(p1: Pnk_str); cdecl;
  nk_str_append_text_char: function(p1: Pnk_str; const p2: PUTF8Char; p3: Integer): Integer; cdecl;
  nk_str_append_str_char: function(p1: Pnk_str; const p2: PUTF8Char): Integer; cdecl;
  nk_str_append_text_utf8: function(p1: Pnk_str; const p2: PUTF8Char; p3: Integer): Integer; cdecl;
  nk_str_append_str_utf8: function(p1: Pnk_str; const p2: PUTF8Char): Integer; cdecl;
  nk_str_append_text_runes: function(p1: Pnk_str; const p2: Pnk_rune; p3: Integer): Integer; cdecl;
  nk_str_append_str_runes: function(p1: Pnk_str; const p2: Pnk_rune): Integer; cdecl;
  nk_str_insert_at_char: function(p1: Pnk_str; pos: Integer; const p3: PUTF8Char; p4: Integer): Integer; cdecl;
  nk_str_insert_at_rune: function(p1: Pnk_str; pos: Integer; const p3: PUTF8Char; p4: Integer): Integer; cdecl;
  nk_str_insert_text_char: function(p1: Pnk_str; pos: Integer; const p3: PUTF8Char; p4: Integer): Integer; cdecl;
  nk_str_insert_str_char: function(p1: Pnk_str; pos: Integer; const p3: PUTF8Char): Integer; cdecl;
  nk_str_insert_text_utf8: function(p1: Pnk_str; pos: Integer; const p3: PUTF8Char; p4: Integer): Integer; cdecl;
  nk_str_insert_str_utf8: function(p1: Pnk_str; pos: Integer; const p3: PUTF8Char): Integer; cdecl;
  nk_str_insert_text_runes: function(p1: Pnk_str; pos: Integer; const p3: Pnk_rune; p4: Integer): Integer; cdecl;
  nk_str_insert_str_runes: function(p1: Pnk_str; pos: Integer; const p3: Pnk_rune): Integer; cdecl;
  nk_str_remove_chars: procedure(p1: Pnk_str; len: Integer); cdecl;
  nk_str_remove_runes: procedure(str: Pnk_str; len: Integer); cdecl;
  nk_str_delete_chars: procedure(p1: Pnk_str; pos: Integer; len: Integer); cdecl;
  nk_str_delete_runes: procedure(p1: Pnk_str; pos: Integer; len: Integer); cdecl;
  nk_str_at_char: function(p1: Pnk_str; pos: Integer): PUTF8Char; cdecl;
  nk_str_at_rune: function(p1: Pnk_str; pos: Integer; unicode: Pnk_rune; len: PInteger): PUTF8Char; cdecl;
  nk_str_rune_at: function(const p1: Pnk_str; pos: Integer): nk_rune; cdecl;
  nk_str_at_char_const: function(const p1: Pnk_str; pos: Integer): PUTF8Char; cdecl;
  nk_str_at_const: function(const p1: Pnk_str; pos: Integer; unicode: Pnk_rune; len: PInteger): PUTF8Char; cdecl;
  nk_str_get: function(p1: Pnk_str): PUTF8Char; cdecl;
  nk_str_get_const: function(const p1: Pnk_str): PUTF8Char; cdecl;
  nk_str_len: function(p1: Pnk_str): Integer; cdecl;
  nk_str_len_char: function(p1: Pnk_str): Integer; cdecl;
  nk_filter_default: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_filter_ascii: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_filter_float: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_filter_decimal: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_filter_hex: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_filter_oct: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_filter_binary: function(const p1: Pnk_text_edit; unicode: nk_rune): nk_bool; cdecl;
  nk_textedit_init_default: procedure(p1: Pnk_text_edit); cdecl;
  nk_textedit_init: procedure(p1: Pnk_text_edit; p2: Pnk_allocator; size: nk_size); cdecl;
  nk_textedit_init_fixed: procedure(p1: Pnk_text_edit; memory: Pointer; size: nk_size); cdecl;
  nk_textedit_free: procedure(p1: Pnk_text_edit); cdecl;
  nk_textedit_text: procedure(p1: Pnk_text_edit; const p2: PUTF8Char; total_len: Integer); cdecl;
  nk_textedit_delete: procedure(p1: Pnk_text_edit; where: Integer; len: Integer); cdecl;
  nk_textedit_delete_selection: procedure(p1: Pnk_text_edit); cdecl;
  nk_textedit_select_all: procedure(p1: Pnk_text_edit); cdecl;
  nk_textedit_cut: function(p1: Pnk_text_edit): nk_bool; cdecl;
  nk_textedit_paste: function(p1: Pnk_text_edit; const p2: PUTF8Char; len: Integer): nk_bool; cdecl;
  nk_textedit_undo: procedure(p1: Pnk_text_edit); cdecl;
  nk_textedit_redo: procedure(p1: Pnk_text_edit); cdecl;
  nk_stroke_line: procedure(b: Pnk_command_buffer; x0: Single; y0: Single; x1: Single; y1: Single; line_thickness: Single; p7: nk_color); cdecl;
  nk_stroke_curve: procedure(p1: Pnk_command_buffer; p2: Single; p3: Single; p4: Single; p5: Single; p6: Single; p7: Single; p8: Single; p9: Single; line_thickness: Single; p11: nk_color); cdecl;
  nk_stroke_rect: procedure(p1: Pnk_command_buffer; p2: nk_rect; rounding: Single; line_thickness: Single; p5: nk_color); cdecl;
  nk_stroke_circle: procedure(p1: Pnk_command_buffer; p2: nk_rect; line_thickness: Single; p4: nk_color); cdecl;
  nk_stroke_arc: procedure(p1: Pnk_command_buffer; cx: Single; cy: Single; radius: Single; a_min: Single; a_max: Single; line_thickness: Single; p8: nk_color); cdecl;
  nk_stroke_triangle: procedure(p1: Pnk_command_buffer; p2: Single; p3: Single; p4: Single; p5: Single; p6: Single; p7: Single; line_thichness: Single; p9: nk_color); cdecl;
  nk_stroke_polyline: procedure(p1: Pnk_command_buffer; points: PSingle; point_count: Integer; line_thickness: Single; col: nk_color); cdecl;
  nk_stroke_polygon: procedure(p1: Pnk_command_buffer; p2: PSingle; point_count: Integer; line_thickness: Single; p5: nk_color); cdecl;
  nk_fill_rect: procedure(p1: Pnk_command_buffer; p2: nk_rect; rounding: Single; p4: nk_color); cdecl;
  nk_fill_rect_multi_color: procedure(p1: Pnk_command_buffer; p2: nk_rect; left: nk_color; top: nk_color; right: nk_color; bottom: nk_color); cdecl;
  nk_fill_circle: procedure(p1: Pnk_command_buffer; p2: nk_rect; p3: nk_color); cdecl;
  nk_fill_arc: procedure(p1: Pnk_command_buffer; cx: Single; cy: Single; radius: Single; a_min: Single; a_max: Single; p7: nk_color); cdecl;
  nk_fill_triangle: procedure(p1: Pnk_command_buffer; x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; p8: nk_color); cdecl;
  nk_fill_polygon: procedure(p1: Pnk_command_buffer; p2: PSingle; point_count: Integer; p4: nk_color); cdecl;
  nk_draw_image: procedure(p1: Pnk_command_buffer; p2: nk_rect; const p3: Pnk_image; p4: nk_color); cdecl;
  nk_draw_nine_slice: procedure(p1: Pnk_command_buffer; p2: nk_rect; const p3: Pnk_nine_slice; p4: nk_color); cdecl;
  nk_draw_text: procedure(p1: Pnk_command_buffer; p2: nk_rect; const text: PUTF8Char; len: Integer; const p5: Pnk_user_font; p6: nk_color; p7: nk_color); cdecl;
  nk_push_scissor: procedure(p1: Pnk_command_buffer; p2: nk_rect); cdecl;
  nk_push_custom: procedure(p1: Pnk_command_buffer; p2: nk_rect; p3: nk_command_custom_callback; usr: nk_handle); cdecl;
  nk_input_has_mouse_click: function(const p1: Pnk_input; p2: nk_buttons): nk_bool; cdecl;
  nk_input_has_mouse_click_in_rect: function(const p1: Pnk_input; p2: nk_buttons; p3: nk_rect): nk_bool; cdecl;
  nk_input_has_mouse_click_in_button_rect: function(const p1: Pnk_input; p2: nk_buttons; p3: nk_rect): nk_bool; cdecl;
  nk_input_has_mouse_click_down_in_rect: function(const p1: Pnk_input; p2: nk_buttons; p3: nk_rect; down: nk_bool): nk_bool; cdecl;
  nk_input_is_mouse_click_in_rect: function(const p1: Pnk_input; p2: nk_buttons; p3: nk_rect): nk_bool; cdecl;
  nk_input_is_mouse_click_down_in_rect: function(const i: Pnk_input; id: nk_buttons; b: nk_rect; down: nk_bool): nk_bool; cdecl;
  nk_input_any_mouse_click_in_rect: function(const p1: Pnk_input; p2: nk_rect): nk_bool; cdecl;
  nk_input_is_mouse_prev_hovering_rect: function(const p1: Pnk_input; p2: nk_rect): nk_bool; cdecl;
  nk_input_is_mouse_hovering_rect: function(const p1: Pnk_input; p2: nk_rect): nk_bool; cdecl;
  nk_input_mouse_clicked: function(const p1: Pnk_input; p2: nk_buttons; p3: nk_rect): nk_bool; cdecl;
  nk_input_is_mouse_down: function(const p1: Pnk_input; p2: nk_buttons): nk_bool; cdecl;
  nk_input_is_mouse_pressed: function(const p1: Pnk_input; p2: nk_buttons): nk_bool; cdecl;
  nk_input_is_mouse_released: function(const p1: Pnk_input; p2: nk_buttons): nk_bool; cdecl;
  nk_input_is_key_pressed: function(const p1: Pnk_input; p2: nk_keys): nk_bool; cdecl;
  nk_input_is_key_released: function(const p1: Pnk_input; p2: nk_keys): nk_bool; cdecl;
  nk_input_is_key_down: function(const p1: Pnk_input; p2: nk_keys): nk_bool; cdecl;
  nk_draw_list_init: procedure(p1: Pnk_draw_list); cdecl;
  nk_draw_list_setup: procedure(p1: Pnk_draw_list; const p2: Pnk_convert_config; cmds: Pnk_buffer; vertices: Pnk_buffer; elements: Pnk_buffer; line_aa: nk_anti_aliasing; shape_aa: nk_anti_aliasing); cdecl;
  nk__draw_list_begin: function(const p1: Pnk_draw_list; const p2: Pnk_buffer): Pnk_draw_command; cdecl;
  nk__draw_list_next: function(const p1: Pnk_draw_command; const p2: Pnk_buffer; const p3: Pnk_draw_list): Pnk_draw_command; cdecl;
  nk__draw_list_end: function(const p1: Pnk_draw_list; const p2: Pnk_buffer): Pnk_draw_command; cdecl;
  nk_draw_list_path_clear: procedure(p1: Pnk_draw_list); cdecl;
  nk_draw_list_path_line_to: procedure(p1: Pnk_draw_list; pos: nk_vec2); cdecl;
  nk_draw_list_path_arc_to_fast: procedure(p1: Pnk_draw_list; center: nk_vec2; radius: Single; a_min: Integer; a_max: Integer); cdecl;
  nk_draw_list_path_arc_to: procedure(p1: Pnk_draw_list; center: nk_vec2; radius: Single; a_min: Single; a_max: Single; segments: Cardinal); cdecl;
  nk_draw_list_path_rect_to: procedure(p1: Pnk_draw_list; a: nk_vec2; b: nk_vec2; rounding: Single); cdecl;
  nk_draw_list_path_curve_to: procedure(p1: Pnk_draw_list; p2: nk_vec2; p3: nk_vec2; p4: nk_vec2; num_segments: Cardinal); cdecl;
  nk_draw_list_path_fill: procedure(p1: Pnk_draw_list; p2: nk_color); cdecl;
  nk_draw_list_path_stroke: procedure(p1: Pnk_draw_list; p2: nk_color; closed: nk_draw_list_stroke; thickness: Single); cdecl;
  nk_draw_list_stroke_line: procedure(p1: Pnk_draw_list; a: nk_vec2; b: nk_vec2; p4: nk_color; thickness: Single); cdecl;
  nk_draw_list_stroke_rect: procedure(p1: Pnk_draw_list; rect: nk_rect; p3: nk_color; rounding: Single; thickness: Single); cdecl;
  nk_draw_list_stroke_triangle: procedure(p1: Pnk_draw_list; a: nk_vec2; b: nk_vec2; c: nk_vec2; p5: nk_color; thickness: Single); cdecl;
  nk_draw_list_stroke_circle: procedure(p1: Pnk_draw_list; center: nk_vec2; radius: Single; p4: nk_color; segs: Cardinal; thickness: Single); cdecl;
  nk_draw_list_stroke_curve: procedure(draw_list: Pnk_draw_list; p0: nk_vec2; cp0: nk_vec2; cp1: nk_vec2; p1: nk_vec2; p6: nk_color; segments: Cardinal; thickness: Single); cdecl;
  nk_draw_list_stroke_poly_line: procedure(p1: Pnk_draw_list; const pnts: Pnk_vec2; const cnt: Cardinal; p4: nk_color; p5: nk_draw_list_stroke; thickness: Single; p7: nk_anti_aliasing); cdecl;
  nk_draw_list_fill_rect: procedure(p1: Pnk_draw_list; rect: nk_rect; p3: nk_color; rounding: Single); cdecl;
  nk_draw_list_fill_rect_multi_color: procedure(p1: Pnk_draw_list; rect: nk_rect; left: nk_color; top: nk_color; right: nk_color; bottom: nk_color); cdecl;
  nk_draw_list_fill_triangle: procedure(p1: Pnk_draw_list; a: nk_vec2; b: nk_vec2; c: nk_vec2; p5: nk_color); cdecl;
  nk_draw_list_fill_circle: procedure(p1: Pnk_draw_list; center: nk_vec2; radius: Single; col: nk_color; segs: Cardinal); cdecl;
  nk_draw_list_fill_poly_convex: procedure(p1: Pnk_draw_list; const points: Pnk_vec2; const count: Cardinal; p4: nk_color; p5: nk_anti_aliasing); cdecl;
  nk_draw_list_add_image: procedure(p1: Pnk_draw_list; texture: nk_image; rect: nk_rect; p4: nk_color); cdecl;
  nk_draw_list_add_text: procedure(p1: Pnk_draw_list; const p2: Pnk_user_font; p3: nk_rect; const text: PUTF8Char; len: Integer; font_height: Single; p7: nk_color); cdecl;
  nk_style_item_color_rtn: function(p1: nk_color): nk_style_item; cdecl;
  nk_style_item_image_rtn: function(img: nk_image): nk_style_item; cdecl;
  nk_style_item_nine_slice_rtn: function(slice: nk_nine_slice): nk_style_item; cdecl;
  nk_style_item_hide: function(): nk_style_item; cdecl;
  nk_sdl_init: function(win: PSDL_Window; renderer: PSDL_Renderer): Pnk_context; cdecl;
  nk_sdl_font_stash_begin: procedure(atlas: PPnk_font_atlas); cdecl;
  nk_sdl_font_stash_end: procedure(); cdecl;
  nk_sdl_handle_event: function(evt: PSDL_Event): Integer; cdecl;
  nk_sdl_render: procedure(p1: nk_anti_aliasing); cdecl;
  nk_sdl_shutdown: procedure(); cdecl;
//DOM-IGNORE-END

{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.MemoryModule '}
//DOM-IGNORE-BEGIN
type
  TMemoryModule = Pointer;

function  MemoryLoadLibary(Data: Pointer): TMemoryModule; stdcall;
function  MemoryGetProcAddress(Module: TMemoryModule; const Name: PAnsiChar): Pointer; stdcall;
procedure MemoryFreeLibrary(Module: TMemoryModule); stdcall;
//DOM-IGNORE-END

{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.EncryptedZipFile '}
//DOM-IGNORE-BEGIN
type
  EZipInvalidOperation = class(EZipException);
  EZipPasswordException = class(EZipException);
  EZipNoPassword = class(EZipPasswordException);
  EZipInvalidPassword = class(EZipPasswordException);

type
  TEncryptedZipFile = class(TZipFile)
  strict private
    class constructor Create;
  private
    FPassword: string;
  public
    constructor Create(const aPassword: string);
    class function HasPassword(const aZipFile: TZipFile): Boolean;
    property Password: string read FPassword write FPassword;
  end;
//DOM-IGNORE-END

{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.SpeechLib '}
//DOM-IGNORE-BEGIN
const
  SpeechLibMajorVersion = 5;
  SpeechLibMinorVersion = 4;

  LIBID_SpeechLib: TGUID = '{C866CA3A-32F7-11D2-9602-00C04F8EE628}';

  IID_ISpeechDataKey: TGUID = '{CE17C09B-4EFA-44D5-A4C9-59D9585AB0CD}';
  IID_ISpeechObjectToken: TGUID = '{C74A3ADC-B727-4500-A84A-B526721C8B8C}';
  IID_ISpeechObjectTokenCategory: TGUID = '{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}';
  IID_ISpeechObjectTokens: TGUID = '{9285B776-2E7B-4BC0-B53E-580EB6FA967F}';
  IID_ISpeechAudioBufferInfo: TGUID = '{11B103D8-1142-4EDF-A093-82FB3915F8CC}';
  IID_ISpeechAudioStatus: TGUID = '{C62D9C91-7458-47F6-862D-1EF86FB0B278}';
  IID_ISpeechAudioFormat: TGUID = '{E6E9C590-3E18-40E3-8299-061F98BDE7C7}';
  IID_ISpeechWaveFormatEx: TGUID = '{7A1EF0D5-1581-4741-88E4-209A49F11A10}';
  IID_ISpeechBaseStream: TGUID = '{6450336F-7D49-4CED-8097-49D6DEE37294}';
  IID_ISpeechFileStream: TGUID = '{AF67F125-AB39-4E93-B4A2-CC2E66E182A7}';
  IID_ISpeechMemoryStream: TGUID = '{EEB14B68-808B-4ABE-A5EA-B51DA7588008}';
  IID_ISpeechCustomStream: TGUID = '{1A9E9F4F-104F-4DB8-A115-EFD7FD0C97AE}';
  IID_ISpeechAudio: TGUID = '{CFF8E175-019E-11D3-A08E-00C04F8EF9B5}';
  IID_ISpeechMMSysAudio: TGUID = '{3C76AF6D-1FD7-4831-81D1-3B71D5A13C44}';
  IID_ISpeechVoice: TGUID = '{269316D8-57BD-11D2-9EEE-00C04F797396}';
  IID_ISpeechVoiceStatus: TGUID = '{8BE47B07-57F6-11D2-9EEE-00C04F797396}';
  DIID__ISpeechVoiceEvents: TGUID = '{A372ACD1-3BEF-4BBD-8FFB-CB3E2B416AF8}';
  IID_ISpeechRecognizer: TGUID = '{2D5F1C0C-BD75-4B08-9478-3B11FEA2586C}';
  IID_ISpeechRecognizerStatus: TGUID = '{BFF9E781-53EC-484E-BB8A-0E1B5551E35C}';
  IID_ISpeechRecoContext: TGUID = '{580AA49D-7E1E-4809-B8E2-57DA806104B8}';
  IID_ISpeechRecoGrammar: TGUID = '{B6D6F79F-2158-4E50-B5BC-9A9CCD852A09}';
  IID_ISpeechGrammarRules: TGUID = '{6FFA3B44-FC2D-40D1-8AFC-32911C7F1AD1}';
  IID_ISpeechGrammarRule: TGUID = '{AFE719CF-5DD1-44F2-999C-7A399F1CFCCC}';
  IID_ISpeechGrammarRuleState: TGUID = '{D4286F2C-EE67-45AE-B928-28D695362EDA}';
  IID_ISpeechGrammarRuleStateTransitions: TGUID = '{EABCE657-75BC-44A2-AA7F-C56476742963}';
  IID_ISpeechGrammarRuleStateTransition: TGUID = '{CAFD1DB1-41D1-4A06-9863-E2E81DA17A9A}';
  IID_ISpeechTextSelectionInformation: TGUID = '{3B9C7E7A-6EEE-4DED-9092-11657279ADBE}';
  IID_ISpeechRecoResult: TGUID = '{ED2879CF-CED9-4EE6-A534-DE0191D5468D}';
  IID_ISpeechRecoResultTimes: TGUID = '{62B3B8FB-F6E7-41BE-BDCB-056B1C29EFC0}';
  IID_ISpeechPhraseInfo: TGUID = '{961559CF-4E67-4662-8BF0-D93F1FCD61B3}';
  IID_ISpeechPhraseRule: TGUID = '{A7BFE112-A4A0-48D9-B602-C313843F6964}';
  IID_ISpeechPhraseRules: TGUID = '{9047D593-01DD-4B72-81A3-E4A0CA69F407}';
  IID_ISpeechPhraseProperties: TGUID = '{08166B47-102E-4B23-A599-BDB98DBFD1F4}';
  IID_ISpeechPhraseProperty: TGUID = '{CE563D48-961E-4732-A2E1-378A42B430BE}';
  IID_ISpeechPhraseElements: TGUID = '{0626B328-3478-467D-A0B3-D0853B93DDA3}';
  IID_ISpeechPhraseElement: TGUID = '{E6176F96-E373-4801-B223-3B62C068C0B4}';
  IID_ISpeechPhraseReplacements: TGUID = '{38BC662F-2257-4525-959E-2069D2596C05}';
  IID_ISpeechPhraseReplacement: TGUID = '{2890A410-53A7-4FB5-94EC-06D4998E3D02}';
  IID_ISpeechPhraseAlternates: TGUID = '{B238B6D5-F276-4C3D-A6C1-2974801C3CC2}';
  IID_ISpeechPhraseAlternate: TGUID = '{27864A2A-2B9F-4CB8-92D3-0D2722FD1E73}';
  DIID__ISpeechRecoContextEvents: TGUID = '{7B8FCB42-0E9D-4F00-A048-7B04D6179D3D}';
  IID_ISpeechRecoResult2: TGUID = '{8E0A246D-D3C8-45DE-8657-04290C458C3C}';
  IID_ISpeechLexicon: TGUID = '{3DA7627A-C7AE-4B23-8708-638C50362C25}';
  IID_ISpeechLexiconWords: TGUID = '{8D199862-415E-47D5-AC4F-FAA608B424E6}';
  IID_ISpeechLexiconWord: TGUID = '{4E5B933C-C9BE-48ED-8842-1EE51BB1D4FF}';
  IID_ISpeechLexiconPronunciations: TGUID = '{72829128-5682-4704-A0D4-3E2BB6F2EAD3}';
  IID_ISpeechLexiconPronunciation: TGUID = '{95252C5D-9E43-4F4A-9899-48EE73352F9F}';
  IID_ISpeechXMLRecoResult: TGUID = '{AAEC54AF-8F85-4924-944D-B79D39D72E19}';
  IID_ISpeechRecoResultDispatch: TGUID = '{6D60EB64-ACED-40A6-BBF3-4E557F71DEE2}';
  IID_ISpeechPhraseInfoBuilder: TGUID = '{3B151836-DF3A-4E0A-846C-D2ADC9334333}';
  IID_ISpeechPhoneConverter: TGUID = '{C3E4F353-433F-43D6-89A1-6A62A7054C3D}';
  IID_ISpNotifySink: TGUID = '{259684DC-37C3-11D2-9603-00C04F8EE628}';
  IID_ISpNotifyTranslator: TGUID = '{ACA16614-5D3D-11D2-960E-00C04F8EE628}';
  CLASS_SpNotifyTranslator: TGUID = '{E2AE5372-5D40-11D2-960E-00C04F8EE628}';
  IID_ISpDataKey: TGUID = '{14056581-E16C-11D2-BB90-00C04F8EE6C0}';
  IID_ISpObjectTokenCategory: TGUID = '{2D3D3845-39AF-4850-BBF9-40B49780011D}';
  CLASS_SpObjectTokenCategory: TGUID = '{A910187F-0C7A-45AC-92CC-59EDAFB77B53}';
  IID_IEnumSpObjectTokens: TGUID = '{06B64F9E-7FDA-11D2-B4F2-00C04F797396}';
  IID_ISpObjectToken: TGUID = '{14056589-E16C-11D2-BB90-00C04F8EE6C0}';
  CLASS_SpObjectToken: TGUID = '{EF411752-3736-4CB4-9C8C-8EF4CCB58EFE}';
  IID_IServiceProvider: TGUID = '{6D5140C1-7436-11CE-8034-00AA006009FA}';
  IID_ISpResourceManager: TGUID = '{93384E18-5014-43D5-ADBB-A78E055926BD}';
  CLASS_SpResourceManager: TGUID = '{96749373-3391-11D2-9EE3-00C04F797396}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IStream: TGUID = '{0000000C-0000-0000-C000-000000000046}';
  IID_ISpStreamFormat: TGUID = '{BED530BE-2606-4F4D-A1C0-54C5CDA5566F}';
  IID_ISpStreamFormatConverter: TGUID = '{678A932C-EA71-4446-9B41-78FDA6280A29}';
  CLASS_SpStreamFormatConverter: TGUID = '{7013943A-E2EC-11D2-A086-00C04F8EF9B5}';
  CLASS_SpMMAudioEnum: TGUID = '{AB1890A0-E91F-11D2-BB91-00C04F8EE6C0}';
  IID_ISpNotifySource: TGUID = '{5EFF4AEF-8487-11D2-961C-00C04F8EE628}';
  IID_ISpEventSource: TGUID = '{BE7A9CCE-5F9E-11D2-960F-00C04F8EE628}';
  IID_ISpEventSink: TGUID = '{BE7A9CC9-5F9E-11D2-960F-00C04F8EE628}';
  IID_ISpObjectWithToken: TGUID = '{5B559F40-E952-11D2-BB91-00C04F8EE6C0}';
  IID_ISpAudio: TGUID = '{C05C768F-FAE8-4EC2-8E07-338321C12452}';
  IID_ISpMMSysAudio: TGUID = '{15806F6E-1D70-4B48-98E6-3B1A007509AB}';
  CLASS_SpMMAudioIn: TGUID = '{CF3D2E50-53F2-11D2-960C-00C04F8EE628}';
  CLASS_SpMMAudioOut: TGUID = '{A8C680EB-3D32-11D2-9EE7-00C04F797396}';
  IID_ISpStream: TGUID = '{12E3CCA9-7518-44C5-A5E7-BA5A79CB929E}';
  CLASS_SpStream: TGUID = '{715D9C59-4442-11D2-9605-00C04F8EE628}';
  IID_ISpVoice: TGUID = '{6C44DF74-72B9-4992-A1EC-EF996E0422D4}';
  IID_ISpPhoneticAlphabetSelection: TGUID = '{B2745EFD-42CE-48CA-81F1-A96E02538A90}';
  CLASS_SpVoice: TGUID = '{96749377-3391-11D2-9EE3-00C04F797396}';
  IID_ISpRecoContext: TGUID = '{F740A62F-7C15-489E-8234-940A33D9272D}';
  IID_ISpRecoContext2: TGUID = '{BEAD311C-52FF-437F-9464-6B21054CA73D}';
  IID_ISpProperties: TGUID = '{5B4FB971-B115-4DE1-AD97-E482E3BF6EE4}';
  IID_ISpRecognizer: TGUID = '{C2B5F241-DAA0-4507-9E16-5A1EAA2B7A5C}';
  IID_ISpPhrase: TGUID = '{1A5C0354-B621-4B5A-8791-D306ED379E53}';
  IID_ISpGrammarBuilder: TGUID = '{8137828F-591A-4A42-BE58-49EA7EBAAC68}';
  IID_ISpRecoGrammar: TGUID = '{2177DB29-7F45-47D0-8554-067E91C80502}';
  IID_ISpRecoResult: TGUID = '{20B053BE-E235-43CD-9A2A-8D17A48B7842}';
  IID_ISpPhraseAlt: TGUID = '{8FCEBC98-4E49-4067-9C6C-D86A0E092E3D}';
  CLASS_SpSharedRecoContext: TGUID = '{47206204-5ECA-11D2-960F-00C04F8EE628}';
  IID_ISpRecognizer2: TGUID = '{8FC6D974-C81E-4098-93C5-0147F61ED4D3}';
  IID_ISpRecognizer3: TGUID = '{DF1B943C-5838-4AA2-8706-D7CD5B333499}';
  IID_ISpSerializeState: TGUID = '{21B501A0-0EC7-46C9-92C3-A2BC784C54B9}';
  IID_ISpRecoCategory: TGUID = '{DA0CD0F9-14A2-4F09-8C2A-85CC48979345}';
  CLASS_SpInprocRecognizer: TGUID = '{41B89B6B-9399-11D2-9623-00C04F8EE628}';
  CLASS_SpSharedRecognizer: TGUID = '{3BEE4890-4FE9-4A37-8C1E-5E7E12791C1F}';
  IID_ISpLexicon: TGUID = '{DA41A7C2-5383-4DB2-916B-6C1719E3DB58}';
  CLASS_SpLexicon: TGUID = '{0655E396-25D0-11D3-9C26-00C04F8EF87C}';
  CLASS_SpUnCompressedLexicon: TGUID = '{C9E37C15-DF92-4727-85D6-72E5EEB6995A}';
  CLASS_SpCompressedLexicon: TGUID = '{90903716-2F42-11D3-9C26-00C04F8EF87C}';
  IID_ISpShortcut: TGUID = '{3DF681E2-EA56-11D9-8BDE-F66BAD1E3F3A}';
  CLASS_SpShortcut: TGUID = '{0D722F1A-9FCF-4E62-96D8-6DF8F01A26AA}';
  IID_ISpPhoneConverter: TGUID = '{8445C581-0CAC-4A38-ABFE-9B2CE2826455}';
  CLASS_SpPhoneConverter: TGUID = '{9185F743-1143-4C28-86B5-BFF14F20E5C8}';
  IID_ISpPhoneticAlphabetConverter: TGUID = '{133ADCD4-19B4-4020-9FDC-842E78253B17}';
  CLASS_SpPhoneticAlphabetConverter: TGUID = '{4F414126-DFE3-4629-99EE-797978317EAD}';
  CLASS_SpNullPhoneConverter: TGUID = '{455F24E9-7396-4A16-9715-7C0FDBE3EFE3}';
  CLASS_SpTextSelectionInformation: TGUID = '{0F92030A-CBFD-4AB8-A164-FF5985547FF6}';
  CLASS_SpPhraseInfoBuilder: TGUID = '{C23FC28D-C55F-4720-8B32-91F73C2BD5D1}';
  CLASS_SpAudioFormat: TGUID = '{9EF96870-E160-4792-820D-48CF0649E4EC}';
  CLASS_SpWaveFormatEx: TGUID = '{C79A574C-63BE-44B9-801F-283F87F898BE}';
  CLASS_SpInProcRecoContext: TGUID = '{73AD6842-ACE0-45E8-A4DD-8795881A2C2A}';
  CLASS_SpCustomStream: TGUID = '{8DBEF13F-1948-4AA8-8CF0-048EEBED95D8}';
  CLASS_SpFileStream: TGUID = '{947812B3-2AE1-4644-BA86-9E90DED7EC91}';
  CLASS_SpMemoryStream: TGUID = '{5FB7EF7D-DFF4-468A-B6B7-2FCBD188F994}';
  IID_ISpXMLRecoResult: TGUID = '{AE39362B-45A8-4074-9B9E-CCF49AA2D0B6}';
  IID_ISpRecoGrammar2: TGUID = '{4B37BC9E-9ED6-44A3-93D3-18F022B79EC3}';
  IID_ISpeechResourceLoader: TGUID = '{B9AC5783-FCD0-4B21-B119-B4F8DA8FD2C3}';
  IID_IInternetSecurityManager: TGUID = '{79EAC9EE-BAF9-11CE-8C82-00AA004BA90B}';
  IID_IInternetSecurityMgrSite: TGUID = '{79EAC9ED-BAF9-11CE-8C82-00AA004BA90B}';
  IID_IEnumString: TGUID = '{00000101-0000-0000-C000-000000000046}';

type
  SpeechDataKeyLocation = TOleEnum;

const
  SDKLDefaultLocation = $00000000;
  SDKLCurrentUser = $00000001;
  SDKLLocalMachine = $00000002;
  SDKLCurrentConfig = $00000005;

type
  SpeechTokenContext = TOleEnum;

const
  STCInprocServer = $00000001;
  STCInprocHandler = $00000002;
  STCLocalServer = $00000004;
  STCRemoteServer = $00000010;
  STCAll = $00000017;

type
  SpeechTokenShellFolder = TOleEnum;

const
  STSF_AppData = $0000001A;
  STSF_LocalAppData = $0000001C;
  STSF_CommonAppData = $00000023;
  STSF_FlagCreate = $00008000;

type
  SpeechAudioState = TOleEnum;

const
  SASClosed = $00000000;
  SASStop = $00000001;
  SASPause = $00000002;
  SASRun = $00000003;

type
  SpeechAudioFormatType = TOleEnum;

const
  SAFTDefault = $FFFFFFFF;
  SAFTNoAssignedFormat = $00000000;
  SAFTText = $00000001;
  SAFTNonStandardFormat = $00000002;
  SAFTExtendedAudioFormat = $00000003;
  SAFT8kHz8BitMono = $00000004;
  SAFT8kHz8BitStereo = $00000005;
  SAFT8kHz16BitMono = $00000006;
  SAFT8kHz16BitStereo = $00000007;
  SAFT11kHz8BitMono = $00000008;
  SAFT11kHz8BitStereo = $00000009;
  SAFT11kHz16BitMono = $0000000A;
  SAFT11kHz16BitStereo = $0000000B;
  SAFT12kHz8BitMono = $0000000C;
  SAFT12kHz8BitStereo = $0000000D;
  SAFT12kHz16BitMono = $0000000E;
  SAFT12kHz16BitStereo = $0000000F;
  SAFT16kHz8BitMono = $00000010;
  SAFT16kHz8BitStereo = $00000011;
  SAFT16kHz16BitMono = $00000012;
  SAFT16kHz16BitStereo = $00000013;
  SAFT22kHz8BitMono = $00000014;
  SAFT22kHz8BitStereo = $00000015;
  SAFT22kHz16BitMono = $00000016;
  SAFT22kHz16BitStereo = $00000017;
  SAFT24kHz8BitMono = $00000018;
  SAFT24kHz8BitStereo = $00000019;
  SAFT24kHz16BitMono = $0000001A;
  SAFT24kHz16BitStereo = $0000001B;
  SAFT32kHz8BitMono = $0000001C;
  SAFT32kHz8BitStereo = $0000001D;
  SAFT32kHz16BitMono = $0000001E;
  SAFT32kHz16BitStereo = $0000001F;
  SAFT44kHz8BitMono = $00000020;
  SAFT44kHz8BitStereo = $00000021;
  SAFT44kHz16BitMono = $00000022;
  SAFT44kHz16BitStereo = $00000023;
  SAFT48kHz8BitMono = $00000024;
  SAFT48kHz8BitStereo = $00000025;
  SAFT48kHz16BitMono = $00000026;
  SAFT48kHz16BitStereo = $00000027;
  SAFTTrueSpeech_8kHz1BitMono = $00000028;
  SAFTCCITT_ALaw_8kHzMono = $00000029;
  SAFTCCITT_ALaw_8kHzStereo = $0000002A;
  SAFTCCITT_ALaw_11kHzMono = $0000002B;
  SAFTCCITT_ALaw_11kHzStereo = $0000002C;
  SAFTCCITT_ALaw_22kHzMono = $0000002D;
  SAFTCCITT_ALaw_22kHzStereo = $0000002E;
  SAFTCCITT_ALaw_44kHzMono = $0000002F;
  SAFTCCITT_ALaw_44kHzStereo = $00000030;
  SAFTCCITT_uLaw_8kHzMono = $00000031;
  SAFTCCITT_uLaw_8kHzStereo = $00000032;
  SAFTCCITT_uLaw_11kHzMono = $00000033;
  SAFTCCITT_uLaw_11kHzStereo = $00000034;
  SAFTCCITT_uLaw_22kHzMono = $00000035;
  SAFTCCITT_uLaw_22kHzStereo = $00000036;
  SAFTCCITT_uLaw_44kHzMono = $00000037;
  SAFTCCITT_uLaw_44kHzStereo = $00000038;
  SAFTADPCM_8kHzMono = $00000039;
  SAFTADPCM_8kHzStereo = $0000003A;
  SAFTADPCM_11kHzMono = $0000003B;
  SAFTADPCM_11kHzStereo = $0000003C;
  SAFTADPCM_22kHzMono = $0000003D;
  SAFTADPCM_22kHzStereo = $0000003E;
  SAFTADPCM_44kHzMono = $0000003F;
  SAFTADPCM_44kHzStereo = $00000040;
  SAFTGSM610_8kHzMono = $00000041;
  SAFTGSM610_11kHzMono = $00000042;
  SAFTGSM610_22kHzMono = $00000043;
  SAFTGSM610_44kHzMono = $00000044;

type
  SpeechStreamSeekPositionType = TOleEnum;

const
  SSSPTRelativeToStart = $00000000;
  SSSPTRelativeToCurrentPosition = $00000001;
  SSSPTRelativeToEnd = $00000002;

type
  SpeechStreamFileMode = TOleEnum;

const
  SSFMOpenForRead = $00000000;
  SSFMOpenReadWrite = $00000001;
  SSFMCreate = $00000002;
  SSFMCreateForWrite = $00000003;

type
  SpeechRunState = TOleEnum;

const
  SRSEDone = $00000001;
  SRSEIsSpeaking = $00000002;

type
  SpeechVoiceEvents = TOleEnum;

const
  SVEStartInputStream = $00000002;
  SVEEndInputStream = $00000004;
  SVEVoiceChange = $00000008;
  SVEBookmark = $00000010;
  SVEWordBoundary = $00000020;
  SVEPhoneme = $00000040;
  SVESentenceBoundary = $00000080;
  SVEViseme = $00000100;
  SVEAudioLevel = $00000200;
  SVEPrivate = $00008000;
  SVEAllEvents = $000083FE;

type
  SpeechVoicePriority = TOleEnum;

const
  SVPNormal = $00000000;
  SVPAlert = $00000001;
  SVPOver = $00000002;

type
  SpeechVoiceSpeakFlags = TOleEnum;

const
  SVSFDefault = $00000000;
  SVSFlagsAsync = $00000001;
  SVSFPurgeBeforeSpeak = $00000002;
  SVSFIsFilename = $00000004;
  SVSFIsXML = $00000008;
  SVSFIsNotXML = $00000010;
  SVSFPersistXML = $00000020;
  SVSFNLPSpeakPunc = $00000040;
  SVSFParseSapi = $00000080;
  SVSFParseSsml = $00000100;
  SVSFParseAutodetect = $00000000;
  SVSFNLPMask = $00000040;
  SVSFParseMask = $00000180;
  SVSFVoiceMask = $000001FF;
  SVSFUnusedFlags = $FFFFFE00;

type
  SpeechVisemeFeature = TOleEnum;

const
  SVF_None = $00000000;
  SVF_Stressed = $00000001;
  SVF_Emphasis = $00000002;

type
  SpeechVisemeType = TOleEnum;

const
  SVP_0 = $00000000;
  SVP_1 = $00000001;
  SVP_2 = $00000002;
  SVP_3 = $00000003;
  SVP_4 = $00000004;
  SVP_5 = $00000005;
  SVP_6 = $00000006;
  SVP_7 = $00000007;
  SVP_8 = $00000008;
  SVP_9 = $00000009;
  SVP_10 = $0000000A;
  SVP_11 = $0000000B;
  SVP_12 = $0000000C;
  SVP_13 = $0000000D;
  SVP_14 = $0000000E;
  SVP_15 = $0000000F;
  SVP_16 = $00000010;
  SVP_17 = $00000011;
  SVP_18 = $00000012;
  SVP_19 = $00000013;
  SVP_20 = $00000014;
  SVP_21 = $00000015;

type
  SpeechRecognizerState = TOleEnum;

const
  SRSInactive = $00000000;
  SRSActive = $00000001;
  SRSActiveAlways = $00000002;
  SRSInactiveWithPurge = $00000003;

type
  SpeechInterference = TOleEnum;

const
  SINone = $00000000;
  SINoise = $00000001;
  SINoSignal = $00000002;
  SITooLoud = $00000003;
  SITooQuiet = $00000004;
  SITooFast = $00000005;
  SITooSlow = $00000006;

type
  SpeechRecoEvents = TOleEnum;

const
  SREStreamEnd = $00000001;
  SRESoundStart = $00000002;
  SRESoundEnd = $00000004;
  SREPhraseStart = $00000008;
  SRERecognition = $00000010;
  SREHypothesis = $00000020;
  SREBookmark = $00000040;
  SREPropertyNumChange = $00000080;
  SREPropertyStringChange = $00000100;
  SREFalseRecognition = $00000200;
  SREInterference = $00000400;
  SRERequestUI = $00000800;
  SREStateChange = $00001000;
  SREAdaptation = $00002000;
  SREStreamStart = $00004000;
  SRERecoOtherContext = $00008000;
  SREAudioLevel = $00010000;
  SREPrivate = $00040000;
  SREAllEvents = $0005FFFF;

type
  SpeechRecoContextState = TOleEnum;

const
  SRCS_Disabled = $00000000;
  SRCS_Enabled = $00000001;

type
  SpeechRetainedAudioOptions = TOleEnum;

const
  SRAONone = $00000000;
  SRAORetainAudio = $00000001;

type
  SpeechGrammarState = TOleEnum;

const
  SGSEnabled = $00000001;
  SGSDisabled = $00000000;
  SGSExclusive = $00000003;

type
  SpeechRuleAttributes = TOleEnum;

const
  SRATopLevel = $00000001;
  SRADefaultToActive = $00000002;
  SRAExport = $00000004;
  SRAImport = $00000008;
  SRAInterpreter = $00000010;
  SRADynamic = $00000020;
  SRARoot = $00000040;

type
  SpeechGrammarRuleStateTransitionType = TOleEnum;

const
  SGRSTTEpsilon = $00000000;
  SGRSTTWord = $00000001;
  SGRSTTRule = $00000002;
  SGRSTTDictation = $00000003;
  SGRSTTWildcard = $00000004;
  SGRSTTTextBuffer = $00000005;

type
  SpeechGrammarWordType = TOleEnum;

const
  SGDisplay = $00000000;
  SGLexical = $00000001;
  SGPronounciation = $00000002;
  SGLexicalNoSpecialChars = $00000003;

type
  SpeechSpecialTransitionType = TOleEnum;

const
  SSTTWildcard = $00000001;
  SSTTDictation = $00000002;
  SSTTTextBuffer = $00000003;

type
  SpeechLoadOption = TOleEnum;

const
  SLOStatic = $00000000;
  SLODynamic = $00000001;

type
  SpeechRuleState = TOleEnum;

const
  SGDSInactive = $00000000;
  SGDSActive = $00000001;
  SGDSActiveWithAutoPause = $00000003;
  SGDSActiveUserDelimited = $00000004;

type
  SpeechWordPronounceable = TOleEnum;

const
  SWPUnknownWordUnpronounceable = $00000000;
  SWPUnknownWordPronounceable = $00000001;
  SWPKnownWordPronounceable = $00000002;

type
  SpeechEngineConfidence = TOleEnum;

const
  SECLowConfidence = $FFFFFFFF;
  SECNormalConfidence = $00000000;
  SECHighConfidence = $00000001;

type
  SpeechDisplayAttributes = TOleEnum;

const
  SDA_No_Trailing_Space = $00000000;
  SDA_One_Trailing_Space = $00000002;
  SDA_Two_Trailing_Spaces = $00000004;
  SDA_Consume_Leading_Spaces = $00000008;

type
  SpeechDiscardType = TOleEnum;

const
  SDTProperty = $00000001;
  SDTReplacement = $00000002;
  SDTRule = $00000004;
  SDTDisplayText = $00000008;
  SDTLexicalForm = $00000010;
  SDTPronunciation = $00000020;
  SDTAudio = $00000040;
  SDTAlternates = $00000080;
  SDTAll = $000000FF;

type
  SpeechBookmarkOptions = TOleEnum;

const
  SBONone = $00000000;
  SBOPause = $00000001;

type
  SpeechFormatType = TOleEnum;

const
  SFTInput = $00000000;
  SFTSREngine = $00000001;

type
  SpeechRecognitionType = TOleEnum;

const
  SRTStandard = $00000000;
  SRTAutopause = $00000001;
  SRTEmulated = $00000002;
  SRTSMLTimeout = $00000004;
  SRTExtendableParse = $00000008;
  SRTReSent = $00000010;

type
  SpeechLexiconType = TOleEnum;

const
  SLTUser = $00000001;
  SLTApp = $00000002;

type
  SpeechWordType = TOleEnum;

const
  SWTAdded = $00000001;
  SWTDeleted = $00000002;

type
  SpeechPartOfSpeech = TOleEnum;

const
  SPSNotOverriden = $FFFFFFFF;
  SPSUnknown = $00000000;
  SPSNoun = $00001000;
  SPSVerb = $00002000;
  SPSModifier = $00003000;
  SPSFunction = $00004000;
  SPSInterjection = $00005000;
  SPSLMA = $00007000;
  SPSSuppressWord = $0000F000;

type
  DISPID_SpeechDataKey = TOleEnum;

const
  DISPID_SDKSetBinaryValue = $00000001;
  DISPID_SDKGetBinaryValue = $00000002;
  DISPID_SDKSetStringValue = $00000003;
  DISPID_SDKGetStringValue = $00000004;
  DISPID_SDKSetLongValue = $00000005;
  DISPID_SDKGetlongValue = $00000006;
  DISPID_SDKOpenKey = $00000007;
  DISPID_SDKCreateKey = $00000008;
  DISPID_SDKDeleteKey = $00000009;
  DISPID_SDKDeleteValue = $0000000A;
  DISPID_SDKEnumKeys = $0000000B;
  DISPID_SDKEnumValues = $0000000C;

type
  DISPID_SpeechObjectToken = TOleEnum;

const
  DISPID_SOTId = $00000001;
  DISPID_SOTDataKey = $00000002;
  DISPID_SOTCategory = $00000003;
  DISPID_SOTGetDescription = $00000004;
  DISPID_SOTSetId = $00000005;
  DISPID_SOTGetAttribute = $00000006;
  DISPID_SOTCreateInstance = $00000007;
  DISPID_SOTRemove = $00000008;
  DISPID_SOTGetStorageFileName = $00000009;
  DISPID_SOTRemoveStorageFileName = $0000000A;
  DISPID_SOTIsUISupported = $0000000B;
  DISPID_SOTDisplayUI = $0000000C;
  DISPID_SOTMatchesAttributes = $0000000D;

type
  DISPID_SpeechObjectTokens = TOleEnum;

const
  DISPID_SOTsCount = $00000001;
  DISPID_SOTsItem = $00000000;
  DISPID_SOTs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechObjectTokenCategory = TOleEnum;

const
  DISPID_SOTCId = $00000001;
  DISPID_SOTCDefault = $00000002;
  DISPID_SOTCSetId = $00000003;
  DISPID_SOTCGetDataKey = $00000004;
  DISPID_SOTCEnumerateTokens = $00000005;

type
  DISPID_SpeechAudioFormat = TOleEnum;

const
  DISPID_SAFType = $00000001;
  DISPID_SAFGuid = $00000002;
  DISPID_SAFGetWaveFormatEx = $00000003;
  DISPID_SAFSetWaveFormatEx = $00000004;

type
  DISPID_SpeechBaseStream = TOleEnum;

const
  DISPID_SBSFormat = $00000001;
  DISPID_SBSRead = $00000002;
  DISPID_SBSWrite = $00000003;
  DISPID_SBSSeek = $00000004;

type
  DISPID_SpeechAudio = TOleEnum;

const
  DISPID_SAStatus = $000000C8;
  DISPID_SABufferInfo = $000000C9;
  DISPID_SADefaultFormat = $000000CA;
  DISPID_SAVolume = $000000CB;
  DISPID_SABufferNotifySize = $000000CC;
  DISPID_SAEventHandle = $000000CD;
  DISPID_SASetState = $000000CE;

type
  DISPID_SpeechMMSysAudio = TOleEnum;

const
  DISPID_SMSADeviceId = $0000012C;
  DISPID_SMSALineId = $0000012D;
  DISPID_SMSAMMHandle = $0000012E;

type
  DISPID_SpeechFileStream = TOleEnum;

const
  DISPID_SFSOpen = $00000064;
  DISPID_SFSClose = $00000065;

type
  DISPID_SpeechCustomStream = TOleEnum;

const
  DISPID_SCSBaseStream = $00000064;

type
  DISPID_SpeechMemoryStream = TOleEnum;

const
  DISPID_SMSSetData = $00000064;
  DISPID_SMSGetData = $00000065;

type
  DISPID_SpeechAudioStatus = TOleEnum;

const
  DISPID_SASFreeBufferSpace = $00000001;
  DISPID_SASNonBlockingIO = $00000002;
  DISPID_SASState = $00000003;
  DISPID_SASCurrentSeekPosition = $00000004;
  DISPID_SASCurrentDevicePosition = $00000005;

type
  DISPID_SpeechAudioBufferInfo = TOleEnum;

const
  DISPID_SABIMinNotification = $00000001;
  DISPID_SABIBufferSize = $00000002;
  DISPID_SABIEventBias = $00000003;

type
  DISPID_SpeechWaveFormatEx = TOleEnum;

const
  DISPID_SWFEFormatTag = $00000001;
  DISPID_SWFEChannels = $00000002;
  DISPID_SWFESamplesPerSec = $00000003;
  DISPID_SWFEAvgBytesPerSec = $00000004;
  DISPID_SWFEBlockAlign = $00000005;
  DISPID_SWFEBitsPerSample = $00000006;
  DISPID_SWFEExtraData = $00000007;

type
  DISPID_SpeechVoice = TOleEnum;

const
  DISPID_SVStatus = $00000001;
  DISPID_SVVoice = $00000002;
  DISPID_SVAudioOutput = $00000003;
  DISPID_SVAudioOutputStream = $00000004;
  DISPID_SVRate = $00000005;
  DISPID_SVVolume = $00000006;
  DISPID_SVAllowAudioOuputFormatChangesOnNextSet = $00000007;
  DISPID_SVEventInterests = $00000008;
  DISPID_SVPriority = $00000009;
  DISPID_SVAlertBoundary = $0000000A;
  DISPID_SVSyncronousSpeakTimeout = $0000000B;
  DISPID_SVSpeak = $0000000C;
  DISPID_SVSpeakStream = $0000000D;
  DISPID_SVPause = $0000000E;
  DISPID_SVResume = $0000000F;
  DISPID_SVSkip = $00000010;
  DISPID_SVGetVoices = $00000011;
  DISPID_SVGetAudioOutputs = $00000012;
  DISPID_SVWaitUntilDone = $00000013;
  DISPID_SVSpeakCompleteEvent = $00000014;
  DISPID_SVIsUISupported = $00000015;
  DISPID_SVDisplayUI = $00000016;

type
  DISPID_SpeechVoiceStatus = TOleEnum;

const
  DISPID_SVSCurrentStreamNumber = $00000001;
  DISPID_SVSLastStreamNumberQueued = $00000002;
  DISPID_SVSLastResult = $00000003;
  DISPID_SVSRunningState = $00000004;
  DISPID_SVSInputWordPosition = $00000005;
  DISPID_SVSInputWordLength = $00000006;
  DISPID_SVSInputSentencePosition = $00000007;
  DISPID_SVSInputSentenceLength = $00000008;
  DISPID_SVSLastBookmark = $00000009;
  DISPID_SVSLastBookmarkId = $0000000A;
  DISPID_SVSPhonemeId = $0000000B;
  DISPID_SVSVisemeId = $0000000C;

type
  DISPID_SpeechVoiceEvent = TOleEnum;

const
  DISPID_SVEStreamStart = $00000001;
  DISPID_SVEStreamEnd = $00000002;
  DISPID_SVEVoiceChange = $00000003;
  DISPID_SVEBookmark = $00000004;
  DISPID_SVEWord = $00000005;
  DISPID_SVEPhoneme = $00000006;
  DISPID_SVESentenceBoundary = $00000007;
  DISPID_SVEViseme = $00000008;
  DISPID_SVEAudioLevel = $00000009;
  DISPID_SVEEnginePrivate = $0000000A;

type
  DISPID_SpeechRecognizer = TOleEnum;

const
  DISPID_SRRecognizer = $00000001;
  DISPID_SRAllowAudioInputFormatChangesOnNextSet = $00000002;
  DISPID_SRAudioInput = $00000003;
  DISPID_SRAudioInputStream = $00000004;
  DISPID_SRIsShared = $00000005;
  DISPID_SRState = $00000006;
  DISPID_SRStatus = $00000007;
  DISPID_SRProfile = $00000008;
  DISPID_SREmulateRecognition = $00000009;
  DISPID_SRCreateRecoContext = $0000000A;
  DISPID_SRGetFormat = $0000000B;
  DISPID_SRSetPropertyNumber = $0000000C;
  DISPID_SRGetPropertyNumber = $0000000D;
  DISPID_SRSetPropertyString = $0000000E;
  DISPID_SRGetPropertyString = $0000000F;
  DISPID_SRIsUISupported = $00000010;
  DISPID_SRDisplayUI = $00000011;
  DISPID_SRGetRecognizers = $00000012;
  DISPID_SVGetAudioInputs = $00000013;
  DISPID_SVGetProfiles = $00000014;

type
  SpeechEmulationCompareFlags = TOleEnum;

const
  SECFIgnoreCase = $00000001;
  SECFIgnoreKanaType = $00010000;
  SECFIgnoreWidth = $00020000;
  SECFNoSpecialChars = $20000000;
  SECFEmulateResult = $40000000;
  SECFDefault = $00030001;

type
  DISPID_SpeechRecognizerStatus = TOleEnum;

const
  DISPID_SRSAudioStatus = $00000001;
  DISPID_SRSCurrentStreamPosition = $00000002;
  DISPID_SRSCurrentStreamNumber = $00000003;
  DISPID_SRSNumberOfActiveRules = $00000004;
  DISPID_SRSClsidEngine = $00000005;
  DISPID_SRSSupportedLanguages = $00000006;

type
  DISPID_SpeechRecoContext = TOleEnum;

const
  DISPID_SRCRecognizer = $00000001;
  DISPID_SRCAudioInInterferenceStatus = $00000002;
  DISPID_SRCRequestedUIType = $00000003;
  DISPID_SRCVoice = $00000004;
  DISPID_SRAllowVoiceFormatMatchingOnNextSet = $00000005;
  DISPID_SRCVoicePurgeEvent = $00000006;
  DISPID_SRCEventInterests = $00000007;
  DISPID_SRCCmdMaxAlternates = $00000008;
  DISPID_SRCState = $00000009;
  DISPID_SRCRetainedAudio = $0000000A;
  DISPID_SRCRetainedAudioFormat = $0000000B;
  DISPID_SRCPause = $0000000C;
  DISPID_SRCResume = $0000000D;
  DISPID_SRCCreateGrammar = $0000000E;
  DISPID_SRCCreateResultFromMemory = $0000000F;
  DISPID_SRCBookmark = $00000010;
  DISPID_SRCSetAdaptationData = $00000011;

type
  DISPIDSPRG = TOleEnum;

const
  DISPID_SRGId = $00000001;
  DISPID_SRGRecoContext = $00000002;
  DISPID_SRGState = $00000003;
  DISPID_SRGRules = $00000004;
  DISPID_SRGReset = $00000005;
  DISPID_SRGCommit = $00000006;
  DISPID_SRGCmdLoadFromFile = $00000007;
  DISPID_SRGCmdLoadFromObject = $00000008;
  DISPID_SRGCmdLoadFromResource = $00000009;
  DISPID_SRGCmdLoadFromMemory = $0000000A;
  DISPID_SRGCmdLoadFromProprietaryGrammar = $0000000B;
  DISPID_SRGCmdSetRuleState = $0000000C;
  DISPID_SRGCmdSetRuleIdState = $0000000D;
  DISPID_SRGDictationLoad = $0000000E;
  DISPID_SRGDictationUnload = $0000000F;
  DISPID_SRGDictationSetState = $00000010;
  DISPID_SRGSetWordSequenceData = $00000011;
  DISPID_SRGSetTextSelection = $00000012;
  DISPID_SRGIsPronounceable = $00000013;

type
  DISPID_SpeechRecoContextEvents = TOleEnum;

const
  DISPID_SRCEStartStream = $00000001;
  DISPID_SRCEEndStream = $00000002;
  DISPID_SRCEBookmark = $00000003;
  DISPID_SRCESoundStart = $00000004;
  DISPID_SRCESoundEnd = $00000005;
  DISPID_SRCEPhraseStart = $00000006;
  DISPID_SRCERecognition = $00000007;
  DISPID_SRCEHypothesis = $00000008;
  DISPID_SRCEPropertyNumberChange = $00000009;
  DISPID_SRCEPropertyStringChange = $0000000A;
  DISPID_SRCEFalseRecognition = $0000000B;
  DISPID_SRCEInterference = $0000000C;
  DISPID_SRCERequestUI = $0000000D;
  DISPID_SRCERecognizerStateChange = $0000000E;
  DISPID_SRCEAdaptation = $0000000F;
  DISPID_SRCERecognitionForOtherContext = $00000010;
  DISPID_SRCEAudioLevel = $00000011;
  DISPID_SRCEEnginePrivate = $00000012;

type
  DISPID_SpeechGrammarRule = TOleEnum;

const
  DISPID_SGRAttributes = $00000001;
  DISPID_SGRInitialState = $00000002;
  DISPID_SGRName = $00000003;
  DISPID_SGRId = $00000004;
  DISPID_SGRClear = $00000005;
  DISPID_SGRAddResource = $00000006;
  DISPID_SGRAddState = $00000007;

type
  DISPID_SpeechGrammarRules = TOleEnum;

const
  DISPID_SGRsCount = $00000001;
  DISPID_SGRsDynamic = $00000002;
  DISPID_SGRsAdd = $00000003;
  DISPID_SGRsCommit = $00000004;
  DISPID_SGRsCommitAndSave = $00000005;
  DISPID_SGRsFindRule = $00000006;
  DISPID_SGRsItem = $00000000;
  DISPID_SGRs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechGrammarRuleState = TOleEnum;

const
  DISPID_SGRSRule = $00000001;
  DISPID_SGRSTransitions = $00000002;
  DISPID_SGRSAddWordTransition = $00000003;
  DISPID_SGRSAddRuleTransition = $00000004;
  DISPID_SGRSAddSpecialTransition = $00000005;

type
  DISPID_SpeechGrammarRuleStateTransitions = TOleEnum;

const
  DISPID_SGRSTsCount = $00000001;
  DISPID_SGRSTsItem = $00000000;
  DISPID_SGRSTs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechGrammarRuleStateTransition = TOleEnum;

const
  DISPID_SGRSTType = $00000001;
  DISPID_SGRSTText = $00000002;
  DISPID_SGRSTRule = $00000003;
  DISPID_SGRSTWeight = $00000004;
  DISPID_SGRSTPropertyName = $00000005;
  DISPID_SGRSTPropertyId = $00000006;
  DISPID_SGRSTPropertyValue = $00000007;
  DISPID_SGRSTNextState = $00000008;

type
  DISPIDSPTSI = TOleEnum;

const
  DISPIDSPTSI_ActiveOffset = $00000001;
  DISPIDSPTSI_ActiveLength = $00000002;
  DISPIDSPTSI_SelectionOffset = $00000003;
  DISPIDSPTSI_SelectionLength = $00000004;

type
  DISPID_SpeechRecoResult = TOleEnum;

const
  DISPID_SRRRecoContext = $00000001;
  DISPID_SRRTimes = $00000002;
  DISPID_SRRAudioFormat = $00000003;
  DISPID_SRRPhraseInfo = $00000004;
  DISPID_SRRAlternates = $00000005;
  DISPID_SRRAudio = $00000006;
  DISPID_SRRSpeakAudio = $00000007;
  DISPID_SRRSaveToMemory = $00000008;
  DISPID_SRRDiscardResultInfo = $00000009;

type
  DISPID_SpeechXMLRecoResult = TOleEnum;

const
  DISPID_SRRGetXMLResult = $0000000A;
  DISPID_SRRGetXMLErrorInfo = $0000000B;

type
  SPXMLRESULTOPTIONS = TOleEnum;

const
  SPXRO_SML = $00000000;
  SPXRO_Alternates_SML = $00000001;

type
  DISPID_SpeechRecoResult2 = TOleEnum;

const
  DISPID_SRRSetTextFeedback = $0000000C;

type
  DISPID_SpeechPhraseBuilder = TOleEnum;

const
  DISPID_SPPBRestorePhraseFromMemory = $00000001;

type
  DISPID_SpeechRecoResultTimes = TOleEnum;

const
  DISPID_SRRTStreamTime = $00000001;
  DISPID_SRRTLength = $00000002;
  DISPID_SRRTTickCount = $00000003;
  DISPID_SRRTOffsetFromStart = $00000004;

type
  DISPID_SpeechPhraseAlternate = TOleEnum;

const
  DISPID_SPARecoResult = $00000001;
  DISPID_SPAStartElementInResult = $00000002;
  DISPID_SPANumberOfElementsInResult = $00000003;
  DISPID_SPAPhraseInfo = $00000004;
  DISPID_SPACommit = $00000005;

type
  DISPID_SpeechPhraseAlternates = TOleEnum;

const
  DISPID_SPAsCount = $00000001;
  DISPID_SPAsItem = $00000000;
  DISPID_SPAs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechPhraseInfo = TOleEnum;

const
  DISPID_SPILanguageId = $00000001;
  DISPID_SPIGrammarId = $00000002;
  DISPID_SPIStartTime = $00000003;
  DISPID_SPIAudioStreamPosition = $00000004;
  DISPID_SPIAudioSizeBytes = $00000005;
  DISPID_SPIRetainedSizeBytes = $00000006;
  DISPID_SPIAudioSizeTime = $00000007;
  DISPID_SPIRule = $00000008;
  DISPID_SPIProperties = $00000009;
  DISPID_SPIElements = $0000000A;
  DISPID_SPIReplacements = $0000000B;
  DISPID_SPIEngineId = $0000000C;
  DISPID_SPIEnginePrivateData = $0000000D;
  DISPID_SPISaveToMemory = $0000000E;
  DISPID_SPIGetText = $0000000F;
  DISPID_SPIGetDisplayAttributes = $00000010;

type
  DISPID_SpeechPhraseElement = TOleEnum;

const
  DISPID_SPEAudioTimeOffset = $00000001;
  DISPID_SPEAudioSizeTime = $00000002;
  DISPID_SPEAudioStreamOffset = $00000003;
  DISPID_SPEAudioSizeBytes = $00000004;
  DISPID_SPERetainedStreamOffset = $00000005;
  DISPID_SPERetainedSizeBytes = $00000006;
  DISPID_SPEDisplayText = $00000007;
  DISPID_SPELexicalForm = $00000008;
  DISPID_SPEPronunciation = $00000009;
  DISPID_SPEDisplayAttributes = $0000000A;
  DISPID_SPERequiredConfidence = $0000000B;
  DISPID_SPEActualConfidence = $0000000C;
  DISPID_SPEEngineConfidence = $0000000D;

type
  DISPID_SpeechPhraseElements = TOleEnum;

const
  DISPID_SPEsCount = $00000001;
  DISPID_SPEsItem = $00000000;
  DISPID_SPEs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechPhraseReplacement = TOleEnum;

const
  DISPID_SPRDisplayAttributes = $00000001;
  DISPID_SPRText = $00000002;
  DISPID_SPRFirstElement = $00000003;
  DISPID_SPRNumberOfElements = $00000004;

type
  DISPID_SpeechPhraseReplacements = TOleEnum;

const
  DISPID_SPRsCount = $00000001;
  DISPID_SPRsItem = $00000000;
  DISPID_SPRs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechPhraseProperty = TOleEnum;

const
  DISPID_SPPName = $00000001;
  DISPID_SPPId = $00000002;
  DISPID_SPPValue = $00000003;
  DISPID_SPPFirstElement = $00000004;
  DISPID_SPPNumberOfElements = $00000005;
  DISPID_SPPEngineConfidence = $00000006;
  DISPID_SPPConfidence = $00000007;
  DISPID_SPPParent = $00000008;
  DISPID_SPPChildren = $00000009;

type
  DISPID_SpeechPhraseProperties = TOleEnum;

const
  DISPID_SPPsCount = $00000001;
  DISPID_SPPsItem = $00000000;
  DISPID_SPPs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechPhraseRule = TOleEnum;

const
  DISPID_SPRuleName = $00000001;
  DISPID_SPRuleId = $00000002;
  DISPID_SPRuleFirstElement = $00000003;
  DISPID_SPRuleNumberOfElements = $00000004;
  DISPID_SPRuleParent = $00000005;
  DISPID_SPRuleChildren = $00000006;
  DISPID_SPRuleConfidence = $00000007;
  DISPID_SPRuleEngineConfidence = $00000008;

type
  DISPID_SpeechPhraseRules = TOleEnum;

const
  DISPID_SPRulesCount = $00000001;
  DISPID_SPRulesItem = $00000000;
  DISPID_SPRules_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechLexicon = TOleEnum;

const
  DISPID_SLGenerationId = $00000001;
  DISPID_SLGetWords = $00000002;
  DISPID_SLAddPronunciation = $00000003;
  DISPID_SLAddPronunciationByPhoneIds = $00000004;
  DISPID_SLRemovePronunciation = $00000005;
  DISPID_SLRemovePronunciationByPhoneIds = $00000006;
  DISPID_SLGetPronunciations = $00000007;
  DISPID_SLGetGenerationChange = $00000008;

type
  DISPID_SpeechLexiconWords = TOleEnum;

const
  DISPID_SLWsCount = $00000001;
  DISPID_SLWsItem = $00000000;
  DISPID_SLWs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechLexiconWord = TOleEnum;

const
  DISPID_SLWLangId = $00000001;
  DISPID_SLWType = $00000002;
  DISPID_SLWWord = $00000003;
  DISPID_SLWPronunciations = $00000004;

type
  DISPID_SpeechLexiconProns = TOleEnum;

const
  DISPID_SLPsCount = $00000001;
  DISPID_SLPsItem = $00000000;
  DISPID_SLPs_NewEnum = $FFFFFFFC;

type
  DISPID_SpeechLexiconPronunciation = TOleEnum;

const
  DISPID_SLPType = $00000001;
  DISPID_SLPLangId = $00000002;
  DISPID_SLPPartOfSpeech = $00000003;
  DISPID_SLPPhoneIds = $00000004;
  DISPID_SLPSymbolic = $00000005;

type
  DISPID_SpeechPhoneConverter = TOleEnum;

const
  DISPID_SPCLangId = $00000001;
  DISPID_SPCPhoneToId = $00000002;
  DISPID_SPCIdToPhone = $00000003;

type
  SPDATAKEYLOCATION = TOleEnum;

const
  SPDKL_DefaultLocation = $00000000;
  SPDKL_CurrentUser = $00000001;
  SPDKL_LocalMachine = $00000002;
  SPDKL_CurrentConfig = $00000005;

type
  _SPAUDIOSTATE = TOleEnum;

const
  SPAS_CLOSED = $00000000;
  SPAS_STOP = $00000001;
  SPAS_PAUSE = $00000002;
  SPAS_RUN = $00000003;

type
  SPFILEMODE = TOleEnum;

const
  SPFM_OPEN_READONLY = $00000000;
  SPFM_OPEN_READWRITE = $00000001;
  SPFM_CREATE = $00000002;
  SPFM_CREATE_ALWAYS = $00000003;
  SPFM_NUM_MODES = $00000004;

type
  SPVISEMES = TOleEnum;

const
  SP_VISEME_0 = $00000000;
  SP_VISEME_1 = $00000001;
  SP_VISEME_2 = $00000002;
  SP_VISEME_3 = $00000003;
  SP_VISEME_4 = $00000004;
  SP_VISEME_5 = $00000005;
  SP_VISEME_6 = $00000006;
  SP_VISEME_7 = $00000007;
  SP_VISEME_8 = $00000008;
  SP_VISEME_9 = $00000009;
  SP_VISEME_10 = $0000000A;
  SP_VISEME_11 = $0000000B;
  SP_VISEME_12 = $0000000C;
  SP_VISEME_13 = $0000000D;
  SP_VISEME_14 = $0000000E;
  SP_VISEME_15 = $0000000F;
  SP_VISEME_16 = $00000010;
  SP_VISEME_17 = $00000011;
  SP_VISEME_18 = $00000012;
  SP_VISEME_19 = $00000013;
  SP_VISEME_20 = $00000014;
  SP_VISEME_21 = $00000015;

type
  SPVPRIORITY = TOleEnum;

const
  SPVPRI_NORMAL = $00000000;
  SPVPRI_ALERT = $00000001;
  SPVPRI_OVER = $00000002;

type
  SPEVENTENUM = TOleEnum;

const
  SPEI_UNDEFINED = $00000000;
  SPEI_START_INPUT_STREAM = $00000001;
  SPEI_END_INPUT_STREAM = $00000002;
  SPEI_VOICE_CHANGE = $00000003;
  SPEI_TTS_BOOKMARK = $00000004;
  SPEI_WORD_BOUNDARY = $00000005;
  SPEI_PHONEME = $00000006;
  SPEI_SENTENCE_BOUNDARY = $00000007;
  SPEI_VISEME = $00000008;
  SPEI_TTS_AUDIO_LEVEL = $00000009;
  SPEI_TTS_PRIVATE = $0000000F;
  SPEI_MIN_TTS = $00000001;
  SPEI_MAX_TTS = $0000000F;
  SPEI_END_SR_STREAM = $00000022;
  SPEI_SOUND_START = $00000023;
  SPEI_SOUND_END = $00000024;
  SPEI_PHRASE_START = $00000025;
  SPEI_RECOGNITION = $00000026;
  SPEI_HYPOTHESIS = $00000027;
  SPEI_SR_BOOKMARK = $00000028;
  SPEI_PROPERTY_NUM_CHANGE = $00000029;
  SPEI_PROPERTY_STRING_CHANGE = $0000002A;
  SPEI_FALSE_RECOGNITION = $0000002B;
  SPEI_INTERFERENCE = $0000002C;
  SPEI_REQUEST_UI = $0000002D;
  SPEI_RECO_STATE_CHANGE = $0000002E;
  SPEI_ADAPTATION = $0000002F;
  SPEI_START_SR_STREAM = $00000030;
  SPEI_RECO_OTHER_CONTEXT = $00000031;
  SPEI_SR_AUDIO_LEVEL = $00000032;
  SPEI_SR_RETAINEDAUDIO = $00000033;
  SPEI_SR_PRIVATE = $00000034;
  SPEI_ACTIVE_CATEGORY_CHANGED = $00000035;
  SPEI_RESERVED5 = $00000036;
  SPEI_RESERVED6 = $00000037;
  SPEI_MIN_SR = $00000022;
  SPEI_MAX_SR = $00000037;
  SPEI_RESERVED1 = $0000001E;
  SPEI_RESERVED2 = $00000021;
  SPEI_RESERVED3 = $0000003F;

type
  SPRECOSTATE = TOleEnum;

const
  SPRST_INACTIVE = $00000000;
  SPRST_ACTIVE = $00000001;
  SPRST_ACTIVE_ALWAYS = $00000002;
  SPRST_INACTIVE_WITH_PURGE = $00000003;
  SPRST_NUM_STATES = $00000004;

type
  SPWAVEFORMATTYPE = TOleEnum;

const
  SPWF_INPUT = $00000000;
  SPWF_SRENGINE = $00000001;

type
  SPSEMANTICFORMAT = TOleEnum;

const
  SPSMF_SAPI_PROPERTIES = $00000000;
  SPSMF_SRGS_SEMANTICINTERPRETATION_MS = $00000001;
  SPSMF_SRGS_SAPIPROPERTIES = $00000002;
  SPSMF_UPS = $00000004;
  SPSMF_SRGS_SEMANTICINTERPRETATION_W3C = $00000008;

type
  SPGRAMMARWORDTYPE = TOleEnum;

const
  SPWT_DISPLAY = $00000000;
  SPWT_LEXICAL = $00000001;
  SPWT_PRONUNCIATION = $00000002;
  SPWT_LEXICAL_NO_SPECIAL_CHARS = $00000003;

type
  SPLOADOPTIONS = TOleEnum;

const
  SPLO_STATIC = $00000000;
  SPLO_DYNAMIC = $00000001;

type
  SPRULESTATE = TOleEnum;

const
  SPRS_INACTIVE = $00000000;
  SPRS_ACTIVE = $00000001;
  SPRS_ACTIVE_WITH_AUTO_PAUSE = $00000003;
  SPRS_ACTIVE_USER_DELIMITED = $00000004;

type
  SPWORDPRONOUNCEABLE = TOleEnum;

const
  SPWP_UNKNOWN_WORD_UNPRONOUNCEABLE = $00000000;
  SPWP_UNKNOWN_WORD_PRONOUNCEABLE = $00000001;
  SPWP_KNOWN_WORD_PRONOUNCEABLE = $00000002;

type
  SPGRAMMARSTATE = TOleEnum;

const
  SPGS_DISABLED = $00000000;
  SPGS_ENABLED = $00000001;
  SPGS_EXCLUSIVE = $00000003;

type
  SPINTERFERENCE = TOleEnum;

const
  SPINTERFERENCE_NONE = $00000000;
  SPINTERFERENCE_NOISE = $00000001;
  SPINTERFERENCE_NOSIGNAL = $00000002;
  SPINTERFERENCE_TOOLOUD = $00000003;
  SPINTERFERENCE_TOOQUIET = $00000004;
  SPINTERFERENCE_TOOFAST = $00000005;
  SPINTERFERENCE_TOOSLOW = $00000006;
  SPINTERFERENCE_LATENCY_WARNING = $00000007;
  SPINTERFERENCE_LATENCY_TRUNCATE_BEGIN = $00000008;
  SPINTERFERENCE_LATENCY_TRUNCATE_END = $00000009;

type
  SPAUDIOOPTIONS = TOleEnum;

const
  SPAO_NONE = $00000000;
  SPAO_RETAIN_AUDIO = $00000001;

type
  SPBOOKMARKOPTIONS = TOleEnum;

const
  SPBO_NONE = $00000000;
  SPBO_PAUSE = $00000001;
  SPBO_AHEAD = $00000002;
  SPBO_TIME_UNITS = $00000004;

type
  SPCONTEXTSTATE = TOleEnum;

const
  SPCS_DISABLED = $00000000;
  SPCS_ENABLED = $00000001;

type
  SPADAPTATIONRELEVANCE = TOleEnum;

const
  SPAR_Unknown = $00000000;
  SPAR_Low = $00000001;
  SPAR_Medium = $00000002;
  SPAR_High = $00000003;

type
  SPCATEGORYTYPE = TOleEnum;

const
  SPCT_COMMAND = $00000000;
  SPCT_DICTATION = $00000001;
  SPCT_SLEEP = $00000002;
  SPCT_SUB_COMMAND = $00000003;
  SPCT_SUB_DICTATION = $00000004;

type
  SPLEXICONTYPE = TOleEnum;

const
  eLEXTYPE_USER = $00000001;
  eLEXTYPE_APP = $00000002;
  eLEXTYPE_VENDORLEXICON = $00000004;
  eLEXTYPE_LETTERTOSOUND = $00000008;
  eLEXTYPE_MORPHOLOGY = $00000010;
  eLEXTYPE_RESERVED4 = $00000020;
  eLEXTYPE_USER_SHORTCUT = $00000040;
  eLEXTYPE_RESERVED6 = $00000080;
  eLEXTYPE_RESERVED7 = $00000100;
  eLEXTYPE_RESERVED8 = $00000200;
  eLEXTYPE_RESERVED9 = $00000400;
  eLEXTYPE_RESERVED10 = $00000800;
  eLEXTYPE_PRIVATE1 = $00001000;
  eLEXTYPE_PRIVATE2 = $00002000;
  eLEXTYPE_PRIVATE3 = $00004000;
  eLEXTYPE_PRIVATE4 = $00008000;
  eLEXTYPE_PRIVATE5 = $00010000;
  eLEXTYPE_PRIVATE6 = $00020000;
  eLEXTYPE_PRIVATE7 = $00040000;
  eLEXTYPE_PRIVATE8 = $00080000;
  eLEXTYPE_PRIVATE9 = $00100000;
  eLEXTYPE_PRIVATE10 = $00200000;
  eLEXTYPE_PRIVATE11 = $00400000;
  eLEXTYPE_PRIVATE12 = $00800000;
  eLEXTYPE_PRIVATE13 = $01000000;
  eLEXTYPE_PRIVATE14 = $02000000;
  eLEXTYPE_PRIVATE15 = $04000000;
  eLEXTYPE_PRIVATE16 = $08000000;
  eLEXTYPE_PRIVATE17 = $10000000;
  eLEXTYPE_PRIVATE18 = $20000000;
  eLEXTYPE_PRIVATE19 = $40000000;
  eLEXTYPE_PRIVATE20 = $80000000;

type
  SPPARTOFSPEECH = TOleEnum;

const
  SPPS_NotOverriden = $FFFFFFFF;
  SPPS_Unknown = $00000000;
  SPPS_Noun = $00001000;
  SPPS_Verb = $00002000;
  SPPS_Modifier = $00003000;
  SPPS_Function = $00004000;
  SPPS_Interjection = $00005000;
  SPPS_Noncontent = $00006000;
  SPPS_LMA = $00007000;
  SPPS_SuppressWord = $0000F000;

type
  SPWORDTYPE = TOleEnum;

const
  eWORDTYPE_ADDED = $00000001;
  eWORDTYPE_DELETED = $00000002;

type
  SPSHORTCUTTYPE = TOleEnum;

const
  SPSHT_NotOverriden = $FFFFFFFF;
  SPSHT_Unknown = $00000000;
  SPSHT_EMAIL = $00001000;
  SPSHT_OTHER = $00002000;
  SPPS_RESERVED1 = $00003000;
  SPPS_RESERVED2 = $00004000;
  SPPS_RESERVED3 = $00005000;
  SPPS_RESERVED4 = $0000F000;

type

  ISpeechDataKey = interface;
  ISpeechDataKeyDisp = dispinterface;
  ISpeechObjectToken = interface;
  ISpeechObjectTokenDisp = dispinterface;
  ISpeechObjectTokenCategory = interface;
  ISpeechObjectTokenCategoryDisp = dispinterface;
  ISpeechObjectTokens = interface;
  ISpeechObjectTokensDisp = dispinterface;
  ISpeechAudioBufferInfo = interface;
  ISpeechAudioBufferInfoDisp = dispinterface;
  ISpeechAudioStatus = interface;
  ISpeechAudioStatusDisp = dispinterface;
  ISpeechAudioFormat = interface;
  ISpeechAudioFormatDisp = dispinterface;
  ISpeechWaveFormatEx = interface;
  ISpeechWaveFormatExDisp = dispinterface;
  ISpeechBaseStream = interface;
  ISpeechBaseStreamDisp = dispinterface;
  ISpeechFileStream = interface;
  ISpeechFileStreamDisp = dispinterface;
  ISpeechMemoryStream = interface;
  ISpeechMemoryStreamDisp = dispinterface;
  ISpeechCustomStream = interface;
  ISpeechCustomStreamDisp = dispinterface;
  ISpeechAudio = interface;
  ISpeechAudioDisp = dispinterface;
  ISpeechMMSysAudio = interface;
  ISpeechMMSysAudioDisp = dispinterface;
  ISpeechVoice = interface;
  ISpeechVoiceDisp = dispinterface;
  ISpeechVoiceStatus = interface;
  ISpeechVoiceStatusDisp = dispinterface;
  _ISpeechVoiceEvents = dispinterface;
  ISpeechRecognizer = interface;
  ISpeechRecognizerDisp = dispinterface;
  ISpeechRecognizerStatus = interface;
  ISpeechRecognizerStatusDisp = dispinterface;
  ISpeechRecoContext = interface;
  ISpeechRecoContextDisp = dispinterface;
  ISpeechRecoGrammar = interface;
  ISpeechRecoGrammarDisp = dispinterface;
  ISpeechGrammarRules = interface;
  ISpeechGrammarRulesDisp = dispinterface;
  ISpeechGrammarRule = interface;
  ISpeechGrammarRuleDisp = dispinterface;
  ISpeechGrammarRuleState = interface;
  ISpeechGrammarRuleStateDisp = dispinterface;
  ISpeechGrammarRuleStateTransitions = interface;
  ISpeechGrammarRuleStateTransitionsDisp = dispinterface;
  ISpeechGrammarRuleStateTransition = interface;
  ISpeechGrammarRuleStateTransitionDisp = dispinterface;
  ISpeechTextSelectionInformation = interface;
  ISpeechTextSelectionInformationDisp = dispinterface;
  ISpeechRecoResult = interface;
  ISpeechRecoResultDisp = dispinterface;
  ISpeechRecoResultTimes = interface;
  ISpeechRecoResultTimesDisp = dispinterface;
  ISpeechPhraseInfo = interface;
  ISpeechPhraseInfoDisp = dispinterface;
  ISpeechPhraseRule = interface;
  ISpeechPhraseRuleDisp = dispinterface;
  ISpeechPhraseRules = interface;
  ISpeechPhraseRulesDisp = dispinterface;
  ISpeechPhraseProperties = interface;
  ISpeechPhrasePropertiesDisp = dispinterface;
  ISpeechPhraseProperty = interface;
  ISpeechPhrasePropertyDisp = dispinterface;
  ISpeechPhraseElements = interface;
  ISpeechPhraseElementsDisp = dispinterface;
  ISpeechPhraseElement = interface;
  ISpeechPhraseElementDisp = dispinterface;
  ISpeechPhraseReplacements = interface;
  ISpeechPhraseReplacementsDisp = dispinterface;
  ISpeechPhraseReplacement = interface;
  ISpeechPhraseReplacementDisp = dispinterface;
  ISpeechPhraseAlternates = interface;
  ISpeechPhraseAlternatesDisp = dispinterface;
  ISpeechPhraseAlternate = interface;
  ISpeechPhraseAlternateDisp = dispinterface;
  _ISpeechRecoContextEvents = dispinterface;
  ISpeechRecoResult2 = interface;
  ISpeechRecoResult2Disp = dispinterface;
  ISpeechLexicon = interface;
  ISpeechLexiconDisp = dispinterface;
  ISpeechLexiconWords = interface;
  ISpeechLexiconWordsDisp = dispinterface;
  ISpeechLexiconWord = interface;
  ISpeechLexiconWordDisp = dispinterface;
  ISpeechLexiconPronunciations = interface;
  ISpeechLexiconPronunciationsDisp = dispinterface;
  ISpeechLexiconPronunciation = interface;
  ISpeechLexiconPronunciationDisp = dispinterface;
  ISpeechXMLRecoResult = interface;
  ISpeechXMLRecoResultDisp = dispinterface;
  ISpeechRecoResultDispatch = interface;
  ISpeechRecoResultDispatchDisp = dispinterface;
  ISpeechPhraseInfoBuilder = interface;
  ISpeechPhraseInfoBuilderDisp = dispinterface;
  ISpeechPhoneConverter = interface;
  ISpeechPhoneConverterDisp = dispinterface;
  ISpNotifySink = interface;
  ISpNotifyTranslator = interface;
  ISpDataKey = interface;
  ISpObjectTokenCategory = interface;
  IEnumSpObjectTokens = interface;
  ISpObjectToken = interface;
  IServiceProvider = interface;
  ISpResourceManager = interface;
  ISequentialStream = interface;
  IStream = interface;
  ISpStreamFormat = interface;
  ISpStreamFormatConverter = interface;
  ISpNotifySource = interface;
  ISpEventSource = interface;
  ISpEventSink = interface;
  ISpObjectWithToken = interface;
  ISpAudio = interface;
  ISpMMSysAudio = interface;
  ISpStream = interface;
  ISpVoice = interface;
  ISpPhoneticAlphabetSelection = interface;
  ISpRecoContext = interface;
  ISpRecoContext2 = interface;
  ISpProperties = interface;
  ISpRecognizer = interface;
  ISpPhrase = interface;
  ISpGrammarBuilder = interface;
  ISpRecoGrammar = interface;
  ISpRecoResult = interface;
  ISpPhraseAlt = interface;
  ISpRecognizer2 = interface;
  ISpRecognizer3 = interface;
  ISpSerializeState = interface;
  ISpRecoCategory = interface;
  ISpLexicon = interface;
  ISpShortcut = interface;
  ISpPhoneConverter = interface;
  ISpPhoneticAlphabetConverter = interface;
  ISpXMLRecoResult = interface;
  ISpRecoGrammar2 = interface;
  ISpeechResourceLoader = interface;
  ISpeechResourceLoaderDisp = dispinterface;
  IInternetSecurityManager = interface;
  IInternetSecurityMgrSite = interface;
  IEnumString = interface;

  SpNotifyTranslator = ISpNotifyTranslator;
  SpObjectTokenCategory = ISpeechObjectTokenCategory;
  SpObjectToken = ISpeechObjectToken;
  SpResourceManager = ISpResourceManager;
  SpStreamFormatConverter = ISpStreamFormatConverter;
  SpMMAudioEnum = IEnumSpObjectTokens;
  SpMMAudioIn = ISpeechMMSysAudio;
  SpMMAudioOut = ISpeechMMSysAudio;
  SpStream = ISpStream;
  SpVoice = ISpeechVoice;
  SpSharedRecoContext = ISpeechRecoContext;
  SpInprocRecognizer = ISpeechRecognizer;
  SpSharedRecognizer = ISpeechRecognizer;
  SpLexicon = ISpeechLexicon;
  SpUnCompressedLexicon = ISpeechLexicon;
  SpCompressedLexicon = ISpLexicon;
  SpShortcut = ISpShortcut;
  SpPhoneConverter = ISpeechPhoneConverter;
  SpPhoneticAlphabetConverter = ISpPhoneticAlphabetConverter;
  SpNullPhoneConverter = ISpPhoneConverter;
  SpTextSelectionInformation = ISpeechTextSelectionInformation;
  SpPhraseInfoBuilder = ISpeechPhraseInfoBuilder;
  SpAudioFormat = ISpeechAudioFormat;
  SpWaveFormatEx = ISpeechWaveFormatEx;
  SpInProcRecoContext = ISpeechRecoContext;
  SpCustomStream = ISpeechCustomStream;
  SpFileStream = ISpeechFileStream;
  SpMemoryStream = ISpeechMemoryStream;

  wireHWND = ^_RemotableHandle;
  PUserType9 = ^SPPHRASERULE; { * }
  PUserType10 = ^SPPHRASEPROPERTY; { * }
  PUserType14 = ^SPWORDPRONUNCIATION; { * }
  PUserType15 = ^SPWORD; { * }
  PUserType16 = ^SPSHORTCUTPAIR; { * }
  POleVariant1 = ^OleVariant; { * }
  PPPrivateAlias1 = ^Pointer; { * }
  PByte1 = ^Byte; { * }
  PUINT1 = ^LongWord; { * }
  PUserType1 = ^TGUID; { * }
  PUserType2 = ^WAVEFORMATEX; { * }
  PUserType3 = ^SPEVENT; { * }
  PUserType4 = ^SPAUDIOBUFFERINFO; { * }
  PUserType5 = ^SPAUDIOOPTIONS; { * }
  PUserType6 = ^SPSERIALIZEDRESULT; { * }
  PUserType7 = ^SPPHRASE; { * }
  PUserType8 = ^SPSERIALIZEDPHRASE; { * }
  PUserType11 = ^SPBINARYGRAMMAR; { * }
  PWord1 = ^Word; { * }
  PUserType12 = ^SPTEXTSELECTIONINFO; { * }
  PUserType13 = ^SPPROPERTYINFO; { * }
  PUserType17 = ^SPRULE; { * }

  __MIDL_IWinTypes_0009 = record
    case Integer of
      0:
        (hInproc: Integer);
      1:
        (hRemote: Integer);
  end;

  _RemotableHandle = record
    fContext: Integer;
    u: __MIDL_IWinTypes_0009;
  end;

  UINT_PTR = LongWord;
  LONG_PTR = Integer;

{$ALIGN 8}

  _LARGE_INTEGER = record
    QuadPart: Int64;
  end;

  _ULARGE_INTEGER = record
    QuadPart: Largeuint;
  end;

{$ALIGN 4}

  _FILETIME = record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

{$ALIGN 8}

  tagSTATSTG = record
    pwcsName: PWideChar;
    type_: LongWord;
    cbSize: _ULARGE_INTEGER;
    mtime: _FILETIME;
    ctime: _FILETIME;
    atime: _FILETIME;
    grfMode: LongWord;
    grfLocksSupported: LongWord;
    clsid: TGUID;
    grfStateBits: LongWord;
    reserved: LongWord;
  end;

{$ALIGN 4}

  WAVEFORMATEX = record
    wFormatTag: Word;
    nChannels: Word;
    nSamplesPerSec: LongWord;
    nAvgBytesPerSec: LongWord;
    nBlockAlign: Word;
    wBitsPerSample: Word;
    cbSize: Word;
  end;

{$ALIGN 8}

  SPEVENT = record
    eEventId: Word;
    elParamType: Word;
    ulStreamNum: LongWord;
    ullAudioStreamOffset: Largeuint;
    wParam: UINT_PTR;
    lParam: LONG_PTR;
  end;

  SPEVENTSOURCEINFO = record
    ullEventInterest: Largeuint;
    ullQueuedInterest: Largeuint;
    ulCount: LongWord;
  end;

  SPAUDIOSTATE = _SPAUDIOSTATE;

  SPAUDIOSTATUS = record
    cbFreeBuffSpace: Integer;
    cbNonBlockingIO: LongWord;
    State: SPAUDIOSTATE;
    CurSeekPos: Largeuint;
    CurDevicePos: Largeuint;
    dwAudioLevel: LongWord;
    dwReserved2: LongWord;
  end;

{$ALIGN 4}

  SPAUDIOBUFFERINFO = record
    ulMsMinNotification: LongWord;
    ulMsBufferSize: LongWord;
    ulMsEventBias: LongWord;
  end;

  SPVOICESTATUS = record
    ulCurrentStream: LongWord;
    ulLastStreamQueued: LongWord;
    hrLastResult: HResult;
    dwRunningState: LongWord;
    ulInputWordPos: LongWord;
    ulInputWordLen: LongWord;
    ulInputSentPos: LongWord;
    ulInputSentLen: LongWord;
    lBookmarkId: Integer;
    PhonemeId: Word;
    VisemeId: SPVISEMES;
    dwReserved1: LongWord;
    dwReserved2: LongWord;
  end;

{$ALIGN 8}

  SPRECOGNIZERSTATUS = record
    AudioStatus: SPAUDIOSTATUS;
    ullRecognitionStreamPos: Largeuint;
    ulStreamNumber: LongWord;
    ulNumActive: LongWord;
    ClsidEngine: TGUID;
    cLangIDs: LongWord;
    aLangID: array [0 .. 19] of Word;
    ullRecognitionStreamTime: Largeuint;
  end;

  SPSTREAMFORMATTYPE = SPWAVEFORMATTYPE;

{$ALIGN 4}

  SPPHRASERULE = record
    pszName: PWideChar;
    ulId: LongWord;
    ulFirstElement: LongWord;
    ulCountOfElements: LongWord;
    pNextSibling: PUserType9;
    pFirstChild: PUserType9;
    SREngineConfidence: Single;
    Confidence: Shortint;
  end;

{$ALIGN 2}

  __MIDL___MIDL_itf_sapi_0000_0020_0002 = record
    bType: Byte;
    bReserved: Byte;
    usArrayIndex: Word;
  end;

{$ALIGN 4}

  __MIDL___MIDL_itf_sapi_0000_0020_0001 = record
    case Integer of
      0:
        (ulId: LongWord);
      1:
        (__MIDL____MIDL_itf_sapi_0000_00200000
          : __MIDL___MIDL_itf_sapi_0000_0020_0002);
  end;

  SPPHRASEELEMENT = record
    ulAudioTimeOffset: LongWord;
    ulAudioSizeTime: LongWord;
    ulAudioStreamOffset: LongWord;
    ulAudioSizeBytes: LongWord;
    ulRetainedStreamOffset: LongWord;
    ulRetainedSizeBytes: LongWord;
    pszDisplayText: PWideChar;
    pszLexicalForm: PWideChar;
    pszPronunciation: ^Word;
    bDisplayAttributes: Byte;
    RequiredConfidence: Shortint;
    ActualConfidence: Shortint;
    reserved: Byte;
    SREngineConfidence: Single;
  end;

  SPPHRASEREPLACEMENT = record
    bDisplayAttributes: Byte;
    pszReplacementText: PWideChar;
    ulFirstElement: LongWord;
    ulCountOfElements: LongWord;
  end;

  SPSEMANTICERRORINFO = record
    ulLineNumber: LongWord;
    pszScriptLine: PWideChar;
    pszSource: PWideChar;
    pszDescription: PWideChar;
    hrResultCode: HResult;
  end;

  SPSERIALIZEDPHRASE = record
    ulSerializedSize: LongWord;
  end;

{$ALIGN 8}

  tagSPPROPERTYINFO = record
    pszName: PWideChar;
    ulId: LongWord;
    pszValue: PWideChar;
    vValue: OleVariant;
  end;

  SPPROPERTYINFO = tagSPPROPERTYINFO;

{$ALIGN 4}

  SPBINARYGRAMMAR = record
    ulTotalSerializedSize: LongWord;
  end;

  tagSPTEXTSELECTIONINFO = record
    ulStartActiveOffset: LongWord;
    cchActiveChars: LongWord;
    ulStartSelection: LongWord;
    cchSelection: LongWord;
  end;

  SPTEXTSELECTIONINFO = tagSPTEXTSELECTIONINFO;

  SPRECOCONTEXTSTATUS = record
    eInterference: SPINTERFERENCE;
    szRequestTypeOfUI: array [0 .. 254] of Word;
    dwReserved1: LongWord;
    dwReserved2: LongWord;
  end;

  SPSERIALIZEDRESULT = record
    ulSerializedSize: LongWord;
  end;

{$ALIGN 8}

  SPRECORESULTTIMES = record
    ftStreamTime: _FILETIME;
    ullLength: Largeuint;
    dwTickCount: LongWord;
    ullStart: Largeuint;
  end;

{$ALIGN 4}

  SPWORDPRONUNCIATION = record
    pNextWordPronunciation: PUserType14;
    eLexiconType: SPLEXICONTYPE;
    LangId: Word;
    wPronunciationFlags: Word;
    ePartOfSpeech: SPPARTOFSPEECH;
    szPronunciation: array [0 .. 0] of Word;
  end;

  SPWORD = record
    pNextWord: PUserType15;
    LangId: Word;
    wReserved: Word;
    eWordType: SPWORDTYPE;
    pszWord: PWideChar;
    pFirstWordPronunciation: ^SPWORDPRONUNCIATION;
  end;

  SPSHORTCUTPAIR = record
    pNextSHORTCUTPAIR: PUserType16;
    LangId: Word;
    shType: SPSHORTCUTTYPE;
    pszDisplay: PWideChar;
    pszSpoken: PWideChar;
  end;

  SPRULE = record
    pszRuleName: PWideChar;
    ulRuleId: LongWord;
    dwAttributes: LongWord;
  end;

  ULONG_PTR = LongWord;

{$ALIGN 8}

  SPPHRASEPROPERTY = record
    pszName: PWideChar;
    __MIDL____MIDL_itf_sapi_0000_00200001
      : __MIDL___MIDL_itf_sapi_0000_0020_0001;
    pszValue: PWideChar;
    vValue: OleVariant;
    ulFirstElement: LongWord;
    ulCountOfElements: LongWord;
    pNextSibling: PUserType10;
    pFirstChild: PUserType10;
    SREngineConfidence: Single;
    Confidence: Shortint;
  end;

  SPPHRASE = record
    cbSize: LongWord;
    LangId: Word;
    wHomophoneGroupId: Word;
    ullGrammarID: Largeuint;
    ftStartTime: Largeuint;
    ullAudioStreamPosition: Largeuint;
    ulAudioSizeBytes: LongWord;
    ulRetainedSizeBytes: LongWord;
    ulAudioSizeTime: LongWord;
    Rule: SPPHRASERULE;
    pProperties: ^SPPHRASEPROPERTY;
    pElements: ^SPPHRASEELEMENT;
    cReplacements: LongWord;
    pReplacements: ^SPPHRASEREPLACEMENT;
    SREngineID: TGUID;
    ulSREnginePrivateDataSize: LongWord;
    pSREnginePrivateData: ^Byte;
    pSML: PWideChar;
    pSemanticErrorInfo: ^SPSEMANTICERRORINFO;
    SemanticTagFormat: SPSEMANTICFORMAT;
  end;

{$ALIGN 4}

  SPWORDPRONUNCIATIONLIST = record
    ulSize: LongWord;
    pvBuffer: ^Byte;
    pFirstWordPronunciation: ^SPWORDPRONUNCIATION;
  end;

  SPWORDLIST = record
    ulSize: LongWord;
    pvBuffer: ^Byte;
    pFirstWord: ^SPWORD;
  end;

  SPSHORTCUTPAIRLIST = record
    ulSize: LongWord;
    pvBuffer: ^Byte;
    pFirstShortcutPair: ^SPSHORTCUTPAIR;
  end;

  ISpeechDataKey = interface(IDispatch)
    ['{CE17C09B-4EFA-44D5-A4C9-59D9585AB0CD}']
    procedure SetBinaryValue(const ValueName: WideString;
      Value: OleVariant); safecall;
    function GetBinaryValue(const ValueName: WideString): OleVariant; safecall;
    procedure SetStringValue(const ValueName: WideString;
      const Value: WideString); safecall;
    function GetStringValue(const ValueName: WideString): WideString; safecall;
    procedure SetLongValue(const ValueName: WideString;
      Value: Integer); safecall;
    function GetLongValue(const ValueName: WideString): Integer; safecall;
    function OpenKey(const SubKeyName: WideString): ISpeechDataKey; safecall;
    function CreateKey(const SubKeyName: WideString): ISpeechDataKey; safecall;
    procedure DeleteKey(const SubKeyName: WideString); safecall;
    procedure DeleteValue(const ValueName: WideString); safecall;
    function EnumKeys(Index: Integer): WideString; safecall;
    function EnumValues(Index: Integer): WideString; safecall;
  end;

  ISpeechDataKeyDisp = dispinterface
    ['{CE17C09B-4EFA-44D5-A4C9-59D9585AB0CD}']
    procedure SetBinaryValue(const ValueName: WideString;
      Value: OleVariant); dispid 1;
    function GetBinaryValue(const ValueName: WideString): OleVariant; dispid 2;
    procedure SetStringValue(const ValueName: WideString;
      const Value: WideString); dispid 3;
    function GetStringValue(const ValueName: WideString): WideString; dispid 4;
    procedure SetLongValue(const ValueName: WideString;
      Value: Integer); dispid 5;
    function GetLongValue(const ValueName: WideString): Integer; dispid 6;
    function OpenKey(const SubKeyName: WideString): ISpeechDataKey; dispid 7;
    function CreateKey(const SubKeyName: WideString): ISpeechDataKey; dispid 8;
    procedure DeleteKey(const SubKeyName: WideString); dispid 9;
    procedure DeleteValue(const ValueName: WideString); dispid 10;
    function EnumKeys(Index: Integer): WideString; dispid 11;
    function EnumValues(Index: Integer): WideString; dispid 12;
  end;

  ISpeechObjectToken = interface(IDispatch)
    ['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
    function Get_Id: WideString; safecall;
    function Get_DataKey: ISpeechDataKey; safecall;
    function Get_Category: ISpeechObjectTokenCategory; safecall;
    function GetDescription(Locale: Integer): WideString; safecall;
    procedure SetId(const Id: WideString; const CategoryID: WideString;
      CreateIfNotExist: WordBool); safecall;
    function GetAttribute(const AttributeName: WideString): WideString;
      safecall;
    function CreateInstance(const pUnkOuter: IUnknown;
      ClsContext: SpeechTokenContext): IUnknown; safecall;
    procedure Remove(const ObjectStorageCLSID: WideString); safecall;
    function GetStorageFileName(const ObjectStorageCLSID: WideString;
      const KeyName: WideString; const FileName: WideString;
      Folder: SpeechTokenShellFolder): WideString; safecall;
    procedure RemoveStorageFileName(const ObjectStorageCLSID: WideString;
      const KeyName: WideString; DeleteFile: WordBool); safecall;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant; const Object_: IUnknown): WordBool; safecall;
    procedure DisplayUI(hWnd: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant;
      const Object_: IUnknown); safecall;
    function MatchesAttributes(const Attributes: WideString): WordBool;
      safecall;
    property Id: WideString read Get_Id;
    property DataKey: ISpeechDataKey read Get_DataKey;
    property Category: ISpeechObjectTokenCategory read Get_Category;
  end;

  ISpeechObjectTokenDisp = dispinterface
    ['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
    property Id: WideString readonly dispid 1;
    property DataKey: ISpeechDataKey readonly dispid 2;
    property Category: ISpeechObjectTokenCategory readonly dispid 3;
    function GetDescription(Locale: Integer): WideString; dispid 4;
    procedure SetId(const Id: WideString; const CategoryID: WideString;
      CreateIfNotExist: WordBool); dispid 5;
    function GetAttribute(const AttributeName: WideString): WideString;
      dispid 6;
    function CreateInstance(const pUnkOuter: IUnknown;
      ClsContext: SpeechTokenContext): IUnknown; dispid 7;
    procedure Remove(const ObjectStorageCLSID: WideString); dispid 8;
    function GetStorageFileName(const ObjectStorageCLSID: WideString;
      const KeyName: WideString; const FileName: WideString;
      Folder: SpeechTokenShellFolder): WideString; dispid 9;
    procedure RemoveStorageFileName(const ObjectStorageCLSID: WideString;
      const KeyName: WideString; DeleteFile: WordBool); dispid 10;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant; const Object_: IUnknown): WordBool;
      dispid 11;
    procedure DisplayUI(hWnd: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant;
      const Object_: IUnknown); dispid 12;
    function MatchesAttributes(const Attributes: WideString): WordBool;
      dispid 13;
  end;

  ISpeechObjectTokenCategory = interface(IDispatch)
    ['{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}']
    function Get_Id: WideString; safecall;
    procedure Set_Default(const TokenId: WideString); safecall;
    function Get_Default: WideString; safecall;
    procedure SetId(const Id: WideString; CreateIfNotExist: WordBool); safecall;
    function GetDataKey(Location: SpeechDataKeyLocation)
      : ISpeechDataKey; safecall;
    function EnumerateTokens(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    property Id: WideString read Get_Id;
    property Default: WideString read Get_Default write Set_Default;
  end;

  ISpeechObjectTokenCategoryDisp = dispinterface
    ['{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}']
    property Id: WideString readonly dispid 1;
    property Default: WideString dispid 2;
    procedure SetId(const Id: WideString; CreateIfNotExist: WordBool); dispid 3;
    function GetDataKey(Location: SpeechDataKeyLocation)
      : ISpeechDataKey; dispid 4;
    function EnumerateTokens(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; dispid 5;
  end;

  ISpeechObjectTokens = interface(IDispatch)
    ['{9285B776-2E7B-4BC0-B53E-580EB6FA967F}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechObjectToken; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechObjectTokensDisp = dispinterface
    ['{9285B776-2E7B-4BC0-B53E-580EB6FA967F}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechObjectToken; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechAudioBufferInfo = interface(IDispatch)
    ['{11B103D8-1142-4EDF-A093-82FB3915F8CC}']
    function Get_MinNotification: Integer; safecall;
    procedure Set_MinNotification(MinNotification: Integer); safecall;
    function Get_BufferSize: Integer; safecall;
    procedure Set_BufferSize(BufferSize: Integer); safecall;
    function Get_EventBias: Integer; safecall;
    procedure Set_EventBias(EventBias: Integer); safecall;
    property MinNotification: Integer read Get_MinNotification
      write Set_MinNotification;
    property BufferSize: Integer read Get_BufferSize write Set_BufferSize;
    property EventBias: Integer read Get_EventBias write Set_EventBias;
  end;

  ISpeechAudioBufferInfoDisp = dispinterface
    ['{11B103D8-1142-4EDF-A093-82FB3915F8CC}']
    property MinNotification: Integer dispid 1;
    property BufferSize: Integer dispid 2;
    property EventBias: Integer dispid 3;
  end;

  ISpeechAudioStatus = interface(IDispatch)
    ['{C62D9C91-7458-47F6-862D-1EF86FB0B278}']
    function Get_FreeBufferSpace: Integer; safecall;
    function Get_NonBlockingIO: Integer; safecall;
    function Get_State: SpeechAudioState; safecall;
    function Get_CurrentSeekPosition: OleVariant; safecall;
    function Get_CurrentDevicePosition: OleVariant; safecall;
    property FreeBufferSpace: Integer read Get_FreeBufferSpace;
    property NonBlockingIO: Integer read Get_NonBlockingIO;
    property State: SpeechAudioState read Get_State;
    property CurrentSeekPosition: OleVariant read Get_CurrentSeekPosition;
    property CurrentDevicePosition: OleVariant read Get_CurrentDevicePosition;
  end;

  ISpeechAudioStatusDisp = dispinterface
    ['{C62D9C91-7458-47F6-862D-1EF86FB0B278}']
    property FreeBufferSpace: Integer readonly dispid 1;
    property NonBlockingIO: Integer readonly dispid 2;
    property State: SpeechAudioState readonly dispid 3;
    property CurrentSeekPosition: OleVariant readonly dispid 4;
    property CurrentDevicePosition: OleVariant readonly dispid 5;
  end;

  ISpeechAudioFormat = interface(IDispatch)
    ['{E6E9C590-3E18-40E3-8299-061F98BDE7C7}']
    function Get_type_: SpeechAudioFormatType; safecall;
    procedure Set_type_(AudioFormat: SpeechAudioFormatType); safecall;
    function Get_Guid: WideString; safecall;
    procedure Set_Guid(const Guid: WideString); safecall;
    function GetWaveFormatEx: ISpeechWaveFormatEx; safecall;
    procedure SetWaveFormatEx(const SpeechWaveFormatEx
      : ISpeechWaveFormatEx); safecall;
    property type_: SpeechAudioFormatType read Get_type_ write Set_type_;
    property Guid: WideString read Get_Guid write Set_Guid;
  end;

  ISpeechAudioFormatDisp = dispinterface
    ['{E6E9C590-3E18-40E3-8299-061F98BDE7C7}']
    property type_: SpeechAudioFormatType dispid 1;
    property Guid: WideString dispid 2;
    function GetWaveFormatEx: ISpeechWaveFormatEx; dispid 3;
    procedure SetWaveFormatEx(const SpeechWaveFormatEx
      : ISpeechWaveFormatEx); dispid 4;
  end;

  ISpeechWaveFormatEx = interface(IDispatch)
    ['{7A1EF0D5-1581-4741-88E4-209A49F11A10}']
    function Get_FormatTag: Smallint; safecall;
    procedure Set_FormatTag(FormatTag: Smallint); safecall;
    function Get_Channels: Smallint; safecall;
    procedure Set_Channels(Channels: Smallint); safecall;
    function Get_SamplesPerSec: Integer; safecall;
    procedure Set_SamplesPerSec(SamplesPerSec: Integer); safecall;
    function Get_AvgBytesPerSec: Integer; safecall;
    procedure Set_AvgBytesPerSec(AvgBytesPerSec: Integer); safecall;
    function Get_BlockAlign: Smallint; safecall;
    procedure Set_BlockAlign(BlockAlign: Smallint); safecall;
    function Get_BitsPerSample: Smallint; safecall;
    procedure Set_BitsPerSample(BitsPerSample: Smallint); safecall;
    function Get_ExtraData: OleVariant; safecall;
    procedure Set_ExtraData(ExtraData: OleVariant); safecall;
    property FormatTag: Smallint read Get_FormatTag write Set_FormatTag;
    property Channels: Smallint read Get_Channels write Set_Channels;
    property SamplesPerSec: Integer read Get_SamplesPerSec
      write Set_SamplesPerSec;
    property AvgBytesPerSec: Integer read Get_AvgBytesPerSec
      write Set_AvgBytesPerSec;
    property BlockAlign: Smallint read Get_BlockAlign write Set_BlockAlign;
    property BitsPerSample: Smallint read Get_BitsPerSample
      write Set_BitsPerSample;
    property ExtraData: OleVariant read Get_ExtraData write Set_ExtraData;
  end;

  ISpeechWaveFormatExDisp = dispinterface
    ['{7A1EF0D5-1581-4741-88E4-209A49F11A10}']
    property FormatTag: Smallint dispid 1;
    property Channels: Smallint dispid 2;
    property SamplesPerSec: Integer dispid 3;
    property AvgBytesPerSec: Integer dispid 4;
    property BlockAlign: Smallint dispid 5;
    property BitsPerSample: Smallint dispid 6;
    property ExtraData: OleVariant dispid 7;
  end;

  ISpeechBaseStream = interface(IDispatch)
    ['{6450336F-7D49-4CED-8097-49D6DEE37294}']
    function Get_Format: ISpeechAudioFormat; safecall;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat); safecall;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; safecall;
    function Write(Buffer: OleVariant): Integer; safecall;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; safecall;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
  end;

  ISpeechBaseStreamDisp = dispinterface
    ['{6450336F-7D49-4CED-8097-49D6DEE37294}']
    property Format: ISpeechAudioFormat dispid 1;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; dispid 2;
    function Write(Buffer: OleVariant): Integer; dispid 3;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; dispid 4;
  end;

  ISpeechFileStream = interface(ISpeechBaseStream)
    ['{AF67F125-AB39-4E93-B4A2-CC2E66E182A7}']
    procedure Open(const FileName: WideString; FileMode: SpeechStreamFileMode;
      DoEvents: WordBool); safecall;
    procedure Close; safecall;
  end;

  ISpeechFileStreamDisp = dispinterface
    ['{AF67F125-AB39-4E93-B4A2-CC2E66E182A7}']
    procedure Open(const FileName: WideString; FileMode: SpeechStreamFileMode;
      DoEvents: WordBool); dispid 100;
    procedure Close; dispid 101;
    property Format: ISpeechAudioFormat dispid 1;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; dispid 2;
    function Write(Buffer: OleVariant): Integer; dispid 3;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; dispid 4;
  end;

  ISpeechMemoryStream = interface(ISpeechBaseStream)
    ['{EEB14B68-808B-4ABE-A5EA-B51DA7588008}']
    procedure SetData(Data: OleVariant); safecall;
    function GetData: OleVariant; safecall;
  end;

  ISpeechMemoryStreamDisp = dispinterface
    ['{EEB14B68-808B-4ABE-A5EA-B51DA7588008}']
    procedure SetData(Data: OleVariant); dispid 100;
    function GetData: OleVariant; dispid 101;
    property Format: ISpeechAudioFormat dispid 1;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; dispid 2;
    function Write(Buffer: OleVariant): Integer; dispid 3;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; dispid 4;
  end;

  ISpeechCustomStream = interface(ISpeechBaseStream)
    ['{1A9E9F4F-104F-4DB8-A115-EFD7FD0C97AE}']
    function Get_BaseStream: IUnknown; safecall;
    procedure _Set_BaseStream(const ppUnkStream: IUnknown); safecall;
    property BaseStream: IUnknown read Get_BaseStream write _Set_BaseStream;
  end;

  ISpeechCustomStreamDisp = dispinterface
    ['{1A9E9F4F-104F-4DB8-A115-EFD7FD0C97AE}']
    property BaseStream: IUnknown dispid 100;
    property Format: ISpeechAudioFormat dispid 1;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; dispid 2;
    function Write(Buffer: OleVariant): Integer; dispid 3;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; dispid 4;
  end;

  ISpeechAudio = interface(ISpeechBaseStream)
    ['{CFF8E175-019E-11D3-A08E-00C04F8EF9B5}']
    function Get_Status: ISpeechAudioStatus; safecall;
    function Get_BufferInfo: ISpeechAudioBufferInfo; safecall;
    function Get_DefaultFormat: ISpeechAudioFormat; safecall;
    function Get_Volume: Integer; safecall;
    procedure Set_Volume(Volume: Integer); safecall;
    function Get_BufferNotifySize: Integer; safecall;
    procedure Set_BufferNotifySize(BufferNotifySize: Integer); safecall;
    function Get_EventHandle: Integer; safecall;
    procedure SetState(State: SpeechAudioState); safecall;
    property Status: ISpeechAudioStatus read Get_Status;
    property BufferInfo: ISpeechAudioBufferInfo read Get_BufferInfo;
    property DefaultFormat: ISpeechAudioFormat read Get_DefaultFormat;
    property Volume: Integer read Get_Volume write Set_Volume;
    property BufferNotifySize: Integer read Get_BufferNotifySize
      write Set_BufferNotifySize;
    property EventHandle: Integer read Get_EventHandle;
  end;

  ISpeechAudioDisp = dispinterface
    ['{CFF8E175-019E-11D3-A08E-00C04F8EF9B5}']
    property Status: ISpeechAudioStatus readonly dispid 200;
    property BufferInfo: ISpeechAudioBufferInfo readonly dispid 201;
    property DefaultFormat: ISpeechAudioFormat readonly dispid 202;
    property Volume: Integer dispid 203;
    property BufferNotifySize: Integer dispid 204;
    property EventHandle: Integer readonly dispid 205;
    procedure SetState(State: SpeechAudioState); dispid 206;
    property Format: ISpeechAudioFormat dispid 1;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; dispid 2;
    function Write(Buffer: OleVariant): Integer; dispid 3;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; dispid 4;
  end;

  ISpeechMMSysAudio = interface(ISpeechAudio)
    ['{3C76AF6D-1FD7-4831-81D1-3B71D5A13C44}']
    function Get_DeviceId: Integer; safecall;
    procedure Set_DeviceId(DeviceId: Integer); safecall;
    function Get_LineId: Integer; safecall;
    procedure Set_LineId(LineId: Integer); safecall;
    function Get_MMHandle: Integer; safecall;
    property DeviceId: Integer read Get_DeviceId write Set_DeviceId;
    property LineId: Integer read Get_LineId write Set_LineId;
    property MMHandle: Integer read Get_MMHandle;
  end;

  ISpeechMMSysAudioDisp = dispinterface
    ['{3C76AF6D-1FD7-4831-81D1-3B71D5A13C44}']
    property DeviceId: Integer dispid 300;
    property LineId: Integer dispid 301;
    property MMHandle: Integer readonly dispid 302;
    property Status: ISpeechAudioStatus readonly dispid 200;
    property BufferInfo: ISpeechAudioBufferInfo readonly dispid 201;
    property DefaultFormat: ISpeechAudioFormat readonly dispid 202;
    property Volume: Integer dispid 203;
    property BufferNotifySize: Integer dispid 204;
    property EventHandle: Integer readonly dispid 205;
    procedure SetState(State: SpeechAudioState); dispid 206;
    property Format: ISpeechAudioFormat dispid 1;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer)
      : Integer; dispid 2;
    function Write(Buffer: OleVariant): Integer; dispid 3;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant; dispid 4;
  end;

  ISpeechVoice = interface(IDispatch)
    ['{269316D8-57BD-11D2-9EEE-00C04F797396}']
    function Get_Status: ISpeechVoiceStatus; safecall;
    function Get_Voice: ISpeechObjectToken; safecall;
    procedure _Set_Voice(const Voice: ISpeechObjectToken); safecall;
    function Get_AudioOutput: ISpeechObjectToken; safecall;
    procedure _Set_AudioOutput(const AudioOutput: ISpeechObjectToken); safecall;
    function Get_AudioOutputStream: ISpeechBaseStream; safecall;
    procedure _Set_AudioOutputStream(const AudioOutputStream
      : ISpeechBaseStream); safecall;
    function Get_Rate: Integer; safecall;
    procedure Set_Rate(Rate: Integer); safecall;
    function Get_Volume: Integer; safecall;
    procedure Set_Volume(Volume: Integer); safecall;
    procedure Set_AllowAudioOutputFormatChangesOnNextSet
      (Allow: WordBool); safecall;
    function Get_AllowAudioOutputFormatChangesOnNextSet: WordBool; safecall;
    function Get_EventInterests: SpeechVoiceEvents; safecall;
    procedure Set_EventInterests(EventInterestFlags
      : SpeechVoiceEvents); safecall;
    procedure Set_Priority(Priority: SpeechVoicePriority); safecall;
    function Get_Priority: SpeechVoicePriority; safecall;
    procedure Set_AlertBoundary(Boundary: SpeechVoiceEvents); safecall;
    function Get_AlertBoundary: SpeechVoiceEvents; safecall;
    procedure Set_SynchronousSpeakTimeout(msTimeout: Integer); safecall;
    function Get_SynchronousSpeakTimeout: Integer; safecall;
    function Speak(const Text: WideString; Flags: SpeechVoiceSpeakFlags)
      : Integer; safecall;
    function SpeakStream(const Stream: ISpeechBaseStream;
      Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    procedure Pause; safecall;
    procedure Resume; safecall;
    function Skip(const type_: WideString; NumItems: Integer): Integer;
      safecall;
    function GetVoices(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function GetAudioOutputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function WaitUntilDone(msTimeout: Integer): WordBool; safecall;
    function SpeakCompleteEvent: Integer; safecall;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; safecall;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); safecall;
    property Status: ISpeechVoiceStatus read Get_Status;
    property Voice: ISpeechObjectToken read Get_Voice write _Set_Voice;
    property AudioOutput: ISpeechObjectToken read Get_AudioOutput
      write _Set_AudioOutput;
    property AudioOutputStream: ISpeechBaseStream read Get_AudioOutputStream
      write _Set_AudioOutputStream;
    property Rate: Integer read Get_Rate write Set_Rate;
    property Volume: Integer read Get_Volume write Set_Volume;
    property AllowAudioOutputFormatChangesOnNextSet: WordBool
      read Get_AllowAudioOutputFormatChangesOnNextSet
      write Set_AllowAudioOutputFormatChangesOnNextSet;
    property EventInterests: SpeechVoiceEvents read Get_EventInterests
      write Set_EventInterests;
    property Priority: SpeechVoicePriority read Get_Priority write Set_Priority;
    property AlertBoundary: SpeechVoiceEvents read Get_AlertBoundary
      write Set_AlertBoundary;
    property SynchronousSpeakTimeout: Integer read Get_SynchronousSpeakTimeout
      write Set_SynchronousSpeakTimeout;
  end;

  ISpeechVoiceDisp = dispinterface
    ['{269316D8-57BD-11D2-9EEE-00C04F797396}']
    property Status: ISpeechVoiceStatus readonly dispid 1;
    property Voice: ISpeechObjectToken dispid 2;
    property AudioOutput: ISpeechObjectToken dispid 3;
    property AudioOutputStream: ISpeechBaseStream dispid 4;
    property Rate: Integer dispid 5;
    property Volume: Integer dispid 6;
    property AllowAudioOutputFormatChangesOnNextSet: WordBool dispid 7;
    property EventInterests: SpeechVoiceEvents dispid 8;
    property Priority: SpeechVoicePriority dispid 9;
    property AlertBoundary: SpeechVoiceEvents dispid 10;
    property SynchronousSpeakTimeout: Integer dispid 11;
    function Speak(const Text: WideString; Flags: SpeechVoiceSpeakFlags)
      : Integer; dispid 12;
    function SpeakStream(const Stream: ISpeechBaseStream;
      Flags: SpeechVoiceSpeakFlags): Integer; dispid 13;
    procedure Pause; dispid 14;
    procedure Resume; dispid 15;
    function Skip(const type_: WideString; NumItems: Integer): Integer;
      dispid 16;
    function GetVoices(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; dispid 17;
    function GetAudioOutputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; dispid 18;
    function WaitUntilDone(msTimeout: Integer): WordBool; dispid 19;
    function SpeakCompleteEvent: Integer; dispid 20;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; dispid 21;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); dispid 22;
  end;

  ISpeechVoiceStatus = interface(IDispatch)
    ['{8BE47B07-57F6-11D2-9EEE-00C04F797396}']
    function Get_CurrentStreamNumber: Integer; safecall;
    function Get_LastStreamNumberQueued: Integer; safecall;
    function Get_LastHResult: Integer; safecall;
    function Get_RunningState: SpeechRunState; safecall;
    function Get_InputWordPosition: Integer; safecall;
    function Get_InputWordLength: Integer; safecall;
    function Get_InputSentencePosition: Integer; safecall;
    function Get_InputSentenceLength: Integer; safecall;
    function Get_LastBookmark: WideString; safecall;
    function Get_LastBookmarkId: Integer; safecall;
    function Get_PhonemeId: Smallint; safecall;
    function Get_VisemeId: Smallint; safecall;
    property CurrentStreamNumber: Integer read Get_CurrentStreamNumber;
    property LastStreamNumberQueued: Integer read Get_LastStreamNumberQueued;
    property LastHResult: Integer read Get_LastHResult;
    property RunningState: SpeechRunState read Get_RunningState;
    property InputWordPosition: Integer read Get_InputWordPosition;
    property InputWordLength: Integer read Get_InputWordLength;
    property InputSentencePosition: Integer read Get_InputSentencePosition;
    property InputSentenceLength: Integer read Get_InputSentenceLength;
    property LastBookmark: WideString read Get_LastBookmark;
    property LastBookmarkId: Integer read Get_LastBookmarkId;
    property PhonemeId: Smallint read Get_PhonemeId;
    property VisemeId: Smallint read Get_VisemeId;
  end;

  ISpeechVoiceStatusDisp = dispinterface
    ['{8BE47B07-57F6-11D2-9EEE-00C04F797396}']
    property CurrentStreamNumber: Integer readonly dispid 1;
    property LastStreamNumberQueued: Integer readonly dispid 2;
    property LastHResult: Integer readonly dispid 3;
    property RunningState: SpeechRunState readonly dispid 4;
    property InputWordPosition: Integer readonly dispid 5;
    property InputWordLength: Integer readonly dispid 6;
    property InputSentencePosition: Integer readonly dispid 7;
    property InputSentenceLength: Integer readonly dispid 8;
    property LastBookmark: WideString readonly dispid 9;
    property LastBookmarkId: Integer readonly dispid 10;
    property PhonemeId: Smallint readonly dispid 11;
    property VisemeId: Smallint readonly dispid 12;
  end;

  _ISpeechVoiceEvents = dispinterface
    ['{A372ACD1-3BEF-4BBD-8FFB-CB3E2B416AF8}']
    procedure StartStream(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 1;
    procedure EndStream(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 2;
    procedure VoiceChange(StreamNumber: Integer; StreamPosition: OleVariant;
      const VoiceObjectToken: ISpeechObjectToken); dispid 3;
    procedure Bookmark(StreamNumber: Integer; StreamPosition: OleVariant;
      const Bookmark: WideString; BookmarkId: Integer); dispid 4;
    procedure Word(StreamNumber: Integer; StreamPosition: OleVariant;
      CharacterPosition: Integer; Length: Integer); dispid 5;
    procedure Sentence(StreamNumber: Integer; StreamPosition: OleVariant;
      CharacterPosition: Integer; Length: Integer); dispid 7;
    procedure Phoneme(StreamNumber: Integer; StreamPosition: OleVariant;
      Duration: Integer; NextPhoneId: Smallint; Feature: SpeechVisemeFeature;
      CurrentPhoneId: Smallint); dispid 6;
    procedure Viseme(StreamNumber: Integer; StreamPosition: OleVariant;
      Duration: Integer; NextVisemeId: SpeechVisemeType;
      Feature: SpeechVisemeFeature; CurrentVisemeId: SpeechVisemeType);
      dispid 8;
    procedure AudioLevel(StreamNumber: Integer; StreamPosition: OleVariant;
      AudioLevel: Integer); dispid 9;
    procedure EnginePrivate(StreamNumber: Integer; StreamPosition: Integer;
      EngineData: OleVariant); dispid 10;
  end;

  ISpeechRecognizer = interface(IDispatch)
    ['{2D5F1C0C-BD75-4B08-9478-3B11FEA2586C}']
    procedure _Set_Recognizer(const Recognizer: ISpeechObjectToken); safecall;
    function Get_Recognizer: ISpeechObjectToken; safecall;
    procedure Set_AllowAudioInputFormatChangesOnNextSet
      (Allow: WordBool); safecall;
    function Get_AllowAudioInputFormatChangesOnNextSet: WordBool; safecall;
    procedure _Set_AudioInput(const AudioInput: ISpeechObjectToken); safecall;
    function Get_AudioInput: ISpeechObjectToken; safecall;
    procedure _Set_AudioInputStream(const AudioInputStream
      : ISpeechBaseStream); safecall;
    function Get_AudioInputStream: ISpeechBaseStream; safecall;
    function Get_IsShared: WordBool; safecall;
    procedure Set_State(State: SpeechRecognizerState); safecall;
    function Get_State: SpeechRecognizerState; safecall;
    function Get_Status: ISpeechRecognizerStatus; safecall;
    procedure _Set_Profile(const Profile: ISpeechObjectToken); safecall;
    function Get_Profile: ISpeechObjectToken; safecall;
    procedure EmulateRecognition(TextElements: OleVariant;
      const ElementDisplayAttributes: OleVariant; LanguageId: Integer);
      safecall;
    function CreateRecoContext: ISpeechRecoContext; safecall;
    function GetFormat(type_: SpeechFormatType): ISpeechAudioFormat; safecall;
    function SetPropertyNumber(const Name: WideString; Value: Integer)
      : WordBool; safecall;
    function GetPropertyNumber(const Name: WideString; var Value: Integer)
      : WordBool; safecall;
    function SetPropertyString(const Name: WideString; const Value: WideString)
      : WordBool; safecall;
    function GetPropertyString(const Name: WideString; var Value: WideString)
      : WordBool; safecall;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; safecall;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); safecall;
    function GetRecognizers(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function GetAudioInputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function GetProfiles(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    property Recognizer: ISpeechObjectToken read Get_Recognizer
      write _Set_Recognizer;
    property AllowAudioInputFormatChangesOnNextSet: WordBool
      read Get_AllowAudioInputFormatChangesOnNextSet
      write Set_AllowAudioInputFormatChangesOnNextSet;
    property AudioInput: ISpeechObjectToken read Get_AudioInput
      write _Set_AudioInput;
    property AudioInputStream: ISpeechBaseStream read Get_AudioInputStream
      write _Set_AudioInputStream;
    property IsShared: WordBool read Get_IsShared;
    property State: SpeechRecognizerState read Get_State write Set_State;
    property Status: ISpeechRecognizerStatus read Get_Status;
    property Profile: ISpeechObjectToken read Get_Profile write _Set_Profile;
  end;

  ISpeechRecognizerDisp = dispinterface
    ['{2D5F1C0C-BD75-4B08-9478-3B11FEA2586C}']
    property Recognizer: ISpeechObjectToken dispid 1;
    property AllowAudioInputFormatChangesOnNextSet: WordBool dispid 2;
    property AudioInput: ISpeechObjectToken dispid 3;
    property AudioInputStream: ISpeechBaseStream dispid 4;
    property IsShared: WordBool readonly dispid 5;
    property State: SpeechRecognizerState dispid 6;
    property Status: ISpeechRecognizerStatus readonly dispid 7;
    property Profile: ISpeechObjectToken dispid 8;
    procedure EmulateRecognition(TextElements: OleVariant;
      const ElementDisplayAttributes: OleVariant; LanguageId: Integer);
      dispid 9;
    function CreateRecoContext: ISpeechRecoContext; dispid 10;
    function GetFormat(type_: SpeechFormatType): ISpeechAudioFormat; dispid 11;
    function SetPropertyNumber(const Name: WideString; Value: Integer)
      : WordBool; dispid 12;
    function GetPropertyNumber(const Name: WideString; var Value: Integer)
      : WordBool; dispid 13;
    function SetPropertyString(const Name: WideString; const Value: WideString)
      : WordBool; dispid 14;
    function GetPropertyString(const Name: WideString; var Value: WideString)
      : WordBool; dispid 15;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; dispid 16;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); dispid 17;
    function GetRecognizers(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; dispid 18;
    function GetAudioInputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; dispid 19;
    function GetProfiles(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens; dispid 20;
  end;

  ISpeechRecognizerStatus = interface(IDispatch)
    ['{BFF9E781-53EC-484E-BB8A-0E1B5551E35C}']
    function Get_AudioStatus: ISpeechAudioStatus; safecall;
    function Get_CurrentStreamPosition: OleVariant; safecall;
    function Get_CurrentStreamNumber: Integer; safecall;
    function Get_NumberOfActiveRules: Integer; safecall;
    function Get_ClsidEngine: WideString; safecall;
    function Get_SupportedLanguages: OleVariant; safecall;
    property AudioStatus: ISpeechAudioStatus read Get_AudioStatus;
    property CurrentStreamPosition: OleVariant read Get_CurrentStreamPosition;
    property CurrentStreamNumber: Integer read Get_CurrentStreamNumber;
    property NumberOfActiveRules: Integer read Get_NumberOfActiveRules;
    property ClsidEngine: WideString read Get_ClsidEngine;
    property SupportedLanguages: OleVariant read Get_SupportedLanguages;
  end;

  ISpeechRecognizerStatusDisp = dispinterface
    ['{BFF9E781-53EC-484E-BB8A-0E1B5551E35C}']
    property AudioStatus: ISpeechAudioStatus readonly dispid 1;
    property CurrentStreamPosition: OleVariant readonly dispid 2;
    property CurrentStreamNumber: Integer readonly dispid 3;
    property NumberOfActiveRules: Integer readonly dispid 4;
    property ClsidEngine: WideString readonly dispid 5;
    property SupportedLanguages: OleVariant readonly dispid 6;
  end;

  ISpeechRecoContext = interface(IDispatch)
    ['{580AA49D-7E1E-4809-B8E2-57DA806104B8}']
    function Get_Recognizer: ISpeechRecognizer; safecall;
    function Get_AudioInputInterferenceStatus: SpeechInterference; safecall;
    function Get_RequestedUIType: WideString; safecall;
    procedure _Set_Voice(const Voice: ISpeechVoice); safecall;
    function Get_Voice: ISpeechVoice; safecall;
    procedure Set_AllowVoiceFormatMatchingOnNextSet(pAllow: WordBool); safecall;
    function Get_AllowVoiceFormatMatchingOnNextSet: WordBool; safecall;
    procedure Set_VoicePurgeEvent(EventInterest: SpeechRecoEvents); safecall;
    function Get_VoicePurgeEvent: SpeechRecoEvents; safecall;
    procedure Set_EventInterests(EventInterest: SpeechRecoEvents); safecall;
    function Get_EventInterests: SpeechRecoEvents; safecall;
    procedure Set_CmdMaxAlternates(MaxAlternates: Integer); safecall;
    function Get_CmdMaxAlternates: Integer; safecall;
    procedure Set_State(State: SpeechRecoContextState); safecall;
    function Get_State: SpeechRecoContextState; safecall;
    procedure Set_RetainedAudio(Option: SpeechRetainedAudioOptions); safecall;
    function Get_RetainedAudio: SpeechRetainedAudioOptions; safecall;
    procedure _Set_RetainedAudioFormat(const Format
      : ISpeechAudioFormat); safecall;
    function Get_RetainedAudioFormat: ISpeechAudioFormat; safecall;
    procedure Pause; safecall;
    procedure Resume; safecall;
    function CreateGrammar(GrammarId: OleVariant): ISpeechRecoGrammar; safecall;
    function CreateResultFromMemory(const ResultBlock: OleVariant)
      : ISpeechRecoResult; safecall;
    procedure Bookmark(Options: SpeechBookmarkOptions; StreamPos: OleVariant;
      BookmarkId: OleVariant); safecall;
    procedure SetAdaptationData(const AdaptationString: WideString); safecall;
    property Recognizer: ISpeechRecognizer read Get_Recognizer;
    property AudioInputInterferenceStatus: SpeechInterference
      read Get_AudioInputInterferenceStatus;
    property RequestedUIType: WideString read Get_RequestedUIType;
    property Voice: ISpeechVoice read Get_Voice write _Set_Voice;
    property AllowVoiceFormatMatchingOnNextSet: WordBool
      read Get_AllowVoiceFormatMatchingOnNextSet
      write Set_AllowVoiceFormatMatchingOnNextSet;
    property VoicePurgeEvent: SpeechRecoEvents read Get_VoicePurgeEvent
      write Set_VoicePurgeEvent;
    property EventInterests: SpeechRecoEvents read Get_EventInterests
      write Set_EventInterests;
    property CmdMaxAlternates: Integer read Get_CmdMaxAlternates
      write Set_CmdMaxAlternates;
    property State: SpeechRecoContextState read Get_State write Set_State;
    property RetainedAudio: SpeechRetainedAudioOptions read Get_RetainedAudio
      write Set_RetainedAudio;
    property RetainedAudioFormat: ISpeechAudioFormat
      read Get_RetainedAudioFormat write _Set_RetainedAudioFormat;
  end;

  ISpeechRecoContextDisp = dispinterface
    ['{580AA49D-7E1E-4809-B8E2-57DA806104B8}']
    property Recognizer: ISpeechRecognizer readonly dispid 1;
    property AudioInputInterferenceStatus: SpeechInterference readonly dispid 2;
    property RequestedUIType: WideString readonly dispid 3;
    property Voice: ISpeechVoice dispid 4;
    property AllowVoiceFormatMatchingOnNextSet: WordBool dispid 5;
    property VoicePurgeEvent: SpeechRecoEvents dispid 6;
    property EventInterests: SpeechRecoEvents dispid 7;
    property CmdMaxAlternates: Integer dispid 8;
    property State: SpeechRecoContextState dispid 9;
    property RetainedAudio: SpeechRetainedAudioOptions dispid 10;
    property RetainedAudioFormat: ISpeechAudioFormat dispid 11;
    procedure Pause; dispid 12;
    procedure Resume; dispid 13;
    function CreateGrammar(GrammarId: OleVariant): ISpeechRecoGrammar;
      dispid 14;
    function CreateResultFromMemory(const ResultBlock: OleVariant)
      : ISpeechRecoResult; dispid 15;
    procedure Bookmark(Options: SpeechBookmarkOptions; StreamPos: OleVariant;
      BookmarkId: OleVariant); dispid 16;
    procedure SetAdaptationData(const AdaptationString: WideString); dispid 17;
  end;

  ISpeechRecoGrammar = interface(IDispatch)
    ['{B6D6F79F-2158-4E50-B5BC-9A9CCD852A09}']
    function Get_Id: OleVariant; safecall;
    function Get_RecoContext: ISpeechRecoContext; safecall;
    procedure Set_State(State: SpeechGrammarState); safecall;
    function Get_State: SpeechGrammarState; safecall;
    function Get_Rules: ISpeechGrammarRules; safecall;
    procedure Reset(NewLanguage: Integer); safecall;
    procedure CmdLoadFromFile(const FileName: WideString;
      LoadOption: SpeechLoadOption); safecall;
    procedure CmdLoadFromObject(const ClassId: WideString;
      const GrammarName: WideString; LoadOption: SpeechLoadOption); safecall;
    procedure CmdLoadFromResource(hModule: Integer; ResourceName: OleVariant;
      ResourceType: OleVariant; LanguageId: Integer;
      LoadOption: SpeechLoadOption); safecall;
    procedure CmdLoadFromMemory(GrammarData: OleVariant;
      LoadOption: SpeechLoadOption); safecall;
    procedure CmdLoadFromProprietaryGrammar(const ProprietaryGuid: WideString;
      const ProprietaryString: WideString; ProprietaryData: OleVariant;
      LoadOption: SpeechLoadOption); safecall;
    procedure CmdSetRuleState(const Name: WideString;
      State: SpeechRuleState); safecall;
    procedure CmdSetRuleIdState(RuleId: Integer;
      State: SpeechRuleState); safecall;
    procedure DictationLoad(const TopicName: WideString;
      LoadOption: SpeechLoadOption); safecall;
    procedure DictationUnload; safecall;
    procedure DictationSetState(State: SpeechRuleState); safecall;
    procedure SetWordSequenceData(const Text: WideString; TextLength: Integer;
      const Info: ISpeechTextSelectionInformation); safecall;
    procedure SetTextSelection(const Info
      : ISpeechTextSelectionInformation); safecall;
    function IsPronounceable(const Word: WideString)
      : SpeechWordPronounceable; safecall;
    property Id: OleVariant read Get_Id;
    property RecoContext: ISpeechRecoContext read Get_RecoContext;
    property State: SpeechGrammarState read Get_State write Set_State;
    property Rules: ISpeechGrammarRules read Get_Rules;
  end;

  ISpeechRecoGrammarDisp = dispinterface
    ['{B6D6F79F-2158-4E50-B5BC-9A9CCD852A09}']
    property Id: OleVariant readonly dispid 1;
    property RecoContext: ISpeechRecoContext readonly dispid 2;
    property State: SpeechGrammarState dispid 3;
    property Rules: ISpeechGrammarRules readonly dispid 4;
    procedure Reset(NewLanguage: Integer); dispid 5;
    procedure CmdLoadFromFile(const FileName: WideString;
      LoadOption: SpeechLoadOption); dispid 7;
    procedure CmdLoadFromObject(const ClassId: WideString;
      const GrammarName: WideString; LoadOption: SpeechLoadOption); dispid 8;
    procedure CmdLoadFromResource(hModule: Integer; ResourceName: OleVariant;
      ResourceType: OleVariant; LanguageId: Integer;
      LoadOption: SpeechLoadOption); dispid 9;
    procedure CmdLoadFromMemory(GrammarData: OleVariant;
      LoadOption: SpeechLoadOption); dispid 10;
    procedure CmdLoadFromProprietaryGrammar(const ProprietaryGuid: WideString;
      const ProprietaryString: WideString; ProprietaryData: OleVariant;
      LoadOption: SpeechLoadOption); dispid 11;
    procedure CmdSetRuleState(const Name: WideString; State: SpeechRuleState);
      dispid 12;
    procedure CmdSetRuleIdState(RuleId: Integer; State: SpeechRuleState);
      dispid 13;
    procedure DictationLoad(const TopicName: WideString;
      LoadOption: SpeechLoadOption); dispid 14;
    procedure DictationUnload; dispid 15;
    procedure DictationSetState(State: SpeechRuleState); dispid 16;
    procedure SetWordSequenceData(const Text: WideString; TextLength: Integer;
      const Info: ISpeechTextSelectionInformation); dispid 17;
    procedure SetTextSelection(const Info: ISpeechTextSelectionInformation);
      dispid 18;
    function IsPronounceable(const Word: WideString): SpeechWordPronounceable;
      dispid 19;
  end;

  ISpeechGrammarRules = interface(IDispatch)
    ['{6FFA3B44-FC2D-40D1-8AFC-32911C7F1AD1}']
    function Get_Count: Integer; safecall;
    function FindRule(RuleNameOrId: OleVariant): ISpeechGrammarRule; safecall;
    function Item(Index: Integer): ISpeechGrammarRule; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Dynamic: WordBool; safecall;
    function Add(const RuleName: WideString; Attributes: SpeechRuleAttributes;
      RuleId: Integer): ISpeechGrammarRule; safecall;
    procedure Commit; safecall;
    function CommitAndSave(out ErrorText: WideString): OleVariant; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Dynamic: WordBool read Get_Dynamic;
  end;

  ISpeechGrammarRulesDisp = dispinterface
    ['{6FFA3B44-FC2D-40D1-8AFC-32911C7F1AD1}']
    property Count: Integer readonly dispid 1;
    function FindRule(RuleNameOrId: OleVariant): ISpeechGrammarRule; dispid 6;
    function Item(Index: Integer): ISpeechGrammarRule; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
    property Dynamic: WordBool readonly dispid 2;
    function Add(const RuleName: WideString; Attributes: SpeechRuleAttributes;
      RuleId: Integer): ISpeechGrammarRule; dispid 3;
    procedure Commit; dispid 4;
    function CommitAndSave(out ErrorText: WideString): OleVariant; dispid 5;
  end;

  ISpeechGrammarRule = interface(IDispatch)
    ['{AFE719CF-5DD1-44F2-999C-7A399F1CFCCC}']
    function Get_Attributes: SpeechRuleAttributes; safecall;
    function Get_InitialState: ISpeechGrammarRuleState; safecall;
    function Get_Name: WideString; safecall;
    function Get_Id: Integer; safecall;
    procedure Clear; safecall;
    procedure AddResource(const ResourceName: WideString;
      const ResourceValue: WideString); safecall;
    function AddState: ISpeechGrammarRuleState; safecall;
    property Attributes: SpeechRuleAttributes read Get_Attributes;
    property InitialState: ISpeechGrammarRuleState read Get_InitialState;
    property Name: WideString read Get_Name;
    property Id: Integer read Get_Id;
  end;

  ISpeechGrammarRuleDisp = dispinterface
    ['{AFE719CF-5DD1-44F2-999C-7A399F1CFCCC}']
    property Attributes: SpeechRuleAttributes readonly dispid 1;
    property InitialState: ISpeechGrammarRuleState readonly dispid 2;
    property Name: WideString readonly dispid 3;
    property Id: Integer readonly dispid 4;
    procedure Clear; dispid 5;
    procedure AddResource(const ResourceName: WideString;
      const ResourceValue: WideString); dispid 6;
    function AddState: ISpeechGrammarRuleState; dispid 7;
  end;

  ISpeechGrammarRuleState = interface(IDispatch)
    ['{D4286F2C-EE67-45AE-B928-28D695362EDA}']
    function Get_Rule: ISpeechGrammarRule; safecall;
    function Get_Transitions: ISpeechGrammarRuleStateTransitions; safecall;
    procedure AddWordTransition(const DestState: ISpeechGrammarRuleState;
      const Words: WideString; const Separators: WideString;
      type_: SpeechGrammarWordType; const PropertyName: WideString;
      PropertyId: Integer; const PropertyValue: OleVariant;
      Weight: Single); safecall;
    procedure AddRuleTransition(const DestinationState: ISpeechGrammarRuleState;
      const Rule: ISpeechGrammarRule; const PropertyName: WideString;
      PropertyId: Integer; const PropertyValue: OleVariant;
      Weight: Single); safecall;
    procedure AddSpecialTransition(const DestinationState
      : ISpeechGrammarRuleState; type_: SpeechSpecialTransitionType;
      const PropertyName: WideString; PropertyId: Integer;
      const PropertyValue: OleVariant; Weight: Single); safecall;
    property Rule: ISpeechGrammarRule read Get_Rule;
    property Transitions: ISpeechGrammarRuleStateTransitions
      read Get_Transitions;
  end;

  ISpeechGrammarRuleStateDisp = dispinterface
    ['{D4286F2C-EE67-45AE-B928-28D695362EDA}']
    property Rule: ISpeechGrammarRule readonly dispid 1;
    property Transitions: ISpeechGrammarRuleStateTransitions readonly dispid 2;
    procedure AddWordTransition(const DestState: ISpeechGrammarRuleState;
      const Words: WideString; const Separators: WideString;
      type_: SpeechGrammarWordType; const PropertyName: WideString;
      PropertyId: Integer; const PropertyValue: OleVariant;
      Weight: Single); dispid 3;
    procedure AddRuleTransition(const DestinationState: ISpeechGrammarRuleState;
      const Rule: ISpeechGrammarRule; const PropertyName: WideString;
      PropertyId: Integer; const PropertyValue: OleVariant;
      Weight: Single); dispid 4;
    procedure AddSpecialTransition(const DestinationState
      : ISpeechGrammarRuleState; type_: SpeechSpecialTransitionType;
      const PropertyName: WideString; PropertyId: Integer;
      const PropertyValue: OleVariant; Weight: Single); dispid 5;
  end;

  ISpeechGrammarRuleStateTransitions = interface(IDispatch)
    ['{EABCE657-75BC-44A2-AA7F-C56476742963}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechGrammarRuleStateTransition; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechGrammarRuleStateTransitionsDisp = dispinterface
    ['{EABCE657-75BC-44A2-AA7F-C56476742963}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechGrammarRuleStateTransition; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechGrammarRuleStateTransition = interface(IDispatch)
    ['{CAFD1DB1-41D1-4A06-9863-E2E81DA17A9A}']
    function Get_type_: SpeechGrammarRuleStateTransitionType; safecall;
    function Get_Text: WideString; safecall;
    function Get_Rule: ISpeechGrammarRule; safecall;
    function Get_Weight: OleVariant; safecall;
    function Get_PropertyName: WideString; safecall;
    function Get_PropertyId: Integer; safecall;
    function Get_PropertyValue: OleVariant; safecall;
    function Get_NextState: ISpeechGrammarRuleState; safecall;
    property type_: SpeechGrammarRuleStateTransitionType read Get_type_;
    property Text: WideString read Get_Text;
    property Rule: ISpeechGrammarRule read Get_Rule;
    property Weight: OleVariant read Get_Weight;
    property PropertyName: WideString read Get_PropertyName;
    property PropertyId: Integer read Get_PropertyId;
    property PropertyValue: OleVariant read Get_PropertyValue;
    property NextState: ISpeechGrammarRuleState read Get_NextState;
  end;

  ISpeechGrammarRuleStateTransitionDisp = dispinterface
    ['{CAFD1DB1-41D1-4A06-9863-E2E81DA17A9A}']
    property type_: SpeechGrammarRuleStateTransitionType readonly dispid 1;
    property Text: WideString readonly dispid 2;
    property Rule: ISpeechGrammarRule readonly dispid 3;
    property Weight: OleVariant readonly dispid 4;
    property PropertyName: WideString readonly dispid 5;
    property PropertyId: Integer readonly dispid 6;
    property PropertyValue: OleVariant readonly dispid 7;
    property NextState: ISpeechGrammarRuleState readonly dispid 8;
  end;

  ISpeechTextSelectionInformation = interface(IDispatch)
    ['{3B9C7E7A-6EEE-4DED-9092-11657279ADBE}']
    procedure Set_ActiveOffset(ActiveOffset: Integer); safecall;
    function Get_ActiveOffset: Integer; safecall;
    procedure Set_ActiveLength(ActiveLength: Integer); safecall;
    function Get_ActiveLength: Integer; safecall;
    procedure Set_SelectionOffset(SelectionOffset: Integer); safecall;
    function Get_SelectionOffset: Integer; safecall;
    procedure Set_SelectionLength(SelectionLength: Integer); safecall;
    function Get_SelectionLength: Integer; safecall;
    property ActiveOffset: Integer read Get_ActiveOffset write Set_ActiveOffset;
    property ActiveLength: Integer read Get_ActiveLength write Set_ActiveLength;
    property SelectionOffset: Integer read Get_SelectionOffset
      write Set_SelectionOffset;
    property SelectionLength: Integer read Get_SelectionLength
      write Set_SelectionLength;
  end;

  ISpeechTextSelectionInformationDisp = dispinterface
    ['{3B9C7E7A-6EEE-4DED-9092-11657279ADBE}']
    property ActiveOffset: Integer dispid 1;
    property ActiveLength: Integer dispid 2;
    property SelectionOffset: Integer dispid 3;
    property SelectionLength: Integer dispid 4;
  end;

  ISpeechRecoResult = interface(IDispatch)
    ['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
    function Get_RecoContext: ISpeechRecoContext; safecall;
    function Get_Times: ISpeechRecoResultTimes; safecall;
    procedure _Set_AudioFormat(const Format: ISpeechAudioFormat); safecall;
    function Get_AudioFormat: ISpeechAudioFormat; safecall;
    function Get_PhraseInfo: ISpeechPhraseInfo; safecall;
    function Alternates(RequestCount: Integer; StartElement: Integer;
      Elements: Integer): ISpeechPhraseAlternates; safecall;
    function Audio(StartElement: Integer; Elements: Integer)
      : ISpeechMemoryStream; safecall;
    function SpeakAudio(StartElement: Integer; Elements: Integer;
      Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    function SaveToMemory: OleVariant; safecall;
    procedure DiscardResultInfo(ValueTypes: SpeechDiscardType); safecall;
    property RecoContext: ISpeechRecoContext read Get_RecoContext;
    property Times: ISpeechRecoResultTimes read Get_Times;
    property AudioFormat: ISpeechAudioFormat read Get_AudioFormat
      write _Set_AudioFormat;
    property PhraseInfo: ISpeechPhraseInfo read Get_PhraseInfo;
  end;

  ISpeechRecoResultDisp = dispinterface
    ['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
    property RecoContext: ISpeechRecoContext readonly dispid 1;
    property Times: ISpeechRecoResultTimes readonly dispid 2;
    property AudioFormat: ISpeechAudioFormat dispid 3;
    property PhraseInfo: ISpeechPhraseInfo readonly dispid 4;
    function Alternates(RequestCount: Integer; StartElement: Integer;
      Elements: Integer): ISpeechPhraseAlternates; dispid 5;
    function Audio(StartElement: Integer; Elements: Integer)
      : ISpeechMemoryStream; dispid 6;
    function SpeakAudio(StartElement: Integer; Elements: Integer;
      Flags: SpeechVoiceSpeakFlags): Integer; dispid 7;
    function SaveToMemory: OleVariant; dispid 8;
    procedure DiscardResultInfo(ValueTypes: SpeechDiscardType); dispid 9;
  end;

  ISpeechRecoResultTimes = interface(IDispatch)
    ['{62B3B8FB-F6E7-41BE-BDCB-056B1C29EFC0}']
    function Get_StreamTime: OleVariant; safecall;
    function Get_Length: OleVariant; safecall;
    function Get_TickCount: Integer; safecall;
    function Get_OffsetFromStart: OleVariant; safecall;
    property StreamTime: OleVariant read Get_StreamTime;
    property Length: OleVariant read Get_Length;
    property TickCount: Integer read Get_TickCount;
    property OffsetFromStart: OleVariant read Get_OffsetFromStart;
  end;

  ISpeechRecoResultTimesDisp = dispinterface
    ['{62B3B8FB-F6E7-41BE-BDCB-056B1C29EFC0}']
    property StreamTime: OleVariant readonly dispid 1;
    property Length: OleVariant readonly dispid 2;
    property TickCount: Integer readonly dispid 3;
    property OffsetFromStart: OleVariant readonly dispid 4;
  end;

  ISpeechPhraseInfo = interface(IDispatch)
    ['{961559CF-4E67-4662-8BF0-D93F1FCD61B3}']
    function Get_LanguageId: Integer; safecall;
    function Get_GrammarId: OleVariant; safecall;
    function Get_StartTime: OleVariant; safecall;
    function Get_AudioStreamPosition: OleVariant; safecall;
    function Get_AudioSizeBytes: Integer; safecall;
    function Get_RetainedSizeBytes: Integer; safecall;
    function Get_AudioSizeTime: Integer; safecall;
    function Get_Rule: ISpeechPhraseRule; safecall;
    function Get_Properties: ISpeechPhraseProperties; safecall;
    function Get_Elements: ISpeechPhraseElements; safecall;
    function Get_Replacements: ISpeechPhraseReplacements; safecall;
    function Get_EngineId: WideString; safecall;
    function Get_EnginePrivateData: OleVariant; safecall;
    function SaveToMemory: OleVariant; safecall;
    function GetText(StartElement: Integer; Elements: Integer;
      UseReplacements: WordBool): WideString; safecall;
    function GetDisplayAttributes(StartElement: Integer; Elements: Integer;
      UseReplacements: WordBool): SpeechDisplayAttributes; safecall;
    property LanguageId: Integer read Get_LanguageId;
    property GrammarId: OleVariant read Get_GrammarId;
    property StartTime: OleVariant read Get_StartTime;
    property AudioStreamPosition: OleVariant read Get_AudioStreamPosition;
    property AudioSizeBytes: Integer read Get_AudioSizeBytes;
    property RetainedSizeBytes: Integer read Get_RetainedSizeBytes;
    property AudioSizeTime: Integer read Get_AudioSizeTime;
    property Rule: ISpeechPhraseRule read Get_Rule;
    property Properties: ISpeechPhraseProperties read Get_Properties;
    property Elements: ISpeechPhraseElements read Get_Elements;
    property Replacements: ISpeechPhraseReplacements read Get_Replacements;
    property EngineId: WideString read Get_EngineId;
    property EnginePrivateData: OleVariant read Get_EnginePrivateData;
  end;

  ISpeechPhraseInfoDisp = dispinterface
    ['{961559CF-4E67-4662-8BF0-D93F1FCD61B3}']
    property LanguageId: Integer readonly dispid 1;
    property GrammarId: OleVariant readonly dispid 2;
    property StartTime: OleVariant readonly dispid 3;
    property AudioStreamPosition: OleVariant readonly dispid 4;
    property AudioSizeBytes: Integer readonly dispid 5;
    property RetainedSizeBytes: Integer readonly dispid 6;
    property AudioSizeTime: Integer readonly dispid 7;
    property Rule: ISpeechPhraseRule readonly dispid 8;
    property Properties: ISpeechPhraseProperties readonly dispid 9;
    property Elements: ISpeechPhraseElements readonly dispid 10;
    property Replacements: ISpeechPhraseReplacements readonly dispid 11;
    property EngineId: WideString readonly dispid 12;
    property EnginePrivateData: OleVariant readonly dispid 13;
    function SaveToMemory: OleVariant; dispid 14;
    function GetText(StartElement: Integer; Elements: Integer;
      UseReplacements: WordBool): WideString; dispid 15;
    function GetDisplayAttributes(StartElement: Integer; Elements: Integer;
      UseReplacements: WordBool): SpeechDisplayAttributes; dispid 16;
  end;

  ISpeechPhraseRule = interface(IDispatch)
    ['{A7BFE112-A4A0-48D9-B602-C313843F6964}']
    function Get_Name: WideString; safecall;
    function Get_Id: Integer; safecall;
    function Get_FirstElement: Integer; safecall;
    function Get_NumberOfElements: Integer; safecall;
    function Get_Parent: ISpeechPhraseRule; safecall;
    function Get_Children: ISpeechPhraseRules; safecall;
    function Get_Confidence: SpeechEngineConfidence; safecall;
    function Get_EngineConfidence: Single; safecall;
    property Name: WideString read Get_Name;
    property Id: Integer read Get_Id;
    property FirstElement: Integer read Get_FirstElement;
    property NumberOfElements: Integer read Get_NumberOfElements;
    property Parent: ISpeechPhraseRule read Get_Parent;
    property Children: ISpeechPhraseRules read Get_Children;
    property Confidence: SpeechEngineConfidence read Get_Confidence;
    property EngineConfidence: Single read Get_EngineConfidence;
  end;

  ISpeechPhraseRuleDisp = dispinterface
    ['{A7BFE112-A4A0-48D9-B602-C313843F6964}']
    property Name: WideString readonly dispid 1;
    property Id: Integer readonly dispid 2;
    property FirstElement: Integer readonly dispid 3;
    property NumberOfElements: Integer readonly dispid 4;
    property Parent: ISpeechPhraseRule readonly dispid 5;
    property Children: ISpeechPhraseRules readonly dispid 6;
    property Confidence: SpeechEngineConfidence readonly dispid 7;
    property EngineConfidence: Single readonly dispid 8;
  end;

  ISpeechPhraseRules = interface(IDispatch)
    ['{9047D593-01DD-4B72-81A3-E4A0CA69F407}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechPhraseRule; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechPhraseRulesDisp = dispinterface
    ['{9047D593-01DD-4B72-81A3-E4A0CA69F407}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechPhraseRule; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechPhraseProperties = interface(IDispatch)
    ['{08166B47-102E-4B23-A599-BDB98DBFD1F4}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechPhraseProperty; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechPhrasePropertiesDisp = dispinterface
    ['{08166B47-102E-4B23-A599-BDB98DBFD1F4}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechPhraseProperty; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechPhraseProperty = interface(IDispatch)
    ['{CE563D48-961E-4732-A2E1-378A42B430BE}']
    function Get_Name: WideString; safecall;
    function Get_Id: Integer; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_FirstElement: Integer; safecall;
    function Get_NumberOfElements: Integer; safecall;
    function Get_EngineConfidence: Single; safecall;
    function Get_Confidence: SpeechEngineConfidence; safecall;
    function Get_Parent: ISpeechPhraseProperty; safecall;
    function Get_Children: ISpeechPhraseProperties; safecall;
    property Name: WideString read Get_Name;
    property Id: Integer read Get_Id;
    property Value: OleVariant read Get_Value;
    property FirstElement: Integer read Get_FirstElement;
    property NumberOfElements: Integer read Get_NumberOfElements;
    property EngineConfidence: Single read Get_EngineConfidence;
    property Confidence: SpeechEngineConfidence read Get_Confidence;
    property Parent: ISpeechPhraseProperty read Get_Parent;
    property Children: ISpeechPhraseProperties read Get_Children;
  end;

  ISpeechPhrasePropertyDisp = dispinterface
    ['{CE563D48-961E-4732-A2E1-378A42B430BE}']
    property Name: WideString readonly dispid 1;
    property Id: Integer readonly dispid 2;
    property Value: OleVariant readonly dispid 3;
    property FirstElement: Integer readonly dispid 4;
    property NumberOfElements: Integer readonly dispid 5;
    property EngineConfidence: Single readonly dispid 6;
    property Confidence: SpeechEngineConfidence readonly dispid 7;
    property Parent: ISpeechPhraseProperty readonly dispid 8;
    property Children: ISpeechPhraseProperties readonly dispid 9;
  end;

  ISpeechPhraseElements = interface(IDispatch)
    ['{0626B328-3478-467D-A0B3-D0853B93DDA3}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechPhraseElement; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechPhraseElementsDisp = dispinterface
    ['{0626B328-3478-467D-A0B3-D0853B93DDA3}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechPhraseElement; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechPhraseElement = interface(IDispatch)
    ['{E6176F96-E373-4801-B223-3B62C068C0B4}']
    function Get_AudioTimeOffset: Integer; safecall;
    function Get_AudioSizeTime: Integer; safecall;
    function Get_AudioStreamOffset: Integer; safecall;
    function Get_AudioSizeBytes: Integer; safecall;
    function Get_RetainedStreamOffset: Integer; safecall;
    function Get_RetainedSizeBytes: Integer; safecall;
    function Get_DisplayText: WideString; safecall;
    function Get_LexicalForm: WideString; safecall;
    function Get_Pronunciation: OleVariant; safecall;
    function Get_DisplayAttributes: SpeechDisplayAttributes; safecall;
    function Get_RequiredConfidence: SpeechEngineConfidence; safecall;
    function Get_ActualConfidence: SpeechEngineConfidence; safecall;
    function Get_EngineConfidence: Single; safecall;
    property AudioTimeOffset: Integer read Get_AudioTimeOffset;
    property AudioSizeTime: Integer read Get_AudioSizeTime;
    property AudioStreamOffset: Integer read Get_AudioStreamOffset;
    property AudioSizeBytes: Integer read Get_AudioSizeBytes;
    property RetainedStreamOffset: Integer read Get_RetainedStreamOffset;
    property RetainedSizeBytes: Integer read Get_RetainedSizeBytes;
    property DisplayText: WideString read Get_DisplayText;
    property LexicalForm: WideString read Get_LexicalForm;
    property Pronunciation: OleVariant read Get_Pronunciation;
    property DisplayAttributes: SpeechDisplayAttributes
      read Get_DisplayAttributes;
    property RequiredConfidence: SpeechEngineConfidence
      read Get_RequiredConfidence;
    property ActualConfidence: SpeechEngineConfidence read Get_ActualConfidence;
    property EngineConfidence: Single read Get_EngineConfidence;
  end;

  ISpeechPhraseElementDisp = dispinterface
    ['{E6176F96-E373-4801-B223-3B62C068C0B4}']
    property AudioTimeOffset: Integer readonly dispid 1;
    property AudioSizeTime: Integer readonly dispid 2;
    property AudioStreamOffset: Integer readonly dispid 3;
    property AudioSizeBytes: Integer readonly dispid 4;
    property RetainedStreamOffset: Integer readonly dispid 5;
    property RetainedSizeBytes: Integer readonly dispid 6;
    property DisplayText: WideString readonly dispid 7;
    property LexicalForm: WideString readonly dispid 8;
    property Pronunciation: OleVariant readonly dispid 9;
    property DisplayAttributes: SpeechDisplayAttributes readonly dispid 10;
    property RequiredConfidence: SpeechEngineConfidence readonly dispid 11;
    property ActualConfidence: SpeechEngineConfidence readonly dispid 12;
    property EngineConfidence: Single readonly dispid 13;
  end;

  ISpeechPhraseReplacements = interface(IDispatch)
    ['{38BC662F-2257-4525-959E-2069D2596C05}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechPhraseReplacement; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechPhraseReplacementsDisp = dispinterface
    ['{38BC662F-2257-4525-959E-2069D2596C05}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechPhraseReplacement; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechPhraseReplacement = interface(IDispatch)
    ['{2890A410-53A7-4FB5-94EC-06D4998E3D02}']
    function Get_DisplayAttributes: SpeechDisplayAttributes; safecall;
    function Get_Text: WideString; safecall;
    function Get_FirstElement: Integer; safecall;
    function Get_NumberOfElements: Integer; safecall;
    property DisplayAttributes: SpeechDisplayAttributes
      read Get_DisplayAttributes;
    property Text: WideString read Get_Text;
    property FirstElement: Integer read Get_FirstElement;
    property NumberOfElements: Integer read Get_NumberOfElements;
  end;

  ISpeechPhraseReplacementDisp = dispinterface
    ['{2890A410-53A7-4FB5-94EC-06D4998E3D02}']
    property DisplayAttributes: SpeechDisplayAttributes readonly dispid 1;
    property Text: WideString readonly dispid 2;
    property FirstElement: Integer readonly dispid 3;
    property NumberOfElements: Integer readonly dispid 4;
  end;

  ISpeechPhraseAlternates = interface(IDispatch)
    ['{B238B6D5-F276-4C3D-A6C1-2974801C3CC2}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechPhraseAlternate; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechPhraseAlternatesDisp = dispinterface
    ['{B238B6D5-F276-4C3D-A6C1-2974801C3CC2}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechPhraseAlternate; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechPhraseAlternate = interface(IDispatch)
    ['{27864A2A-2B9F-4CB8-92D3-0D2722FD1E73}']
    function Get_RecoResult: ISpeechRecoResult; safecall;
    function Get_StartElementInResult: Integer; safecall;
    function Get_NumberOfElementsInResult: Integer; safecall;
    function Get_PhraseInfo: ISpeechPhraseInfo; safecall;
    procedure Commit; safecall;
    property RecoResult: ISpeechRecoResult read Get_RecoResult;
    property StartElementInResult: Integer read Get_StartElementInResult;
    property NumberOfElementsInResult: Integer
      read Get_NumberOfElementsInResult;
    property PhraseInfo: ISpeechPhraseInfo read Get_PhraseInfo;
  end;

  ISpeechPhraseAlternateDisp = dispinterface
    ['{27864A2A-2B9F-4CB8-92D3-0D2722FD1E73}']
    property RecoResult: ISpeechRecoResult readonly dispid 1;
    property StartElementInResult: Integer readonly dispid 2;
    property NumberOfElementsInResult: Integer readonly dispid 3;
    property PhraseInfo: ISpeechPhraseInfo readonly dispid 4;
    procedure Commit; dispid 5;
  end;

  _ISpeechRecoContextEvents = dispinterface
    ['{7B8FCB42-0E9D-4F00-A048-7B04D6179D3D}']
    procedure StartStream(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 1;
    procedure EndStream(StreamNumber: Integer; StreamPosition: OleVariant;
      StreamReleased: WordBool); dispid 2;
    procedure Bookmark(StreamNumber: Integer; StreamPosition: OleVariant;
      BookmarkId: OleVariant; Options: SpeechBookmarkOptions); dispid 3;
    procedure SoundStart(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 4;
    procedure SoundEnd(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 5;
    procedure PhraseStart(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 6;
    procedure Recognition(StreamNumber: Integer; StreamPosition: OleVariant;
      RecognitionType: SpeechRecognitionType;
      const Result: ISpeechRecoResult); dispid 7;
    procedure Hypothesis(StreamNumber: Integer; StreamPosition: OleVariant;
      const Result: ISpeechRecoResult); dispid 8;
    procedure PropertyNumberChange(StreamNumber: Integer;
      StreamPosition: OleVariant; const PropertyName: WideString;
      NewNumberValue: Integer); dispid 9;
    procedure PropertyStringChange(StreamNumber: Integer;
      StreamPosition: OleVariant; const PropertyName: WideString;
      const NewStringValue: WideString); dispid 10;
    procedure FalseRecognition(StreamNumber: Integer;
      StreamPosition: OleVariant; const Result: ISpeechRecoResult); dispid 11;
    procedure Interference(StreamNumber: Integer; StreamPosition: OleVariant;
      Interference: SpeechInterference); dispid 12;
    procedure RequestUI(StreamNumber: Integer; StreamPosition: OleVariant;
      const UIType: WideString); dispid 13;
    procedure RecognizerStateChange(StreamNumber: Integer;
      StreamPosition: OleVariant; NewState: SpeechRecognizerState); dispid 14;
    procedure Adaptation(StreamNumber: Integer; StreamPosition: OleVariant);
      dispid 15;
    procedure RecognitionForOtherContext(StreamNumber: Integer;
      StreamPosition: OleVariant); dispid 16;
    procedure AudioLevel(StreamNumber: Integer; StreamPosition: OleVariant;
      AudioLevel: Integer); dispid 17;
    procedure EnginePrivate(StreamNumber: Integer; StreamPosition: OleVariant;
      EngineData: OleVariant); dispid 18;
  end;

  ISpeechRecoResult2 = interface(ISpeechRecoResult)
    ['{8E0A246D-D3C8-45DE-8657-04290C458C3C}']
    procedure SetTextFeedback(const Feedback: WideString;
      WasSuccessful: WordBool); safecall;
  end;

  ISpeechRecoResult2Disp = dispinterface
    ['{8E0A246D-D3C8-45DE-8657-04290C458C3C}']
    procedure SetTextFeedback(const Feedback: WideString;
      WasSuccessful: WordBool); dispid 12;
    property RecoContext: ISpeechRecoContext readonly dispid 1;
    property Times: ISpeechRecoResultTimes readonly dispid 2;
    property AudioFormat: ISpeechAudioFormat dispid 3;
    property PhraseInfo: ISpeechPhraseInfo readonly dispid 4;
    function Alternates(RequestCount: Integer; StartElement: Integer;
      Elements: Integer): ISpeechPhraseAlternates; dispid 5;
    function Audio(StartElement: Integer; Elements: Integer)
      : ISpeechMemoryStream; dispid 6;
    function SpeakAudio(StartElement: Integer; Elements: Integer;
      Flags: SpeechVoiceSpeakFlags): Integer; dispid 7;
    function SaveToMemory: OleVariant; dispid 8;
    procedure DiscardResultInfo(ValueTypes: SpeechDiscardType); dispid 9;
  end;

  ISpeechLexicon = interface(IDispatch)
    ['{3DA7627A-C7AE-4B23-8708-638C50362C25}']
    function Get_GenerationId: Integer; safecall;
    function GetWords(Flags: SpeechLexiconType; out GenerationId: Integer)
      : ISpeechLexiconWords; safecall;
    procedure AddPronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech;
      const bstrPronunciation: WideString); safecall;
    procedure AddPronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); safecall;
    procedure RemovePronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech;
      const bstrPronunciation: WideString); safecall;
    procedure RemovePronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); safecall;
    function GetPronunciations(const bstrWord: WideString; LangId: Integer;
      TypeFlags: SpeechLexiconType): ISpeechLexiconPronunciations; safecall;
    function GetGenerationChange(var GenerationId: Integer)
      : ISpeechLexiconWords; safecall;
    property GenerationId: Integer read Get_GenerationId;
  end;

  ISpeechLexiconDisp = dispinterface
    ['{3DA7627A-C7AE-4B23-8708-638C50362C25}']
    property GenerationId: Integer readonly dispid 1;
    function GetWords(Flags: SpeechLexiconType; out GenerationId: Integer)
      : ISpeechLexiconWords; dispid 2;
    procedure AddPronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech;
      const bstrPronunciation: WideString); dispid 3;
    procedure AddPronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); dispid 4;
    procedure RemovePronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech;
      const bstrPronunciation: WideString); dispid 5;
    procedure RemovePronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); dispid 6;
    function GetPronunciations(const bstrWord: WideString; LangId: Integer;
      TypeFlags: SpeechLexiconType): ISpeechLexiconPronunciations; dispid 7;
    function GetGenerationChange(var GenerationId: Integer)
      : ISpeechLexiconWords; dispid 8;
  end;

  ISpeechLexiconWords = interface(IDispatch)
    ['{8D199862-415E-47D5-AC4F-FAA608B424E6}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechLexiconWord; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechLexiconWordsDisp = dispinterface
    ['{8D199862-415E-47D5-AC4F-FAA608B424E6}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechLexiconWord; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechLexiconWord = interface(IDispatch)
    ['{4E5B933C-C9BE-48ED-8842-1EE51BB1D4FF}']
    function Get_LangId: Integer; safecall;
    function Get_type_: SpeechWordType; safecall;
    function Get_Word: WideString; safecall;
    function Get_Pronunciations: ISpeechLexiconPronunciations; safecall;
    property LangId: Integer read Get_LangId;
    property type_: SpeechWordType read Get_type_;
    property Word: WideString read Get_Word;
    property Pronunciations: ISpeechLexiconPronunciations
      read Get_Pronunciations;
  end;

  ISpeechLexiconWordDisp = dispinterface
    ['{4E5B933C-C9BE-48ED-8842-1EE51BB1D4FF}']
    property LangId: Integer readonly dispid 1;
    property type_: SpeechWordType readonly dispid 2;
    property Word: WideString readonly dispid 3;
    property Pronunciations: ISpeechLexiconPronunciations readonly dispid 4;
  end;

  ISpeechLexiconPronunciations = interface(IDispatch)
    ['{72829128-5682-4704-A0D4-3E2BB6F2EAD3}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechLexiconPronunciation; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechLexiconPronunciationsDisp = dispinterface
    ['{72829128-5682-4704-A0D4-3E2BB6F2EAD3}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): ISpeechLexiconPronunciation; dispid 0;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  ISpeechLexiconPronunciation = interface(IDispatch)
    ['{95252C5D-9E43-4F4A-9899-48EE73352F9F}']
    function Get_type_: SpeechLexiconType; safecall;
    function Get_LangId: Integer; safecall;
    function Get_PartOfSpeech: SpeechPartOfSpeech; safecall;
    function Get_PhoneIds: OleVariant; safecall;
    function Get_Symbolic: WideString; safecall;
    property type_: SpeechLexiconType read Get_type_;
    property LangId: Integer read Get_LangId;
    property PartOfSpeech: SpeechPartOfSpeech read Get_PartOfSpeech;
    property PhoneIds: OleVariant read Get_PhoneIds;
    property Symbolic: WideString read Get_Symbolic;
  end;

  ISpeechLexiconPronunciationDisp = dispinterface
    ['{95252C5D-9E43-4F4A-9899-48EE73352F9F}']
    property type_: SpeechLexiconType readonly dispid 1;
    property LangId: Integer readonly dispid 2;
    property PartOfSpeech: SpeechPartOfSpeech readonly dispid 3;
    property PhoneIds: OleVariant readonly dispid 4;
    property Symbolic: WideString readonly dispid 5;
  end;

  ISpeechXMLRecoResult = interface(ISpeechRecoResult)
    ['{AAEC54AF-8F85-4924-944D-B79D39D72E19}']
    function GetXMLResult(Options: SPXMLRESULTOPTIONS): WideString; safecall;
    function GetXMLErrorInfo(out LineNumber: Integer;
      out ScriptLine: WideString; out Source: WideString;
      out Description: WideString; out ResultCode: Integer): WordBool; safecall;
  end;

  ISpeechXMLRecoResultDisp = dispinterface
    ['{AAEC54AF-8F85-4924-944D-B79D39D72E19}']
    function GetXMLResult(Options: SPXMLRESULTOPTIONS): WideString; dispid 10;
    function GetXMLErrorInfo(out LineNumber: Integer;
      out ScriptLine: WideString; out Source: WideString;
      out Description: WideString; out ResultCode: Integer): WordBool;
      dispid 11;
    property RecoContext: ISpeechRecoContext readonly dispid 1;
    property Times: ISpeechRecoResultTimes readonly dispid 2;
    property AudioFormat: ISpeechAudioFormat dispid 3;
    property PhraseInfo: ISpeechPhraseInfo readonly dispid 4;
    function Alternates(RequestCount: Integer; StartElement: Integer;
      Elements: Integer): ISpeechPhraseAlternates; dispid 5;
    function Audio(StartElement: Integer; Elements: Integer)
      : ISpeechMemoryStream; dispid 6;
    function SpeakAudio(StartElement: Integer; Elements: Integer;
      Flags: SpeechVoiceSpeakFlags): Integer; dispid 7;
    function SaveToMemory: OleVariant; dispid 8;
    procedure DiscardResultInfo(ValueTypes: SpeechDiscardType); dispid 9;
  end;

  ISpeechRecoResultDispatch = interface(IDispatch)
    ['{6D60EB64-ACED-40A6-BBF3-4E557F71DEE2}']
    function Get_RecoContext: ISpeechRecoContext; safecall;
    function Get_Times: ISpeechRecoResultTimes; safecall;
    procedure _Set_AudioFormat(const Format: ISpeechAudioFormat); safecall;
    function Get_AudioFormat: ISpeechAudioFormat; safecall;
    function Get_PhraseInfo: ISpeechPhraseInfo; safecall;
    function Alternates(RequestCount: Integer; StartElement: Integer;
      Elements: Integer): ISpeechPhraseAlternates; safecall;
    function Audio(StartElement: Integer; Elements: Integer)
      : ISpeechMemoryStream; safecall;
    function SpeakAudio(StartElement: Integer; Elements: Integer;
      Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    function SaveToMemory: OleVariant; safecall;
    procedure DiscardResultInfo(ValueTypes: SpeechDiscardType); safecall;
    function GetXMLResult(Options: SPXMLRESULTOPTIONS): WideString; safecall;
    function GetXMLErrorInfo(out LineNumber: Integer;
      out ScriptLine: WideString; out Source: WideString;
      out Description: WideString; out ResultCode: HResult): WordBool; safecall;
    procedure SetTextFeedback(const Feedback: WideString;
      WasSuccessful: WordBool); safecall;
    property RecoContext: ISpeechRecoContext read Get_RecoContext;
    property Times: ISpeechRecoResultTimes read Get_Times;
    property AudioFormat: ISpeechAudioFormat read Get_AudioFormat
      write _Set_AudioFormat;
    property PhraseInfo: ISpeechPhraseInfo read Get_PhraseInfo;
  end;

  ISpeechRecoResultDispatchDisp = dispinterface
    ['{6D60EB64-ACED-40A6-BBF3-4E557F71DEE2}']
    property RecoContext: ISpeechRecoContext readonly dispid 1;
    property Times: ISpeechRecoResultTimes readonly dispid 2;
    property AudioFormat: ISpeechAudioFormat dispid 3;
    property PhraseInfo: ISpeechPhraseInfo readonly dispid 4;
    function Alternates(RequestCount: Integer; StartElement: Integer;
      Elements: Integer): ISpeechPhraseAlternates; dispid 5;
    function Audio(StartElement: Integer; Elements: Integer)
      : ISpeechMemoryStream; dispid 6;
    function SpeakAudio(StartElement: Integer; Elements: Integer;
      Flags: SpeechVoiceSpeakFlags): Integer; dispid 7;
    function SaveToMemory: OleVariant; dispid 8;
    procedure DiscardResultInfo(ValueTypes: SpeechDiscardType); dispid 9;
    function GetXMLResult(Options: SPXMLRESULTOPTIONS): WideString; dispid 10;
    function GetXMLErrorInfo(out LineNumber: Integer;
      out ScriptLine: WideString; out Source: WideString;
      out Description: WideString; out ResultCode: HResult): WordBool;
      dispid 11;
    procedure SetTextFeedback(const Feedback: WideString;
      WasSuccessful: WordBool); dispid 12;
  end;

  ISpeechPhraseInfoBuilder = interface(IDispatch)
    ['{3B151836-DF3A-4E0A-846C-D2ADC9334333}']
    function RestorePhraseFromMemory(const PhraseInMemory: OleVariant)
      : ISpeechPhraseInfo; safecall;
  end;

  ISpeechPhraseInfoBuilderDisp = dispinterface
    ['{3B151836-DF3A-4E0A-846C-D2ADC9334333}']
    function RestorePhraseFromMemory(const PhraseInMemory: OleVariant)
      : ISpeechPhraseInfo; dispid 1;
  end;

  ISpeechPhoneConverter = interface(IDispatch)
    ['{C3E4F353-433F-43D6-89A1-6A62A7054C3D}']
    function Get_LanguageId: Integer; safecall;
    procedure Set_LanguageId(LanguageId: Integer); safecall;
    function PhoneToId(const Phonemes: WideString): OleVariant; safecall;
    function IdToPhone(IdArray: OleVariant): WideString; safecall;
    property LanguageId: Integer read Get_LanguageId write Set_LanguageId;
  end;

  ISpeechPhoneConverterDisp = dispinterface
    ['{C3E4F353-433F-43D6-89A1-6A62A7054C3D}']
    property LanguageId: Integer dispid 1;
    function PhoneToId(const Phonemes: WideString): OleVariant; dispid 2;
    function IdToPhone(IdArray: OleVariant): WideString; dispid 3;
  end;

  ISpNotifySink = interface(IUnknown)
    ['{259684DC-37C3-11D2-9603-00C04F8EE628}']
    function Notify: HResult; stdcall;
  end;

  ISpNotifyTranslator = interface(ISpNotifySink)
    ['{ACA16614-5D3D-11D2-960E-00C04F8EE628}']
    function InitWindowMessage(var hWnd: _RemotableHandle; Msg: SYSUINT;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult; stdcall;
    function InitCallback(pfnCallback: PPPrivateAlias1; wParam: UINT_PTR;
      lParam: LONG_PTR): HResult; stdcall;
    function InitSpNotifyCallback(pSpCallback: PPPrivateAlias1;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult; stdcall;
    function InitWin32Event(hEvent: Pointer; fCloseHandleOnRelease: Integer)
      : HResult; stdcall;
    function Wait(dwMilliseconds: LongWord): HResult; stdcall;
    function GetEventHandle: Pointer; stdcall;
  end;

  ISpDataKey = interface(IUnknown)
    ['{14056581-E16C-11D2-BB90-00C04F8EE6C0}']
    function SetData(pszValueName: PWideChar; cbData: LongWord; var pData: Byte)
      : HResult; stdcall;
    function GetData(pszValueName: PWideChar; var pcbData: LongWord;
      out pData: Byte): HResult; stdcall;
    function SetStringValue(pszValueName: PWideChar; pszValue: PWideChar)
      : HResult; stdcall;
    function GetStringValue(pszValueName: PWideChar; out ppszValue: PWideChar)
      : HResult; stdcall;
    function SetDWORD(pszValueName: PWideChar; dwValue: LongWord)
      : HResult; stdcall;
    function GetDWORD(pszValueName: PWideChar; out pdwValue: LongWord)
      : HResult; stdcall;
    function OpenKey(pszSubKeyName: PWideChar; out ppSubKey: ISpDataKey)
      : HResult; stdcall;
    function CreateKey(pszSubKey: PWideChar; out ppSubKey: ISpDataKey)
      : HResult; stdcall;
    function DeleteKey(pszSubKey: PWideChar): HResult; stdcall;
    function DeleteValue(pszValueName: PWideChar): HResult; stdcall;
    function EnumKeys(Index: LongWord; out ppszSubKeyName: PWideChar)
      : HResult; stdcall;
    function EnumValues(Index: LongWord; out ppszValueName: PWideChar)
      : HResult; stdcall;
  end;

  ISpObjectTokenCategory = interface(ISpDataKey)
    ['{2D3D3845-39AF-4850-BBF9-40B49780011D}']
    function SetId(pszCategoryId: PWideChar; fCreateIfNotExist: Integer)
      : HResult; stdcall;
    function GetId(out ppszCoMemCategoryId: PWideChar): HResult; stdcall;
    function GetDataKey(spdkl: SPDATAKEYLOCATION; out ppDataKey: ISpDataKey)
      : HResult; stdcall;
    function EnumTokens(pzsReqAttribs: PWideChar; pszOptAttribs: PWideChar;
      out ppEnum: IEnumSpObjectTokens): HResult; stdcall;
    function SetDefaultTokenId(pszTokenId: PWideChar): HResult; stdcall;
    function GetDefaultTokenId(out ppszCoMemTokenId: PWideChar)
      : HResult; stdcall;
  end;

  IEnumSpObjectTokens = interface(IUnknown)
    ['{06B64F9E-7FDA-11D2-B4F2-00C04F797396}']
    function Next(celt: LongWord; out pelt: ISpObjectToken;
      out pceltFetched: LongWord): HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppEnum: IEnumSpObjectTokens): HResult; stdcall;
    function Item(Index: LongWord; out ppToken: ISpObjectToken)
      : HResult; stdcall;
    function GetCount(out pCount: LongWord): HResult; stdcall;
  end;

  ISpObjectToken = interface(ISpDataKey)
    ['{14056589-E16C-11D2-BB90-00C04F8EE6C0}']
    function SetId(pszCategoryId: PWideChar; pszTokenId: PWideChar;
      fCreateIfNotExist: Integer): HResult; stdcall;
    function GetId(out ppszCoMemTokenId: PWideChar): HResult; stdcall;
    function GetCategory(out ppTokenCategory: ISpObjectTokenCategory)
      : HResult; stdcall;
    function CreateInstance(const pUnkOuter: IUnknown; dwClsContext: LongWord;
      var riid: TGUID; out ppvObject: Pointer): HResult; stdcall;
    function GetStorageFileName(var clsidCaller: TGUID; pszValueName: PWideChar;
      pszFileNameSpecifier: PWideChar; nFolder: LongWord;
      out ppszFilePath: PWideChar): HResult; stdcall;
    function RemoveStorageFileName(var clsidCaller: TGUID;
      pszKeyName: PWideChar; fDeleteFile: Integer): HResult; stdcall;
    function Remove(var pclsidCaller: TGUID): HResult; stdcall;
    function IsUISupported(pszTypeOfUI: PWideChar; pvExtraData: Pointer;
      cbExtraData: LongWord; const punkObject: IUnknown;
      out pfSupported: Integer): HResult; stdcall;
    function DisplayUI(var hWndParent: _RemotableHandle; pszTitle: PWideChar;
      pszTypeOfUI: PWideChar; pvExtraData: Pointer; cbExtraData: LongWord;
      const punkObject: IUnknown): HResult; stdcall;
    function MatchesAttributes(pszAttributes: PWideChar; out pfMatches: Integer)
      : HResult; stdcall;
  end;

  IServiceProvider = interface(IUnknown)
    ['{6D5140C1-7436-11CE-8034-00AA006009FA}']
    function RemoteQueryService(var guidService: TGUID; var riid: TGUID;
      out ppvObject: IUnknown): HResult; stdcall;
  end;

  ISpResourceManager = interface(IServiceProvider)
    ['{93384E18-5014-43D5-ADBB-A78E055926BD}']
    function SetObject(var guidServiceId: TGUID; const punkObject: IUnknown)
      : HResult; stdcall;
    function GetObject(var guidServiceId: TGUID; var ObjectCLSID: TGUID;
      var ObjectIID: TGUID; fReleaseWhenLastExternalRefReleased: Integer;
      out ppObject: Pointer): HResult; stdcall;
  end;

  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord)
      : HResult; stdcall;
    function RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord)
      : HResult; stdcall;
  end;

  IStream = interface(ISequentialStream)
    ['{0000000C-0000-0000-C000-000000000046}']
    function RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord;
      out plibNewPosition: _ULARGE_INTEGER): HResult; stdcall;
    function SetSize(libNewSize: _ULARGE_INTEGER): HResult; stdcall;
    function RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER;
      out pcbRead: _ULARGE_INTEGER; out pcbWritten: _ULARGE_INTEGER)
      : HResult; stdcall;
    function Commit(grfCommitFlags: LongWord): HResult; stdcall;
    function Revert: HResult; stdcall;
    function LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
      dwLockType: LongWord): HResult; stdcall;
    function UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
      dwLockType: LongWord): HResult; stdcall;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord)
      : HResult; stdcall;
    function Clone(out ppstm: IStream): HResult; stdcall;
  end;

  ISpStreamFormat = interface(IStream)
    ['{BED530BE-2606-4F4D-A1C0-54C5CDA5566F}']
    function GetFormat(var pguidFormatId: TGUID;
      out ppCoMemWaveFormatEx: PUserType2): HResult; stdcall;
  end;

  ISpStreamFormatConverter = interface(ISpStreamFormat)
    ['{678A932C-EA71-4446-9B41-78FDA6280A29}']
    function SetBaseStream(const pStream: ISpStreamFormat;
      fSetFormatToBaseStreamFormat: Integer; fWriteToBaseStream: Integer)
      : HResult; stdcall;
    function GetBaseStream(out ppStream: ISpStreamFormat): HResult; stdcall;
    function SetFormat(var rguidFormatIdOfConvertedStream: TGUID;
      var pWaveFormatExOfConvertedStream: WAVEFORMATEX): HResult; stdcall;
    function ResetSeekPosition: HResult; stdcall;
    function ScaleConvertedToBaseOffset(ullOffsetConvertedStream: Largeuint;
      out pullOffsetBaseStream: Largeuint): HResult; stdcall;
    function ScaleBaseToConvertedOffset(ullOffsetBaseStream: Largeuint;
      out pullOffsetConvertedStream: Largeuint): HResult; stdcall;
  end;

  ISpNotifySource = interface(IUnknown)
    ['{5EFF4AEF-8487-11D2-961C-00C04F8EE628}']
    function SetNotifySink(const pNotifySink: ISpNotifySink): HResult; stdcall;
    function SetNotifyWindowMessage(var hWnd: _RemotableHandle; Msg: SYSUINT;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult; stdcall;
    function SetNotifyCallbackFunction(pfnCallback: PPPrivateAlias1;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult; stdcall;
    function SetNotifyCallbackInterface(pSpCallback: PPPrivateAlias1;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult; stdcall;
    function SetNotifyWin32Event: HResult; stdcall;
    function WaitForNotifyEvent(dwMilliseconds: LongWord): HResult; stdcall;
    function GetNotifyEventHandle: Pointer; stdcall;
  end;

  ISpEventSource = interface(ISpNotifySource)
    ['{BE7A9CCE-5F9E-11D2-960F-00C04F8EE628}']
    function SetInterest(ullEventInterest: Largeuint;
      ullQueuedInterest: Largeuint): HResult; stdcall;
    function GetEvents(ulCount: LongWord; out pEventArray: SPEVENT;
      out pulFetched: LongWord): HResult; stdcall;
    function GetInfo(out pInfo: SPEVENTSOURCEINFO): HResult; stdcall;
  end;

  ISpEventSink = interface(IUnknown)
    ['{BE7A9CC9-5F9E-11D2-960F-00C04F8EE628}']
    function AddEvents(var pEventArray: SPEVENT; ulCount: LongWord)
      : HResult; stdcall;
    function GetEventInterest(out pullEventInterest: Largeuint)
      : HResult; stdcall;
  end;

  ISpObjectWithToken = interface(IUnknown)
    ['{5B559F40-E952-11D2-BB91-00C04F8EE6C0}']
    function SetObjectToken(const pToken: ISpObjectToken): HResult; stdcall;
    function GetObjectToken(out ppToken: ISpObjectToken): HResult; stdcall;
  end;

  ISpAudio = interface(ISpStreamFormat)
    ['{C05C768F-FAE8-4EC2-8E07-338321C12452}']
    function SetState(NewState: SPAUDIOSTATE; ullReserved: Largeuint)
      : HResult; stdcall;
    function SetFormat(var rguidFmtId: TGUID; var pWaveFormatEx: WAVEFORMATEX)
      : HResult; stdcall;
    function GetStatus(out pStatus: SPAUDIOSTATUS): HResult; stdcall;
    function SetBufferInfo(var pBuffInfo: SPAUDIOBUFFERINFO): HResult; stdcall;
    function GetBufferInfo(out pBuffInfo: SPAUDIOBUFFERINFO): HResult; stdcall;
    function GetDefaultFormat(out pFormatId: TGUID;
      out ppCoMemWaveFormatEx: PUserType2): HResult; stdcall;
    function EventHandle: Pointer; stdcall;
    function GetVolumeLevel(out pLevel: LongWord): HResult; stdcall;
    function SetVolumeLevel(Level: LongWord): HResult; stdcall;
    function GetBufferNotifySize(out pcbSize: LongWord): HResult; stdcall;
    function SetBufferNotifySize(cbSize: LongWord): HResult; stdcall;
  end;

  ISpMMSysAudio = interface(ISpAudio)
    ['{15806F6E-1D70-4B48-98E6-3B1A007509AB}']
    function GetDeviceId(out puDeviceId: SYSUINT): HResult; stdcall;
    function SetDeviceId(uDeviceId: SYSUINT): HResult; stdcall;
    function GetMMHandle(out pHandle: Pointer): HResult; stdcall;
    function GetLineId(out puLineId: SYSUINT): HResult; stdcall;
    function SetLineId(uLineId: SYSUINT): HResult; stdcall;
  end;

  ISpStream = interface(ISpStreamFormat)
    ['{12E3CCA9-7518-44C5-A5E7-BA5A79CB929E}']
    function SetBaseStream(const pStream: IStream; var rguidFormat: TGUID;
      var pWaveFormatEx: WAVEFORMATEX): HResult; stdcall;
    function GetBaseStream(out ppStream: IStream): HResult; stdcall;
    function BindToFile(pszFileName: PWideChar; eMode: SPFILEMODE;
      var pFormatId: TGUID; var pWaveFormatEx: WAVEFORMATEX;
      ullEventInterest: Largeuint): HResult; stdcall;
    function Close: HResult; stdcall;
  end;

  ISpVoice = interface(ISpEventSource)
    ['{6C44DF74-72B9-4992-A1EC-EF996E0422D4}']
    function SetOutput(const pUnkOutput: IUnknown; fAllowFormatChanges: Integer)
      : HResult; stdcall;
    function GetOutputObjectToken(out ppObjectToken: ISpObjectToken)
      : HResult; stdcall;
    function GetOutputStream(out ppStream: ISpStreamFormat): HResult; stdcall;
    function Pause: HResult; stdcall;
    function Resume: HResult; stdcall;
    function SetVoice(const pToken: ISpObjectToken): HResult; stdcall;
    function GetVoice(out ppToken: ISpObjectToken): HResult; stdcall;
    function Speak(pwcs: PWideChar; dwFlags: LongWord;
      out pulStreamNumber: LongWord): HResult; stdcall;
    function SpeakStream(const pStream: IStream; dwFlags: LongWord;
      out pulStreamNumber: LongWord): HResult; stdcall;
    function GetStatus(out pStatus: SPVOICESTATUS;
      out ppszLastBookmark: PWideChar): HResult; stdcall;
    function Skip(pItemType: PWideChar; lNumItems: Integer;
      out pulNumSkipped: LongWord): HResult; stdcall;
    function SetPriority(ePriority: SPVPRIORITY): HResult; stdcall;
    function GetPriority(out pePriority: SPVPRIORITY): HResult; stdcall;
    function SetAlertBoundary(eBoundary: SPEVENTENUM): HResult; stdcall;
    function GetAlertBoundary(out peBoundary: SPEVENTENUM): HResult; stdcall;
    function SetRate(RateAdjust: Integer): HResult; stdcall;
    function GetRate(out pRateAdjust: Integer): HResult; stdcall;
    function SetVolume(usVolume: Word): HResult; stdcall;
    function GetVolume(out pusVolume: Word): HResult; stdcall;
    function WaitUntilDone(msTimeout: LongWord): HResult; stdcall;
    function SetSyncSpeakTimeout(msTimeout: LongWord): HResult; stdcall;
    function GetSyncSpeakTimeout(out pmsTimeout: LongWord): HResult; stdcall;
    function SpeakCompleteEvent: Pointer; stdcall;
    function IsUISupported(pszTypeOfUI: PWideChar; pvExtraData: Pointer;
      cbExtraData: LongWord; out pfSupported: Integer): HResult; stdcall;
    function DisplayUI(var hWndParent: _RemotableHandle; pszTitle: PWideChar;
      pszTypeOfUI: PWideChar; pvExtraData: Pointer; cbExtraData: LongWord)
      : HResult; stdcall;
  end;

  ISpPhoneticAlphabetSelection = interface(IUnknown)
    ['{B2745EFD-42CE-48CA-81F1-A96E02538A90}']
    function IsAlphabetUPS(out pfIsUPS: Integer): HResult; stdcall;
    function SetAlphabetToUPS(fForceUPS: Integer): HResult; stdcall;
  end;

  ISpRecoContext = interface(ISpEventSource)
    ['{F740A62F-7C15-489E-8234-940A33D9272D}']
    function GetRecognizer(out ppRecognizer: ISpRecognizer): HResult; stdcall;
    function CreateGrammar(ullGrammarID: Largeuint;
      out ppGrammar: ISpRecoGrammar): HResult; stdcall;
    function GetStatus(out pStatus: SPRECOCONTEXTSTATUS): HResult; stdcall;
    function GetMaxAlternates(var pcAlternates: LongWord): HResult; stdcall;
    function SetMaxAlternates(cAlternates: LongWord): HResult; stdcall;
    function SetAudioOptions(Options: SPAUDIOOPTIONS; var pAudioFormatId: TGUID;
      var pWaveFormatEx: WAVEFORMATEX): HResult; stdcall;
    function GetAudioOptions(var pOptions: SPAUDIOOPTIONS;
      out pAudioFormatId: TGUID; out ppCoMemWFEX: PUserType2): HResult; stdcall;
    function DeserializeResult(var pSerializedResult: SPSERIALIZEDRESULT;
      out ppResult: ISpRecoResult): HResult; stdcall;
    function Bookmark(Options: SPBOOKMARKOPTIONS; ullStreamPosition: Largeuint;
      lparamEvent: LONG_PTR): HResult; stdcall;
    function SetAdaptationData(pAdaptationData: PWideChar; cch: LongWord)
      : HResult; stdcall;
    function Pause(dwReserved: LongWord): HResult; stdcall;
    function Resume(dwReserved: LongWord): HResult; stdcall;
    function SetVoice(const pVoice: ISpVoice; fAllowFormatChanges: Integer)
      : HResult; stdcall;
    function GetVoice(out ppVoice: ISpVoice): HResult; stdcall;
    function SetVoicePurgeEvent(ullEventInterest: Largeuint): HResult; stdcall;
    function GetVoicePurgeEvent(out pullEventInterest: Largeuint)
      : HResult; stdcall;
    function SetContextState(eContextState: SPCONTEXTSTATE): HResult; stdcall;
    function GetContextState(out peContextState: SPCONTEXTSTATE)
      : HResult; stdcall;
  end;

  ISpRecoContext2 = interface(IUnknown)
    ['{BEAD311C-52FF-437F-9464-6B21054CA73D}']
    function SetGrammarOptions(eGrammarOptions: LongWord): HResult; stdcall;
    function GetGrammarOptions(out peGrammarOptions: LongWord)
      : HResult; stdcall;
    function SetAdaptationData2(pAdaptationData: PWideChar; cch: LongWord;
      pTopicName: PWideChar; eAdaptationSettings: LongWord;
      eRelevance: SPADAPTATIONRELEVANCE): HResult; stdcall;
  end;

  ISpProperties = interface(IUnknown)
    ['{5B4FB971-B115-4DE1-AD97-E482E3BF6EE4}']
    function SetPropertyNum(pName: PWideChar; lValue: Integer)
      : HResult; stdcall;
    function GetPropertyNum(pName: PWideChar; out plValue: Integer)
      : HResult; stdcall;
    function SetPropertyString(pName: PWideChar; pValue: PWideChar)
      : HResult; stdcall;
    function GetPropertyString(pName: PWideChar; out ppCoMemValue: PWideChar)
      : HResult; stdcall;
  end;

  ISpRecognizer = interface(ISpProperties)
    ['{C2B5F241-DAA0-4507-9E16-5A1EAA2B7A5C}']
    function SetRecognizer(const pRecognizer: ISpObjectToken): HResult; stdcall;
    function GetRecognizer(out ppRecognizer: ISpObjectToken): HResult; stdcall;
    function SetInput(const pUnkInput: IUnknown; fAllowFormatChanges: Integer)
      : HResult; stdcall;
    function GetInputObjectToken(out ppToken: ISpObjectToken): HResult; stdcall;
    function GetInputStream(out ppStream: ISpStreamFormat): HResult; stdcall;
    function CreateRecoContext(out ppNewCtxt: ISpRecoContext): HResult; stdcall;
    function GetRecoProfile(out ppToken: ISpObjectToken): HResult; stdcall;
    function SetRecoProfile(const pToken: ISpObjectToken): HResult; stdcall;
    function IsSharedInstance: HResult; stdcall;
    function GetRecoState(out pState: SPRECOSTATE): HResult; stdcall;
    function SetRecoState(NewState: SPRECOSTATE): HResult; stdcall;
    function GetStatus(out pStatus: SPRECOGNIZERSTATUS): HResult; stdcall;
    function GetFormat(WaveFormatType: SPSTREAMFORMATTYPE; out pFormatId: TGUID;
      out ppCoMemWFEX: PUserType2): HResult; stdcall;
    function IsUISupported(pszTypeOfUI: PWideChar; pvExtraData: Pointer;
      cbExtraData: LongWord; out pfSupported: Integer): HResult; stdcall;
    function DisplayUI(var hWndParent: _RemotableHandle; pszTitle: PWideChar;
      pszTypeOfUI: PWideChar; pvExtraData: Pointer; cbExtraData: LongWord)
      : HResult; stdcall;
    function EmulateRecognition(const pPhrase: ISpPhrase): HResult; stdcall;
  end;

  ISpPhrase = interface(IUnknown)
    ['{1A5C0354-B621-4B5A-8791-D306ED379E53}']
    function GetPhrase(out ppCoMemPhrase: PUserType7): HResult; stdcall;
    function GetSerializedPhrase(out ppCoMemPhrase: PUserType8)
      : HResult; stdcall;
    function GetText(ulStart: LongWord; ulCount: LongWord;
      fUseTextReplacements: Integer; out ppszCoMemText: PWideChar;
      out pbDisplayAttributes: Byte): HResult; stdcall;
    function Discard(dwValueTypes: LongWord): HResult; stdcall;
  end;

  ISpGrammarBuilder = interface(IUnknown)
    ['{8137828F-591A-4A42-BE58-49EA7EBAAC68}']
    function ResetGrammar(NewLanguage: Word): HResult; stdcall;
    function GetRule(pszRuleName: PWideChar; dwRuleId: LongWord;
      dwAttributes: LongWord; fCreateIfNotExist: Integer;
      out phInitialState: Pointer): HResult; stdcall;
    function ClearRule(hState: Pointer): HResult; stdcall;
    function CreateNewState(hState: Pointer; out phState: Pointer)
      : HResult; stdcall;
    function AddWordTransition(hFromState: Pointer; hToState: Pointer;
      psz: PWideChar; pszSeparators: PWideChar; eWordType: SPGRAMMARWORDTYPE;
      Weight: Single; var pPropInfo: SPPROPERTYINFO): HResult; stdcall;
    function AddRuleTransition(hFromState: Pointer; hToState: Pointer;
      hRule: Pointer; Weight: Single; var pPropInfo: SPPROPERTYINFO)
      : HResult; stdcall;
    function AddResource(hRuleState: Pointer; pszResourceName: PWideChar;
      pszResourceValue: PWideChar): HResult; stdcall;
    function Commit(dwReserved: LongWord): HResult; stdcall;
  end;

  ISpRecoGrammar = interface(ISpGrammarBuilder)
    ['{2177DB29-7F45-47D0-8554-067E91C80502}']
    function GetGrammarId(out pullGrammarId: Largeuint): HResult; stdcall;
    function GetRecoContext(out ppRecoCtxt: ISpRecoContext): HResult; stdcall;
    function LoadCmdFromFile(pszFileName: PWideChar; Options: SPLOADOPTIONS)
      : HResult; stdcall;
    function LoadCmdFromObject(var rcid: TGUID; pszGrammarName: PWideChar;
      Options: SPLOADOPTIONS): HResult; stdcall;
    function LoadCmdFromResource(hModule: Pointer; pszResourceName: PWideChar;
      pszResourceType: PWideChar; wLanguage: Word; Options: SPLOADOPTIONS)
      : HResult; stdcall;
    function LoadCmdFromMemory(var pGrammar: SPBINARYGRAMMAR;
      Options: SPLOADOPTIONS): HResult; stdcall;
    function LoadCmdFromProprietaryGrammar(var rguidParam: TGUID;
      pszStringParam: PWideChar; pvDataPrarm: Pointer; cbDataSize: LongWord;
      Options: SPLOADOPTIONS): HResult; stdcall;
    function SetRuleState(pszName: PWideChar; pReserved: Pointer;
      NewState: SPRULESTATE): HResult; stdcall;
    function SetRuleIdState(ulRuleId: LongWord; NewState: SPRULESTATE)
      : HResult; stdcall;
    function LoadDictation(pszTopicName: PWideChar; Options: SPLOADOPTIONS)
      : HResult; stdcall;
    function UnloadDictation: HResult; stdcall;
    function SetDictationState(NewState: SPRULESTATE): HResult; stdcall;
    function SetWordSequenceData(var pText: Word; cchText: LongWord;
      var pInfo: SPTEXTSELECTIONINFO): HResult; stdcall;
    function SetTextSelection(var pInfo: SPTEXTSELECTIONINFO): HResult; stdcall;
    function IsPronounceable(pszWord: PWideChar;
      out pWordPronounceable: SPWORDPRONOUNCEABLE): HResult; stdcall;
    function SetGrammarState(eGrammarState: SPGRAMMARSTATE): HResult; stdcall;
    function SaveCmd(const pStream: IStream; out ppszCoMemErrorText: PWideChar)
      : HResult; stdcall;
    function GetGrammarState(out peGrammarState: SPGRAMMARSTATE)
      : HResult; stdcall;
  end;

  ISpRecoResult = interface(ISpPhrase)
    ['{20B053BE-E235-43CD-9A2A-8D17A48B7842}']
    function GetResultTimes(out pTimes: SPRECORESULTTIMES): HResult; stdcall;
    function GetAlternates(ulStartElement: LongWord; cElements: LongWord;
      ulRequestCount: LongWord; out ppPhrases: ISpPhraseAlt;
      out pcPhrasesReturned: LongWord): HResult; stdcall;
    function GetAudio(ulStartElement: LongWord; cElements: LongWord;
      out ppStream: ISpStreamFormat): HResult; stdcall;
    function SpeakAudio(ulStartElement: LongWord; cElements: LongWord;
      dwFlags: LongWord; out pulStreamNumber: LongWord): HResult; stdcall;
    function Serialize(out ppCoMemSerializedResult: PUserType6)
      : HResult; stdcall;
    function ScaleAudio(var pAudioFormatId: TGUID;
      var pWaveFormatEx: WAVEFORMATEX): HResult; stdcall;
    function GetRecoContext(out ppRecoContext: ISpRecoContext)
      : HResult; stdcall;
  end;

  ISpPhraseAlt = interface(ISpPhrase)
    ['{8FCEBC98-4E49-4067-9C6C-D86A0E092E3D}']
    function GetAltInfo(out ppParent: ISpPhrase;
      out pulStartElementInParent: LongWord; out pcElementsInParent: LongWord;
      out pcElementsInAlt: LongWord): HResult; stdcall;
    function Commit: HResult; stdcall;
  end;

  ISpRecognizer2 = interface(IUnknown)
    ['{8FC6D974-C81E-4098-93C5-0147F61ED4D3}']
    function EmulateRecognitionEx(const pPhrase: ISpPhrase;
      dwCompareFlags: LongWord): HResult; stdcall;
    function SetTrainingState(fDoingTraining: Integer;
      fAdaptFromTrainingData: Integer): HResult; stdcall;
    function ResetAcousticModelAdaptation: HResult; stdcall;
  end;

  ISpRecognizer3 = interface(IUnknown)
    ['{DF1B943C-5838-4AA2-8706-D7CD5B333499}']
    function GetCategory(categoryType: SPCATEGORYTYPE;
      out ppCategory: ISpRecoCategory): HResult; stdcall;
    function SetActiveCategory(const pCategory: ISpRecoCategory)
      : HResult; stdcall;
    function GetActiveCategory(out ppCategory: ISpRecoCategory)
      : HResult; stdcall;
  end;

  ISpSerializeState = interface(IUnknown)
    ['{21B501A0-0EC7-46C9-92C3-A2BC784C54B9}']
    function GetSerializedState(out ppbData: PByte1; out pulSize: LongWord;
      dwReserved: LongWord): HResult; stdcall;
    function SetSerializedState(var pbData: Byte; ulSize: LongWord;
      dwReserved: LongWord): HResult; stdcall;
  end;

  ISpRecoCategory = interface(IUnknown)
    ['{DA0CD0F9-14A2-4F09-8C2A-85CC48979345}']
    function GetType(out peCategoryType: SPCATEGORYTYPE): HResult; stdcall;
  end;

  ISpLexicon = interface(IUnknown)
    ['{DA41A7C2-5383-4DB2-916B-6C1719E3DB58}']
    function GetPronunciations(pszWord: PWideChar; LangId: Word;
      dwFlags: LongWord; var pWordPronunciationList: SPWORDPRONUNCIATIONLIST)
      : HResult; stdcall;
    function AddPronunciation(pszWord: PWideChar; LangId: Word;
      ePartOfSpeech: SPPARTOFSPEECH; pszPronunciation: PWideChar)
      : HResult; stdcall;
    function RemovePronunciation(pszWord: PWideChar; LangId: Word;
      ePartOfSpeech: SPPARTOFSPEECH; pszPronunciation: PWideChar)
      : HResult; stdcall;
    function GetGeneration(out pdwGeneration: LongWord): HResult; stdcall;
    function GetGenerationChange(dwFlags: LongWord; var pdwGeneration: LongWord;
      var pWordList: SPWORDLIST): HResult; stdcall;
    function GetWords(dwFlags: LongWord; var pdwGeneration: LongWord;
      var pdwCookie: LongWord; var pWordList: SPWORDLIST): HResult; stdcall;
  end;

  ISpShortcut = interface(IUnknown)
    ['{3DF681E2-EA56-11D9-8BDE-F66BAD1E3F3A}']
    function AddShortcut(pszDisplay: PWideChar; LangId: Word;
      pszSpoken: PWideChar; shType: SPSHORTCUTTYPE): HResult; stdcall;
    function RemoveShortcut(pszDisplay: PWideChar; LangId: Word;
      pszSpoken: PWideChar; shType: SPSHORTCUTTYPE): HResult; stdcall;
    function GetShortcuts(LangId: Word;
      var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult; stdcall;
    function GetGeneration(out pdwGeneration: LongWord): HResult; stdcall;
    function GetWordsFromGenerationChange(var pdwGeneration: LongWord;
      var pWordList: SPWORDLIST): HResult; stdcall;
    function GetWords(var pdwGeneration: LongWord; var pdwCookie: LongWord;
      var pWordList: SPWORDLIST): HResult; stdcall;
    function GetShortcutsForGeneration(var pdwGeneration: LongWord;
      var pdwCookie: LongWord; var pShortcutpairList: SPSHORTCUTPAIRLIST)
      : HResult; stdcall;
    function GetGenerationChange(var pdwGeneration: LongWord;
      var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult; stdcall;
  end;

  ISpPhoneConverter = interface(ISpObjectWithToken)
    ['{8445C581-0CAC-4A38-ABFE-9B2CE2826455}']
    function PhoneToId(pszPhone: PWideChar; out pId: Word): HResult; stdcall;
    function IdToPhone(pId: PWideChar; out pszPhone: Word): HResult; stdcall;
  end;

  ISpPhoneticAlphabetConverter = interface(IUnknown)
    ['{133ADCD4-19B4-4020-9FDC-842E78253B17}']
    function GetLangId(out pLangID: Word): HResult; stdcall;
    function SetLangId(LangId: Word): HResult; stdcall;
    function SAPI2UPS(var pszSAPIId: Word; out pszUPSId: Word;
      cMaxLength: LongWord): HResult; stdcall;
    function UPS2SAPI(var pszUPSId: Word; out pszSAPIId: Word;
      cMaxLength: LongWord): HResult; stdcall;
    function GetMaxConvertLength(cSrcLength: LongWord; bSAPI2UPS: Integer;
      out pcMaxDestLength: LongWord): HResult; stdcall;
  end;

  ISpXMLRecoResult = interface(ISpRecoResult)
    ['{AE39362B-45A8-4074-9B9E-CCF49AA2D0B6}']
    function GetXMLResult(out ppszCoMemXMLResult: PWideChar;
      Options: SPXMLRESULTOPTIONS): HResult; stdcall;
    function GetXMLErrorInfo(out pSemanticErrorInfo: SPSEMANTICERRORINFO)
      : HResult; stdcall;
  end;

  ISpRecoGrammar2 = interface(IUnknown)
    ['{4B37BC9E-9ED6-44A3-93D3-18F022B79EC3}']
    function GetRules(out ppCoMemRules: PUserType17; out puNumRules: SYSUINT)
      : HResult; stdcall;
    function LoadCmdFromFile2(pszFileName: PWideChar; Options: SPLOADOPTIONS;
      pszSharingUri: PWideChar; pszBaseUri: PWideChar): HResult; stdcall;
    function LoadCmdFromMemory2(var pGrammar: SPBINARYGRAMMAR;
      Options: SPLOADOPTIONS; pszSharingUri: PWideChar; pszBaseUri: PWideChar)
      : HResult; stdcall;
    function SetRulePriority(pszRuleName: PWideChar; ulRuleId: LongWord;
      nRulePriority: SYSINT): HResult; stdcall;
    function SetRuleWeight(pszRuleName: PWideChar; ulRuleId: LongWord;
      flWeight: Single): HResult; stdcall;
    function SetDictationWeight(flWeight: Single): HResult; stdcall;
    function SetGrammarLoader(const pLoader: ISpeechResourceLoader)
      : HResult; stdcall;
    function SetSMLSecurityManager(const pSMLSecurityManager
      : IInternetSecurityManager): HResult; stdcall;
  end;

  ISpeechResourceLoader = interface(IDispatch)
    ['{B9AC5783-FCD0-4B21-B119-B4F8DA8FD2C3}']
    procedure LoadResource(const bstrResourceUri: WideString;
      fAlwaysReload: WordBool; out pStream: IUnknown;
      out pbstrMIMEType: WideString; out pfModified: WordBool;
      out pbstrRedirectUrl: WideString); safecall;
    procedure GetLocalCopy(const bstrResourceUri: WideString;
      out pbstrLocalPath: WideString; out pbstrMIMEType: WideString;
      out pbstrRedirectUrl: WideString); safecall;
    procedure ReleaseLocalCopy(const pbstrLocalPath: WideString); safecall;
  end;

  ISpeechResourceLoaderDisp = dispinterface
    ['{B9AC5783-FCD0-4B21-B119-B4F8DA8FD2C3}']
    procedure LoadResource(const bstrResourceUri: WideString;
      fAlwaysReload: WordBool; out pStream: IUnknown;
      out pbstrMIMEType: WideString; out pfModified: WordBool;
      out pbstrRedirectUrl: WideString); dispid 1;
    procedure GetLocalCopy(const bstrResourceUri: WideString;
      out pbstrLocalPath: WideString; out pbstrMIMEType: WideString;
      out pbstrRedirectUrl: WideString); dispid 2;
    procedure ReleaseLocalCopy(const pbstrLocalPath: WideString); dispid 3;
  end;

  IInternetSecurityManager = interface(IUnknown)
    ['{79EAC9EE-BAF9-11CE-8C82-00AA004BA90B}']
    function SetSecuritySite(const pSite: IInternetSecurityMgrSite)
      : HResult; stdcall;
    function GetSecuritySite(out ppSite: IInternetSecurityMgrSite)
      : HResult; stdcall;
    function MapUrlToZone(pwszUrl: PWideChar; out pdwZone: LongWord;
      dwFlags: LongWord): HResult; stdcall;
    function GetSecurityId(pwszUrl: PWideChar; out pbSecurityId: Byte;
      var pcbSecurityId: LongWord; dwReserved: ULONG_PTR): HResult; stdcall;
    function ProcessUrlAction(pwszUrl: PWideChar; dwAction: LongWord;
      out pPolicy: Byte; cbPolicy: LongWord; var pContext: Byte;
      cbContext: LongWord; dwFlags: LongWord; dwReserved: LongWord)
      : HResult; stdcall;
    function QueryCustomPolicy(pwszUrl: PWideChar; var guidKey: TGUID;
      out ppPolicy: PByte1; out pcbPolicy: LongWord; var pContext: Byte;
      cbContext: LongWord; dwReserved: LongWord): HResult; stdcall;
    function SetZoneMapping(dwZone: LongWord; lpszPattern: PWideChar;
      dwFlags: LongWord): HResult; stdcall;
    function GetZoneMappings(dwZone: LongWord; out ppenumString: IEnumString;
      dwFlags: LongWord): HResult; stdcall;
  end;

  IInternetSecurityMgrSite = interface(IUnknown)
    ['{79EAC9ED-BAF9-11CE-8C82-00AA004BA90B}']
    function GetWindow(out phwnd: wireHWND): HResult; stdcall;
    function EnableModeless(fEnable: Integer): HResult; stdcall;
  end;

  IEnumString = interface(IUnknown)
    ['{00000101-0000-0000-C000-000000000046}']
    function RemoteNext(celt: LongWord; out rgelt: PWideChar;
      out pceltFetched: LongWord): HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppEnum: IEnumString): HResult; stdcall;
  end;

  CoSpNotifyTranslator = class
    class function Create: ISpNotifyTranslator;
    class function CreateRemote(const MachineName: string): ISpNotifyTranslator;
  end;

  TSpNotifyTranslator = class(TOleServer)
  private
    FIntf: ISpNotifyTranslator;
    function GetDefaultInterface: ISpNotifyTranslator;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpNotifyTranslator);
    procedure Disconnect; override;
    function Notify: HResult;
    function InitWindowMessage(var hWnd: _RemotableHandle; Msg: SYSUINT;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult;
    function InitCallback(pfnCallback: PPPrivateAlias1; wParam: UINT_PTR;
      lParam: LONG_PTR): HResult;
    function InitSpNotifyCallback(pSpCallback: PPPrivateAlias1;
      wParam: UINT_PTR; lParam: LONG_PTR): HResult;
    function InitWin32Event(hEvent: Pointer;
      fCloseHandleOnRelease: Integer): HResult;
    function Wait(dwMilliseconds: LongWord): HResult;
    function GetEventHandle: Pointer;
    property DefaultInterface: ISpNotifyTranslator read GetDefaultInterface;
  published
  end;

  CoSpObjectTokenCategory = class
    class function Create: ISpeechObjectTokenCategory;
    class function CreateRemote(const MachineName: string)
      : ISpeechObjectTokenCategory;
  end;

  TSpObjectTokenCategory = class(TOleServer)
  private
    FIntf: ISpeechObjectTokenCategory;
    function GetDefaultInterface: ISpeechObjectTokenCategory;
  protected
    procedure InitServerData; override;
    function Get_Id: WideString;
    procedure Set_Default(const TokenId: WideString);
    function Get_Default: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechObjectTokenCategory);
    procedure Disconnect; override;
    procedure SetId(const Id: WideString; CreateIfNotExist: WordBool);
    function GetDataKey(Location: SpeechDataKeyLocation): ISpeechDataKey;
    function EnumerateTokens(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    property DefaultInterface: ISpeechObjectTokenCategory
      read GetDefaultInterface;
    property Id: WideString read Get_Id;
    property Default: WideString read Get_Default write Set_Default;
  published
  end;

  CoSpObjectToken = class
    class function Create: ISpeechObjectToken;
    class function CreateRemote(const MachineName: string): ISpeechObjectToken;
  end;

  TSpObjectToken = class(TOleServer)
  private
    FIntf: ISpeechObjectToken;
    function GetDefaultInterface: ISpeechObjectToken;
  protected
    procedure InitServerData; override;
    function Get_Id: WideString;
    function Get_DataKey: ISpeechDataKey;
    function Get_Category: ISpeechObjectTokenCategory;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechObjectToken);
    procedure Disconnect; override;
    function GetDescription(Locale: Integer): WideString;
    procedure SetId(const Id: WideString; const CategoryID: WideString;
      CreateIfNotExist: WordBool);
    function GetAttribute(const AttributeName: WideString): WideString;
    function CreateInstance(const pUnkOuter: IUnknown;
      ClsContext: SpeechTokenContext): IUnknown;
    procedure Remove(const ObjectStorageCLSID: WideString);
    function GetStorageFileName(const ObjectStorageCLSID: WideString;
      const KeyName: WideString; const FileName: WideString;
      Folder: SpeechTokenShellFolder): WideString;
    procedure RemoveStorageFileName(const ObjectStorageCLSID: WideString;
      const KeyName: WideString; DeleteFile: WordBool);
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant; const Object_: IUnknown): WordBool;
    procedure DisplayUI(hWnd: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant;
      const Object_: IUnknown);
    function MatchesAttributes(const Attributes: WideString): WordBool;
    property DefaultInterface: ISpeechObjectToken read GetDefaultInterface;
    property Id: WideString read Get_Id;
    property DataKey: ISpeechDataKey read Get_DataKey;
    property Category: ISpeechObjectTokenCategory read Get_Category;
  published
  end;

  CoSpResourceManager = class
    class function Create: ISpResourceManager;
    class function CreateRemote(const MachineName: string): ISpResourceManager;
  end;

  TSpResourceManager = class(TOleServer)
  private
    FIntf: ISpResourceManager;
    function GetDefaultInterface: ISpResourceManager;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpResourceManager);
    procedure Disconnect; override;
    function RemoteQueryService(var guidService: TGUID; var riid: TGUID;
      out ppvObject: IUnknown): HResult;
    function SetObject(var guidServiceId: TGUID;
      const punkObject: IUnknown): HResult;
    function GetObject(var guidServiceId: TGUID; var ObjectCLSID: TGUID;
      var ObjectIID: TGUID; fReleaseWhenLastExternalRefReleased: Integer;
      out ppObject: Pointer): HResult;
    property DefaultInterface: ISpResourceManager read GetDefaultInterface;
  published
  end;

  CoSpStreamFormatConverter = class
    class function Create: ISpStreamFormatConverter;
    class function CreateRemote(const MachineName: string)
      : ISpStreamFormatConverter;
  end;

  TSpStreamFormatConverter = class(TOleServer)
  private
    FIntf: ISpStreamFormatConverter;
    function GetDefaultInterface: ISpStreamFormatConverter;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpStreamFormatConverter);
    procedure Disconnect; override;
    function RemoteRead(out pv: Byte; cb: LongWord;
      out pcbRead: LongWord): HResult;
    function RemoteWrite(var pv: Byte; cb: LongWord;
      out pcbWritten: LongWord): HResult;
    function RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord;
      out plibNewPosition: _ULARGE_INTEGER): HResult;
    function SetSize(libNewSize: _ULARGE_INTEGER): HResult;
    function RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER;
      out pcbRead: _ULARGE_INTEGER; out pcbWritten: _ULARGE_INTEGER): HResult;
    function Commit(grfCommitFlags: LongWord): HResult;
    function Revert: HResult;
    function LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
      dwLockType: LongWord): HResult;
    function UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
      dwLockType: LongWord): HResult;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult;
    function Clone(out ppstm: IStream): HResult;
    function GetFormat(var pguidFormatId: TGUID;
      out ppCoMemWaveFormatEx: PUserType2): HResult;
    function SetBaseStream(const pStream: ISpStreamFormat;
      fSetFormatToBaseStreamFormat: Integer;
      fWriteToBaseStream: Integer): HResult;
    function GetBaseStream(out ppStream: ISpStreamFormat): HResult;
    function SetFormat(var rguidFormatIdOfConvertedStream: TGUID;
      var pWaveFormatExOfConvertedStream: WAVEFORMATEX): HResult;
    function ResetSeekPosition: HResult;
    function ScaleConvertedToBaseOffset(ullOffsetConvertedStream: Largeuint;
      out pullOffsetBaseStream: Largeuint): HResult;
    function ScaleBaseToConvertedOffset(ullOffsetBaseStream: Largeuint;
      out pullOffsetConvertedStream: Largeuint): HResult;
    property DefaultInterface: ISpStreamFormatConverter
      read GetDefaultInterface;
  published
  end;

  CoSpMMAudioEnum = class
    class function Create: IEnumSpObjectTokens;
    class function CreateRemote(const MachineName: string): IEnumSpObjectTokens;
  end;

  TSpMMAudioEnum = class(TOleServer)
  private
    FIntf: IEnumSpObjectTokens;
    function GetDefaultInterface: IEnumSpObjectTokens;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IEnumSpObjectTokens);
    procedure Disconnect; override;
    function Next(celt: LongWord; out pelt: ISpObjectToken;
      out pceltFetched: LongWord): HResult;
    function Skip(celt: LongWord): HResult;
    function Reset: HResult;
    function Clone(out ppEnum: IEnumSpObjectTokens): HResult;
    function Item(Index: LongWord; out ppToken: ISpObjectToken): HResult;
    function GetCount(out pCount: LongWord): HResult;
    property DefaultInterface: IEnumSpObjectTokens read GetDefaultInterface;
  published
  end;

  CoSpMMAudioIn = class
    class function Create: ISpeechMMSysAudio;
    class function CreateRemote(const MachineName: string): ISpeechMMSysAudio;
  end;

  TSpMMAudioIn = class(TOleServer)
  private
    FIntf: ISpeechMMSysAudio;
    function GetDefaultInterface: ISpeechMMSysAudio;
  protected
    procedure InitServerData; override;
    function Get_Format: ISpeechAudioFormat;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat);
    function Get_Status: ISpeechAudioStatus;
    function Get_BufferInfo: ISpeechAudioBufferInfo;
    function Get_DefaultFormat: ISpeechAudioFormat;
    function Get_Volume: Integer;
    procedure Set_Volume(Volume: Integer);
    function Get_BufferNotifySize: Integer;
    procedure Set_BufferNotifySize(BufferNotifySize: Integer);
    function Get_EventHandle: Integer;
    function Get_DeviceId: Integer;
    procedure Set_DeviceId(DeviceId: Integer);
    function Get_LineId: Integer;
    procedure Set_LineId(LineId: Integer);
    function Get_MMHandle: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechMMSysAudio);
    procedure Disconnect; override;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer;
    function Write(Buffer: OleVariant): Integer;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant;
    procedure SetState(State: SpeechAudioState);
    property DefaultInterface: ISpeechMMSysAudio read GetDefaultInterface;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
    property Status: ISpeechAudioStatus read Get_Status;
    property BufferInfo: ISpeechAudioBufferInfo read Get_BufferInfo;
    property DefaultFormat: ISpeechAudioFormat read Get_DefaultFormat;
    property EventHandle: Integer read Get_EventHandle;
    property MMHandle: Integer read Get_MMHandle;
    property Volume: Integer read Get_Volume write Set_Volume;
    property BufferNotifySize: Integer read Get_BufferNotifySize
      write Set_BufferNotifySize;
    property DeviceId: Integer read Get_DeviceId write Set_DeviceId;
    property LineId: Integer read Get_LineId write Set_LineId;
  published
  end;

  CoSpMMAudioOut = class
    class function Create: ISpeechMMSysAudio;
    class function CreateRemote(const MachineName: string): ISpeechMMSysAudio;
  end;

  TSpMMAudioOut = class(TOleServer)
  private
    FIntf: ISpeechMMSysAudio;
    function GetDefaultInterface: ISpeechMMSysAudio;
  protected
    procedure InitServerData; override;
    function Get_Format: ISpeechAudioFormat;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat);
    function Get_Status: ISpeechAudioStatus;
    function Get_BufferInfo: ISpeechAudioBufferInfo;
    function Get_DefaultFormat: ISpeechAudioFormat;
    function Get_Volume: Integer;
    procedure Set_Volume(Volume: Integer);
    function Get_BufferNotifySize: Integer;
    procedure Set_BufferNotifySize(BufferNotifySize: Integer);
    function Get_EventHandle: Integer;
    function Get_DeviceId: Integer;
    procedure Set_DeviceId(DeviceId: Integer);
    function Get_LineId: Integer;
    procedure Set_LineId(LineId: Integer);
    function Get_MMHandle: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechMMSysAudio);
    procedure Disconnect; override;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer;
    function Write(Buffer: OleVariant): Integer;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant;
    procedure SetState(State: SpeechAudioState);
    property DefaultInterface: ISpeechMMSysAudio read GetDefaultInterface;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
    property Status: ISpeechAudioStatus read Get_Status;
    property BufferInfo: ISpeechAudioBufferInfo read Get_BufferInfo;
    property DefaultFormat: ISpeechAudioFormat read Get_DefaultFormat;
    property EventHandle: Integer read Get_EventHandle;
    property MMHandle: Integer read Get_MMHandle;
    property Volume: Integer read Get_Volume write Set_Volume;
    property BufferNotifySize: Integer read Get_BufferNotifySize
      write Set_BufferNotifySize;
    property DeviceId: Integer read Get_DeviceId write Set_DeviceId;
    property LineId: Integer read Get_LineId write Set_LineId;
  published
  end;

  CoSpStream = class
    class function Create: ISpStream;
    class function CreateRemote(const MachineName: string): ISpStream;
  end;

  TSpStream = class(TOleServer)
  private
    FIntf: ISpStream;
    function GetDefaultInterface: ISpStream;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpStream);
    procedure Disconnect; override;
    function RemoteRead(out pv: Byte; cb: LongWord;
      out pcbRead: LongWord): HResult;
    function RemoteWrite(var pv: Byte; cb: LongWord;
      out pcbWritten: LongWord): HResult;
    function RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord;
      out plibNewPosition: _ULARGE_INTEGER): HResult;
    function SetSize(libNewSize: _ULARGE_INTEGER): HResult;
    function RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER;
      out pcbRead: _ULARGE_INTEGER; out pcbWritten: _ULARGE_INTEGER): HResult;
    function Commit(grfCommitFlags: LongWord): HResult;
    function Revert: HResult;
    function LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
      dwLockType: LongWord): HResult;
    function UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
      dwLockType: LongWord): HResult;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult;
    function Clone(out ppstm: IStream): HResult;
    function GetFormat(var pguidFormatId: TGUID;
      out ppCoMemWaveFormatEx: PUserType2): HResult;
    function SetBaseStream(const pStream: IStream; var rguidFormat: TGUID;
      var pWaveFormatEx: WAVEFORMATEX): HResult;
    function GetBaseStream(out ppStream: IStream): HResult;
    function BindToFile(pszFileName: PWideChar; eMode: SPFILEMODE;
      var pFormatId: TGUID; var pWaveFormatEx: WAVEFORMATEX;
      ullEventInterest: Largeuint): HResult;
    function Close: HResult;
    property DefaultInterface: ISpStream read GetDefaultInterface;
  published
  end;

  CoSpVoice = class
    class function Create: ISpeechVoice;
    class function CreateRemote(const MachineName: string): ISpeechVoice;
  end;

  TSpVoiceStartStream = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant) of object;
  TSpVoiceEndStream = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant) of object;
  TSpVoiceVoiceChange = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; const VoiceObjectToken: ISpeechObjectToken)
    of object;
  TSpVoiceBookmark = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; const Bookmark: WideString; BookmarkId: Integer)
    of object;
  TSpVoiceWord = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; CharacterPosition: Integer; Length: Integer)
    of object;
  TSpVoiceSentence = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; CharacterPosition: Integer; Length: Integer)
    of object;
  TSpVoicePhoneme = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; Duration: Integer; NextPhoneId: Smallint;
    Feature: SpeechVisemeFeature; CurrentPhoneId: Smallint) of object;
  TSpVoiceViseme = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; Duration: Integer;
    NextVisemeId: SpeechVisemeType; Feature: SpeechVisemeFeature;
    CurrentVisemeId: SpeechVisemeType) of object;
  TSpVoiceAudioLevel = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: OleVariant; AudioLevel: Integer) of object;
  TSpVoiceEnginePrivate = procedure(ASender: TObject; StreamNumber: Integer;
    StreamPosition: Integer; EngineData: OleVariant) of object;

  TSpVoice = class(TOleServer)
  private
    FOnStartStream: TSpVoiceStartStream;
    FOnEndStream: TSpVoiceEndStream;
    FOnVoiceChange: TSpVoiceVoiceChange;
    FOnBookmark: TSpVoiceBookmark;
    FOnWord: TSpVoiceWord;
    FOnSentence: TSpVoiceSentence;
    FOnPhoneme: TSpVoicePhoneme;
    FOnViseme: TSpVoiceViseme;
    FOnAudioLevel: TSpVoiceAudioLevel;
    FOnEnginePrivate: TSpVoiceEnginePrivate;
    FIntf: ISpeechVoice;
    function GetDefaultInterface: ISpeechVoice;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(dispid: TDispID; var Params: TVariantArray); override;
    function Get_Status: ISpeechVoiceStatus;
    function Get_Voice: ISpeechObjectToken;
    procedure _Set_Voice(const Voice: ISpeechObjectToken);
    function Get_AudioOutput: ISpeechObjectToken;
    procedure _Set_AudioOutput(const AudioOutput: ISpeechObjectToken);
    function Get_AudioOutputStream: ISpeechBaseStream;
    procedure _Set_AudioOutputStream(const AudioOutputStream
      : ISpeechBaseStream);
    function Get_Rate: Integer;
    procedure Set_Rate(Rate: Integer);
    function Get_Volume: Integer;
    procedure Set_Volume(Volume: Integer);
    procedure Set_AllowAudioOutputFormatChangesOnNextSet(Allow: WordBool);
    function Get_AllowAudioOutputFormatChangesOnNextSet: WordBool;
    function Get_EventInterests: SpeechVoiceEvents;
    procedure Set_EventInterests(EventInterestFlags: SpeechVoiceEvents);
    procedure Set_Priority(Priority: SpeechVoicePriority);
    function Get_Priority: SpeechVoicePriority;
    procedure Set_AlertBoundary(Boundary: SpeechVoiceEvents);
    function Get_AlertBoundary: SpeechVoiceEvents;
    procedure Set_SynchronousSpeakTimeout(msTimeout: Integer);
    function Get_SynchronousSpeakTimeout: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechVoice);
    procedure Disconnect; override;
    function Speak(const Text: WideString;
      Flags: SpeechVoiceSpeakFlags): Integer;
    function SpeakStream(const Stream: ISpeechBaseStream;
      Flags: SpeechVoiceSpeakFlags): Integer;
    procedure Pause;
    procedure Resume;
    function Skip(const type_: WideString; NumItems: Integer): Integer;
    function GetVoices(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    function GetAudioOutputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    function WaitUntilDone(msTimeout: Integer): WordBool;
    function SpeakCompleteEvent: Integer;
    function IsUISupported(const TypeOfUI: WideString): WordBool; overload;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString); overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); overload;
    property DefaultInterface: ISpeechVoice read GetDefaultInterface;
    property Status: ISpeechVoiceStatus read Get_Status;
    property Voice: ISpeechObjectToken read Get_Voice write _Set_Voice;
    property AudioOutput: ISpeechObjectToken read Get_AudioOutput
      write _Set_AudioOutput;
    property AudioOutputStream: ISpeechBaseStream read Get_AudioOutputStream
      write _Set_AudioOutputStream;
    property AllowAudioOutputFormatChangesOnNextSet: WordBool
      read Get_AllowAudioOutputFormatChangesOnNextSet
      write Set_AllowAudioOutputFormatChangesOnNextSet;
    property Rate: Integer read Get_Rate write Set_Rate;
    property Volume: Integer read Get_Volume write Set_Volume;
    property EventInterests: SpeechVoiceEvents read Get_EventInterests
      write Set_EventInterests;
    property Priority: SpeechVoicePriority read Get_Priority write Set_Priority;
    property AlertBoundary: SpeechVoiceEvents read Get_AlertBoundary
      write Set_AlertBoundary;
    property SynchronousSpeakTimeout: Integer read Get_SynchronousSpeakTimeout
      write Set_SynchronousSpeakTimeout;
  published
    property OnStartStream: TSpVoiceStartStream read FOnStartStream
      write FOnStartStream;
    property OnEndStream: TSpVoiceEndStream read FOnEndStream
      write FOnEndStream;
    property OnVoiceChange: TSpVoiceVoiceChange read FOnVoiceChange
      write FOnVoiceChange;
    property OnBookmark: TSpVoiceBookmark read FOnBookmark write FOnBookmark;
    property OnWord: TSpVoiceWord read FOnWord write FOnWord;
    property OnSentence: TSpVoiceSentence read FOnSentence write FOnSentence;
    property OnPhoneme: TSpVoicePhoneme read FOnPhoneme write FOnPhoneme;
    property OnViseme: TSpVoiceViseme read FOnViseme write FOnViseme;
    property OnAudioLevel: TSpVoiceAudioLevel read FOnAudioLevel
      write FOnAudioLevel;
    property OnEnginePrivate: TSpVoiceEnginePrivate read FOnEnginePrivate
      write FOnEnginePrivate;
  end;

  CoSpSharedRecoContext = class
    class function Create: ISpeechRecoContext;
    class function CreateRemote(const MachineName: string): ISpeechRecoContext;
  end;

  TSpSharedRecoContextStartStream = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpSharedRecoContextEndStream = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; StreamReleased: WordBool)
    of object;
  TSpSharedRecoContextBookmark = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; BookmarkId: OleVariant;
    Options: SpeechBookmarkOptions) of object;
  TSpSharedRecoContextSoundStart = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpSharedRecoContextSoundEnd = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpSharedRecoContextPhraseStart = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpSharedRecoContextRecognition = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    RecognitionType: SpeechRecognitionType; const Result: ISpeechRecoResult)
    of object;
  TSpSharedRecoContextHypothesis = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const Result: ISpeechRecoResult) of object;
  TSpSharedRecoContextPropertyNumberChange = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const PropertyName: WideString; NewNumberValue: Integer) of object;
  TSpSharedRecoContextPropertyStringChange = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const PropertyName: WideString; const NewStringValue: WideString) of object;
  TSpSharedRecoContextFalseRecognition = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const Result: ISpeechRecoResult) of object;
  TSpSharedRecoContextInterference = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    Interference: SpeechInterference) of object;
  TSpSharedRecoContextRequestUI = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; const UIType: WideString)
    of object;
  TSpSharedRecoContextRecognizerStateChange = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    NewState: SpeechRecognizerState) of object;
  TSpSharedRecoContextAdaptation = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpSharedRecoContextRecognitionForOtherContext = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpSharedRecoContextAudioLevel = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer)
    of object;
  TSpSharedRecoContextEnginePrivate = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; EngineData: OleVariant)
    of object;

  TSpSharedRecoContext = class(TOleServer)
  private
    FOnStartStream: TSpSharedRecoContextStartStream;
    FOnEndStream: TSpSharedRecoContextEndStream;
    FOnBookmark: TSpSharedRecoContextBookmark;
    FOnSoundStart: TSpSharedRecoContextSoundStart;
    FOnSoundEnd: TSpSharedRecoContextSoundEnd;
    FOnPhraseStart: TSpSharedRecoContextPhraseStart;
    FOnRecognition: TSpSharedRecoContextRecognition;
    FOnHypothesis: TSpSharedRecoContextHypothesis;
    FOnPropertyNumberChange: TSpSharedRecoContextPropertyNumberChange;
    FOnPropertyStringChange: TSpSharedRecoContextPropertyStringChange;
    FOnFalseRecognition: TSpSharedRecoContextFalseRecognition;
    FOnInterference: TSpSharedRecoContextInterference;
    FOnRequestUI: TSpSharedRecoContextRequestUI;
    FOnRecognizerStateChange: TSpSharedRecoContextRecognizerStateChange;
    FOnAdaptation: TSpSharedRecoContextAdaptation;
    FOnRecognitionForOtherContext
      : TSpSharedRecoContextRecognitionForOtherContext;
    FOnAudioLevel: TSpSharedRecoContextAudioLevel;
    FOnEnginePrivate: TSpSharedRecoContextEnginePrivate;
    FIntf: ISpeechRecoContext;
    function GetDefaultInterface: ISpeechRecoContext;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(dispid: TDispID; var Params: TVariantArray); override;
    function Get_Recognizer: ISpeechRecognizer;
    function Get_AudioInputInterferenceStatus: SpeechInterference;
    function Get_RequestedUIType: WideString;
    procedure _Set_Voice(const Voice: ISpeechVoice);
    function Get_Voice: ISpeechVoice;
    procedure Set_AllowVoiceFormatMatchingOnNextSet(pAllow: WordBool);
    function Get_AllowVoiceFormatMatchingOnNextSet: WordBool;
    procedure Set_VoicePurgeEvent(EventInterest: SpeechRecoEvents);
    function Get_VoicePurgeEvent: SpeechRecoEvents;
    procedure Set_EventInterests(EventInterest: SpeechRecoEvents);
    function Get_EventInterests: SpeechRecoEvents;
    procedure Set_CmdMaxAlternates(MaxAlternates: Integer);
    function Get_CmdMaxAlternates: Integer;
    procedure Set_State(State: SpeechRecoContextState);
    function Get_State: SpeechRecoContextState;
    procedure Set_RetainedAudio(Option: SpeechRetainedAudioOptions);
    function Get_RetainedAudio: SpeechRetainedAudioOptions;
    procedure _Set_RetainedAudioFormat(const Format: ISpeechAudioFormat);
    function Get_RetainedAudioFormat: ISpeechAudioFormat;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechRecoContext);
    procedure Disconnect; override;
    procedure Pause;
    procedure Resume;
    function CreateGrammar: ISpeechRecoGrammar; overload;
    function CreateGrammar(GrammarId: OleVariant): ISpeechRecoGrammar; overload;
    function CreateResultFromMemory(const ResultBlock: OleVariant)
      : ISpeechRecoResult;
    procedure Bookmark(Options: SpeechBookmarkOptions; StreamPos: OleVariant;
      BookmarkId: OleVariant);
    procedure SetAdaptationData(const AdaptationString: WideString);
    property DefaultInterface: ISpeechRecoContext read GetDefaultInterface;
    property Recognizer: ISpeechRecognizer read Get_Recognizer;
    property AudioInputInterferenceStatus: SpeechInterference
      read Get_AudioInputInterferenceStatus;
    property RequestedUIType: WideString read Get_RequestedUIType;
    property Voice: ISpeechVoice read Get_Voice write _Set_Voice;
    property AllowVoiceFormatMatchingOnNextSet: WordBool
      read Get_AllowVoiceFormatMatchingOnNextSet
      write Set_AllowVoiceFormatMatchingOnNextSet;
    property RetainedAudioFormat: ISpeechAudioFormat
      read Get_RetainedAudioFormat write _Set_RetainedAudioFormat;
    property VoicePurgeEvent: SpeechRecoEvents read Get_VoicePurgeEvent
      write Set_VoicePurgeEvent;
    property EventInterests: SpeechRecoEvents read Get_EventInterests
      write Set_EventInterests;
    property CmdMaxAlternates: Integer read Get_CmdMaxAlternates
      write Set_CmdMaxAlternates;
    property State: SpeechRecoContextState read Get_State write Set_State;
    property RetainedAudio: SpeechRetainedAudioOptions read Get_RetainedAudio
      write Set_RetainedAudio;
  published
    property OnStartStream: TSpSharedRecoContextStartStream read FOnStartStream
      write FOnStartStream;
    property OnEndStream: TSpSharedRecoContextEndStream read FOnEndStream
      write FOnEndStream;
    property OnBookmark: TSpSharedRecoContextBookmark read FOnBookmark
      write FOnBookmark;
    property OnSoundStart: TSpSharedRecoContextSoundStart read FOnSoundStart
      write FOnSoundStart;
    property OnSoundEnd: TSpSharedRecoContextSoundEnd read FOnSoundEnd
      write FOnSoundEnd;
    property OnPhraseStart: TSpSharedRecoContextPhraseStart read FOnPhraseStart
      write FOnPhraseStart;
    property OnRecognition: TSpSharedRecoContextRecognition read FOnRecognition
      write FOnRecognition;
    property OnHypothesis: TSpSharedRecoContextHypothesis read FOnHypothesis
      write FOnHypothesis;
    property OnPropertyNumberChange: TSpSharedRecoContextPropertyNumberChange
      read FOnPropertyNumberChange write FOnPropertyNumberChange;
    property OnPropertyStringChange: TSpSharedRecoContextPropertyStringChange
      read FOnPropertyStringChange write FOnPropertyStringChange;
    property OnFalseRecognition: TSpSharedRecoContextFalseRecognition
      read FOnFalseRecognition write FOnFalseRecognition;
    property OnInterference: TSpSharedRecoContextInterference
      read FOnInterference write FOnInterference;
    property OnRequestUI: TSpSharedRecoContextRequestUI read FOnRequestUI
      write FOnRequestUI;
    property OnRecognizerStateChange: TSpSharedRecoContextRecognizerStateChange
      read FOnRecognizerStateChange write FOnRecognizerStateChange;
    property OnAdaptation: TSpSharedRecoContextAdaptation read FOnAdaptation
      write FOnAdaptation;
    property OnRecognitionForOtherContext
      : TSpSharedRecoContextRecognitionForOtherContext
      read FOnRecognitionForOtherContext write FOnRecognitionForOtherContext;
    property OnAudioLevel: TSpSharedRecoContextAudioLevel read FOnAudioLevel
      write FOnAudioLevel;
    property OnEnginePrivate: TSpSharedRecoContextEnginePrivate
      read FOnEnginePrivate write FOnEnginePrivate;
  end;

  CoSpInprocRecognizer = class
    class function Create: ISpeechRecognizer;
    class function CreateRemote(const MachineName: string): ISpeechRecognizer;
  end;

  TSpInprocRecognizer = class(TOleServer)
  private
    FIntf: ISpeechRecognizer;
    function GetDefaultInterface: ISpeechRecognizer;
  protected
    procedure InitServerData; override;
    procedure _Set_Recognizer(const Recognizer: ISpeechObjectToken);
    function Get_Recognizer: ISpeechObjectToken;
    procedure Set_AllowAudioInputFormatChangesOnNextSet(Allow: WordBool);
    function Get_AllowAudioInputFormatChangesOnNextSet: WordBool;
    procedure _Set_AudioInput(const AudioInput: ISpeechObjectToken);
    function Get_AudioInput: ISpeechObjectToken;
    procedure _Set_AudioInputStream(const AudioInputStream: ISpeechBaseStream);
    function Get_AudioInputStream: ISpeechBaseStream;
    function Get_IsShared: WordBool;
    procedure Set_State(State: SpeechRecognizerState);
    function Get_State: SpeechRecognizerState;
    function Get_Status: ISpeechRecognizerStatus;
    procedure _Set_Profile(const Profile: ISpeechObjectToken);
    function Get_Profile: ISpeechObjectToken;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechRecognizer);
    procedure Disconnect; override;
    procedure EmulateRecognition(TextElements: OleVariant;
      const ElementDisplayAttributes: OleVariant; LanguageId: Integer);
    function CreateRecoContext: ISpeechRecoContext;
    function GetFormat(type_: SpeechFormatType): ISpeechAudioFormat;
    function SetPropertyNumber(const Name: WideString; Value: Integer)
      : WordBool;
    function GetPropertyNumber(const Name: WideString; var Value: Integer)
      : WordBool;
    function SetPropertyString(const Name: WideString; const Value: WideString)
      : WordBool;
    function GetPropertyString(const Name: WideString; var Value: WideString)
      : WordBool;
    function IsUISupported(const TypeOfUI: WideString): WordBool; overload;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString); overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); overload;
    function GetRecognizers(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    function GetAudioInputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    function GetProfiles(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    property DefaultInterface: ISpeechRecognizer read GetDefaultInterface;
    property Recognizer: ISpeechObjectToken read Get_Recognizer
      write _Set_Recognizer;
    property AllowAudioInputFormatChangesOnNextSet: WordBool
      read Get_AllowAudioInputFormatChangesOnNextSet
      write Set_AllowAudioInputFormatChangesOnNextSet;
    property AudioInput: ISpeechObjectToken read Get_AudioInput
      write _Set_AudioInput;
    property AudioInputStream: ISpeechBaseStream read Get_AudioInputStream
      write _Set_AudioInputStream;
    property IsShared: WordBool read Get_IsShared;
    property Status: ISpeechRecognizerStatus read Get_Status;
    property Profile: ISpeechObjectToken read Get_Profile write _Set_Profile;
    property State: SpeechRecognizerState read Get_State write Set_State;
  published
  end;

  CoSpSharedRecognizer = class
    class function Create: ISpeechRecognizer;
    class function CreateRemote(const MachineName: string): ISpeechRecognizer;
  end;

  TSpSharedRecognizer = class(TOleServer)
  private
    FIntf: ISpeechRecognizer;
    function GetDefaultInterface: ISpeechRecognizer;
  protected
    procedure InitServerData; override;
    procedure _Set_Recognizer(const Recognizer: ISpeechObjectToken);
    function Get_Recognizer: ISpeechObjectToken;
    procedure Set_AllowAudioInputFormatChangesOnNextSet(Allow: WordBool);
    function Get_AllowAudioInputFormatChangesOnNextSet: WordBool;
    procedure _Set_AudioInput(const AudioInput: ISpeechObjectToken);
    function Get_AudioInput: ISpeechObjectToken;
    procedure _Set_AudioInputStream(const AudioInputStream: ISpeechBaseStream);
    function Get_AudioInputStream: ISpeechBaseStream;
    function Get_IsShared: WordBool;
    procedure Set_State(State: SpeechRecognizerState);
    function Get_State: SpeechRecognizerState;
    function Get_Status: ISpeechRecognizerStatus;
    procedure _Set_Profile(const Profile: ISpeechObjectToken);
    function Get_Profile: ISpeechObjectToken;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechRecognizer);
    procedure Disconnect; override;
    procedure EmulateRecognition(TextElements: OleVariant;
      const ElementDisplayAttributes: OleVariant; LanguageId: Integer);
    function CreateRecoContext: ISpeechRecoContext;
    function GetFormat(type_: SpeechFormatType): ISpeechAudioFormat;
    function SetPropertyNumber(const Name: WideString; Value: Integer)
      : WordBool;
    function GetPropertyNumber(const Name: WideString; var Value: Integer)
      : WordBool;
    function SetPropertyString(const Name: WideString; const Value: WideString)
      : WordBool;
    function GetPropertyString(const Name: WideString; var Value: WideString)
      : WordBool;
    function IsUISupported(const TypeOfUI: WideString): WordBool; overload;
    function IsUISupported(const TypeOfUI: WideString;
      const ExtraData: OleVariant): WordBool; overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString); overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString;
      const TypeOfUI: WideString; const ExtraData: OleVariant); overload;
    function GetRecognizers(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    function GetAudioInputs(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    function GetProfiles(const RequiredAttributes: WideString;
      const OptionalAttributes: WideString): ISpeechObjectTokens;
    property DefaultInterface: ISpeechRecognizer read GetDefaultInterface;
    property Recognizer: ISpeechObjectToken read Get_Recognizer
      write _Set_Recognizer;
    property AllowAudioInputFormatChangesOnNextSet: WordBool
      read Get_AllowAudioInputFormatChangesOnNextSet
      write Set_AllowAudioInputFormatChangesOnNextSet;
    property AudioInput: ISpeechObjectToken read Get_AudioInput
      write _Set_AudioInput;
    property AudioInputStream: ISpeechBaseStream read Get_AudioInputStream
      write _Set_AudioInputStream;
    property IsShared: WordBool read Get_IsShared;
    property Status: ISpeechRecognizerStatus read Get_Status;
    property Profile: ISpeechObjectToken read Get_Profile write _Set_Profile;
    property State: SpeechRecognizerState read Get_State write Set_State;
  published
  end;

  CoSpLexicon = class
    class function Create: ISpeechLexicon;
    class function CreateRemote(const MachineName: string): ISpeechLexicon;
  end;

  TSpLexicon = class(TOleServer)
  private
    FIntf: ISpeechLexicon;
    function GetDefaultInterface: ISpeechLexicon;
  protected
    procedure InitServerData; override;
    function Get_GenerationId: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechLexicon);
    procedure Disconnect; override;
    function GetWords(Flags: SpeechLexiconType; out GenerationId: Integer)
      : ISpeechLexiconWords;
    procedure AddPronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech; const bstrPronunciation: WideString);
    procedure AddPronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech); overload;
    procedure AddPronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); overload;
    procedure RemovePronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech; const bstrPronunciation: WideString);
    procedure RemovePronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech); overload;
    procedure RemovePronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); overload;
    function GetPronunciations(const bstrWord: WideString; LangId: Integer;
      TypeFlags: SpeechLexiconType): ISpeechLexiconPronunciations;
    function GetGenerationChange(var GenerationId: Integer)
      : ISpeechLexiconWords;
    property DefaultInterface: ISpeechLexicon read GetDefaultInterface;
    property GenerationId: Integer read Get_GenerationId;
  published
  end;

  CoSpUnCompressedLexicon = class
    class function Create: ISpeechLexicon;
    class function CreateRemote(const MachineName: string): ISpeechLexicon;
  end;

  TSpUnCompressedLexicon = class(TOleServer)
  private
    FIntf: ISpeechLexicon;
    function GetDefaultInterface: ISpeechLexicon;
  protected
    procedure InitServerData; override;
    function Get_GenerationId: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechLexicon);
    procedure Disconnect; override;
    function GetWords(Flags: SpeechLexiconType; out GenerationId: Integer)
      : ISpeechLexiconWords;
    procedure AddPronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech; const bstrPronunciation: WideString);
    procedure AddPronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech); overload;
    procedure AddPronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); overload;
    procedure RemovePronunciation(const bstrWord: WideString; LangId: Integer;
      PartOfSpeech: SpeechPartOfSpeech; const bstrPronunciation: WideString);
    procedure RemovePronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech); overload;
    procedure RemovePronunciationByPhoneIds(const bstrWord: WideString;
      LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
      const PhoneIds: OleVariant); overload;
    function GetPronunciations(const bstrWord: WideString; LangId: Integer;
      TypeFlags: SpeechLexiconType): ISpeechLexiconPronunciations;
    function GetGenerationChange(var GenerationId: Integer)
      : ISpeechLexiconWords;
    property DefaultInterface: ISpeechLexicon read GetDefaultInterface;
    property GenerationId: Integer read Get_GenerationId;
  published
  end;

  CoSpCompressedLexicon = class
    class function Create: ISpLexicon;
    class function CreateRemote(const MachineName: string): ISpLexicon;
  end;

  TSpCompressedLexicon = class(TOleServer)
  private
    FIntf: ISpLexicon;
    function GetDefaultInterface: ISpLexicon;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpLexicon);
    procedure Disconnect; override;
    function GetPronunciations(pszWord: PWideChar; LangId: Word;
      dwFlags: LongWord; var pWordPronunciationList
      : SPWORDPRONUNCIATIONLIST): HResult;
    function AddPronunciation(pszWord: PWideChar; LangId: Word;
      ePartOfSpeech: SPPARTOFSPEECH; pszPronunciation: PWideChar): HResult;
    function RemovePronunciation(pszWord: PWideChar; LangId: Word;
      ePartOfSpeech: SPPARTOFSPEECH; pszPronunciation: PWideChar): HResult;
    function GetGeneration(out pdwGeneration: LongWord): HResult;
    function GetGenerationChange(dwFlags: LongWord; var pdwGeneration: LongWord;
      var pWordList: SPWORDLIST): HResult;
    function GetWords(dwFlags: LongWord; var pdwGeneration: LongWord;
      var pdwCookie: LongWord; var pWordList: SPWORDLIST): HResult;
    property DefaultInterface: ISpLexicon read GetDefaultInterface;
  published
  end;

  CoSpShortcut = class
    class function Create: ISpShortcut;
    class function CreateRemote(const MachineName: string): ISpShortcut;
  end;

  TSpShortcut = class(TOleServer)
  private
    FIntf: ISpShortcut;
    function GetDefaultInterface: ISpShortcut;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpShortcut);
    procedure Disconnect; override;
    function AddShortcut(pszDisplay: PWideChar; LangId: Word;
      pszSpoken: PWideChar; shType: SPSHORTCUTTYPE): HResult;
    function RemoveShortcut(pszDisplay: PWideChar; LangId: Word;
      pszSpoken: PWideChar; shType: SPSHORTCUTTYPE): HResult;
    function GetShortcuts(LangId: Word;
      var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult;
    function GetGeneration(out pdwGeneration: LongWord): HResult;
    function GetWordsFromGenerationChange(var pdwGeneration: LongWord;
      var pWordList: SPWORDLIST): HResult;
    function GetWords(var pdwGeneration: LongWord; var pdwCookie: LongWord;
      var pWordList: SPWORDLIST): HResult;
    function GetShortcutsForGeneration(var pdwGeneration: LongWord;
      var pdwCookie: LongWord;
      var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult;
    function GetGenerationChange(var pdwGeneration: LongWord;
      var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult;
    property DefaultInterface: ISpShortcut read GetDefaultInterface;
  published
  end;

  CoSpPhoneConverter = class
    class function Create: ISpeechPhoneConverter;
    class function CreateRemote(const MachineName: string)
      : ISpeechPhoneConverter;
  end;

  TSpPhoneConverter = class(TOleServer)
  private
    FIntf: ISpeechPhoneConverter;
    function GetDefaultInterface: ISpeechPhoneConverter;
  protected
    procedure InitServerData; override;
    function Get_LanguageId: Integer;
    procedure Set_LanguageId(LanguageId: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechPhoneConverter);
    procedure Disconnect; override;
    function PhoneToId(const Phonemes: WideString): OleVariant;
    function IdToPhone(IdArray: OleVariant): WideString;
    property DefaultInterface: ISpeechPhoneConverter read GetDefaultInterface;
    property LanguageId: Integer read Get_LanguageId write Set_LanguageId;
  published
  end;

  CoSpPhoneticAlphabetConverter = class
    class function Create: ISpPhoneticAlphabetConverter;
    class function CreateRemote(const MachineName: string)
      : ISpPhoneticAlphabetConverter;
  end;

  TSpPhoneticAlphabetConverter = class(TOleServer)
  private
    FIntf: ISpPhoneticAlphabetConverter;
    function GetDefaultInterface: ISpPhoneticAlphabetConverter;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpPhoneticAlphabetConverter);
    procedure Disconnect; override;
    function GetLangId(out pLangID: Word): HResult;
    function SetLangId(LangId: Word): HResult;
    function SAPI2UPS(var pszSAPIId: Word; out pszUPSId: Word;
      cMaxLength: LongWord): HResult;
    function UPS2SAPI(var pszUPSId: Word; out pszSAPIId: Word;
      cMaxLength: LongWord): HResult;
    function GetMaxConvertLength(cSrcLength: LongWord; bSAPI2UPS: Integer;
      out pcMaxDestLength: LongWord): HResult;
    property DefaultInterface: ISpPhoneticAlphabetConverter
      read GetDefaultInterface;
  published
  end;

  CoSpNullPhoneConverter = class
    class function Create: ISpPhoneConverter;
    class function CreateRemote(const MachineName: string): ISpPhoneConverter;
  end;

  TSpNullPhoneConverter = class(TOleServer)
  private
    FIntf: ISpPhoneConverter;
    function GetDefaultInterface: ISpPhoneConverter;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpPhoneConverter);
    procedure Disconnect; override;
    function SetObjectToken(const pToken: ISpObjectToken): HResult;
    function GetObjectToken(out ppToken: ISpObjectToken): HResult;
    function PhoneToId(pszPhone: PWideChar; out pId: Word): HResult;
    function IdToPhone(pId: PWideChar; out pszPhone: Word): HResult;
    property DefaultInterface: ISpPhoneConverter read GetDefaultInterface;
  published
  end;

  CoSpTextSelectionInformation = class
    class function Create: ISpeechTextSelectionInformation;
    class function CreateRemote(const MachineName: string)
      : ISpeechTextSelectionInformation;
  end;

  TSpTextSelectionInformation = class(TOleServer)
  private
    FIntf: ISpeechTextSelectionInformation;
    function GetDefaultInterface: ISpeechTextSelectionInformation;
  protected
    procedure InitServerData; override;
    procedure Set_ActiveOffset(ActiveOffset: Integer);
    function Get_ActiveOffset: Integer;
    procedure Set_ActiveLength(ActiveLength: Integer);
    function Get_ActiveLength: Integer;
    procedure Set_SelectionOffset(SelectionOffset: Integer);
    function Get_SelectionOffset: Integer;
    procedure Set_SelectionLength(SelectionLength: Integer);
    function Get_SelectionLength: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechTextSelectionInformation);
    procedure Disconnect; override;
    property DefaultInterface: ISpeechTextSelectionInformation
      read GetDefaultInterface;
    property ActiveOffset: Integer read Get_ActiveOffset write Set_ActiveOffset;
    property ActiveLength: Integer read Get_ActiveLength write Set_ActiveLength;
    property SelectionOffset: Integer read Get_SelectionOffset
      write Set_SelectionOffset;
    property SelectionLength: Integer read Get_SelectionLength
      write Set_SelectionLength;
  published
  end;

  CoSpPhraseInfoBuilder = class
    class function Create: ISpeechPhraseInfoBuilder;
    class function CreateRemote(const MachineName: string)
      : ISpeechPhraseInfoBuilder;
  end;

  TSpPhraseInfoBuilder = class(TOleServer)
  private
    FIntf: ISpeechPhraseInfoBuilder;
    function GetDefaultInterface: ISpeechPhraseInfoBuilder;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechPhraseInfoBuilder);
    procedure Disconnect; override;
    function RestorePhraseFromMemory(const PhraseInMemory: OleVariant)
      : ISpeechPhraseInfo;
    property DefaultInterface: ISpeechPhraseInfoBuilder
      read GetDefaultInterface;
  published
  end;

  CoSpAudioFormat = class
    class function Create: ISpeechAudioFormat;
    class function CreateRemote(const MachineName: string): ISpeechAudioFormat;
  end;

  TSpAudioFormat = class(TOleServer)
  private
    FIntf: ISpeechAudioFormat;
    function GetDefaultInterface: ISpeechAudioFormat;
  protected
    procedure InitServerData; override;
    function Get_type_: SpeechAudioFormatType;
    procedure Set_type_(AudioFormat: SpeechAudioFormatType);
    function Get_Guid: WideString;
    procedure Set_Guid(const Guid: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechAudioFormat);
    procedure Disconnect; override;
    function GetWaveFormatEx: ISpeechWaveFormatEx;
    procedure SetWaveFormatEx(const SpeechWaveFormatEx: ISpeechWaveFormatEx);
    property DefaultInterface: ISpeechAudioFormat read GetDefaultInterface;
    property Guid: WideString read Get_Guid write Set_Guid;
    property type_: SpeechAudioFormatType read Get_type_ write Set_type_;
  published
  end;

  CoSpWaveFormatEx = class
    class function Create: ISpeechWaveFormatEx;
    class function CreateRemote(const MachineName: string): ISpeechWaveFormatEx;
  end;

  TSpWaveFormatEx = class(TOleServer)
  private
    FIntf: ISpeechWaveFormatEx;
    function GetDefaultInterface: ISpeechWaveFormatEx;
  protected
    procedure InitServerData; override;
    function Get_FormatTag: Smallint;
    procedure Set_FormatTag(FormatTag: Smallint);
    function Get_Channels: Smallint;
    procedure Set_Channels(Channels: Smallint);
    function Get_SamplesPerSec: Integer;
    procedure Set_SamplesPerSec(SamplesPerSec: Integer);
    function Get_AvgBytesPerSec: Integer;
    procedure Set_AvgBytesPerSec(AvgBytesPerSec: Integer);
    function Get_BlockAlign: Smallint;
    procedure Set_BlockAlign(BlockAlign: Smallint);
    function Get_BitsPerSample: Smallint;
    procedure Set_BitsPerSample(BitsPerSample: Smallint);
    function Get_ExtraData: OleVariant;
    procedure Set_ExtraData(ExtraData: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechWaveFormatEx);
    procedure Disconnect; override;
    property DefaultInterface: ISpeechWaveFormatEx read GetDefaultInterface;
    property ExtraData: OleVariant read Get_ExtraData write Set_ExtraData;
    property FormatTag: Smallint read Get_FormatTag write Set_FormatTag;
    property Channels: Smallint read Get_Channels write Set_Channels;
    property SamplesPerSec: Integer read Get_SamplesPerSec
      write Set_SamplesPerSec;
    property AvgBytesPerSec: Integer read Get_AvgBytesPerSec
      write Set_AvgBytesPerSec;
    property BlockAlign: Smallint read Get_BlockAlign write Set_BlockAlign;
    property BitsPerSample: Smallint read Get_BitsPerSample
      write Set_BitsPerSample;
  published
  end;

  CoSpInProcRecoContext = class
    class function Create: ISpeechRecoContext;
    class function CreateRemote(const MachineName: string): ISpeechRecoContext;
  end;

  TSpInProcRecoContextStartStream = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpInProcRecoContextEndStream = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; StreamReleased: WordBool)
    of object;
  TSpInProcRecoContextBookmark = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; BookmarkId: OleVariant;
    Options: SpeechBookmarkOptions) of object;
  TSpInProcRecoContextSoundStart = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpInProcRecoContextSoundEnd = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpInProcRecoContextPhraseStart = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpInProcRecoContextRecognition = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    RecognitionType: SpeechRecognitionType; const Result: ISpeechRecoResult)
    of object;
  TSpInProcRecoContextHypothesis = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const Result: ISpeechRecoResult) of object;
  TSpInProcRecoContextPropertyNumberChange = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const PropertyName: WideString; NewNumberValue: Integer) of object;
  TSpInProcRecoContextPropertyStringChange = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const PropertyName: WideString; const NewStringValue: WideString) of object;
  TSpInProcRecoContextFalseRecognition = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    const Result: ISpeechRecoResult) of object;
  TSpInProcRecoContextInterference = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    Interference: SpeechInterference) of object;
  TSpInProcRecoContextRequestUI = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; const UIType: WideString)
    of object;
  TSpInProcRecoContextRecognizerStateChange = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant;
    NewState: SpeechRecognizerState) of object;
  TSpInProcRecoContextAdaptation = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpInProcRecoContextRecognitionForOtherContext = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpInProcRecoContextAudioLevel = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer)
    of object;
  TSpInProcRecoContextEnginePrivate = procedure(ASender: TObject;
    StreamNumber: Integer; StreamPosition: OleVariant; EngineData: OleVariant)
    of object;

  TSpInProcRecoContext = class(TOleServer)
  private
    FOnStartStream: TSpInProcRecoContextStartStream;
    FOnEndStream: TSpInProcRecoContextEndStream;
    FOnBookmark: TSpInProcRecoContextBookmark;
    FOnSoundStart: TSpInProcRecoContextSoundStart;
    FOnSoundEnd: TSpInProcRecoContextSoundEnd;
    FOnPhraseStart: TSpInProcRecoContextPhraseStart;
    FOnRecognition: TSpInProcRecoContextRecognition;
    FOnHypothesis: TSpInProcRecoContextHypothesis;
    FOnPropertyNumberChange: TSpInProcRecoContextPropertyNumberChange;
    FOnPropertyStringChange: TSpInProcRecoContextPropertyStringChange;
    FOnFalseRecognition: TSpInProcRecoContextFalseRecognition;
    FOnInterference: TSpInProcRecoContextInterference;
    FOnRequestUI: TSpInProcRecoContextRequestUI;
    FOnRecognizerStateChange: TSpInProcRecoContextRecognizerStateChange;
    FOnAdaptation: TSpInProcRecoContextAdaptation;
    FOnRecognitionForOtherContext
      : TSpInProcRecoContextRecognitionForOtherContext;
    FOnAudioLevel: TSpInProcRecoContextAudioLevel;
    FOnEnginePrivate: TSpInProcRecoContextEnginePrivate;
    FIntf: ISpeechRecoContext;
    function GetDefaultInterface: ISpeechRecoContext;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(dispid: TDispID; var Params: TVariantArray); override;
    function Get_Recognizer: ISpeechRecognizer;
    function Get_AudioInputInterferenceStatus: SpeechInterference;
    function Get_RequestedUIType: WideString;
    procedure _Set_Voice(const Voice: ISpeechVoice);
    function Get_Voice: ISpeechVoice;
    procedure Set_AllowVoiceFormatMatchingOnNextSet(pAllow: WordBool);
    function Get_AllowVoiceFormatMatchingOnNextSet: WordBool;
    procedure Set_VoicePurgeEvent(EventInterest: SpeechRecoEvents);
    function Get_VoicePurgeEvent: SpeechRecoEvents;
    procedure Set_EventInterests(EventInterest: SpeechRecoEvents);
    function Get_EventInterests: SpeechRecoEvents;
    procedure Set_CmdMaxAlternates(MaxAlternates: Integer);
    function Get_CmdMaxAlternates: Integer;
    procedure Set_State(State: SpeechRecoContextState);
    function Get_State: SpeechRecoContextState;
    procedure Set_RetainedAudio(Option: SpeechRetainedAudioOptions);
    function Get_RetainedAudio: SpeechRetainedAudioOptions;
    procedure _Set_RetainedAudioFormat(const Format: ISpeechAudioFormat);
    function Get_RetainedAudioFormat: ISpeechAudioFormat;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechRecoContext);
    procedure Disconnect; override;
    procedure Pause;
    procedure Resume;
    function CreateGrammar: ISpeechRecoGrammar; overload;
    function CreateGrammar(GrammarId: OleVariant): ISpeechRecoGrammar; overload;
    function CreateResultFromMemory(const ResultBlock: OleVariant)
      : ISpeechRecoResult;
    procedure Bookmark(Options: SpeechBookmarkOptions; StreamPos: OleVariant;
      BookmarkId: OleVariant);
    procedure SetAdaptationData(const AdaptationString: WideString);
    property DefaultInterface: ISpeechRecoContext read GetDefaultInterface;
    property Recognizer: ISpeechRecognizer read Get_Recognizer;
    property AudioInputInterferenceStatus: SpeechInterference
      read Get_AudioInputInterferenceStatus;
    property RequestedUIType: WideString read Get_RequestedUIType;
    property Voice: ISpeechVoice read Get_Voice write _Set_Voice;
    property AllowVoiceFormatMatchingOnNextSet: WordBool
      read Get_AllowVoiceFormatMatchingOnNextSet
      write Set_AllowVoiceFormatMatchingOnNextSet;
    property RetainedAudioFormat: ISpeechAudioFormat
      read Get_RetainedAudioFormat write _Set_RetainedAudioFormat;
    property VoicePurgeEvent: SpeechRecoEvents read Get_VoicePurgeEvent
      write Set_VoicePurgeEvent;
    property EventInterests: SpeechRecoEvents read Get_EventInterests
      write Set_EventInterests;
    property CmdMaxAlternates: Integer read Get_CmdMaxAlternates
      write Set_CmdMaxAlternates;
    property State: SpeechRecoContextState read Get_State write Set_State;
    property RetainedAudio: SpeechRetainedAudioOptions read Get_RetainedAudio
      write Set_RetainedAudio;
  published
    property OnStartStream: TSpInProcRecoContextStartStream read FOnStartStream
      write FOnStartStream;
    property OnEndStream: TSpInProcRecoContextEndStream read FOnEndStream
      write FOnEndStream;
    property OnBookmark: TSpInProcRecoContextBookmark read FOnBookmark
      write FOnBookmark;
    property OnSoundStart: TSpInProcRecoContextSoundStart read FOnSoundStart
      write FOnSoundStart;
    property OnSoundEnd: TSpInProcRecoContextSoundEnd read FOnSoundEnd
      write FOnSoundEnd;
    property OnPhraseStart: TSpInProcRecoContextPhraseStart read FOnPhraseStart
      write FOnPhraseStart;
    property OnRecognition: TSpInProcRecoContextRecognition read FOnRecognition
      write FOnRecognition;
    property OnHypothesis: TSpInProcRecoContextHypothesis read FOnHypothesis
      write FOnHypothesis;
    property OnPropertyNumberChange: TSpInProcRecoContextPropertyNumberChange
      read FOnPropertyNumberChange write FOnPropertyNumberChange;
    property OnPropertyStringChange: TSpInProcRecoContextPropertyStringChange
      read FOnPropertyStringChange write FOnPropertyStringChange;
    property OnFalseRecognition: TSpInProcRecoContextFalseRecognition
      read FOnFalseRecognition write FOnFalseRecognition;
    property OnInterference: TSpInProcRecoContextInterference
      read FOnInterference write FOnInterference;
    property OnRequestUI: TSpInProcRecoContextRequestUI read FOnRequestUI
      write FOnRequestUI;
    property OnRecognizerStateChange: TSpInProcRecoContextRecognizerStateChange
      read FOnRecognizerStateChange write FOnRecognizerStateChange;
    property OnAdaptation: TSpInProcRecoContextAdaptation read FOnAdaptation
      write FOnAdaptation;
    property OnRecognitionForOtherContext
      : TSpInProcRecoContextRecognitionForOtherContext
      read FOnRecognitionForOtherContext write FOnRecognitionForOtherContext;
    property OnAudioLevel: TSpInProcRecoContextAudioLevel read FOnAudioLevel
      write FOnAudioLevel;
    property OnEnginePrivate: TSpInProcRecoContextEnginePrivate
      read FOnEnginePrivate write FOnEnginePrivate;
  end;

  CoSpCustomStream = class
    class function Create: ISpeechCustomStream;
    class function CreateRemote(const MachineName: string): ISpeechCustomStream;
  end;

  TSpCustomStream = class(TOleServer)
  private
    FIntf: ISpeechCustomStream;
    function GetDefaultInterface: ISpeechCustomStream;
  protected
    procedure InitServerData; override;
    function Get_Format: ISpeechAudioFormat;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat);
    function Get_BaseStream: IUnknown;
    procedure _Set_BaseStream(const ppUnkStream: IUnknown);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechCustomStream);
    procedure Disconnect; override;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer;
    function Write(Buffer: OleVariant): Integer;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant;
    property DefaultInterface: ISpeechCustomStream read GetDefaultInterface;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
    property BaseStream: IUnknown read Get_BaseStream write _Set_BaseStream;
  published
  end;

  CoSpFileStream = class
    class function Create: ISpeechFileStream;
    class function CreateRemote(const MachineName: string): ISpeechFileStream;
  end;

  TSpFileStream = class(TOleServer)
  private
    FIntf: ISpeechFileStream;
    function GetDefaultInterface: ISpeechFileStream;
  protected
    procedure InitServerData; override;
    function Get_Format: ISpeechAudioFormat;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechFileStream);
    procedure Disconnect; override;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer;
    function Write(Buffer: OleVariant): Integer;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant;
    procedure Open(const FileName: WideString; FileMode: SpeechStreamFileMode;
      DoEvents: WordBool);
    procedure Close;
    property DefaultInterface: ISpeechFileStream read GetDefaultInterface;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
  published
  end;

  CoSpMemoryStream = class
    class function Create: ISpeechMemoryStream;
    class function CreateRemote(const MachineName: string): ISpeechMemoryStream;
  end;

  TSpMemoryStream = class(TOleServer)
  private
    FIntf: ISpeechMemoryStream;
    function GetDefaultInterface: ISpeechMemoryStream;
  protected
    procedure InitServerData; override;
    function Get_Format: ISpeechAudioFormat;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechMemoryStream);
    procedure Disconnect; override;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer;
    function Write(Buffer: OleVariant): Integer;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType)
      : OleVariant;
    procedure SetData(Data: OleVariant);
    function GetData: OleVariant;
    property DefaultInterface: ISpeechMemoryStream read GetDefaultInterface;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
  published
  end;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

//DOM-IGNORE-END
{$ENDREGION}

{$REGION ' DelphiGamekit.System '}
const
  VERSION_MAJOR = '0';
  VERSION_MINOR = '1';
  VERSION_PATCH = '0';

  LOGEXT = 'log';
  PNGEXT = 'png';
  OGGEXT = 'ogg';
  INIEXT = 'ini';
  ARCEXT = 'arc';
  MPGEXT = 'mpg';

  CR = #10;
  LF = #13;
  CRLF = CR+LF;

type
  TBaseObject = class
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

const
  RADTODEG = 180.0 / PI;
  DEGTORAD = PI / 180.0;
  EPSILON  = 0.00001;
  NAN      =  0.0 / 0.0;

type
  TLineIntersection = (liNone, liTrue, liParallel);

  TEaseType = (etLinearTween, etInQuad, etOutQuad, etInOutQuad, etInCubic,
    etOutCubic, etInOutCubic, etInQuart, etOutQuart, etInOutQuart, etInQuint,
    etOutQuint, etInOutQuint, etInSine, etOutSine, etInOutSine, etInExpo,
    etOutExpo, etInOutExpo, etInCircle, etOutCircle, etInOutCircle);

  TCaptureConsoleOutputEvent = procedure(aSender: Pointer; aLine: string);

  PPoint = ^TPoint;
  TPoint = record
    X,Y,Z: Single;
    class operator Initialize (out aDest: TPoint);
    class operator Implicit(aValue: TPoint): SDL_Point;
    class operator Implicit(aValue: TPoint): SDL_FPoint;
    class operator Implicit(aValue: SDL_Point): TPoint;
    class operator Implicit(aValue: SDL_FPoint): TPoint;
    constructor Create(const aX, aY, aZ: Single);
  end;

  PVector = ^TVector;
  TVector = record
    X,Y,Z,W: Single;
    class operator Initialize (out aDest: TVector);
    constructor Create(const aX, aY: Single);
    procedure Assign(const aX, aY: Single); overload; inline;
    procedure Assign(const aX, aY, aZ: Single); overload;
    procedure Assign(const aX, aY, aZ, aW: Single); overload;
    procedure Assign(aVector: TVector); overload; inline;
    procedure Clear; inline;
    procedure Add(aVector: TVector); inline;
    procedure Subtract(aVector: TVector); inline;
    procedure Multiply(aVector: TVector); inline;
    procedure Divide(aVector: TVector); inline;
    function  Magnitude: Single; inline;
    function  MagnitudeTruncate(aMaxMagitude: Single): TVector; inline;
    function  Distance(aVector: TVector): Single; inline;
    procedure Normalize; inline;
    function  Angle(aVector: TVector): Single; inline;
    procedure Thrust(aAngle: Single; aSpeed: Single); inline;
    function  MagnitudeSquared: Single; inline;
    function  DotProduct(aVector: TVector): Single; inline;
    procedure Scale(aValue: Single); inline;
    procedure DivideBy(aValue: Single); inline;
    function  Project(aVector: TVector): TVector; inline;
    procedure Negate; inline;
  end;

  PRect = ^TRect;
  TRect = record
    X, Y, Width,Height: Single;
    class operator Initialize (out aDest: TRect);
    class operator Implicit(aValue: TRect): SDL_Rect;
    class operator Implicit(aValue: TRect): SDL_FRect;
    class operator Implicit(aValue: SDL_Rect): TRect;
    class operator Implicit(aValue: SDL_FRect): TRect;
    constructor Create(const aX, aY, aWidth, aHeight: Single);
    procedure Assign(aX, aY, aWidth, aHeight: Single); inline;
    function  Intersect(aRect: TRect): Boolean; inline;
  end;

const
  TIMER_UPDATE_SPEED = 60.0;
  TIMER_FIXEDUPDATE_SPEED = 60.0;

type
  TTimer = record
  private class var
    FNow: Double;
    FPassed: Double;
    FLast: Double;
    FAccumulator: Double;
    FFrameAccumulator: Double;
    FDeltaTime: Double;
    FFrameCount: Cardinal;
    FFrameRate: Cardinal;
    FUpdateSpeed: Single;
    FFixedUpdateSpeed: Single;
    FFixedUpdateTimer: Single;
  public
    class operator Initialize (out aDest: TTimer);
    class operator Finalize (var aDest: TTimer);
    class procedure Reset(aSpeed: Single=0; aFixedSpeed: Single=0); static;
    class procedure Update; static;
    class function  FrameSpeed(var aTimer: Single; aSpeed: Single): Boolean; static;
    class function  FrameElapsed(var aTimer: Single; aFrames: Single): Boolean; static;
    class function  Elapsed(var aTimer: Single; aSeconds: Single): Boolean; static;
    class function  FrameRate: Cardinal; static;
  end;

type
  PColor = ^TColor;
  TColor = record
    Red, Green, Blue,Alpha: Byte;
    class operator Implicit(aValue: TColor): SDL_Color;
    class operator Implicit(aValue: SDL_Color): TColor;
    function  Make(const aRed, aGreen, aBlue, aAlpha: Byte): TColor;
    function  Makef(const aRed, aGreen, aBlue, aAlpha: Single): TColor;
    function  Fade(const aTo: TColor; const aPos: Single): TColor;
    function  Equal(const aColor: TColor): Boolean;
    procedure Clear;
  end;

{$REGION ' Common Colors '}
const
  ALICEBLUE           : TColor = (Red:$F0; Green:$F8; BLue:$FF; Alpha:$FF);
  ANTIQUEWHITE        : TColor = (Red:$FA; Green:$EB; BLue:$D7; Alpha:$FF);
  AQUA                : TColor = (Red:$00; Green:$FF; BLue:$FF; Alpha:$FF);
  AQUAMARINE          : TColor = (Red:$7F; Green:$FF; BLue:$D4; Alpha:$FF);
  AZURE               : TColor = (Red:$F0; Green:$FF; BLue:$FF; Alpha:$FF);
  BEIGE               : TColor = (Red:$F5; Green:$F5; BLue:$DC; Alpha:$FF);
  BISQUE              : TColor = (Red:$FF; Green:$E4; BLue:$C4; Alpha:$FF);
  BLACK               : TColor = (Red:$00; Green:$00; BLue:$00; Alpha:$FF);
  BLANCHEDALMOND      : TColor = (Red:$FF; Green:$EB; BLue:$CD; Alpha:$FF);
  BLUE                : TColor = (Red:$00; Green:$00; BLue:$FF; Alpha:$FF);
  BLUEVIOLET          : TColor = (Red:$8A; Green:$2B; BLue:$E2; Alpha:$FF);
  BROWN               : TColor = (Red:$A5; Green:$2A; BLue:$2A; Alpha:$FF);
  BURLYWOOD           : TColor = (Red:$DE; Green:$B8; BLue:$87; Alpha:$FF);
  CADETBLUE           : TColor = (Red:$5F; Green:$9E; BLue:$A0; Alpha:$FF);
  CHARTREUSE          : TColor = (Red:$7F; Green:$FF; BLue:$00; Alpha:$FF);
  CHOCOLATE           : TColor = (Red:$D2; Green:$69; BLue:$1E; Alpha:$FF);
  CORAL               : TColor = (Red:$FF; Green:$7F; BLue:$50; Alpha:$FF);
  CORNFLOWERBLUE      : TColor = (Red:$64; Green:$95; BLue:$ED; Alpha:$FF);
  CORNSILK            : TColor = (Red:$FF; Green:$F8; BLue:$DC; Alpha:$FF);
  CRIMSON             : TColor = (Red:$DC; Green:$14; BLue:$3C; Alpha:$FF);
  CYAN                : TColor = (Red:$00; Green:$FF; BLue:$FF; Alpha:$FF);
  DARKBLUE            : TColor = (Red:$00; Green:$00; BLue:$8B; Alpha:$FF);
  DARKCYAN            : TColor = (Red:$00; Green:$8B; BLue:$8B; Alpha:$FF);
  DARKGOLDENROD       : TColor = (Red:$B8; Green:$86; BLue:$0B; Alpha:$FF);
  DARKGRAY            : TColor = (Red:$A9; Green:$A9; BLue:$A9; Alpha:$FF);
  DARKGREEN           : TColor = (Red:$00; Green:$64; BLue:$00; Alpha:$FF);
  DARKGREY            : TColor = (Red:$A9; Green:$A9; BLue:$A9; Alpha:$FF);
  DARKKHAKI           : TColor = (Red:$BD; Green:$B7; BLue:$6B; Alpha:$FF);
  DARKMAGENTA         : TColor = (Red:$8B; Green:$00; BLue:$8B; Alpha:$FF);
  DARKOLIVEGREEN      : TColor = (Red:$55; Green:$6B; BLue:$2F; Alpha:$FF);
  DARKORANGE          : TColor = (Red:$FF; Green:$8C; BLue:$00; Alpha:$FF);
  DARKORCHID          : TColor = (Red:$99; Green:$32; BLue:$CC; Alpha:$FF);
  DARKRED             : TColor = (Red:$8B; Green:$00; BLue:$00; Alpha:$FF);
  DARKSALMON          : TColor = (Red:$E9; Green:$96; BLue:$7A; Alpha:$FF);
  DARKSEAGREEN        : TColor = (Red:$8F; Green:$BC; BLue:$8F; Alpha:$FF);
  DARKSLATEBLUE       : TColor = (Red:$48; Green:$3D; BLue:$8B; Alpha:$FF);
  DARKSLATEGRAY       : TColor = (Red:$2F; Green:$4F; BLue:$4F; Alpha:$FF);
  DARKTURQUOISE       : TColor = (Red:$00; Green:$CE; BLue:$D1; Alpha:$FF);
  DARKVIOLET          : TColor = (Red:$94; Green:$00; BLue:$D3; Alpha:$FF);
  DEEPPINK            : TColor = (Red:$FF; Green:$14; BLue:$93; Alpha:$FF);
  DEEPSKYBLUE         : TColor = (Red:$00; Green:$BF; BLue:$FF; Alpha:$FF);
  DIMGRAY             : TColor = (Red:$69; Green:$69; BLue:$69; Alpha:$FF);
  DODGERBLUE          : TColor = (Red:$1E; Green:$90; BLue:$FF; Alpha:$FF);
  FIREBRICK           : TColor = (Red:$B2; Green:$22; BLue:$22; Alpha:$FF);
  FLORALWHITE         : TColor = (Red:$FF; Green:$FA; BLue:$F0; Alpha:$FF);
  FORESTGREEN         : TColor = (Red:$22; Green:$8B; BLue:$22; Alpha:$FF);
  FUCHSIA             : TColor = (Red:$FF; Green:$00; BLue:$FF; Alpha:$FF);
  GAINSBORO           : TColor = (Red:$DC; Green:$DC; BLue:$DC; Alpha:$FF);
  GHOSTWHITE          : TColor = (Red:$F8; Green:$F8; BLue:$FF; Alpha:$FF);
  GOLD                : TColor = (Red:$FF; Green:$D7; BLue:$00; Alpha:$FF);
  GOLDENROD           : TColor = (Red:$DA; Green:$A5; BLue:$20; Alpha:$FF);
  GRAY                : TColor = (Red:$80; Green:$80; BLue:$80; Alpha:$FF);
  GREEN               : TColor = (Red:$00; Green:$80; BLue:$00; Alpha:$FF);
  GREENYELLOW         : TColor = (Red:$AD; Green:$FF; BLue:$2F; Alpha:$FF);
  GREY                : TColor = (Red:$80; Green:$80; BLue:$80; Alpha:$FF);
  HONEYDEW            : TColor = (Red:$F0; Green:$FF; BLue:$F0; Alpha:$FF);
  HOTPINK             : TColor = (Red:$FF; Green:$69; BLue:$B4; Alpha:$FF);
  INDIANRED           : TColor = (Red:$CD; Green:$5C; BLue:$5C; Alpha:$FF);
  INDIGO              : TColor = (Red:$4B; Green:$00; BLue:$82; Alpha:$FF);
  IVORY               : TColor = (Red:$FF; Green:$FF; BLue:$F0; Alpha:$FF);
  KHAKI               : TColor = (Red:$F0; Green:$E6; BLue:$8C; Alpha:$FF);
  LAVENDER            : TColor = (Red:$E6; Green:$E6; BLue:$FA; Alpha:$FF);
  LAVENDERBLUSH       : TColor = (Red:$FF; Green:$F0; BLue:$F5; Alpha:$FF);
  LAWNGREEN           : TColor = (Red:$7C; Green:$FC; BLue:$00; Alpha:$FF);
  LEMONCHIFFON        : TColor = (Red:$FF; Green:$FA; BLue:$CD; Alpha:$FF);
  LIGHTBLUE           : TColor = (Red:$AD; Green:$D8; BLue:$E6; Alpha:$FF);
  LIGHTCORAL          : TColor = (Red:$F0; Green:$80; BLue:$80; Alpha:$FF);
  LIGHTCYAN           : TColor = (Red:$E0; Green:$FF; BLue:$FF; Alpha:$FF);
  LIGHTGOLDENRODYELLOW: TColor = (Red:$FA; Green:$FA; BLue:$D2; Alpha:$FF);
  LIGHTGRAY           : TColor = (Red:$D3; Green:$D3; BLue:$D3; Alpha:$FF);
  LIGHTGREEN          : TColor = (Red:$90; Green:$EE; BLue:$90; Alpha:$FF);
  LIGHTGREY           : TColor = (Red:$D3; Green:$D3; BLue:$D3; Alpha:$FF);
  LIGHTPINK           : TColor = (Red:$FF; Green:$B6; BLue:$C1; Alpha:$FF);
  LIGHTSALMON         : TColor = (Red:$FF; Green:$A0; BLue:$7A; Alpha:$FF);
  LIGHTSEAGREEN       : TColor = (Red:$20; Green:$B2; BLue:$AA; Alpha:$FF);
  LIGHTSKYBLUE        : TColor = (Red:$87; Green:$CE; BLue:$FA; Alpha:$FF);
  LIGHTSLATEGRAY      : TColor = (Red:$77; Green:$88; BLue:$99; Alpha:$FF);
  LIGHTSLATEGREY      : TColor = (Red:$77; Green:$88; BLue:$99; Alpha:$FF);
  LIGHTSTEELBLUE      : TColor = (Red:$B0; Green:$C4; BLue:$DE; Alpha:$FF);
  LIGHTYELLOW         : TColor = (Red:$FF; Green:$FF; BLue:$E0; Alpha:$FF);
  LIME                : TColor = (Red:$00; Green:$FF; BLue:$00; Alpha:$FF);
  LIMEGREEN           : TColor = (Red:$32; Green:$CD; BLue:$32; Alpha:$FF);
  LINEN               : TColor = (Red:$FA; Green:$F0; BLue:$E6; Alpha:$FF);
  MAGENTA             : TColor = (Red:$FF; Green:$00; BLue:$FF; Alpha:$FF);
  MAROON              : TColor = (Red:$80; Green:$00; BLue:$00; Alpha:$FF);
  MEDIUMAQUAMARINE    : TColor = (Red:$66; Green:$CD; BLue:$AA; Alpha:$FF);
  MEDIUMBLUE          : TColor = (Red:$00; Green:$00; BLue:$CD; Alpha:$FF);
  MEDIUMORCHID        : TColor = (Red:$BA; Green:$55; BLue:$D3; Alpha:$FF);
  MEDIUMPURPLE        : TColor = (Red:$93; Green:$70; BLue:$DB; Alpha:$FF);
  MEDIUMSEAGREEN      : TColor = (Red:$3C; Green:$B3; BLue:$71; Alpha:$FF);
  MEDIUMSLATEBLUE     : TColor = (Red:$7B; Green:$68; BLue:$EE; Alpha:$FF);
  MEDIUMSPRINGGREEN   : TColor = (Red:$00; Green:$FA; BLue:$9A; Alpha:$FF);
  MEDIUMTURQUOISE     : TColor = (Red:$48; Green:$D1; BLue:$CC; Alpha:$FF);
  MEDIUMVIOLETRED     : TColor = (Red:$C7; Green:$15; BLue:$85; Alpha:$FF);
  MIDNIGHTBLUE        : TColor = (Red:$19; Green:$19; BLue:$70; Alpha:$FF);
  MINTCREAM           : TColor = (Red:$F5; Green:$FF; BLue:$FA; Alpha:$FF);
  MISTYROSE           : TColor = (Red:$FF; Green:$E4; BLue:$E1; Alpha:$FF);
  MOCCASIN            : TColor = (Red:$FF; Green:$E4; BLue:$B5; Alpha:$FF);
  NAVAJOWHITE         : TColor = (Red:$FF; Green:$DE; BLue:$AD; Alpha:$FF);
  NAVY                : TColor = (Red:$00; Green:$00; BLue:$80; Alpha:$FF);
  OLDLACE             : TColor = (Red:$FD; Green:$F5; BLue:$E6; Alpha:$FF);
  OLIVE               : TColor = (Red:$80; Green:$80; BLue:$00; Alpha:$FF);
  OLIVEDRAB           : TColor = (Red:$6B; Green:$8E; BLue:$23; Alpha:$FF);
  ORANGE              : TColor = (Red:$FF; Green:$A5; BLue:$00; Alpha:$FF);
  ORANGERED           : TColor = (Red:$FF; Green:$45; BLue:$00; Alpha:$FF);
  ORCHID              : TColor = (Red:$DA; Green:$70; BLue:$D6; Alpha:$FF);
  PALEGOLDENROD       : TColor = (Red:$EE; Green:$E8; BLue:$AA; Alpha:$FF);
  PALEGREEN           : TColor = (Red:$98; Green:$FB; BLue:$98; Alpha:$FF);
  PALETURQUOISE       : TColor = (Red:$AF; Green:$EE; BLue:$EE; Alpha:$FF);
  PALEVIOLETRED       : TColor = (Red:$DB; Green:$70; BLue:$93; Alpha:$FF);
  PAPAYAWHIP          : TColor = (Red:$FF; Green:$EF; BLue:$D5; Alpha:$FF);
  PEACHPUFF           : TColor = (Red:$FF; Green:$DA; BLue:$B9; Alpha:$FF);
  PERU                : TColor = (Red:$CD; Green:$85; BLue:$3F; Alpha:$FF);
  PINK                : TColor = (Red:$FF; Green:$C0; BLue:$CB; Alpha:$FF);
  PLUM                : TColor = (Red:$DD; Green:$A0; BLue:$DD; Alpha:$FF);
  POWDERBLUE          : TColor = (Red:$B0; Green:$E0; BLue:$E6; Alpha:$FF);
  PURPLE              : TColor = (Red:$80; Green:$00; BLue:$80; Alpha:$FF);
  REBECCAPURPLE       : TColor = (Red:$66; Green:$33; BLue:$99; Alpha:$FF);
  RED                 : TColor = (Red:$FF; Green:$00; BLue:$00; Alpha:$FF);
  ROSYBROWN           : TColor = (Red:$BC; Green:$8F; BLue:$8F; Alpha:$FF);
  ROYALBLUE           : TColor = (Red:$41; Green:$69; BLue:$E1; Alpha:$FF);
  SADDLEBROWN         : TColor = (Red:$8B; Green:$45; BLue:$13; Alpha:$FF);
  SALMON              : TColor = (Red:$FA; Green:$80; BLue:$72; Alpha:$FF);
  SANDYBROWN          : TColor = (Red:$F4; Green:$A4; BLue:$60; Alpha:$FF);
  SEAGREEN            : TColor = (Red:$2E; Green:$8B; BLue:$57; Alpha:$FF);
  SEASHELL            : TColor = (Red:$FF; Green:$F5; BLue:$EE; Alpha:$FF);
  SIENNA              : TColor = (Red:$A0; Green:$52; BLue:$2D; Alpha:$FF);
  SILVER              : TColor = (Red:$C0; Green:$C0; BLue:$C0; Alpha:$FF);
  SKYBLUE             : TColor = (Red:$87; Green:$CE; BLue:$EB; Alpha:$FF);
  SLATEBLUE           : TColor = (Red:$6A; Green:$5A; BLue:$CD; Alpha:$FF);
  SLATEGRAY           : TColor = (Red:$70; Green:$80; BLue:$90; Alpha:$FF);
  SLATEGREY           : TColor = (Red:$70; Green:$80; BLue:$90; Alpha:$FF);
  SNOW                : TColor = (Red:$FF; Green:$FA; BLue:$FA; Alpha:$FF);
  SPRINGGREEN         : TColor = (Red:$00; Green:$FF; BLue:$7F; Alpha:$FF);
  STEELBLUE           : TColor = (Red:$46; Green:$82; BLue:$B4; Alpha:$FF);
  TAN                 : TColor = (Red:$D2; Green:$B4; BLue:$8C; Alpha:$FF);
  TEAL                : TColor = (Red:$00; Green:$80; BLue:$80; Alpha:$FF);
  THISTLE             : TColor = (Red:$D8; Green:$BF; BLue:$D8; Alpha:$FF);
  TOMATO              : TColor = (Red:$FF; Green:$63; BLue:$47; Alpha:$FF);
  TURQUOISE           : TColor = (Red:$40; Green:$E0; BLue:$D0; Alpha:$FF);
  VIOLET              : TColor = (Red:$EE; Green:$82; BLue:$EE; Alpha:$FF);
  WHEAT               : TColor = (Red:$F5; Green:$DE; BLue:$B3; Alpha:$FF);
  WHITE               : TColor = (Red:$FF; Green:$FF; BLue:$FF; Alpha:$FF);
  WHITESMOKE          : TColor = (Red:$F5; Green:$F5; BLue:$F5; Alpha:$FF);
  YELLOW              : TColor = (Red:$FF; Green:$FF; BLue:$00; Alpha:$FF);
  YELLOWGREEN         : TColor = (Red:$9A; Green:$CD; BLue:$32; Alpha:$FF);
  BLANK               : TColor = (Red:$00; Green:$00; BLue:$00; Alpha:$00);
  WHITE2              : TColor = (Red:$F5; Green:$F5; BLue:$F5; Alpha:$FF);
  RED2                : TColor = (Red:$7E; Green:$32; BLue:$3F; Alpha:255);
  COLORKEY            : TColor = (Red:$FF; Green:$00; BLue:$FF; Alpha:$FF);
  OVERLAY1            : TColor = (Red:$00; Green:$20; BLue:$29; Alpha:$B4);
  OVERLAY2            : TColor = (Red:$01; Green:$1B; BLue:$01; Alpha:255);
  DIMWHITE            : TColor = (Red:$10; Green:$10; BLue:$10; Alpha:$10);
  DARKSLATEBROWN      : TColor = (Red:30;  Green:31;  BLue:30;  Alpha:1);
{$ENDREGION}

function  AngleCos(const aAngle: Cardinal): Single;
function  AngleSin(const aAngle: Cardinal): Single;
function  RandomRange(const aMin, aMax: Integer): Integer;
function  RandomRangef(const aMin, aMax: Single): Single;
function  RandomBool: Boolean;
function  GetRandomSeed: Integer;
procedure SetRandomSeed(const aVaLue: Integer);
function  ClipVaLuef(var aVaLue: Single; const aMin, aMax: Single; const aWrap: Boolean): Single;
function  ClipVaLue(var aVaLue: Integer; const aMin, aMax: Integer; const aWrap: Boolean): Integer;
function  SameSign(const aVaLue1, aVaLue2: Integer): Boolean;
function  SameSignf(const aVaLue1, aVaLue2: Single): Boolean;
function  SameVaLue(const aA, aB: Double; const aEpsilon: Double = 0): Boolean;
function  SameVaLuef(const aA, aB: Single; const aEpsilon: Single = 0): Boolean;
function  AngleDiff(const aSrcAngle, aDestAngle: Single): Single;
procedure AngleRotatePos(const aAngle: Single; var aX, aY: Single);
procedure SmoothMove(var aVaLue: Single; const aAmount, aMax, aDrag: Single);
function  Lerp(const aFrom, aTo, aTime: Double): Double;
function  PointInRectangle(aPoint: TVector; aRect: TRect): Boolean;
function  PointInCircle(aPoint, aCenter: TVector; aRadius: Single): Boolean;
function  PointInTriangle(aPoint, aP1, aP2, aP3: TVector): Boolean;
function  CirclesOverlap(aCenter1: TVector; aRadius1: Single; aCenter2: TVector; aRadius2: Single): Boolean;
function  CircleInRectangle(aCenter: TVector; aRadius: Single; aRect: TRect): Boolean;
function  RectanglesOverlap(aRect1: TRect; aRect2: TRect): Boolean;
function  RectangleIntersection(aRect1, aRect2: TRect): TRect;
function  LineIntersection(aX1, aY1, aX2, aY2, aX3, aY3, aX4, aY4: Integer; var aX: Integer; var aY: Integer): TLineIntersection;
function  RadiusOverlap(aRadius1, aX1, aY1, aRadius2, aX2, aY2, aShrinkFactor: Single): Boolean;
function  EaseValue(aCurrentTime: Double; aStartValue: Double; aChangeInValue: Double; aDuration: Double; aEaseType: TEaseType): Double;
function  EasePosition(aStartPos: Double; aEndPos: Double; aCurrentPos: Double; aEaseType: TEaseType): Double;

type
  TPrefs = record
  private class var
    FOrgName: string;
    FAppName: string;
  public
    class operator Initialize (out aDest: TPrefs);
    class operator Finalize (var aDest: TPrefs);
    class function  GetOrgName: string; static;
    class procedure SetOrgName(const aOrgName: string); static;
    class function  GetAppName: string; static;
    class procedure SetAppName(const aAppName: string); static;
    class function  GetPath: string; static;
    class procedure GotoPath; static;
  end;

type
  TLog = record
  private class var
    FFormatSettings : TFormatSettings;
    FFilename: string;
    FText: Text;
    FBuffer: array[Word] of Byte;
    FOpen: Boolean;
    FConsoleOutput: Boolean;
  public
    class operator Initialize (out aDest: TLog);
    class operator Finalize (var aDest: TLog);
    class function  Open: Boolean; static;
    class procedure Close; static;
    class function  Opened: Boolean; static;
    class procedure Reset; static;
    class function  GetFilename: string; static;
    class function  Add(const aMsg: string; const aArgs: array of const): string; static;
    class procedure Fatal(const aMsg: string; const aArgs: array of const); static;
    class procedure SetConsoleOutput(const aConsoleOutput: Boolean); static;
    class function  GetConsoleOutput: Boolean; static;
    class procedure View; static;
  end;

type
  TCmdLine = record
  private class var
    FCmdLine: string;
    FParamStr: TStringDynArray;
  private
    class procedure Build; static;
  public
    class operator Initialize (out aDest: TCmdLine);
    class operator Finalize (var aDest: TCmdLine);
    class procedure Reset; static;
    class procedure Clear; static;
    class procedure AddParam(const aParam: string); static;
    class procedure AddParams(const aParams: array of string); static;
    class function Str: string; static;
    class function Count: Integer; overload; static;
    class function Count(const aName: string): Integer; overload; static;
    class function Param(const aIndex: Integer): string; overload; static;
    class function Param(const aName: string; const aIndex: Integer): string; overload; static;
    class function ParamIndex(const aName: string): Integer; static;
    class function ParamExist(const aName: string): Boolean; static;
    class function ParamValue(const aName: string; var aValue: string): Boolean; static;
  end;

type
  EBufferException = class(Exception);

  TBuffer = class(TCustomMemoryStream)
  protected
    FHandle: THandle;
    FName: string;
    procedure Clear;
  public
    constructor Create(aSize: Cardinal);
    destructor Destroy; override;
    function Write(const aBuffer; aCount: Longint): Longint; override;
    function Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint; override;
    procedure SaveToFile(aFilename: string);
    property Name: string read FName;
    class function LoadFromFile(const aFilename: string): TBuffer;
  end;

type
  TConfigFile = class(TBaseObject)
  private
    FHandle: TIniFile;
    FFilename: string;
    FSection: TStringList;
  public
    constructor Create; override;
    destructor Destroy; override;
    function  Open(const aFilename: string=''): Boolean;
    procedure Close;
    function  Opened: Boolean;
    procedure Update;
    function  RemoveSection(const aName: string): Boolean;
    procedure SetValue(const aSection, aKey, aValue: string);  overload;
    procedure SetValue(const aSection, aKey: string; aValue: Integer); overload;
    procedure SetValue(const aSection, aKey: string; aValue: Boolean); overload;
    procedure SetValue(const aSection, aKey: string; aValue: Pointer; aValueSize: Cardinal); overload;
    function  GetValue(const aSection, aKey, aDefaultValue: string): string; overload;
    function  GetValue(const aSection, aKey: string; aDefaultValue: Integer): Integer; overload;
    function  GetValue(const aSection, aKey: string; aDefaultValue: Boolean): Boolean; overload;
    procedure GetValue(const aSection, aKey: string; aValue: Pointer; aValueSize: Cardinal); overload;
    function  RemoveKey(const aSection, aKey: string): Boolean;
    function  GetSectionValues(const aSection: string): Integer;
    function  GetSectionValue(const aIndex: Integer; const aDefaultValue: string): string; overload;
    function  GetSectionValue(const aIndex, aDefaultValue: Integer): Integer; overload;
    function  GetSectionValue(const aIndex: Integer; const aDefaultValue: Boolean): Boolean; overload;
  end;

  TArchiveFile = class(TBaseObject)
  private
    FZipFile: TEncryptedZipFile;
    FZipStream: TStream;
    FZipHeader: TZipHeader;
    FResStream: TResourceStream;
  public
    constructor Create; override;
    destructor Destroy; override;
    function  Open(const aPassword, aArchive, aFilename: string): Boolean; overload;
    function  OpenRes(const aPassword, aResName, aFilename: string): Boolean; overload;
    function  IsOpen: Boolean;
    procedure Close;
    function  Size: Int64;
    function  GetPos: Int64;
    function  SetPos(aPos: Int64): Int64;
    function  ReadData(aBuffer: Pointer; aCount: NativeInt): NativeInt;
    function  SaveToFile(const aFilename: string): Boolean;
    function  SaveToBuffer: TBuffer;
    class function GetRWops(const aPassword, aArchive, aFilename: string): PSDL_RWops;
    class function GetRWopsRes(const aPassword, aResName, aFilename: string): PSDL_RWops;
  end;

  TArchive = class(TBaseObject)
  private
    FPassword: string;
    FArchive: string;
    FZipFile: TEncryptedZipFile;
    FNewFile: Boolean;
    FNewFileSize: Int64;
    FResStream: TResourceStream;
    FResName: string;
    procedure OnZipProgress(Sender: TObject; FileName: string; Header: TZipHeader; Position: Int64);
  public
    constructor Create; override;
    destructor Destroy; override;
    function Open(const aPassword, aArchive: string): Boolean; overload;
    function OpenRes(const aPassword, aResName: string): Boolean; overload;
    function IsOpen: Boolean;
    procedure Close;
    function FileExist(const aFilename: string): Boolean;
    function OpenFile(const aFilename: string): TArchiveFile;
    function OpenFileRWops(const aFilename: string): PSDL_RWops;
    function OpenFileBuffer(const aFilename: string): TBuffer;
    function Build(const aPassword, aArchive, aFolder: string): Boolean;
  end;

var
  Marshaller: TMarshaller;

procedure FreeNilObject(const [ref] aObject: TObject);
procedure ShellOpen(const aFilename: string);
function  GetVersionInfo(const aInstance: THandle; const aIdent: string): string; overload;
function  GetVersionInfo(const aFilename: string; const aIdent: string): string; overload;
function  GetSemVerStr(const aInstance: THandle): string;
function  UnitToScalarValue(const aValue, aMaxValue: Double): Double;
function  GetFileRWops(const aFilename: string): PSDL_RWops;
function  GetMemRWops(const aMem: Pointer; const aSize: Integer): PSDL_RWops;
function  ResourceExists(aInstance: THandle; const aResName: string): Boolean;
function  IsSingleInstance(aMutexName: string; aKeepMutex: Boolean=True): Boolean;
function  GetExePath: string;
function  GetExeBasePath(const aFilename: string): string;
function  HasConsoleOutput: Boolean;
function  WasRunFromConsole: Boolean;
procedure WaitForAnyKey;
procedure Pause(const aMsg: string='');
procedure Print(const aMsg: string); overload;
procedure Print(const aMsg: string; const aArgs: array of const); overload;
procedure PrintLn; overload;
procedure PrintLn(const aMsg: string); overload;
procedure PrintLn(const aMsg: string; const aArgs: array of const); overload;
function  CreateDirsInPath(const aFilename: string): Boolean;
function  ExtractRelativeFilename(aBaseFilename: string; aDestFilename: string): string;
function  ExtractRelativeDirectory(const aBaseDir, aDestDir: string): string;
function  ExpandRelFilename(const aBaseFilename, aRelFilename: string): string;
function  ExpandRelDirectory(const aBaseDir, aRelDir: string): string;
function  RemoveQuotes(const aText: string): string;
function  GetDirName(const aPath: string): string;
function  IsCurrentDir(const aDirName: string): Boolean;
function  GetUUID(const aLowercase: Boolean=True; const aUseSeperator: Boolean=False): string;
procedure WriteStringToStream(const aStream: TStream; const aStr: string);
function  ReadStringFromStream(const aStream: TStream): string;
function  GetEnvVarValue(const aVarName: string): string;
function  SetEnvVarValue(const aVarName, aVarValue: string): Integer;
function  SetGlobalEnvironment(const aName: string; const aValue: string; const aUser: Boolean = True): Boolean;
function  AddSelfToUserPath(var aUserPath: string): Boolean;
function  RemoveSelfFromUserPath(var aUserPath: string): Boolean;
function  RemoveDuplicates(const aText: string): string;
function  RemoveDuplicates2(const aText: string): string;
procedure ProcessMessages;
function  CaptureConsoleOutput(const aTitle: string; const aCommand, aParameters: PChar; const aSender: Pointer; const aEvent: TCaptureConsoleOutputEvent): Cardinal;
function  IsValidFilename(const aFilename: string): Boolean;

{$ENDREGION}

{$REGION ' DelphiGamekit.Window '}
const
  WINDOW_WIDTH = 1920 div 2;
  WINDOW_HEIGHT = 1080 div 2;

type
  TWindow = record
  private class var
    FWindow: PSDL_Window;
    FRenderer: PSDL_Renderer;
    FRendererInfo: SDL_RendererInfo;
    FWindowSize: SDL_Point;
    FRendererSize: SDL_Point;
    FRendererScale: SDL_FPoint;
    FDDPI, FHDPI, FVDPI: Single;
    FRenderTarget: PSDL_Texture;
  public
    class operator  Initialize (out aDest: TWindow);
    class operator  Finalize (var aDest: TWindow);
    class function  Open(const aTitle: string; const aX, aY: Integer; const aWidth: Integer=WINDOW_WIDTH; const aHeight: Integer=WINDOW_HEIGHT): Boolean; static;
    class procedure Close; static;
    class function  IsOpen: Boolean; static;
    class procedure Clear(const aColor: TColor); static;
    class procedure ShowRenderTarget; static;
    class procedure Show; static;
    class procedure SetTitle(const aTitle: string); static;
    class function  GetTitle: string; static;
    class function  GetViewport: TRect; static;
    class function  GetWindowHandle: PSDL_Window; static;
    class function  GetRendererHandle: PSDL_Renderer; static;
    class function  GetWindowSize: TPoint; static;
    class function  GetRendererSize: TPoint; static;
    class function  GetRendererScale: TPoint; static;
    class function  GetDDPI: Single; static;
    class function  GetHDPI: Single; static;
    class function  GetVDPI: Single; static;
    class function  GetRendererInfo: SDL_RendererInfo; static;
    class procedure DrawPoint(const aX, aY: Single; const aColor: TColor); static;
    class procedure DrawLine(const aX1, aY1, aX2, aY2: Single; const aColor: TColor); static;
    class procedure DrawRect(const aX, aY, aWidth, aHeight: Single; const aColor: TColor); static;
    class procedure DrawFilledRect(const aX, aY, aWidth, aHeight: Single; const aColor: TColor); static;
    class function  Save(const aFilename: string): Boolean; static;
  end;

const
  BUTTON_LEFT   = 1;
  BUTTON_MIDDLE = 2;
  BUTTON_RIGHT  = 3;
  BUTTON_X1     = 4;
  BUTTON_X2     = 5;

  CONTROLLER_AXIS_LEFTX        = 0;
  CONTROLLER_AXIS_LEFTY        = 1;
  CONTROLLER_AXIS_RIGHTX       = 2;
  CONTROLLER_AXIS_RIGHTY       = 3;
  CONTROLLER_AXIS_TRIGGERLEFT  = 4;
  CONTROLLER_AXIS_TRIGGERRIGHT = 5;

  CONTROLLER_BUTTON_A             = 0;
  CONTROLLER_BUTTON_B             = 1;
  CONTROLLER_BUTTON_X             = 2;
  CONTROLLER_BUTTON_Y             = 3;
  CONTROLLER_BUTTON_BACK          = 4;
  CONTROLLER_BUTTON_GUIDE         = 5;
  CONTROLLER_BUTTON_START         = 6;
  CONTROLLER_BUTTON_LEFTSTICK     = 7;
  CONTROLLER_BUTTON_RIGHTSTICK    = 8;
  CONTROLLER_BUTTON_LEFTSHOULDER  = 9;
  CONTROLLER_BUTTON_RIGHTSHOULDER = 10;
  CONTROLLER_BUTTON_DPAD_UP       = 11;
  CONTROLLER_BUTTON_DPAD_DOWN     = 12;
  CONTROLLER_BUTTON_DPAD_LEFT     = 13;
  CONTROLLER_BUTTON_DPAD_RIGHT    = 14;
  CONTROLLER_BUTTON_MISC1         = 15;
  CONTROLLER_BUTTON_PADDLE1       = 16;
  CONTROLLER_BUTTON_PADDLE2       = 17;
  CONTROLLER_BUTTON_PADDLE3       = 18;
  CONTROLLER_BUTTON_PADDLE4       = 19;
  CONTROLLER_BUTTON_TOUCHPAD      = 20;

  {$REGION ' Scancodes '}
  KEY_A = 4;
  KEY_B = 5;
  KEY_C = 6;
  KEY_D = 7;
  KEY_E = 8;
  KEY_F = 9;
  KEY_G = 10;
  KEY_H = 11;
  KEY_I = 12;
  KEY_J = 13;
  KEY_K = 14;
  KEY_L = 15;
  KEY_M = 16;
  KEY_N = 17;
  KEY_O = 18;
  KEY_P = 19;
  KEY_Q = 20;
  KEY_R = 21;
  KEY_S = 22;
  KEY_T = 23;
  KEY_U = 24;
  KEY_V = 25;
  KEY_W = 26;
  KEY_X = 27;
  KEY_Y = 28;
  KEY_Z = 29;
  KEY_1 = 30;
  KEY_2 = 31;
  KEY_3 = 32;
  KEY_4 = 33;
  KEY_5 = 34;
  KEY_6 = 35;
  KEY_7 = 36;
  KEY_8 = 37;
  KEY_9 = 38;
  KEY_0 = 39;
  KEY_RETURN = 40;
  KEY_ESCAPE = 41;
  KEY_BACKSPACE = 42;
  KEY_TAB = 43;
  KEY_SPACE = 44;
  KEY_MINUS = 45;
  KEY_EQUALS = 46;
  KEY_LEFTBRACKET = 47;
  KEY_RIGHTBRACKET = 48;
  KEY_BACKSLASH = 49;
  KEY_NONUSHASH = 50;
  KEY_SEMICOLON = 51;
  KEY_APOSTROPHE = 52;
  KEY_GRAVE = 53;
  KEY_COMMA = 54;
  KEY_PERIOD = 55;
  KEY_SLASH = 56;
  KEY_CAPSLOCK = 57;
  KEY_F1 = 58;
  KEY_F2 = 59;
  KEY_F3 = 60;
  KEY_F4 = 61;
  KEY_F5 = 62;
  KEY_F6 = 63;
  KEY_F7 = 64;
  KEY_F8 = 65;
  KEY_F9 = 66;
  KEY_F10 = 67;
  KEY_F11 = 68;
  KEY_F12 = 69;
  KEY_PRINTSCREEN = 70;
  KEY_SCROLLLOCK = 71;
  KEY_PAUSE = 72;
  KEY_INSERT = 73;
  KEY_HOME = 74;
  KEY_PAGEUP = 75;
  KEY_DELETE = 76;
  KEY_END = 77;
  KEY_PAGEDOWN = 78;
  KEY_RIGHT = 79;
  KEY_LEFT = 80;
  KEY_DOWN = 81;
  KEY_UP = 82;
  KEY_NUMLOCKCLEAR = 83;
  KEY_KP_DIVIDE = 84;
  KEY_KP_MULTIPLY = 85;
  KEY_KP_MINUS = 86;
  KEY_KP_PLUS = 87;
  KEY_KP_ENTER = 88;
  KEY_KP_1 = 89;
  KEY_KP_2 = 90;
  KEY_KP_3 = 91;
  KEY_KP_4 = 92;
  KEY_KP_5 = 93;
  KEY_KP_6 = 94;
  KEY_KP_7 = 95;
  KEY_KP_8 = 96;
  KEY_KP_9 = 97;
  KEY_KP_0 = 98;
  KEY_KP_PERIOD = 99;
  KEY_NONUSBACKSLASH = 100;
  KEY_APPLICATION = 101;
  KEY_POWER = 102;
  KEY_KP_EQUALS = 103;
  KEY_F13 = 104;
  KEY_F14 = 105;
  KEY_F15 = 106;
  KEY_F16 = 107;
  KEY_F17 = 108;
  KEY_F18 = 109;
  KEY_F19 = 110;
  KEY_F20 = 111;
  KEY_F21 = 112;
  KEY_F22 = 113;
  KEY_F23 = 114;
  KEY_F24 = 115;
  KEY_EXECUTE = 116;
  KEY_HELP = 117;
  KEY_MENU = 118;
  KEY_SELECT = 119;
  KEY_STOP = 120;
  KEY_AGAIN = 121;
  KEY_UNDO = 122;
  KEY_CUT = 123;
  KEY_COPY = 124;
  KEY_PASTE = 125;
  KEY_FIND = 126;
  KEY_MUTE = 127;
  KEY_VOLUMEUP = 128;
  KEY_VOLUMEDOWN = 129;
  KEY_KP_COMMA = 133;
  KEY_KP_EQUALSAS400 = 134;
  KEY_INTERNATIONAL1 = 135;
  KEY_INTERNATIONAL2 = 136;
  KEY_INTERNATIONAL3 = 137;
  KEY_INTERNATIONAL4 = 138;
  KEY_INTERNATIONAL5 = 139;
  KEY_INTERNATIONAL6 = 140;
  KEY_INTERNATIONAL7 = 141;
  KEY_INTERNATIONAL8 = 142;
  KEY_INTERNATIONAL9 = 143;
  KEY_LANG1 = 144;
  KEY_LANG2 = 145;
  KEY_LANG3 = 146;
  KEY_LANG4 = 147;
  KEY_LANG5 = 148;
  KEY_LANG6 = 149;
  KEY_LANG7 = 150;
  KEY_LANG8 = 151;
  KEY_LANG9 = 152;
  KEY_ALTERASE = 153;
  KEY_SYSREQ = 154;
  KEY_CANCEL = 155;
  KEY_CLEAR = 156;
  KEY_PRIOR = 157;
  KEY_RETURN2 = 158;
  KEY_SEPARATOR = 159;
  KEY_OUT = 160;
  KEY_OPER = 161;
  KEY_CLEARAGAIN = 162;
  KEY_CRSEL = 163;
  LuSCANCODE_EXSEL = 164;
  KEY_KP_00 = 176;
  KEY_KP_000 = 177;
  KEY_THOUSANDSSEPARATOR = 178;
  KEY_DECIMALSEPARATOR = 179;
  KEY_CURRENCYUNIT = 180;
  KEY_CURRENCYSUBUNIT = 181;
  KEY_KP_LEFTPAREN = 182;
  KEY_KP_RIGHTPAREN = 183;
  KEY_KP_LEFTBRACE = 184;
  KEY_KP_RIGHTBRACE = 185;
  KEY_KP_TAB = 186;
  KEY_KP_BACKSPACE = 187;
  KEY_KP_A = 188;
  KEY_KP_B = 189;
  KEY_KP_C = 190;
  KEY_KP_D = 191;
  KEY_KP_E = 192;
  KEY_KP_F = 193;
  KEY_KP_XOR = 194;
  KEY_KP_POWER = 195;
  KEY_KP_PERCENT = 196;
  KEY_KP_LESS = 197;
  KEY_KP_GREATER = 198;
  KEY_KP_AMPERSAND = 199;
  KEY_KP_DBLAMPERSAND = 200;
  KEY_KP_VERTICALBAR = 201;
  KEY_KP_DBLVERTICALBAR = 202;
  KEY_KP_COLON = 203;
  KEY_KP_HASH = 204;
  KEY_KP_SPACE = 205;
  KEY_KP_AT = 206;
  KEY_KP_EXCLAM = 207;
  KEY_KP_MEMSTORE = 208;
  KEY_KP_MEMRECALL = 209;
  KEY_KP_MEMCLEAR = 210;
  KEY_KP_MEMADD = 211;
  KEY_KP_MEMSUBTRACT = 212;
  KEY_KP_MEMMULTIPLY = 213;
  KEY_KP_MEMDIVIDE = 214;
  KEY_KP_PLUSMINUS = 215;
  KEY_KP_CLEAR = 216;
  KEY_KP_CLEARENTRY = 217;
  KEY_KP_BINARY = 218;
  KEY_KP_OCTAL = 219;
  KEY_KP_DECIMAL = 220;
  KEY_KP_HEXADECIMAL = 221;
  KEY_LCTRL = 224;
  KEY_LSHIFT = 225;
  KEY_LALT = 226;
  KEY_LGUI = 227;
  KEY_RCTRL = 228;
  KEY_RSHIFT = 229;
  KEY_RALT = 230;
  KEY_RGUI = 231;
  KEY_MODE = 257;
  KEY_AUDIONEXT = 258;
  KEY_AUDIOPREV = 259;
  KEY_AUDIOSTOP = 260;
  KEY_AUDIOPLAY = 261;
  KEY_AUDIOMUTE = 262;
  KEY_MEDIASELECT = 263;
  KEY_WWW = 264;
  KEY_MAIL = 265;
  KEY_CALCULATOR = 266;
  KEY_COMPUTER = 267;
  KEY_AC_SEARCH = 268;
  KEY_AC_HOME = 269;
  KEY_AC_BACK = 270;
  KEY_AC_FORWARD = 271;
  KEY_AC_STOP = 272;
  KEY_AC_REFRESH = 273;
  KEY_AC_BOOKMARKS = 274;
  KEY_BRIGHTNESSDOWN = 275;
  KEY_BRIGHTNESSUP = 276;
  KEY_DISPLAYSWITCH = 277;
  KEY_KBDILLUMTOGGLE = 278;
  KEY_KBDILLUMDOWN = 279;
  KEY_KBDILLUMUP = 280;
  KEY_EJECT = 281;
  KEY_SLEEP = 282;
  KEY_APP1 = 283;
  KEY_APP2 = 284;
  KEY_AUDIOREWIND = 285;
  KEY_AUDIOFASTFORWARD = 286;
  KEY_SOFTLEFT = 287;
  KEY_SOFTRIGHT = 288;
  KEY_CALL = 289;
  KEY_ENDCALL = 290;
  {$ENDREGION}

type
  TController = record
  private class var
    FHandle: PSDL_GameController;
    FAxes: array[0..Ord(SDL_CONTROLLER_AXIS_MAX)-1] of Single;
    FButtons: array[0..1, 0..Ord(SDL_CONTROLLER_BUTTON_MAX)-1] of Boolean;
  public
    class function  Startup: Boolean; static;
    class procedure Shutdown; static;
    class function  Open(const aIndex: Cardinal): Boolean; static;
    class procedure Close; static;
    class procedure Clear; static;
    class procedure Update(const aEvent: PSDL_Event); static;
    class function  ButtonDown(const aButton: Cardinal): Boolean; static;
    class function  ButtonPressed(const aButton: Cardinal): Boolean; static;
    class function  ButtonReleased(const aButton: Cardinal): Boolean; static;
    class function  GetAxis(const aAxis: Cardinal): Single; static;
  end;

  TInput = record
  private type
    TMouse = record
      Postion: TPoint;
      Delta: TVector;
    end;
  private class var
    FKeyCode: Integer;
    FKeyCodeRepeat: Boolean;
    FMouseButtons: array [0..1, BUTTON_LEFT .. BUTTON_X2] of Boolean;
    FKeyButtons: array [0..1, KEY_A .. KEY_ENDCALL] of Boolean;
    FMouse: TMouse;
    FController: TController;
    FIsOpen: Boolean;
  public
    class operator Initialize (out aDest: TInput);
    class operator Finalize (var aDest: TInput);
    class procedure Open; static;
    class procedure Close; static;
    class procedure Clear; static;
    class procedure Update(const aEvent: PSDL_Event); static;
    class function  KeyDown(const aKey: Cardinal): Boolean; static;
    class function  KeyPressed(const aKey: Cardinal): Boolean; static;
    class function  KeyReleased(const aKey: Cardinal): Boolean; static;
    class function  MouseDown(const aButton: Cardinal): Boolean; static;
    class function  MousePressed(const aButton: Cardinal): Boolean; static;
    class function  MouseReleased(const aButton: Cardinal): Boolean; static;
    class procedure SetMousePos(const aX, aY: Integer); static;
    class procedure GetMouseInfo(const aPosition: PPoint; const aDelta: PVector); static;
    class function  ControllerDown(const aButton: Cardinal): Boolean; static;
    class function  ControllerPressed(const aButton: Cardinal): Boolean; static;
    class function  ControllerReleased(const aButton: Cardinal): Boolean; static;
    class function  ControllerPosition(const aAxis: Cardinal): Single; static;
  end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Graphics '}
type
  THAlign = (haLeft, haCenter, haRight);
  TVAlign = (vaTop, vaCenter, vaBottom);

type
  TGeometry = class(TBaseObject)
  private
    FBuffer: TBuffer;
    FIndex: UInt64;
    FCount: UInt64;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Alloc(const aNumTriangles: UInt64);
    procedure Reset;
    procedure AddVertex(const aX, aY: Single; const aColor: SDL_Color; const aTX, aTY: Single);
    procedure Render(const aTexture: PSDL_Texture; const aReset: Boolean=True);
  end;

type
  TFlipMode = (fmNone=0, fmHorizontal=1, fmVertical=2);
  TBlendMode = (bmNone=0, bmBlend=1, bmAdd=2, bmMod=4, bmMul=8, bmInvalid=2147483647);
  TTextureAccess = (taStatic=0, taStreaming=1, taTarget=2);

  TTexture = class(TBaseObject)
  protected
    FHandle: PSDL_Texture;
    FWidth: Integer;
    FHeight: Integer;
    FPixels: Pointer;
    FPitch: Integer;
    FPixelFormat: PSDL_PixelFormat;
    FLockRect: SDL_FRect;
  public
    property Handle: PSDL_Texture read FHandle;
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    constructor Create; override;
    destructor Destroy; override;
    procedure Alloc(const aWidth, aHeight: Cardinal; const aAccess: TTextureAccess);
    function Load(const aArchive: TArchive; const aFilename: string; const aColorKey: PSDL_Color): Boolean;
    procedure Unload;
    procedure Render(const aSrcRect: PSDL_FRect; const aX, aY: Single; aScale, aAngle: Single; const aFlipMode: TFlipMode; const aOrigin: PSDL_FPoint; const aColor: SDL_Color; const aBlendMode: TBlendMode);
    procedure RenderTiled(const aDeltaX, aDeltaY: Single; const aColor: SDL_Color; const aBlendMode: TBlendMode);
    procedure Lock(const aRect: PSDL_FRect);
    procedure Unlock;
    procedure SetPixel(const aX, aY: Integer; const aColor: SDL_Color);
    function  GetPixel(const aX, aY: Integer): SDL_Color;
    procedure GetSize(aWidth: PInteger; aHeight: PInteger);
    procedure SetColor(const aColor: SDL_Color);
    function GetColor: SDL_Color;
    function Save(const aFilename: string): Boolean;
    class function LoadTexture(const aArchive: TArchive; const aFilename: string; const aColorKey: PSDL_Color): TTexture;
  end;


type
  TFont = class(TBaseObject)
  protected const
    cDefaultGlyphs = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~™©';
  protected type
    PGlyph = ^TGlyph;
    TGlyph = record
      SrcRect: SDL_Rect;
      DstRect: SDL_FRect;
      XAdvance: Single;
    end;
  protected
    FAtlasSize: Integer;
    FAtlas: PSDL_Texture;
    FBaseLine: Single;
    FGlyph: TDictionary<Integer, TGlyph>;
    FGeometry: TGeometry;
    FVertexBufferSize: UInt64;
    FUseVertexBuffer: Boolean;
  public
    property Atlas: PSDL_Texture read FAtlas;
    property AtlasSize: Integer read FAtlasSize;
    constructor Create; override;
    destructor Destroy; override;
    procedure Unload;
    procedure SetVertexBufferSize(const aSize: UInt64);
    function  GetVertexBufferSize: UInt64;
    procedure SetUseVertexBuffer(const aEnable: Boolean);
    function  GetUseVertexBuffer: Boolean;
    function  Load(const aRWops: PSDL_RWops; const aSize: Cardinal; const aGlyphs: string=''): Boolean; overload;
    function  Load(const aArchive: TArchive; const aFilename: string; const aSize: Cardinal; const aGlyphs: string=''): Boolean; overload;
    function  LoadDefault(const aSize: Cardinal; const aGlyphs: string=''): Boolean;
    procedure DrawText(const aX, aY: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const); overload;
    procedure DrawText(const aX: Single; var aY: Single; const aLineSpace: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const); overload;
    function  TextLength(const aMsg: string; const aArgs: array of const): Single;
    function  TextHeight: Single;
    procedure RenderVertices(const aReset: Boolean=True);
  end;

  THud = record
  private class var
    FTextItemPadWidth: Integer;
    FPos: TPoint;
  public
    class operator Initialize (out aDest: THud);
    class operator Finalize (var aDest: THud);
    class procedure ResetPos; static;
    class procedure SetPos(const aX, aY: Integer); static;
    class procedure SetLineSpace(const aLineSpace: Integer); static;
    class procedure SetTextItemPadWidth(const aWidth: Integer); static;
    class procedure Text(const aFont: TFont; const aColor: TColor; const aHAlign: THAlign; const aMsg: string; const aArgs: array of const); static;
    class function  TextItem(const aKey: string; const aValue: string; const aSeperator: string='-'): string; static;
  end;

const
  VIDEO_SAMPLEBUFFERSIZE  = 2304;

type
  TVideoStatus = (vsStopped=0, vsPlaying=1, vsPaused=2);

  PVideo = ^TVideo;
  TVideo = record
  private class var
    FAudioSpec: SDL_AudioSpec;
    FAudioDevice: SDL_AudioDeviceID;
    FAudioSampleRate: Integer;
    FRWops: PSDL_RWops;
    FPlm: Pplm_t;
    FStaticPlmBuffer: array[0..PLM_BUFFER_DEFAULT_SIZE] of byte;
    FTexture: PSDL_Texture;
    FWidth: Cardinal;
    FHeight: Cardinal;
    FVolume: Single;
    FFrameRate: Single;
    FStatus: TVideoStatus;
    FStopFlag: Boolean;
    FLoop: Integer;
    FFilename: string;
    class procedure DoVideoStatus(const aStatus: TVideoStatus; const aFilename: string); static;
  public
    class operator Initialize (out aDest: TVideo);
    class operator Finalize (var aDest: TVideo);
    class function  Load(const aArchive: TArchive; const aFilename: string): Boolean; static;
    class procedure Unload; static;
    class procedure Play(const aVolume: Single; const aLoop: Integer); static;
    class procedure LoadPlay(const aArchive: TArchive; const aFilename: string; const aVolume: Single; const aLoop: Integer); static;
    class procedure Pause(const aPause: Boolean); static;
    class procedure Stop; static;
    class procedure Rewind; static;
    class function  GetStatus: TVideoStatus; static;
    class function  GetWidth: Cardinal; static;
    class function  GetHeight: Cardinal; static;
    class function  GetFrameRate: Single; static;
    class function  GetVolume: Single; static;
    class procedure SetVolume(const aVolume: Single); static;
    class procedure Update(const aDeltaTime: Double); static;
    class procedure Draw(const aX, aY, aScale: Single); static;
  end;



{$ENDREGION}

{$REGION ' DelphiGamekit.Network '}
{$ENDREGION}

{$REGION ' DelphiGamekit.Audio '}
type
  TSpeechVoiceAttribute = (svaDescription, svaName, svaVendor, svaAge, svaGender, svaLanguage, svaId);

  TSpeech = record
  private class var
    FSpVoice: TSpVoice;
    FVoiceList: TInterfaceList;
    FVoiceDescList: TStringList;
    FPaused: Boolean;
    FText: string;
    FWord: string;
    FVoice: Integer;
    FSubList: TDictionary<string, string>;
    FCallbacks: TObject;
    class procedure OnWord(aSender: TObject; aStreamNumber: Integer; aStreamPosition: OleVariant; aCharacterPosition, aLength: Integer); static;
    class procedure DoSpeak(const aText: string; const aFlags: Integer); static;
    class procedure EnumVoices; static;
    class procedure FreeVoices; static;
  public
    class operator  Initialize (out aDest: TSpeech);
    class operator  Finalize (var aDest: TSpeech);
    class function  GetVoiceCount: Integer; static;
    class function  GetVoiceAttribute(const aIndex: Integer; const aAttribute: TSpeechVoiceAttribute): string; static;
    class procedure ChangeVoice(const aIndex: Integer); static;
    class function  GetVoice: Integer; static;
    class procedure SetVolume(const aVolume: Single); static;
    class function  GetVolume: Single; static;
    class procedure SetRate(const aRate: Single); static;
    class function  GetRate: Single; static;
    class procedure Clear; static;
    class procedure Say(const aText: string; const aPurge: Boolean); static;
    class function  Active: Boolean; static;
    class procedure Pause; static;
    class procedure Resume; static;
    class procedure Reset; static;
    class procedure SubstituteWord(const aWord: string; const aSubstituteWord: string); static;
  end;

const
  AUDIO_CHANNEL_MAX       = 16;
  AUDIO_CHANNEL_DYNAMIC   = -1;
  AUDIO_CHANNEL_LOOP      = -1;
  AUDIO_CHANNEL_NOFADING  = 0;
  AUDIO_CHANNEL_FADINGOUT = 1;
  AUDIO_CHANNEL_FADINGIN  = 2;

type
  TMusic = PMix_Music;
  TSound = PMix_Chunk;
  TAudioFading = (afNone=0, afOut=1,afIn=2);

  TAudio = record
  private class var
    FMusicBuffer: TBuffer;
  public
    class operator Initialize (out aDest: TAudio);
    class operator Finalize (var aDest: TAudio);
    class function  LoadMusic(const aArchive: TArchive; const aFilename: string; const aUseBuffer: Boolean=False): TMusic; static;
    class function  LoadPlayMusic(const aArchive: TArchive; const aFilename: string; const aVolume: Single; const aLoop: Integer; const aUseBuffer: Boolean=False): TMusic; static;
    class procedure UnloadMusic(var aMusic: TMusic); static;
    class function  PlayMusic(const aMusic: TMusic; const aVolume: Single; const aLoop: Integer): Boolean; static;
    class function  GetMusicVolume(const aMusic: TMusic): Single; static;
    class procedure SetMusicVolume(const aVolume: Single); static;
    class function  LoadSound(const aArchive: TArchive; const aFilename: string): TSound; static;
    class procedure UnloadSound(var aSound: TSound); static;
    class procedure AllocateSoundChannels(const aCount: Integer); static;
    class procedure ReserveSoundChannels(const aCount: Integer); static;
    class function  PlaySound(const aSound: TSound; const aChannel: Integer; const aVolume: Single; const aLoops: Integer): Integer; static;
    class function  FadeInSound(const aSound: TSound; const aChannel: Integer; const aVolume: Single; const aLoops: Integer; const aMilliseconds: Integer): Integer; static;
    class procedure FadeOutSound(const aChannel: Integer; const aMilliseconds: Integer); static;
    class function  FadingSound(const aChannel: Integer): TAudioFading; static;
    class procedure StopSound(const aChannel: Integer); static;
    class function  IsSoundPlaying(const aChannel: Integer): Boolean; static;
    class procedure SetSoundVolume(const aChannel: Integer; const aVolume: Single); static;
    class function  GetSoundVolume(const aChannel: Integer): Single; static;
    class procedure PauseSound(const aChannel: Integer); static;
    class procedure ResumeSound(const aChannel: Integer); static;
    class function  IsSoundPaused(const aChannel: Integer): Boolean; static;
    class procedure ExpireSound(const aChannel: Integer; const aMilliseconds: Integer); static;
    class function  SetSoundPosition(const aChannel: Integer; const aAngle: SmallInt; const aDistance: Byte): Boolean; static;
  end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Game '}
type

  TGame = class(TBaseObject)
  protected type
    PSettings = ^TSettings;
    TSettings = record
      OrgName: string;
      AppName: string;

      LogToConsole: Boolean;

      ConfigFilename: string;

      ArchivePassword: string;
      ArchiveFilename: string;

      WindowTitle: string;
      WindowPosX: Integer;
      WindowPosY: Integer;
      WindowWidth: Integer;
      WindowHeight: Integer;
      WindowClearColor: TColor;
      WindowUpdateOnLostFocus: Boolean;

      DefaultFontSize: Integer;
      DefaultFontGlyphs: string;

      HudTextItemPadWidth: Integer;
      HudPosX: Integer;
      HudPosY: Integer;
      HudLineSpace: Integer;

      AllocateSoundChannels: Integer;
      ReserveSoundChannels: Integer;

      TimerUpdateRate: Cardinal;
      TimerFixedUpdateRate: Cardinal;

    end;
  protected
    FReady: Boolean;
    FTerminate: Boolean;

    FTimer: TTimer;
    FCmdLine: TCmdLine;
    FPrefs: TPrefs;
    FLog: TLog;
    FSpeech: TSpeech;
    FInput: TInput;
    FAudio: TAudio;
    FVideo: TVideo;
    FWindow: TWindow;
    FHud: THud;
    FConfigFile: TConfigFile;
    FArchive: TArchive;
    FDefaultFont: TFont;
    FSettings: TSettings;
  public
    property Timer: TTimer read FTimer;
    property CmdLine: TCmdLine read FCmdLine;
    property Prefs: TPrefs read FPrefs;
    property Log: TLog read FLog;
    property Speech: TSpeech read FSpeech;
    property Input: TInput read FInput;
    property Audio: TAudio read FAudio;
    property Video: TVideo read FVideo;
    property Window: TWindow read FWindow;
    property Hud: THud read FHud;
    property Terminate: Boolean read FTerminate write FTerminate;
    property ConfigFile: TConfigFile read FConfigFile;
    property Archive: TArchive read FArchive;
    property DefaultFont: TFont read FDefaultFont;

    constructor Create; override;
    destructor Destroy; override;

    function  SDKVersion: string;
    function  Settings: PSettings; virtual;
    function  Startup: Boolean; virtual;
    procedure Shutdown; virtual;
    procedure Process; virtual;
    procedure Run; virtual;

    procedure OnSetSettings; virtual;
    function  OnApplySettings: Boolean; virtual;
    procedure OnUnapplySettings; virtual;
    procedure OnLoadConfig; virtual;
    procedure OnSaveConfig; virtual;
    procedure OnStartup; virtual;
    procedure OnShutdown; virtual;
    procedure OnReady(const aReady: Boolean); virtual;
    procedure OnUpdate(const aDeltaTime: Double); virtual;
    procedure OnFixedUpdate(const aFixedUpdateSpeed: Single); virtual;
    procedure OnClearWindow; virtual;
    procedure OnShowWindow; virtual;
    procedure OnRender; virtual;
    procedure OnRenderHud; virtual;
    procedure OnBuildArchiveProgress(const aFilename: string; const aProgress: Cardinal; const aNewFile: Boolean); virtual;
    procedure OnSpeechWord(const aWord, aText: string); virtual;
    procedure OnVideoStatus(const aStatus: TVideoStatus; const aFilename: string); virtual;
  end;

  TGameClass = class of TGame;

var
  Game: TGame = nil;

procedure RunGame(const aGame: TGameClass);

{$ENDREGION}

implementation

{$REGION ' DelphiGamekit.Deps.SDL2 '}
procedure GetExports(const aDLLHandle: Pointer);
begin
{$REGION 'Exports'}
  if not Assigned(aDllHandle) then Exit;
  __debugbreak := MemoryGetProcAddress(aDLLHandle, '__debugbreak');
  IMG_FreeAnimation := MemoryGetProcAddress(aDLLHandle, 'IMG_FreeAnimation');
  IMG_Init := MemoryGetProcAddress(aDLLHandle, 'IMG_Init');
  IMG_isAVIF := MemoryGetProcAddress(aDLLHandle, 'IMG_isAVIF');
  IMG_isBMP := MemoryGetProcAddress(aDLLHandle, 'IMG_isBMP');
  IMG_isCUR := MemoryGetProcAddress(aDLLHandle, 'IMG_isCUR');
  IMG_isGIF := MemoryGetProcAddress(aDLLHandle, 'IMG_isGIF');
  IMG_isICO := MemoryGetProcAddress(aDLLHandle, 'IMG_isICO');
  IMG_isJPG := MemoryGetProcAddress(aDLLHandle, 'IMG_isJPG');
  IMG_isJXL := MemoryGetProcAddress(aDLLHandle, 'IMG_isJXL');
  IMG_isLBM := MemoryGetProcAddress(aDLLHandle, 'IMG_isLBM');
  IMG_isPCX := MemoryGetProcAddress(aDLLHandle, 'IMG_isPCX');
  IMG_isPNG := MemoryGetProcAddress(aDLLHandle, 'IMG_isPNG');
  IMG_isPNM := MemoryGetProcAddress(aDLLHandle, 'IMG_isPNM');
  IMG_isQOI := MemoryGetProcAddress(aDLLHandle, 'IMG_isQOI');
  IMG_isSVG := MemoryGetProcAddress(aDLLHandle, 'IMG_isSVG');
  IMG_isTIF := MemoryGetProcAddress(aDLLHandle, 'IMG_isTIF');
  IMG_isWEBP := MemoryGetProcAddress(aDLLHandle, 'IMG_isWEBP');
  IMG_isXCF := MemoryGetProcAddress(aDLLHandle, 'IMG_isXCF');
  IMG_isXPM := MemoryGetProcAddress(aDLLHandle, 'IMG_isXPM');
  IMG_isXV := MemoryGetProcAddress(aDLLHandle, 'IMG_isXV');
  IMG_Linked_Version := MemoryGetProcAddress(aDLLHandle, 'IMG_Linked_Version');
  IMG_Load := MemoryGetProcAddress(aDLLHandle, 'IMG_Load');
  IMG_Load_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_Load_RW');
  IMG_LoadAnimation := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadAnimation');
  IMG_LoadAnimation_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadAnimation_RW');
  IMG_LoadAnimationTyped_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadAnimationTyped_RW');
  IMG_LoadAVIF_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadAVIF_RW');
  IMG_LoadBMP_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadBMP_RW');
  IMG_LoadCUR_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadCUR_RW');
  IMG_LoadGIF_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadGIF_RW');
  IMG_LoadGIFAnimation_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadGIFAnimation_RW');
  IMG_LoadICO_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadICO_RW');
  IMG_LoadJPG_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadJPG_RW');
  IMG_LoadJXL_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadJXL_RW');
  IMG_LoadLBM_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadLBM_RW');
  IMG_LoadPCX_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadPCX_RW');
  IMG_LoadPNG_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadPNG_RW');
  IMG_LoadPNM_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadPNM_RW');
  IMG_LoadQOI_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadQOI_RW');
  IMG_LoadSizedSVG_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadSizedSVG_RW');
  IMG_LoadSVG_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadSVG_RW');
  IMG_LoadTexture := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadTexture');
  IMG_LoadTexture_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadTexture_RW');
  IMG_LoadTextureTyped_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadTextureTyped_RW');
  IMG_LoadTGA_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadTGA_RW');
  IMG_LoadTIF_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadTIF_RW');
  IMG_LoadTyped_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadTyped_RW');
  IMG_LoadWEBP_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadWEBP_RW');
  IMG_LoadWEBPAnimation_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadWEBPAnimation_RW');
  IMG_LoadXCF_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadXCF_RW');
  IMG_LoadXPM_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadXPM_RW');
  IMG_LoadXV_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_LoadXV_RW');
  IMG_Quit := MemoryGetProcAddress(aDLLHandle, 'IMG_Quit');
  IMG_ReadXPMFromArray := MemoryGetProcAddress(aDLLHandle, 'IMG_ReadXPMFromArray');
  IMG_ReadXPMFromArrayToRGB888 := MemoryGetProcAddress(aDLLHandle, 'IMG_ReadXPMFromArrayToRGB888');
  IMG_SaveJPG := MemoryGetProcAddress(aDLLHandle, 'IMG_SaveJPG');
  IMG_SaveJPG_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_SaveJPG_RW');
  IMG_SavePNG := MemoryGetProcAddress(aDLLHandle, 'IMG_SavePNG');
  IMG_SavePNG_RW := MemoryGetProcAddress(aDLLHandle, 'IMG_SavePNG_RW');
  Mix_ADLMIDI_getAdLibMode := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getAdLibMode');
  Mix_ADLMIDI_getAutoArpeggio := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getAutoArpeggio');
  Mix_ADLMIDI_getBankID := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getBankID');
  Mix_ADLMIDI_getBankNames := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getBankNames');
  Mix_ADLMIDI_getChannelAllocMode := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getChannelAllocMode');
  Mix_ADLMIDI_getChipsCount := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getChipsCount');
  Mix_ADLMIDI_getEmulator := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getEmulator');
  Mix_ADLMIDI_getFullPanStereo := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getFullPanStereo');
  Mix_ADLMIDI_getFullRangeBrightness := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getFullRangeBrightness');
  Mix_ADLMIDI_getLogarithmicVolumes := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getLogarithmicVolumes');
  Mix_ADLMIDI_getScaleMod := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getScaleMod');
  Mix_ADLMIDI_getTotalBanks := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getTotalBanks');
  Mix_ADLMIDI_getTremolo := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getTremolo');
  Mix_ADLMIDI_getVibrato := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getVibrato');
  Mix_ADLMIDI_getVolumeModel := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_getVolumeModel');
  Mix_ADLMIDI_setAdLibMode := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setAdLibMode');
  Mix_ADLMIDI_setAutoArpeggio := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setAutoArpeggio');
  Mix_ADLMIDI_setBankID := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setBankID');
  Mix_ADLMIDI_setChannelAllocMode := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setChannelAllocMode');
  Mix_ADLMIDI_setChipsCount := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setChipsCount');
  Mix_ADLMIDI_setCustomBankFile := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setCustomBankFile');
  Mix_ADLMIDI_setEmulator := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setEmulator');
  Mix_ADLMIDI_setFullPanStereo := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setFullPanStereo');
  Mix_ADLMIDI_setFullRangeBrightness := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setFullRangeBrightness');
  Mix_ADLMIDI_setLogarithmicVolumes := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setLogarithmicVolumes');
  Mix_ADLMIDI_setScaleMod := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setScaleMod');
  Mix_ADLMIDI_setSetDefaults := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setSetDefaults');
  Mix_ADLMIDI_setTremolo := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setTremolo');
  Mix_ADLMIDI_setVibrato := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setVibrato');
  Mix_ADLMIDI_setVolumeModel := MemoryGetProcAddress(aDLLHandle, 'Mix_ADLMIDI_setVolumeModel');
  Mix_AllocateChannels := MemoryGetProcAddress(aDLLHandle, 'Mix_AllocateChannels');
  Mix_ChannelFinished := MemoryGetProcAddress(aDLLHandle, 'Mix_ChannelFinished');
  Mix_CloseAudio := MemoryGetProcAddress(aDLLHandle, 'Mix_CloseAudio');
  Mix_CrossFadeMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_CrossFadeMusicStream');
  Mix_CrossFadeMusicStreamPos := MemoryGetProcAddress(aDLLHandle, 'Mix_CrossFadeMusicStreamPos');
  Mix_EachSoundFont := MemoryGetProcAddress(aDLLHandle, 'Mix_EachSoundFont');
  Mix_EachSoundFontEx := MemoryGetProcAddress(aDLLHandle, 'Mix_EachSoundFontEx');
  Mix_ExpireChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_ExpireChannel');
  Mix_FadeInChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInChannel');
  Mix_FadeInChannelTimed := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInChannelTimed');
  Mix_FadeInChannelTimedVolume := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInChannelTimedVolume');
  Mix_FadeInChannelVolume := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInChannelVolume');
  Mix_FadeInMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInMusic');
  Mix_FadeInMusicPos := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInMusicPos');
  Mix_FadeInMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInMusicStream');
  Mix_FadeInMusicStreamPos := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeInMusicStreamPos');
  Mix_FadeOutChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeOutChannel');
  Mix_FadeOutGroup := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeOutGroup');
  Mix_FadeOutMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeOutMusic');
  Mix_FadeOutMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_FadeOutMusicStream');
  Mix_FadingChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_FadingChannel');
  Mix_FadingMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_FadingMusic');
  Mix_FadingMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_FadingMusicStream');
  Mix_FreeChunk := MemoryGetProcAddress(aDLLHandle, 'Mix_FreeChunk');
  Mix_FreeMixer := MemoryGetProcAddress(aDLLHandle, 'Mix_FreeMixer');
  Mix_FreeMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_FreeMusic');
  Mix_GetChunk := MemoryGetProcAddress(aDLLHandle, 'Mix_GetChunk');
  Mix_GetChunkDecoder := MemoryGetProcAddress(aDLLHandle, 'Mix_GetChunkDecoder');
  Mix_GetGeneralMixer := MemoryGetProcAddress(aDLLHandle, 'Mix_GetGeneralMixer');
  Mix_GetMidiDevice := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMidiDevice');
  Mix_GetMidiPlayer := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMidiPlayer');
  Mix_GetMultiMusicMixer := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMultiMusicMixer');
  Mix_GetMusicAlbumTag := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicAlbumTag');
  Mix_GetMusicArtistTag := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicArtistTag');
  Mix_GetMusicCopyrightTag := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicCopyrightTag');
  Mix_GetMusicDecoder := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicDecoder');
  Mix_GetMusicHookData := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicHookData');
  Mix_GetMusicLoopEndTime := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicLoopEndTime');
  Mix_GetMusicLoopLengthTime := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicLoopLengthTime');
  Mix_GetMusicLoopStartTime := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicLoopStartTime');
  Mix_GetMusicMixer := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicMixer');
  Mix_GetMusicPitch := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicPitch');
  Mix_GetMusicPosition := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicPosition');
  Mix_GetMusicSpeed := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicSpeed');
  Mix_GetMusicTempo := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicTempo');
  Mix_GetMusicTitle := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicTitle');
  Mix_GetMusicTitleTag := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicTitleTag');
  Mix_GetMusicTotalTime := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicTotalTime');
  Mix_GetMusicTracks := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicTracks');
  Mix_GetMusicType := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicType');
  Mix_GetMusicVolume := MemoryGetProcAddress(aDLLHandle, 'Mix_GetMusicVolume');
  Mix_GetNextMidiDevice := MemoryGetProcAddress(aDLLHandle, 'Mix_GetNextMidiDevice');
  Mix_GetNextMidiPlayer := MemoryGetProcAddress(aDLLHandle, 'Mix_GetNextMidiPlayer');
  Mix_GetNumChunkDecoders := MemoryGetProcAddress(aDLLHandle, 'Mix_GetNumChunkDecoders');
  Mix_GetNumMusicDecoders := MemoryGetProcAddress(aDLLHandle, 'Mix_GetNumMusicDecoders');
  Mix_GetNumTracks := MemoryGetProcAddress(aDLLHandle, 'Mix_GetNumTracks');
  Mix_GetSoundFonts := MemoryGetProcAddress(aDLLHandle, 'Mix_GetSoundFonts');
  Mix_GetSynchroValue := MemoryGetProcAddress(aDLLHandle, 'Mix_GetSynchroValue');
  Mix_GetTimidityCfg := MemoryGetProcAddress(aDLLHandle, 'Mix_GetTimidityCfg');
  Mix_GetVolumeMusicGeneral := MemoryGetProcAddress(aDLLHandle, 'Mix_GetVolumeMusicGeneral');
  Mix_GetVolumeMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_GetVolumeMusicStream');
  Mix_GME_GetSpcEchoDisabled := MemoryGetProcAddress(aDLLHandle, 'Mix_GME_GetSpcEchoDisabled');
  Mix_GME_SetSpcEchoDisabled := MemoryGetProcAddress(aDLLHandle, 'Mix_GME_SetSpcEchoDisabled');
  Mix_GroupAvailable := MemoryGetProcAddress(aDLLHandle, 'Mix_GroupAvailable');
  Mix_GroupChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_GroupChannel');
  Mix_GroupChannels := MemoryGetProcAddress(aDLLHandle, 'Mix_GroupChannels');
  Mix_GroupCount := MemoryGetProcAddress(aDLLHandle, 'Mix_GroupCount');
  Mix_GroupNewer := MemoryGetProcAddress(aDLLHandle, 'Mix_GroupNewer');
  Mix_GroupOldest := MemoryGetProcAddress(aDLLHandle, 'Mix_GroupOldest');
  Mix_HaltChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_HaltChannel');
  Mix_HaltGroup := MemoryGetProcAddress(aDLLHandle, 'Mix_HaltGroup');
  Mix_HaltMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_HaltMusic');
  Mix_HaltMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_HaltMusicStream');
  Mix_HasChunkDecoder := MemoryGetProcAddress(aDLLHandle, 'Mix_HasChunkDecoder');
  Mix_HasMusicDecoder := MemoryGetProcAddress(aDLLHandle, 'Mix_HasMusicDecoder');
  Mix_HookMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_HookMusic');
  Mix_HookMusicFinished := MemoryGetProcAddress(aDLLHandle, 'Mix_HookMusicFinished');
  Mix_HookMusicStreamFinished := MemoryGetProcAddress(aDLLHandle, 'Mix_HookMusicStreamFinished');
  Mix_HookMusicStreamFinishedAny := MemoryGetProcAddress(aDLLHandle, 'Mix_HookMusicStreamFinishedAny');
  Mix_Init := MemoryGetProcAddress(aDLLHandle, 'Mix_Init');
  Mix_InitMixer := MemoryGetProcAddress(aDLLHandle, 'Mix_InitMixer');
  Mix_Linked_Version := MemoryGetProcAddress(aDLLHandle, 'Mix_Linked_Version');
  Mix_LoadMUS := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadMUS');
  Mix_LoadMUS_RW := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadMUS_RW');
  Mix_LoadMUS_RW_ARG := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadMUS_RW_ARG');
  Mix_LoadMUS_RW_GME := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadMUS_RW_GME');
  Mix_LoadMUSType_RW := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadMUSType_RW');
  Mix_LoadMUSType_RW_ARG := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadMUSType_RW_ARG');
  Mix_LoadWAV := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadWAV');
  Mix_LoadWAV_RW := MemoryGetProcAddress(aDLLHandle, 'Mix_LoadWAV_RW');
  Mix_MasterVolume := MemoryGetProcAddress(aDLLHandle, 'Mix_MasterVolume');
  Mix_ModMusicJumpToOrder := MemoryGetProcAddress(aDLLHandle, 'Mix_ModMusicJumpToOrder');
  Mix_ModMusicStreamJumpToOrder := MemoryGetProcAddress(aDLLHandle, 'Mix_ModMusicStreamJumpToOrder');
  Mix_MusicDuration := MemoryGetProcAddress(aDLLHandle, 'Mix_MusicDuration');
  Mix_OpenAudio := MemoryGetProcAddress(aDLLHandle, 'Mix_OpenAudio');
  Mix_OpenAudioDevice := MemoryGetProcAddress(aDLLHandle, 'Mix_OpenAudioDevice');
  Mix_OPNMIDI_getAutoArpeggio := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getAutoArpeggio');
  Mix_OPNMIDI_getChannelAllocMode := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getChannelAllocMode');
  Mix_OPNMIDI_getChipsCount := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getChipsCount');
  Mix_OPNMIDI_getEmulator := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getEmulator');
  Mix_OPNMIDI_getFullPanStereo := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getFullPanStereo');
  Mix_OPNMIDI_getFullRangeBrightness := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getFullRangeBrightness');
  Mix_OPNMIDI_getVolumeModel := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_getVolumeModel');
  Mix_OPNMIDI_setAutoArpeggio := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setAutoArpeggio');
  Mix_OPNMIDI_setChannelAllocMode := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setChannelAllocMode');
  Mix_OPNMIDI_setChipsCount := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setChipsCount');
  Mix_OPNMIDI_setCustomBankFile := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setCustomBankFile');
  Mix_OPNMIDI_setEmulator := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setEmulator');
  Mix_OPNMIDI_setFullPanStereo := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setFullPanStereo');
  Mix_OPNMIDI_setFullRangeBrightness := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setFullRangeBrightness');
  Mix_OPNMIDI_setSetDefaults := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setSetDefaults');
  Mix_OPNMIDI_setVolumeModel := MemoryGetProcAddress(aDLLHandle, 'Mix_OPNMIDI_setVolumeModel');
  Mix_Pause := MemoryGetProcAddress(aDLLHandle, 'Mix_Pause');
  Mix_PauseAudio := MemoryGetProcAddress(aDLLHandle, 'Mix_PauseAudio');
  Mix_Paused := MemoryGetProcAddress(aDLLHandle, 'Mix_Paused');
  Mix_PausedMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_PausedMusic');
  Mix_PausedMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_PausedMusicStream');
  Mix_PauseMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_PauseMusic');
  Mix_PauseMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_PauseMusicStream');
  Mix_PauseMusicStreamAll := MemoryGetProcAddress(aDLLHandle, 'Mix_PauseMusicStreamAll');
  Mix_PlayChannel := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayChannel');
  Mix_PlayChannelTimed := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayChannelTimed');
  Mix_PlayChannelTimedVolume := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayChannelTimedVolume');
  Mix_Playing := MemoryGetProcAddress(aDLLHandle, 'Mix_Playing');
  Mix_PlayingMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayingMusic');
  Mix_PlayingMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayingMusicStream');
  Mix_PlayMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayMusic');
  Mix_PlayMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_PlayMusicStream');
  Mix_QuerySpec := MemoryGetProcAddress(aDLLHandle, 'Mix_QuerySpec');
  Mix_QuerySpecEx := MemoryGetProcAddress(aDLLHandle, 'Mix_QuerySpecEx');
  Mix_QuickLoad_RAW := MemoryGetProcAddress(aDLLHandle, 'Mix_QuickLoad_RAW');
  Mix_QuickLoad_WAV := MemoryGetProcAddress(aDLLHandle, 'Mix_QuickLoad_WAV');
  Mix_Quit := MemoryGetProcAddress(aDLLHandle, 'Mix_Quit');
  Mix_RegisterEffect := MemoryGetProcAddress(aDLLHandle, 'Mix_RegisterEffect');
  Mix_RegisterMusicEffect := MemoryGetProcAddress(aDLLHandle, 'Mix_RegisterMusicEffect');
  Mix_ReserveChannels := MemoryGetProcAddress(aDLLHandle, 'Mix_ReserveChannels');
  Mix_Resume := MemoryGetProcAddress(aDLLHandle, 'Mix_Resume');
  Mix_ResumeMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_ResumeMusic');
  Mix_ResumeMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_ResumeMusicStream');
  Mix_ResumeMusicStreamAll := MemoryGetProcAddress(aDLLHandle, 'Mix_ResumeMusicStreamAll');
  Mix_RewindMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_RewindMusic');
  Mix_RewindMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_RewindMusicStream');
  Mix_SetDistance := MemoryGetProcAddress(aDLLHandle, 'Mix_SetDistance');
  Mix_SetFreeOnStop := MemoryGetProcAddress(aDLLHandle, 'Mix_SetFreeOnStop');
  Mix_SetLockMIDIArgs := MemoryGetProcAddress(aDLLHandle, 'Mix_SetLockMIDIArgs');
  Mix_SetMidiDevice := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMidiDevice');
  Mix_SetMidiPlayer := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMidiPlayer');
  Mix_SetMusicCMD := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicCMD');
  Mix_SetMusicEffectDistance := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicEffectDistance');
  Mix_SetMusicEffectPanning := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicEffectPanning');
  Mix_SetMusicEffectPosition := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicEffectPosition');
  Mix_SetMusicEffectReverseStereo := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicEffectReverseStereo');
  Mix_SetMusicFileName := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicFileName');
  Mix_SetMusicPitch := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicPitch');
  Mix_SetMusicPosition := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicPosition');
  Mix_SetMusicPositionStream := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicPositionStream');
  Mix_SetMusicSpeed := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicSpeed');
  Mix_SetMusicStreamPosition := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicStreamPosition');
  Mix_SetMusicTempo := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicTempo');
  Mix_SetMusicTrackMute := MemoryGetProcAddress(aDLLHandle, 'Mix_SetMusicTrackMute');
  Mix_SetPanning := MemoryGetProcAddress(aDLLHandle, 'Mix_SetPanning');
  Mix_SetPosition := MemoryGetProcAddress(aDLLHandle, 'Mix_SetPosition');
  Mix_SetPostMix := MemoryGetProcAddress(aDLLHandle, 'Mix_SetPostMix');
  Mix_SetReverseStereo := MemoryGetProcAddress(aDLLHandle, 'Mix_SetReverseStereo');
  Mix_SetSoundFonts := MemoryGetProcAddress(aDLLHandle, 'Mix_SetSoundFonts');
  Mix_SetSynchroValue := MemoryGetProcAddress(aDLLHandle, 'Mix_SetSynchroValue');
  Mix_SetTimidityCfg := MemoryGetProcAddress(aDLLHandle, 'Mix_SetTimidityCfg');
  Mix_StartTrack := MemoryGetProcAddress(aDLLHandle, 'Mix_StartTrack');
  Mix_Timidity_addToPathList := MemoryGetProcAddress(aDLLHandle, 'Mix_Timidity_addToPathList');
  Mix_UnregisterAllEffects := MemoryGetProcAddress(aDLLHandle, 'Mix_UnregisterAllEffects');
  Mix_UnregisterAllMusicEffects := MemoryGetProcAddress(aDLLHandle, 'Mix_UnregisterAllMusicEffects');
  Mix_UnregisterEffect := MemoryGetProcAddress(aDLLHandle, 'Mix_UnregisterEffect');
  Mix_UnregisterMusicEffect := MemoryGetProcAddress(aDLLHandle, 'Mix_UnregisterMusicEffect');
  Mix_Volume := MemoryGetProcAddress(aDLLHandle, 'Mix_Volume');
  Mix_VolumeChunk := MemoryGetProcAddress(aDLLHandle, 'Mix_VolumeChunk');
  Mix_VolumeMusic := MemoryGetProcAddress(aDLLHandle, 'Mix_VolumeMusic');
  Mix_VolumeMusicGeneral := MemoryGetProcAddress(aDLLHandle, 'Mix_VolumeMusicGeneral');
  Mix_VolumeMusicStream := MemoryGetProcAddress(aDLLHandle, 'Mix_VolumeMusicStream');
  nk__begin := MemoryGetProcAddress(aDLLHandle, 'nk__begin');
  nk__draw_begin := MemoryGetProcAddress(aDLLHandle, 'nk__draw_begin');
  nk__draw_end := MemoryGetProcAddress(aDLLHandle, 'nk__draw_end');
  nk__draw_list_begin := MemoryGetProcAddress(aDLLHandle, 'nk__draw_list_begin');
  nk__draw_list_end := MemoryGetProcAddress(aDLLHandle, 'nk__draw_list_end');
  nk__draw_list_next := MemoryGetProcAddress(aDLLHandle, 'nk__draw_list_next');
  nk__draw_next := MemoryGetProcAddress(aDLLHandle, 'nk__draw_next');
  nk__next := MemoryGetProcAddress(aDLLHandle, 'nk__next');
  nk_begin := MemoryGetProcAddress(aDLLHandle, 'nk_begin');
  nk_begin_titled := MemoryGetProcAddress(aDLLHandle, 'nk_begin_titled');
  nk_buffer_clear := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_clear');
  nk_buffer_free := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_free');
  nk_buffer_info := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_info');
  nk_buffer_init := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_init');
  nk_buffer_init_default := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_init_default');
  nk_buffer_init_fixed := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_init_fixed');
  nk_buffer_mark := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_mark');
  nk_buffer_memory := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_memory');
  nk_buffer_memory_const := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_memory_const');
  nk_buffer_push := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_push');
  nk_buffer_reset := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_reset');
  nk_buffer_total := MemoryGetProcAddress(aDLLHandle, 'nk_buffer_total');
  nk_button_color := MemoryGetProcAddress(aDLLHandle, 'nk_button_color');
  nk_button_image := MemoryGetProcAddress(aDLLHandle, 'nk_button_image');
  nk_button_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_button_image_label');
  nk_button_image_label_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_image_label_styled');
  nk_button_image_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_image_styled');
  nk_button_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_button_image_text');
  nk_button_image_text_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_image_text_styled');
  nk_button_label := MemoryGetProcAddress(aDLLHandle, 'nk_button_label');
  nk_button_label_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_label_styled');
  nk_button_pop_behavior := MemoryGetProcAddress(aDLLHandle, 'nk_button_pop_behavior');
  nk_button_push_behavior := MemoryGetProcAddress(aDLLHandle, 'nk_button_push_behavior');
  nk_button_set_behavior := MemoryGetProcAddress(aDLLHandle, 'nk_button_set_behavior');
  nk_button_symbol := MemoryGetProcAddress(aDLLHandle, 'nk_button_symbol');
  nk_button_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_button_symbol_label');
  nk_button_symbol_label_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_symbol_label_styled');
  nk_button_symbol_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_symbol_styled');
  nk_button_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_button_symbol_text');
  nk_button_symbol_text_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_symbol_text_styled');
  nk_button_text := MemoryGetProcAddress(aDLLHandle, 'nk_button_text');
  nk_button_text_styled := MemoryGetProcAddress(aDLLHandle, 'nk_button_text_styled');
  nk_chart_add_slot := MemoryGetProcAddress(aDLLHandle, 'nk_chart_add_slot');
  nk_chart_add_slot_colored := MemoryGetProcAddress(aDLLHandle, 'nk_chart_add_slot_colored');
  nk_chart_begin := MemoryGetProcAddress(aDLLHandle, 'nk_chart_begin');
  nk_chart_begin_colored := MemoryGetProcAddress(aDLLHandle, 'nk_chart_begin_colored');
  nk_chart_end := MemoryGetProcAddress(aDLLHandle, 'nk_chart_end');
  nk_chart_push := MemoryGetProcAddress(aDLLHandle, 'nk_chart_push');
  nk_chart_push_slot := MemoryGetProcAddress(aDLLHandle, 'nk_chart_push_slot');
  nk_check_flags_label := MemoryGetProcAddress(aDLLHandle, 'nk_check_flags_label');
  nk_check_flags_text := MemoryGetProcAddress(aDLLHandle, 'nk_check_flags_text');
  nk_check_label := MemoryGetProcAddress(aDLLHandle, 'nk_check_label');
  nk_check_text := MemoryGetProcAddress(aDLLHandle, 'nk_check_text');
  nk_checkbox_flags_label := MemoryGetProcAddress(aDLLHandle, 'nk_checkbox_flags_label');
  nk_checkbox_flags_text := MemoryGetProcAddress(aDLLHandle, 'nk_checkbox_flags_text');
  nk_checkbox_label := MemoryGetProcAddress(aDLLHandle, 'nk_checkbox_label');
  nk_checkbox_text := MemoryGetProcAddress(aDLLHandle, 'nk_checkbox_text');
  nk_clear := MemoryGetProcAddress(aDLLHandle, 'nk_clear');
  nk_color_cf := MemoryGetProcAddress(aDLLHandle, 'nk_color_cf');
  nk_color_d := MemoryGetProcAddress(aDLLHandle, 'nk_color_d');
  nk_color_dv := MemoryGetProcAddress(aDLLHandle, 'nk_color_dv');
  nk_color_f := MemoryGetProcAddress(aDLLHandle, 'nk_color_f');
  nk_color_fv := MemoryGetProcAddress(aDLLHandle, 'nk_color_fv');
  nk_color_hex_rgb := MemoryGetProcAddress(aDLLHandle, 'nk_color_hex_rgb');
  nk_color_hex_rgba := MemoryGetProcAddress(aDLLHandle, 'nk_color_hex_rgba');
  nk_color_hsv_b := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsv_b');
  nk_color_hsv_bv := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsv_bv');
  nk_color_hsv_f := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsv_f');
  nk_color_hsv_fv := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsv_fv');
  nk_color_hsv_i := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsv_i');
  nk_color_hsv_iv := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsv_iv');
  nk_color_hsva_b := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsva_b');
  nk_color_hsva_bv := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsva_bv');
  nk_color_hsva_f := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsva_f');
  nk_color_hsva_fv := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsva_fv');
  nk_color_hsva_i := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsva_i');
  nk_color_hsva_iv := MemoryGetProcAddress(aDLLHandle, 'nk_color_hsva_iv');
  nk_color_pick := MemoryGetProcAddress(aDLLHandle, 'nk_color_pick');
  nk_color_picker := MemoryGetProcAddress(aDLLHandle, 'nk_color_picker');
  nk_color_u32 := MemoryGetProcAddress(aDLLHandle, 'nk_color_u32');
  nk_colorf_hsva_f := MemoryGetProcAddress(aDLLHandle, 'nk_colorf_hsva_f');
  nk_colorf_hsva_fv := MemoryGetProcAddress(aDLLHandle, 'nk_colorf_hsva_fv');
  nk_combo := MemoryGetProcAddress(aDLLHandle, 'nk_combo');
  nk_combo_begin_color := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_color');
  nk_combo_begin_image := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_image');
  nk_combo_begin_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_image_label');
  nk_combo_begin_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_image_text');
  nk_combo_begin_label := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_label');
  nk_combo_begin_symbol := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_symbol');
  nk_combo_begin_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_symbol_label');
  nk_combo_begin_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_symbol_text');
  nk_combo_begin_text := MemoryGetProcAddress(aDLLHandle, 'nk_combo_begin_text');
  nk_combo_callback := MemoryGetProcAddress(aDLLHandle, 'nk_combo_callback');
  nk_combo_close := MemoryGetProcAddress(aDLLHandle, 'nk_combo_close');
  nk_combo_end := MemoryGetProcAddress(aDLLHandle, 'nk_combo_end');
  nk_combo_item_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_combo_item_image_label');
  nk_combo_item_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_combo_item_image_text');
  nk_combo_item_label := MemoryGetProcAddress(aDLLHandle, 'nk_combo_item_label');
  nk_combo_item_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_combo_item_symbol_label');
  nk_combo_item_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_combo_item_symbol_text');
  nk_combo_item_text := MemoryGetProcAddress(aDLLHandle, 'nk_combo_item_text');
  nk_combo_separator := MemoryGetProcAddress(aDLLHandle, 'nk_combo_separator');
  nk_combo_string := MemoryGetProcAddress(aDLLHandle, 'nk_combo_string');
  nk_combobox := MemoryGetProcAddress(aDLLHandle, 'nk_combobox');
  nk_combobox_callback := MemoryGetProcAddress(aDLLHandle, 'nk_combobox_callback');
  nk_combobox_separator := MemoryGetProcAddress(aDLLHandle, 'nk_combobox_separator');
  nk_combobox_string := MemoryGetProcAddress(aDLLHandle, 'nk_combobox_string');
  nk_contextual_begin := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_begin');
  nk_contextual_close := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_close');
  nk_contextual_end := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_end');
  nk_contextual_item_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_item_image_label');
  nk_contextual_item_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_item_image_text');
  nk_contextual_item_label := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_item_label');
  nk_contextual_item_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_item_symbol_label');
  nk_contextual_item_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_item_symbol_text');
  nk_contextual_item_text := MemoryGetProcAddress(aDLLHandle, 'nk_contextual_item_text');
  nk_convert := MemoryGetProcAddress(aDLLHandle, 'nk_convert');
  nk_draw_image := MemoryGetProcAddress(aDLLHandle, 'nk_draw_image');
  nk_draw_list_add_image := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_add_image');
  nk_draw_list_add_text := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_add_text');
  nk_draw_list_fill_circle := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_fill_circle');
  nk_draw_list_fill_poly_convex := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_fill_poly_convex');
  nk_draw_list_fill_rect := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_fill_rect');
  nk_draw_list_fill_rect_multi_color := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_fill_rect_multi_color');
  nk_draw_list_fill_triangle := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_fill_triangle');
  nk_draw_list_init := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_init');
  nk_draw_list_path_arc_to := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_arc_to');
  nk_draw_list_path_arc_to_fast := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_arc_to_fast');
  nk_draw_list_path_clear := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_clear');
  nk_draw_list_path_curve_to := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_curve_to');
  nk_draw_list_path_fill := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_fill');
  nk_draw_list_path_line_to := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_line_to');
  nk_draw_list_path_rect_to := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_rect_to');
  nk_draw_list_path_stroke := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_path_stroke');
  nk_draw_list_setup := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_setup');
  nk_draw_list_stroke_circle := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_stroke_circle');
  nk_draw_list_stroke_curve := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_stroke_curve');
  nk_draw_list_stroke_line := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_stroke_line');
  nk_draw_list_stroke_poly_line := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_stroke_poly_line');
  nk_draw_list_stroke_rect := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_stroke_rect');
  nk_draw_list_stroke_triangle := MemoryGetProcAddress(aDLLHandle, 'nk_draw_list_stroke_triangle');
  nk_draw_nine_slice := MemoryGetProcAddress(aDLLHandle, 'nk_draw_nine_slice');
  nk_draw_text := MemoryGetProcAddress(aDLLHandle, 'nk_draw_text');
  nk_edit_buffer := MemoryGetProcAddress(aDLLHandle, 'nk_edit_buffer');
  nk_edit_focus := MemoryGetProcAddress(aDLLHandle, 'nk_edit_focus');
  nk_edit_string := MemoryGetProcAddress(aDLLHandle, 'nk_edit_string');
  nk_edit_string_zero_terminated := MemoryGetProcAddress(aDLLHandle, 'nk_edit_string_zero_terminated');
  nk_edit_unfocus := MemoryGetProcAddress(aDLLHandle, 'nk_edit_unfocus');
  nk_end := MemoryGetProcAddress(aDLLHandle, 'nk_end');
  nk_fill_arc := MemoryGetProcAddress(aDLLHandle, 'nk_fill_arc');
  nk_fill_circle := MemoryGetProcAddress(aDLLHandle, 'nk_fill_circle');
  nk_fill_polygon := MemoryGetProcAddress(aDLLHandle, 'nk_fill_polygon');
  nk_fill_rect := MemoryGetProcAddress(aDLLHandle, 'nk_fill_rect');
  nk_fill_rect_multi_color := MemoryGetProcAddress(aDLLHandle, 'nk_fill_rect_multi_color');
  nk_fill_triangle := MemoryGetProcAddress(aDLLHandle, 'nk_fill_triangle');
  nk_filter_ascii := MemoryGetProcAddress(aDLLHandle, 'nk_filter_ascii');
  nk_filter_binary := MemoryGetProcAddress(aDLLHandle, 'nk_filter_binary');
  nk_filter_decimal := MemoryGetProcAddress(aDLLHandle, 'nk_filter_decimal');
  nk_filter_default := MemoryGetProcAddress(aDLLHandle, 'nk_filter_default');
  nk_filter_float := MemoryGetProcAddress(aDLLHandle, 'nk_filter_float');
  nk_filter_hex := MemoryGetProcAddress(aDLLHandle, 'nk_filter_hex');
  nk_filter_oct := MemoryGetProcAddress(aDLLHandle, 'nk_filter_oct');
  nk_font_atlas_add := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_add');
  nk_font_atlas_add_compressed := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_add_compressed');
  nk_font_atlas_add_compressed_base85 := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_add_compressed_base85');
  nk_font_atlas_add_default := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_add_default');
  nk_font_atlas_add_from_file := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_add_from_file');
  nk_font_atlas_add_from_memory := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_add_from_memory');
  nk_font_atlas_bake := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_bake');
  nk_font_atlas_begin := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_begin');
  nk_font_atlas_cleanup := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_cleanup');
  nk_font_atlas_clear := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_clear');
  nk_font_atlas_end := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_end');
  nk_font_atlas_init := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_init');
  nk_font_atlas_init_custom := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_init_custom');
  nk_font_atlas_init_default := MemoryGetProcAddress(aDLLHandle, 'nk_font_atlas_init_default');
  nk_font_chinese_glyph_ranges := MemoryGetProcAddress(aDLLHandle, 'nk_font_chinese_glyph_ranges');
  nk_font_config_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_font_config');
  nk_font_cyrillic_glyph_ranges := MemoryGetProcAddress(aDLLHandle, 'nk_font_cyrillic_glyph_ranges');
  nk_font_default_glyph_ranges := MemoryGetProcAddress(aDLLHandle, 'nk_font_default_glyph_ranges');
  nk_font_find_glyph := MemoryGetProcAddress(aDLLHandle, 'nk_font_find_glyph');
  nk_font_korean_glyph_ranges := MemoryGetProcAddress(aDLLHandle, 'nk_font_korean_glyph_ranges');
  nk_free := MemoryGetProcAddress(aDLLHandle, 'nk_free');
  nk_get_null_rect := MemoryGetProcAddress(aDLLHandle, 'nk_get_null_rect');
  nk_group_begin := MemoryGetProcAddress(aDLLHandle, 'nk_group_begin');
  nk_group_begin_titled := MemoryGetProcAddress(aDLLHandle, 'nk_group_begin_titled');
  nk_group_end := MemoryGetProcAddress(aDLLHandle, 'nk_group_end');
  nk_group_get_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_group_get_scroll');
  nk_group_scrolled_begin := MemoryGetProcAddress(aDLLHandle, 'nk_group_scrolled_begin');
  nk_group_scrolled_end := MemoryGetProcAddress(aDLLHandle, 'nk_group_scrolled_end');
  nk_group_scrolled_offset_begin := MemoryGetProcAddress(aDLLHandle, 'nk_group_scrolled_offset_begin');
  nk_group_set_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_group_set_scroll');
  nk_handle_id := MemoryGetProcAddress(aDLLHandle, 'nk_handle_id');
  nk_handle_ptr := MemoryGetProcAddress(aDLLHandle, 'nk_handle_ptr');
  nk_hsv := MemoryGetProcAddress(aDLLHandle, 'nk_hsv');
  nk_hsv_bv := MemoryGetProcAddress(aDLLHandle, 'nk_hsv_bv');
  nk_hsv_f := MemoryGetProcAddress(aDLLHandle, 'nk_hsv_f');
  nk_hsv_fv := MemoryGetProcAddress(aDLLHandle, 'nk_hsv_fv');
  nk_hsv_iv := MemoryGetProcAddress(aDLLHandle, 'nk_hsv_iv');
  nk_hsva := MemoryGetProcAddress(aDLLHandle, 'nk_hsva');
  nk_hsva_bv := MemoryGetProcAddress(aDLLHandle, 'nk_hsva_bv');
  nk_hsva_colorf := MemoryGetProcAddress(aDLLHandle, 'nk_hsva_colorf');
  nk_hsva_colorfv := MemoryGetProcAddress(aDLLHandle, 'nk_hsva_colorfv');
  nk_hsva_f := MemoryGetProcAddress(aDLLHandle, 'nk_hsva_f');
  nk_hsva_fv := MemoryGetProcAddress(aDLLHandle, 'nk_hsva_fv');
  nk_hsva_iv := MemoryGetProcAddress(aDLLHandle, 'nk_hsva_iv');
  nk_image_color := MemoryGetProcAddress(aDLLHandle, 'nk_image_color');
  nk_image_handle := MemoryGetProcAddress(aDLLHandle, 'nk_image_handle');
  nk_image_id := MemoryGetProcAddress(aDLLHandle, 'nk_image_id');
  nk_image_is_subimage := MemoryGetProcAddress(aDLLHandle, 'nk_image_is_subimage');
  nk_image_ptr := MemoryGetProcAddress(aDLLHandle, 'nk_image_ptr');
  nk_image_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_image');
  nk_init := MemoryGetProcAddress(aDLLHandle, 'nk_init');
  nk_init_custom := MemoryGetProcAddress(aDLLHandle, 'nk_init_custom');
  nk_init_default := MemoryGetProcAddress(aDLLHandle, 'nk_init_default');
  nk_init_fixed := MemoryGetProcAddress(aDLLHandle, 'nk_init_fixed');
  nk_input_any_mouse_click_in_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_any_mouse_click_in_rect');
  nk_input_begin := MemoryGetProcAddress(aDLLHandle, 'nk_input_begin');
  nk_input_button := MemoryGetProcAddress(aDLLHandle, 'nk_input_button');
  nk_input_char := MemoryGetProcAddress(aDLLHandle, 'nk_input_char');
  nk_input_end := MemoryGetProcAddress(aDLLHandle, 'nk_input_end');
  nk_input_glyph := MemoryGetProcAddress(aDLLHandle, 'nk_input_glyph');
  nk_input_has_mouse_click := MemoryGetProcAddress(aDLLHandle, 'nk_input_has_mouse_click');
  nk_input_has_mouse_click_down_in_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_has_mouse_click_down_in_rect');
  nk_input_has_mouse_click_in_button_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_has_mouse_click_in_button_rect');
  nk_input_has_mouse_click_in_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_has_mouse_click_in_rect');
  nk_input_is_key_down := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_key_down');
  nk_input_is_key_pressed := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_key_pressed');
  nk_input_is_key_released := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_key_released');
  nk_input_is_mouse_click_down_in_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_click_down_in_rect');
  nk_input_is_mouse_click_in_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_click_in_rect');
  nk_input_is_mouse_down := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_down');
  nk_input_is_mouse_hovering_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_hovering_rect');
  nk_input_is_mouse_pressed := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_pressed');
  nk_input_is_mouse_prev_hovering_rect := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_prev_hovering_rect');
  nk_input_is_mouse_released := MemoryGetProcAddress(aDLLHandle, 'nk_input_is_mouse_released');
  nk_input_key := MemoryGetProcAddress(aDLLHandle, 'nk_input_key');
  nk_input_motion := MemoryGetProcAddress(aDLLHandle, 'nk_input_motion');
  nk_input_mouse_clicked := MemoryGetProcAddress(aDLLHandle, 'nk_input_mouse_clicked');
  nk_input_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_input_scroll');
  nk_input_unicode := MemoryGetProcAddress(aDLLHandle, 'nk_input_unicode');
  nk_item_is_any_active := MemoryGetProcAddress(aDLLHandle, 'nk_item_is_any_active');
  nk_label := MemoryGetProcAddress(aDLLHandle, 'nk_label');
  nk_label_colored := MemoryGetProcAddress(aDLLHandle, 'nk_label_colored');
  nk_label_colored_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_label_colored_wrap');
  nk_label_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_label_wrap');
  nk_labelf := MemoryGetProcAddress(aDLLHandle, 'nk_labelf');
  nk_labelf_colored := MemoryGetProcAddress(aDLLHandle, 'nk_labelf_colored');
  nk_labelf_colored_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_labelf_colored_wrap');
  nk_labelf_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_labelf_wrap');
  nk_labelfv := MemoryGetProcAddress(aDLLHandle, 'nk_labelfv');
  nk_labelfv_colored := MemoryGetProcAddress(aDLLHandle, 'nk_labelfv_colored');
  nk_labelfv_colored_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_labelfv_colored_wrap');
  nk_labelfv_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_labelfv_wrap');
  nk_layout_ratio_from_pixel := MemoryGetProcAddress(aDLLHandle, 'nk_layout_ratio_from_pixel');
  nk_layout_reset_min_row_height := MemoryGetProcAddress(aDLLHandle, 'nk_layout_reset_min_row_height');
  nk_layout_row := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row');
  nk_layout_row_begin := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_begin');
  nk_layout_row_dynamic := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_dynamic');
  nk_layout_row_end := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_end');
  nk_layout_row_push := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_push');
  nk_layout_row_static := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_static');
  nk_layout_row_template_begin := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_template_begin');
  nk_layout_row_template_end := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_template_end');
  nk_layout_row_template_push_dynamic := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_template_push_dynamic');
  nk_layout_row_template_push_static := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_template_push_static');
  nk_layout_row_template_push_variable := MemoryGetProcAddress(aDLLHandle, 'nk_layout_row_template_push_variable');
  nk_layout_set_min_row_height := MemoryGetProcAddress(aDLLHandle, 'nk_layout_set_min_row_height');
  nk_layout_space_begin := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_begin');
  nk_layout_space_bounds := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_bounds');
  nk_layout_space_end := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_end');
  nk_layout_space_push := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_push');
  nk_layout_space_rect_to_local := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_rect_to_local');
  nk_layout_space_rect_to_screen := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_rect_to_screen');
  nk_layout_space_to_local := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_to_local');
  nk_layout_space_to_screen := MemoryGetProcAddress(aDLLHandle, 'nk_layout_space_to_screen');
  nk_layout_widget_bounds := MemoryGetProcAddress(aDLLHandle, 'nk_layout_widget_bounds');
  nk_list_view_begin := MemoryGetProcAddress(aDLLHandle, 'nk_list_view_begin');
  nk_list_view_end := MemoryGetProcAddress(aDLLHandle, 'nk_list_view_end');
  nk_menu_begin_image := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_image');
  nk_menu_begin_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_image_label');
  nk_menu_begin_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_image_text');
  nk_menu_begin_label := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_label');
  nk_menu_begin_symbol := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_symbol');
  nk_menu_begin_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_symbol_label');
  nk_menu_begin_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_symbol_text');
  nk_menu_begin_text := MemoryGetProcAddress(aDLLHandle, 'nk_menu_begin_text');
  nk_menu_close := MemoryGetProcAddress(aDLLHandle, 'nk_menu_close');
  nk_menu_end := MemoryGetProcAddress(aDLLHandle, 'nk_menu_end');
  nk_menu_item_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_menu_item_image_label');
  nk_menu_item_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_menu_item_image_text');
  nk_menu_item_label := MemoryGetProcAddress(aDLLHandle, 'nk_menu_item_label');
  nk_menu_item_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_menu_item_symbol_label');
  nk_menu_item_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_menu_item_symbol_text');
  nk_menu_item_text := MemoryGetProcAddress(aDLLHandle, 'nk_menu_item_text');
  nk_menubar_begin := MemoryGetProcAddress(aDLLHandle, 'nk_menubar_begin');
  nk_menubar_end := MemoryGetProcAddress(aDLLHandle, 'nk_menubar_end');
  nk_murmur_hash := MemoryGetProcAddress(aDLLHandle, 'nk_murmur_hash');
  nk_nine_slice_handle := MemoryGetProcAddress(aDLLHandle, 'nk_nine_slice_handle');
  nk_nine_slice_id := MemoryGetProcAddress(aDLLHandle, 'nk_nine_slice_id');
  nk_nine_slice_is_sub9slice := MemoryGetProcAddress(aDLLHandle, 'nk_nine_slice_is_sub9slice');
  nk_nine_slice_ptr := MemoryGetProcAddress(aDLLHandle, 'nk_nine_slice_ptr');
  nk_option_label := MemoryGetProcAddress(aDLLHandle, 'nk_option_label');
  nk_option_text := MemoryGetProcAddress(aDLLHandle, 'nk_option_text');
  nk_plot := MemoryGetProcAddress(aDLLHandle, 'nk_plot');
  nk_plot_function := MemoryGetProcAddress(aDLLHandle, 'nk_plot_function');
  nk_popup_begin := MemoryGetProcAddress(aDLLHandle, 'nk_popup_begin');
  nk_popup_close := MemoryGetProcAddress(aDLLHandle, 'nk_popup_close');
  nk_popup_end := MemoryGetProcAddress(aDLLHandle, 'nk_popup_end');
  nk_popup_get_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_popup_get_scroll');
  nk_popup_set_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_popup_set_scroll');
  nk_prog := MemoryGetProcAddress(aDLLHandle, 'nk_prog');
  nk_progress := MemoryGetProcAddress(aDLLHandle, 'nk_progress');
  nk_property_double := MemoryGetProcAddress(aDLLHandle, 'nk_property_double');
  nk_property_float := MemoryGetProcAddress(aDLLHandle, 'nk_property_float');
  nk_property_int := MemoryGetProcAddress(aDLLHandle, 'nk_property_int');
  nk_propertyd := MemoryGetProcAddress(aDLLHandle, 'nk_propertyd');
  nk_propertyf := MemoryGetProcAddress(aDLLHandle, 'nk_propertyf');
  nk_propertyi := MemoryGetProcAddress(aDLLHandle, 'nk_propertyi');
  nk_push_custom := MemoryGetProcAddress(aDLLHandle, 'nk_push_custom');
  nk_push_scissor := MemoryGetProcAddress(aDLLHandle, 'nk_push_scissor');
  nk_radio_label := MemoryGetProcAddress(aDLLHandle, 'nk_radio_label');
  nk_radio_text := MemoryGetProcAddress(aDLLHandle, 'nk_radio_text');
  nk_rect_pos := MemoryGetProcAddress(aDLLHandle, 'nk_rect_pos');
  nk_rect_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_rect');
  nk_rect_size := MemoryGetProcAddress(aDLLHandle, 'nk_rect_size');
  nk_recta := MemoryGetProcAddress(aDLLHandle, 'nk_recta');
  nk_recti_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_recti');
  nk_rectiv := MemoryGetProcAddress(aDLLHandle, 'nk_rectiv');
  nk_rectv := MemoryGetProcAddress(aDLLHandle, 'nk_rectv');
  nk_rgb_bv := MemoryGetProcAddress(aDLLHandle, 'nk_rgb_bv');
  nk_rgb_cf := MemoryGetProcAddress(aDLLHandle, 'nk_rgb_cf');
  nk_rgb_f := MemoryGetProcAddress(aDLLHandle, 'nk_rgb_f');
  nk_rgb_fv := MemoryGetProcAddress(aDLLHandle, 'nk_rgb_fv');
  nk_rgb_hex := MemoryGetProcAddress(aDLLHandle, 'nk_rgb_hex');
  nk_rgb_iv := MemoryGetProcAddress(aDLLHandle, 'nk_rgb_iv');
  nk_rgb_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_rgb');
  nk_rgba_bv := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_bv');
  nk_rgba_cf := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_cf');
  nk_rgba_f := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_f');
  nk_rgba_fv := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_fv');
  nk_rgba_hex := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_hex');
  nk_rgba_iv := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_iv');
  nk_rgba_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_rgba');
  nk_rgba_u32 := MemoryGetProcAddress(aDLLHandle, 'nk_rgba_u32');
  nk_sdl_font_stash_begin := MemoryGetProcAddress(aDLLHandle, 'nk_sdl_font_stash_begin');
  nk_sdl_font_stash_end := MemoryGetProcAddress(aDLLHandle, 'nk_sdl_font_stash_end');
  nk_sdl_handle_event := MemoryGetProcAddress(aDLLHandle, 'nk_sdl_handle_event');
  nk_sdl_init := MemoryGetProcAddress(aDLLHandle, 'nk_sdl_init');
  nk_sdl_render := MemoryGetProcAddress(aDLLHandle, 'nk_sdl_render');
  nk_sdl_shutdown := MemoryGetProcAddress(aDLLHandle, 'nk_sdl_shutdown');
  nk_select_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_select_image_label');
  nk_select_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_select_image_text');
  nk_select_label := MemoryGetProcAddress(aDLLHandle, 'nk_select_label');
  nk_select_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_select_symbol_label');
  nk_select_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_select_symbol_text');
  nk_select_text := MemoryGetProcAddress(aDLLHandle, 'nk_select_text');
  nk_selectable_image_label := MemoryGetProcAddress(aDLLHandle, 'nk_selectable_image_label');
  nk_selectable_image_text := MemoryGetProcAddress(aDLLHandle, 'nk_selectable_image_text');
  nk_selectable_label := MemoryGetProcAddress(aDLLHandle, 'nk_selectable_label');
  nk_selectable_symbol_label := MemoryGetProcAddress(aDLLHandle, 'nk_selectable_symbol_label');
  nk_selectable_symbol_text := MemoryGetProcAddress(aDLLHandle, 'nk_selectable_symbol_text');
  nk_selectable_text := MemoryGetProcAddress(aDLLHandle, 'nk_selectable_text');
  nk_slide_float := MemoryGetProcAddress(aDLLHandle, 'nk_slide_float');
  nk_slide_int := MemoryGetProcAddress(aDLLHandle, 'nk_slide_int');
  nk_slider_float := MemoryGetProcAddress(aDLLHandle, 'nk_slider_float');
  nk_slider_int := MemoryGetProcAddress(aDLLHandle, 'nk_slider_int');
  nk_spacer := MemoryGetProcAddress(aDLLHandle, 'nk_spacer');
  nk_spacing := MemoryGetProcAddress(aDLLHandle, 'nk_spacing');
  nk_str_append_str_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_append_str_char');
  nk_str_append_str_runes := MemoryGetProcAddress(aDLLHandle, 'nk_str_append_str_runes');
  nk_str_append_str_utf8 := MemoryGetProcAddress(aDLLHandle, 'nk_str_append_str_utf8');
  nk_str_append_text_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_append_text_char');
  nk_str_append_text_runes := MemoryGetProcAddress(aDLLHandle, 'nk_str_append_text_runes');
  nk_str_append_text_utf8 := MemoryGetProcAddress(aDLLHandle, 'nk_str_append_text_utf8');
  nk_str_at_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_at_char');
  nk_str_at_char_const := MemoryGetProcAddress(aDLLHandle, 'nk_str_at_char_const');
  nk_str_at_const := MemoryGetProcAddress(aDLLHandle, 'nk_str_at_const');
  nk_str_at_rune := MemoryGetProcAddress(aDLLHandle, 'nk_str_at_rune');
  nk_str_clear := MemoryGetProcAddress(aDLLHandle, 'nk_str_clear');
  nk_str_delete_chars := MemoryGetProcAddress(aDLLHandle, 'nk_str_delete_chars');
  nk_str_delete_runes := MemoryGetProcAddress(aDLLHandle, 'nk_str_delete_runes');
  nk_str_free := MemoryGetProcAddress(aDLLHandle, 'nk_str_free');
  nk_str_get := MemoryGetProcAddress(aDLLHandle, 'nk_str_get');
  nk_str_get_const := MemoryGetProcAddress(aDLLHandle, 'nk_str_get_const');
  nk_str_init := MemoryGetProcAddress(aDLLHandle, 'nk_str_init');
  nk_str_init_default := MemoryGetProcAddress(aDLLHandle, 'nk_str_init_default');
  nk_str_init_fixed := MemoryGetProcAddress(aDLLHandle, 'nk_str_init_fixed');
  nk_str_insert_at_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_at_char');
  nk_str_insert_at_rune := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_at_rune');
  nk_str_insert_str_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_str_char');
  nk_str_insert_str_runes := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_str_runes');
  nk_str_insert_str_utf8 := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_str_utf8');
  nk_str_insert_text_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_text_char');
  nk_str_insert_text_runes := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_text_runes');
  nk_str_insert_text_utf8 := MemoryGetProcAddress(aDLLHandle, 'nk_str_insert_text_utf8');
  nk_str_len := MemoryGetProcAddress(aDLLHandle, 'nk_str_len');
  nk_str_len_char := MemoryGetProcAddress(aDLLHandle, 'nk_str_len_char');
  nk_str_remove_chars := MemoryGetProcAddress(aDLLHandle, 'nk_str_remove_chars');
  nk_str_remove_runes := MemoryGetProcAddress(aDLLHandle, 'nk_str_remove_runes');
  nk_str_rune_at := MemoryGetProcAddress(aDLLHandle, 'nk_str_rune_at');
  nk_strfilter := MemoryGetProcAddress(aDLLHandle, 'nk_strfilter');
  nk_stricmp := MemoryGetProcAddress(aDLLHandle, 'nk_stricmp');
  nk_stricmpn := MemoryGetProcAddress(aDLLHandle, 'nk_stricmpn');
  nk_strlen := MemoryGetProcAddress(aDLLHandle, 'nk_strlen');
  nk_strmatch_fuzzy_string := MemoryGetProcAddress(aDLLHandle, 'nk_strmatch_fuzzy_string');
  nk_strmatch_fuzzy_text := MemoryGetProcAddress(aDLLHandle, 'nk_strmatch_fuzzy_text');
  nk_stroke_arc := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_arc');
  nk_stroke_circle := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_circle');
  nk_stroke_curve := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_curve');
  nk_stroke_line := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_line');
  nk_stroke_polygon := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_polygon');
  nk_stroke_polyline := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_polyline');
  nk_stroke_rect := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_rect');
  nk_stroke_triangle := MemoryGetProcAddress(aDLLHandle, 'nk_stroke_triangle');
  nk_strtod := MemoryGetProcAddress(aDLLHandle, 'nk_strtod');
  nk_strtof := MemoryGetProcAddress(aDLLHandle, 'nk_strtof');
  nk_strtoi := MemoryGetProcAddress(aDLLHandle, 'nk_strtoi');
  nk_style_default := MemoryGetProcAddress(aDLLHandle, 'nk_style_default');
  nk_style_from_table := MemoryGetProcAddress(aDLLHandle, 'nk_style_from_table');
  nk_style_get_color_by_name := MemoryGetProcAddress(aDLLHandle, 'nk_style_get_color_by_name');
  nk_style_hide_cursor := MemoryGetProcAddress(aDLLHandle, 'nk_style_hide_cursor');
  nk_style_item_color_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_style_item_color');
  nk_style_item_hide := MemoryGetProcAddress(aDLLHandle, 'nk_style_item_hide');
  nk_style_item_image_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_style_item_image');
  nk_style_item_nine_slice_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_style_item_nine_slice');
  nk_style_load_all_cursors := MemoryGetProcAddress(aDLLHandle, 'nk_style_load_all_cursors');
  nk_style_load_cursor := MemoryGetProcAddress(aDLLHandle, 'nk_style_load_cursor');
  nk_style_pop_color := MemoryGetProcAddress(aDLLHandle, 'nk_style_pop_color');
  nk_style_pop_flags := MemoryGetProcAddress(aDLLHandle, 'nk_style_pop_flags');
  nk_style_pop_float := MemoryGetProcAddress(aDLLHandle, 'nk_style_pop_float');
  nk_style_pop_font := MemoryGetProcAddress(aDLLHandle, 'nk_style_pop_font');
  nk_style_pop_style_item := MemoryGetProcAddress(aDLLHandle, 'nk_style_pop_style_item');
  nk_style_pop_vec2 := MemoryGetProcAddress(aDLLHandle, 'nk_style_pop_vec2');
  nk_style_push_color := MemoryGetProcAddress(aDLLHandle, 'nk_style_push_color');
  nk_style_push_flags := MemoryGetProcAddress(aDLLHandle, 'nk_style_push_flags');
  nk_style_push_float := MemoryGetProcAddress(aDLLHandle, 'nk_style_push_float');
  nk_style_push_font := MemoryGetProcAddress(aDLLHandle, 'nk_style_push_font');
  nk_style_push_style_item := MemoryGetProcAddress(aDLLHandle, 'nk_style_push_style_item');
  nk_style_push_vec2 := MemoryGetProcAddress(aDLLHandle, 'nk_style_push_vec2');
  nk_style_set_cursor := MemoryGetProcAddress(aDLLHandle, 'nk_style_set_cursor');
  nk_style_set_font := MemoryGetProcAddress(aDLLHandle, 'nk_style_set_font');
  nk_style_show_cursor := MemoryGetProcAddress(aDLLHandle, 'nk_style_show_cursor');
  nk_sub9slice_handle := MemoryGetProcAddress(aDLLHandle, 'nk_sub9slice_handle');
  nk_sub9slice_id := MemoryGetProcAddress(aDLLHandle, 'nk_sub9slice_id');
  nk_sub9slice_ptr := MemoryGetProcAddress(aDLLHandle, 'nk_sub9slice_ptr');
  nk_subimage_handle := MemoryGetProcAddress(aDLLHandle, 'nk_subimage_handle');
  nk_subimage_id := MemoryGetProcAddress(aDLLHandle, 'nk_subimage_id');
  nk_subimage_ptr := MemoryGetProcAddress(aDLLHandle, 'nk_subimage_ptr');
  nk_text := MemoryGetProcAddress(aDLLHandle, 'nk_text');
  nk_text_colored := MemoryGetProcAddress(aDLLHandle, 'nk_text_colored');
  nk_text_wrap := MemoryGetProcAddress(aDLLHandle, 'nk_text_wrap');
  nk_text_wrap_colored := MemoryGetProcAddress(aDLLHandle, 'nk_text_wrap_colored');
  nk_textedit_cut := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_cut');
  nk_textedit_delete := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_delete');
  nk_textedit_delete_selection := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_delete_selection');
  nk_textedit_free := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_free');
  nk_textedit_init := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_init');
  nk_textedit_init_default := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_init_default');
  nk_textedit_init_fixed := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_init_fixed');
  nk_textedit_paste := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_paste');
  nk_textedit_redo := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_redo');
  nk_textedit_select_all := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_select_all');
  nk_textedit_text := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_text');
  nk_textedit_undo := MemoryGetProcAddress(aDLLHandle, 'nk_textedit_undo');
  nk_tooltip := MemoryGetProcAddress(aDLLHandle, 'nk_tooltip');
  nk_tooltip_begin := MemoryGetProcAddress(aDLLHandle, 'nk_tooltip_begin');
  nk_tooltip_end := MemoryGetProcAddress(aDLLHandle, 'nk_tooltip_end');
  nk_tooltipf := MemoryGetProcAddress(aDLLHandle, 'nk_tooltipf');
  nk_tooltipfv := MemoryGetProcAddress(aDLLHandle, 'nk_tooltipfv');
  nk_tree_element_image_push_hashed := MemoryGetProcAddress(aDLLHandle, 'nk_tree_element_image_push_hashed');
  nk_tree_element_pop := MemoryGetProcAddress(aDLLHandle, 'nk_tree_element_pop');
  nk_tree_element_push_hashed := MemoryGetProcAddress(aDLLHandle, 'nk_tree_element_push_hashed');
  nk_tree_image_push_hashed := MemoryGetProcAddress(aDLLHandle, 'nk_tree_image_push_hashed');
  nk_tree_pop := MemoryGetProcAddress(aDLLHandle, 'nk_tree_pop');
  nk_tree_push_hashed := MemoryGetProcAddress(aDLLHandle, 'nk_tree_push_hashed');
  nk_tree_state_image_push := MemoryGetProcAddress(aDLLHandle, 'nk_tree_state_image_push');
  nk_tree_state_pop := MemoryGetProcAddress(aDLLHandle, 'nk_tree_state_pop');
  nk_tree_state_push := MemoryGetProcAddress(aDLLHandle, 'nk_tree_state_push');
  nk_triangle_from_direction := MemoryGetProcAddress(aDLLHandle, 'nk_triangle_from_direction');
  nk_utf_at := MemoryGetProcAddress(aDLLHandle, 'nk_utf_at');
  nk_utf_decode := MemoryGetProcAddress(aDLLHandle, 'nk_utf_decode');
  nk_utf_encode := MemoryGetProcAddress(aDLLHandle, 'nk_utf_encode');
  nk_utf_len := MemoryGetProcAddress(aDLLHandle, 'nk_utf_len');
  nk_value_bool := MemoryGetProcAddress(aDLLHandle, 'nk_value_bool');
  nk_value_color_byte := MemoryGetProcAddress(aDLLHandle, 'nk_value_color_byte');
  nk_value_color_float := MemoryGetProcAddress(aDLLHandle, 'nk_value_color_float');
  nk_value_color_hex := MemoryGetProcAddress(aDLLHandle, 'nk_value_color_hex');
  nk_value_float := MemoryGetProcAddress(aDLLHandle, 'nk_value_float');
  nk_value_int := MemoryGetProcAddress(aDLLHandle, 'nk_value_int');
  nk_value_uint := MemoryGetProcAddress(aDLLHandle, 'nk_value_uint');
  nk_vec2_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_vec2');
  nk_vec2i_rtn := MemoryGetProcAddress(aDLLHandle, 'nk_vec2i');
  nk_vec2iv := MemoryGetProcAddress(aDLLHandle, 'nk_vec2iv');
  nk_vec2v := MemoryGetProcAddress(aDLLHandle, 'nk_vec2v');
  nk_widget := MemoryGetProcAddress(aDLLHandle, 'nk_widget');
  nk_widget_bounds := MemoryGetProcAddress(aDLLHandle, 'nk_widget_bounds');
  nk_widget_fitting := MemoryGetProcAddress(aDLLHandle, 'nk_widget_fitting');
  nk_widget_has_mouse_click_down := MemoryGetProcAddress(aDLLHandle, 'nk_widget_has_mouse_click_down');
  nk_widget_height := MemoryGetProcAddress(aDLLHandle, 'nk_widget_height');
  nk_widget_is_hovered := MemoryGetProcAddress(aDLLHandle, 'nk_widget_is_hovered');
  nk_widget_is_mouse_clicked := MemoryGetProcAddress(aDLLHandle, 'nk_widget_is_mouse_clicked');
  nk_widget_position := MemoryGetProcAddress(aDLLHandle, 'nk_widget_position');
  nk_widget_size := MemoryGetProcAddress(aDLLHandle, 'nk_widget_size');
  nk_widget_width := MemoryGetProcAddress(aDLLHandle, 'nk_widget_width');
  nk_window_close := MemoryGetProcAddress(aDLLHandle, 'nk_window_close');
  nk_window_collapse := MemoryGetProcAddress(aDLLHandle, 'nk_window_collapse');
  nk_window_collapse_if := MemoryGetProcAddress(aDLLHandle, 'nk_window_collapse_if');
  nk_window_find := MemoryGetProcAddress(aDLLHandle, 'nk_window_find');
  nk_window_get_bounds := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_bounds');
  nk_window_get_canvas := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_canvas');
  nk_window_get_content_region := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_content_region');
  nk_window_get_content_region_max := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_content_region_max');
  nk_window_get_content_region_min := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_content_region_min');
  nk_window_get_content_region_size := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_content_region_size');
  nk_window_get_height := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_height');
  nk_window_get_panel := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_panel');
  nk_window_get_position := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_position');
  nk_window_get_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_scroll');
  nk_window_get_size := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_size');
  nk_window_get_width := MemoryGetProcAddress(aDLLHandle, 'nk_window_get_width');
  nk_window_has_focus := MemoryGetProcAddress(aDLLHandle, 'nk_window_has_focus');
  nk_window_is_active := MemoryGetProcAddress(aDLLHandle, 'nk_window_is_active');
  nk_window_is_any_hovered := MemoryGetProcAddress(aDLLHandle, 'nk_window_is_any_hovered');
  nk_window_is_closed := MemoryGetProcAddress(aDLLHandle, 'nk_window_is_closed');
  nk_window_is_collapsed := MemoryGetProcAddress(aDLLHandle, 'nk_window_is_collapsed');
  nk_window_is_hidden := MemoryGetProcAddress(aDLLHandle, 'nk_window_is_hidden');
  nk_window_is_hovered := MemoryGetProcAddress(aDLLHandle, 'nk_window_is_hovered');
  nk_window_set_bounds := MemoryGetProcAddress(aDLLHandle, 'nk_window_set_bounds');
  nk_window_set_focus := MemoryGetProcAddress(aDLLHandle, 'nk_window_set_focus');
  nk_window_set_position := MemoryGetProcAddress(aDLLHandle, 'nk_window_set_position');
  nk_window_set_scroll := MemoryGetProcAddress(aDLLHandle, 'nk_window_set_scroll');
  nk_window_set_size := MemoryGetProcAddress(aDLLHandle, 'nk_window_set_size');
  nk_window_show := MemoryGetProcAddress(aDLLHandle, 'nk_window_show');
  nk_window_show_if := MemoryGetProcAddress(aDLLHandle, 'nk_window_show_if');
  plm_audio_create_with_buffer := MemoryGetProcAddress(aDLLHandle, 'plm_audio_create_with_buffer');
  plm_audio_decode := MemoryGetProcAddress(aDLLHandle, 'plm_audio_decode');
  plm_audio_destroy := MemoryGetProcAddress(aDLLHandle, 'plm_audio_destroy');
  plm_audio_get_samplerate := MemoryGetProcAddress(aDLLHandle, 'plm_audio_get_samplerate');
  plm_audio_get_time := MemoryGetProcAddress(aDLLHandle, 'plm_audio_get_time');
  plm_audio_has_ended := MemoryGetProcAddress(aDLLHandle, 'plm_audio_has_ended');
  plm_audio_has_header := MemoryGetProcAddress(aDLLHandle, 'plm_audio_has_header');
  plm_audio_rewind := MemoryGetProcAddress(aDLLHandle, 'plm_audio_rewind');
  plm_audio_set_time := MemoryGetProcAddress(aDLLHandle, 'plm_audio_set_time');
  plm_buffer_create_for_appending := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_create_for_appending');
  plm_buffer_create_with_capacity := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_create_with_capacity');
  plm_buffer_create_with_file := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_create_with_file');
  plm_buffer_create_with_filename := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_create_with_filename');
  plm_buffer_create_with_memory := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_create_with_memory');
  plm_buffer_destroy := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_destroy');
  plm_buffer_get_remaining := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_get_remaining');
  plm_buffer_get_size := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_get_size');
  plm_buffer_has_ended := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_has_ended');
  plm_buffer_rewind := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_rewind');
  plm_buffer_set_load_callback := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_set_load_callback');
  plm_buffer_signal_end := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_signal_end');
  plm_buffer_write := MemoryGetProcAddress(aDLLHandle, 'plm_buffer_write');
  plm_create_with_buffer := MemoryGetProcAddress(aDLLHandle, 'plm_create_with_buffer');
  plm_create_with_file := MemoryGetProcAddress(aDLLHandle, 'plm_create_with_file');
  plm_create_with_filename := MemoryGetProcAddress(aDLLHandle, 'plm_create_with_filename');
  plm_create_with_memory := MemoryGetProcAddress(aDLLHandle, 'plm_create_with_memory');
  plm_decode := MemoryGetProcAddress(aDLLHandle, 'plm_decode');
  plm_decode_audio := MemoryGetProcAddress(aDLLHandle, 'plm_decode_audio');
  plm_decode_video := MemoryGetProcAddress(aDLLHandle, 'plm_decode_video');
  plm_demux_create := MemoryGetProcAddress(aDLLHandle, 'plm_demux_create');
  plm_demux_decode := MemoryGetProcAddress(aDLLHandle, 'plm_demux_decode');
  plm_demux_destroy := MemoryGetProcAddress(aDLLHandle, 'plm_demux_destroy');
  plm_demux_get_duration := MemoryGetProcAddress(aDLLHandle, 'plm_demux_get_duration');
  plm_demux_get_num_audio_streams := MemoryGetProcAddress(aDLLHandle, 'plm_demux_get_num_audio_streams');
  plm_demux_get_num_video_streams := MemoryGetProcAddress(aDLLHandle, 'plm_demux_get_num_video_streams');
  plm_demux_get_start_time := MemoryGetProcAddress(aDLLHandle, 'plm_demux_get_start_time');
  plm_demux_has_ended := MemoryGetProcAddress(aDLLHandle, 'plm_demux_has_ended');
  plm_demux_has_headers := MemoryGetProcAddress(aDLLHandle, 'plm_demux_has_headers');
  plm_demux_rewind := MemoryGetProcAddress(aDLLHandle, 'plm_demux_rewind');
  plm_demux_seek := MemoryGetProcAddress(aDLLHandle, 'plm_demux_seek');
  plm_destroy := MemoryGetProcAddress(aDLLHandle, 'plm_destroy');
  plm_frame_to_abgr := MemoryGetProcAddress(aDLLHandle, 'plm_frame_to_abgr');
  plm_frame_to_argb := MemoryGetProcAddress(aDLLHandle, 'plm_frame_to_argb');
  plm_frame_to_bgr := MemoryGetProcAddress(aDLLHandle, 'plm_frame_to_bgr');
  plm_frame_to_bgra := MemoryGetProcAddress(aDLLHandle, 'plm_frame_to_bgra');
  plm_frame_to_rgb := MemoryGetProcAddress(aDLLHandle, 'plm_frame_to_rgb');
  plm_frame_to_rgba := MemoryGetProcAddress(aDLLHandle, 'plm_frame_to_rgba');
  plm_get_audio_enabled := MemoryGetProcAddress(aDLLHandle, 'plm_get_audio_enabled');
  plm_get_audio_lead_time := MemoryGetProcAddress(aDLLHandle, 'plm_get_audio_lead_time');
  plm_get_duration := MemoryGetProcAddress(aDLLHandle, 'plm_get_duration');
  plm_get_framerate := MemoryGetProcAddress(aDLLHandle, 'plm_get_framerate');
  plm_get_height := MemoryGetProcAddress(aDLLHandle, 'plm_get_height');
  plm_get_loop := MemoryGetProcAddress(aDLLHandle, 'plm_get_loop');
  plm_get_num_audio_streams := MemoryGetProcAddress(aDLLHandle, 'plm_get_num_audio_streams');
  plm_get_num_video_streams := MemoryGetProcAddress(aDLLHandle, 'plm_get_num_video_streams');
  plm_get_samplerate := MemoryGetProcAddress(aDLLHandle, 'plm_get_samplerate');
  plm_get_time := MemoryGetProcAddress(aDLLHandle, 'plm_get_time');
  plm_get_video_enabled := MemoryGetProcAddress(aDLLHandle, 'plm_get_video_enabled');
  plm_get_width := MemoryGetProcAddress(aDLLHandle, 'plm_get_width');
  plm_has_ended := MemoryGetProcAddress(aDLLHandle, 'plm_has_ended');
  plm_has_headers := MemoryGetProcAddress(aDLLHandle, 'plm_has_headers');
  plm_rewind := MemoryGetProcAddress(aDLLHandle, 'plm_rewind');
  plm_seek := MemoryGetProcAddress(aDLLHandle, 'plm_seek');
  plm_seek_frame := MemoryGetProcAddress(aDLLHandle, 'plm_seek_frame');
  plm_set_audio_decode_callback := MemoryGetProcAddress(aDLLHandle, 'plm_set_audio_decode_callback');
  plm_set_audio_enabled := MemoryGetProcAddress(aDLLHandle, 'plm_set_audio_enabled');
  plm_set_audio_lead_time := MemoryGetProcAddress(aDLLHandle, 'plm_set_audio_lead_time');
  plm_set_audio_stream := MemoryGetProcAddress(aDLLHandle, 'plm_set_audio_stream');
  plm_set_loop := MemoryGetProcAddress(aDLLHandle, 'plm_set_loop');
  plm_set_video_decode_callback := MemoryGetProcAddress(aDLLHandle, 'plm_set_video_decode_callback');
  plm_set_video_enabled := MemoryGetProcAddress(aDLLHandle, 'plm_set_video_enabled');
  plm_video_create_with_buffer := MemoryGetProcAddress(aDLLHandle, 'plm_video_create_with_buffer');
  plm_video_decode := MemoryGetProcAddress(aDLLHandle, 'plm_video_decode');
  plm_video_destroy := MemoryGetProcAddress(aDLLHandle, 'plm_video_destroy');
  plm_video_get_framerate := MemoryGetProcAddress(aDLLHandle, 'plm_video_get_framerate');
  plm_video_get_height := MemoryGetProcAddress(aDLLHandle, 'plm_video_get_height');
  plm_video_get_time := MemoryGetProcAddress(aDLLHandle, 'plm_video_get_time');
  plm_video_get_width := MemoryGetProcAddress(aDLLHandle, 'plm_video_get_width');
  plm_video_has_ended := MemoryGetProcAddress(aDLLHandle, 'plm_video_has_ended');
  plm_video_has_header := MemoryGetProcAddress(aDLLHandle, 'plm_video_has_header');
  plm_video_rewind := MemoryGetProcAddress(aDLLHandle, 'plm_video_rewind');
  plm_video_set_no_delay := MemoryGetProcAddress(aDLLHandle, 'plm_video_set_no_delay');
  plm_video_set_time := MemoryGetProcAddress(aDLLHandle, 'plm_video_set_time');
  SDL_abs := MemoryGetProcAddress(aDLLHandle, 'SDL_abs');
  SDL_acos := MemoryGetProcAddress(aDLLHandle, 'SDL_acos');
  SDL_acosf := MemoryGetProcAddress(aDLLHandle, 'SDL_acosf');
  SDL_AddEventWatch := MemoryGetProcAddress(aDLLHandle, 'SDL_AddEventWatch');
  SDL_AddHintCallback := MemoryGetProcAddress(aDLLHandle, 'SDL_AddHintCallback');
  SDL_AddTimer := MemoryGetProcAddress(aDLLHandle, 'SDL_AddTimer');
  SDL_AllocFormat := MemoryGetProcAddress(aDLLHandle, 'SDL_AllocFormat');
  SDL_AllocPalette := MemoryGetProcAddress(aDLLHandle, 'SDL_AllocPalette');
  SDL_AllocRW := MemoryGetProcAddress(aDLLHandle, 'SDL_AllocRW');
  SDL_asin := MemoryGetProcAddress(aDLLHandle, 'SDL_asin');
  SDL_asinf := MemoryGetProcAddress(aDLLHandle, 'SDL_asinf');
  SDL_asprintf := MemoryGetProcAddress(aDLLHandle, 'SDL_asprintf');
  SDL_atan := MemoryGetProcAddress(aDLLHandle, 'SDL_atan');
  SDL_atan2 := MemoryGetProcAddress(aDLLHandle, 'SDL_atan2');
  SDL_atan2f := MemoryGetProcAddress(aDLLHandle, 'SDL_atan2f');
  SDL_atanf := MemoryGetProcAddress(aDLLHandle, 'SDL_atanf');
  SDL_atof := MemoryGetProcAddress(aDLLHandle, 'SDL_atof');
  SDL_atoi := MemoryGetProcAddress(aDLLHandle, 'SDL_atoi');
  SDL_AtomicAdd := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicAdd');
  SDL_AtomicCAS := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicCAS');
  SDL_AtomicCASPtr := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicCASPtr');
  SDL_AtomicGet := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicGet');
  SDL_AtomicGetPtr := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicGetPtr');
  SDL_AtomicLock := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicLock');
  SDL_AtomicSet := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicSet');
  SDL_AtomicSetPtr := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicSetPtr');
  SDL_AtomicTryLock := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicTryLock');
  SDL_AtomicUnlock := MemoryGetProcAddress(aDLLHandle, 'SDL_AtomicUnlock');
  SDL_AudioInit := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioInit');
  SDL_AudioQuit := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioQuit');
  SDL_AudioStreamAvailable := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioStreamAvailable');
  SDL_AudioStreamClear := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioStreamClear');
  SDL_AudioStreamFlush := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioStreamFlush');
  SDL_AudioStreamGet := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioStreamGet');
  SDL_AudioStreamPut := MemoryGetProcAddress(aDLLHandle, 'SDL_AudioStreamPut');
  SDL_bsearch := MemoryGetProcAddress(aDLLHandle, 'SDL_bsearch');
  SDL_BuildAudioCVT := MemoryGetProcAddress(aDLLHandle, 'SDL_BuildAudioCVT');
  SDL_CalculateGammaRamp := MemoryGetProcAddress(aDLLHandle, 'SDL_CalculateGammaRamp');
  SDL_calloc := MemoryGetProcAddress(aDLLHandle, 'SDL_calloc');
  SDL_CaptureMouse := MemoryGetProcAddress(aDLLHandle, 'SDL_CaptureMouse');
  SDL_ceil := MemoryGetProcAddress(aDLLHandle, 'SDL_ceil');
  SDL_ceilf := MemoryGetProcAddress(aDLLHandle, 'SDL_ceilf');
  SDL_ClearComposition := MemoryGetProcAddress(aDLLHandle, 'SDL_ClearComposition');
  SDL_ClearError := MemoryGetProcAddress(aDLLHandle, 'SDL_ClearError');
  SDL_ClearHints := MemoryGetProcAddress(aDLLHandle, 'SDL_ClearHints');
  SDL_ClearQueuedAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_ClearQueuedAudio');
  SDL_CloseAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_CloseAudio');
  SDL_CloseAudioDevice := MemoryGetProcAddress(aDLLHandle, 'SDL_CloseAudioDevice');
  SDL_ComposeCustomBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_ComposeCustomBlendMode');
  SDL_CondBroadcast := MemoryGetProcAddress(aDLLHandle, 'SDL_CondBroadcast');
  SDL_CondSignal := MemoryGetProcAddress(aDLLHandle, 'SDL_CondSignal');
  SDL_CondWait := MemoryGetProcAddress(aDLLHandle, 'SDL_CondWait');
  SDL_CondWaitTimeout := MemoryGetProcAddress(aDLLHandle, 'SDL_CondWaitTimeout');
  SDL_ConvertAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_ConvertAudio');
  SDL_ConvertPixels := MemoryGetProcAddress(aDLLHandle, 'SDL_ConvertPixels');
  SDL_ConvertSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_ConvertSurface');
  SDL_ConvertSurfaceFormat := MemoryGetProcAddress(aDLLHandle, 'SDL_ConvertSurfaceFormat');
  SDL_copysign := MemoryGetProcAddress(aDLLHandle, 'SDL_copysign');
  SDL_copysignf := MemoryGetProcAddress(aDLLHandle, 'SDL_copysignf');
  SDL_cos := MemoryGetProcAddress(aDLLHandle, 'SDL_cos');
  SDL_cosf := MemoryGetProcAddress(aDLLHandle, 'SDL_cosf');
  SDL_crc16 := MemoryGetProcAddress(aDLLHandle, 'SDL_crc16');
  SDL_crc32 := MemoryGetProcAddress(aDLLHandle, 'SDL_crc32');
  SDL_CreateColorCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateColorCursor');
  SDL_CreateCond := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateCond');
  SDL_CreateCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateCursor');
  SDL_CreateMutex := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateMutex');
  SDL_CreateRenderer := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateRenderer');
  SDL_CreateRGBSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateRGBSurface');
  SDL_CreateRGBSurfaceFrom := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateRGBSurfaceFrom');
  SDL_CreateRGBSurfaceWithFormat := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateRGBSurfaceWithFormat');
  SDL_CreateRGBSurfaceWithFormatFrom := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateRGBSurfaceWithFormatFrom');
  SDL_CreateSemaphore := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateSemaphore');
  SDL_CreateShapedWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateShapedWindow');
  SDL_CreateSoftwareRenderer := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateSoftwareRenderer');
  SDL_CreateSystemCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateSystemCursor');
  SDL_CreateTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateTexture');
  SDL_CreateTextureFromSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateTextureFromSurface');
  SDL_CreateThread := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateThread');
  SDL_CreateThreadWithStackSize := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateThreadWithStackSize');
  SDL_CreateWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateWindow');
  SDL_CreateWindowAndRenderer := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateWindowAndRenderer');
  SDL_CreateWindowFrom := MemoryGetProcAddress(aDLLHandle, 'SDL_CreateWindowFrom');
  SDL_Delay := MemoryGetProcAddress(aDLLHandle, 'SDL_Delay');
  SDL_DelEventWatch := MemoryGetProcAddress(aDLLHandle, 'SDL_DelEventWatch');
  SDL_DelHintCallback := MemoryGetProcAddress(aDLLHandle, 'SDL_DelHintCallback');
  SDL_DequeueAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_DequeueAudio');
  SDL_DestroyCond := MemoryGetProcAddress(aDLLHandle, 'SDL_DestroyCond');
  SDL_DestroyMutex := MemoryGetProcAddress(aDLLHandle, 'SDL_DestroyMutex');
  SDL_DestroyRenderer := MemoryGetProcAddress(aDLLHandle, 'SDL_DestroyRenderer');
  SDL_DestroySemaphore := MemoryGetProcAddress(aDLLHandle, 'SDL_DestroySemaphore');
  SDL_DestroyTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_DestroyTexture');
  SDL_DestroyWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_DestroyWindow');
  SDL_DetachThread := MemoryGetProcAddress(aDLLHandle, 'SDL_DetachThread');
  SDL_Direct3D9GetAdapterIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_Direct3D9GetAdapterIndex');
  SDL_DisableScreenSaver := MemoryGetProcAddress(aDLLHandle, 'SDL_DisableScreenSaver');
  SDL_DuplicateSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_DuplicateSurface');
  SDL_DXGIGetOutputInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_DXGIGetOutputInfo');
  SDL_EnableScreenSaver := MemoryGetProcAddress(aDLLHandle, 'SDL_EnableScreenSaver');
  SDL_EncloseFPoints := MemoryGetProcAddress(aDLLHandle, 'SDL_EncloseFPoints');
  SDL_EnclosePoints := MemoryGetProcAddress(aDLLHandle, 'SDL_EnclosePoints');
  SDL_Error := MemoryGetProcAddress(aDLLHandle, 'SDL_Error');
  SDL_EventState := MemoryGetProcAddress(aDLLHandle, 'SDL_EventState');
  SDL_exp := MemoryGetProcAddress(aDLLHandle, 'SDL_exp');
  SDL_expf := MemoryGetProcAddress(aDLLHandle, 'SDL_expf');
  SDL_fabs := MemoryGetProcAddress(aDLLHandle, 'SDL_fabs');
  SDL_fabsf := MemoryGetProcAddress(aDLLHandle, 'SDL_fabsf');
  SDL_FillRect := MemoryGetProcAddress(aDLLHandle, 'SDL_FillRect');
  SDL_FillRects := MemoryGetProcAddress(aDLLHandle, 'SDL_FillRects');
  SDL_FilterEvents := MemoryGetProcAddress(aDLLHandle, 'SDL_FilterEvents');
  SDL_FlashWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_FlashWindow');
  SDL_floor := MemoryGetProcAddress(aDLLHandle, 'SDL_floor');
  SDL_floorf := MemoryGetProcAddress(aDLLHandle, 'SDL_floorf');
  SDL_FlushEvent := MemoryGetProcAddress(aDLLHandle, 'SDL_FlushEvent');
  SDL_FlushEvents := MemoryGetProcAddress(aDLLHandle, 'SDL_FlushEvents');
  SDL_fmod := MemoryGetProcAddress(aDLLHandle, 'SDL_fmod');
  SDL_fmodf := MemoryGetProcAddress(aDLLHandle, 'SDL_fmodf');
  SDL_free := MemoryGetProcAddress(aDLLHandle, 'SDL_free');
  SDL_FreeAudioStream := MemoryGetProcAddress(aDLLHandle, 'SDL_FreeAudioStream');
  SDL_FreeCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_FreeCursor');
  SDL_FreeFormat := MemoryGetProcAddress(aDLLHandle, 'SDL_FreeFormat');
  SDL_FreePalette := MemoryGetProcAddress(aDLLHandle, 'SDL_FreePalette');
  SDL_FreeRW := MemoryGetProcAddress(aDLLHandle, 'SDL_FreeRW');
  SDL_FreeSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_FreeSurface');
  SDL_FreeWAV := MemoryGetProcAddress(aDLLHandle, 'SDL_FreeWAV');
  SDL_GameControllerAddMapping := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerAddMapping');
  SDL_GameControllerAddMappingsFromRW := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerAddMappingsFromRW');
  SDL_GameControllerClose := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerClose');
  SDL_GameControllerEventState := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerEventState');
  SDL_GameControllerFromInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerFromInstanceID');
  SDL_GameControllerFromPlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerFromPlayerIndex');
  SDL_GameControllerGetAppleSFSymbolsNameForAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetAppleSFSymbolsNameForAxis');
  SDL_GameControllerGetAppleSFSymbolsNameForButton := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetAppleSFSymbolsNameForButton');
  SDL_GameControllerGetAttached := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetAttached');
  SDL_GameControllerGetAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetAxis');
  SDL_GameControllerGetAxisFromString := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetAxisFromString');
  SDL_GameControllerGetBindForAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetBindForAxis');
  SDL_GameControllerGetBindForButton := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetBindForButton');
  SDL_GameControllerGetButton := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetButton');
  SDL_GameControllerGetButtonFromString := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetButtonFromString');
  SDL_GameControllerGetFirmwareVersion := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetFirmwareVersion');
  SDL_GameControllerGetJoystick := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetJoystick');
  SDL_GameControllerGetNumTouchpadFingers := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetNumTouchpadFingers');
  SDL_GameControllerGetNumTouchpads := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetNumTouchpads');
  SDL_GameControllerGetPlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetPlayerIndex');
  SDL_GameControllerGetProduct := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetProduct');
  SDL_GameControllerGetProductVersion := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetProductVersion');
  SDL_GameControllerGetSensorData := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetSensorData');
  SDL_GameControllerGetSensorDataRate := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetSensorDataRate');
  SDL_GameControllerGetSensorDataWithTimestamp := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetSensorDataWithTimestamp');
  SDL_GameControllerGetSerial := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetSerial');
  SDL_GameControllerGetStringForAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetStringForAxis');
  SDL_GameControllerGetStringForButton := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetStringForButton');
  SDL_GameControllerGetTouchpadFinger := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetTouchpadFinger');
  SDL_GameControllerGetType := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetType');
  SDL_GameControllerGetVendor := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerGetVendor');
  SDL_GameControllerHasAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerHasAxis');
  SDL_GameControllerHasButton := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerHasButton');
  SDL_GameControllerHasLED := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerHasLED');
  SDL_GameControllerHasRumble := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerHasRumble');
  SDL_GameControllerHasRumbleTriggers := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerHasRumbleTriggers');
  SDL_GameControllerHasSensor := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerHasSensor');
  SDL_GameControllerIsSensorEnabled := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerIsSensorEnabled');
  SDL_GameControllerMapping := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerMapping');
  SDL_GameControllerMappingForDeviceIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerMappingForDeviceIndex');
  SDL_GameControllerMappingForGUID := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerMappingForGUID');
  SDL_GameControllerMappingForIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerMappingForIndex');
  SDL_GameControllerName := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerName');
  SDL_GameControllerNameForIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerNameForIndex');
  SDL_GameControllerNumMappings := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerNumMappings');
  SDL_GameControllerOpen := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerOpen');
  SDL_GameControllerPath := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerPath');
  SDL_GameControllerPathForIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerPathForIndex');
  SDL_GameControllerRumble := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerRumble');
  SDL_GameControllerRumbleTriggers := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerRumbleTriggers');
  SDL_GameControllerSendEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerSendEffect');
  SDL_GameControllerSetLED := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerSetLED');
  SDL_GameControllerSetPlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerSetPlayerIndex');
  SDL_GameControllerSetSensorEnabled := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerSetSensorEnabled');
  SDL_GameControllerTypeForIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerTypeForIndex');
  SDL_GameControllerUpdate := MemoryGetProcAddress(aDLLHandle, 'SDL_GameControllerUpdate');
  SDL_GetAssertionHandler := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAssertionHandler');
  SDL_GetAssertionReport := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAssertionReport');
  SDL_GetAudioDeviceName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAudioDeviceName');
  SDL_GetAudioDeviceSpec := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAudioDeviceSpec');
  SDL_GetAudioDeviceStatus := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAudioDeviceStatus');
  SDL_GetAudioDriver := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAudioDriver');
  SDL_GetAudioStatus := MemoryGetProcAddress(aDLLHandle, 'SDL_GetAudioStatus');
  SDL_GetBasePath := MemoryGetProcAddress(aDLLHandle, 'SDL_GetBasePath');
  SDL_GetClipboardText := MemoryGetProcAddress(aDLLHandle, 'SDL_GetClipboardText');
  SDL_GetClipRect := MemoryGetProcAddress(aDLLHandle, 'SDL_GetClipRect');
  SDL_GetClosestDisplayMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetClosestDisplayMode');
  SDL_GetColorKey := MemoryGetProcAddress(aDLLHandle, 'SDL_GetColorKey');
  SDL_GetCPUCacheLineSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetCPUCacheLineSize');
  SDL_GetCPUCount := MemoryGetProcAddress(aDLLHandle, 'SDL_GetCPUCount');
  SDL_GetCurrentAudioDriver := MemoryGetProcAddress(aDLLHandle, 'SDL_GetCurrentAudioDriver');
  SDL_GetCurrentDisplayMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetCurrentDisplayMode');
  SDL_GetCurrentVideoDriver := MemoryGetProcAddress(aDLLHandle, 'SDL_GetCurrentVideoDriver');
  SDL_GetCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_GetCursor');
  SDL_GetDefaultAssertionHandler := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDefaultAssertionHandler');
  SDL_GetDefaultAudioInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDefaultAudioInfo');
  SDL_GetDefaultCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDefaultCursor');
  SDL_GetDesktopDisplayMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDesktopDisplayMode');
  SDL_GetDisplayBounds := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDisplayBounds');
  SDL_GetDisplayDPI := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDisplayDPI');
  SDL_GetDisplayMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDisplayMode');
  SDL_GetDisplayName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDisplayName');
  SDL_GetDisplayOrientation := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDisplayOrientation');
  SDL_GetDisplayUsableBounds := MemoryGetProcAddress(aDLLHandle, 'SDL_GetDisplayUsableBounds');
  SDL_getenv := MemoryGetProcAddress(aDLLHandle, 'SDL_getenv');
  SDL_GetError := MemoryGetProcAddress(aDLLHandle, 'SDL_GetError');
  SDL_GetErrorMsg := MemoryGetProcAddress(aDLLHandle, 'SDL_GetErrorMsg');
  SDL_GetEventFilter := MemoryGetProcAddress(aDLLHandle, 'SDL_GetEventFilter');
  SDL_GetGlobalMouseState := MemoryGetProcAddress(aDLLHandle, 'SDL_GetGlobalMouseState');
  SDL_GetGrabbedWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_GetGrabbedWindow');
  SDL_GetHint := MemoryGetProcAddress(aDLLHandle, 'SDL_GetHint');
  SDL_GetHintBoolean := MemoryGetProcAddress(aDLLHandle, 'SDL_GetHintBoolean');
  SDL_GetJoystickGUIDInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_GetJoystickGUIDInfo');
  SDL_GetKeyboardFocus := MemoryGetProcAddress(aDLLHandle, 'SDL_GetKeyboardFocus');
  SDL_GetKeyboardState := MemoryGetProcAddress(aDLLHandle, 'SDL_GetKeyboardState');
  SDL_GetKeyFromName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetKeyFromName');
  SDL_GetKeyFromScancode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetKeyFromScancode');
  SDL_GetKeyName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetKeyName');
  SDL_GetMemoryFunctions := MemoryGetProcAddress(aDLLHandle, 'SDL_GetMemoryFunctions');
  SDL_GetModState := MemoryGetProcAddress(aDLLHandle, 'SDL_GetModState');
  SDL_GetMouseFocus := MemoryGetProcAddress(aDLLHandle, 'SDL_GetMouseFocus');
  SDL_GetMouseState := MemoryGetProcAddress(aDLLHandle, 'SDL_GetMouseState');
  SDL_GetNumAllocations := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumAllocations');
  SDL_GetNumAudioDevices := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumAudioDevices');
  SDL_GetNumAudioDrivers := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumAudioDrivers');
  SDL_GetNumDisplayModes := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumDisplayModes');
  SDL_GetNumRenderDrivers := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumRenderDrivers');
  SDL_GetNumTouchDevices := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumTouchDevices');
  SDL_GetNumTouchFingers := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumTouchFingers');
  SDL_GetNumVideoDisplays := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumVideoDisplays');
  SDL_GetNumVideoDrivers := MemoryGetProcAddress(aDLLHandle, 'SDL_GetNumVideoDrivers');
  SDL_GetOriginalMemoryFunctions := MemoryGetProcAddress(aDLLHandle, 'SDL_GetOriginalMemoryFunctions');
  SDL_GetPerformanceCounter := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPerformanceCounter');
  SDL_GetPerformanceFrequency := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPerformanceFrequency');
  SDL_GetPixelFormatName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPixelFormatName');
  SDL_GetPlatform := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPlatform');
  SDL_GetPointDisplayIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPointDisplayIndex');
  SDL_GetPowerInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPowerInfo');
  SDL_GetPreferredLocales := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPreferredLocales');
  SDL_GetPrefPath := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPrefPath');
  SDL_GetPrimarySelectionText := MemoryGetProcAddress(aDLLHandle, 'SDL_GetPrimarySelectionText');
  SDL_GetQueuedAudioSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetQueuedAudioSize');
  SDL_GetRectDisplayIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRectDisplayIndex');
  SDL_GetRelativeMouseMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRelativeMouseMode');
  SDL_GetRelativeMouseState := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRelativeMouseState');
  SDL_GetRenderDrawBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRenderDrawBlendMode');
  SDL_GetRenderDrawColor := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRenderDrawColor');
  SDL_GetRenderDriverInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRenderDriverInfo');
  SDL_GetRenderer := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRenderer');
  SDL_GetRendererInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRendererInfo');
  SDL_GetRendererOutputSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRendererOutputSize');
  SDL_GetRenderTarget := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRenderTarget');
  SDL_GetRevision := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRevision');
  SDL_GetRevisionNumber := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRevisionNumber');
  SDL_GetRGB := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRGB');
  SDL_GetRGBA := MemoryGetProcAddress(aDLLHandle, 'SDL_GetRGBA');
  SDL_GetScancodeFromKey := MemoryGetProcAddress(aDLLHandle, 'SDL_GetScancodeFromKey');
  SDL_GetScancodeFromName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetScancodeFromName');
  SDL_GetScancodeName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetScancodeName');
  SDL_GetShapedWindowMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetShapedWindowMode');
  SDL_GetSurfaceAlphaMod := MemoryGetProcAddress(aDLLHandle, 'SDL_GetSurfaceAlphaMod');
  SDL_GetSurfaceBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetSurfaceBlendMode');
  SDL_GetSurfaceColorMod := MemoryGetProcAddress(aDLLHandle, 'SDL_GetSurfaceColorMod');
  SDL_GetSystemRAM := MemoryGetProcAddress(aDLLHandle, 'SDL_GetSystemRAM');
  SDL_GetTextureAlphaMod := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTextureAlphaMod');
  SDL_GetTextureBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTextureBlendMode');
  SDL_GetTextureColorMod := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTextureColorMod');
  SDL_GetTextureScaleMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTextureScaleMode');
  SDL_GetTextureUserData := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTextureUserData');
  SDL_GetThreadID := MemoryGetProcAddress(aDLLHandle, 'SDL_GetThreadID');
  SDL_GetThreadName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetThreadName');
  SDL_GetTicks := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTicks');
  SDL_GetTicks64 := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTicks64');
  SDL_GetTouchDevice := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTouchDevice');
  SDL_GetTouchDeviceType := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTouchDeviceType');
  SDL_GetTouchFinger := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTouchFinger');
  SDL_GetTouchName := MemoryGetProcAddress(aDLLHandle, 'SDL_GetTouchName');
  SDL_GetVersion := MemoryGetProcAddress(aDLLHandle, 'SDL_GetVersion');
  SDL_GetVideoDriver := MemoryGetProcAddress(aDLLHandle, 'SDL_GetVideoDriver');
  SDL_GetWindowBordersSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowBordersSize');
  SDL_GetWindowBrightness := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowBrightness');
  SDL_GetWindowData := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowData');
  SDL_GetWindowDisplayIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowDisplayIndex');
  SDL_GetWindowDisplayMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowDisplayMode');
  SDL_GetWindowFlags := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowFlags');
  SDL_GetWindowFromID := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowFromID');
  SDL_GetWindowGammaRamp := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowGammaRamp');
  SDL_GetWindowGrab := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowGrab');
  SDL_GetWindowICCProfile := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowICCProfile');
  SDL_GetWindowID := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowID');
  SDL_GetWindowKeyboardGrab := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowKeyboardGrab');
  SDL_GetWindowMaximumSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowMaximumSize');
  SDL_GetWindowMinimumSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowMinimumSize');
  SDL_GetWindowMouseGrab := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowMouseGrab');
  SDL_GetWindowMouseRect := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowMouseRect');
  SDL_GetWindowOpacity := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowOpacity');
  SDL_GetWindowPixelFormat := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowPixelFormat');
  SDL_GetWindowPosition := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowPosition');
  SDL_GetWindowSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowSize');
  SDL_GetWindowSizeInPixels := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowSizeInPixels');
  SDL_GetWindowSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowSurface');
  SDL_GetWindowTitle := MemoryGetProcAddress(aDLLHandle, 'SDL_GetWindowTitle');
  SDL_GetYUVConversionMode := MemoryGetProcAddress(aDLLHandle, 'SDL_GetYUVConversionMode');
  SDL_GetYUVConversionModeForResolution := MemoryGetProcAddress(aDLLHandle, 'SDL_GetYUVConversionModeForResolution');
  SDL_GL_BindTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_BindTexture');
  SDL_GL_CreateContext := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_CreateContext');
  SDL_GL_DeleteContext := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_DeleteContext');
  SDL_GL_ExtensionSupported := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_ExtensionSupported');
  SDL_GL_GetAttribute := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_GetAttribute');
  SDL_GL_GetCurrentContext := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_GetCurrentContext');
  SDL_GL_GetCurrentWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_GetCurrentWindow');
  SDL_GL_GetDrawableSize := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_GetDrawableSize');
  SDL_GL_GetProcAddress := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_GetProcAddress');
  SDL_GL_GetSwapInterval := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_GetSwapInterval');
  SDL_GL_LoadLibrary := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_LoadLibrary');
  SDL_GL_MakeCurrent := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_MakeCurrent');
  SDL_GL_ResetAttributes := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_ResetAttributes');
  SDL_GL_SetAttribute := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_SetAttribute');
  SDL_GL_SetSwapInterval := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_SetSwapInterval');
  SDL_GL_SwapWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_SwapWindow');
  SDL_GL_UnbindTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_UnbindTexture');
  SDL_GL_UnloadLibrary := MemoryGetProcAddress(aDLLHandle, 'SDL_GL_UnloadLibrary');
  SDL_GUIDFromString := MemoryGetProcAddress(aDLLHandle, 'SDL_GUIDFromString');
  SDL_GUIDToString := MemoryGetProcAddress(aDLLHandle, 'SDL_GUIDToString');
  SDL_HapticClose := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticClose');
  SDL_HapticDestroyEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticDestroyEffect');
  SDL_HapticEffectSupported := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticEffectSupported');
  SDL_HapticGetEffectStatus := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticGetEffectStatus');
  SDL_HapticIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticIndex');
  SDL_HapticName := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticName');
  SDL_HapticNewEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticNewEffect');
  SDL_HapticNumAxes := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticNumAxes');
  SDL_HapticNumEffects := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticNumEffects');
  SDL_HapticNumEffectsPlaying := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticNumEffectsPlaying');
  SDL_HapticOpen := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticOpen');
  SDL_HapticOpened := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticOpened');
  SDL_HapticOpenFromJoystick := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticOpenFromJoystick');
  SDL_HapticOpenFromMouse := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticOpenFromMouse');
  SDL_HapticPause := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticPause');
  SDL_HapticQuery := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticQuery');
  SDL_HapticRumbleInit := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticRumbleInit');
  SDL_HapticRumblePlay := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticRumblePlay');
  SDL_HapticRumbleStop := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticRumbleStop');
  SDL_HapticRumbleSupported := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticRumbleSupported');
  SDL_HapticRunEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticRunEffect');
  SDL_HapticSetAutocenter := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticSetAutocenter');
  SDL_HapticSetGain := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticSetGain');
  SDL_HapticStopAll := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticStopAll');
  SDL_HapticStopEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticStopEffect');
  SDL_HapticUnpause := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticUnpause');
  SDL_HapticUpdateEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_HapticUpdateEffect');
  SDL_Has3DNow := MemoryGetProcAddress(aDLLHandle, 'SDL_Has3DNow');
  SDL_HasAltiVec := MemoryGetProcAddress(aDLLHandle, 'SDL_HasAltiVec');
  SDL_HasARMSIMD := MemoryGetProcAddress(aDLLHandle, 'SDL_HasARMSIMD');
  SDL_HasAVX := MemoryGetProcAddress(aDLLHandle, 'SDL_HasAVX');
  SDL_HasAVX2 := MemoryGetProcAddress(aDLLHandle, 'SDL_HasAVX2');
  SDL_HasAVX512F := MemoryGetProcAddress(aDLLHandle, 'SDL_HasAVX512F');
  SDL_HasClipboardText := MemoryGetProcAddress(aDLLHandle, 'SDL_HasClipboardText');
  SDL_HasColorKey := MemoryGetProcAddress(aDLLHandle, 'SDL_HasColorKey');
  SDL_HasEvent := MemoryGetProcAddress(aDLLHandle, 'SDL_HasEvent');
  SDL_HasEvents := MemoryGetProcAddress(aDLLHandle, 'SDL_HasEvents');
  SDL_HasIntersection := MemoryGetProcAddress(aDLLHandle, 'SDL_HasIntersection');
  SDL_HasIntersectionF := MemoryGetProcAddress(aDLLHandle, 'SDL_HasIntersectionF');
  SDL_HasLASX := MemoryGetProcAddress(aDLLHandle, 'SDL_HasLASX');
  SDL_HasLSX := MemoryGetProcAddress(aDLLHandle, 'SDL_HasLSX');
  SDL_HasMMX := MemoryGetProcAddress(aDLLHandle, 'SDL_HasMMX');
  SDL_HasNEON := MemoryGetProcAddress(aDLLHandle, 'SDL_HasNEON');
  SDL_HasPrimarySelectionText := MemoryGetProcAddress(aDLLHandle, 'SDL_HasPrimarySelectionText');
  SDL_HasRDTSC := MemoryGetProcAddress(aDLLHandle, 'SDL_HasRDTSC');
  SDL_HasScreenKeyboardSupport := MemoryGetProcAddress(aDLLHandle, 'SDL_HasScreenKeyboardSupport');
  SDL_HasSSE := MemoryGetProcAddress(aDLLHandle, 'SDL_HasSSE');
  SDL_HasSSE2 := MemoryGetProcAddress(aDLLHandle, 'SDL_HasSSE2');
  SDL_HasSSE3 := MemoryGetProcAddress(aDLLHandle, 'SDL_HasSSE3');
  SDL_HasSSE41 := MemoryGetProcAddress(aDLLHandle, 'SDL_HasSSE41');
  SDL_HasSSE42 := MemoryGetProcAddress(aDLLHandle, 'SDL_HasSSE42');
  SDL_HasSurfaceRLE := MemoryGetProcAddress(aDLLHandle, 'SDL_HasSurfaceRLE');
  SDL_hid_ble_scan := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_ble_scan');
  SDL_hid_close := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_close');
  SDL_hid_device_change_count := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_device_change_count');
  SDL_hid_enumerate := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_enumerate');
  SDL_hid_exit := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_exit');
  SDL_hid_free_enumeration := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_free_enumeration');
  SDL_hid_get_feature_report := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_get_feature_report');
  SDL_hid_get_indexed_string := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_get_indexed_string');
  SDL_hid_get_manufacturer_string := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_get_manufacturer_string');
  SDL_hid_get_product_string := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_get_product_string');
  SDL_hid_get_serial_number_string := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_get_serial_number_string');
  SDL_hid_init := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_init');
  SDL_hid_open := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_open');
  SDL_hid_open_path := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_open_path');
  SDL_hid_read := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_read');
  SDL_hid_read_timeout := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_read_timeout');
  SDL_hid_send_feature_report := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_send_feature_report');
  SDL_hid_set_nonblocking := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_set_nonblocking');
  SDL_hid_write := MemoryGetProcAddress(aDLLHandle, 'SDL_hid_write');
  SDL_HideWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_HideWindow');
  SDL_iconv := MemoryGetProcAddress(aDLLHandle, 'SDL_iconv');
  SDL_iconv_close := MemoryGetProcAddress(aDLLHandle, 'SDL_iconv_close');
  SDL_iconv_open := MemoryGetProcAddress(aDLLHandle, 'SDL_iconv_open');
  SDL_iconv_string := MemoryGetProcAddress(aDLLHandle, 'SDL_iconv_string');
  SDL_Init := MemoryGetProcAddress(aDLLHandle, 'SDL_Init');
  SDL_InitSubSystem := MemoryGetProcAddress(aDLLHandle, 'SDL_InitSubSystem');
  SDL_IntersectFRect := MemoryGetProcAddress(aDLLHandle, 'SDL_IntersectFRect');
  SDL_IntersectFRectAndLine := MemoryGetProcAddress(aDLLHandle, 'SDL_IntersectFRectAndLine');
  SDL_IntersectRect := MemoryGetProcAddress(aDLLHandle, 'SDL_IntersectRect');
  SDL_IntersectRectAndLine := MemoryGetProcAddress(aDLLHandle, 'SDL_IntersectRectAndLine');
  SDL_isalnum := MemoryGetProcAddress(aDLLHandle, 'SDL_isalnum');
  SDL_isalpha := MemoryGetProcAddress(aDLLHandle, 'SDL_isalpha');
  SDL_isblank := MemoryGetProcAddress(aDLLHandle, 'SDL_isblank');
  SDL_iscntrl := MemoryGetProcAddress(aDLLHandle, 'SDL_iscntrl');
  SDL_isdigit := MemoryGetProcAddress(aDLLHandle, 'SDL_isdigit');
  SDL_IsGameController := MemoryGetProcAddress(aDLLHandle, 'SDL_IsGameController');
  SDL_isgraph := MemoryGetProcAddress(aDLLHandle, 'SDL_isgraph');
  SDL_islower := MemoryGetProcAddress(aDLLHandle, 'SDL_islower');
  SDL_isprint := MemoryGetProcAddress(aDLLHandle, 'SDL_isprint');
  SDL_ispunct := MemoryGetProcAddress(aDLLHandle, 'SDL_ispunct');
  SDL_IsScreenKeyboardShown := MemoryGetProcAddress(aDLLHandle, 'SDL_IsScreenKeyboardShown');
  SDL_IsScreenSaverEnabled := MemoryGetProcAddress(aDLLHandle, 'SDL_IsScreenSaverEnabled');
  SDL_IsShapedWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_IsShapedWindow');
  SDL_isspace := MemoryGetProcAddress(aDLLHandle, 'SDL_isspace');
  SDL_IsTablet := MemoryGetProcAddress(aDLLHandle, 'SDL_IsTablet');
  SDL_IsTextInputActive := MemoryGetProcAddress(aDLLHandle, 'SDL_IsTextInputActive');
  SDL_IsTextInputShown := MemoryGetProcAddress(aDLLHandle, 'SDL_IsTextInputShown');
  SDL_isupper := MemoryGetProcAddress(aDLLHandle, 'SDL_isupper');
  SDL_isxdigit := MemoryGetProcAddress(aDLLHandle, 'SDL_isxdigit');
  SDL_itoa := MemoryGetProcAddress(aDLLHandle, 'SDL_itoa');
  SDL_JoystickAttachVirtual := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickAttachVirtual');
  SDL_JoystickAttachVirtualEx := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickAttachVirtualEx');
  SDL_JoystickClose := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickClose');
  SDL_JoystickCurrentPowerLevel := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickCurrentPowerLevel');
  SDL_JoystickDetachVirtual := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickDetachVirtual');
  SDL_JoystickEventState := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickEventState');
  SDL_JoystickFromInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickFromInstanceID');
  SDL_JoystickFromPlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickFromPlayerIndex');
  SDL_JoystickGetAttached := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetAttached');
  SDL_JoystickGetAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetAxis');
  SDL_JoystickGetAxisInitialState := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetAxisInitialState');
  SDL_JoystickGetBall := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetBall');
  SDL_JoystickGetButton := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetButton');
  SDL_JoystickGetDeviceGUID := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDeviceGUID');
  SDL_JoystickGetDeviceInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDeviceInstanceID');
  SDL_JoystickGetDevicePlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDevicePlayerIndex');
  SDL_JoystickGetDeviceProduct := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDeviceProduct');
  SDL_JoystickGetDeviceProductVersion := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDeviceProductVersion');
  SDL_JoystickGetDeviceType := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDeviceType');
  SDL_JoystickGetDeviceVendor := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetDeviceVendor');
  SDL_JoystickGetFirmwareVersion := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetFirmwareVersion');
  SDL_JoystickGetGUID := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetGUID');
  SDL_JoystickGetGUIDFromString := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetGUIDFromString');
  SDL_JoystickGetGUIDString := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetGUIDString');
  SDL_JoystickGetHat := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetHat');
  SDL_JoystickGetPlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetPlayerIndex');
  SDL_JoystickGetProduct := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetProduct');
  SDL_JoystickGetProductVersion := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetProductVersion');
  SDL_JoystickGetSerial := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetSerial');
  SDL_JoystickGetType := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetType');
  SDL_JoystickGetVendor := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickGetVendor');
  SDL_JoystickHasLED := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickHasLED');
  SDL_JoystickHasRumble := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickHasRumble');
  SDL_JoystickHasRumbleTriggers := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickHasRumbleTriggers');
  SDL_JoystickInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickInstanceID');
  SDL_JoystickIsHaptic := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickIsHaptic');
  SDL_JoystickIsVirtual := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickIsVirtual');
  SDL_JoystickName := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickName');
  SDL_JoystickNameForIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickNameForIndex');
  SDL_JoystickNumAxes := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickNumAxes');
  SDL_JoystickNumBalls := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickNumBalls');
  SDL_JoystickNumButtons := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickNumButtons');
  SDL_JoystickNumHats := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickNumHats');
  SDL_JoystickOpen := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickOpen');
  SDL_JoystickPath := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickPath');
  SDL_JoystickPathForIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickPathForIndex');
  SDL_JoystickRumble := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickRumble');
  SDL_JoystickRumbleTriggers := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickRumbleTriggers');
  SDL_JoystickSendEffect := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickSendEffect');
  SDL_JoystickSetLED := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickSetLED');
  SDL_JoystickSetPlayerIndex := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickSetPlayerIndex');
  SDL_JoystickSetVirtualAxis := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickSetVirtualAxis');
  SDL_JoystickSetVirtualButton := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickSetVirtualButton');
  SDL_JoystickSetVirtualHat := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickSetVirtualHat');
  SDL_JoystickUpdate := MemoryGetProcAddress(aDLLHandle, 'SDL_JoystickUpdate');
  SDL_lltoa := MemoryGetProcAddress(aDLLHandle, 'SDL_lltoa');
  SDL_LoadBMP_RW := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadBMP_RW');
  SDL_LoadDollarTemplates := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadDollarTemplates');
  SDL_LoadFile := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadFile');
  SDL_LoadFile_RW := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadFile_RW');
  SDL_LoadFunction := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadFunction');
  SDL_LoadObject := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadObject');
  SDL_LoadWAV_RW := MemoryGetProcAddress(aDLLHandle, 'SDL_LoadWAV_RW');
  SDL_LockAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_LockAudio');
  SDL_LockAudioDevice := MemoryGetProcAddress(aDLLHandle, 'SDL_LockAudioDevice');
  SDL_LockJoysticks := MemoryGetProcAddress(aDLLHandle, 'SDL_LockJoysticks');
  SDL_LockMutex := MemoryGetProcAddress(aDLLHandle, 'SDL_LockMutex');
  SDL_LockSensors := MemoryGetProcAddress(aDLLHandle, 'SDL_LockSensors');
  SDL_LockSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_LockSurface');
  SDL_LockTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_LockTexture');
  SDL_LockTextureToSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_LockTextureToSurface');
  SDL_log := MemoryGetProcAddress(aDLLHandle, 'SDL_log');
  SDL_Log_ := MemoryGetProcAddress(aDLLHandle, 'SDL_Log_');
  SDL_log10 := MemoryGetProcAddress(aDLLHandle, 'SDL_log10');
  SDL_log10f := MemoryGetProcAddress(aDLLHandle, 'SDL_log10f');
  SDL_LogCritical := MemoryGetProcAddress(aDLLHandle, 'SDL_LogCritical');
  SDL_LogDebug := MemoryGetProcAddress(aDLLHandle, 'SDL_LogDebug');
  SDL_LogError := MemoryGetProcAddress(aDLLHandle, 'SDL_LogError');
  SDL_logf := MemoryGetProcAddress(aDLLHandle, 'SDL_logf');
  SDL_LogGetOutputFunction := MemoryGetProcAddress(aDLLHandle, 'SDL_LogGetOutputFunction');
  SDL_LogGetPriority := MemoryGetProcAddress(aDLLHandle, 'SDL_LogGetPriority');
  SDL_LogInfo := MemoryGetProcAddress(aDLLHandle, 'SDL_LogInfo');
  SDL_LogMessage := MemoryGetProcAddress(aDLLHandle, 'SDL_LogMessage');
  SDL_LogMessageV := MemoryGetProcAddress(aDLLHandle, 'SDL_LogMessageV');
  SDL_LogResetPriorities := MemoryGetProcAddress(aDLLHandle, 'SDL_LogResetPriorities');
  SDL_LogSetAllPriority := MemoryGetProcAddress(aDLLHandle, 'SDL_LogSetAllPriority');
  SDL_LogSetOutputFunction := MemoryGetProcAddress(aDLLHandle, 'SDL_LogSetOutputFunction');
  SDL_LogSetPriority := MemoryGetProcAddress(aDLLHandle, 'SDL_LogSetPriority');
  SDL_LogVerbose := MemoryGetProcAddress(aDLLHandle, 'SDL_LogVerbose');
  SDL_LogWarn := MemoryGetProcAddress(aDLLHandle, 'SDL_LogWarn');
  SDL_LowerBlit := MemoryGetProcAddress(aDLLHandle, 'SDL_LowerBlit');
  SDL_LowerBlitScaled := MemoryGetProcAddress(aDLLHandle, 'SDL_LowerBlitScaled');
  SDL_lround := MemoryGetProcAddress(aDLLHandle, 'SDL_lround');
  SDL_lroundf := MemoryGetProcAddress(aDLLHandle, 'SDL_lroundf');
  SDL_ltoa := MemoryGetProcAddress(aDLLHandle, 'SDL_ltoa');
  SDL_main := MemoryGetProcAddress(aDLLHandle, 'SDL_main');
  SDL_malloc := MemoryGetProcAddress(aDLLHandle, 'SDL_malloc');
  SDL_MapRGB := MemoryGetProcAddress(aDLLHandle, 'SDL_MapRGB');
  SDL_MapRGBA := MemoryGetProcAddress(aDLLHandle, 'SDL_MapRGBA');
  SDL_MasksToPixelFormatEnum := MemoryGetProcAddress(aDLLHandle, 'SDL_MasksToPixelFormatEnum');
  SDL_MaximizeWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_MaximizeWindow');
  SDL_memcmp := MemoryGetProcAddress(aDLLHandle, 'SDL_memcmp');
  SDL_memcpy := MemoryGetProcAddress(aDLLHandle, 'SDL_memcpy');
  SDL_memmove := MemoryGetProcAddress(aDLLHandle, 'SDL_memmove');
  SDL_MemoryBarrierAcquireFunction := MemoryGetProcAddress(aDLLHandle, 'SDL_MemoryBarrierAcquireFunction');
  SDL_MemoryBarrierReleaseFunction := MemoryGetProcAddress(aDLLHandle, 'SDL_MemoryBarrierReleaseFunction');
  SDL_memset := MemoryGetProcAddress(aDLLHandle, 'SDL_memset');
  SDL_Metal_CreateView := MemoryGetProcAddress(aDLLHandle, 'SDL_Metal_CreateView');
  SDL_Metal_DestroyView := MemoryGetProcAddress(aDLLHandle, 'SDL_Metal_DestroyView');
  SDL_Metal_GetDrawableSize := MemoryGetProcAddress(aDLLHandle, 'SDL_Metal_GetDrawableSize');
  SDL_Metal_GetLayer := MemoryGetProcAddress(aDLLHandle, 'SDL_Metal_GetLayer');
  SDL_MinimizeWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_MinimizeWindow');
  SDL_MixAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_MixAudio');
  SDL_MixAudioFormat := MemoryGetProcAddress(aDLLHandle, 'SDL_MixAudioFormat');
  SDL_MouseIsHaptic := MemoryGetProcAddress(aDLLHandle, 'SDL_MouseIsHaptic');
  SDL_NewAudioStream := MemoryGetProcAddress(aDLLHandle, 'SDL_NewAudioStream');
  SDL_NumHaptics := MemoryGetProcAddress(aDLLHandle, 'SDL_NumHaptics');
  SDL_NumJoysticks := MemoryGetProcAddress(aDLLHandle, 'SDL_NumJoysticks');
  SDL_NumSensors := MemoryGetProcAddress(aDLLHandle, 'SDL_NumSensors');
  SDL_OnApplicationDidBecomeActive := MemoryGetProcAddress(aDLLHandle, 'SDL_OnApplicationDidBecomeActive');
  SDL_OnApplicationDidEnterBackground := MemoryGetProcAddress(aDLLHandle, 'SDL_OnApplicationDidEnterBackground');
  SDL_OnApplicationDidReceiveMemoryWarning := MemoryGetProcAddress(aDLLHandle, 'SDL_OnApplicationDidReceiveMemoryWarning');
  SDL_OnApplicationWillEnterForeground := MemoryGetProcAddress(aDLLHandle, 'SDL_OnApplicationWillEnterForeground');
  SDL_OnApplicationWillResignActive := MemoryGetProcAddress(aDLLHandle, 'SDL_OnApplicationWillResignActive');
  SDL_OnApplicationWillTerminate := MemoryGetProcAddress(aDLLHandle, 'SDL_OnApplicationWillTerminate');
  SDL_OpenAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_OpenAudio');
  SDL_OpenAudioDevice := MemoryGetProcAddress(aDLLHandle, 'SDL_OpenAudioDevice');
  SDL_OpenURL := MemoryGetProcAddress(aDLLHandle, 'SDL_OpenURL');
  SDL_PauseAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_PauseAudio');
  SDL_PauseAudioDevice := MemoryGetProcAddress(aDLLHandle, 'SDL_PauseAudioDevice');
  SDL_PeepEvents := MemoryGetProcAddress(aDLLHandle, 'SDL_PeepEvents');
  SDL_PixelFormatEnumToMasks := MemoryGetProcAddress(aDLLHandle, 'SDL_PixelFormatEnumToMasks');
  SDL_PollEvent := MemoryGetProcAddress(aDLLHandle, 'SDL_PollEvent');
  SDL_pow := MemoryGetProcAddress(aDLLHandle, 'SDL_pow');
  SDL_powf := MemoryGetProcAddress(aDLLHandle, 'SDL_powf');
  SDL_PremultiplyAlpha := MemoryGetProcAddress(aDLLHandle, 'SDL_PremultiplyAlpha');
  SDL_PumpEvents := MemoryGetProcAddress(aDLLHandle, 'SDL_PumpEvents');
  SDL_PushEvent := MemoryGetProcAddress(aDLLHandle, 'SDL_PushEvent');
  SDL_qsort := MemoryGetProcAddress(aDLLHandle, 'SDL_qsort');
  SDL_QueryTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_QueryTexture');
  SDL_QueueAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_QueueAudio');
  SDL_Quit := MemoryGetProcAddress(aDLLHandle, 'SDL_Quit');
  SDL_QuitSubSystem := MemoryGetProcAddress(aDLLHandle, 'SDL_QuitSubSystem');
  SDL_RaiseWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_RaiseWindow');
  SDL_ReadBE16 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadBE16');
  SDL_ReadBE32 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadBE32');
  SDL_ReadBE64 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadBE64');
  SDL_ReadLE16 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadLE16');
  SDL_ReadLE32 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadLE32');
  SDL_ReadLE64 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadLE64');
  SDL_ReadU8 := MemoryGetProcAddress(aDLLHandle, 'SDL_ReadU8');
  SDL_realloc := MemoryGetProcAddress(aDLLHandle, 'SDL_realloc');
  SDL_RecordGesture := MemoryGetProcAddress(aDLLHandle, 'SDL_RecordGesture');
  SDL_RegisterApp := MemoryGetProcAddress(aDLLHandle, 'SDL_RegisterApp');
  SDL_RegisterEvents := MemoryGetProcAddress(aDLLHandle, 'SDL_RegisterEvents');
  SDL_RemoveTimer := MemoryGetProcAddress(aDLLHandle, 'SDL_RemoveTimer');
  SDL_RenderClear := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderClear');
  SDL_RenderCopy := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderCopy');
  SDL_RenderCopyEx := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderCopyEx');
  SDL_RenderCopyExF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderCopyExF');
  SDL_RenderCopyF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderCopyF');
  SDL_RenderDrawLine := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawLine');
  SDL_RenderDrawLineF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawLineF');
  SDL_RenderDrawLines := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawLines');
  SDL_RenderDrawLinesF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawLinesF');
  SDL_RenderDrawPoint := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawPoint');
  SDL_RenderDrawPointF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawPointF');
  SDL_RenderDrawPoints := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawPoints');
  SDL_RenderDrawPointsF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawPointsF');
  SDL_RenderDrawRect := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawRect');
  SDL_RenderDrawRectF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawRectF');
  SDL_RenderDrawRects := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawRects');
  SDL_RenderDrawRectsF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderDrawRectsF');
  SDL_RenderFillRect := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderFillRect');
  SDL_RenderFillRectF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderFillRectF');
  SDL_RenderFillRects := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderFillRects');
  SDL_RenderFillRectsF := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderFillRectsF');
  SDL_RenderFlush := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderFlush');
  SDL_RenderGeometry := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGeometry');
  SDL_RenderGeometryRaw := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGeometryRaw');
  SDL_RenderGetClipRect := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetClipRect');
  SDL_RenderGetD3D11Device := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetD3D11Device');
  SDL_RenderGetD3D12Device := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetD3D12Device');
  SDL_RenderGetD3D9Device := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetD3D9Device');
  SDL_RenderGetIntegerScale := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetIntegerScale');
  SDL_RenderGetLogicalSize := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetLogicalSize');
  SDL_RenderGetMetalCommandEncoder := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetMetalCommandEncoder');
  SDL_RenderGetMetalLayer := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetMetalLayer');
  SDL_RenderGetScale := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetScale');
  SDL_RenderGetViewport := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetViewport');
  SDL_RenderGetWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderGetWindow');
  SDL_RenderIsClipEnabled := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderIsClipEnabled');
  SDL_RenderLogicalToWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderLogicalToWindow');
  SDL_RenderPresent := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderPresent');
  SDL_RenderReadPixels := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderReadPixels');
  SDL_RenderSetClipRect := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderSetClipRect');
  SDL_RenderSetIntegerScale := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderSetIntegerScale');
  SDL_RenderSetLogicalSize := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderSetLogicalSize');
  SDL_RenderSetScale := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderSetScale');
  SDL_RenderSetViewport := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderSetViewport');
  SDL_RenderSetVSync := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderSetVSync');
  SDL_RenderTargetSupported := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderTargetSupported');
  SDL_RenderWindowToLogical := MemoryGetProcAddress(aDLLHandle, 'SDL_RenderWindowToLogical');
  SDL_ReportAssertion := MemoryGetProcAddress(aDLLHandle, 'SDL_ReportAssertion');
  SDL_ResetAssertionReport := MemoryGetProcAddress(aDLLHandle, 'SDL_ResetAssertionReport');
  SDL_ResetHint := MemoryGetProcAddress(aDLLHandle, 'SDL_ResetHint');
  SDL_ResetHints := MemoryGetProcAddress(aDLLHandle, 'SDL_ResetHints');
  SDL_ResetKeyboard := MemoryGetProcAddress(aDLLHandle, 'SDL_ResetKeyboard');
  SDL_RestoreWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_RestoreWindow');
  SDL_round := MemoryGetProcAddress(aDLLHandle, 'SDL_round');
  SDL_roundf := MemoryGetProcAddress(aDLLHandle, 'SDL_roundf');
  SDL_RWclose := MemoryGetProcAddress(aDLLHandle, 'SDL_RWclose');
  SDL_RWFromConstMem := MemoryGetProcAddress(aDLLHandle, 'SDL_RWFromConstMem');
  SDL_RWFromFile := MemoryGetProcAddress(aDLLHandle, 'SDL_RWFromFile');
  SDL_RWFromFP := MemoryGetProcAddress(aDLLHandle, 'SDL_RWFromFP');
  SDL_RWFromMem := MemoryGetProcAddress(aDLLHandle, 'SDL_RWFromMem');
  SDL_RWread := MemoryGetProcAddress(aDLLHandle, 'SDL_RWread');
  SDL_RWseek := MemoryGetProcAddress(aDLLHandle, 'SDL_RWseek');
  SDL_RWsize := MemoryGetProcAddress(aDLLHandle, 'SDL_RWsize');
  SDL_RWtell := MemoryGetProcAddress(aDLLHandle, 'SDL_RWtell');
  SDL_RWwrite := MemoryGetProcAddress(aDLLHandle, 'SDL_RWwrite');
  SDL_SaveAllDollarTemplates := MemoryGetProcAddress(aDLLHandle, 'SDL_SaveAllDollarTemplates');
  SDL_SaveBMP_RW := MemoryGetProcAddress(aDLLHandle, 'SDL_SaveBMP_RW');
  SDL_SaveDollarTemplate := MemoryGetProcAddress(aDLLHandle, 'SDL_SaveDollarTemplate');
  SDL_scalbn := MemoryGetProcAddress(aDLLHandle, 'SDL_scalbn');
  SDL_scalbnf := MemoryGetProcAddress(aDLLHandle, 'SDL_scalbnf');
  SDL_SemPost := MemoryGetProcAddress(aDLLHandle, 'SDL_SemPost');
  SDL_SemTryWait := MemoryGetProcAddress(aDLLHandle, 'SDL_SemTryWait');
  SDL_SemValue := MemoryGetProcAddress(aDLLHandle, 'SDL_SemValue');
  SDL_SemWait := MemoryGetProcAddress(aDLLHandle, 'SDL_SemWait');
  SDL_SemWaitTimeout := MemoryGetProcAddress(aDLLHandle, 'SDL_SemWaitTimeout');
  SDL_SensorClose := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorClose');
  SDL_SensorFromInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorFromInstanceID');
  SDL_SensorGetData := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetData');
  SDL_SensorGetDataWithTimestamp := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetDataWithTimestamp');
  SDL_SensorGetDeviceInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetDeviceInstanceID');
  SDL_SensorGetDeviceName := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetDeviceName');
  SDL_SensorGetDeviceNonPortableType := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetDeviceNonPortableType');
  SDL_SensorGetDeviceType := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetDeviceType');
  SDL_SensorGetInstanceID := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetInstanceID');
  SDL_SensorGetName := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetName');
  SDL_SensorGetNonPortableType := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetNonPortableType');
  SDL_SensorGetType := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorGetType');
  SDL_SensorOpen := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorOpen');
  SDL_SensorUpdate := MemoryGetProcAddress(aDLLHandle, 'SDL_SensorUpdate');
  SDL_SetAssertionHandler := MemoryGetProcAddress(aDLLHandle, 'SDL_SetAssertionHandler');
  SDL_SetClipboardText := MemoryGetProcAddress(aDLLHandle, 'SDL_SetClipboardText');
  SDL_SetClipRect := MemoryGetProcAddress(aDLLHandle, 'SDL_SetClipRect');
  SDL_SetColorKey := MemoryGetProcAddress(aDLLHandle, 'SDL_SetColorKey');
  SDL_SetCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_SetCursor');
  SDL_setenv := MemoryGetProcAddress(aDLLHandle, 'SDL_setenv');
  SDL_SetError := MemoryGetProcAddress(aDLLHandle, 'SDL_SetError');
  SDL_SetEventFilter := MemoryGetProcAddress(aDLLHandle, 'SDL_SetEventFilter');
  SDL_SetHint := MemoryGetProcAddress(aDLLHandle, 'SDL_SetHint');
  SDL_SetHintWithPriority := MemoryGetProcAddress(aDLLHandle, 'SDL_SetHintWithPriority');
  SDL_SetMainReady := MemoryGetProcAddress(aDLLHandle, 'SDL_SetMainReady');
  SDL_SetMemoryFunctions := MemoryGetProcAddress(aDLLHandle, 'SDL_SetMemoryFunctions');
  SDL_SetModState := MemoryGetProcAddress(aDLLHandle, 'SDL_SetModState');
  SDL_SetPaletteColors := MemoryGetProcAddress(aDLLHandle, 'SDL_SetPaletteColors');
  SDL_SetPixelFormatPalette := MemoryGetProcAddress(aDLLHandle, 'SDL_SetPixelFormatPalette');
  SDL_SetPrimarySelectionText := MemoryGetProcAddress(aDLLHandle, 'SDL_SetPrimarySelectionText');
  SDL_SetRelativeMouseMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetRelativeMouseMode');
  SDL_SetRenderDrawBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetRenderDrawBlendMode');
  SDL_SetRenderDrawColor := MemoryGetProcAddress(aDLLHandle, 'SDL_SetRenderDrawColor');
  SDL_SetRenderTarget := MemoryGetProcAddress(aDLLHandle, 'SDL_SetRenderTarget');
  SDL_SetSurfaceAlphaMod := MemoryGetProcAddress(aDLLHandle, 'SDL_SetSurfaceAlphaMod');
  SDL_SetSurfaceBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetSurfaceBlendMode');
  SDL_SetSurfaceColorMod := MemoryGetProcAddress(aDLLHandle, 'SDL_SetSurfaceColorMod');
  SDL_SetSurfacePalette := MemoryGetProcAddress(aDLLHandle, 'SDL_SetSurfacePalette');
  SDL_SetSurfaceRLE := MemoryGetProcAddress(aDLLHandle, 'SDL_SetSurfaceRLE');
  SDL_SetTextInputRect := MemoryGetProcAddress(aDLLHandle, 'SDL_SetTextInputRect');
  SDL_SetTextureAlphaMod := MemoryGetProcAddress(aDLLHandle, 'SDL_SetTextureAlphaMod');
  SDL_SetTextureBlendMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetTextureBlendMode');
  SDL_SetTextureColorMod := MemoryGetProcAddress(aDLLHandle, 'SDL_SetTextureColorMod');
  SDL_SetTextureScaleMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetTextureScaleMode');
  SDL_SetTextureUserData := MemoryGetProcAddress(aDLLHandle, 'SDL_SetTextureUserData');
  SDL_SetThreadPriority := MemoryGetProcAddress(aDLLHandle, 'SDL_SetThreadPriority');
  SDL_SetWindowAlwaysOnTop := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowAlwaysOnTop');
  SDL_SetWindowBordered := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowBordered');
  SDL_SetWindowBrightness := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowBrightness');
  SDL_SetWindowData := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowData');
  SDL_SetWindowDisplayMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowDisplayMode');
  SDL_SetWindowFullscreen := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowFullscreen');
  SDL_SetWindowGammaRamp := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowGammaRamp');
  SDL_SetWindowGrab := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowGrab');
  SDL_SetWindowHitTest := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowHitTest');
  SDL_SetWindowIcon := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowIcon');
  SDL_SetWindowInputFocus := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowInputFocus');
  SDL_SetWindowKeyboardGrab := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowKeyboardGrab');
  SDL_SetWindowMaximumSize := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowMaximumSize');
  SDL_SetWindowMinimumSize := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowMinimumSize');
  SDL_SetWindowModalFor := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowModalFor');
  SDL_SetWindowMouseGrab := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowMouseGrab');
  SDL_SetWindowMouseRect := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowMouseRect');
  SDL_SetWindowOpacity := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowOpacity');
  SDL_SetWindowPosition := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowPosition');
  SDL_SetWindowResizable := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowResizable');
  SDL_SetWindowShape := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowShape');
  SDL_SetWindowSize := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowSize');
  SDL_SetWindowsMessageHook := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowsMessageHook');
  SDL_SetWindowTitle := MemoryGetProcAddress(aDLLHandle, 'SDL_SetWindowTitle');
  SDL_SetYUVConversionMode := MemoryGetProcAddress(aDLLHandle, 'SDL_SetYUVConversionMode');
  SDL_ShowCursor := MemoryGetProcAddress(aDLLHandle, 'SDL_ShowCursor');
  SDL_ShowMessageBox := MemoryGetProcAddress(aDLLHandle, 'SDL_ShowMessageBox');
  SDL_ShowSimpleMessageBox := MemoryGetProcAddress(aDLLHandle, 'SDL_ShowSimpleMessageBox');
  SDL_ShowWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_ShowWindow');
  SDL_SIMDAlloc := MemoryGetProcAddress(aDLLHandle, 'SDL_SIMDAlloc');
  SDL_SIMDFree := MemoryGetProcAddress(aDLLHandle, 'SDL_SIMDFree');
  SDL_SIMDGetAlignment := MemoryGetProcAddress(aDLLHandle, 'SDL_SIMDGetAlignment');
  SDL_SIMDRealloc := MemoryGetProcAddress(aDLLHandle, 'SDL_SIMDRealloc');
  SDL_sin := MemoryGetProcAddress(aDLLHandle, 'SDL_sin');
  SDL_sinf := MemoryGetProcAddress(aDLLHandle, 'SDL_sinf');
  SDL_snprintf := MemoryGetProcAddress(aDLLHandle, 'SDL_snprintf');
  SDL_SoftStretch := MemoryGetProcAddress(aDLLHandle, 'SDL_SoftStretch');
  SDL_SoftStretchLinear := MemoryGetProcAddress(aDLLHandle, 'SDL_SoftStretchLinear');
  SDL_sqrt := MemoryGetProcAddress(aDLLHandle, 'SDL_sqrt');
  SDL_sqrtf := MemoryGetProcAddress(aDLLHandle, 'SDL_sqrtf');
  SDL_sscanf := MemoryGetProcAddress(aDLLHandle, 'SDL_sscanf');
  SDL_StartTextInput := MemoryGetProcAddress(aDLLHandle, 'SDL_StartTextInput');
  SDL_StopTextInput := MemoryGetProcAddress(aDLLHandle, 'SDL_StopTextInput');
  SDL_strcasecmp := MemoryGetProcAddress(aDLLHandle, 'SDL_strcasecmp');
  SDL_strcasestr := MemoryGetProcAddress(aDLLHandle, 'SDL_strcasestr');
  SDL_strchr := MemoryGetProcAddress(aDLLHandle, 'SDL_strchr');
  SDL_strcmp := MemoryGetProcAddress(aDLLHandle, 'SDL_strcmp');
  SDL_strdup := MemoryGetProcAddress(aDLLHandle, 'SDL_strdup');
  SDL_strlcat := MemoryGetProcAddress(aDLLHandle, 'SDL_strlcat');
  SDL_strlcpy := MemoryGetProcAddress(aDLLHandle, 'SDL_strlcpy');
  SDL_strlen := MemoryGetProcAddress(aDLLHandle, 'SDL_strlen');
  SDL_strlwr := MemoryGetProcAddress(aDLLHandle, 'SDL_strlwr');
  SDL_strncasecmp := MemoryGetProcAddress(aDLLHandle, 'SDL_strncasecmp');
  SDL_strncmp := MemoryGetProcAddress(aDLLHandle, 'SDL_strncmp');
  SDL_strrchr := MemoryGetProcAddress(aDLLHandle, 'SDL_strrchr');
  SDL_strrev := MemoryGetProcAddress(aDLLHandle, 'SDL_strrev');
  SDL_strstr := MemoryGetProcAddress(aDLLHandle, 'SDL_strstr');
  SDL_strtod := MemoryGetProcAddress(aDLLHandle, 'SDL_strtod');
  SDL_strtokr := MemoryGetProcAddress(aDLLHandle, 'SDL_strtokr');
  SDL_strtol := MemoryGetProcAddress(aDLLHandle, 'SDL_strtol');
  SDL_strtoll := MemoryGetProcAddress(aDLLHandle, 'SDL_strtoll');
  SDL_strtoul := MemoryGetProcAddress(aDLLHandle, 'SDL_strtoul');
  SDL_strtoull := MemoryGetProcAddress(aDLLHandle, 'SDL_strtoull');
  SDL_strupr := MemoryGetProcAddress(aDLLHandle, 'SDL_strupr');
  SDL_tan := MemoryGetProcAddress(aDLLHandle, 'SDL_tan');
  SDL_tanf := MemoryGetProcAddress(aDLLHandle, 'SDL_tanf');
  SDL_ThreadID := MemoryGetProcAddress(aDLLHandle, 'SDL_ThreadID');
  SDL_TLSCleanup := MemoryGetProcAddress(aDLLHandle, 'SDL_TLSCleanup');
  SDL_TLSCreate := MemoryGetProcAddress(aDLLHandle, 'SDL_TLSCreate');
  SDL_TLSGet := MemoryGetProcAddress(aDLLHandle, 'SDL_TLSGet');
  SDL_TLSSet := MemoryGetProcAddress(aDLLHandle, 'SDL_TLSSet');
  SDL_tolower := MemoryGetProcAddress(aDLLHandle, 'SDL_tolower');
  SDL_toupper := MemoryGetProcAddress(aDLLHandle, 'SDL_toupper');
  SDL_trunc := MemoryGetProcAddress(aDLLHandle, 'SDL_trunc');
  SDL_truncf := MemoryGetProcAddress(aDLLHandle, 'SDL_truncf');
  SDL_TryLockMutex := MemoryGetProcAddress(aDLLHandle, 'SDL_TryLockMutex');
  SDL_uitoa := MemoryGetProcAddress(aDLLHandle, 'SDL_uitoa');
  SDL_ulltoa := MemoryGetProcAddress(aDLLHandle, 'SDL_ulltoa');
  SDL_ultoa := MemoryGetProcAddress(aDLLHandle, 'SDL_ultoa');
  SDL_UnionFRect := MemoryGetProcAddress(aDLLHandle, 'SDL_UnionFRect');
  SDL_UnionRect := MemoryGetProcAddress(aDLLHandle, 'SDL_UnionRect');
  SDL_UnloadObject := MemoryGetProcAddress(aDLLHandle, 'SDL_UnloadObject');
  SDL_UnlockAudio := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockAudio');
  SDL_UnlockAudioDevice := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockAudioDevice');
  SDL_UnlockJoysticks := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockJoysticks');
  SDL_UnlockMutex := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockMutex');
  SDL_UnlockSensors := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockSensors');
  SDL_UnlockSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockSurface');
  SDL_UnlockTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_UnlockTexture');
  SDL_UnregisterApp := MemoryGetProcAddress(aDLLHandle, 'SDL_UnregisterApp');
  SDL_UpdateNVTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_UpdateNVTexture');
  SDL_UpdateTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_UpdateTexture');
  SDL_UpdateWindowSurface := MemoryGetProcAddress(aDLLHandle, 'SDL_UpdateWindowSurface');
  SDL_UpdateWindowSurfaceRects := MemoryGetProcAddress(aDLLHandle, 'SDL_UpdateWindowSurfaceRects');
  SDL_UpdateYUVTexture := MemoryGetProcAddress(aDLLHandle, 'SDL_UpdateYUVTexture');
  SDL_UpperBlit := MemoryGetProcAddress(aDLLHandle, 'SDL_UpperBlit');
  SDL_UpperBlitScaled := MemoryGetProcAddress(aDLLHandle, 'SDL_UpperBlitScaled');
  SDL_utf8strlcpy := MemoryGetProcAddress(aDLLHandle, 'SDL_utf8strlcpy');
  SDL_utf8strlen := MemoryGetProcAddress(aDLLHandle, 'SDL_utf8strlen');
  SDL_utf8strnlen := MemoryGetProcAddress(aDLLHandle, 'SDL_utf8strnlen');
  SDL_vasprintf := MemoryGetProcAddress(aDLLHandle, 'SDL_vasprintf');
  SDL_VideoInit := MemoryGetProcAddress(aDLLHandle, 'SDL_VideoInit');
  SDL_VideoQuit := MemoryGetProcAddress(aDLLHandle, 'SDL_VideoQuit');
  SDL_vsnprintf := MemoryGetProcAddress(aDLLHandle, 'SDL_vsnprintf');
  SDL_vsscanf := MemoryGetProcAddress(aDLLHandle, 'SDL_vsscanf');
  SDL_WaitEvent := MemoryGetProcAddress(aDLLHandle, 'SDL_WaitEvent');
  SDL_WaitEventTimeout := MemoryGetProcAddress(aDLLHandle, 'SDL_WaitEventTimeout');
  SDL_WaitThread := MemoryGetProcAddress(aDLLHandle, 'SDL_WaitThread');
  SDL_WarpMouseGlobal := MemoryGetProcAddress(aDLLHandle, 'SDL_WarpMouseGlobal');
  SDL_WarpMouseInWindow := MemoryGetProcAddress(aDLLHandle, 'SDL_WarpMouseInWindow');
  SDL_WasInit := MemoryGetProcAddress(aDLLHandle, 'SDL_WasInit');
  SDL_wcscasecmp := MemoryGetProcAddress(aDLLHandle, 'SDL_wcscasecmp');
  SDL_wcscmp := MemoryGetProcAddress(aDLLHandle, 'SDL_wcscmp');
  SDL_wcsdup := MemoryGetProcAddress(aDLLHandle, 'SDL_wcsdup');
  SDL_wcslcat := MemoryGetProcAddress(aDLLHandle, 'SDL_wcslcat');
  SDL_wcslcpy := MemoryGetProcAddress(aDLLHandle, 'SDL_wcslcpy');
  SDL_wcslen := MemoryGetProcAddress(aDLLHandle, 'SDL_wcslen');
  SDL_wcsncasecmp := MemoryGetProcAddress(aDLLHandle, 'SDL_wcsncasecmp');
  SDL_wcsncmp := MemoryGetProcAddress(aDLLHandle, 'SDL_wcsncmp');
  SDL_wcsstr := MemoryGetProcAddress(aDLLHandle, 'SDL_wcsstr');
  SDL_WriteBE16 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteBE16');
  SDL_WriteBE32 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteBE32');
  SDL_WriteBE64 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteBE64');
  SDL_WriteLE16 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteLE16');
  SDL_WriteLE32 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteLE32');
  SDL_WriteLE64 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteLE64');
  SDL_WriteU8 := MemoryGetProcAddress(aDLLHandle, 'SDL_WriteU8');
  SDLNet_AddSocket := MemoryGetProcAddress(aDLLHandle, 'SDLNet_AddSocket');
  SDLNet_AllocPacket := MemoryGetProcAddress(aDLLHandle, 'SDLNet_AllocPacket');
  SDLNet_AllocPacketV := MemoryGetProcAddress(aDLLHandle, 'SDLNet_AllocPacketV');
  SDLNet_AllocSocketSet := MemoryGetProcAddress(aDLLHandle, 'SDLNet_AllocSocketSet');
  SDLNet_CheckSockets := MemoryGetProcAddress(aDLLHandle, 'SDLNet_CheckSockets');
  SDLNet_DelSocket := MemoryGetProcAddress(aDLLHandle, 'SDLNet_DelSocket');
  SDLNet_FreePacket := MemoryGetProcAddress(aDLLHandle, 'SDLNet_FreePacket');
  SDLNet_FreePacketV := MemoryGetProcAddress(aDLLHandle, 'SDLNet_FreePacketV');
  SDLNet_FreeSocketSet := MemoryGetProcAddress(aDLLHandle, 'SDLNet_FreeSocketSet');
  SDLNet_GetError := MemoryGetProcAddress(aDLLHandle, 'SDLNet_GetError');
  SDLNet_GetLocalAddresses := MemoryGetProcAddress(aDLLHandle, 'SDLNet_GetLocalAddresses');
  SDLNet_Init := MemoryGetProcAddress(aDLLHandle, 'SDLNet_Init');
  SDLNet_Linked_Version := MemoryGetProcAddress(aDLLHandle, 'SDLNet_Linked_Version');
  SDLNet_Quit := MemoryGetProcAddress(aDLLHandle, 'SDLNet_Quit');
  SDLNet_ResizePacket := MemoryGetProcAddress(aDLLHandle, 'SDLNet_ResizePacket');
  SDLNet_ResolveHost := MemoryGetProcAddress(aDLLHandle, 'SDLNet_ResolveHost');
  SDLNet_ResolveIP := MemoryGetProcAddress(aDLLHandle, 'SDLNet_ResolveIP');
  SDLNet_SetError := MemoryGetProcAddress(aDLLHandle, 'SDLNet_SetError');
  SDLNet_TCP_Accept := MemoryGetProcAddress(aDLLHandle, 'SDLNet_TCP_Accept');
  SDLNet_TCP_Close := MemoryGetProcAddress(aDLLHandle, 'SDLNet_TCP_Close');
  SDLNet_TCP_GetPeerAddress := MemoryGetProcAddress(aDLLHandle, 'SDLNet_TCP_GetPeerAddress');
  SDLNet_TCP_Open := MemoryGetProcAddress(aDLLHandle, 'SDLNet_TCP_Open');
  SDLNet_TCP_Recv := MemoryGetProcAddress(aDLLHandle, 'SDLNet_TCP_Recv');
  SDLNet_TCP_Send := MemoryGetProcAddress(aDLLHandle, 'SDLNet_TCP_Send');
  SDLNet_UDP_Bind := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_Bind');
  SDLNet_UDP_Close := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_Close');
  SDLNet_UDP_GetPeerAddress := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_GetPeerAddress');
  SDLNet_UDP_Open := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_Open');
  SDLNet_UDP_Recv := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_Recv');
  SDLNet_UDP_RecvV := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_RecvV');
  SDLNet_UDP_Send := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_Send');
  SDLNet_UDP_SendV := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_SendV');
  SDLNet_UDP_SetPacketLoss := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_SetPacketLoss');
  SDLNet_UDP_Unbind := MemoryGetProcAddress(aDLLHandle, 'SDLNet_UDP_Unbind');
  stbtt_BakeFontBitmap := MemoryGetProcAddress(aDLLHandle, 'stbtt_BakeFontBitmap');
  stbtt_CompareUTF8toUTF16_bigendian := MemoryGetProcAddress(aDLLHandle, 'stbtt_CompareUTF8toUTF16_bigendian');
  stbtt_FindGlyphIndex := MemoryGetProcAddress(aDLLHandle, 'stbtt_FindGlyphIndex');
  stbtt_FindMatchingFont := MemoryGetProcAddress(aDLLHandle, 'stbtt_FindMatchingFont');
  stbtt_FindSVGDoc := MemoryGetProcAddress(aDLLHandle, 'stbtt_FindSVGDoc');
  stbtt_FreeBitmap := MemoryGetProcAddress(aDLLHandle, 'stbtt_FreeBitmap');
  stbtt_FreeSDF := MemoryGetProcAddress(aDLLHandle, 'stbtt_FreeSDF');
  stbtt_FreeShape := MemoryGetProcAddress(aDLLHandle, 'stbtt_FreeShape');
  stbtt_GetBakedQuad := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetBakedQuad');
  stbtt_GetCodepointBitmap := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointBitmap');
  stbtt_GetCodepointBitmapBox := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointBitmapBox');
  stbtt_GetCodepointBitmapBoxSubpixel := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointBitmapBoxSubpixel');
  stbtt_GetCodepointBitmapSubpixel := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointBitmapSubpixel');
  stbtt_GetCodepointBox := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointBox');
  stbtt_GetCodepointHMetrics := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointHMetrics');
  stbtt_GetCodepointKernAdvance := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointKernAdvance');
  stbtt_GetCodepointSDF := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointSDF');
  stbtt_GetCodepointShape := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointShape');
  stbtt_GetCodepointSVG := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetCodepointSVG');
  stbtt_GetFontBoundingBox := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetFontBoundingBox');
  stbtt_GetFontNameString := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetFontNameString');
  stbtt_GetFontOffsetForIndex := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetFontOffsetForIndex');
  stbtt_GetFontVMetrics := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetFontVMetrics');
  stbtt_GetFontVMetricsOS2 := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetFontVMetricsOS2');
  stbtt_GetGlyphBitmap := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphBitmap');
  stbtt_GetGlyphBitmapBox := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphBitmapBox');
  stbtt_GetGlyphBitmapBoxSubpixel := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphBitmapBoxSubpixel');
  stbtt_GetGlyphBitmapSubpixel := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphBitmapSubpixel');
  stbtt_GetGlyphBox := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphBox');
  stbtt_GetGlyphHMetrics := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphHMetrics');
  stbtt_GetGlyphKernAdvance := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphKernAdvance');
  stbtt_GetGlyphSDF := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphSDF');
  stbtt_GetGlyphShape := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphShape');
  stbtt_GetGlyphSVG := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetGlyphSVG');
  stbtt_GetKerningTable := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetKerningTable');
  stbtt_GetKerningTableLength := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetKerningTableLength');
  stbtt_GetNumberOfFonts := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetNumberOfFonts');
  stbtt_GetPackedQuad := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetPackedQuad');
  stbtt_GetScaledFontVMetrics := MemoryGetProcAddress(aDLLHandle, 'stbtt_GetScaledFontVMetrics');
  stbtt_InitFont := MemoryGetProcAddress(aDLLHandle, 'stbtt_InitFont');
  stbtt_IsGlyphEmpty := MemoryGetProcAddress(aDLLHandle, 'stbtt_IsGlyphEmpty');
  stbtt_MakeCodepointBitmap := MemoryGetProcAddress(aDLLHandle, 'stbtt_MakeCodepointBitmap');
  stbtt_MakeCodepointBitmapSubpixel := MemoryGetProcAddress(aDLLHandle, 'stbtt_MakeCodepointBitmapSubpixel');
  stbtt_MakeCodepointBitmapSubpixelPrefilter := MemoryGetProcAddress(aDLLHandle, 'stbtt_MakeCodepointBitmapSubpixelPrefilter');
  stbtt_MakeGlyphBitmap := MemoryGetProcAddress(aDLLHandle, 'stbtt_MakeGlyphBitmap');
  stbtt_MakeGlyphBitmapSubpixel := MemoryGetProcAddress(aDLLHandle, 'stbtt_MakeGlyphBitmapSubpixel');
  stbtt_MakeGlyphBitmapSubpixelPrefilter := MemoryGetProcAddress(aDLLHandle, 'stbtt_MakeGlyphBitmapSubpixelPrefilter');
  stbtt_PackBegin := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackBegin');
  stbtt_PackEnd := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackEnd');
  stbtt_PackFontRange := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackFontRange');
  stbtt_PackFontRanges := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackFontRanges');
  stbtt_PackFontRangesGatherRects := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackFontRangesGatherRects');
  stbtt_PackFontRangesPackRects := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackFontRangesPackRects');
  stbtt_PackFontRangesRenderIntoRects := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackFontRangesRenderIntoRects');
  stbtt_PackSetOversampling := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackSetOversampling');
  stbtt_PackSetSkipMissingCodepoints := MemoryGetProcAddress(aDLLHandle, 'stbtt_PackSetSkipMissingCodepoints');
  stbtt_Rasterize := MemoryGetProcAddress(aDLLHandle, 'stbtt_Rasterize');
  stbtt_ScaleForMappingEmToPixels := MemoryGetProcAddress(aDLLHandle, 'stbtt_ScaleForMappingEmToPixels');
  stbtt_ScaleForPixelHeight := MemoryGetProcAddress(aDLLHandle, 'stbtt_ScaleForPixelHeight');
{$ENDREGION}
end;

{$R DelphiGamekit.res}

var
  DllHandle: Pointer = nil;
  DllFilename: string = '';

procedure AbortDLL;
begin
  Halt;
end;

procedure LoadDLL;
const
  cDllResName = '5148206279eb477491c0cb267c37fe11';
var
  LResStream: TResourceStream;
begin
  if Assigned(DllHandle) then Exit;
  if not Boolean((FindResource(HInstance, PChar(cDllResName), RT_RCDATA) <> 0)) then AbortDLL;
  LResStream := TResourceStream.Create(HInstance, cDLLResName, RT_RCDATA);
  try
    LResStream.Position := 0;
    DllHandle := MemoryLoadLibary(LResStream.Memory);
  finally
    LResStream.Free;
  end;
  if not Assigned(DllHandle) then Exit;
  GetExports(DllHandle);
end;

procedure UnloadDLL;
begin
  if not Assigned(DllHandle) then Exit;
  MemoryFreeLibrary(DllHandle);
  DllHandle := nil;
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.MemoryModule '}
{$IF NOT DECLARED(IMAGE_BASE_RELOCATION)}
type
{$ALIGN 4}
  IMAGE_BASE_RELOCATION = record
    VirtualAddress: DWORD;
    SizeOfBlock: DWORD;
  end;
{$ALIGN ON}

  PIMAGE_BASE_RELOCATION = ^IMAGE_BASE_RELOCATION;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_DATA_DIRECTORY)}
type
  PIMAGE_DATA_DIRECTORY = ^IMAGE_DATA_DIRECTORY;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_SECTION_HEADER)}

type
  PIMAGE_SECTION_HEADER = ^IMAGE_SECTION_HEADER;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_EXPORT_DIRECTORY)}

type
  PIMAGE_EXPORT_DIRECTORY = ^IMAGE_EXPORT_DIRECTORY;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_DOS_HEADER)}

type
  PIMAGE_DOS_HEADER = ^IMAGE_DOS_HEADER;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_NT_HEADERS)}

type
  PIMAGE_NT_HEADERS = ^IMAGE_NT_HEADERS;
{$IFEND}
{$IF NOT DECLARED(PUINT_PTR)}

type
  PUINT_PTR = ^UINT_PTR;
{$IFEND}

const
  IMAGE_REL_BASED_ABSOLUTE = 0;
  IMAGE_REL_BASED_HIGHLOW = 3;
  IMAGE_REL_BASED_DIR64 = 10;

{$IFDEF CPUX64}
type
  PIMAGE_TLS_DIRECTORY = PIMAGE_TLS_DIRECTORY64;

const
  IMAGE_ORDINAL_FLAG = IMAGE_ORDINAL_FLAG64;
{$ENDIF}

const
  IMAGE_SIZEOF_BASE_RELOCATION = SizeOf(IMAGE_BASE_RELOCATION);
{$IFDEF CPUX64}
  HOST_MACHINE = IMAGE_FILE_MACHINE_AMD64;
{$ELSE}
  HOST_MACHINE = IMAGE_FILE_MACHINE_I386;
{$ENDIF}

type
  TMemoryModuleRec = record
    Headers: PIMAGE_NT_HEADERS;
    CodeBase: Pointer;
    Modules: array of HMODULE;
    NumModules: Integer;
    Initialized: Boolean;
    IsRelocated: Boolean;
    PageSize: DWORD;
  end;

  PMemoryModule = ^TMemoryModuleRec;

  TDllEntryProc = function(hinstDLL: HINST; fdwReason: DWORD; lpReserved: Pointer): BOOL; stdcall;

  TSectionFinalizeData = record
    Address: Pointer;
    AlignedAddress: Pointer;
    Size: SIZE_T;
    Characteristics: DWORD;
    Last: Boolean;
  end;

function GetProcAddress_Internal(HMODULE: HMODULE; lpProcName: LPCSTR): FARPROC; stdcall; external kernel32 name 'GetProcAddress';
function LoadLibraryA_Internal(lpLibFileName: LPCSTR): HMODULE; stdcall; external kernel32 name 'LoadLibraryA';
function FreeLibrary_Internal(hLibModule: HMODULE): BOOL; stdcall; external kernel32 name 'FreeLibrary';

procedure Abort;
begin
  raise TObject.Create;
end;

function StrComp(const Str1, Str2: PAnsiChar): Integer;
var
  P1, P2: PAnsiChar;
begin
  P1 := Str1;
  P2 := Str2;
  while True do
  begin
    if (P1^ <> P2^) or (P1^ = #0) then
      Exit(Ord(P1^) - Ord(P2^));
    Inc(P1);
    Inc(P2);
  end;
end;

{$IF NOT DECLARED(IMAGE_ORDINAL)}
function IMAGE_ORDINAL(Ordinal: NativeUInt): Word; inline;
begin
  Result := Ordinal and $FFFF;
end;
{$IFEND}

{$IF NOT DECLARED(IMAGE_SNAP_BY_ORDINAL)}
function IMAGE_SNAP_BY_ORDINAL(Ordinal: NativeUInt): Boolean; inline;
begin
  Result := ((Ordinal and IMAGE_ORDINAL_FLAG) <> 0);
end;
{$IFEND}

function GET_HEADER_DICTIONARY(Module: PMemoryModule; Idx: Integer): PIMAGE_DATA_DIRECTORY;
begin
  Result := PIMAGE_DATA_DIRECTORY
    (@(Module.Headers.OptionalHeader.DataDirectory[Idx]));
end;

function ALIGN_DOWN(Address: Pointer; Alignment: DWORD): Pointer;
begin
  Result := Pointer(UIntPtr(Address) and not(Alignment - 1));
end;

function CopySections(Data: Pointer; old_headers: PIMAGE_NT_HEADERS; Module: PMemoryModule): Boolean;
var
  i, Size: Integer;
  CodeBase: Pointer;
  dest: Pointer;
  Section: PIMAGE_SECTION_HEADER;
begin
  CodeBase := Module.CodeBase;
  Section := PIMAGE_SECTION_HEADER
    (IMAGE_FIRST_SECTION(Module.Headers{$IFNDEF FPC}^{$ENDIF}));
  for i := 0 to Module.Headers.FileHeader.NumberOfSections - 1 do
  begin
    if Section.SizeOfRawData = 0 then
    begin
      Size := old_headers.OptionalHeader.SectionAlignment;
      if Size > 0 then
      begin
        dest := VirtualAlloc(PByte(CodeBase) + Section.VirtualAddress, Size,
          MEM_COMMIT, PAGE_READWRITE);
        if dest = nil then
          Exit(False);
        dest := PByte(CodeBase) + Section.VirtualAddress;
        Section.Misc.PhysicalAddress := DWORD(dest);
        ZeroMemory(dest, Size);
      end;
      Inc(Section);
      Continue;
    end; // if

    dest := VirtualAlloc(PByte(CodeBase) + Section.VirtualAddress,
      Section.SizeOfRawData, MEM_COMMIT, PAGE_READWRITE);
    if dest = nil then
      Exit(False);

    dest := PByte(CodeBase) + Section.VirtualAddress;
    CopyMemory(dest, PByte(Data) + Section.PointerToRawData,
      Section.SizeOfRawData);
    Section.Misc.PhysicalAddress := DWORD(dest);
    Inc(Section);
  end; // for

  Result := True;
end;

const
  ProtectionFlags: array [Boolean, Boolean, Boolean] of DWORD = ((
    (PAGE_NOACCESS, PAGE_WRITECOPY), (PAGE_READONLY, PAGE_READWRITE)), (
    (PAGE_EXECUTE, PAGE_EXECUTE_WRITECOPY), (PAGE_EXECUTE_READ,
    PAGE_EXECUTE_READWRITE)));

function GetRealSectionSize(Module: PMemoryModule; Section: PIMAGE_SECTION_HEADER): DWORD;
begin
  Result := Section.SizeOfRawData;
  if Result = 0 then
    if (Section.Characteristics and IMAGE_SCN_CNT_INITIALIZED_DATA) <> 0 then
      Result := Module.Headers.OptionalHeader.SizeOfInitializedData
    else if (Section.Characteristics and IMAGE_SCN_CNT_UNINITIALIZED_DATA) <> 0
    then
      Result := Module.Headers.OptionalHeader.SizeOfUninitializedData;
end;

function FinalizeSection(Module: PMemoryModule; const SectionData: TSectionFinalizeData): Boolean;
var
  protect, oldProtect: DWORD;
  executable, readable, writeable: Boolean;
begin
  if SectionData.Size = 0 then
    Exit(True);

  if (SectionData.Characteristics and IMAGE_SCN_MEM_DISCARDABLE) <> 0 then
  begin
    if (SectionData.Address = SectionData.AlignedAddress) and
      (SectionData.Last or
      (Module.Headers.OptionalHeader.SectionAlignment = Module.PageSize) or
      (SectionData.Size mod Module.PageSize = 0)) then
      VirtualFree(SectionData.Address, SectionData.Size, MEM_DECOMMIT);
    Exit(True);
  end;

  executable := (SectionData.Characteristics and IMAGE_SCN_MEM_EXECUTE) <> 0;
  readable := (SectionData.Characteristics and IMAGE_SCN_MEM_READ) <> 0;
  writeable := (SectionData.Characteristics and IMAGE_SCN_MEM_WRITE) <> 0;
  protect := ProtectionFlags[executable][readable][writeable];
  if (SectionData.Characteristics and IMAGE_SCN_MEM_NOT_CACHED) <> 0 then
    protect := protect or PAGE_NOCACHE;

  Result := VirtualProtect(SectionData.Address, SectionData.Size, protect,
    oldProtect);
end;

function FinalizeSections(Module: PMemoryModule): Boolean;
var
  i: Integer;
  Section: PIMAGE_SECTION_HEADER;
  imageOffset: UIntPtr;
  SectionData: TSectionFinalizeData;
  sectionAddress, AlignedAddress: Pointer;
  sectionSize: DWORD;
begin
  Section := PIMAGE_SECTION_HEADER
    (IMAGE_FIRST_SECTION(Module.Headers{$IFNDEF FPC}^{$ENDIF}));
{$IFDEF CPUX64}
  imageOffset := (NativeUInt(Module.CodeBase) and $FFFFFFFF00000000);
{$ELSE}
  imageOffset := 0;
{$ENDIF}
  SectionData.Address := Pointer(UIntPtr(Section.Misc.PhysicalAddress) or
    imageOffset);
  SectionData.AlignedAddress := ALIGN_DOWN(SectionData.Address,
    Module.PageSize);
  SectionData.Size := GetRealSectionSize(Module, Section);
  SectionData.Characteristics := Section.Characteristics;
  SectionData.Last := False;
  Inc(Section);


  for i := 1 to Module.Headers.FileHeader.NumberOfSections - 1 do
  begin
    sectionAddress := Pointer(UIntPtr(Section.Misc.PhysicalAddress) or
      imageOffset);
    AlignedAddress := ALIGN_DOWN(SectionData.Address, Module.PageSize);
    sectionSize := GetRealSectionSize(Module, Section);
    if (SectionData.AlignedAddress = AlignedAddress) or
      (PByte(SectionData.Address) + SectionData.Size > PByte(AlignedAddress))
    then
    begin
      if (Section.Characteristics and IMAGE_SCN_MEM_DISCARDABLE = 0) or
        (SectionData.Characteristics and IMAGE_SCN_MEM_DISCARDABLE = 0) then
        SectionData.Characteristics :=
          (SectionData.Characteristics or Section.Characteristics) and
          not IMAGE_SCN_MEM_DISCARDABLE
      else
        SectionData.Characteristics := SectionData.Characteristics or
          Section.Characteristics;
      SectionData.Size := PByte(sectionAddress) + sectionSize -
        PByte(SectionData.Address);
      Inc(Section);
      Continue;
    end;

    if not FinalizeSection(Module, SectionData) then
      Exit(False);

    SectionData.Address := sectionAddress;
    SectionData.AlignedAddress := AlignedAddress;
    SectionData.Size := sectionSize;
    SectionData.Characteristics := Section.Characteristics;

    Inc(Section);
  end; // for

  SectionData.Last := True;
  if not FinalizeSection(Module, SectionData) then
    Exit(False);

  Result := True;
end;

function ExecuteTLS(Module: PMemoryModule): Boolean;
var
  CodeBase: Pointer;
  directory: PIMAGE_DATA_DIRECTORY;
  tls: PIMAGE_TLS_DIRECTORY;
  callback: PPointer; // =^PIMAGE_TLS_CALLBACK;

  function FixPtr(OldPtr: Pointer): Pointer;
  begin
    Result := Pointer(NativeInt(OldPtr) -
      NativeInt(Module.Headers.OptionalHeader.ImageBase) + NativeInt(CodeBase));
  end;

begin
  Result := True;
  CodeBase := Module.CodeBase;

  directory := GET_HEADER_DICTIONARY(Module, IMAGE_DIRECTORY_ENTRY_TLS);
  if directory.VirtualAddress = 0 then
    Exit;

  tls := PIMAGE_TLS_DIRECTORY(PByte(CodeBase) + directory.VirtualAddress);
  callback := Pointer(tls.AddressOfCallBacks);
  if callback <> nil then
  begin
    callback := FixPtr(callback);
    while callback^ <> nil do
    begin
      PIMAGE_TLS_CALLBACK(FixPtr(callback^))(CodeBase, DLL_PROCESS_ATTACH, nil);
      Inc(callback);
    end;
  end;
end;

function PerformBaseRelocation(Module: PMemoryModule; Delta: NativeInt): Boolean;
var
  i: Cardinal;
  CodeBase: Pointer;
  directory: PIMAGE_DATA_DIRECTORY;
  relocation: PIMAGE_BASE_RELOCATION;
  dest: Pointer;
  relInfo: ^UInt16;
  patchAddrHL: PDWORD;
{$IFDEF CPUX64}
  patchAddr64: PULONGLONG;
{$ENDIF}
  relType, offset: Integer;
begin
  CodeBase := Module.CodeBase;
  directory := GET_HEADER_DICTIONARY(Module, IMAGE_DIRECTORY_ENTRY_BASERELOC);
  if directory.Size = 0 then
    Exit(Delta = 0);

  relocation := PIMAGE_BASE_RELOCATION(PByte(CodeBase) +
    directory.VirtualAddress);
  while relocation.VirtualAddress > 0 do
  begin
    dest := Pointer(PByte(CodeBase) + relocation.VirtualAddress);
    relInfo := Pointer(PByte(relocation) + IMAGE_SIZEOF_BASE_RELOCATION);
    for i := 0 to Trunc(((relocation.SizeOfBlock - IMAGE_SIZEOF_BASE_RELOCATION)
      / 2)) - 1 do
    begin
      relType := relInfo^ shr 12;
      offset := relInfo^ and $FFF;

      case relType of
        IMAGE_REL_BASED_ABSOLUTE:
          ;
        IMAGE_REL_BASED_HIGHLOW:
          begin
            patchAddrHL := Pointer(PByte(dest) + offset);
            Inc(patchAddrHL^, Delta);
          end;

{$IFDEF CPUX64}
        IMAGE_REL_BASED_DIR64:
          begin
            patchAddr64 := Pointer(PByte(dest) + offset);
            Inc(patchAddr64^, Delta);
          end;
{$ENDIF}
      end;

      Inc(relInfo);
    end; // for

    relocation := PIMAGE_BASE_RELOCATION(PByte(relocation) +
      relocation.SizeOfBlock);
  end; // while

  Result := True;
end;

function BuildImportTable(Module: PMemoryModule): Boolean; stdcall;
var
  CodeBase: Pointer;
  directory: PIMAGE_DATA_DIRECTORY;
  importDesc: PIMAGE_IMPORT_DESCRIPTOR;
  thunkRef: PUINT_PTR;
  funcRef: ^FARPROC;
  handle: HMODULE;
  thunkData: PIMAGE_IMPORT_BY_NAME;
begin
  CodeBase := Module.CodeBase;
  Result := True;

  directory := GET_HEADER_DICTIONARY(Module, IMAGE_DIRECTORY_ENTRY_IMPORT);
  if directory.Size = 0 then
    Exit(True);

  importDesc := PIMAGE_IMPORT_DESCRIPTOR(PByte(CodeBase) +
    directory.VirtualAddress);
  while (not IsBadReadPtr(importDesc, SizeOf(IMAGE_IMPORT_DESCRIPTOR))) and
    (importDesc.Name <> 0) do
  begin
    handle := LoadLibraryA_Internal
      (PAnsiChar(PByte(CodeBase) + importDesc.Name));
    if handle = 0 then
    begin
      SetLastError(ERROR_MOD_NOT_FOUND);
      Result := False;
      Break;
    end;

    try
      SetLength(Module.Modules, Module.NumModules + 1);
    except
      FreeLibrary_Internal(handle);
      SetLastError(ERROR_OUTOFMEMORY);
      Result := False;
      Break;
    end;
    Module.Modules[Module.NumModules] := handle;
    Inc(Module.NumModules);

    if importDesc.OriginalFirstThunk <> 0 then
    begin
      thunkRef := Pointer(PByte(CodeBase) + importDesc.OriginalFirstThunk);
      funcRef := Pointer(PByte(CodeBase) + importDesc.FirstThunk);
    end
    else
    begin
      thunkRef := Pointer(PByte(CodeBase) + importDesc.FirstThunk);
      funcRef := Pointer(PByte(CodeBase) + importDesc.FirstThunk);
    end;

    while thunkRef^ <> 0 do
    begin
      if IMAGE_SNAP_BY_ORDINAL(thunkRef^) then
        funcRef^ := GetProcAddress_Internal(handle,
          PAnsiChar(IMAGE_ORDINAL(thunkRef^)))
      else
      begin
        thunkData := PIMAGE_IMPORT_BY_NAME(PByte(CodeBase) + thunkRef^);
        funcRef^ := GetProcAddress_Internal(handle,
          PAnsiChar(@(thunkData.Name)));
      end;
      if funcRef^ = nil then
      begin
        Result := False;
        Break;
      end;
      Inc(funcRef);
      Inc(thunkRef);
    end; // while

    if not Result then
    begin
      FreeLibrary_Internal(handle);
      SetLastError(ERROR_PROC_NOT_FOUND);
      Break;
    end;

    Inc(importDesc);
  end; // while
end;

function MemoryLoadLibary(Data: Pointer): TMemoryModule; stdcall;
var
  dos_header: PIMAGE_DOS_HEADER;
  old_header: PIMAGE_NT_HEADERS;
  code, Headers: Pointer;
  locationdelta: NativeInt;
  sysInfo: SYSTEM_INFO;
  DllEntry: TDllEntryProc;
  successfull: Boolean;
  Module: PMemoryModule;
begin
  Result := nil;
  Module := nil;

  try
    dos_header := PIMAGE_DOS_HEADER(Data);
    if (dos_header.e_magic <> IMAGE_DOS_SIGNATURE) then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    old_header := PIMAGE_NT_HEADERS(PByte(Data) + dos_header._lfanew);
    if old_header.Signature <> IMAGE_NT_SIGNATURE then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

{$IFDEF CPUX64}
    if old_header.FileHeader.Machine <> IMAGE_FILE_MACHINE_AMD64 then
{$ELSE}
    if old_header.FileHeader.Machine <> IMAGE_FILE_MACHINE_I386 then
{$ENDIF}
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    if (old_header.OptionalHeader.SectionAlignment and 1) <> 0 then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    code := VirtualAlloc(Pointer(old_header.OptionalHeader.ImageBase),
      old_header.OptionalHeader.SizeOfImage, MEM_RESERVE or MEM_COMMIT,
      PAGE_READWRITE);
    if code = nil then
    begin
      code := VirtualAlloc(nil, old_header.OptionalHeader.SizeOfImage,
        MEM_RESERVE or MEM_COMMIT, PAGE_READWRITE);
      if code = nil then
      begin
        SetLastError(ERROR_OUTOFMEMORY);
        Exit;
      end;
    end;

    Module := PMemoryModule(HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY,
      SizeOf(TMemoryModuleRec)));
    if Module = nil then
    begin
      VirtualFree(code, 0, MEM_RELEASE);
      SetLastError(ERROR_OUTOFMEMORY);
      Exit;
    end;

    Module.CodeBase := code;
    GetNativeSystemInfo({$IFDEF FPC}@{$ENDIF}sysInfo);
    Module.PageSize := sysInfo.dwPageSize;

    Headers := VirtualAlloc(code, old_header.OptionalHeader.SizeOfHeaders,
      MEM_COMMIT, PAGE_READWRITE);

    CopyMemory(Headers, dos_header, old_header.OptionalHeader.SizeOfHeaders);
    Module.Headers := PIMAGE_NT_HEADERS(PByte(Headers) + dos_header._lfanew);

    if not CopySections(Data, old_header, Module) then
      Abort;

    locationdelta := NativeInt(code) -
      NativeInt(old_header.OptionalHeader.ImageBase);
    if locationdelta <> 0 then
      Module.IsRelocated := PerformBaseRelocation(Module, locationdelta)
    else
      Module.IsRelocated := True;

    if not BuildImportTable(Module) then
      Abort;

    if not FinalizeSections(Module) then
      Abort;

    if not ExecuteTLS(Module) then
      Abort;

    if Module.Headers.OptionalHeader.AddressOfEntryPoint <> 0 then
    begin
      @DllEntry := Pointer(PByte(code) + Module.Headers.OptionalHeader.AddressOfEntryPoint);
      successfull := DllEntry(HINST(code), DLL_PROCESS_ATTACH, nil);
      if not successfull then
      begin
        SetLastError(ERROR_DLL_INIT_FAILED);
        Abort;
      end;
      Module.Initialized := True;
    end;

    Result := Module;
  except
    MemoryFreeLibrary(Module);
    Exit;
  end;
end;

function MemoryGetProcAddress(Module: TMemoryModule; const Name: PAnsiChar): Pointer; stdcall;
var
  CodeBase: Pointer;
  Idx: Integer;
  i: DWORD;
  nameRef: PDWORD;
  Ordinal: PWord;
  exportDir: PIMAGE_EXPORT_DIRECTORY;
  directory: PIMAGE_DATA_DIRECTORY;
  temp: PDWORD;
  mmodule: PMemoryModule;
begin
  Result := nil;
  mmodule := PMemoryModule(Module);

  CodeBase := mmodule.CodeBase;
  directory := GET_HEADER_DICTIONARY(mmodule, IMAGE_DIRECTORY_ENTRY_EXPORT);
  if directory.Size = 0 then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  exportDir := PIMAGE_EXPORT_DIRECTORY(PByte(CodeBase) +
    directory.VirtualAddress);
  if (exportDir.NumberOfNames = 0) or (exportDir.NumberOfFunctions = 0) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  nameRef := Pointer(PByte(CodeBase) + exportDir.AddressOfNames);
  Ordinal := Pointer(PByte(CodeBase) + exportDir.AddressOfNameOrdinals);
  Idx := -1;
  for i := 0 to exportDir.NumberOfNames - 1 do
  begin
    if StrComp(Name, PAnsiChar(PByte(CodeBase) + nameRef^)) = 0 then
    begin
      Idx := Ordinal^;
      Break;
    end;
    Inc(nameRef);
    Inc(Ordinal);
  end;

  if (Idx = -1) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  if (DWORD(Idx) > exportDir.NumberOfFunctions) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  temp := Pointer(PByte(CodeBase) + exportDir.AddressOfFunctions + Idx * 4);
  Result := Pointer(PByte(CodeBase) + temp^);
end;

procedure MemoryFreeLibrary(Module: TMemoryModule); stdcall;
var
  i: Integer;
  DllEntry: TDllEntryProc;
  mmodule: PMemoryModule;
begin
  if Module = nil then
    Exit;

  mmodule := PMemoryModule(Module);

  if mmodule.Initialized then
  begin
    @DllEntry := Pointer(PByte(mmodule.CodeBase) +
      mmodule.Headers.OptionalHeader.AddressOfEntryPoint);
    DllEntry(HINST(mmodule.CodeBase), DLL_PROCESS_DETACH, nil);
  end;

  if Length(mmodule.Modules) <> 0 then
  begin
    for i := 0 to mmodule.NumModules - 1 do
      if mmodule.Modules[i] <> 0 then
        FreeLibrary_Internal(mmodule.Modules[i]);

    SetLength(mmodule.Modules, 0);
  end;

  if mmodule.CodeBase <> nil then
    VirtualFree(mmodule.CodeBase, 0, MEM_RELEASE);

  HeapFree(GetProcessHeap(), 0, mmodule);
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.EncryptedZipFile '}
resourcestring
  SInvalidPassword = 'invalid password';
  SNoPassword = 'no password';
  SInvalidOp = 'Invalid Stream operation!';

type

  TCryptor = class
  private const
    CRC32_TABLE: array [0 .. 255] of longword = (
      $00000000, $77073096, $EE0E612C, $990951BA, $076DC419, $706AF48F, $E963A535, $9E6495A3,
      $0EDB8832, $79DCB8A4, $E0D5E91E, $97D2D988, $09B64C2B, $7EB17CBD, $E7B82D07, $90BF1D91,
      $1DB71064, $6AB020F2, $F3B97148, $84BE41DE, $1ADAD47D, $6DDDE4EB, $F4D4B551, $83D385C7,
      $136C9856, $646BA8C0, $FD62F97A, $8A65C9EC, $14015C4F, $63066CD9, $FA0F3D63, $8D080DF5,
      $3B6E20C8, $4C69105E, $D56041E4, $A2677172, $3C03E4D1, $4B04D447, $D20D85FD, $A50AB56B,
      $35B5A8FA, $42B2986C, $DBBBC9D6, $ACBCF940, $32D86CE3, $45DF5C75, $DCD60DCF, $ABD13D59,
      $26D930AC, $51DE003A, $C8D75180, $BFD06116, $21B4F4B5, $56B3C423, $CFBA9599, $B8BDA50F,
      $2802B89E, $5F058808, $C60CD9B2, $B10BE924, $2F6F7C87, $58684C11, $C1611DAB, $B6662D3D,
      $76DC4190, $01DB7106, $98D220BC, $EFD5102A, $71B18589, $06B6B51F, $9FBFE4A5, $E8B8D433,
      $7807C9A2, $0F00F934, $9609A88E, $E10E9818, $7F6A0DBB, $086D3D2D, $91646C97, $E6635C01,
      $6B6B51F4, $1C6C6162, $856530D8, $F262004E, $6C0695ED, $1B01A57B, $8208F4C1, $F50FC457,
      $65B0D9C6, $12B7E950, $8BBEB8EA, $FCB9887C, $62DD1DDF, $15DA2D49, $8CD37CF3, $FBD44C65,
      $4DB26158, $3AB551CE, $A3BC0074, $D4BB30E2, $4ADFA541, $3DD895D7, $A4D1C46D, $D3D6F4FB,
      $4369E96A, $346ED9FC, $AD678846, $DA60B8D0, $44042D73, $33031DE5, $AA0A4C5F, $DD0D7CC9,
      $5005713C, $270241AA, $BE0B1010, $C90C2086, $5768B525, $206F85B3, $B966D409, $CE61E49F,
      $5EDEF90E, $29D9C998, $B0D09822, $C7D7A8B4, $59B33D17, $2EB40D81, $B7BD5C3B, $C0BA6CAD,
      $EDB88320, $9ABFB3B6, $03B6E20C, $74B1D29A, $EAD54739, $9DD277AF, $04DB2615, $73DC1683,
      $E3630B12, $94643B84, $0D6D6A3E, $7A6A5AA8, $E40ECF0B, $9309FF9D, $0A00AE27, $7D079EB1,
      $F00F9344, $8708A3D2, $1E01F268, $6906C2FE, $F762575D, $806567CB, $196C3671, $6E6B06E7,
      $FED41B76, $89D32BE0, $10DA7A5A, $67DD4ACC, $F9B9DF6F, $8EBEEFF9, $17B7BE43, $60B08ED5,
      $D6D6A3E8, $A1D1937E, $38D8C2C4, $4FDFF252, $D1BB67F1, $A6BC5767, $3FB506DD, $48B2364B,
      $D80D2BDA, $AF0A1B4C, $36034AF6, $41047A60, $DF60EFC3, $A867DF55, $316E8EEF, $4669BE79,
      $CB61B38C, $BC66831A, $256FD2A0, $5268E236, $CC0C7795, $BB0B4703, $220216B9, $5505262F,
      $C5BA3BBE, $B2BD0B28, $2BB45A92, $5CB36A04, $C2D7FFA7, $B5D0CF31, $2CD99E8B, $5BDEAE1D,
      $9B64C2B0, $EC63F226, $756AA39C, $026D930A, $9C0906A9, $EB0E363F, $72076785, $05005713,
      $95BF4A82, $E2B87A14, $7BB12BAE, $0CB61B38, $92D28E9B, $E5D5BE0D, $7CDCEFB7, $0BDBDF21,
      $86D3D2D4, $F1D4E242, $68DDB3F8, $1FDA836E, $81BE16CD, $F6B9265B, $6FB077E1, $18B74777,
      $88085AE6, $FF0F6A70, $66063BCA, $11010B5C, $8F659EFF, $F862AE69, $616BFFD3, $166CCF45,
      $A00AE278, $D70DD2EE, $4E048354, $3903B3C2, $A7672661, $D06016F7, $4969474D, $3E6E77DB,
      $AED16A4A, $D9D65ADC, $40DF0B66, $37D83BF0, $A9BCAE53, $DEBB9EC5, $47B2CF7F, $30B5FFE9,
      $BDBDF21C, $CABAC28A, $53B39330, $24B4A3A6, $BAD03605, $CDD70693, $54DE5729, $23D967BF,
      $B3667A2E, $C4614AB8, $5D681B02, $2A6F2B94, $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D);

  private
    FKey: array [0 .. 2] of Int64;
  protected
    function CalcDecryptByte: Byte;
    function UpdateCRC32(aKey: longword; aValue: Byte): longword;
    procedure UpdateKeys(aValue: Byte);
  public
    procedure InitKeys(const APassword: string);
    procedure DecryptByte(var aValue: Byte);
    procedure EncryptByte(var aValue: Byte);
  end;

  TCryptStream = class(TStream)
  private
    FCryptor: TCryptor;
    FPassword: string;
    FStream: TStream;
    FStreamStartPos: Int64;
    FStreamEndPos: Int64;
    FStreamSize: Int64;
    FZipHeader: TZipHeader;
  protected
    procedure InitHeader; virtual; abstract;
    procedure InitKeys;
    procedure ResetStream;
    property Stream: TStream read FStream;
  public
    constructor Create(aStream: TStream; const aPassword: string; const aZipHeader: TZipHeader);
    destructor Destroy; override;
    function Read(var aBuffer; aCount: Integer): Integer; override;
    function Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64; override;
    function Write(const aBuffer; aCount: Integer): Integer; override;
  end;

  TDecryptStream = class(TCryptStream)
  protected
    procedure InitHeader; override;
    function Skip(aValue: Int64): Int64;
  public
    function Read(var aBuffer; aCount: Integer): Integer; override;
    function Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64; override;
  end;

  TEncryptStream = class(TCryptStream)
  protected
    procedure InitHeader; override;
  public
    function Write(const aBuffer; aCount: Integer): Integer; override;
  end;

  TEncryptedZCompressionStream = class(TMemoryStream)
  private
    FPassword: string;
    FTarget: TStream;
    FZipHeader: PZipHeader;
    procedure EncryptToTarget;
  protected
    property ZipHeader: PZipHeader read FZipHeader;
  public
    constructor Create(aTarget: TStream; const aPassword: string; const aZipHeader: TZipHeader);
    destructor Destroy; override;
    property Password: string read FPassword;
    property Target: TStream read FTarget;
  end;

class constructor TEncryptedZipFile.Create;
begin
  RegisterCompressionHandler(
    zcDeflate,
    function(aInStream: TStream; const aZipFile: TZipFile; const aItem: TZipHeader): TStream
    begin
      if HasPassword(aZipFile) then begin
        Result := TEncryptedZCompressionStream.Create(aInStream, TEncryptedZipFile(aZipFile).Password, aItem);
      end
      else begin
        Result := TZCompressionStream.Create(aInStream, zcDefault, -15);
      end;
    end,
    function(aInStream: TStream; const aZipFile: TZipFile; const aItem: TZipHeader): TStream
    var
      LStream : TStream;
      LIsEncrypted: Boolean;
    begin
      LIsEncrypted := (aItem.Flag and 1) = 1;

      if Assigned(TZipFile.OnCreateDecompressStream) then
        LStream := TZipFile.OnCreateDecompressStream(aInStream, aZipFile, aItem, LIsEncrypted)
      else if Assigned(TZipFile.CreateDecompressStreamCallBack) then
        LStream := TZipFile.CreateDecompressStreamCallBack(aInStream, aZipFile, aItem, LIsEncrypted)
      else if LIsEncrypted and (aZipFile is TEncryptedZipFile) then
        LStream := TDecryptStream.Create(aInStream, TEncryptedZipFile(aZipFile).Password, aItem)
      else
        LStream := aInStream;
      Result := TZDecompressionStream.Create(LStream, -15, LStream <> aInStream);
    end
  );
end;

constructor TEncryptedZipFile.Create(const aPassword: string);
begin
  inherited Create;
  FPassword := aPassword;
end;

class function TEncryptedZipFile.HasPassword(const aZipFile: TZipFile): Boolean;
begin
  Result := (aZipFile is TEncryptedZipFile) and (TEncryptedZipFile(aZipFile).Password > '');
end;

constructor TCryptStream.Create(aStream: TStream; const aPassword: string; const aZipHeader: TZipHeader);
begin
  inherited Create;
  FCryptor := TCryptor.Create();
  FStream := aStream;
  FPassword := aPassword;
  FZipHeader := aZipHeader;
  if (FPassword = '') then
    raise EZipNoPassword.Create(SNoPassword);
  FStreamStartPos := FStream.Position;
  FStreamEndPos := FStream.Seek(0, soEnd);
  FStream.Position := FStreamStartPos;
  InitKeys;
  InitHeader;
end;

destructor TCryptStream.Destroy;
begin
  FCryptor.Free;
  inherited Destroy;
end;

procedure TCryptStream.InitKeys;
begin
  FCryptor.InitKeys(FPassword);
end;

function TCryptStream.Read(var aBuffer; aCount: Integer): Integer;
begin
  raise EZipInvalidOperation.Create(SInvalidOp);
end;

procedure TCryptStream.ResetStream;
begin
  if FStream.Position <> FStreamStartPos then begin
    FStream.Position := FStreamStartPos;
  end;
  InitKeys;
  InitHeader;
end;

function TCryptStream.Write(const aBuffer; aCount: Integer): Integer;
begin
  raise EZipInvalidOperation.Create(SInvalidOp);
end;

function TCryptStream.Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64;
begin
  if (aOffset = 0) and (aOrigin = soCurrent) then
  begin
    result := FStream.Position;
  end
  else begin
    raise EZipInvalidOperation.Create(SInvalidOp);
  end;
end;

procedure TDecryptStream.InitHeader;
var
  LHeader: array [0..11] of Byte;
begin
  FStreamSize := FZipHeader.CompressedSize - Sizeof(LHeader);
  ReadBuffer(LHeader, Sizeof(LHeader));
  if LHeader[High(LHeader)] <> (FZipHeader.CRC32 shr 24) then
    raise EZipInvalidPassword.Create(SInvalidPassword);
end;

function TDecryptStream.Read(var aBuffer; aCount: Integer): Integer;
var
  P: PByte;
  I: Integer;
begin
  result := FStream.Read(aBuffer, aCount);
  P := @aBuffer;
  for I := 1 to result do begin
    FCryptor.DecryptByte(P^);
    Inc(P);
  end;
end;

function TDecryptStream.Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64;
var
  LCurPos: Int64;
  LNewPos: Int64;
begin
  LCurPos := FStream.Position;
  LNewPos := LCurPos;
  case aOrigin of
    soBeginning: LNewPos := aOffset;
    soCurrent: LNewPos := LCurPos + aOffset;
    soEnd: LNewPos := FStreamEndPos + aOffset;
  end;
  if LNewPos < LCurPos then
    begin
      ResetStream;
      Result := Skip(LNewPos);
    end
  else
    begin
      Result := Skip(LNewPos - LCurPos);
    end;
end;

function TDecryptStream.Skip(aValue: Int64): Int64;
const
  cMaxBufSize = $F000;
var
  LBuffer: TBytes;
  LCnt: Integer;
begin
  if aValue < cMaxBufSize then
    SetLength(LBuffer, aValue)
  else
    SetLength(LBuffer, cMaxBufSize);

  LCnt := Length(LBuffer);

  while (FStream.Position+LCnt) < aValue do
  begin
    ReadBuffer(LBuffer, LCnt);
  end;

  if FStream.Position < aValue then
  begin
    LCnt := aValue - FStream.Position;
    ReadBuffer(LBuffer, LCnt);
  end;

  Result := FStream.Position;
end;

procedure TEncryptStream.InitHeader;
var
  LHeader: array[0..11] of Byte;
  I: Integer;
begin
  for I := 0 to 10 do begin
    LHeader[I] := Random(256);
  end;
  LHeader[11] := (FZipHeader.CRC32 shr 24);
  WriteBuffer(LHeader, Sizeof(LHeader));
end;

function TEncryptStream.Write(const aBuffer; aCount: Integer): Integer;
const
  cMaxBufSize = $10000;
var
  LBytes: TBytes;
  LCnt: Integer;
  I: Integer;
  P: PByte;
begin
  result := 0;
  if aCount < cMaxBufSize then
    SetLength(LBytes, aCount)
  else
    SetLength(LBytes, cMaxBufSize);

  P := @aBuffer;

  while aCount > 0 do
  begin
    LCnt := Length(LBytes);
    if aCount < LCnt then
      LCnt := aCount;
    Move(P^, LBytes[0], LCnt);
    Inc(P, LCnt);

    for I := 0 to LCnt - 1 do begin
      FCryptor.EncryptByte(LBytes[I]);
    end;

    Result := Result + FStream.Write(LBytes, LCnt);
    aCount := aCount - LCnt;
  end;
end;

function TCryptor.CalcDecryptByte: Byte;
var
  LTemp: UInt64;
begin
  LTemp := FKey[2] or 2;
  Result := Word(LTemp * (LTemp xor 1)) shr 8;
end;

procedure TCryptor.InitKeys(const APassword: string);
var
  B: Byte;
begin
  FKey[0] := 305419896;
  FKey[1] := 591751049;
  FKey[2] := 878082192;

  for B in TEncoding.ANSI.GetBytes(APassword) do
  begin
    UpdateKeys(B);
  end;
end;

procedure TCryptor.DecryptByte(var aValue: Byte);
begin
  aValue := aValue xor CalcDecryptByte;
  UpdateKeys(aValue);
end;

procedure TCryptor.EncryptByte(var aValue: Byte);
var
  LTemp: Byte;
begin
  LTemp := CalcDecryptByte;
  UpdateKeys(aValue);
  aValue := aValue xor LTemp;
end;

function TCryptor.UpdateCRC32(aKey: LongWord; aValue: Byte): LongWord;
begin
  Result := (aKey shr 8) xor CRC32_TABLE[aValue xor (aKey and $000000FF)];
end;

procedure TCryptor.UpdateKeys(aValue: Byte);
begin
  FKey[0] := UpdateCRC32(FKey[0], aValue);
  FKey[1] := FKey[1] + (FKey[0] and $000000FF);
  FKey[1] := longword(FKey[1] * 134775813 + 1);
  FKey[2] := UpdateCRC32(FKey[2], Byte(FKey[1] shr 24));
end;

constructor TEncryptedZCompressionStream.Create(aTarget: TStream; const aPassword: string; const aZipHeader: TZipHeader);
begin
  inherited Create;

  FTarget := aTarget;
  FZipHeader := @aZipHeader;
  FPassword := aPassword;
end;

destructor TEncryptedZCompressionStream.Destroy;
begin
  EncryptToTarget;

  inherited;
end;

procedure TEncryptedZCompressionStream.EncryptToTarget;
var
  LCompressionStream: TStream;
  LEncryptStream: TStream;
begin
  ZipHeader.Flag := ZipHeader.Flag or 1;
  ZipHeader.CRC32 := crc32(0, Memory, Size);
  LEncryptStream := TEncryptStream.Create(Target, Password, ZipHeader^);
  try
    LCompressionStream := TZCompressionStream.Create(LEncryptStream, zcDefault, -15);
    try
      LCompressionStream.CopyFrom(Self, 0);
    finally
      LCompressionStream.Free;
    end;
  finally
    LEncryptStream.Free;
  end;
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Deps.SpeechLib '}
class function CoSpNotifyTranslator.Create: ISpNotifyTranslator;
begin
  Result := CreateComObject(CLASS_SpNotifyTranslator) as ISpNotifyTranslator;
end;

class function CoSpNotifyTranslator.CreateRemote(const MachineName: string)
  : ISpNotifyTranslator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpNotifyTranslator)
    as ISpNotifyTranslator;
end;

procedure TSpNotifyTranslator.InitServerData;
const
  CServerData: TServerData = (ClassId: '{E2AE5372-5D40-11D2-960E-00C04F8EE628}';
    IntfIID: '{ACA16614-5D3D-11D2-960E-00C04F8EE628}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpNotifyTranslator.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpNotifyTranslator;
  end;
end;

procedure TSpNotifyTranslator.ConnectTo(svrIntf: ISpNotifyTranslator);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpNotifyTranslator.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpNotifyTranslator.GetDefaultInterface: ISpNotifyTranslator;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpNotifyTranslator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpNotifyTranslator.Destroy;
begin
  inherited Destroy;
end;

function TSpNotifyTranslator.Notify: HResult;
begin
  Result := DefaultInterface.Notify;
end;

function TSpNotifyTranslator.InitWindowMessage(var hWnd: _RemotableHandle;
  Msg: SYSUINT; wParam: UINT_PTR; lParam: LONG_PTR): HResult;
begin
  Result := DefaultInterface.InitWindowMessage(hWnd, Msg, wParam, lParam);
end;

function TSpNotifyTranslator.InitCallback(pfnCallback: PPPrivateAlias1;
  wParam: UINT_PTR; lParam: LONG_PTR): HResult;
begin
  Result := DefaultInterface.InitCallback(pfnCallback, wParam, lParam);
end;

function TSpNotifyTranslator.InitSpNotifyCallback(pSpCallback: PPPrivateAlias1;
  wParam: UINT_PTR; lParam: LONG_PTR): HResult;
begin
  Result := DefaultInterface.InitSpNotifyCallback(pSpCallback, wParam, lParam);
end;

function TSpNotifyTranslator.InitWin32Event(hEvent: Pointer;
  fCloseHandleOnRelease: Integer): HResult;
begin
  Result := DefaultInterface.InitWin32Event(hEvent, fCloseHandleOnRelease);
end;

function TSpNotifyTranslator.Wait(dwMilliseconds: LongWord): HResult;
begin
  Result := DefaultInterface.Wait(dwMilliseconds);
end;

function TSpNotifyTranslator.GetEventHandle: Pointer;
begin
  Result := DefaultInterface.GetEventHandle;
end;

class function CoSpObjectTokenCategory.Create: ISpeechObjectTokenCategory;
begin
  Result := CreateComObject(CLASS_SpObjectTokenCategory)
    as ISpeechObjectTokenCategory;
end;

class function CoSpObjectTokenCategory.CreateRemote(const MachineName: string)
  : ISpeechObjectTokenCategory;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpObjectTokenCategory)
    as ISpeechObjectTokenCategory;
end;

procedure TSpObjectTokenCategory.InitServerData;
const
  CServerData: TServerData = (ClassId: '{A910187F-0C7A-45AC-92CC-59EDAFB77B53}';
    IntfIID: '{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpObjectTokenCategory.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechObjectTokenCategory;
  end;
end;

procedure TSpObjectTokenCategory.ConnectTo(svrIntf: ISpeechObjectTokenCategory);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpObjectTokenCategory.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpObjectTokenCategory.GetDefaultInterface: ISpeechObjectTokenCategory;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpObjectTokenCategory.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpObjectTokenCategory.Destroy;
begin
  inherited Destroy;
end;

function TSpObjectTokenCategory.Get_Id: WideString;
begin
  Result := DefaultInterface.Id;
end;

procedure TSpObjectTokenCategory.Set_Default(const TokenId: WideString);
begin
  DefaultInterface.Default := TokenId;
end;

function TSpObjectTokenCategory.Get_Default: WideString;
begin
  Result := DefaultInterface.Default;
end;

procedure TSpObjectTokenCategory.SetId(const Id: WideString;
  CreateIfNotExist: WordBool);
begin
  DefaultInterface.SetId(Id, CreateIfNotExist);
end;

function TSpObjectTokenCategory.GetDataKey(Location: SpeechDataKeyLocation)
  : ISpeechDataKey;
begin
  Result := DefaultInterface.GetDataKey(Location);
end;

function TSpObjectTokenCategory.EnumerateTokens(const RequiredAttributes
  : WideString; const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.EnumerateTokens(RequiredAttributes,
    OptionalAttributes);
end;

class function CoSpObjectToken.Create: ISpeechObjectToken;
begin
  Result := CreateComObject(CLASS_SpObjectToken) as ISpeechObjectToken;
end;

class function CoSpObjectToken.CreateRemote(const MachineName: string)
  : ISpeechObjectToken;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpObjectToken)
    as ISpeechObjectToken;
end;

procedure TSpObjectToken.InitServerData;
const
  CServerData: TServerData = (ClassId: '{EF411752-3736-4CB4-9C8C-8EF4CCB58EFE}';
    IntfIID: '{C74A3ADC-B727-4500-A84A-B526721C8B8C}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpObjectToken.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechObjectToken;
  end;
end;

procedure TSpObjectToken.ConnectTo(svrIntf: ISpeechObjectToken);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpObjectToken.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpObjectToken.GetDefaultInterface: ISpeechObjectToken;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpObjectToken.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpObjectToken.Destroy;
begin
  inherited Destroy;
end;

function TSpObjectToken.Get_Id: WideString;
begin
  Result := DefaultInterface.Id;
end;

function TSpObjectToken.Get_DataKey: ISpeechDataKey;
begin
  Result := DefaultInterface.DataKey;
end;

function TSpObjectToken.Get_Category: ISpeechObjectTokenCategory;
begin
  Result := DefaultInterface.Category;
end;

function TSpObjectToken.GetDescription(Locale: Integer): WideString;
begin
  Result := DefaultInterface.GetDescription(Locale);
end;

procedure TSpObjectToken.SetId(const Id: WideString;
  const CategoryID: WideString; CreateIfNotExist: WordBool);
begin
  DefaultInterface.SetId(Id, CategoryID, CreateIfNotExist);
end;

function TSpObjectToken.GetAttribute(const AttributeName: WideString)
  : WideString;
begin
  Result := DefaultInterface.GetAttribute(AttributeName);
end;

function TSpObjectToken.CreateInstance(const pUnkOuter: IUnknown;
  ClsContext: SpeechTokenContext): IUnknown;
begin
  Result := DefaultInterface.CreateInstance(pUnkOuter, ClsContext);
end;

procedure TSpObjectToken.Remove(const ObjectStorageCLSID: WideString);
begin
  DefaultInterface.Remove(ObjectStorageCLSID);
end;

function TSpObjectToken.GetStorageFileName(const ObjectStorageCLSID: WideString;
  const KeyName: WideString; const FileName: WideString;
  Folder: SpeechTokenShellFolder): WideString;
begin
  Result := DefaultInterface.GetStorageFileName(ObjectStorageCLSID, KeyName,
    FileName, Folder);
end;

procedure TSpObjectToken.RemoveStorageFileName(const ObjectStorageCLSID
  : WideString; const KeyName: WideString; DeleteFile: WordBool);
begin
  DefaultInterface.RemoveStorageFileName(ObjectStorageCLSID, KeyName,
    DeleteFile);
end;

function TSpObjectToken.IsUISupported(const TypeOfUI: WideString;
  const ExtraData: OleVariant; const Object_: IUnknown): WordBool;
begin
  Result := DefaultInterface.IsUISupported(TypeOfUI, ExtraData, Object_);
end;

procedure TSpObjectToken.DisplayUI(hWnd: Integer; const Title: WideString;
  const TypeOfUI: WideString; const ExtraData: OleVariant;
  const Object_: IUnknown);
begin
  DefaultInterface.DisplayUI(hWnd, Title, TypeOfUI, ExtraData, Object_);
end;

function TSpObjectToken.MatchesAttributes(const Attributes: WideString)
  : WordBool;
begin
  Result := DefaultInterface.MatchesAttributes(Attributes);
end;

class function CoSpResourceManager.Create: ISpResourceManager;
begin
  Result := CreateComObject(CLASS_SpResourceManager) as ISpResourceManager;
end;

class function CoSpResourceManager.CreateRemote(const MachineName: string)
  : ISpResourceManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpResourceManager)
    as ISpResourceManager;
end;

procedure TSpResourceManager.InitServerData;
const
  CServerData: TServerData = (ClassId: '{96749373-3391-11D2-9EE3-00C04F797396}';
    IntfIID: '{93384E18-5014-43D5-ADBB-A78E055926BD}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpResourceManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpResourceManager;
  end;
end;

procedure TSpResourceManager.ConnectTo(svrIntf: ISpResourceManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpResourceManager.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpResourceManager.GetDefaultInterface: ISpResourceManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpResourceManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpResourceManager.Destroy;
begin
  inherited Destroy;
end;

function TSpResourceManager.RemoteQueryService(var guidService: TGUID;
  var riid: TGUID; out ppvObject: IUnknown): HResult;
begin
  Result := DefaultInterface.RemoteQueryService(guidService, riid, ppvObject);
end;

function TSpResourceManager.SetObject(var guidServiceId: TGUID;
  const punkObject: IUnknown): HResult;
begin
  Result := DefaultInterface.SetObject(guidServiceId, punkObject);
end;

function TSpResourceManager.GetObject(var guidServiceId: TGUID;
  var ObjectCLSID: TGUID; var ObjectIID: TGUID;
  fReleaseWhenLastExternalRefReleased: Integer; out ppObject: Pointer): HResult;
begin
  Result := DefaultInterface.GetObject(guidServiceId, ObjectCLSID, ObjectIID,
    fReleaseWhenLastExternalRefReleased, ppObject);
end;

class function CoSpStreamFormatConverter.Create: ISpStreamFormatConverter;
begin
  Result := CreateComObject(CLASS_SpStreamFormatConverter)
    as ISpStreamFormatConverter;
end;

class function CoSpStreamFormatConverter.CreateRemote(const MachineName: string)
  : ISpStreamFormatConverter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpStreamFormatConverter)
    as ISpStreamFormatConverter;
end;

procedure TSpStreamFormatConverter.InitServerData;
const
  CServerData: TServerData = (ClassId: '{7013943A-E2EC-11D2-A086-00C04F8EF9B5}';
    IntfIID: '{678A932C-EA71-4446-9B41-78FDA6280A29}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpStreamFormatConverter.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpStreamFormatConverter;
  end;
end;

procedure TSpStreamFormatConverter.ConnectTo(svrIntf: ISpStreamFormatConverter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpStreamFormatConverter.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpStreamFormatConverter.GetDefaultInterface: ISpStreamFormatConverter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpStreamFormatConverter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpStreamFormatConverter.Destroy;
begin
  inherited Destroy;
end;

function TSpStreamFormatConverter.RemoteRead(out pv: Byte; cb: LongWord;
  out pcbRead: LongWord): HResult;
begin
  Result := DefaultInterface.RemoteRead(pv, cb, pcbRead);
end;

function TSpStreamFormatConverter.RemoteWrite(var pv: Byte; cb: LongWord;
  out pcbWritten: LongWord): HResult;
begin
  Result := DefaultInterface.RemoteWrite(pv, cb, pcbWritten);
end;

function TSpStreamFormatConverter.RemoteSeek(dlibMove: _LARGE_INTEGER;
  dwOrigin: LongWord; out plibNewPosition: _ULARGE_INTEGER): HResult;
begin
  Result := DefaultInterface.RemoteSeek(dlibMove, dwOrigin, plibNewPosition);
end;

function TSpStreamFormatConverter.SetSize(libNewSize: _ULARGE_INTEGER): HResult;
begin
  Result := DefaultInterface.SetSize(libNewSize);
end;

function TSpStreamFormatConverter.RemoteCopyTo(const pstm: IStream;
  cb: _ULARGE_INTEGER; out pcbRead: _ULARGE_INTEGER;
  out pcbWritten: _ULARGE_INTEGER): HResult;
begin
  Result := DefaultInterface.RemoteCopyTo(pstm, cb, pcbRead, pcbWritten);
end;

function TSpStreamFormatConverter.Commit(grfCommitFlags: LongWord): HResult;
begin
  Result := DefaultInterface.Commit(grfCommitFlags);
end;

function TSpStreamFormatConverter.Revert: HResult;
begin
  Result := DefaultInterface.Revert;
end;

function TSpStreamFormatConverter.LockRegion(libOffset: _ULARGE_INTEGER;
  cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult;
begin
  Result := DefaultInterface.LockRegion(libOffset, cb, dwLockType);
end;

function TSpStreamFormatConverter.UnlockRegion(libOffset: _ULARGE_INTEGER;
  cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult;
begin
  Result := DefaultInterface.UnlockRegion(libOffset, cb, dwLockType);
end;

function TSpStreamFormatConverter.Stat(out pstatstg: tagSTATSTG;
  grfStatFlag: LongWord): HResult;
begin
  Result := DefaultInterface.Stat(pstatstg, grfStatFlag);
end;

function TSpStreamFormatConverter.Clone(out ppstm: IStream): HResult;
begin
  Result := DefaultInterface.Clone(ppstm);
end;

function TSpStreamFormatConverter.GetFormat(var pguidFormatId: TGUID;
  out ppCoMemWaveFormatEx: PUserType2): HResult;
begin
  Result := DefaultInterface.GetFormat(pguidFormatId, ppCoMemWaveFormatEx);
end;

function TSpStreamFormatConverter.SetBaseStream(const pStream: ISpStreamFormat;
  fSetFormatToBaseStreamFormat: Integer; fWriteToBaseStream: Integer): HResult;
begin
  Result := DefaultInterface.SetBaseStream(pStream,
    fSetFormatToBaseStreamFormat, fWriteToBaseStream);
end;

function TSpStreamFormatConverter.GetBaseStream(out ppStream
  : ISpStreamFormat): HResult;
begin
  Result := DefaultInterface.GetBaseStream(ppStream);
end;

function TSpStreamFormatConverter.SetFormat(var rguidFormatIdOfConvertedStream
  : TGUID; var pWaveFormatExOfConvertedStream: WAVEFORMATEX): HResult;
begin
  Result := DefaultInterface.SetFormat(rguidFormatIdOfConvertedStream,
    pWaveFormatExOfConvertedStream);
end;

function TSpStreamFormatConverter.ResetSeekPosition: HResult;
begin
  Result := DefaultInterface.ResetSeekPosition;
end;

function TSpStreamFormatConverter.ScaleConvertedToBaseOffset
  (ullOffsetConvertedStream: Largeuint;
  out pullOffsetBaseStream: Largeuint): HResult;
begin
  Result := DefaultInterface.ScaleConvertedToBaseOffset
    (ullOffsetConvertedStream, pullOffsetBaseStream);
end;

function TSpStreamFormatConverter.ScaleBaseToConvertedOffset(ullOffsetBaseStream
  : Largeuint; out pullOffsetConvertedStream: Largeuint): HResult;
begin
  Result := DefaultInterface.ScaleBaseToConvertedOffset(ullOffsetBaseStream,
    pullOffsetConvertedStream);
end;

class function CoSpMMAudioEnum.Create: IEnumSpObjectTokens;
begin
  Result := CreateComObject(CLASS_SpMMAudioEnum) as IEnumSpObjectTokens;
end;

class function CoSpMMAudioEnum.CreateRemote(const MachineName: string)
  : IEnumSpObjectTokens;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpMMAudioEnum)
    as IEnumSpObjectTokens;
end;

procedure TSpMMAudioEnum.InitServerData;
const
  CServerData: TServerData = (ClassId: '{AB1890A0-E91F-11D2-BB91-00C04F8EE6C0}';
    IntfIID: '{06B64F9E-7FDA-11D2-B4F2-00C04F797396}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpMMAudioEnum.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as IEnumSpObjectTokens;
  end;
end;

procedure TSpMMAudioEnum.ConnectTo(svrIntf: IEnumSpObjectTokens);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpMMAudioEnum.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpMMAudioEnum.GetDefaultInterface: IEnumSpObjectTokens;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpMMAudioEnum.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpMMAudioEnum.Destroy;
begin
  inherited Destroy;
end;

function TSpMMAudioEnum.Next(celt: LongWord; out pelt: ISpObjectToken;
  out pceltFetched: LongWord): HResult;
begin
  Result := DefaultInterface.Next(celt, pelt, pceltFetched);
end;

function TSpMMAudioEnum.Skip(celt: LongWord): HResult;
begin
  Result := DefaultInterface.Skip(celt);
end;

function TSpMMAudioEnum.Reset: HResult;
begin
  Result := DefaultInterface.Reset;
end;

function TSpMMAudioEnum.Clone(out ppEnum: IEnumSpObjectTokens): HResult;
begin
  Result := DefaultInterface.Clone(ppEnum);
end;

function TSpMMAudioEnum.Item(Index: LongWord;
  out ppToken: ISpObjectToken): HResult;
begin
  Result := DefaultInterface.Item(Index, ppToken);
end;

function TSpMMAudioEnum.GetCount(out pCount: LongWord): HResult;
begin
  Result := DefaultInterface.GetCount(pCount);
end;

class function CoSpMMAudioIn.Create: ISpeechMMSysAudio;
begin
  Result := CreateComObject(CLASS_SpMMAudioIn) as ISpeechMMSysAudio;
end;

class function CoSpMMAudioIn.CreateRemote(const MachineName: string)
  : ISpeechMMSysAudio;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpMMAudioIn)
    as ISpeechMMSysAudio;
end;

procedure TSpMMAudioIn.InitServerData;
const
  CServerData: TServerData = (ClassId: '{CF3D2E50-53F2-11D2-960C-00C04F8EE628}';
    IntfIID: '{3C76AF6D-1FD7-4831-81D1-3B71D5A13C44}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpMMAudioIn.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechMMSysAudio;
  end;
end;

procedure TSpMMAudioIn.ConnectTo(svrIntf: ISpeechMMSysAudio);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpMMAudioIn.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpMMAudioIn.GetDefaultInterface: ISpeechMMSysAudio;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpMMAudioIn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpMMAudioIn.Destroy;
begin
  inherited Destroy;
end;

function TSpMMAudioIn.Get_Format: ISpeechAudioFormat;
begin
  Result := DefaultInterface.Format;
end;

procedure TSpMMAudioIn._Set_Format(const AudioFormat: ISpeechAudioFormat);
begin
  DefaultInterface.Format := AudioFormat;
end;

function TSpMMAudioIn.Get_Status: ISpeechAudioStatus;
begin
  Result := DefaultInterface.Status;
end;

function TSpMMAudioIn.Get_BufferInfo: ISpeechAudioBufferInfo;
begin
  Result := DefaultInterface.BufferInfo;
end;

function TSpMMAudioIn.Get_DefaultFormat: ISpeechAudioFormat;
begin
  Result := DefaultInterface.DefaultFormat;
end;

function TSpMMAudioIn.Get_Volume: Integer;
begin
  Result := DefaultInterface.Volume;
end;

procedure TSpMMAudioIn.Set_Volume(Volume: Integer);
begin
  DefaultInterface.Volume := Volume;
end;

function TSpMMAudioIn.Get_BufferNotifySize: Integer;
begin
  Result := DefaultInterface.BufferNotifySize;
end;

procedure TSpMMAudioIn.Set_BufferNotifySize(BufferNotifySize: Integer);
begin
  DefaultInterface.BufferNotifySize := BufferNotifySize;
end;

function TSpMMAudioIn.Get_EventHandle: Integer;
begin
  Result := DefaultInterface.EventHandle;
end;

function TSpMMAudioIn.Get_DeviceId: Integer;
begin
  Result := DefaultInterface.DeviceId;
end;

procedure TSpMMAudioIn.Set_DeviceId(DeviceId: Integer);
begin
  DefaultInterface.DeviceId := DeviceId;
end;

function TSpMMAudioIn.Get_LineId: Integer;
begin
  Result := DefaultInterface.LineId;
end;

procedure TSpMMAudioIn.Set_LineId(LineId: Integer);
begin
  DefaultInterface.LineId := LineId;
end;

function TSpMMAudioIn.Get_MMHandle: Integer;
begin
  Result := DefaultInterface.MMHandle;
end;

function TSpMMAudioIn.Read(out Buffer: OleVariant;
  NumberOfBytes: Integer): Integer;
begin
  Result := DefaultInterface.Read(Buffer, NumberOfBytes);
end;

function TSpMMAudioIn.Write(Buffer: OleVariant): Integer;
begin
  Result := DefaultInterface.Write(Buffer);
end;

function TSpMMAudioIn.Seek(Position: OleVariant;
  Origin: SpeechStreamSeekPositionType): OleVariant;
begin
  Result := DefaultInterface.Seek(Position, Origin);
end;

procedure TSpMMAudioIn.SetState(State: SpeechAudioState);
begin
  DefaultInterface.SetState(State);
end;

class function CoSpMMAudioOut.Create: ISpeechMMSysAudio;
begin
  Result := CreateComObject(CLASS_SpMMAudioOut) as ISpeechMMSysAudio;
end;

class function CoSpMMAudioOut.CreateRemote(const MachineName: string)
  : ISpeechMMSysAudio;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpMMAudioOut)
    as ISpeechMMSysAudio;
end;

procedure TSpMMAudioOut.InitServerData;
const
  CServerData: TServerData = (ClassId: '{A8C680EB-3D32-11D2-9EE7-00C04F797396}';
    IntfIID: '{3C76AF6D-1FD7-4831-81D1-3B71D5A13C44}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpMMAudioOut.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechMMSysAudio;
  end;
end;

procedure TSpMMAudioOut.ConnectTo(svrIntf: ISpeechMMSysAudio);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpMMAudioOut.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpMMAudioOut.GetDefaultInterface: ISpeechMMSysAudio;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpMMAudioOut.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpMMAudioOut.Destroy;
begin
  inherited Destroy;
end;

function TSpMMAudioOut.Get_Format: ISpeechAudioFormat;
begin
  Result := DefaultInterface.Format;
end;

procedure TSpMMAudioOut._Set_Format(const AudioFormat: ISpeechAudioFormat);
begin
  DefaultInterface.Format := AudioFormat;
end;

function TSpMMAudioOut.Get_Status: ISpeechAudioStatus;
begin
  Result := DefaultInterface.Status;
end;

function TSpMMAudioOut.Get_BufferInfo: ISpeechAudioBufferInfo;
begin
  Result := DefaultInterface.BufferInfo;
end;

function TSpMMAudioOut.Get_DefaultFormat: ISpeechAudioFormat;
begin
  Result := DefaultInterface.DefaultFormat;
end;

function TSpMMAudioOut.Get_Volume: Integer;
begin
  Result := DefaultInterface.Volume;
end;

procedure TSpMMAudioOut.Set_Volume(Volume: Integer);
begin
  DefaultInterface.Volume := Volume;
end;

function TSpMMAudioOut.Get_BufferNotifySize: Integer;
begin
  Result := DefaultInterface.BufferNotifySize;
end;

procedure TSpMMAudioOut.Set_BufferNotifySize(BufferNotifySize: Integer);
begin
  DefaultInterface.BufferNotifySize := BufferNotifySize;
end;

function TSpMMAudioOut.Get_EventHandle: Integer;
begin
  Result := DefaultInterface.EventHandle;
end;

function TSpMMAudioOut.Get_DeviceId: Integer;
begin
  Result := DefaultInterface.DeviceId;
end;

procedure TSpMMAudioOut.Set_DeviceId(DeviceId: Integer);
begin
  DefaultInterface.DeviceId := DeviceId;
end;

function TSpMMAudioOut.Get_LineId: Integer;
begin
  Result := DefaultInterface.LineId;
end;

procedure TSpMMAudioOut.Set_LineId(LineId: Integer);
begin
  DefaultInterface.LineId := LineId;
end;

function TSpMMAudioOut.Get_MMHandle: Integer;
begin
  Result := DefaultInterface.MMHandle;
end;

function TSpMMAudioOut.Read(out Buffer: OleVariant;
  NumberOfBytes: Integer): Integer;
begin
  Result := DefaultInterface.Read(Buffer, NumberOfBytes);
end;

function TSpMMAudioOut.Write(Buffer: OleVariant): Integer;
begin
  Result := DefaultInterface.Write(Buffer);
end;

function TSpMMAudioOut.Seek(Position: OleVariant;
  Origin: SpeechStreamSeekPositionType): OleVariant;
begin
  Result := DefaultInterface.Seek(Position, Origin);
end;

procedure TSpMMAudioOut.SetState(State: SpeechAudioState);
begin
  DefaultInterface.SetState(State);
end;

class function CoSpStream.Create: ISpStream;
begin
  Result := CreateComObject(CLASS_SpStream) as ISpStream;
end;

class function CoSpStream.CreateRemote(const MachineName: string): ISpStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpStream) as ISpStream;
end;

procedure TSpStream.InitServerData;
const
  CServerData: TServerData = (ClassId: '{715D9C59-4442-11D2-9605-00C04F8EE628}';
    IntfIID: '{12E3CCA9-7518-44C5-A5E7-BA5A79CB929E}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpStream.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpStream;
  end;
end;

procedure TSpStream.ConnectTo(svrIntf: ISpStream);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpStream.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpStream.GetDefaultInterface: ISpStream;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpStream.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpStream.Destroy;
begin
  inherited Destroy;
end;

function TSpStream.RemoteRead(out pv: Byte; cb: LongWord;
  out pcbRead: LongWord): HResult;
begin
  Result := DefaultInterface.RemoteRead(pv, cb, pcbRead);
end;

function TSpStream.RemoteWrite(var pv: Byte; cb: LongWord;
  out pcbWritten: LongWord): HResult;
begin
  Result := DefaultInterface.RemoteWrite(pv, cb, pcbWritten);
end;

function TSpStream.RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord;
  out plibNewPosition: _ULARGE_INTEGER): HResult;
begin
  Result := DefaultInterface.RemoteSeek(dlibMove, dwOrigin, plibNewPosition);
end;

function TSpStream.SetSize(libNewSize: _ULARGE_INTEGER): HResult;
begin
  Result := DefaultInterface.SetSize(libNewSize);
end;

function TSpStream.RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER;
  out pcbRead: _ULARGE_INTEGER; out pcbWritten: _ULARGE_INTEGER): HResult;
begin
  Result := DefaultInterface.RemoteCopyTo(pstm, cb, pcbRead, pcbWritten);
end;

function TSpStream.Commit(grfCommitFlags: LongWord): HResult;
begin
  Result := DefaultInterface.Commit(grfCommitFlags);
end;

function TSpStream.Revert: HResult;
begin
  Result := DefaultInterface.Revert;
end;

function TSpStream.LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
  dwLockType: LongWord): HResult;
begin
  Result := DefaultInterface.LockRegion(libOffset, cb, dwLockType);
end;

function TSpStream.UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER;
  dwLockType: LongWord): HResult;
begin
  Result := DefaultInterface.UnlockRegion(libOffset, cb, dwLockType);
end;

function TSpStream.Stat(out pstatstg: tagSTATSTG;
  grfStatFlag: LongWord): HResult;
begin
  Result := DefaultInterface.Stat(pstatstg, grfStatFlag);
end;

function TSpStream.Clone(out ppstm: IStream): HResult;
begin
  Result := DefaultInterface.Clone(ppstm);
end;

function TSpStream.GetFormat(var pguidFormatId: TGUID;
  out ppCoMemWaveFormatEx: PUserType2): HResult;
begin
  Result := DefaultInterface.GetFormat(pguidFormatId, ppCoMemWaveFormatEx);
end;

function TSpStream.SetBaseStream(const pStream: IStream; var rguidFormat: TGUID;
  var pWaveFormatEx: WAVEFORMATEX): HResult;
begin
  Result := DefaultInterface.SetBaseStream(pStream, rguidFormat, pWaveFormatEx);
end;

function TSpStream.GetBaseStream(out ppStream: IStream): HResult;
begin
  Result := DefaultInterface.GetBaseStream(ppStream);
end;

function TSpStream.BindToFile(pszFileName: PWideChar; eMode: SPFILEMODE;
  var pFormatId: TGUID; var pWaveFormatEx: WAVEFORMATEX;
  ullEventInterest: Largeuint): HResult;
begin
  Result := DefaultInterface.BindToFile(pszFileName, eMode, pFormatId,
    pWaveFormatEx, ullEventInterest);
end;

function TSpStream.Close: HResult;
begin
  Result := DefaultInterface.Close;
end;

class function CoSpVoice.Create: ISpeechVoice;
begin
  Result := CreateComObject(CLASS_SpVoice) as ISpeechVoice;
end;

class function CoSpVoice.CreateRemote(const MachineName: string): ISpeechVoice;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpVoice) as ISpeechVoice;
end;

procedure TSpVoice.InitServerData;
const
  CServerData: TServerData = (ClassId: '{96749377-3391-11D2-9EE3-00C04F797396}';
    IntfIID: '{269316D8-57BD-11D2-9EEE-00C04F797396}';
    EventIID: '{A372ACD1-3BEF-4BBD-8FFB-CB3E2B416AF8}'; LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpVoice.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    FIntf := punk as ISpeechVoice;
  end;
end;

procedure TSpVoice.ConnectTo(svrIntf: ISpeechVoice);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TSpVoice.Disconnect;
begin
  if FIntf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TSpVoice.GetDefaultInterface: ISpeechVoice;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpVoice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpVoice.Destroy;
begin
  inherited Destroy;
end;

procedure TSpVoice.InvokeEvent(dispid: TDispID; var Params: TVariantArray);
begin
  case DispID of
    - 1:
      Exit; // DISPID_UNKNOWN
    1:
      if Assigned(FOnStartStream) then
        FOnStartStream(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    2:
      if Assigned(FOnEndStream) then
        FOnEndStream(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    3:
      if Assigned(FOnVoiceChange) then
        FOnVoiceChange(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          IUnknown(TVarData(Params[2]).VPointer)
          as ISpeechObjectToken { const ISpeechObjectToken } );
    4:
      if Assigned(FOnBookmark) then
        FOnBookmark(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { const WideString } , Params[3] { Integer } );
    5:
      if Assigned(FOnWord) then
        FOnWord(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } , Params[3] { Integer } );
    7:
      if Assigned(FOnSentence) then
        FOnSentence(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } , Params[3] { Integer } );
    6:
      if Assigned(FOnPhoneme) then
        FOnPhoneme(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } , Params[3] { Smallint } ,
          Params[4] { SpeechVisemeFeature } , Params[5] { Smallint } );
    8:
      if Assigned(FOnViseme) then
        FOnViseme(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } , Params[3] { SpeechVisemeType } ,
          Params[4] { SpeechVisemeFeature } , Params[5] { SpeechVisemeType } );
    9:
      if Assigned(FOnAudioLevel) then
        FOnAudioLevel(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } );
    10:
      if Assigned(FOnEnginePrivate) then
        FOnEnginePrivate(Self, Params[0] { Integer } , Params[1] { Integer } ,
          Params[2] { OleVariant } );
  end; { case DispID }
end;

function TSpVoice.Get_Status: ISpeechVoiceStatus;
begin
  Result := DefaultInterface.Status;
end;

function TSpVoice.Get_Voice: ISpeechObjectToken;
begin
  Result := DefaultInterface.Voice;
end;

procedure TSpVoice._Set_Voice(const Voice: ISpeechObjectToken);
begin
  DefaultInterface.Voice := Voice;
end;

function TSpVoice.Get_AudioOutput: ISpeechObjectToken;
begin
  Result := DefaultInterface.AudioOutput;
end;

procedure TSpVoice._Set_AudioOutput(const AudioOutput: ISpeechObjectToken);
begin
  DefaultInterface.AudioOutput := AudioOutput;
end;

function TSpVoice.Get_AudioOutputStream: ISpeechBaseStream;
begin
  Result := DefaultInterface.AudioOutputStream;
end;

procedure TSpVoice._Set_AudioOutputStream(const AudioOutputStream
  : ISpeechBaseStream);
begin
  DefaultInterface.AudioOutputStream := AudioOutputStream;
end;

function TSpVoice.Get_Rate: Integer;
begin
  Result := DefaultInterface.Rate;
end;

procedure TSpVoice.Set_Rate(Rate: Integer);
begin
  DefaultInterface.Rate := Rate;
end;

function TSpVoice.Get_Volume: Integer;
begin
  Result := DefaultInterface.Volume;
end;

procedure TSpVoice.Set_Volume(Volume: Integer);
begin
  DefaultInterface.Volume := Volume;
end;

procedure TSpVoice.Set_AllowAudioOutputFormatChangesOnNextSet(Allow: WordBool);
begin
  DefaultInterface.AllowAudioOutputFormatChangesOnNextSet := Allow;
end;

function TSpVoice.Get_AllowAudioOutputFormatChangesOnNextSet: WordBool;
begin
  Result := DefaultInterface.AllowAudioOutputFormatChangesOnNextSet;
end;

function TSpVoice.Get_EventInterests: SpeechVoiceEvents;
begin
  Result := DefaultInterface.EventInterests;
end;

procedure TSpVoice.Set_EventInterests(EventInterestFlags: SpeechVoiceEvents);
begin
  DefaultInterface.EventInterests := EventInterestFlags;
end;

procedure TSpVoice.Set_Priority(Priority: SpeechVoicePriority);
begin
  DefaultInterface.Priority := Priority;
end;

function TSpVoice.Get_Priority: SpeechVoicePriority;
begin
  Result := DefaultInterface.Priority;
end;

procedure TSpVoice.Set_AlertBoundary(Boundary: SpeechVoiceEvents);
begin
  DefaultInterface.AlertBoundary := Boundary;
end;

function TSpVoice.Get_AlertBoundary: SpeechVoiceEvents;
begin
  Result := DefaultInterface.AlertBoundary;
end;

procedure TSpVoice.Set_SynchronousSpeakTimeout(msTimeout: Integer);
begin
  DefaultInterface.SynchronousSpeakTimeout := msTimeout;
end;

function TSpVoice.Get_SynchronousSpeakTimeout: Integer;
begin
  Result := DefaultInterface.SynchronousSpeakTimeout;
end;

function TSpVoice.Speak(const Text: WideString;
  Flags: SpeechVoiceSpeakFlags): Integer;
begin
  Result := DefaultInterface.Speak(Text, Flags);
end;

function TSpVoice.SpeakStream(const Stream: ISpeechBaseStream;
  Flags: SpeechVoiceSpeakFlags): Integer;
begin
  Result := DefaultInterface.SpeakStream(Stream, Flags);
end;

procedure TSpVoice.Pause;
begin
  DefaultInterface.Pause;
end;

procedure TSpVoice.Resume;
begin
  DefaultInterface.Resume;
end;

function TSpVoice.Skip(const type_: WideString; NumItems: Integer): Integer;
begin
  Result := DefaultInterface.Skip(type_, NumItems);
end;

function TSpVoice.GetVoices(const RequiredAttributes: WideString;
  const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetVoices(RequiredAttributes, OptionalAttributes);
end;

function TSpVoice.GetAudioOutputs(const RequiredAttributes: WideString;
  const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetAudioOutputs(RequiredAttributes,
    OptionalAttributes);
end;

function TSpVoice.WaitUntilDone(msTimeout: Integer): WordBool;
begin
  Result := DefaultInterface.WaitUntilDone(msTimeout);
end;

function TSpVoice.SpeakCompleteEvent: Integer;
begin
  Result := DefaultInterface.SpeakCompleteEvent;
end;

function TSpVoice.IsUISupported(const TypeOfUI: WideString): WordBool;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.IsUISupported(TypeOfUI, EmptyParam);
end;

function TSpVoice.IsUISupported(const TypeOfUI: WideString;
  const ExtraData: OleVariant): WordBool;
begin
  Result := DefaultInterface.IsUISupported(TypeOfUI, ExtraData);
end;

procedure TSpVoice.DisplayUI(hWndParent: Integer; const Title: WideString;
  const TypeOfUI: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, EmptyParam);
end;

procedure TSpVoice.DisplayUI(hWndParent: Integer; const Title: WideString;
  const TypeOfUI: WideString; const ExtraData: OleVariant);
begin
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, ExtraData);
end;

class function CoSpSharedRecoContext.Create: ISpeechRecoContext;
begin
  Result := CreateComObject(CLASS_SpSharedRecoContext) as ISpeechRecoContext;
end;

class function CoSpSharedRecoContext.CreateRemote(const MachineName: string)
  : ISpeechRecoContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpSharedRecoContext)
    as ISpeechRecoContext;
end;

procedure TSpSharedRecoContext.InitServerData;
const
  CServerData: TServerData = (ClassId: '{47206204-5ECA-11D2-960F-00C04F8EE628}';
    IntfIID: '{580AA49D-7E1E-4809-B8E2-57DA806104B8}';
    EventIID: '{7B8FCB42-0E9D-4F00-A048-7B04D6179D3D}'; LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpSharedRecoContext.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    FIntf := punk as ISpeechRecoContext;
  end;
end;

procedure TSpSharedRecoContext.ConnectTo(svrIntf: ISpeechRecoContext);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TSpSharedRecoContext.Disconnect;
begin
  if FIntf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TSpSharedRecoContext.GetDefaultInterface: ISpeechRecoContext;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpSharedRecoContext.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpSharedRecoContext.Destroy;
begin
  inherited Destroy;
end;

procedure TSpSharedRecoContext.InvokeEvent(dispid: TDispID;
  var Params: TVariantArray);
begin
  case DispID of
    - 1:
      Exit; // DISPID_UNKNOWN
    1:
      if Assigned(FOnStartStream) then
        FOnStartStream(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    2:
      if Assigned(FOnEndStream) then
        FOnEndStream(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { WordBool } );
    3:
      if Assigned(FOnBookmark) then
        FOnBookmark(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { OleVariant } , Params[3] { SpeechBookmarkOptions } );
    4:
      if Assigned(FOnSoundStart) then
        FOnSoundStart(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    5:
      if Assigned(FOnSoundEnd) then
        FOnSoundEnd(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    6:
      if Assigned(FOnPhraseStart) then
        FOnPhraseStart(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    7:
      if Assigned(FOnRecognition) then
        FOnRecognition(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { SpeechRecognitionType } ,
          IUnknown(TVarData(Params[3]).VPointer)
          as ISpeechRecoResult { const ISpeechRecoResult } );
    8:
      if Assigned(FOnHypothesis) then
        FOnHypothesis(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          IUnknown(TVarData(Params[2]).VPointer)
          as ISpeechRecoResult { const ISpeechRecoResult } );
    9:
      if Assigned(FOnPropertyNumberChange) then
        FOnPropertyNumberChange(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { const WideString } ,
          Params[3] { Integer } );
    10:
      if Assigned(FOnPropertyStringChange) then
        FOnPropertyStringChange(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { const WideString } ,
          Params[3] { const WideString } );
    11:
      if Assigned(FOnFalseRecognition) then
        FOnFalseRecognition(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , IUnknown(TVarData(Params[2]).VPointer)
          as ISpeechRecoResult { const ISpeechRecoResult } );
    12:
      if Assigned(FOnInterference) then
        FOnInterference(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { SpeechInterference } );
    13:
      if Assigned(FOnRequestUI) then
        FOnRequestUI(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { const WideString } );
    14:
      if Assigned(FOnRecognizerStateChange) then
        FOnRecognizerStateChange(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { SpeechRecognizerState } );
    15:
      if Assigned(FOnAdaptation) then
        FOnAdaptation(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    16:
      if Assigned(FOnRecognitionForOtherContext) then
        FOnRecognitionForOtherContext(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } );
    17:
      if Assigned(FOnAudioLevel) then
        FOnAudioLevel(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } );
    18:
      if Assigned(FOnEnginePrivate) then
        FOnEnginePrivate(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { OleVariant } );
  end; { case DispID }
end;

function TSpSharedRecoContext.Get_Recognizer: ISpeechRecognizer;
begin
  Result := DefaultInterface.Recognizer;
end;

function TSpSharedRecoContext.Get_AudioInputInterferenceStatus
  : SpeechInterference;
begin
  Result := DefaultInterface.AudioInputInterferenceStatus;
end;

function TSpSharedRecoContext.Get_RequestedUIType: WideString;
begin
  Result := DefaultInterface.RequestedUIType;
end;

procedure TSpSharedRecoContext._Set_Voice(const Voice: ISpeechVoice);
begin
  DefaultInterface.Voice := Voice;
end;

function TSpSharedRecoContext.Get_Voice: ISpeechVoice;
begin
  Result := DefaultInterface.Voice;
end;

procedure TSpSharedRecoContext.Set_AllowVoiceFormatMatchingOnNextSet
  (pAllow: WordBool);
begin
  DefaultInterface.AllowVoiceFormatMatchingOnNextSet := pAllow;
end;

function TSpSharedRecoContext.Get_AllowVoiceFormatMatchingOnNextSet: WordBool;
begin
  Result := DefaultInterface.AllowVoiceFormatMatchingOnNextSet;
end;

procedure TSpSharedRecoContext.Set_VoicePurgeEvent(EventInterest
  : SpeechRecoEvents);
begin
  DefaultInterface.VoicePurgeEvent := EventInterest;
end;

function TSpSharedRecoContext.Get_VoicePurgeEvent: SpeechRecoEvents;
begin
  Result := DefaultInterface.VoicePurgeEvent;
end;

procedure TSpSharedRecoContext.Set_EventInterests(EventInterest
  : SpeechRecoEvents);
begin
  DefaultInterface.EventInterests := EventInterest;
end;

function TSpSharedRecoContext.Get_EventInterests: SpeechRecoEvents;
begin
  Result := DefaultInterface.EventInterests;
end;

procedure TSpSharedRecoContext.Set_CmdMaxAlternates(MaxAlternates: Integer);
begin
  DefaultInterface.CmdMaxAlternates := MaxAlternates;
end;

function TSpSharedRecoContext.Get_CmdMaxAlternates: Integer;
begin
  Result := DefaultInterface.CmdMaxAlternates;
end;

procedure TSpSharedRecoContext.Set_State(State: SpeechRecoContextState);
begin
  DefaultInterface.State := State;
end;

function TSpSharedRecoContext.Get_State: SpeechRecoContextState;
begin
  Result := DefaultInterface.State;
end;

procedure TSpSharedRecoContext.Set_RetainedAudio
  (Option: SpeechRetainedAudioOptions);
begin
  DefaultInterface.RetainedAudio := Option;
end;

function TSpSharedRecoContext.Get_RetainedAudio: SpeechRetainedAudioOptions;
begin
  Result := DefaultInterface.RetainedAudio;
end;

procedure TSpSharedRecoContext._Set_RetainedAudioFormat
  (const Format: ISpeechAudioFormat);
begin
  DefaultInterface.RetainedAudioFormat := Format;
end;

function TSpSharedRecoContext.Get_RetainedAudioFormat: ISpeechAudioFormat;
begin
  Result := DefaultInterface.RetainedAudioFormat;
end;

procedure TSpSharedRecoContext.Pause;
begin
  DefaultInterface.Pause;
end;

procedure TSpSharedRecoContext.Resume;
begin
  DefaultInterface.Resume;
end;

function TSpSharedRecoContext.CreateGrammar: ISpeechRecoGrammar;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.CreateGrammar(EmptyParam);
end;

function TSpSharedRecoContext.CreateGrammar(GrammarId: OleVariant)
  : ISpeechRecoGrammar;
begin
  Result := DefaultInterface.CreateGrammar(GrammarId);
end;

function TSpSharedRecoContext.CreateResultFromMemory(const ResultBlock
  : OleVariant): ISpeechRecoResult;
begin
  Result := DefaultInterface.CreateResultFromMemory(ResultBlock);
end;

procedure TSpSharedRecoContext.Bookmark(Options: SpeechBookmarkOptions;
  StreamPos: OleVariant; BookmarkId: OleVariant);
begin
  DefaultInterface.Bookmark(Options, StreamPos, BookmarkId);
end;

procedure TSpSharedRecoContext.SetAdaptationData(const AdaptationString
  : WideString);
begin
  DefaultInterface.SetAdaptationData(AdaptationString);
end;

class function CoSpInprocRecognizer.Create: ISpeechRecognizer;
begin
  Result := CreateComObject(CLASS_SpInprocRecognizer) as ISpeechRecognizer;
end;

class function CoSpInprocRecognizer.CreateRemote(const MachineName: string)
  : ISpeechRecognizer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpInprocRecognizer)
    as ISpeechRecognizer;
end;

procedure TSpInprocRecognizer.InitServerData;
const
  CServerData: TServerData = (ClassId: '{41B89B6B-9399-11D2-9623-00C04F8EE628}';
    IntfIID: '{2D5F1C0C-BD75-4B08-9478-3B11FEA2586C}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpInprocRecognizer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechRecognizer;
  end;
end;

procedure TSpInprocRecognizer.ConnectTo(svrIntf: ISpeechRecognizer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpInprocRecognizer.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpInprocRecognizer.GetDefaultInterface: ISpeechRecognizer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpInprocRecognizer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpInprocRecognizer.Destroy;
begin
  inherited Destroy;
end;

procedure TSpInprocRecognizer._Set_Recognizer(const Recognizer
  : ISpeechObjectToken);
begin
  DefaultInterface.Recognizer := Recognizer;
end;

function TSpInprocRecognizer.Get_Recognizer: ISpeechObjectToken;
begin
  Result := DefaultInterface.Recognizer;
end;

procedure TSpInprocRecognizer.Set_AllowAudioInputFormatChangesOnNextSet
  (Allow: WordBool);
begin
  DefaultInterface.AllowAudioInputFormatChangesOnNextSet := Allow;
end;

function TSpInprocRecognizer.Get_AllowAudioInputFormatChangesOnNextSet
  : WordBool;
begin
  Result := DefaultInterface.AllowAudioInputFormatChangesOnNextSet;
end;

procedure TSpInprocRecognizer._Set_AudioInput(const AudioInput
  : ISpeechObjectToken);
begin
  DefaultInterface.AudioInput := AudioInput;
end;

function TSpInprocRecognizer.Get_AudioInput: ISpeechObjectToken;
begin
  Result := DefaultInterface.AudioInput;
end;

procedure TSpInprocRecognizer._Set_AudioInputStream(const AudioInputStream
  : ISpeechBaseStream);
begin
  DefaultInterface.AudioInputStream := AudioInputStream;
end;

function TSpInprocRecognizer.Get_AudioInputStream: ISpeechBaseStream;
begin
  Result := DefaultInterface.AudioInputStream;
end;

function TSpInprocRecognizer.Get_IsShared: WordBool;
begin
  Result := DefaultInterface.IsShared;
end;

procedure TSpInprocRecognizer.Set_State(State: SpeechRecognizerState);
begin
  DefaultInterface.State := State;
end;

function TSpInprocRecognizer.Get_State: SpeechRecognizerState;
begin
  Result := DefaultInterface.State;
end;

function TSpInprocRecognizer.Get_Status: ISpeechRecognizerStatus;
begin
  Result := DefaultInterface.Status;
end;

procedure TSpInprocRecognizer._Set_Profile(const Profile: ISpeechObjectToken);
begin
  DefaultInterface.Profile := Profile;
end;

function TSpInprocRecognizer.Get_Profile: ISpeechObjectToken;
begin
  Result := DefaultInterface.Profile;
end;

procedure TSpInprocRecognizer.EmulateRecognition(TextElements: OleVariant;
  const ElementDisplayAttributes: OleVariant; LanguageId: Integer);
begin
  DefaultInterface.EmulateRecognition(TextElements, ElementDisplayAttributes,
    LanguageId);
end;

function TSpInprocRecognizer.CreateRecoContext: ISpeechRecoContext;
begin
  Result := DefaultInterface.CreateRecoContext;
end;

function TSpInprocRecognizer.GetFormat(type_: SpeechFormatType)
  : ISpeechAudioFormat;
begin
  Result := DefaultInterface.GetFormat(type_);
end;

function TSpInprocRecognizer.SetPropertyNumber(const Name: WideString;
  Value: Integer): WordBool;
begin
  Result := DefaultInterface.SetPropertyNumber(Name, Value);
end;

function TSpInprocRecognizer.GetPropertyNumber(const Name: WideString;
  var Value: Integer): WordBool;
begin
  Result := DefaultInterface.GetPropertyNumber(Name, Value);
end;

function TSpInprocRecognizer.SetPropertyString(const Name: WideString;
  const Value: WideString): WordBool;
begin
  Result := DefaultInterface.SetPropertyString(Name, Value);
end;

function TSpInprocRecognizer.GetPropertyString(const Name: WideString;
  var Value: WideString): WordBool;
begin
  Result := DefaultInterface.GetPropertyString(Name, Value);
end;

function TSpInprocRecognizer.IsUISupported(const TypeOfUI: WideString)
  : WordBool;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.IsUISupported(TypeOfUI, EmptyParam);
end;

function TSpInprocRecognizer.IsUISupported(const TypeOfUI: WideString;
  const ExtraData: OleVariant): WordBool;
begin
  Result := DefaultInterface.IsUISupported(TypeOfUI, ExtraData);
end;

procedure TSpInprocRecognizer.DisplayUI(hWndParent: Integer;
  const Title: WideString; const TypeOfUI: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, EmptyParam);
end;

procedure TSpInprocRecognizer.DisplayUI(hWndParent: Integer;
  const Title: WideString; const TypeOfUI: WideString;
  const ExtraData: OleVariant);
begin
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, ExtraData);
end;

function TSpInprocRecognizer.GetRecognizers(const RequiredAttributes
  : WideString; const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetRecognizers(RequiredAttributes,
    OptionalAttributes);
end;

function TSpInprocRecognizer.GetAudioInputs(const RequiredAttributes
  : WideString; const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetAudioInputs(RequiredAttributes,
    OptionalAttributes);
end;

function TSpInprocRecognizer.GetProfiles(const RequiredAttributes: WideString;
  const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetProfiles(RequiredAttributes,
    OptionalAttributes);
end;

class function CoSpSharedRecognizer.Create: ISpeechRecognizer;
begin
  Result := CreateComObject(CLASS_SpSharedRecognizer) as ISpeechRecognizer;
end;

class function CoSpSharedRecognizer.CreateRemote(const MachineName: string)
  : ISpeechRecognizer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpSharedRecognizer)
    as ISpeechRecognizer;
end;

procedure TSpSharedRecognizer.InitServerData;
const
  CServerData: TServerData = (ClassId: '{3BEE4890-4FE9-4A37-8C1E-5E7E12791C1F}';
    IntfIID: '{2D5F1C0C-BD75-4B08-9478-3B11FEA2586C}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpSharedRecognizer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechRecognizer;
  end;
end;

procedure TSpSharedRecognizer.ConnectTo(svrIntf: ISpeechRecognizer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpSharedRecognizer.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpSharedRecognizer.GetDefaultInterface: ISpeechRecognizer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpSharedRecognizer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpSharedRecognizer.Destroy;
begin
  inherited Destroy;
end;

procedure TSpSharedRecognizer._Set_Recognizer(const Recognizer
  : ISpeechObjectToken);
begin
  DefaultInterface.Recognizer := Recognizer;
end;

function TSpSharedRecognizer.Get_Recognizer: ISpeechObjectToken;
begin
  Result := DefaultInterface.Recognizer;
end;

procedure TSpSharedRecognizer.Set_AllowAudioInputFormatChangesOnNextSet
  (Allow: WordBool);
begin
  DefaultInterface.AllowAudioInputFormatChangesOnNextSet := Allow;
end;

function TSpSharedRecognizer.Get_AllowAudioInputFormatChangesOnNextSet
  : WordBool;
begin
  Result := DefaultInterface.AllowAudioInputFormatChangesOnNextSet;
end;

procedure TSpSharedRecognizer._Set_AudioInput(const AudioInput
  : ISpeechObjectToken);
begin
  DefaultInterface.AudioInput := AudioInput;
end;

function TSpSharedRecognizer.Get_AudioInput: ISpeechObjectToken;
begin
  Result := DefaultInterface.AudioInput;
end;

procedure TSpSharedRecognizer._Set_AudioInputStream(const AudioInputStream
  : ISpeechBaseStream);
begin
  DefaultInterface.AudioInputStream := AudioInputStream;
end;

function TSpSharedRecognizer.Get_AudioInputStream: ISpeechBaseStream;
begin
  Result := DefaultInterface.AudioInputStream;
end;

function TSpSharedRecognizer.Get_IsShared: WordBool;
begin
  Result := DefaultInterface.IsShared;
end;

procedure TSpSharedRecognizer.Set_State(State: SpeechRecognizerState);
begin
  DefaultInterface.State := State;
end;

function TSpSharedRecognizer.Get_State: SpeechRecognizerState;
begin
  Result := DefaultInterface.State;
end;

function TSpSharedRecognizer.Get_Status: ISpeechRecognizerStatus;
begin
  Result := DefaultInterface.Status;
end;

procedure TSpSharedRecognizer._Set_Profile(const Profile: ISpeechObjectToken);
begin
  DefaultInterface.Profile := Profile;
end;

function TSpSharedRecognizer.Get_Profile: ISpeechObjectToken;
begin
  Result := DefaultInterface.Profile;
end;

procedure TSpSharedRecognizer.EmulateRecognition(TextElements: OleVariant;
  const ElementDisplayAttributes: OleVariant; LanguageId: Integer);
begin
  DefaultInterface.EmulateRecognition(TextElements, ElementDisplayAttributes,
    LanguageId);
end;

function TSpSharedRecognizer.CreateRecoContext: ISpeechRecoContext;
begin
  Result := DefaultInterface.CreateRecoContext;
end;

function TSpSharedRecognizer.GetFormat(type_: SpeechFormatType)
  : ISpeechAudioFormat;
begin
  Result := DefaultInterface.GetFormat(type_);
end;

function TSpSharedRecognizer.SetPropertyNumber(const Name: WideString;
  Value: Integer): WordBool;
begin
  Result := DefaultInterface.SetPropertyNumber(Name, Value);
end;

function TSpSharedRecognizer.GetPropertyNumber(const Name: WideString;
  var Value: Integer): WordBool;
begin
  Result := DefaultInterface.GetPropertyNumber(Name, Value);
end;

function TSpSharedRecognizer.SetPropertyString(const Name: WideString;
  const Value: WideString): WordBool;
begin
  Result := DefaultInterface.SetPropertyString(Name, Value);
end;

function TSpSharedRecognizer.GetPropertyString(const Name: WideString;
  var Value: WideString): WordBool;
begin
  Result := DefaultInterface.GetPropertyString(Name, Value);
end;

function TSpSharedRecognizer.IsUISupported(const TypeOfUI: WideString)
  : WordBool;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.IsUISupported(TypeOfUI, EmptyParam);
end;

function TSpSharedRecognizer.IsUISupported(const TypeOfUI: WideString;
  const ExtraData: OleVariant): WordBool;
begin
  Result := DefaultInterface.IsUISupported(TypeOfUI, ExtraData);
end;

procedure TSpSharedRecognizer.DisplayUI(hWndParent: Integer;
  const Title: WideString; const TypeOfUI: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, EmptyParam);
end;

procedure TSpSharedRecognizer.DisplayUI(hWndParent: Integer;
  const Title: WideString; const TypeOfUI: WideString;
  const ExtraData: OleVariant);
begin
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, ExtraData);
end;

function TSpSharedRecognizer.GetRecognizers(const RequiredAttributes
  : WideString; const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetRecognizers(RequiredAttributes,
    OptionalAttributes);
end;

function TSpSharedRecognizer.GetAudioInputs(const RequiredAttributes
  : WideString; const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetAudioInputs(RequiredAttributes,
    OptionalAttributes);
end;

function TSpSharedRecognizer.GetProfiles(const RequiredAttributes: WideString;
  const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetProfiles(RequiredAttributes,
    OptionalAttributes);
end;

class function CoSpLexicon.Create: ISpeechLexicon;
begin
  Result := CreateComObject(CLASS_SpLexicon) as ISpeechLexicon;
end;

class function CoSpLexicon.CreateRemote(const MachineName: string)
  : ISpeechLexicon;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpLexicon)
    as ISpeechLexicon;
end;

procedure TSpLexicon.InitServerData;
const
  CServerData: TServerData = (ClassId: '{0655E396-25D0-11D3-9C26-00C04F8EF87C}';
    IntfIID: '{3DA7627A-C7AE-4B23-8708-638C50362C25}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpLexicon.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechLexicon;
  end;
end;

procedure TSpLexicon.ConnectTo(svrIntf: ISpeechLexicon);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpLexicon.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpLexicon.GetDefaultInterface: ISpeechLexicon;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpLexicon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpLexicon.Destroy;
begin
  inherited Destroy;
end;

function TSpLexicon.Get_GenerationId: Integer;
begin
  Result := DefaultInterface.GenerationId;
end;

function TSpLexicon.GetWords(Flags: SpeechLexiconType;
  out GenerationId: Integer): ISpeechLexiconWords;
begin
  Result := DefaultInterface.GetWords(Flags, GenerationId);
end;

procedure TSpLexicon.AddPronunciation(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const bstrPronunciation: WideString);
begin
  DefaultInterface.AddPronunciation(bstrWord, LangId, PartOfSpeech,
    bstrPronunciation);
end;

procedure TSpLexicon.AddPronunciationByPhoneIds(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddPronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    EmptyParam);
end;

procedure TSpLexicon.AddPronunciationByPhoneIds(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const PhoneIds: OleVariant);
begin
  DefaultInterface.AddPronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    PhoneIds);
end;

procedure TSpLexicon.RemovePronunciation(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const bstrPronunciation: WideString);
begin
  DefaultInterface.RemovePronunciation(bstrWord, LangId, PartOfSpeech,
    bstrPronunciation);
end;

procedure TSpLexicon.RemovePronunciationByPhoneIds(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.RemovePronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    EmptyParam);
end;

procedure TSpLexicon.RemovePronunciationByPhoneIds(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const PhoneIds: OleVariant);
begin
  DefaultInterface.RemovePronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    PhoneIds);
end;

function TSpLexicon.GetPronunciations(const bstrWord: WideString;
  LangId: Integer; TypeFlags: SpeechLexiconType): ISpeechLexiconPronunciations;
begin
  Result := DefaultInterface.GetPronunciations(bstrWord, LangId, TypeFlags);
end;

function TSpLexicon.GetGenerationChange(var GenerationId: Integer)
  : ISpeechLexiconWords;
begin
  Result := DefaultInterface.GetGenerationChange(GenerationId);
end;

class function CoSpUnCompressedLexicon.Create: ISpeechLexicon;
begin
  Result := CreateComObject(CLASS_SpUnCompressedLexicon) as ISpeechLexicon;
end;

class function CoSpUnCompressedLexicon.CreateRemote(const MachineName: string)
  : ISpeechLexicon;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpUnCompressedLexicon)
    as ISpeechLexicon;
end;

procedure TSpUnCompressedLexicon.InitServerData;
const
  CServerData: TServerData = (ClassId: '{C9E37C15-DF92-4727-85D6-72E5EEB6995A}';
    IntfIID: '{3DA7627A-C7AE-4B23-8708-638C50362C25}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpUnCompressedLexicon.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechLexicon;
  end;
end;

procedure TSpUnCompressedLexicon.ConnectTo(svrIntf: ISpeechLexicon);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpUnCompressedLexicon.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpUnCompressedLexicon.GetDefaultInterface: ISpeechLexicon;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpUnCompressedLexicon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpUnCompressedLexicon.Destroy;
begin
  inherited Destroy;
end;

function TSpUnCompressedLexicon.Get_GenerationId: Integer;
begin
  Result := DefaultInterface.GenerationId;
end;

function TSpUnCompressedLexicon.GetWords(Flags: SpeechLexiconType;
  out GenerationId: Integer): ISpeechLexiconWords;
begin
  Result := DefaultInterface.GetWords(Flags, GenerationId);
end;

procedure TSpUnCompressedLexicon.AddPronunciation(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const bstrPronunciation: WideString);
begin
  DefaultInterface.AddPronunciation(bstrWord, LangId, PartOfSpeech,
    bstrPronunciation);
end;

procedure TSpUnCompressedLexicon.AddPronunciationByPhoneIds(const bstrWord
  : WideString; LangId: Integer; PartOfSpeech: SpeechPartOfSpeech);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.AddPronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    EmptyParam);
end;

procedure TSpUnCompressedLexicon.AddPronunciationByPhoneIds(const bstrWord
  : WideString; LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const PhoneIds: OleVariant);
begin
  DefaultInterface.AddPronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    PhoneIds);
end;

procedure TSpUnCompressedLexicon.RemovePronunciation(const bstrWord: WideString;
  LangId: Integer; PartOfSpeech: SpeechPartOfSpeech;
  const bstrPronunciation: WideString);
begin
  DefaultInterface.RemovePronunciation(bstrWord, LangId, PartOfSpeech,
    bstrPronunciation);
end;

procedure TSpUnCompressedLexicon.RemovePronunciationByPhoneIds
  (const bstrWord: WideString; LangId: Integer;
  PartOfSpeech: SpeechPartOfSpeech);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.RemovePronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    EmptyParam);
end;

procedure TSpUnCompressedLexicon.RemovePronunciationByPhoneIds
  (const bstrWord: WideString; LangId: Integer;
  PartOfSpeech: SpeechPartOfSpeech; const PhoneIds: OleVariant);
begin
  DefaultInterface.RemovePronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech,
    PhoneIds);
end;

function TSpUnCompressedLexicon.GetPronunciations(const bstrWord: WideString;
  LangId: Integer; TypeFlags: SpeechLexiconType): ISpeechLexiconPronunciations;
begin
  Result := DefaultInterface.GetPronunciations(bstrWord, LangId, TypeFlags);
end;

function TSpUnCompressedLexicon.GetGenerationChange(var GenerationId: Integer)
  : ISpeechLexiconWords;
begin
  Result := DefaultInterface.GetGenerationChange(GenerationId);
end;

class function CoSpCompressedLexicon.Create: ISpLexicon;
begin
  Result := CreateComObject(CLASS_SpCompressedLexicon) as ISpLexicon;
end;

class function CoSpCompressedLexicon.CreateRemote(const MachineName: string)
  : ISpLexicon;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpCompressedLexicon)
    as ISpLexicon;
end;

procedure TSpCompressedLexicon.InitServerData;
const
  CServerData: TServerData = (ClassId: '{90903716-2F42-11D3-9C26-00C04F8EF87C}';
    IntfIID: '{DA41A7C2-5383-4DB2-916B-6C1719E3DB58}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpCompressedLexicon.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpLexicon;
  end;
end;

procedure TSpCompressedLexicon.ConnectTo(svrIntf: ISpLexicon);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpCompressedLexicon.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpCompressedLexicon.GetDefaultInterface: ISpLexicon;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpCompressedLexicon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpCompressedLexicon.Destroy;
begin
  inherited Destroy;
end;

function TSpCompressedLexicon.GetPronunciations(pszWord: PWideChar;
  LangId: Word; dwFlags: LongWord;
  var pWordPronunciationList: SPWORDPRONUNCIATIONLIST): HResult;
begin
  Result := DefaultInterface.GetPronunciations(pszWord, LangId, dwFlags,
    pWordPronunciationList);
end;

function TSpCompressedLexicon.AddPronunciation(pszWord: PWideChar; LangId: Word;
  ePartOfSpeech: SPPARTOFSPEECH; pszPronunciation: PWideChar): HResult;
begin
  Result := DefaultInterface.AddPronunciation(pszWord, LangId, ePartOfSpeech,
    pszPronunciation);
end;

function TSpCompressedLexicon.RemovePronunciation(pszWord: PWideChar;
  LangId: Word; ePartOfSpeech: SPPARTOFSPEECH;
  pszPronunciation: PWideChar): HResult;
begin
  Result := DefaultInterface.RemovePronunciation(pszWord, LangId, ePartOfSpeech,
    pszPronunciation);
end;

function TSpCompressedLexicon.GetGeneration(out pdwGeneration
  : LongWord): HResult;
begin
  Result := DefaultInterface.GetGeneration(pdwGeneration);
end;

function TSpCompressedLexicon.GetGenerationChange(dwFlags: LongWord;
  var pdwGeneration: LongWord; var pWordList: SPWORDLIST): HResult;
begin
  Result := DefaultInterface.GetGenerationChange(dwFlags, pdwGeneration,
    pWordList);
end;

function TSpCompressedLexicon.GetWords(dwFlags: LongWord;
  var pdwGeneration: LongWord; var pdwCookie: LongWord;
  var pWordList: SPWORDLIST): HResult;
begin
  Result := DefaultInterface.GetWords(dwFlags, pdwGeneration, pdwCookie,
    pWordList);
end;

class function CoSpShortcut.Create: ISpShortcut;
begin
  Result := CreateComObject(CLASS_SpShortcut) as ISpShortcut;
end;

class function CoSpShortcut.CreateRemote(const MachineName: string)
  : ISpShortcut;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpShortcut) as ISpShortcut;
end;

procedure TSpShortcut.InitServerData;
const
  CServerData: TServerData = (ClassId: '{0D722F1A-9FCF-4E62-96D8-6DF8F01A26AA}';
    IntfIID: '{3DF681E2-EA56-11D9-8BDE-F66BAD1E3F3A}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpShortcut.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpShortcut;
  end;
end;

procedure TSpShortcut.ConnectTo(svrIntf: ISpShortcut);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpShortcut.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpShortcut.GetDefaultInterface: ISpShortcut;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpShortcut.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpShortcut.Destroy;
begin
  inherited Destroy;
end;

function TSpShortcut.AddShortcut(pszDisplay: PWideChar; LangId: Word;
  pszSpoken: PWideChar; shType: SPSHORTCUTTYPE): HResult;
begin
  Result := DefaultInterface.AddShortcut(pszDisplay, LangId, pszSpoken, shType);
end;

function TSpShortcut.RemoveShortcut(pszDisplay: PWideChar; LangId: Word;
  pszSpoken: PWideChar; shType: SPSHORTCUTTYPE): HResult;
begin
  Result := DefaultInterface.RemoveShortcut(pszDisplay, LangId,
    pszSpoken, shType);
end;

function TSpShortcut.GetShortcuts(LangId: Word;
  var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult;
begin
  Result := DefaultInterface.GetShortcuts(LangId, pShortcutpairList);
end;

function TSpShortcut.GetGeneration(out pdwGeneration: LongWord): HResult;
begin
  Result := DefaultInterface.GetGeneration(pdwGeneration);
end;

function TSpShortcut.GetWordsFromGenerationChange(var pdwGeneration: LongWord;
  var pWordList: SPWORDLIST): HResult;
begin
  Result := DefaultInterface.GetWordsFromGenerationChange(pdwGeneration,
    pWordList);
end;

function TSpShortcut.GetWords(var pdwGeneration: LongWord;
  var pdwCookie: LongWord; var pWordList: SPWORDLIST): HResult;
begin
  Result := DefaultInterface.GetWords(pdwGeneration, pdwCookie, pWordList);
end;

function TSpShortcut.GetShortcutsForGeneration(var pdwGeneration: LongWord;
  var pdwCookie: LongWord; var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult;
begin
  Result := DefaultInterface.GetShortcutsForGeneration(pdwGeneration, pdwCookie,
    pShortcutpairList);
end;

function TSpShortcut.GetGenerationChange(var pdwGeneration: LongWord;
  var pShortcutpairList: SPSHORTCUTPAIRLIST): HResult;
begin
  Result := DefaultInterface.GetGenerationChange(pdwGeneration,
    pShortcutpairList);
end;

class function CoSpPhoneConverter.Create: ISpeechPhoneConverter;
begin
  Result := CreateComObject(CLASS_SpPhoneConverter) as ISpeechPhoneConverter;
end;

class function CoSpPhoneConverter.CreateRemote(const MachineName: string)
  : ISpeechPhoneConverter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpPhoneConverter)
    as ISpeechPhoneConverter;
end;

procedure TSpPhoneConverter.InitServerData;
const
  CServerData: TServerData = (ClassId: '{9185F743-1143-4C28-86B5-BFF14F20E5C8}';
    IntfIID: '{C3E4F353-433F-43D6-89A1-6A62A7054C3D}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpPhoneConverter.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechPhoneConverter;
  end;
end;

procedure TSpPhoneConverter.ConnectTo(svrIntf: ISpeechPhoneConverter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpPhoneConverter.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpPhoneConverter.GetDefaultInterface: ISpeechPhoneConverter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpPhoneConverter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpPhoneConverter.Destroy;
begin
  inherited Destroy;
end;

function TSpPhoneConverter.Get_LanguageId: Integer;
begin
  Result := DefaultInterface.LanguageId;
end;

procedure TSpPhoneConverter.Set_LanguageId(LanguageId: Integer);
begin
  DefaultInterface.LanguageId := LanguageId;
end;

function TSpPhoneConverter.PhoneToId(const Phonemes: WideString): OleVariant;
begin
  Result := DefaultInterface.PhoneToId(Phonemes);
end;

function TSpPhoneConverter.IdToPhone(IdArray: OleVariant): WideString;
begin
  Result := DefaultInterface.IdToPhone(IdArray);
end;

class function CoSpPhoneticAlphabetConverter.Create
  : ISpPhoneticAlphabetConverter;
begin
  Result := CreateComObject(CLASS_SpPhoneticAlphabetConverter)
    as ISpPhoneticAlphabetConverter;
end;

class function CoSpPhoneticAlphabetConverter.CreateRemote(const MachineName
  : string): ISpPhoneticAlphabetConverter;
begin
  Result := CreateRemoteComObject(MachineName,
    CLASS_SpPhoneticAlphabetConverter) as ISpPhoneticAlphabetConverter;
end;

procedure TSpPhoneticAlphabetConverter.InitServerData;
const
  CServerData: TServerData = (ClassId: '{4F414126-DFE3-4629-99EE-797978317EAD}';
    IntfIID: '{133ADCD4-19B4-4020-9FDC-842E78253B17}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpPhoneticAlphabetConverter.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpPhoneticAlphabetConverter;
  end;
end;

procedure TSpPhoneticAlphabetConverter.ConnectTo
  (svrIntf: ISpPhoneticAlphabetConverter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpPhoneticAlphabetConverter.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpPhoneticAlphabetConverter.GetDefaultInterface
  : ISpPhoneticAlphabetConverter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpPhoneticAlphabetConverter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpPhoneticAlphabetConverter.Destroy;
begin
  inherited Destroy;
end;

function TSpPhoneticAlphabetConverter.GetLangId(out pLangID: Word): HResult;
begin
  Result := DefaultInterface.GetLangId(pLangID);
end;

function TSpPhoneticAlphabetConverter.SetLangId(LangId: Word): HResult;
begin
  Result := DefaultInterface.SetLangId(LangId);
end;

function TSpPhoneticAlphabetConverter.SAPI2UPS(var pszSAPIId: Word;
  out pszUPSId: Word; cMaxLength: LongWord): HResult;
begin
  Result := DefaultInterface.SAPI2UPS(pszSAPIId, pszUPSId, cMaxLength);
end;

function TSpPhoneticAlphabetConverter.UPS2SAPI(var pszUPSId: Word;
  out pszSAPIId: Word; cMaxLength: LongWord): HResult;
begin
  Result := DefaultInterface.UPS2SAPI(pszUPSId, pszSAPIId, cMaxLength);
end;

function TSpPhoneticAlphabetConverter.GetMaxConvertLength(cSrcLength: LongWord;
  bSAPI2UPS: Integer; out pcMaxDestLength: LongWord): HResult;
begin
  Result := DefaultInterface.GetMaxConvertLength(cSrcLength, bSAPI2UPS,
    pcMaxDestLength);
end;

class function CoSpNullPhoneConverter.Create: ISpPhoneConverter;
begin
  Result := CreateComObject(CLASS_SpNullPhoneConverter) as ISpPhoneConverter;
end;

class function CoSpNullPhoneConverter.CreateRemote(const MachineName: string)
  : ISpPhoneConverter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpNullPhoneConverter)
    as ISpPhoneConverter;
end;

procedure TSpNullPhoneConverter.InitServerData;
const
  CServerData: TServerData = (ClassId: '{455F24E9-7396-4A16-9715-7C0FDBE3EFE3}';
    IntfIID: '{8445C581-0CAC-4A38-ABFE-9B2CE2826455}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpNullPhoneConverter.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpPhoneConverter;
  end;
end;

procedure TSpNullPhoneConverter.ConnectTo(svrIntf: ISpPhoneConverter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpNullPhoneConverter.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpNullPhoneConverter.GetDefaultInterface: ISpPhoneConverter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpNullPhoneConverter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpNullPhoneConverter.Destroy;
begin
  inherited Destroy;
end;

function TSpNullPhoneConverter.SetObjectToken(const pToken
  : ISpObjectToken): HResult;
begin
  Result := DefaultInterface.SetObjectToken(pToken);
end;

function TSpNullPhoneConverter.GetObjectToken(out ppToken
  : ISpObjectToken): HResult;
begin
  Result := DefaultInterface.GetObjectToken(ppToken);
end;

function TSpNullPhoneConverter.PhoneToId(pszPhone: PWideChar;
  out pId: Word): HResult;
begin
  Result := DefaultInterface.PhoneToId(pszPhone, pId);
end;

function TSpNullPhoneConverter.IdToPhone(pId: PWideChar;
  out pszPhone: Word): HResult;
begin
  Result := DefaultInterface.IdToPhone(pId, pszPhone);
end;

class function CoSpTextSelectionInformation.Create
  : ISpeechTextSelectionInformation;
begin
  Result := CreateComObject(CLASS_SpTextSelectionInformation)
    as ISpeechTextSelectionInformation;
end;

class function CoSpTextSelectionInformation.CreateRemote(const MachineName
  : string): ISpeechTextSelectionInformation;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpTextSelectionInformation)
    as ISpeechTextSelectionInformation;
end;

procedure TSpTextSelectionInformation.InitServerData;
const
  CServerData: TServerData = (ClassId: '{0F92030A-CBFD-4AB8-A164-FF5985547FF6}';
    IntfIID: '{3B9C7E7A-6EEE-4DED-9092-11657279ADBE}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpTextSelectionInformation.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechTextSelectionInformation;
  end;
end;

procedure TSpTextSelectionInformation.ConnectTo
  (svrIntf: ISpeechTextSelectionInformation);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpTextSelectionInformation.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpTextSelectionInformation.GetDefaultInterface
  : ISpeechTextSelectionInformation;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpTextSelectionInformation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpTextSelectionInformation.Destroy;
begin
  inherited Destroy;
end;

procedure TSpTextSelectionInformation.Set_ActiveOffset(ActiveOffset: Integer);
begin
  DefaultInterface.ActiveOffset := ActiveOffset;
end;

function TSpTextSelectionInformation.Get_ActiveOffset: Integer;
begin
  Result := DefaultInterface.ActiveOffset;
end;

procedure TSpTextSelectionInformation.Set_ActiveLength(ActiveLength: Integer);
begin
  DefaultInterface.ActiveLength := ActiveLength;
end;

function TSpTextSelectionInformation.Get_ActiveLength: Integer;
begin
  Result := DefaultInterface.ActiveLength;
end;

procedure TSpTextSelectionInformation.Set_SelectionOffset(SelectionOffset
  : Integer);
begin
  DefaultInterface.SelectionOffset := SelectionOffset;
end;

function TSpTextSelectionInformation.Get_SelectionOffset: Integer;
begin
  Result := DefaultInterface.SelectionOffset;
end;

procedure TSpTextSelectionInformation.Set_SelectionLength(SelectionLength
  : Integer);
begin
  DefaultInterface.SelectionLength := SelectionLength;
end;

function TSpTextSelectionInformation.Get_SelectionLength: Integer;
begin
  Result := DefaultInterface.SelectionLength;
end;

class function CoSpPhraseInfoBuilder.Create: ISpeechPhraseInfoBuilder;
begin
  Result := CreateComObject(CLASS_SpPhraseInfoBuilder)
    as ISpeechPhraseInfoBuilder;
end;

class function CoSpPhraseInfoBuilder.CreateRemote(const MachineName: string)
  : ISpeechPhraseInfoBuilder;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpPhraseInfoBuilder)
    as ISpeechPhraseInfoBuilder;
end;

procedure TSpPhraseInfoBuilder.InitServerData;
const
  CServerData: TServerData = (ClassId: '{C23FC28D-C55F-4720-8B32-91F73C2BD5D1}';
    IntfIID: '{3B151836-DF3A-4E0A-846C-D2ADC9334333}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpPhraseInfoBuilder.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechPhraseInfoBuilder;
  end;
end;

procedure TSpPhraseInfoBuilder.ConnectTo(svrIntf: ISpeechPhraseInfoBuilder);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpPhraseInfoBuilder.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpPhraseInfoBuilder.GetDefaultInterface: ISpeechPhraseInfoBuilder;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpPhraseInfoBuilder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpPhraseInfoBuilder.Destroy;
begin
  inherited Destroy;
end;

function TSpPhraseInfoBuilder.RestorePhraseFromMemory(const PhraseInMemory
  : OleVariant): ISpeechPhraseInfo;
begin
  Result := DefaultInterface.RestorePhraseFromMemory(PhraseInMemory);
end;

class function CoSpAudioFormat.Create: ISpeechAudioFormat;
begin
  Result := CreateComObject(CLASS_SpAudioFormat) as ISpeechAudioFormat;
end;

class function CoSpAudioFormat.CreateRemote(const MachineName: string)
  : ISpeechAudioFormat;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpAudioFormat)
    as ISpeechAudioFormat;
end;

procedure TSpAudioFormat.InitServerData;
const
  CServerData: TServerData = (ClassId: '{9EF96870-E160-4792-820D-48CF0649E4EC}';
    IntfIID: '{E6E9C590-3E18-40E3-8299-061F98BDE7C7}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpAudioFormat.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechAudioFormat;
  end;
end;

procedure TSpAudioFormat.ConnectTo(svrIntf: ISpeechAudioFormat);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpAudioFormat.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpAudioFormat.GetDefaultInterface: ISpeechAudioFormat;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpAudioFormat.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpAudioFormat.Destroy;
begin
  inherited Destroy;
end;

function TSpAudioFormat.Get_type_: SpeechAudioFormatType;
begin
  Result := DefaultInterface.type_;
end;

procedure TSpAudioFormat.Set_type_(AudioFormat: SpeechAudioFormatType);
begin
  DefaultInterface.type_ := AudioFormat;
end;

function TSpAudioFormat.Get_Guid: WideString;
begin
  Result := DefaultInterface.Guid;
end;

procedure TSpAudioFormat.Set_Guid(const Guid: WideString);
begin
  DefaultInterface.Guid := Guid;
end;

function TSpAudioFormat.GetWaveFormatEx: ISpeechWaveFormatEx;
begin
  Result := DefaultInterface.GetWaveFormatEx;
end;

procedure TSpAudioFormat.SetWaveFormatEx(const SpeechWaveFormatEx
  : ISpeechWaveFormatEx);
begin
  DefaultInterface.SetWaveFormatEx(SpeechWaveFormatEx);
end;

class function CoSpWaveFormatEx.Create: ISpeechWaveFormatEx;
begin
  Result := CreateComObject(CLASS_SpWaveFormatEx) as ISpeechWaveFormatEx;
end;

class function CoSpWaveFormatEx.CreateRemote(const MachineName: string)
  : ISpeechWaveFormatEx;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpWaveFormatEx)
    as ISpeechWaveFormatEx;
end;

procedure TSpWaveFormatEx.InitServerData;
const
  CServerData: TServerData = (ClassId: '{C79A574C-63BE-44B9-801F-283F87F898BE}';
    IntfIID: '{7A1EF0D5-1581-4741-88E4-209A49F11A10}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpWaveFormatEx.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechWaveFormatEx;
  end;
end;

procedure TSpWaveFormatEx.ConnectTo(svrIntf: ISpeechWaveFormatEx);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpWaveFormatEx.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpWaveFormatEx.GetDefaultInterface: ISpeechWaveFormatEx;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpWaveFormatEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpWaveFormatEx.Destroy;
begin
  inherited Destroy;
end;

function TSpWaveFormatEx.Get_FormatTag: Smallint;
begin
  Result := DefaultInterface.FormatTag;
end;

procedure TSpWaveFormatEx.Set_FormatTag(FormatTag: Smallint);
begin
  DefaultInterface.FormatTag := FormatTag;
end;

function TSpWaveFormatEx.Get_Channels: Smallint;
begin
  Result := DefaultInterface.Channels;
end;

procedure TSpWaveFormatEx.Set_Channels(Channels: Smallint);
begin
  DefaultInterface.Channels := Channels;
end;

function TSpWaveFormatEx.Get_SamplesPerSec: Integer;
begin
  Result := DefaultInterface.SamplesPerSec;
end;

procedure TSpWaveFormatEx.Set_SamplesPerSec(SamplesPerSec: Integer);
begin
  DefaultInterface.SamplesPerSec := SamplesPerSec;
end;

function TSpWaveFormatEx.Get_AvgBytesPerSec: Integer;
begin
  Result := DefaultInterface.AvgBytesPerSec;
end;

procedure TSpWaveFormatEx.Set_AvgBytesPerSec(AvgBytesPerSec: Integer);
begin
  DefaultInterface.AvgBytesPerSec := AvgBytesPerSec;
end;

function TSpWaveFormatEx.Get_BlockAlign: Smallint;
begin
  Result := DefaultInterface.BlockAlign;
end;

procedure TSpWaveFormatEx.Set_BlockAlign(BlockAlign: Smallint);
begin
  DefaultInterface.BlockAlign := BlockAlign;
end;

function TSpWaveFormatEx.Get_BitsPerSample: Smallint;
begin
  Result := DefaultInterface.BitsPerSample;
end;

procedure TSpWaveFormatEx.Set_BitsPerSample(BitsPerSample: Smallint);
begin
  DefaultInterface.BitsPerSample := BitsPerSample;
end;

function TSpWaveFormatEx.Get_ExtraData: OleVariant;
begin
  Result := DefaultInterface.ExtraData;
end;

procedure TSpWaveFormatEx.Set_ExtraData(ExtraData: OleVariant);
begin
  DefaultInterface.ExtraData := ExtraData;
end;

class function CoSpInProcRecoContext.Create: ISpeechRecoContext;
begin
  Result := CreateComObject(CLASS_SpInProcRecoContext) as ISpeechRecoContext;
end;

class function CoSpInProcRecoContext.CreateRemote(const MachineName: string)
  : ISpeechRecoContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpInProcRecoContext)
    as ISpeechRecoContext;
end;

procedure TSpInProcRecoContext.InitServerData;
const
  CServerData: TServerData = (ClassId: '{73AD6842-ACE0-45E8-A4DD-8795881A2C2A}';
    IntfIID: '{580AA49D-7E1E-4809-B8E2-57DA806104B8}';
    EventIID: '{7B8FCB42-0E9D-4F00-A048-7B04D6179D3D}'; LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpInProcRecoContext.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    FIntf := punk as ISpeechRecoContext;
  end;
end;

procedure TSpInProcRecoContext.ConnectTo(svrIntf: ISpeechRecoContext);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TSpInProcRecoContext.Disconnect;
begin
  if FIntf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TSpInProcRecoContext.GetDefaultInterface: ISpeechRecoContext;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpInProcRecoContext.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpInProcRecoContext.Destroy;
begin
  inherited Destroy;
end;

procedure TSpInProcRecoContext.InvokeEvent(dispid: TDispID;
  var Params: TVariantArray);
begin
  case DispID of
    - 1:
      Exit; // DISPID_UNKNOWN
    1:
      if Assigned(FOnStartStream) then
        FOnStartStream(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    2:
      if Assigned(FOnEndStream) then
        FOnEndStream(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { WordBool } );
    3:
      if Assigned(FOnBookmark) then
        FOnBookmark(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { OleVariant } , Params[3] { SpeechBookmarkOptions } );
    4:
      if Assigned(FOnSoundStart) then
        FOnSoundStart(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    5:
      if Assigned(FOnSoundEnd) then
        FOnSoundEnd(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    6:
      if Assigned(FOnPhraseStart) then
        FOnPhraseStart(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    7:
      if Assigned(FOnRecognition) then
        FOnRecognition(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { SpeechRecognitionType } ,
          IUnknown(TVarData(Params[3]).VPointer)
          as ISpeechRecoResult { const ISpeechRecoResult } );
    8:
      if Assigned(FOnHypothesis) then
        FOnHypothesis(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          IUnknown(TVarData(Params[2]).VPointer)
          as ISpeechRecoResult { const ISpeechRecoResult } );
    9:
      if Assigned(FOnPropertyNumberChange) then
        FOnPropertyNumberChange(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { const WideString } ,
          Params[3] { Integer } );
    10:
      if Assigned(FOnPropertyStringChange) then
        FOnPropertyStringChange(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { const WideString } ,
          Params[3] { const WideString } );
    11:
      if Assigned(FOnFalseRecognition) then
        FOnFalseRecognition(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , IUnknown(TVarData(Params[2]).VPointer)
          as ISpeechRecoResult { const ISpeechRecoResult } );
    12:
      if Assigned(FOnInterference) then
        FOnInterference(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { SpeechInterference } );
    13:
      if Assigned(FOnRequestUI) then
        FOnRequestUI(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { const WideString } );
    14:
      if Assigned(FOnRecognizerStateChange) then
        FOnRecognizerStateChange(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { SpeechRecognizerState } );
    15:
      if Assigned(FOnAdaptation) then
        FOnAdaptation(Self, Params[0] { Integer } , Params[1] { OleVariant } );
    16:
      if Assigned(FOnRecognitionForOtherContext) then
        FOnRecognitionForOtherContext(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } );
    17:
      if Assigned(FOnAudioLevel) then
        FOnAudioLevel(Self, Params[0] { Integer } , Params[1] { OleVariant } ,
          Params[2] { Integer } );
    18:
      if Assigned(FOnEnginePrivate) then
        FOnEnginePrivate(Self, Params[0] { Integer } ,
          Params[1] { OleVariant } , Params[2] { OleVariant } );
  end; { case DispID }
end;

function TSpInProcRecoContext.Get_Recognizer: ISpeechRecognizer;
begin
  Result := DefaultInterface.Recognizer;
end;

function TSpInProcRecoContext.Get_AudioInputInterferenceStatus
  : SpeechInterference;
begin
  Result := DefaultInterface.AudioInputInterferenceStatus;
end;

function TSpInProcRecoContext.Get_RequestedUIType: WideString;
begin
  Result := DefaultInterface.RequestedUIType;
end;

procedure TSpInProcRecoContext._Set_Voice(const Voice: ISpeechVoice);
begin
  DefaultInterface.Voice := Voice;
end;

function TSpInProcRecoContext.Get_Voice: ISpeechVoice;
begin
  Result := DefaultInterface.Voice;
end;

procedure TSpInProcRecoContext.Set_AllowVoiceFormatMatchingOnNextSet
  (pAllow: WordBool);
begin
  DefaultInterface.AllowVoiceFormatMatchingOnNextSet := pAllow;
end;

function TSpInProcRecoContext.Get_AllowVoiceFormatMatchingOnNextSet: WordBool;
begin
  Result := DefaultInterface.AllowVoiceFormatMatchingOnNextSet;
end;

procedure TSpInProcRecoContext.Set_VoicePurgeEvent(EventInterest
  : SpeechRecoEvents);
begin
  DefaultInterface.VoicePurgeEvent := EventInterest;
end;

function TSpInProcRecoContext.Get_VoicePurgeEvent: SpeechRecoEvents;
begin
  Result := DefaultInterface.VoicePurgeEvent;
end;

procedure TSpInProcRecoContext.Set_EventInterests(EventInterest
  : SpeechRecoEvents);
begin
  DefaultInterface.EventInterests := EventInterest;
end;

function TSpInProcRecoContext.Get_EventInterests: SpeechRecoEvents;
begin
  Result := DefaultInterface.EventInterests;
end;

procedure TSpInProcRecoContext.Set_CmdMaxAlternates(MaxAlternates: Integer);
begin
  DefaultInterface.CmdMaxAlternates := MaxAlternates;
end;

function TSpInProcRecoContext.Get_CmdMaxAlternates: Integer;
begin
  Result := DefaultInterface.CmdMaxAlternates;
end;

procedure TSpInProcRecoContext.Set_State(State: SpeechRecoContextState);
begin
  DefaultInterface.State := State;
end;

function TSpInProcRecoContext.Get_State: SpeechRecoContextState;
begin
  Result := DefaultInterface.State;
end;

procedure TSpInProcRecoContext.Set_RetainedAudio
  (Option: SpeechRetainedAudioOptions);
begin
  DefaultInterface.RetainedAudio := Option;
end;

function TSpInProcRecoContext.Get_RetainedAudio: SpeechRetainedAudioOptions;
begin
  Result := DefaultInterface.RetainedAudio;
end;

procedure TSpInProcRecoContext._Set_RetainedAudioFormat
  (const Format: ISpeechAudioFormat);
begin
  DefaultInterface.RetainedAudioFormat := Format;
end;

function TSpInProcRecoContext.Get_RetainedAudioFormat: ISpeechAudioFormat;
begin
  Result := DefaultInterface.RetainedAudioFormat;
end;

procedure TSpInProcRecoContext.Pause;
begin
  DefaultInterface.Pause;
end;

procedure TSpInProcRecoContext.Resume;
begin
  DefaultInterface.Resume;
end;

function TSpInProcRecoContext.CreateGrammar: ISpeechRecoGrammar;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.CreateGrammar(EmptyParam);
end;

function TSpInProcRecoContext.CreateGrammar(GrammarId: OleVariant)
  : ISpeechRecoGrammar;
begin
  Result := DefaultInterface.CreateGrammar(GrammarId);
end;

function TSpInProcRecoContext.CreateResultFromMemory(const ResultBlock
  : OleVariant): ISpeechRecoResult;
begin
  Result := DefaultInterface.CreateResultFromMemory(ResultBlock);
end;

procedure TSpInProcRecoContext.Bookmark(Options: SpeechBookmarkOptions;
  StreamPos: OleVariant; BookmarkId: OleVariant);
begin
  DefaultInterface.Bookmark(Options, StreamPos, BookmarkId);
end;

procedure TSpInProcRecoContext.SetAdaptationData(const AdaptationString
  : WideString);
begin
  DefaultInterface.SetAdaptationData(AdaptationString);
end;

class function CoSpCustomStream.Create: ISpeechCustomStream;
begin
  Result := CreateComObject(CLASS_SpCustomStream) as ISpeechCustomStream;
end;

class function CoSpCustomStream.CreateRemote(const MachineName: string)
  : ISpeechCustomStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpCustomStream)
    as ISpeechCustomStream;
end;

procedure TSpCustomStream.InitServerData;
const
  CServerData: TServerData = (ClassId: '{8DBEF13F-1948-4AA8-8CF0-048EEBED95D8}';
    IntfIID: '{1A9E9F4F-104F-4DB8-A115-EFD7FD0C97AE}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpCustomStream.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechCustomStream;
  end;
end;

procedure TSpCustomStream.ConnectTo(svrIntf: ISpeechCustomStream);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpCustomStream.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpCustomStream.GetDefaultInterface: ISpeechCustomStream;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpCustomStream.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpCustomStream.Destroy;
begin
  inherited Destroy;
end;

function TSpCustomStream.Get_Format: ISpeechAudioFormat;
begin
  Result := DefaultInterface.Format;
end;

procedure TSpCustomStream._Set_Format(const AudioFormat: ISpeechAudioFormat);
begin
  DefaultInterface.Format := AudioFormat;
end;

function TSpCustomStream.Get_BaseStream: IUnknown;
begin
  Result := DefaultInterface.BaseStream;
end;

procedure TSpCustomStream._Set_BaseStream(const ppUnkStream: IUnknown);
begin
  DefaultInterface.BaseStream := ppUnkStream;
end;

function TSpCustomStream.Read(out Buffer: OleVariant;
  NumberOfBytes: Integer): Integer;
begin
  Result := DefaultInterface.Read(Buffer, NumberOfBytes);
end;

function TSpCustomStream.Write(Buffer: OleVariant): Integer;
begin
  Result := DefaultInterface.Write(Buffer);
end;

function TSpCustomStream.Seek(Position: OleVariant;
  Origin: SpeechStreamSeekPositionType): OleVariant;
begin
  Result := DefaultInterface.Seek(Position, Origin);
end;

class function CoSpFileStream.Create: ISpeechFileStream;
begin
  Result := CreateComObject(CLASS_SpFileStream) as ISpeechFileStream;
end;

class function CoSpFileStream.CreateRemote(const MachineName: string)
  : ISpeechFileStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpFileStream)
    as ISpeechFileStream;
end;

procedure TSpFileStream.InitServerData;
const
  CServerData: TServerData = (ClassId: '{947812B3-2AE1-4644-BA86-9E90DED7EC91}';
    IntfIID: '{AF67F125-AB39-4E93-B4A2-CC2E66E182A7}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpFileStream.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechFileStream;
  end;
end;

procedure TSpFileStream.ConnectTo(svrIntf: ISpeechFileStream);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpFileStream.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpFileStream.GetDefaultInterface: ISpeechFileStream;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpFileStream.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpFileStream.Destroy;
begin
  inherited Destroy;
end;

function TSpFileStream.Get_Format: ISpeechAudioFormat;
begin
  Result := DefaultInterface.Format;
end;

procedure TSpFileStream._Set_Format(const AudioFormat: ISpeechAudioFormat);
begin
  DefaultInterface.Format := AudioFormat;
end;

function TSpFileStream.Read(out Buffer: OleVariant;
  NumberOfBytes: Integer): Integer;
begin
  Result := DefaultInterface.Read(Buffer, NumberOfBytes);
end;

function TSpFileStream.Write(Buffer: OleVariant): Integer;
begin
  Result := DefaultInterface.Write(Buffer);
end;

function TSpFileStream.Seek(Position: OleVariant;
  Origin: SpeechStreamSeekPositionType): OleVariant;
begin
  Result := DefaultInterface.Seek(Position, Origin);
end;

procedure TSpFileStream.Open(const FileName: WideString;
  FileMode: SpeechStreamFileMode; DoEvents: WordBool);
begin
  DefaultInterface.Open(FileName, FileMode, DoEvents);
end;

procedure TSpFileStream.Close;
begin
  DefaultInterface.Close;
end;

class function CoSpMemoryStream.Create: ISpeechMemoryStream;
begin
  Result := CreateComObject(CLASS_SpMemoryStream) as ISpeechMemoryStream;
end;

class function CoSpMemoryStream.CreateRemote(const MachineName: string)
  : ISpeechMemoryStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpMemoryStream)
    as ISpeechMemoryStream;
end;

procedure TSpMemoryStream.InitServerData;
const
  CServerData: TServerData = (ClassId: '{5FB7EF7D-DFF4-468A-B6B7-2FCBD188F994}';
    IntfIID: '{EEB14B68-808B-4ABE-A5EA-B51DA7588008}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpMemoryStream.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as ISpeechMemoryStream;
  end;
end;

procedure TSpMemoryStream.ConnectTo(svrIntf: ISpeechMemoryStream);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpMemoryStream.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpMemoryStream.GetDefaultInterface: ISpeechMemoryStream;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpMemoryStream.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpMemoryStream.Destroy;
begin
  inherited Destroy;
end;

function TSpMemoryStream.Get_Format: ISpeechAudioFormat;
begin
  Result := DefaultInterface.Format;
end;

procedure TSpMemoryStream._Set_Format(const AudioFormat: ISpeechAudioFormat);
begin
  DefaultInterface.Format := AudioFormat;
end;

function TSpMemoryStream.Read(out Buffer: OleVariant;
  NumberOfBytes: Integer): Integer;
begin
  Result := DefaultInterface.Read(Buffer, NumberOfBytes);
end;

function TSpMemoryStream.Write(Buffer: OleVariant): Integer;
begin
  Result := DefaultInterface.Write(Buffer);
end;

function TSpMemoryStream.Seek(Position: OleVariant;
  Origin: SpeechStreamSeekPositionType): OleVariant;
begin
  Result := DefaultInterface.Seek(Position, Origin);
end;

procedure TSpMemoryStream.SetData(Data: OleVariant);
begin
  DefaultInterface.SetData(Data);
end;

function TSpMemoryStream.GetData: OleVariant;
begin
  Result := DefaultInterface.GetData;
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.System '}
constructor TBaseObject.Create;
begin
  inherited;
end;

destructor TBaseObject.Destroy;
begin
  inherited;
end;

var
  uCosTable: array [0..360] of Single;
  uSinTable: array [0..360] of Single;
  uCodePage: Cardinal;

class operator TPoint.Initialize(out aDest: TPoint);
begin
  aDest.X := 0;
  aDest.Y := 0;
  aDest.Z := 0;
end;

class operator TPoint.Implicit(aValue: TPoint): SDL_Point;
begin
  Result.x := Round(aValue.X);
  Result.y := Round(aValue.Y);
end;

class operator TPoint.Implicit(aValue: TPoint): SDL_FPoint;
begin
  Result.x := aValue.X;
  Result.y := aValue.Y;
end;

class operator TPoint.Implicit(aValue: SDL_Point): TPoint;
begin
  Result.X := aValue.x;
  Result.Y := aValue.y;
end;

class operator TPoint.Implicit(aValue: SDL_FPoint): TPoint;
begin
  Result.X := aValue.x;
  Result.Y := aValue.y;
end;

constructor TPoint.Create(const aX, aY, aZ: Single);
begin
  X := aX;
  Y := aY;
  Z := aZ;
end;

class operator TVector.Initialize (out aDest: TVector);
begin
  aDest.X := 0;
  aDest.Y := 0;
  aDest.Z := 0;
  aDest.W := 0;
end;

constructor TVector.Create(const aX,  aY: Single);
begin
  X := aX;
  Y := aY;
  Z := 0;
  W := 0;
end;

procedure TVector.Assign(const aX, aY: Single);
begin
  X := aX;
  Y := aY;
end;

procedure TVector.Assign(const aX, aY, aZ: Single);
begin
  X := aX;
  Y := aY;
  Z := aZ;
end;

procedure TVector.Assign(const aX, aY, aZ, aW: Single);
begin
  X := aX;
  Y := aY;
  Z := aZ;
  W := aW;
end;

procedure TVector.Clear;
begin
  X := 0;
  Y := 0;
  Z := 0;
end;

procedure TVector.Assign(aVector: TVector);
begin
  X := aVector.X;
  Y := aVector.Y;
end;

procedure TVector.Add(aVector: TVector);
begin
  X := X + aVector.X;
  Y := Y + aVector.Y;
end;

procedure TVector.Subtract(aVector: TVector);
begin
  X := X - aVector.X;
  Y := Y - aVector.Y;
end;

procedure TVector.Multiply(aVector: TVector);
begin
  X := X * aVector.X;
  Y := Y * aVector.Y;
end;

procedure TVector.Divide(aVector: TVector);
begin
  X := X / aVector.X;
  Y := Y / aVector.Y;

end;

function TVector.Magnitude: Single;
begin
  Result := Sqrt((X * X) + (Y * Y));
end;

function TVector.MagnitudeTruncate(aMaxMagitude: Single): TVector;
var
  LMaxMagSqrd: Single;
  LVecMagSqrd: Single;
  LTruc: Single;
begin
  Result.Assign(X, Y);
  LMaxMagSqrd := aMaxMagitude * aMaxMagitude;
  LVecMagSqrd := Result.Magnitude;
  if LVecMagSqrd > LMaxMagSqrd then
  begin
    LTruc := (aMaxMagitude / Sqrt(LVecMagSqrd));
    Result.X := Result.X * LTruc;
    Result.Y := Result.Y * LTruc;
  end;
end;

function TVector.Distance(aVector: TVector): Single;
var
  LDirVec: TVector;
begin
  LDirVec.X := X - aVector.X;
  LDirVec.Y := Y - aVector.Y;
  Result := LDirVec.Magnitude;
end;

procedure TVector.Normalize;
var
  LLen, LOOL: Single;
begin
  LLen := self.Magnitude;
  if LLen <> 0 then
  begin
    LOOL := 1.0 / LLen;
    X := X * LOOL;
    Y := Y * LOOL;
  end;
end;

function TVector.Angle(aVector: TVector): Single;
var
  LXOY: Single;
  LR: TVector;
begin
  LR.Assign(self);
  LR.Subtract(aVector);
  LR.Normalize;

  if LR.Y = 0 then
  begin
    LR.Y := 0.001;
  end;

  LXOY := LR.X / LR.Y;

  Result := ArcTan(LXOY) * RADTODEG;
  if LR.Y < 0 then
    Result := Result + 180.0;
end;

procedure TVector.Thrust(aAngle: Single; aSpeed: Single);
var
  LA: Single;
begin
  LA := aAngle + 90.0;
  ClipValuef(LA, 0, 360, True);

  X := X + AngleCos(Round(LA)) * -(aSpeed);
  Y := Y + AngleSin(Round(LA)) * -(aSpeed);
end;

function TVector.MagnitudeSquared: Single;
begin
  Result := (X * X) + (Y * Y);
end;

function TVector.DotProduct(aVector: TVector): Single;
begin
  Result := (X * aVector.X) + (Y * aVector.Y);
end;

procedure TVector.Scale(aValue: Single);
begin
  X := X * aValue;
  Y := Y * aValue;
end;

procedure TVector.DivideBy(aValue: Single);
begin
  X := X / aValue;
  Y := Y / aValue;
end;

function TVector.Project(aVector: TVector): TVector;
var
  LDP: Single;
begin
  LDP := self.DotProduct(aVector);
  Result.X := (LDP / (aVector.X * aVector.X + aVector.Y * aVector.Y)) * aVector.X;
  Result.Y := (LDP / (aVector.X * aVector.X + aVector.Y * aVector.Y)) * aVector.Y;
end;

procedure TVector.Negate;
begin
  X := -X;
  Y := -Y;
end;

class operator TRect.Initialize(out aDest: TRect);
begin
  aDest.Width := 0;
  aDest.Height := 0;
end;

class operator TRect.Implicit(aValue: TRect): SDL_Rect;
begin
  Result.x := Round(aValue.X);
  Result.y := Round(aValue.Y);
  Result.w := Round(aValue.Width);
  Result.h := Round(aValue.Height);
end;

class operator TRect.Implicit(aValue: TRect): SDL_FRect;
begin
  Result.x := aValue.X;
  Result.y := aValue.Y;
  Result.w := aValue.Width;
  Result.h := aValue.Height;
end;

class operator TRect.Implicit(aValue: SDL_Rect): TRect;
begin
  Result.X := aValue.x;
  Result.Y := aValue.y;
  Result.Width := aValue.w;
  Result.Height := aValue.h;
end;

class operator TRect.Implicit(aValue: SDL_FRect): TRect;
begin
  Result.X := aValue.x;
  Result.Y := aValue.y;
  Result.Width := aValue.w;
  Result.Height := aValue.h;
end;

constructor TRect.Create(const aX, aY, aWidth, aHeight: Single);
begin
  Assign(aX, aY, aWidth, aHeight);
end;

procedure TRect.Assign(aX, aY, aWidth, aHeight: Single);
begin
  X := aX;
  Y := aY;
  Width := aWidth;
  Height := aHeight;
end;

function  TRect.Intersect(aRect: TRect): Boolean;
var
  LR1R, LR1B: Single;
  LR2R, LR2B: Single;
begin
  LR1R := X - (Width - 1);
  LR1B := Y - (Height - 1);
  LR2R := aRect.X - (aRect.Width - 1);
  LR2B := aRect.Y - (aRect.Height - 1);

  Result := (X < LR2R) and (LR1R > aRect.X) and (Y < LR2B) and (LR1B > aRect.Y);
end;

class operator TTimer.Initialize(out aDest: TTimer);
begin
  Reset(TIMER_UPDATE_SPEED, TIMER_FIXEDUPDATE_SPEED);
end;

class operator TTimer.Finalize(var aDest: TTimer);
begin
end;

class procedure TTimer.Reset(aSpeed: Single=0; aFixedSpeed: Single=0);
begin
  FNow := 0;
  FPassed := 0;
  FLast := 0;

  FAccumulator := 0;
  FFrameAccumulator := 0;

  FDeltaTime := 0;

  FFrameCount := 0;
  FFrameRate := 0;

  if aSpeed > 0 then
    begin
      FUpdateSpeed := aSpeed;
      FDeltaTime := 1.0 / FUpdateSpeed;
    end
  else
    begin
      FDeltaTime := 1.0 / FUpdateSpeed;
    end;

  if aFixedSpeed > 0 then
  begin
    FFixedUpdateSpeed := aSpeed;
    FFixedUpdateTimer := 0;
  end;

  FLast := SDL_GetTicks64 / 1000.0;
end;

class procedure TTimer.Update;
begin
  FNow := SDL_GetTicks64 / 1000.0;
  FPassed := FNow - FLast;
  FLast := FNow;

  Inc(FFrameCount);
  FFrameAccumulator := FFrameAccumulator + FPassed + EPSILON;
  if FFrameAccumulator >= 1 then
  begin
    FFrameAccumulator := 0;
    FFrameRate := FFrameCount;
    FFrameCount := 0;
  end;

  FAccumulator := FAccumulator + FPassed;
  while (FAccumulator >= FDeltaTime) do
  begin
    Game.OnUpdate(FDeltaTime);
    if FrameSpeed(FFixedUpdateTimer, FFixedUpdateSpeed) then Game.OnFixedUpdate(FFixedUpdateSpeed);
    FAccumulator := FAccumulator - FDeltaTime;
  end;
end;

class function  TTimer.FrameSpeed(var aTimer: Single; aSpeed: Single): Boolean;
begin
  Result := False;
  aTimer := aTimer + (aSpeed / FUpdateSpeed);
  if aTimer >= 1.0 then
  begin
    aTimer := 0;
    Result := True;
  end;
end;

class function  TTimer.FrameElapsed(var aTimer: Single; aFrames: Single): Boolean;
begin
  Result := False;
  aTimer := aTimer + FDeltaTime;
  if aTimer > aFrames then
  begin
    aTimer := 0;
    Result := True;
  end;
end;

class function  TTimer.Elapsed(var aTimer: Single; aSeconds: Single): Boolean;
begin
  Result := FrameElapsed(aTimer, FUpdateSpeed*aSeconds);
end;

class function  TTimer.FrameRate: Cardinal;
begin
  Result := FFrameRate;
end;

class operator TColor.Implicit(aValue: TColor): SDL_Color;
begin
  Result.r := aValue.Red;
  Result.g := aValue.Green;
  Result.b := aValue.Blue;
  Result.a := aValue.Alpha;
end;

class operator TColor.Implicit(aValue: SDL_Color): TColor;
begin
  Result.Red := aValue.r;
  Result.Green := aValue.g;
  Result.Blue := aVAlue.b;
  Result.Alpha := aValue.a;
end;

function TColor.Make(const aRed, aGreen, aBlue, aAlpha: Byte): TColor;
begin
  Red := aRed;
  Green := aGreen;
  Blue := aBlue;
  Alpha := aAlpha;
  Result.Red := Red;
  Result.Green := Green;
  Result.BLue := Blue;
  Result.Alpha := Alpha;
end;

function TColor.Makef(const aRed, aGreen, aBlue, aAlpha: Single): TColor;
begin
  Red := Round(UnitToScalarValue(aRed, 255));
  Green := Round(UnitToScalarValue(aGreen, 255));
  Blue := Round(UnitToScalarValue(aBlue, 255));
  Alpha := Round(UnitToScalarValue(aAlpha, 255));

  Result.Red := Red;
  Result.Green := Green;
  Result.BLue := Blue;
  Result.Alpha := Alpha;
end;

function TColor.Fade(const aTo: TColor; const aPos: Single): TColor;
var
  LRed, LGreen, LBlue, LAlpha: Single;
  LPos: Single;
begin
  LPos := EnsureRange(aPos, 0, 1);

  LAlpha := Alpha + ((aTo.Alpha - Alpha) * LPos);
  LBlue := Blue + ((aTo.Blue - Blue) * LPos);
  LGreen := Green + ((aTo.Green - Green) * LPos);
  LRed := Red + ((aTo.Red - Red) * LPos);
  Result := Makef(LRed, LGreen, LBlue, LAlpha);
end;

function TColor.Equal(const aColor: TColor): Boolean;
begin
  if (Red = aColor.Red) and (Green = aColor.Green) and
    (Blue = aColor.Blue) and (Alpha = aColor.Alpha) then
    Result := True
  else
    Result := False;
end;

procedure TColor.Clear;
begin
  Red := 0;
  Green := 0;
  Blue := 0;
  Alpha := 0;
end;

function  AngleCos(const aAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(aAngle, 0, 360);
  Result := uCosTable[LAngle];
end;

function  AngleSin(const aAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(aAngle, 0, 360);
  Result := uSinTable[LAngle];
end;

function _RandomRange(const aFrom, aTo: Integer): Integer;
var
  LFrom: Integer;
  LTo: Integer;
begin
  LFrom := aFrom;
  LTo := aTo;

  if AFrom > ATo then
    Result := Random(LFrom - LTo) + ATo
  else
    Result := Random(LTo - LFrom) + AFrom;
end;

function  RandomRange(const aMin, aMax: Integer): Integer;
begin
  Result := _RandomRange(aMin, aMax + 1);
end;

function  RandomRangef(const aMin, aMax: Single): Single;
var
  LNum: Single;
begin
  LNum := _RandomRange(0, MaxInt) / MaxInt;
  Result := aMin + (LNum * (aMax - aMin));
end;

function  RandomBool: Boolean;
begin
  Result := Boolean(_RandomRange(0, 2) = 1);
end;

function  GetRandomSeed: Integer;
begin
  Result := System.RandSeed;
end;

procedure SetRandomSeed(const aVaLue: Integer);
begin
  System.RandSeed := aVaLue;
end;

function  ClipVaLuef(var aVaLue: Single; const aMin, aMax: Single; const aWrap: Boolean): Single;
begin
  if aWrap then
    begin
      if (aVaLue > aMax) then
      begin
        aVaLue := aMin + Abs(aVaLue - aMax);
        if aVaLue > aMax then
          aVaLue := aMax;
      end
      else if (aVaLue < aMin) then
      begin
        aVaLue := aMax - Abs(aVaLue - aMin);
        if aVaLue < aMin then
          aVaLue := aMin;
      end
    end
  else
    begin
      if aVaLue < aMin then
        aVaLue := aMin
      else if aVaLue > aMax then
        aVaLue := aMax;
    end;

  Result := aVaLue;
end;

function  ClipVaLue(var aVaLue: Integer; const aMin, aMax: Integer; const aWrap: Boolean): Integer;
begin
  if aWrap then
    begin
      if (aVaLue > aMax) then
      begin
        aVaLue := aMin + Abs(aVaLue - aMax);
        if aVaLue > aMax then
          aVaLue := aMax;
      end
      else if (aVaLue < aMin) then
      begin
        aVaLue := aMax - Abs(aVaLue - aMin);
        if aVaLue < aMin then
          aVaLue := aMin;
      end
    end
  else
    begin
      if aVaLue < aMin then
        aVaLue := aMin
      else if aVaLue > aMax then
        aVaLue := aMax;
    end;

  Result := aVaLue;
end;

function  SameSign(const aVaLue1, aVaLue2: Integer): Boolean;
begin
  if Sign(aVaLue1) = Sign(aVaLue2) then
    Result := True
  else
    Result := False;
end;

function  SameSignf(const aVaLue1, aVaLue2: Single): Boolean;
begin
  if System.Math.Sign(aVaLue1) = System.Math.Sign(aVaLue2) then
    Result := True
  else
    Result := False;
end;

function  SameVaLue(const aA, aB: Double; const aEpsilon: Double = 0): Boolean;
begin
  Result := System.Math.SameVaLue(aA, aB, aEpsilon);
end;

function  SameVaLuef(const aA, aB: Single; const aEpsilon: Single = 0): Boolean;
begin
  Result := System.Math.SameVaLue(aA, aB, aEpsilon);
end;


function  AngleDiff(const aSrcAngle, aDestAngle: Single): Single;
var
  C: Single;
begin
  C := aDestAngle-aSrcAngle-(Floor((aDestAngle-aSrcAngle)/360.0)*360.0);

  if C >= (360.0 / 2) then
  begin
    C := C - 360.0;
  end;
  Result := C;
end;

procedure AngleRotatePos(const aAngle: Single; var aX: Single; var aY: Single);
var
  nx,ny: Single;
  ia: Integer;
  LAngle: Single;
begin
  LAngle := EnsureRange(aAngle, 0, 360);

  ia := Round(LAngle);

  nx := ax*uCosTable[ia] - ay*uSinTable[ia];
  ny := ay*uCosTable[ia] + ax*uSinTable[ia];

  ax := nx;
  ay := ny;
end;

procedure SmoothMove(var aVaLue: Single; const aAmount, aMax,
  aDrag: Single);
var
  LAmt: Single;
begin
  LAmt := aAmount;

  if LAmt > 0 then
  begin
    aVaLue := aVaLue + LAmt;
    if aVaLue > aMax then
      aVaLue := aMax;
  end else if LAmt < 0 then
  begin
    aVaLue := aVaLue + LAmt;
    if aVaLue < -aMax then
      aVaLue := -aMax;
  end else
  begin
    if aVaLue > 0 then
    begin
      aVaLue := aVaLue - aDrag;
      if aVaLue < 0 then
        aVaLue := 0;
    end else if aVaLue < 0 then
    begin
      aVaLue := aVaLue + aDrag;
      if aVaLue > 0 then
        aVaLue := 0;
    end;
  end;
end;

function  Lerp(const aFrom, aTo, aTime: Double): Double;
begin
  if aTime <= 0.5 then
    Result := aFrom + (aTo - aFrom) * aTime
  else
    Result := aTo - (aTo - aFrom) * (1.0 - aTime);
end;

function  PointInRectangle(aPoint: TVector; aRect: TRect): Boolean;
begin
  if ((aPoint.x >= aRect.x) and (aPoint.x <= (aRect.x + aRect.width)) and
    (aPoint.y >= aRect.y) and (aPoint.y <= (aRect.y + aRect.height))) then
    Result := True
  else
    Result := False;
end;

function  PointInCircle(aPoint, aCenter: TVector; aRadius: Single): Boolean;
begin
  Result := CirclesOverlap(aPoint, 0, aCenter, aRadius);
end;

function  PointInTriangle(aPoint, aP1, aP2, aP3: TVector): Boolean;
var
  LAlpha, LBeta, LGamma: Single;
begin
  LAlpha := ((aP2.y - aP3.y) * (aPoint.x - aP3.x) + (aP3.x - aP2.x) *
    (aPoint.y - aP3.y)) / ((aP2.y - aP3.y) * (aP1.x - aP3.x) + (aP3.x - aP2.x) *
    (aP1.y - aP3.y));

  LBeta := ((aP3.y - aP1.y) * (aPoint.x - aP3.x) + (aP1.x - aP3.x) *
    (aPoint.y - aP3.y)) / ((aP2.y - aP3.y) * (aP1.x - aP3.x) + (aP3.x - aP2.x) *
    (aP1.y - aP3.y));

  LGamma := 1.0 - LAlpha - LBeta;

  if ((LAlpha > 0) and (LBeta > 0) and (LGamma > 0)) then
    Result := True
  else
    Result := False;
end;

function  CirclesOverlap(aCenter1: TVector; aRadius1: Single; aCenter2: TVector; aRadius2: Single): Boolean;
var
  LDX, LDY, LDistance: Single;
begin
  LDX := aCenter2.x - aCenter1.x; // X distance between centers
  LDY := aCenter2.y - aCenter1.y; // Y distance between centers

  LDistance := sqrt(LDX * LDX + LDY * LDY); // Distance between centers

  if (LDistance <= (aRadius1 + aRadius2)) then
    Result := True
  else
    Result := False;
end;

function  CircleInRectangle(aCenter: TVector; aRadius: Single; aRect: TRect): Boolean;
var
  LDX, LDY: Single;
  LCornerDistanceSq: Single;
  LRecCenterX: Integer;
  LRecCenterY: Integer;
begin
  LRecCenterX := Round(aRect.x + aRect.width / 2);
  LRecCenterY := Round(aRect.y + aRect.height / 2);

  LDX := abs(aCenter.x - LRecCenterX);
  LDY := abs(aCenter.y - LRecCenterY);

  if (LDX > (aRect.width / 2.0 + aRadius)) then
  begin
    Result := False;
    Exit;
  end;

  if (LDY > (aRect.height / 2.0 + aRadius)) then
  begin
    Result := False;
    Exit;
  end;

  if (LDX <= (aRect.width / 2.0)) then
  begin
    Result := True;
    Exit;
  end;
  if (LDY <= (aRect.height / 2.0)) then
  begin
    Result := True;
    Exit;
  end;

  LCornerDistanceSq := (LDX - aRect.width / 2.0) * (LDX - aRect.width / 2.0) +
    (LDY - aRect.height / 2.0) * (LDY - aRect.height / 2.0);

  Result := Boolean(LCornerDistanceSq <= (aRadius * aRadius));
end;

function  RectanglesOverlap(aRect1: TRect; aRect2: TRect): Boolean;
var
  LDX, LDY: Single;
begin
  LDX := abs((aRect1.x + aRect1.width / 2) - (aRect2.x + aRect2.width / 2));
  LDY := abs((aRect1.y + aRect1.height / 2) - (aRect2.y + aRect2.height / 2));

  if ((LDX <= (aRect1.width / 2 + aRect2.width / 2)) and
    ((LDY <= (aRect1.height / 2 + aRect2.height / 2)))) then
    Result := True
  else
    Result := False;
end;

function  RectangleIntersection(aRect1, aRect2: TRect): TRect;
var
  LDXX, LDYY: Single;
begin
  Result.Assign(0, 0, 0, 0);

  if RectanglesOverlap(aRect1, aRect2) then
  begin
    LDXX := abs(aRect1.x - aRect2.x);
    LDYY := abs(aRect1.y - aRect2.y);

    if (aRect1.x <= aRect2.x) then
    begin
      if (aRect1.y <= aRect2.y) then
      begin
        Result.x := aRect2.x;
        Result.y := aRect2.y;
        Result.width := aRect1.width - LDXX;
        Result.height := aRect1.height - LDYY;
      end
      else
      begin
        Result.x := aRect2.x;
        Result.y := aRect1.y;
        Result.width := aRect1.width - LDXX;
        Result.height := aRect2.height - LDYY;
      end
    end
    else
    begin
      if (aRect1.y <= aRect2.y) then
      begin
        Result.x := aRect1.x;
        Result.y := aRect2.y;
        Result.width := aRect2.width - LDXX;
        Result.height := aRect1.height - LDYY;
      end
      else
      begin
        Result.x := aRect1.x;
        Result.y := aRect1.y;
        Result.width := aRect2.width - LDXX;
        Result.height := aRect2.height - LDYY;
      end
    end;

    if (aRect1.width > aRect2.width) then
    begin
      if (Result.width >= aRect2.width) then
        Result.width := aRect2.width;
    end
    else
    begin
      if (Result.width >= aRect1.width) then
        Result.width := aRect1.width;
    end;

    if (aRect1.height > aRect2.height) then
    begin
      if (Result.height >= aRect2.height) then
        Result.height := aRect2.height;
    end
    else
    begin
      if (Result.height >= aRect1.height) then
        Result.height := aRect1.height;
    end
  end;
end;

function  LineIntersection(aX1, aY1, aX2, aY2, aX3, aY3, aX4, aY4: Integer; var aX: Integer; var aY: Integer): TLineIntersection;
var
  LAX, LBX, LCX, LAY, LBY, LCY, LD, LE, LF, LNum: Integer;
  LOffset: Integer;
  LX1Lo, LX1Hi, LY1Lo, LY1Hi: Integer;
begin
  Result := liNone;

  LAX := aX2 - aX1;
  LBX := aX3 - aX4;

  if (LAX < 0) then // X bound box test
  begin
    LX1Lo := aX2;
    LX1Hi := aX1;
  end
  else
  begin
    LX1Hi := aX2;
    LX1Lo := aX1;
  end;

  if (LBX > 0) then
  begin
    if (LX1Hi < aX4) or (aX3 < LX1Lo) then
      Exit;
  end
  else
  begin
    if (LX1Hi < aX3) or (aX4 < LX1Lo) then
      Exit;
  end;

  LAY := aY2 - aY1;
  LBY := aY3 - aY4;

  if (LAY < 0) then // Y bound box test
  begin
    LY1Lo := aY2;
    LY1Hi := aY1;
  end
  else
  begin
    LY1Hi := aY2;
    LY1Lo := aY1;
  end;

  if (LBY > 0) then
  begin
    if (LY1Hi < aY4) or (aY3 < LY1Lo) then
      Exit;
  end
  else
  begin
    if (LY1Hi < aY3) or (aY4 < LY1Lo) then
      Exit;
  end;

  LCX := aX1 - aX3;
  LCY := aY1 - aY3;
  LD := LBY * LCX - LBX * LCY; // alpha numerator
  LF := LAY * LBX - LAX * LBY; // both denominator

  if (LF > 0) then // alpha tests
  begin
    if (LD < 0) or (LD > LF) then
      Exit;
  end
  else
  begin
    if (LD > 0) or (LD < LF) then
      Exit
  end;

  LE := LAX * LCY - LAY * LCX; // beta numerator
  if (LF > 0) then // beta tests
  begin
    if (LE < 0) or (LE > LF) then
      Exit;
  end
  else
  begin
    if (LE > 0) or (LE < LF) then
      Exit;
  end;


  if (LF = 0) then
  begin
    Result := liParallel;
    Exit;
  end;

  LNum := LD * LAX; // numerator
  if Sign(LNum) = Sign(LF) then

    LOffset := LF div 2
  else
    LOffset := -LF div 2;
  aX := aX1 + (LNum + LOffset) div LF; // intersection x

  LNum := LD * LAY;
  if Sign(LNum) = Sign(LF) then
    LOffset := LF div 2
  else
    LOffset := -LF div 2;

  aY := aY1 + (LNum + LOffset) div LF; // intersection y

  Result := liTrue;
end;

function  RadiusOverlap(aRadius1, aX1, aY1, aRadius2, aX2, aY2, aShrinkFactor: Single): Boolean;
var
  LDist: Single;
  LR1, LR2: Single;
  LV1, LV2: TVector;
begin
  LR1 := aRadius1 * aShrinkFactor;
  LR2 := aRadius2 * aShrinkFactor;

  LV1.x := aX1;
  LV1.y := aY1;
  LV2.x := aX2;
  LV2.y := aY2;

  LDist := LV1.distance(LV2);

  if (LDist < LR1) or (LDist < LR2) then
    Result := True
  else
    Result := False;
end;

function EaseValue(aCurrentTime: Double; aStartValue: Double; aChangeInValue: Double; aDuration: Double; aEaseType: TEaseType): Double;
begin
  Result := 0;
  case aEaseType of
    etLinearTween:
      begin
        Result := aChangeInValue * aCurrentTime / aDuration + aStartValue;
      end;

    etInQuad:
      begin
        aCurrentTime := aCurrentTime / aDuration;
        Result := aChangeInValue * aCurrentTime * aCurrentTime + aStartValue;
      end;

    etOutQuad:
      begin
        aCurrentTime := aCurrentTime / aDuration;
        Result := -aChangeInValue * aCurrentTime * (aCurrentTime-2) + aStartValue;
      end;

    etInOutQuad:
      begin
        aCurrentTime := aCurrentTime / (aDuration / 2);
        if aCurrentTime < 1 then
          Result := aChangeInValue / 2 * aCurrentTime * aCurrentTime + aStartValue
        else
        begin
          aCurrentTime := aCurrentTime - 1;
          Result := -aChangeInValue / 2 * (aCurrentTime * (aCurrentTime - 2) - 1) + aStartValue;
        end;
      end;

    etInCubic:
      begin
        aCurrentTime := aCurrentTime / aDuration;
        Result := aChangeInValue * aCurrentTime * aCurrentTime * aCurrentTime + aStartValue;
      end;

    etOutCubic:
      begin
        aCurrentTime := (aCurrentTime / aDuration) - 1;
        Result := aChangeInValue * ( aCurrentTime * aCurrentTime * aCurrentTime + 1) + aStartValue;
      end;

    etInOutCubic:
      begin
        aCurrentTime := aCurrentTime / (aDuration/2);
        if aCurrentTime < 1 then
          Result := aChangeInValue / 2 * aCurrentTime * aCurrentTime * aCurrentTime + aStartValue
        else
        begin
          aCurrentTime := aCurrentTime - 2;
          Result := aChangeInValue / 2 * (aCurrentTime * aCurrentTime * aCurrentTime + 2) + aStartValue;
        end;
      end;

    etInQuart:
      begin
        aCurrentTime := aCurrentTime / aDuration;
        Result := aChangeInValue * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime + aStartValue;
      end;

    etOutQuart:
      begin
        aCurrentTime := (aCurrentTime / aDuration) - 1;
        Result := -aChangeInValue * (aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime - 1) + aStartValue;
      end;

    etInOutQuart:
      begin
        aCurrentTime := aCurrentTime / (aDuration / 2);
        if aCurrentTime < 1 then
          Result := aChangeInValue / 2 * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime + aStartValue
        else
        begin
          aCurrentTime := aCurrentTime - 2;
          Result := -aChangeInValue / 2 * (aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime - 2) + aStartValue;
        end;
      end;

    etInQuint:
      begin
        aCurrentTime := aCurrentTime / aDuration;
        Result := aChangeInValue * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime + aStartValue;
      end;

    etOutQuint:
      begin
        aCurrentTime := (aCurrentTime / aDuration) - 1;
        Result := aChangeInValue * (aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime + 1) + aStartValue;
      end;

    etInOutQuint:
      begin
        aCurrentTime := aCurrentTime / (aDuration / 2);
        if aCurrentTime < 1 then
          Result := aChangeInValue / 2 * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime + aStartValue
        else
        begin
          aCurrentTime := aCurrentTime - 2;
          Result := aChangeInValue / 2 * (aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime * aCurrentTime + 2) + aStartValue;
        end;
      end;

    etInSine:
      begin
        Result := -aChangeInValue * Cos(aCurrentTime / aDuration * (PI / 2)) + aChangeInValue + aStartValue;
      end;

    etOutSine:
      begin
        Result := aChangeInValue * Sin(aCurrentTime / aDuration * (PI / 2)) + aStartValue;
      end;

    etInOutSine:
      begin
        Result := -aChangeInValue / 2 * (Cos(PI * aCurrentTime / aDuration) - 1) + aStartValue;
      end;

    etInExpo:
      begin
        Result := aChangeInValue * Power(2, 10 * (aCurrentTime/aDuration - 1) ) + aStartValue;
      end;

    etOutExpo:
      begin
        Result := aChangeInValue * (-Power(2, -10 * aCurrentTime / aDuration ) + 1 ) + aStartValue;
      end;

    etInOutExpo:
      begin
        aCurrentTime := aCurrentTime / (aDuration/2);
        if aCurrentTime < 1 then
          Result := aChangeInValue / 2 * Power(2, 10 * (aCurrentTime - 1) ) + aStartValue
        else
         begin
           aCurrentTime := aCurrentTime - 1;
           Result := aChangeInValue / 2 * (-Power(2, -10 * aCurrentTime) + 2 ) + aStartValue;
         end;
      end;

    etInCircle:
      begin
        aCurrentTime := aCurrentTime / aDuration;
        Result := -aChangeInValue * (Sqrt(1 - aCurrentTime * aCurrentTime) - 1) + aStartValue;
      end;

    etOutCircle:
      begin
        aCurrentTime := (aCurrentTime / aDuration) - 1;
        Result := aChangeInValue * Sqrt(1 - aCurrentTime * aCurrentTime) + aStartValue;
      end;

    etInOutCircle:
      begin
        aCurrentTime := aCurrentTime / (aDuration / 2);
        if aCurrentTime < 1 then
          Result := -aChangeInValue / 2 * (Sqrt(1 - aCurrentTime * aCurrentTime) - 1) + aStartValue
        else
        begin
          aCurrentTime := aCurrentTime - 2;
          Result := aChangeInValue / 2 * (Sqrt(1 - aCurrentTime * aCurrentTime) + 1) + aStartValue;
        end;
      end;
  end;
end;

function EasePosition(aStartPos: Double; aEndPos: Double; aCurrentPos: Double; aEaseType: TEaseType): Double;
var
  LT, LB, LC, LD: Double;
begin
  LC := aEndPos - aStartPos;
  LD := 100;
  LT := aCurrentPos;
  LB := aStartPos;
  Result := EaseValue(LT, LB, LC, LD, aEaseType);
  if Result > 100 then
    Result := 100;
end;

class operator TPrefs.Initialize (out aDest: TPrefs);
begin
  aDest.FOrgName := 'tinyBigGAMES';
  aDest.FAppName := 'DelphiGamekit';
end;

class operator TPrefs.Finalize (var aDest: TPrefs);
begin
end;

class function  TPrefs.GetOrgName: string;
begin
  Result := FOrgName;
end;

class procedure TPrefs.SetOrgName(const aOrgName: string);
var
  LNew: Boolean;
begin
  if aOrgName.IsEmpty then Exit;
  if not SameText(FOrgName, aOrgName) then
    LNew := True
  else
    LNew := False;
  FOrgName := aOrgName;
  if LNew then
    TLog.Reset;
end;

class function  TPrefs.GetAppName: string;
begin
  Result := FAppName;
end;

class procedure TPrefs.SetAppName(const aAppName: string);
var
  LNew: Boolean;
begin
  if aAppName.IsEmpty then Exit;
  if not SameText(FAppName, aAppName) then
    LNew := True
  else
    LNew := False;
  FAppName := aAppName;
  if LNew then
    TLog.Reset;
end;

class function  TPrefs.GetPath: string;
begin
  Result := string(SDL_GetPrefPath(Marshaller.AsUtf8(FOrgName).ToPointer,
    Marshaller.AsUtf8(FAppName).ToPointer));
end;

class procedure TPrefs.GotoPath;
begin
  ShellOpen(GetPath);
end;

class operator TLog.Initialize (out aDest: TLog);
begin
  FFilename := '';
  FillChar(FBuffer, SizeOf(FBuffer), 0);
  FOpen := False;
end;

class operator TLog.Finalize (var aDest: TLog);
begin
  Close;
end;

class function  TLog.Open: Boolean;
begin
  Close;

  FFormatSettings.DateSeparator := '/';
  FFormatSettings.TimeSeparator := ':';
  FFormatSettings.ShortDateFormat := 'DD-MM-YYY HH:NN:SS';
  FFormatSettings.ShortTimeFormat := 'HH:NN:SS';

  FFilename := TPath.GetFileName(ParamStr(0));
  FFilename := TPath.ChangeExtension(FFilename, LOGEXT);
  FFilename := TPath.Combine(TPrefs.GetPath, FFilename);

  AssignFile(FText, FFilename);
  ReWrite(FText);
  SetTextBuf(FText, FBuffer);
  FOpen := True;
  FFilename := FFilename;

  Result := True;
end;

class procedure TLog.Close;
begin
  if not FOpen then Exit;
  CloseFile(FText);
  FOpen := False;
end;

class function  TLog.Opened: Boolean;
begin
  Result := FOpen;
end;

class procedure TLog.Reset;
begin
  Close;
  Open;
end;

class function  TLog.GetFilename: string;
begin
  Result := FFilename;
end;

class function TLog.Add(const aMsg: string;
  const aArgs: array of const): string;
var
  LLine: string;
begin
  if not FOpen then Exit;

  LLine := Format(aMsg, aArgs);
  LLine := Format('%s %s', [DateTimeToStr(Now, FFormatSettings), LLine]);

  {$I-}
  Writeln(FText, LLine);
  Flush(FText);
  {$I+}

  if FConsoleOutput then
    PrintLn(LLine);

  Result := LLine;
end;

class procedure TLog.Fatal(const aMsg: string; const aArgs: array of const);
begin
  Add(aMsg, aArgs);
  ShellOpen(FFilename);
end;

class procedure TLog.SetConsoleOutput(const aConsoleOutput: Boolean);
begin
  FConsoleOutput := aConsoleOutput;
end;

class function  TLog.GetConsoleOutput: Boolean;
begin
  Result := FConsoleOutput;
end;

class procedure TLog.View;
begin
  if not TFile.Exists(FFilename) then Exit;
  ShellOpen(FFilename);
end;

class procedure TCmdLine.Build;
var
  I: Integer;
begin
  FParamStr := nil;
  FParamStr := FCmdline.Split([' '],'"', '"', TStringSplitOptions.ExcludeEmpty);

  for I := Low(FParamStr) to High(FParamStr) do
  begin
    FParamStr[I] := FParamStr[I].DeQuotedString;
    FParamStr[I] := FParamStr[I].DeQuotedString('"');
    FParamStr[I] := FParamStr[I].DeQuotedString('`');
  end;

  FParamStr[0] := ParamStr(0);
end;


class operator TCmdLine.Initialize (out aDest: TCmdLine);
begin
  Reset;
end;

class operator TCmdLine.Finalize (var aDest: TCmdLine);
begin
end;

class procedure TCmdLine.Reset;
begin
  FCmdLine := CmdLine;
  Build;
end;

class procedure TCmdLine.Clear;
begin
  FCmdLine := ParamStr(0);
  Build;
end;

class procedure TCmdLine.AddParam(const aParam: string);
begin
  FCmdLine := FCmdLine + ' ' + aParam;
  Build;
end;

class procedure TCmdLine.AddParams(const aParams: array of string);
var
  LParam: string;
begin
  for LParam in aParams do
  begin
    AddParam(LParam);
  end;
end;

class function TCmdLine.Str: string;
begin
  Result := FCmdLine;
end;

class function TCmdLine.Count: Integer;
begin
  Result := Length(FParamStr)-1;
end;

class function TCmdLine.Count(const aName: string): Integer;
var
  LIndex: Integer;
begin
  Result := 0;
  LIndex := ParamIndex(aName);
  if LIndex = -1 then Exit;
  Result := Count - LIndex;
end;

class function TCmdLine.Param(const aIndex: Integer): string;
begin
  Result := '';
  if (aIndex < 0) or (aIndex > Count-1) then Exit;
  Result := FParamStr[aIndex];
end;

class function TCmdLine.Param(const aName: string; const aIndex: Integer): string;
var
  LIndex: Integer;
begin
  Result := '';
  LIndex := ParamIndex(aName);
  if LIndex = -1 then Exit;
  Inc(LIndex, aIndex);
  if not InRange(LIndex, Low(FParamStr), High(FParamStr)) then Exit;
  Result := FParamStr[LIndex];
end;

class function TCmdLine.ParamIndex(const aName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low(FParamStr) to High(FParamStr) do
  begin
    if SameText(FParamStr[I], aName) then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

class function TCmdLine.ParamExist(const aName: string): Boolean;
var
  LParam: string;
begin
  Result := False;

  for LParam in FParamStr do
  begin
    if SameText(LParam, aName) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

class function TCmdLine.ParamValue(const aName: string; var aValue: string): Boolean;
var
  LParam: string;
begin
  Result := False;
  aValue := '';

  for LParam in FParamStr do
  begin

    if SameText(LParam, aName) then
    begin
      Result := True;
      Exit;
    end;

    if LParam.StartsWith('/' + aName, True) or
       LParam.StartsWith('-' + aName, True) then
    begin

      if LParam.Contains(':') then
      begin
        aValue := LParam.Substring(LParam.IndexOf(':') + 1);
      end;

      Result := True;
      Exit;
    end;
  end;
end;

procedure TBuffer.Clear;
begin
  if (Memory <> nil) then
  begin
    if not UnmapViewOfFile(Memory) then
      raise EBufferException.Create('Error deallocating mapped memory');
  end;

  if (FHandle <> 0) then
  begin
    if not CloseHandle(FHandle) then
      raise EBufferException.Create('Error freeing memory mapping handle');
  end;
end;

constructor TBuffer.Create(aSize: Cardinal);
var
  P: Pointer;
begin
  inherited Create;
  FName := TPath.GetGUIDFileName;
  FHandle := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, aSize, PChar(FName));
  if FHandle = 0 then
    begin
      Clear;
      raise EBufferException.Create('Error creating memory mapping');
      FHandle := 0;
    end
  else
    begin
      P := MapViewOfFile(FHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      if P = nil then
        begin
          Clear;
          raise EBufferException.Create('Error creating memory mapping');
        end
      else
        begin
          Self.SetPointer(P, aSize);
          Position := 0;
        end;
    end;
end;

destructor TBuffer.Destroy;
begin
  Clear;
  inherited;
end;

function TBuffer.Write(const aBuffer; aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer, (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

function TBuffer.Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer[aOffset], (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

procedure TBuffer.SaveToFile(aFilename: string);
var
  LStream: TFileStream;
begin
  LStream := TFile.Create(aFilename);
  try
    LStream.Write(Memory^, Size);
  finally
    LStream.Free;
  end;
end;

class function TBuffer.LoadFromFile(const aFilename: string): TBuffer;
var
  LStream: TStream;
  LBuffer: TBuffer;
begin
  Result := nil;
  if aFilename.IsEmpty then Exit;
  if not TFile.Exists(aFilename) then Exit;
  LStream := TFile.OpenRead(aFilename);
  try
    LBuffer := TBuffer.Create(LStream.Size);
    if LBuffer <> nil then
    begin
      LBuffer.CopyFrom(LStream);
    end;
  finally
    FreeAndNil(LStream);
  end;
  Result := LBuffer;
end;

constructor TConfigFile.Create;
begin
  inherited;

  FHandle := nil;
  FSection := TStringList.Create;
end;

destructor TConfigFile.Destroy;
begin
  Close;
  FreeAndNil(FSection);

  inherited;
end;

function  TConfigFile.Open(const aFilename: string=''): Boolean;
var
  LFilename: string;
begin
  Close;
  LFilename := aFilename;
  if LFilename.IsEmpty then LFilename := TPath.ChangeExtension(ParamStr(0), INIEXT);
  FHandle := TIniFile.Create(LFilename);
  Result := Boolean(FHandle <> nil);
  FFilename := LFilename;
end;

procedure TConfigFile.Close;
begin
  if not Opened then Exit;
  FHandle.UpdateFile;
  FreeAndNil(FHandle);
end;

function  TConfigFile.Opened: Boolean;
begin
  Result := Boolean(FHandle <> nil);
end;

procedure TConfigFile.Update;
begin
  if not Opened then Exit;
  FHandle.UpdateFile;
end;

function  TConfigFile.RemoveSection(const aName: string): Boolean;
var
  LName: string;
begin
  Result := False;
  if not Opened then Exit;
  LName := aName;
  if LName.IsEmpty then Exit;
  FHandle.EraseSection(LName);
  Result := True;
end;

procedure TConfigFile.SetValue(const aSection, aKey, aValue: string);
begin
  if not Opened then Exit;
  FHandle.WriteString(aSection, aKey, aValue);
end;

procedure TConfigFile.SetValue(const aSection, aKey: string; aValue: Integer);
begin
  if not Opened then Exit;
  SetValue(aSection, aKey, aValue.ToString);
end;

procedure TConfigFile.SetValue(const aSection, aKey: string; aValue: Boolean);
begin
  if not Opened then Exit;
  SetValue(aSection, aKey, aValue.ToInteger);
end;

procedure TConfigFile.SetValue(const aSection, aKey: string; aValue: Pointer; aValueSize: Cardinal);
var
  LValue: TMemoryStream;
begin
  if not Opened then Exit;
  if aValue = nil then Exit;
  LValue := TMemoryStream.Create;
  try
    LValue.Position := 0;
    LValue.Write(aValue^, aValueSize);
    LValue.Position := 0;
    FHandle.WriteBinaryStream(aSection, aKey, LValue);
  finally
    FreeAndNil(LValue);
  end;
end;

function  TConfigFile.GetValue(const aSection, aKey, aDefaultValue: string): string;
begin
  Result := '';
  if not Opened then Exit;
  Result := FHandle.ReadString(aSection, aKey, aDefaultValue);
end;

function  TConfigFile.GetValue(const aSection, aKey: string; aDefaultValue: Integer): Integer;
var
  LResult: string;
begin
  Result := aDefaultValue;
  if not Opened then Exit;
  LResult := GetValue(aSection, aKey, aDefaultValue.ToString);
  Integer.TryParse(LResult, Result);
end;

function  TConfigFile.GetValue(const aSection, aKey: string; aDefaultValue: Boolean): Boolean;
begin
  Result := aDefaultValue;
  if not Opened then Exit;
  Result := GetValue(aSection, aKey, aDefaultValue.ToInteger).ToBoolean;
end;

procedure TConfigFile.GetValue(const aSection, aKey: string; aValue: Pointer; aValueSize: Cardinal);
var
  LValue: TMemoryStream;
  LSize: Cardinal;
begin
  if not Opened then Exit;
  if not Assigned(aValue) then Exit;
  if aValueSize = 0 then Exit;
  LValue := TMemoryStream.Create;
  try
    LValue.Position := 0;
    FHandle.ReadBinaryStream(aSection, aKey, LValue);
    LSize := aValueSize;
    if aValueSize > LValue.Size then
      LSize := LValue.Size;
    LValue.Position := 0;
    LValue.Write(aValue^, LSize);
  finally
    FreeAndNil(LValue);
  end;
end;

function  TConfigFile.RemoveKey(const aSection, aKey: string): Boolean;
var
  LSection: string;
  LKey: string;
begin
  Result := False;
  if not Opened then Exit;
  LSection := aSection;
  LKey := aKey;
  if LSection.IsEmpty then Exit;
  if LKey.IsEmpty then Exit;
  FHandle.DeleteKey(LSection, LKey);
  Result := True;
end;

function  TConfigFile.GetSectionValues(const aSection: string): Integer;
var
  LSection: string;
begin
  Result := 0;
  if not Opened then Exit;
  LSection := aSection;
  if LSection.IsEmpty then Exit;
  FSection.Clear;
  FHandle.ReadSectionValues(LSection, FSection);
  Result := FSection.Count;
end;

function  TConfigFile.GetSectionValue(const aIndex: Integer; const aDefaultValue: string): string;
begin
  Result := '';
  if not Opened then Exit;
  if (aIndex < 0) or (aIndex > FSection.Count - 1) then Exit;
  Result := FSection.ValueFromIndex[aIndex];
  if Result = '' then Result := aDefaultValue;
end;

function  TConfigFile.GetSectionValue(const aIndex, aDefaultValue: Integer): Integer;
begin
  Result := aDefaultValue;
  if not Opened then Exit;
  Result := string(GetSectionValue(aIndex, aDefaultValue.ToString)).ToInteger;
end;

function  TConfigFile.GetSectionValue(const aIndex: Integer; const aDefaultValue: Boolean): Boolean;
begin
  Result := aDefaultValue;
  if not Opened then Exit;
  Result := string(GetSectionValue(aIndex, aDefaultValue.ToString)).ToBoolean
end;

constructor TArchiveFile.Create;
begin
  inherited;
end;

destructor TArchiveFile.Destroy;
begin
  Close;
  inherited;
end;

function TArchiveFile.Open(const aPassword, aArchive, aFilename: string): Boolean;
begin
  Result := False;
  if IsOpen then Exit;

  if not TFile.Exists(aArchive) then Exit;
  if not TZipFile.IsValid(aArchive) then Exit;

  FZipFile := TEncryptedZipFile.Create(aPassword);

  FZipFile.Open(aArchive, zmRead);
  if FZipFile.IndexOf(aFilename) = -1 then
  begin
    Close;
    Exit;
  end;

  FZipFile.Read(aFilename, FZipStream, FZipHeader);
  if not Assigned(FZipStream) then
  begin
    Close;
    Exit;
  end;

  FZipStream.Position := 0;

  Result := True;
end;

function  TArchiveFile.OpenRes(const aPassword, aResName, aFilename: string): Boolean;
begin
  Result := False;
  if IsOpen then Exit;

  if not ResourceExists(HInstance, aResName) then Exit;

  FResStream := TResourceStream.Create(HInstance, aResName, RT_RCDATA);
  FResStream.Position := 0;

  if not TZipFile.IsValid(FREsStream) then Exit;

  FZipFile := TEncryptedZipFile.Create(aPassword);
  FResStream.Position := 0;
  FZipFile.Open(FResStream, zmRead);

  if FZipFile.IndexOf(aFilename) = -1 then
  begin
    Close;
    Exit;
  end;

  FZipFile.Read(aFilename, FZipStream, FZipHeader);
  if not Assigned(FZipStream) then
  begin
    Close;
    Exit;
  end;

  FZipStream.Position := 0;

  Result := True;
end;

function TArchiveFile.IsOpen: Boolean;
begin
  Result := False;
  if not Assigned(FZipFile) then Exit;
  Result := Boolean(FZipFile.Mode <> zmClosed);
end;

procedure TArchiveFile.Close;
begin
  if Assigned(FZipStream) then
    FreeAndNil(FZipStream);

  if Assigned(FZipFile) then
  begin
    if FZipFile.Mode <> zmClosed then
      FZipFile.Close;
    FreeAndNil(FZipFile);
  end;

  FreeNilObject(FResStream);
end;

function TArchiveFile.Size: Int64;
begin
  Result := 0;
  if not Assigned(FZipStream) then Exit;
  Result := FZipStream.Size;
end;

function TArchiveFile.GetPos: Int64;
begin
  Result := 0;
  if not Assigned(FZipStream) then Exit;
  Result := FZipStream.Position;
end;

function TArchiveFile.SetPos(aPos: Int64): Int64;
begin
  Result := 0;
  if not Assigned(FZipStream) then Exit;
  FZipStream.Position := aPos;
  Result := FZipStream.Position;
end;

function TArchiveFile.ReadData(aBuffer: Pointer; aCount: NativeInt): NativeInt;
begin
  Result := 0;
  if not Assigned(FZipStream) then Exit;
  Result := FZipStream.ReadData(aBuffer, aCount);
end;

function TArchiveFile.SaveToFile(const aFilename: string): Boolean;
begin
  Result := False;
  if not IsOpen then Exit;
  with TFile.Create(aFilename) do
  begin
    CopyFrom(FZipStream);
    Free;
    Result := TFile.Exists(aFilename);
  end;
end;

function  TArchiveFile.SaveToBuffer: TBuffer;
var
  LBuffer: TBuffer;
begin
  Result := nil;
  if not IsOpen then Exit;
  LBuffer := TBuffer.Create(Size);
  LBuffer.CopyFrom(FZipStream);
  LBuffer.Position := 0;
  Result := LBuffer;
end;

function rwops_size(context: PSDL_RWops): Sint64; cdecl;
var
  LArchiveFile: TArchiveFile;
begin
  LArchiveFile := TArchiveFile(context.hidden.unknown.data1);
  Result := LArchiveFile.Size;
end;

function rwops_seek(context: PSDL_RWops; offset: Sint64; whence: Integer): Sint64; cdecl;
var
  LArchiveFile: TArchiveFile;
begin
  Result := 0;

  LArchiveFile := TArchiveFile(context.hidden.unknown.data1);

  case whence of
    RW_SEEK_SET:
    begin
      LArchiveFile.SetPos(offset);
      Result := LArchiveFile.GetPos;
    end;

    RW_SEEK_CUR:
    begin
      LArchiveFile.SetPos(LArchiveFile.GetPos + offset);
      Result := LArchiveFile.GetPos;
    end;

    RW_SEEK_END:
    begin
      LArchiveFile.SetPos(LArchiveFile.Size + offset);
      Result := LArchiveFile.GetPos;
    end;
  end;

end;

function rwops_read(context: PSDL_RWops; ptr: Pointer; size: NativeUInt; maxnum: NativeUInt): NativeUInt; cdecl;
var
  LArchiveFile: TArchiveFile;
  LReadLen: UInt64;
  LRc: SInt64;
begin
  LArchiveFile := TArchiveFile(context.hidden.unknown.data1);
  LReadLen := maxnum * size;
  LRc := LArchiveFile.ReadData(ptr, LReadLen);
  Result := Round(LRc / size);
end;

function rwops_close(context: PSDL_RWops): Integer; cdecl;
var
  LArchiveFile: TArchiveFile;
begin
  LArchiveFile := TArchiveFile(context.hidden.unknown.data1);
  FreeNilObject(LArchiveFile);
  SDL_FreeRW(context);
  Result := 0;
end;

class function TArchiveFile.GetRWops(const aPassword, aArchive, aFilename: string): PSDL_RWops;
var
  LRWops: PSDL_RWops;
  LArchiveFile: TArchiveFile;
begin
  Result := nil;

  LRWops := SDL_AllocRW;
  if not Assigned(LRWops) then Exit;

  LArchiveFile := TArchiveFile.Create;
  if not Assigned(LArchiveFile) then Exit;

  if not LArchiveFile.Open(aPassword, aArchive, aFilename) then
  begin
    SDL_FreeRW(LRWops);
    LArchiveFile.Free;
    Exit;
  end;

  LRWops.size  := rwops_size;
  LRWops.seek  := rwops_seek;
  LRWops.read  := rwops_read;
  LRWops.write := nil;
  LRWops.close := rwops_close;
  LRWops.hidden.unknown.data1 := LArchiveFile;

  Result := LRWops;

end;

class function TArchiveFile.GetRWopsRes(const aPassword, aResName, aFilename: string): PSDL_RWops;
var
  LRWops: PSDL_RWops;
  LArchiveFile: TArchiveFile;
begin
  Result := nil;

  LRWops := SDL_AllocRW;
  if not Assigned(LRWops) then Exit;

  LArchiveFile := TArchiveFile.Create;
  if not Assigned(LArchiveFile) then Exit;

  if not LArchiveFile.OpenRes(aPassword, aResName, aFilename) then
  begin
    SDL_FreeRW(LRWops);
    LArchiveFile.Free;
    Exit;
  end;

  LRWops.size  := rwops_size;
  LRWops.seek  := rwops_seek;
  LRWops.read  := rwops_read;
  LRWops.write := nil;
  LRWops.close := rwops_close;
  LRWops.hidden.unknown.data1 := LArchiveFile;

  Result := LRWops;

end;

procedure TArchive.OnZipProgress(Sender: TObject; FileName: string; Header: TZipHeader; Position: Int64);
var
  LProgress: Single;
begin
  if FNewFile then
  begin
    PrintLn;
    FNewFile := False;
  end;
  LProgress := 100.0 * (FNewFileSize / Position);
  Game.OnBuildArchiveProgress(Filename, Round(LProgress), FNewFile);
end;

function TArchive.Build(const aPassword, aArchive, aFolder: string): Boolean;
var
  LFileList: TStringDynArray;
  LText: string;
  LFile: string;
  LZipFile: TEncryptedZipFile;
begin
  Result := False;

  if not TDirectory.Exists(aFolder) then Exit;

  LFileList := TDirectory.GetFiles(aFolder, '*', TSearchOption.soAllDirectories);

  LZipFile := TEncryptedZipFile.Create(aPassword);
  LZipFile.OnProgress := OnZipProgress;
  LZipFile.Open(aArchive, zmWrite);

  for LText in LFileList do
  begin
    LFile := LText.Replace('\', '/');
    FNewFile := True;
    FNewFileSize := TFile.GetSize(LText);
    LZipFile.Add(LFile, LFile);
  end;

  LZipFile.Close;
  FreeAndNil(LZipFile);

  Result := TFile.Exists(aArchive);
end;

constructor TArchive.Create;
begin
  inherited;
end;

destructor TArchive.Destroy;
begin
  Close;
  inherited;
end;

function TArchive.Open(const aPassword, aArchive: string): Boolean;
begin
  Result := False;
  if IsOpen then Exit;

  if not TFile.Exists(aArchive) then Exit;
  if not TZipFile.IsValid(aArchive) then Exit;

  FZipFile := TEncryptedZipFile.Create(aPassword);
  FZipFile.Open(aArchive, zmRead);

  Result := IsOpen;

  if Result then
  begin
    FPassword := aPassword;
    FArchive := aArchive;
    FResStream := nil;
    FResName := '';
  end;
end;

function TArchive.OpenRes(const aPassword, aResName: string): Boolean;
var
  LResStream: TResourceStream;
begin
  Result := False;
  if IsOpen then Exit;

  if not ResourceExists(HInstance, aResName) then Exit;
  LResStream := TResourceStream.Create(HInstance, aResName, RT_RCDATA);
  LResStream.Position := 0;

  if not TZipFile.IsValid(LResStream) then Exit;

  FZipFile := TEncryptedZipFile.Create(aPassword);
  LResStream.Position := 0;
  FZipFile.Open(LResStream, zmRead);

  Result := IsOpen;

  if Result then
  begin
    FPassword := aPassword;
    FArchive := '';
    FResStream := LResStream;
    FResName := aResName;
  end;
end;


function TArchive.IsOpen: Boolean;
begin
  Result := False;
  if not Assigned(FZipFile) then Exit;
  Result := Boolean(FZipFile.Mode <> zmClosed);
end;

procedure TArchive.Close;
begin
  if not Assigned(FZipFile) then Exit;
  if IsOpen then FZipFile.Close;
  FreeNilObject(FZipFile);
  FreeNilObject(FResStream);
  FPassword := '';
  FArchive := '';
end;

function TArchive.FileExist(const aFilename: string): Boolean;
begin
  Result := False;
  if not IsOpen then Exit;
  Result := Boolean(FZipFile.IndexOf(aFilename) <> -1);
end;

function TArchive.OpenFile(const aFilename: string): TArchiveFile;
var
  LOk: Boolean;
begin
  Result := nil;
  if not IsOpen then Exit;
  Result := TArchiveFile.Create;
  if not Assigned(Result) then Exit;

  if FArchive.IsEmpty then
    LOk := Result.OpenRes(FPassword, FResName, aFilename)
  else
    LOk := Result.Open(FPassword, FArchive, aFilename);
  if not LOk then
  begin
    FreeNilObject(Result);
  end;
end;

function TArchive.OpenFileRWops(const aFilename: string): PSDL_RWops;
begin
  Result := nil;
  if not IsOpen then Exit;
  if FArchive.IsEmpty then
    Result := TArchiveFile.GetRWopsRes(FPassword, FResName, aFilename)
  else
    Result := TArchiveFile.GetRWops(FPassword, FArchive, aFilename);
end;

function TArchive.OpenFileBuffer(const aFilename: string): TBuffer;
var
  LArchiveFile: TArchiveFile;
begin
  Result := nil;
  LArchiveFile := OpenFile(aFilename);
  if not Assigned(LArchiveFile) then Exit;
  Result := LArchiveFile.SaveToBuffer;
  FreeNilObject(LArchiveFile);
end;

procedure FreeNilObject(const [ref] aObject: TObject);
var
  LObject: TObject;
begin
  if not Assigned(aObject) then Exit;
  LObject := aObject;
  TObject(Pointer(@aObject)^) := nil;
  LObject.Free;
end;

procedure ShellOpen(const aFilename: string);
begin
  if aFilename.IsEmpty then Exit;
  ShellExecute(0, 'OPEN', PChar(aFilename), '', '', SW_SHOWNORMAL);
end;

function  GetVersionInfo(const aInstance: THandle; const aIdent: string): string;
type
  TLang = packed record
    Lng, Page: WORD;
  end;
  TLangs = array [0 .. 10000] of TLang;
  PLangs = ^TLangs;
var
  BLngs: PLangs;
  BLngsCnt: Cardinal;
  BLangId: String;
  RM: TMemoryStream;
  RS: TResourceStream;
  BP: PChar;
  BL: Cardinal;
  BId: String;

begin
  Result := '';

  RM := TMemoryStream.Create;
  try
    RS := TResourceStream.CreateFromID(aInstance, 1, RT_VERSION);
    try
      RM.CopyFrom(RS, RS.Size);
    finally
      FreeNilObject(RS);
    end;

    if not VerQueryValue(RM.Memory, '\\VarFileInfo\\Translation',
      Pointer(BLngs), BL) then Exit;
    BLngsCnt := BL div sizeof(TLang);
    if BLngsCnt <= 0 then Exit;

    with BLngs[0] do BLangId := IntToHex(Lng, 4) + IntToHex(Page, 4);

    BId := '\\StringFileInfo\\' + BLangId + '\\' + aIdent;
    if not VerQueryValue(RM.Memory, PChar(BId), Pointer(BP), BL) then exit;

    Result := BP;
  finally
    FreeNilObject(RM);
  end;
end;

function  GetVersionInfo(const aFilename: string; const aIdent: string): string;
begin
  Result := GetVersionInfo(GetModuleHandle(PChar(aFilename)), aIdent);
end;

function  GetSemVerStr(const aInstance: THandle): string;
begin
  Result := GetVersionInfo(HInstance, 'FileVersion');
  Result := Result.Remove(Result.LastIndexOf('.'));
  if Result.EndsWith('0') then
    Result := Result.Remove(Result.LastIndexOf('.'));
end;

function  UnitToScalarValue(const aValue, aMaxValue: Double): Double;
var
  LGain: Double;
  LFactor: Double;
  LVolume: Double;
begin
  LGain := (EnsureRange(aValue, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGain * 0.05);
  LVolume := EnsureRange(aMaxValue * LFactor, 0, aMaxValue);
  Result := LVolume;
end;

function  GetFileRWops(const aFilename: string): PSDL_RWops;
begin
  Result := SDL_RWFromFile(PAnsiChar(AnsiString(aFilename)), 'rb');
end;

function  GetMemRWops(const aMem: Pointer; const aSize: Integer): PSDL_RWops;
begin
  Result := SDL_RWFromConstMem(aMem, aSize);
end;

function  ResourceExists(aInstance: THandle; const aResName: string): Boolean;
begin
  Result := Boolean((FindResource(aInstance, PChar(aResName), RT_RCDATA) <> 0));
end;

function  IsSingleInstance(aMutexName: string;aKeepMutex: Boolean=True): Boolean;
const
  MUTEX_GLOBAL = 'Global\';
var
  LMutexHandel : THandle;
  LSecurityDesc: TSecurityDescriptor;
  LSecurityAttr: TSecurityAttributes;
  LErrCode : integer;
begin
  InitializeSecurityDescriptor(@LSecurityDesc, SECURITY_DESCRIPTOR_REVISION);
  SetSecurityDescriptorDacl(@LSecurityDesc, True, nil, False);
  LSecurityAttr.nLength:=SizeOf(LSecurityAttr);
  LSecurityAttr.lpSecurityDescriptor := @LSecurityDesc;
  LSecurityAttr.bInheritHandle:=False;

  LMutexHandel := CreateMutex(@LSecurityAttr, True, PChar(MUTEX_GLOBAL + aMutexName));
  LErrCode := GetLastError;
  if (LErrCode = ERROR_ALREADY_EXISTS) then
  begin
    Result := false;
    CloseHandle(LMutexHandel);
  end
  else
  begin
    Result := true;

    if not aKeepMutex then CloseHandle(LMutexHandel);
  end;
end;

function GetExePath: string;
begin
  Result := TPath.GetDirectoryName(ParamStr(0));
end;

function  GetExeBasePath(const aFilename: string): string;
begin
  Result := TPath.Combine(GetExePath, TPath.GetFileName(aFilename));
end;

function  HasConsoleOutput: Boolean;
var
  LStdout: THandle;
begin
  Result := False;
  LStdout := GetStdHandle(STD_OUTPUT_HANDLE);
  if LStdout = Invalid_Handle_Value then Exit;
  Result := Boolean(LStdout <> 0);
end;

procedure WaitForAnyKey;
var
  LInputRec: TInputRecord;
  LNumRead: Cardinal;
  LOldMode: DWORD;
  LStdIn: THandle;
begin
  LStdIn := GetStdHandle(STD_INPUT_HANDLE);
  GetConsoleMode(LStdIn, LOldMode);
  SetConsoleMode(LStdIn, 0);
  repeat
    ReadConsoleInput(LStdIn, LInputRec, 1, LNumRead);
  until (LInputRec.EventType and KEY_EVENT <> 0) and
    LInputRec.Event.KeyEvent.bKeyDown;
  SetConsoleMode(LStdIn, LOldMode);
end;

function WasRunFromConsole() : Boolean;
var
  SI: TStartupInfo;
begin
  SI.cb := SizeOf(TStartupInfo);
  GetStartupInfo(SI);
  Result := ((SI.dwFlags and STARTF_USESHOWWINDOW) = 0);
end;

procedure Pause(const aMsg: string);
begin

  if HasConsoleOutput and (not WasRunFromConsole) then
  begin
    WriteLn;
    if aMsg.IsEmpty then
      Write('Press any key to continue... ')
    else
      Write(aMsg);
    WaitForAnyKey;
    WriteLn;
  end;
end;

procedure Print(const aMsg: string);
begin
  Print(aMsg, []);
end;

procedure Print(const aMsg: string; const aArgs: array of const);
begin
  if not HasConsoleOutput then Exit;
  Write(Format(aMsg, aArgs));
end;

procedure PrintLn;
begin
  PrintLn('', []);
end;

procedure PrintLn(const aMsg: string);
begin
  PrintLn(aMsg, []);
end;

procedure PrintLn(const aMsg: string; const aArgs: array of const);
begin
  if not HasConsoleOutput then Exit;
  WriteLn(Format(aMsg, aArgs));
end;

function CreateDirsInPath(const aFilename: string): Boolean;
var
  s: string;
begin
  Result := False;

  if aFilename = '' then
    Exit;

  s := TPath.GetDirectoryName(aFilename);
  if s = '' then
    Exit;

  TDirectory.CreateDirectory(s);

  Result := TDirectory.Exists(s)
end;

function ExtractRelativeFilename(aBaseFilename: string; aDestFilename: string): string;
begin
  Result := ExtractRelativepath(ExtractFilePath(aBaseFilename), aDestFilename);
end;

function PathCombine(lpszDest: PWideChar; const lpszDir, lpszFile: PWideChar): PWideChar; stdcall; external 'shlwapi.dll' name 'PathCombineW';

function ExpandRelFilename(const aBaseFilename, aRelFilename: string): string;
var
  buff: array [0 .. MAX_PATH + 1] of WideChar;
begin
  PathCombine(@buff[0], PWideChar(ExtractFilePath(aBaseFilename)),
    PWideChar(aRelFilename));
  Result := string(buff);
end;

function ExtractRelativeDirectory(const aBaseDir, aDestDir: string): string;
var
  d1,d2: string;
begin
  if TFile.Exists(aBaseDir) then
    d1 := TPath.Combine(TPath.GetDirectoryName(aBaseDir), 'temp.txt')
  else
    d1 := TPath.Combine(aBaseDir, 'temp.txt');


  if TFile.Exists(aDestDir) then
    d2 := TPath.Combine(TPath.GetDirectoryName(aDestDir), 'temp.txt')
  else
    d2 := TPath.Combine(aDestDir, 'temp.txt');

  Result := ExtractRelativeFilename(d1, d2);
  Result := TPath.GetDirectoryName(Result);
end;

function ExpandRelDirectory(const aBaseDir, aRelDir: string): string;
var
  d1,d2: string;
begin
  if TFile.Exists(aBaseDir) then
    d1 := TPath.Combine(TPath.GetDirectoryName(aBaseDir), 'temp.txt')
  else
    d1 := TPath.Combine(aBaseDir, 'temp.txt');

  if TFile.Exists(aRelDir) then
    d2 := TPath.Combine(TPath.GetDirectoryName(aRelDir), 'temp.txt')
  else
    d2 := TPath.Combine(aRelDir, 'temp.txt');

  Result := ExpandRelFilename(d1, d2);
  Result := TPath.GetDirectoryName(Result);
end;

function RemoveQuotes(const aText: string): string;
var
  S: string;
begin
  S := AnsiDequotedStr(aText, '"');
  Result := AnsiDequotedStr(S, '''');
end;

function GetDirName(const aPath: string): string;
var
  LIndex: Integer;
  LPath: string;
begin
  Result := '';
  LPath := aPath.Replace('/', '\');
  LIndex := LPath.LastIndexOf('\');
  if LIndex = -1 then Exit;
  Result := Copy(LPath, LIndex+2);
end;

function IsCurrentDir(const aDirName: string): Boolean;
begin
  if SameText(GetDirName(TDirectory.GetCurrentDirectory), RemoveQuotes(aDirName)) then
    Result := True
  else
    Result := False;
end;

function  GetUUID(const aLowercase, aUseSeperator: Boolean): string;
begin
  Result := TPath.GetGUIDFileName(aUseSeperator);
  if aLowercase then
    Result := Result.ToLower;
end;

procedure WriteStringToStream(const aStream: TStream; const aStr: string);
var
  LLength: LongInt;
begin
  LLength := Length(aStr);
  aStream.Write(LLength, SizeOf(LLength));
  if LLength > 0 then aStream.Write(aStr[1], LLength * SizeOf(Char));
end;

function ReadStringFromStream(const aStream: TStream): string;
var
  LLength: LongInt;
begin
  aStream.Read(LLength, SizeOf(LLength));
  SetLength(Result, LLength);
  if LLength > 0 then aStream.Read(Result[1], LLength * SizeOf(Char));
end;


function GetEnvVarValue(const aVarName: string): string;
var
  LBufSize: Integer;  // buffer size required for value
begin
  LBufSize := GetEnvironmentVariable(PChar(aVarName), nil, 0);
  if LBufSize > 0 then
  begin
    SetLength(Result, LBufSize - 1);
    GetEnvironmentVariable(PChar(aVarName), PChar(Result), LBufSize);
  end
  else
    Result := '';
end;

function SetEnvVarValue(const aVarName, aVarValue: string): Integer;
begin
  if SetEnvironmentVariable(PChar(aVarName), PChar(aVarValue)) then
    Result := 0
  else
    Result := GetLastError;
end;

function SetGlobalEnvironment(const aName: string; const aValue: string; const aUser: Boolean = True): Boolean;
const
  REG_MACHINE_LOCATION = 'System\CurrentControlSet\Control\Session Manager\Environment';
  REG_USER_LOCATION = 'Environment';
var
  lParam, wParam:  NativeInt;
  Buf: Array[0..11] of Char;
  dwReturnValue: DWORD_PTR;
begin
  Buf := 'Environment'+#0;
  wParam := 0;
  lParam := NativeInt(@Buf[0]);

  with TRegistry.Create do
  try
    LazyWrite := false;
    if aUser then
    begin
      RootKey := HKEY_CURRENT_USER;
      Result := OpenKey(REG_USER_LOCATION, True);
    end else
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      Result := OpenKey(REG_MACHINE_LOCATION, True);
    end;
    if not Result then Exit;
    WriteString(aName, aValue); { Write Registry for Global Environment }
  finally
    Free;
  end;
  SetEnvironmentVariable(PChar(aName), PChar(aValue));
  SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, wParam, lParam, SMTO_ABORTIFHUNG, 5000, @dwReturnValue);
end;

function AddSelfToUserPath(var aUserPath: string): Boolean;
var
  LPath: string;
  LInstallPath: string;
begin
  Result := False;
  LInstallPath := IncludeTrailingPathDelimiter(TPath.GetDirectoryName(ParamStr(0)));
  LPath := GetEnvVarValue('PATH');
  if not ContainsText(LPath, LInstallPath) then
  begin
    LPath := LPath + ';' + LInstallPath;
    Result := SetGlobalEnvironment('PATH', LPath, False);
    if Result then
      aUserPath := LPath;
  end;
end;

function RemoveSelfFromUserPath(var aUserPath: string): Boolean;
var
  LPath: string;
  LInstallPath: string;
  LUpdate: Boolean;
begin
  Result := False;
  LInstallPath := IncludeTrailingPathDelimiter(TPath.GetDirectoryName(ParamStr(0)));
  LPath :=  GetEnvVarValue('PATH');
  LUpdate := False;
  while ContainsText(LPath, LInstallPath) do
  begin
    LUpdate := True;
    LPath := LPath.Replace(';'+LInstallPath, '');
  end;
  if LUpdate then
  begin
    Result :=  SetGlobalEnvironment('PATH', LPath, False);
    if Result then
      aUserPath := LPath;
  end;
end;


function RemoveDuplicates(const aText: string): string;
var
  i, l: integer;
begin
  Result := '';
  l := Length(aText);
  for i := 1 to l do
  begin
    if (Pos(aText[i], result) = 0) then
    begin
      result := result + aText[i];
    end;
  end;
end;

function RemoveDuplicates2(const aText: string): string;
var
  LChars: TDictionary<WideChar, Boolean>;
  I: integer;
begin
  Result := '';
  LChars := TDictionary<WideChar, Boolean>.Create;
  try
    for I := 1 to length(aText) do
    begin
      if not LChars.ContainsKey(aText[I]) then
      begin
        Result := Result + aText[I];
        LChars.Add(aText[I], True);
      end;
    end;
  finally
    LChars.Free;
  end;
end;

procedure ProcessMessages;
var
  LMsg: TMsg;
begin
  while Integer(PeekMessage(LMsg, 0, 0, 0, PM_REMOVE)) <> 0 do
  begin
    TranslateMessage(LMsg);
    DispatchMessage(LMsg);
  end;
end;

function CaptureConsoleOutput(const aTitle: string; const aCommand, aParameters: PChar; const aSender: Pointer; const aEvent: TCaptureConsoleOutputEvent): Cardinal;
const
  CReadBuffer = 2400;
var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dRead: DWORD;
  dRunning: DWORD;
  dAvailable: DWORD;
  CmdLine: string;
  BufferList: TStringList;
  Line: string;
  ExitCode: DWORD;
begin
  Result := 0;
  saSecurity.nLength := SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle := true;
  saSecurity.lpSecurityDescriptor := nil;
  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
    try
      FillChar(suiStartup, SizeOf(TStartupInfo), #0);
      suiStartup.cb := SizeOf(TStartupInfo);
      suiStartup.hStdInput := hRead;
      suiStartup.hStdOutput := hWrite;
      suiStartup.hStdError := hWrite;
      suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      suiStartup.wShowWindow := SW_HIDE;
      if aTitle.IsEmpty then
        suiStartup.lpTitle := nil
      else
        suiStartup.lpTitle := PChar(aTitle);
      CmdLine := aCommand + ' ' + aParameters;
      if CreateProcess(nil, PChar(CmdLine), @saSecurity, @saSecurity, true, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess) then
        try
          BufferList := TStringList.Create;
          try
            repeat
              dRunning := WaitForSingleObject(piProcess.hProcess, 100);
              PeekNamedPipe(hRead, nil, 0, nil, @dAvailable, nil);
              if (dAvailable > 0) then
                repeat
                  dRead := 0;
                  ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
                  pBuffer[dRead] := #0;
                  OemToCharA(pBuffer, dBuffer);
                  BufferList.Clear;
                  BufferList.Text := string(pBuffer);
                  for line in BufferList do
                  begin
                    if Assigned(aEvent) then
                    begin
                      aEvent(aSender, line);
                    end;
                  end;
                until (dRead < CReadBuffer);
              ProcessMessages;
              GetExitCodeProcess(piProcess.hProcess, ExitCode);
            until (dRunning <> WAIT_TIMEOUT) or (ExitCode <> STILL_ACTIVE) ;
            Result := ExitCode;
          finally
            FreeAndNil(BufferList);
          end;
        finally
          CloseHandle(piProcess.hProcess);
          CloseHandle(piProcess.hThread);
        end;
    finally
      CloseHandle(hRead);
      CloseHandle(hWrite);
    end;
end;

function IsValidFilename(const aFilename: string): Boolean;
const
  InvalidChars: set of AnsiChar = [#0..#31, '\', '/', ':', '*', '?', '"', '<', '>', '|'];
  InvalidWords: array[0..21] of String = ('CON', 'PRN', 'AUX', 'NUL', 'COM1',
    'COM2', 'COM3', 'COM4', 'COM5', 'COM6', 'COM7', 'COM8', 'COM9', 'LPT1', 'LPT2',
    'LPT3', 'LPT4', 'LPT5', 'LPT6', 'LPT7', 'LPT8', 'LPT9');
var
  I, L, Lw: Integer;
  LFilename: string;
begin
  Result:= False;
  LFilename := aFilename;
  L:= Length(LFilename);
  if (L = 0) or (L > 255) or (LFilename[L] = '.') or (LFilename[L] = ' ') then Exit;
  for I:= 1 to L do
    if (Ord(LFilename[I]) <= 255) and (AnsiChar(LFilename[I]) in InvalidChars) then Exit;
  LFilename:= UpperCase(LFilename);
  for I:= 0 to 21 do
  begin
    Lw:= Length(InvalidWords[I]);
    if (Pos(InvalidWords[I], LFilename) = 1) and
       ((Lw = Length(LFilename)) or (LFilename[Lw+1] = '.')) then Exit;
   end;
  Result := True;
end;

procedure SystemStartup;
var
  I: Integer;
begin
  uCodePage := GetConsoleOutputCP;

  SetConsoleOutputCP(WinApi.Windows.CP_UTF8);

  System.Randomize;

  for I := 0 to 360 do
  begin
    uCosTable[I] := cos((I * PI / 180.0));
    uSinTable[I] := sin((I * PI / 180.0));
  end;
end;

procedure SystemShutdown;
begin
  SetConsoleOutputCP(uCodePage);
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Window '}
class operator TWindow.Initialize(out aDest: TWindow);
begin
end;

class operator TWindow.Finalize(var aDest: TWindow);
begin
  Close;
end;

class function  TWindow.Open(const aTitle: string; const aX, aY, aWidth, aHeight: Integer): Boolean;
var
  LFlags: Integer;
  LX, LY: Integer;
begin
  Result := False;

  if IsOpen then Exit;

  LFlags := Ord(SDL_WINDOW_SHOWN) or Ord(SDL_WINDOW_ALLOW_HIGHDPI);

  if aX < 0 then
    LX := SDL_WINDOWPOS_CENTERED
  else
    LX := aX;

  if aY < 0 then
    LY := SDL_WINDOWPOS_CENTERED
  else
    LY := aY;

  FWindow := SDL_CreateWindow(Marshaller.AsUtf8(aTitle).ToPointer, LX, LY, aWidth, aHeight, LFlags);
  if not Assigned(FWindow) then Exit;

  LFlags := 0 or Ord(SDL_RENDERER_ACCELERATED);
  FRenderer := SDL_CreateRenderer(FWindow, -1, LFlags);
  if not Assigned(FRenderer) then Exit;

  SDL_RenderSetLogicalSize(FRenderer, aWidth, aHeight);
  SDL_GetRendererOutputSize(FRenderer, @FRendererSize.x, @FRendererSize.y);
  SDL_GetWindowSize(FWindow, @FWindowSize.x, @FWindowSize.y);
  FRendererScale.X := FRendererSize.X / FWindowSize.X;
  FRendererScale.Y := FRendererSize.Y / FWindowSize.Y;

  SDL_RenderSetScale(FRenderer, FRendererScale.X, FRendererScale.Y);
  SDL_GetDisplayDPI(SDL_GetWindowDisplayIndex(FWindow), @FDDPI, @FHDPI, @FVDPI);

  FRenderTarget := SDL_CreateTexture(FRenderer, Ord(SDL_PIXELFORMAT_ARGB8888), Ord(SDL_TEXTUREACCESS_TARGET), aWidth, aHeight);
  if not Assigned(FRenderTarget) then Exit;

  SDL_GetRendererInfo(FRenderer, @FRendererInfo);

  SDL_SetRenderDrawColor(FRenderer, 0, 0, 0, 255);
  SDL_RenderClear(FRenderer);


  Result := True;
end;

class procedure TWindow.Close;
begin
  if Assigned(FRenderTarget) then SDL_DestroyTexture(FRenderTarget);
  if Assigned(FRenderer) then SDL_DestroyRenderer(FRenderer);
  if Assigned(FWindow) then SDL_DestroyWindow(FWindow);
  FRenderTarget := nil;
  FRenderer := nil;
  FWindow := nil;
end;

class function  TWindow.IsOpen: Boolean;
begin
  Result := False;
  if not Assigned(FWindow) then Exit;
  if not Assigned(FRenderer) then Exit;
  Result := True;
end;

class procedure TWindow.Clear(const aColor: TColor);
begin
  if not IsOpen then Exit;
  SDL_SetRenderTarget(FRenderer, FRenderTarget);
  SDL_SetRenderDrawColor(FRenderer, aColor.Red, aColor.Green, aColor.BLue, aColor.Alpha);
  SDL_RenderFillRect(FRenderer, nil);
end;

class procedure TWindow.ShowRenderTarget;
begin
  if not IsOpen then Exit;
  SDL_SetRenderTarget(FRenderer, nil);
  SDL_RenderCopy(FRenderer, FRenderTarget, nil, nil);
end;

class procedure TWindow.Show;
begin
  if not IsOpen then Exit;
  SDL_RenderPresent(FRenderer);
end;

class procedure TWindow.SetTitle(const aTitle: string);
begin
  if not IsOpen then Exit;
  SDL_SetWindowTitle(FWindow, Marshaller.AsUtf8(aTitle).ToPointer);
end;

class function  TWindow.GetTitle: string;
begin
  Result := '';
  if not IsOpen then Exit;
  Result := string(SDL_GetWindowTitle(FWindow));
end;

class function  TWindow.GetViewport: TRect;
var
  LRect: SDL_Rect;
begin
  SDL_RenderGetViewport(FRenderer, @LRect);
  Result := LRect;
end;

class function  TWindow.GetWindowHandle: PSDL_Window;
begin
  Result := FWindow;
end;

class function  TWindow.GetRendererHandle: PSDL_Renderer;
begin
  Result := FRenderer;
end;

class function  TWindow.GetWindowSize: TPoint;
begin
  Result := FWindowSize;
end;

class function  TWindow.GetRendererSize: TPoint;
begin
  Result := FRendererSize;
end;

class function  TWindow.GetRendererScale: TPoint;
begin
  Result := FRendererScale;
end;

class function  TWindow.GetDDPI: Single;
begin
  Result := FDDPI;
end;

class function  TWindow.GetHDPI: Single;
begin
  Result := FHDPI;
end;

class function  TWindow.GetVDPI: Single;
begin
  Result := FVDPI;
end;

class function  TWindow.GetRendererInfo: SDL_RendererInfo;
begin
  Result := FRendererInfo;
end;

class procedure TWindow.DrawPoint(const aX, aY: Single; const aColor: TColor);
begin
  if not IsOpen then Exit;
  SDL_SetRenderDrawColor(FRenderer, aColor.Red, aColor.Green, aColor.BLue, aColor.Alpha);
  SDL_RenderDrawPointF(FRenderer, aX, aY);
end;

class procedure TWindow.DrawLine(const aX1, aY1, aX2, aY2: Single; const aColor: TColor);
begin
  if not IsOpen then Exit;
  SDL_SetRenderDrawColor(FRenderer, aColor.Red, aColor.Green, aColor.BLue, aColor.Alpha);
  SDL_RenderDrawLineF(FRenderer, aX1, aY1, aX2, aY2);
end;

class procedure TWindow.DrawRect(const aX, aY, aWidth, aHeight: Single; const aColor: TColor);
var
  LRect: SDL_FRect;
begin
  if not IsOpen then Exit;
  SDL_SetRenderDrawColor(FRenderer, aColor.Red, aColor.Green, aColor.BLue, aColor.Alpha);
  LRect.x := aX; LRect.y := aY; LRect.w := aWidth; LRect.h := aHeight;
  SDL_RenderDrawRectF(FRenderer, @LRect);
end;

class procedure TWindow.DrawFilledRect(const aX, aY, aWidth, aHeight: Single; const aColor: TColor);
var
  LRect: SDL_FRect;
begin
  if not IsOpen then Exit;
  SDL_SetRenderDrawColor(FRenderer, aColor.Red, aColor.Green, aColor.BLue, aColor.Alpha);
  LRect.x := aX; LRect.y := aY; LRect.w := aWidth; LRect.h := aHeight;
  SDL_RenderFillRectF(FRenderer, @LRect);
end;

class function  TWindow.Save(const aFilename: string): Boolean;
var
  LFilename: string;
  LFrameBuffer: PSDL_Surface;
  LWidth, LHeight: Integer;
begin
  Result := False;
  if aFilename.IsEmpty then Exit;
  LFilename := TPath.ChangeExtension(aFilename, PNGEXT);
  SDL_GetRendererOutputSize(FRenderer, @LWidth, @LHeight);
  LFrameBuffer := SDL_CreateRGBSurfaceWithFormat(0, LWidth, LHeight, 8, Ord(SDL_PIXELFORMAT_RGBA32));
  if not Assigned(LFrameBuffer) then Exit;
  try
    if SDL_RenderReadPixels(FRenderer, nil, Ord(SDL_PIXELFORMAT_RGBA32), LFrameBuffer.pixels, LFrameBuffer.pitch) = 0 then
    begin
      IMG_SavePNG(LFrameBuffer, Marshaller.AsUtf8(LFilename).ToPointer);
    end;
  finally
    SDL_FreeSurface(LFrameBuffer);
  end;
end;

class function TController.Startup: Boolean;
begin
  Result := True;
end;

class procedure TController.Shutdown;
begin
  Close;
end;

class function TController.Open(const aIndex: Cardinal): Boolean;
var
  LIndex: Integer;
begin
  Result := False;
  LIndex := SDL_NumJoysticks;
  if LIndex < 0 then Exit;
  if aIndex > Cardinal(LIndex-1) then Exit;
  Close;
  if SDL_IsGameController(aIndex) = SDL_False then Exit;
  FHandle := SDL_GameControllerOpen(aIndex);
  Result := Assigned(FHandle);
end;

class procedure TController.Close;
begin
  if Assigned(FHandle) then
  begin
    SDL_GameControllerClose(FHandle);
    Clear;
  end;
end;

class procedure TController.Clear;
begin
  FillChar(FAxes, SizeOf(FAxes), 0);
  FillChar(FButtons, SizeOf(FButtons), 0);
  FHandle := nil;
end;

class procedure TController.Update(const aEvent: PSDL_Event);
begin

  case aEvent.type_ of
    Ord(SDL_CONTROLLERAXISMOTION):
    begin
      FAxes[aEvent.caxis.axis] := aEvent.caxis.vaLue / 32767.0;
    end;

    Ord(SDL_CONTROLLERBUTTONDOWN):
    begin
      FButtons[0, aEvent.cbutton.button] := True;
    end;

    Ord(SDL_CONTROLLERBUTTONUP):
    begin
      FButtons[0, aEvent.cbutton.button] := False;
    end;

    Ord(SDL_CONTROLLERDEVICEADDED):
    begin
      Open(aEvent.cdevice.which);
      Game.Timer.Reset;
    end;

    Ord(SDL_CONTROLLERDEVICEREMOVED):
    begin
      Close;
      Game.Timer.Reset;
    end;
  end;
end;

class function  TController.ButtonDown(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not InRange(aButton, Ord(SDL_CONTROLLER_BUTTON_A), Ord(SDL_CONTROLLER_BUTTON_TOUCHPAD)) then  Exit;
  Result := FButtons[0, aButton];
end;

class function  TController.ButtonPressed(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not InRange(aButton, Ord(SDL_CONTROLLER_BUTTON_A), Ord(SDL_CONTROLLER_BUTTON_TOUCHPAD)) then  Exit;
  if ButtonDown(aButton) and (not FButtons[1, aButton]) then
  begin
    FButtons[1, aButton] := True;
    Result := True;
  end
  else if (not ButtonDown(aButton)) and (FButtons[1, aButton]) then
  begin
    FButtons[1, aButton] := False;
    Result := False;
  end;
end;

class function  TController.ButtonReleased(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not InRange(aButton, Ord(SDL_CONTROLLER_BUTTON_A), Ord(SDL_CONTROLLER_BUTTON_TOUCHPAD)) then Exit;
  if ButtonDown(aButton) and (not FButtons[1, aButton]) then
  begin
    FButtons[1, aButton] := True;
    Result := False;
  end
  else if (not ButtonDown(aButton)) and (FButtons[1, aButton]) then
  begin
    FButtons[1, aButton] := False;
    Result := True;
  end;
end;

class function  TController.GetAxis(const aAxis: Cardinal): Single;
begin
  Result := 0;
  if not InRange(aAxis, Ord(SDL_CONTROLLER_AXIS_LEFTX),
    Ord(SDL_CONTROLLER_AXIS_TRIGGERRIGHT)) then Exit;
  Result := FAxes[aAxis];
end;

class operator TInput.Initialize (out aDest: TInput);
begin
end;

class operator TInput.Finalize (var aDest: TInput);
begin
  Close;
end;

class procedure TInput.Open;
begin
  if FIsOpen then Exit;
  SDL_Init(SDL_INIT_GAMECONTROLLER);
  FController.Startup;
  FIsOpen := True;
  Clear;
end;

class procedure TInput.Close;
begin
  if not FIsOpen then Exit;
  FController.Shutdown;
  FIsOpen := False;
end;

class procedure TInput.Clear;
begin
  if not FIsOpen then Exit;
  FKeyCode := 0;
  FKeyCodeRepeat := False;
  FillChar(FMouseButtons, SizeOf(FMouseButtons), False);
  FillChar(FKeyButtons, SizeOf(FKeyButtons), False);
  FController.Clear;
end;

class procedure TInput.Update(const aEvent: PSDL_Event);
begin
  if not FIsOpen then Exit;

  case aEvent.type_ of
    Ord(SDL_TEXTINPUT):
    begin
    end;

    Ord(SDL_KEYDOWN):
    begin
      FKeyButtons[0, Ord(aEvent.key.keysym.scancode)] := True;
    end;

    Ord(SDL_KEYUP):
    begin
      FKeyButtons[0, Ord(aEvent.key.keysym.scancode)] := False;
    end;

    Ord(SDL_MOUSEBUTTONDOWN):
    begin
      FMouseButtons[0, Ord(aEvent.button.button)] := True;
    end;

    Ord(SDL_MOUSEBUTTONUP):
    begin
      FMouseButtons[0, Ord(aEvent.button.button)] := False;
    end;

    Ord(SDL_MOUSEMOTION):
    begin
      FMouse.Postion.X := aEvent.motion.x;
      FMouse.Postion.Y := aEvent.motion.y;
      FMouse.Delta.X := aEvent.motion.xrel;
      FMouse.Delta.Y := aEvent.motion.yrel;
    end;
  end;

  FController.Update(aEvent);
end;

class function  TInput.KeyDown(const aKey: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  if not InRange(aKey, Ord(SDL_SCANCODE_A), Ord(SDL_SCANCODE_ENDCALL)) then  Exit;
  Result := FKeyButtons[0, aKey];
end;

class function  TInput.KeyPressed(const aKey: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  if not InRange(aKey, Ord(SDL_SCANCODE_A), Ord(SDL_SCANCODE_ENDCALL)) then  Exit;
  if KeyDown(aKey) and (not FKeyButtons[1, aKey]) then
  begin
    FKeyButtons[1, aKey] := True;
    Result := True;
  end
  else if (not KeyDown(aKey)) and (FKeyButtons[1, aKey]) then
  begin
    FKeyButtons[1, aKey] := False;
    Result := False;
  end;
end;

class function  TInput.KeyReleased(const aKey: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  if not InRange(aKey, Ord(SDL_SCANCODE_A), Ord(SDL_SCANCODE_ENDCALL)) then Exit;
  if KeyDown(aKey) and (not FKeyButtons[1, aKey]) then
  begin
    FKeyButtons[1, aKey] := True;
    Result := False;
  end
  else if (not KeyDown(aKey)) and (FKeyButtons[1, aKey]) then
  begin
    FKeyButtons[1, aKey] := False;
    Result := True;
  end;
end;

class function  TInput.MouseDown(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  if not InRange(aButton, SDL_BUTTON_LEFT, SDL_BUTTON_X2) then Exit;
  Result := FMouseButtons[0, aButton];
end;

class function  TInput.MousePressed(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  if not InRange(aButton, SDL_BUTTON_LEFT, SDL_BUTTON_X2) then Exit;

  if MouseDown(aButton) and (not FMouseButtons[1, aButton]) then
  begin
    FMouseButtons[1, aButton] := True;
    Result := True;
  end
  else if (not MouseDown(aButton)) and (FMouseButtons[1, aButton]) then
  begin
    FMouseButtons[1, aButton] := False;
    Result := False;
  end;
end;

class function  TInput.MouseReleased(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  if not InRange(aButton, SDL_BUTTON_LEFT, SDL_BUTTON_X2) then Exit;

  if MouseDown(aButton) and (not FMouseButtons[1, aButton]) then
  begin
    FMouseButtons[1, aButton] := True;
    Result := False;
  end
  else if (not MouseDown(aButton)) and (FMouseButtons[1, aButton]) then
  begin
    FMouseButtons[1, aButton] := False;
    Result := True;
  end;
end;

class procedure TInput.SetMousePos(const aX, aY: Integer);
var
  LRect: TRect;
  LScale: TPoint;
begin
  if not FIsOpen then Exit;

  LRect := Game.Window.GetViewport;
  LScale := Game.Window.GetRendererScale;

  LRect.X := (aX + LRect.X) * LScale.X;
  LRect.Y := (aY + LRect.Y) * LScale.Y;

  SDL_WarpMouseInWindow(Game.Window.GetWindowHandle, Round(LRect.X), Round(LRect.Y));
end;

class procedure TInput.GetMouseInfo(const aPosition: PPoint; const aDelta: PVector);
begin
  if not FIsOpen then Exit;

  if Assigned(aPosition) then
    aPosition^ := FMouse.Postion;

  if Assigned(aDelta) then
    aDelta^ := FMouse.Delta;
end;

class function  TInput.ControllerDown(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  Result := FController.ButtonDown(aButton)
end;

class function  TInput.ControllerPressed(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  Result := FController.ButtonPressed(aButton);
end;

class function  TInput.ControllerReleased(const aButton: Cardinal): Boolean;
begin
  Result := False;
  if not FIsOpen then Exit;
  Result := FController.ButtonReleased(aButton);
end;

class function  TInput.ControllerPosition(const aAxis: Cardinal): Single;
begin
  Result := 0;
  if not FIsOpen then Exit;
  Result := FController.GetAxis(aAxis);
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Graphics '}
constructor TGeometry.Create;
begin
  inherited;
  FBuffer := nil;
  FIndex := 0;
  FCount := 0;
end;

destructor TGeometry.Destroy;
begin
  if Assigned(FBuffer) then FreeNilObject(FBuffer);
  inherited;
end;

procedure TGeometry.Alloc(const aNumTriangles: UInt64);
var
  LSize: UInt64;
begin
  if Assigned(FBuffer) then FreeNilObject(FBuffer);
  FCount := aNumTriangles * 3;
  LSize := SizeOf(SDL_Vertex) * FCount;
  FBuffer := TBuffer.Create(LSize);
end;

procedure TGeometry.Reset;
begin
  FIndex := 0;
end;

procedure TGeometry.AddVertex(const aX, aY: Single; const aColor: SDL_Color; const aTX, aTY: Single);
var
  FVertex: PSDL_Vertex;
begin
  if not Assigned(FBuffer) then Exit;
  if FIndex = FCount then Exit;
  FVertex := PSDL_Vertex(FBuffer.Memory);
  Inc(FVertex, FIndex);
  FVertex.position.x := aX;
  FVertex.position.y := aY;
  FVertex.color := aColor;
  FVertex.tex_coord.x := aTX;
  FVertex.tex_coord.y := aTY;
  Inc(FIndex);
end;

procedure TGeometry.Render(const aTexture: PSDL_Texture; const aReset: Boolean);
var
  LCount: UInt64;
begin
  LCount := Round((FIndex / 3) * 3);
  SDL_RenderGeometry(Game.Window.GetRendererHandle, aTexture, FBuffer.Memory, LCount, nil, 0);
  if aReset then
    Reset;
end;

constructor TTexture.Create;
begin
  inherited;
end;

destructor TTexture.Destroy;
begin
  Unload;
  inherited;
end;

procedure TTexture.Alloc(const aWidth, aHeight: Cardinal; const aAccess: TTextureAccess);
var
  LHandle: PSDL_Texture;
  LSurface: PSDL_Surface;
begin
  LHandle := SDL_CreateTexture(Game.Window.GetRendererHandle, Ord(SDL_PIXELFORMAT_ARGB8888), Ord(aAccess), aWidth, aHeight);
  if not Assigned(LHandle) then Exit;
  Unload;
  FHandle := LHandle;
  FPixelFormat := SDL_AllocFormat(Ord(SDL_PIXELFORMAT_ARGB8888));
  SDL_SetTextureBlendMode(FHandle, SDL_BLENDMODE_BLEND);
  SDL_QueryTexture(FHandle, nil, nil, @FWidth, @FHeight);
  if aAccess = taStreaming then
  begin
    SDL_LockTextureToSurface(FHandle, nil, @LSurface);
    SDL_FillRect(LSurface, nil, SDL_MapRGBA(LSurface.format, 255, 255, 255, 255));
    SDL_UnlockTexture(FHandle);
  end;
end;

function TTexture.Load(const aArchive: TArchive; const aFilename: string; const aColorKey: PSDL_Color): Boolean;
var
  LRWops: PSDL_RWops;
  LHandle: PSDL_Texture;
  destsurface,srcsurface: PSDL_Surface;
  LPixelFormat: PSDL_PixelFormat;
begin
  Result := False;

  if Assigned(aArchive) then
    begin
      if aArchive.IsOpen then
        LRWops := aArchive.OpenFileRWops(aFilename)
      else
        LRWops := GetFileRWops(aFilename);
    end
  else
    LRWops := GetFileRWops(aFilename);

  if not Assigned(LRWops) then Exit;

  srcsurface := IMG_Load_RW(LRWops, Ord(SDL_True));
  if not Assigned(srcsurface) then Exit;

  if aColorKey <> nil then
   begin
    SDL_SetColorKey(srcsurface, 1, SDL_MapRGB(srcsurface.format, aColorKey.r, aColorKey.g, aColorKey.b));
   end;

  LPixelFormat := SDL_AllocFormat(Ord(SDL_PIXELFORMAT_ARGB8888));
  destsurface := SDL_ConvertSurface(srcsurface, LPixelFormat, 0);
  SDL_FreeSurface(srcsurface);

  LHandle := SDL_CreateTexture(Game.Window.GetRendererHandle, Ord(SDL_PIXELFORMAT_ARGB8888), Ord(SDL_TEXTUREACCESS_STREAMING), destsurface.w, destsurface.h);
  SDL_LockSurface(destsurface);
  SDL_UpdateTexture(LHandle, nil, destsurface.pixels, destsurface.pitch);
  SDL_UnlockSurface(destsurface);

  SDL_FreeSurface(destsurface);

  Unload;

  FHandle := LHandle;
  FPixelFormat := LPixelFormat;

  SDL_SetTextureBlendMode(FHandle, SDL_BLENDMODE_BLEND);
  SDL_QueryTexture(FHandle, nil, nil, @FWidth, @FHeight);

  Result := True;
end;

procedure TTexture.Unload;
begin
  if FPixelFormat <> nil then
  begin
    SDL_FreeFormat(FPixelFormat);
    FPixelFormat := nil;
  end;

  if FHandle <> nil then
  begin
    SDL_DestroyTexture(FHandle);
    FHandle := nil;
  end;
end;

procedure TTexture.Render(const aSrcRect: PSDL_FRect; const aX, aY: Single; aScale, aAngle: Single; const aFlipMode: TFlipMode; const aOrigin: PSDL_FPoint; const aColor: SDL_Color; const aBlendMode: TBlendMode);
var
  LSrcRect: SDL_Rect;
  LDstRect: SDL_FRect;
  X, Y, W, H: Single;
begin
  X := 0;
  Y := 0;

  LSrcRect.x := 0;
  LSrcRect.y := 0;
  LSrcRect.w := FWidth;
  LSrcRect.h := FHeight;

  if aSrcRect <> nil then
  begin
    LSrcRect.x := Round(aSrcRect.x);
    LSrcRect.y := Round(aSrcRect.y);
    LSrcRect.w := Round(aSrcRect.w);
    LSrcRect.h := Round(aSrcRect.h);
  end;

  if aOrigin <> nil then
  begin
    X := aOrigin.X;
    Y := aOrigin.Y;
    if (X < 0) then
      X := 0
    else if (X > 1) then
      X := 1;
    if (Y < 0) then
      Y := 0
    else if (Y > 1) then
      Y := 1;
  end;

  W := LSrcRect.w * aScale;
  H := LSrcRect.h * aScale;

  LDstRect.X := aX - W * X;
  LDstRect.Y := aY - H * Y;
  LDstRect.w := W;
  LDstRect.h := H;

  SDL_SetTextureColorMod(FHandle, aColor.r, aColor.g, aColor.b);
  SDL_SetTextureAlphaMod(FHandle, aColor.a);

  SDL_SetTextureBlendMode(FHandle, SDL_BlendMode(aBlendMode));

  SDL_RenderCopyExF(Game.Window.GetRendererHandle, FHandle, @LSrcRect, @LDstRect, aAngle, nil, SDL_RendererFlip(aFlipMode))
end;

procedure TTexture.RenderTiled(const aDeltaX, aDeltaY: Single; const aColor: SDL_Color; const aBlendMode: TBlendMode);
var
  w,h    : Integer;
  ox,oy  : Integer;
  px,py  : Single;
  fx,fy  : Single;
  tx,ty  : Integer;
  vp: SDL_FRect;
  vr,vb  : Integer;
  ix,iy  : Integer;
begin
  vp := Game.Window.GetViewport;

  w := FWidth;
  h := FHeight;

  ox := -w+1;
  oy := -h+1;

  px := aDeltaX;
  py := aDeltaY;

  fx := px-floor(px);
  fy := py-floor(py);

  tx := floor(px)-ox;
  ty := floor(py)-oy;

  if (tx>=0) then tx := tx mod w + ox else tx := w - -tx mod w + ox;
  if (ty>=0) then ty := ty mod h + oy else ty := h - -ty mod h + oy;

  vr := Round(vp.w);
  vb := Round(vp.h);
  iy := ty;

  while iy<vb do
  begin
    ix := tx;
    while ix<vr do
    begin
      Render(nil, ix+fx, iy+fy, 1, 0, fmNone, nil, aColor, aBlendMode);
      ix := ix+w;
    end;
   iy := iy+h;
  end;
end;

procedure TTexture.Lock(const aRect: PSDL_FRect);
begin
  if FPixels = nil then
  begin
    if aRect <> nil then
      begin
        FLockRect.x := aRect.x;
        FLockRect.y := aRect.y;
        FLockRect.w := aRect.w;
        FLockRect.h := aRect.h;
      end
    else
      begin
        FLockRect.x := 0;
        FLockRect.y := 0;
        FLockRect.w := FWidth;
        FLockRect.h := FHeight;
      end;

    SDL_LockTexture(FHandle, nil, @FPixels, @FPitch);
  end;
end;

procedure TTexture.Unlock;
begin
  if FPixels <> nil then
  begin
    SDL_UnlockTexture(FHandle);
    FPixels := nil;
    FPitch := 0;
  end;
end;

procedure TTexture.SetPixel(const aX, aY: Integer; const aColor: SDL_Color);
var
  p: PCardinal;
  LX, LY: Integer;
begin
  LX := aX;
  LY := aY;
  if (LX < 0) or (LX > FLockRect.w-1)  or
     (LY < 0) or (LY > FLockRect.h-1) or
     (FPixels = nil)  then
    Exit;

  Inc(LX, Round(FLockRect.x));
  Inc(LY, Round(FLockRect.y));

  p := FPixels;
  Inc(p, (LY * FWidth) + LX);
  p^ :=  SDL_MapRGBA(FPixelFormat, aColor.r, aColor.g, aColor.b, aColor.a);
end;

function  TTexture.GetPixel(const aX, aY: Integer): SDL_Color;
var
  p: PCardinal;
  LX, LY: Integer;
begin
  Result := BLANK;

  LX := aX;
  LY := aY;

  if (LX < 0) or (LX > FLockRect.w-1)  or
     (LY < 0) or (LY > FLockRect.h-1) or
     (FPixels = nil)  then
    Exit;

  Inc(LX, Round(FLockRect.x));
  Inc(LY, Round(FLockRect.y));

  p := FPixels;
  Inc(p, (LY * FWidth) + LX);

  SDL_GetRGBA(p^, FPixelFormat, @Result.r, @Result.g, @Result.b, @Result.a);
end;

procedure TTexture.GetSize(aWidth: PInteger; aHeight: PInteger);
begin
  if aWidth <> nil then
  begin
    aWidth^ := FWidth;
  end;

  if aHeight <> nil then
  begin
    aHeight^ := FHeight;
  end;
end;

procedure TTexture.SetColor(const aColor: SDL_Color);
begin
  SDL_SetTextureColorMod(FHandle, aColor.r, aColor.g, aColor.b);
  SDL_SetTextureAlphaMod(FHandle, aColor.a);
end;

function  TTexture.GetColor: SDL_Color;
begin
  SDL_GetTextureColorMod(FHandle, @Result.r, @Result.g, @Result.b);
  SDL_GetTextureAlphaMod(FHandle, @Result.a);
end;

function TTexture.Save(const aFilename: string): Boolean;
var
  LSurface: PSDL_Surface;
begin
  Result := False;
  if not Assigned(FHandle) then Exit;
  SDL_LockTextureToSurface(FHandle, nil, @LSurface);
  if Assigned(LSurface) then Result := Boolean(IMG_SavePNG(LSurface, Marshaller.AsUtf8(aFilename).ToPointer) = 0);
  SDL_UnlockTexture(FHandle);
end;

class function TTexture.LoadTexture(const aArchive: TArchive; const aFilename: string; const aColorKey: PSDL_Color): TTexture;
begin
  Result := TTexture.Create;
  if not Result.Load(aArchive, aFilename, aColorKey) then
  begin
    FreeNilObject(Result);
  end;
end;

constructor TFont.Create;
begin
  inherited;

  FGeometry := TGeometry.Create;
  FGlyph := TDictionary<Integer, TGlyph>.Create;
end;

destructor TFont.Destroy;
begin
  Unload;
  FreeNilObject(FGlyph);

  inherited;
end;

procedure TFont.Unload;
begin
  FGlyph.Clear;
  if Assigned(FAtlas) then SDL_DestroyTexture(FAtlas);
  FAtlas := nil;
end;

procedure TFont.SetVertexBufferSize(const aSize: UInt64);
begin
  FVertexBufferSize := aSize * 2;
  FGeometry.Alloc(FVertexBufferSize);
end;

function  TFont.GetVertexBufferSize: UInt64;
begin
  Result := FVertexBufferSize;
end;

procedure TFont.SetUseVertexBuffer(const aEnable: Boolean);
begin
  FUseVertexBuffer := aEnable;
end;

function  TFont.GetUseVertexBuffer: Boolean;
begin
  Result := FUseVertexBuffer;
end;

function TFont.Load(const aRWops: PSDL_RWops; const aSize: Cardinal; const aGlyphs: string): Boolean;
var
  LBuffer: TBuffer;
  LChars: TBuffer;
  LFileSize: Int64;
  LFontInfo: stbtt_fontinfo;
  NumOfGlyphs: Integer;
  LGlyphChars: string;
  LCodePoints: array of Integer;
  LBitmap: array of Byte;
  LPixels: array of Uint32;
  LPackContext: stbtt_pack_context;
  LPackRange: stbtt_pack_range;
  I: Integer;
  LPixelFormat: PSDL_PixelFormat;
  LGlyph: TGlyph;
  LChar: Pstbtt_packedchar;
  LScale: Single;
  LAscent: Integer;
  LSize: Single;
begin
  Result := False;

  LSize := aSize * Game.Window.GetRendererScale.x;

  LFileSize := SDL_RWsize(aRWops);
  LBuffer := TBuffer.Create(LFileSize);
  try
    if SDL_RWread(aRWops, lbuffer.Memory, LFileSize, 1) <> 1 then Exit;
    SDL_RWclose(aRWops);

    if stbtt_InitFont(@LFontInfo, lbuffer.Memory, 0) = 0 then Exit;

    LGlyphChars := cDefaultGlyphs + aGlyphs;
    LGlyphChars := RemoveDuplicates(LGlyphChars);
    NumOfGlyphs := LGlyphChars.Length;
    SetLength(LCodePoints, NumOfGlyphs);

    for I := 1 to NumOfGlyphs do
    begin
      LCodePoints[I-1] := Integer(Char(LGlyphChars[I]));
    end;

    LChars := TBuffer.Create(SizeOf(stbtt_packedchar) * (NumOfGlyphs+1));
    try
      LPackRange.font_size := -LSize;
      LPackRange.first_unicode_codepoint_in_range := 0;
      LPackRange.array_of_unicode_codepoints := @LCodePoints[0];
      LPackRange.num_chars := NumOfGlyphs;
      LPackRange.chardata_for_range := LChars.Memory;
      LPackRange.h_oversample := 1;
      LPackRange.v_oversample := 1;

      FAtlasSize := 32;

      while True do
      begin
        SetLength(LBitmap, FAtlasSize * FAtlasSize);
        stbtt_PackBegin(@LPackContext, @LBitmap[0], FAtlasSize, FAtlasSize, 0, 1, nil);
        stbtt_PackSetOversampling(@LPackContext, 1, 1);
        if stbtt_PackFontRanges(@LPackContext, LBuffer.Memory, 0, @LPackRange, 1) = 0  then
          begin
            LBitmap := nil;
            stbtt_PackEnd(@LPackContext);
            FAtlasSize := FAtlasSize * 2;
            if (FAtlasSize > Game.Window.GetRendererInfo.max_texture_width) or
               (FAtlasSize > Game.Window.GetRendererInfo.max_texture_height) then
            begin
              raise Exception.Create(Format('Font texture too large. Max size: %dx%d', [Game.Window.GetRendererInfo.max_texture_width, Game.Window.GetRendererInfo.max_texture_height]));
            end;
          end
        else
          begin
            stbtt_PackEnd(@LPackContext);
            break;
          end;
      end;

      Unload;

      FAtlas := SDL_CreateTexture(Game.Window.GetRendererHandle, Ord(SDL_PIXELFORMAT_RGBA32), Ord(SDL_TEXTUREACCESS_STREAMING), FAtlasSize, FAtlasSize);
      SDL_SetTextureBlendMode(FAtlas, SDL_BLENDMODE_BLEND);
      SDL_SetTextureScaleMode(FAtlas, SDL_ScaleModeLinear);
      SetLength(LPixels, FAtlasSize * FAtlasSize);
      LPixelFormat := SDL_AllocFormat(Ord(SDL_PIXELFORMAT_RGBA32));

      for I := 0 to (FAtlasSize*FAtlasSize)-1 do
      begin
        LPixels[i] := SDL_MapRGBA(LPixelFormat, 255, 255, 255, LBitmap[i]);
      end;
      SDL_UpdateTexture(FAtlas, nil, LPixels, FAtlasSize * sizeof(Uint32));

      SDL_FreeFormat(LPixelFormat);

      LPixels := nil;
      LBitmap := nil;

      LScale := stbtt_ScaleForMappingEmToPixels(@LFontInfo, LSize);
      stbtt_GetFontVMetrics(@LFontInfo, @LAscent, nil, nil);
      FBaseline := LAscent * LScale;

      for I := Low(LCodePoints) to High(LCodePoints) do
      begin
        LChar := Pstbtt_packedchar(LChars.Memory);
        Inc(LChar, I);

        LGlyph.SrcRect.x := LChar.x0;
        LGlyph.SrcRect.y := LChar.y0;
        LGlyph.SrcRect.w := LChar.x1-LChar.x0;
        LGlyph.SrcRect.h := LChar.y1-LChar.y0;

        LGlyph.DstRect.x := 0 + LChar.xoff;
        LGlyph.DstRect.y := 0 + LChar.yoff + FBaseline;
        LGlyph.DstRect.w := (LChar.x1-LChar.x0);
        LGlyph.DstRect.h := (LChar.y1-LChar.y0);

        LGlyph.XAdvance := LChar.xadvance;

        FGlyph.Add(LCodePoints[I], LGlyph);
      end;

      Result := True;

    finally
      FreeNilObject(LChars);
    end;

  finally
    FreeNilObject(LBuffer);
  end;
end;

function  TFont.Load(const aArchive: TArchive; const aFilename: string; const aSize: Cardinal; const aGlyphs: string=''): Boolean;
var
  LRWops: PSDL_RWops;
begin
  Result := False;

  if Assigned(aArchive) then
    begin
      if aArchive.IsOpen then
        LRWops := aArchive.OpenFileRWops(aFilename)
      else
        LRWops := GetFileRWops(aFilename)
    end
  else
    LRWops := GetFileRWops(aFilename);

  if not Assigned(LRWops) then Exit;

  Result := Load(LRWops, aSize, aGlyphs);

end;

function TFont.LoadDefault(const aSize: Cardinal; const aGlyphs: string=''): Boolean;
const
  cResName = '0e194864c09445b6b7ba1afbdbc5aeda';
var
  LResStream: TResourceStream;
  LRWops: PSDL_RWops;
begin
  Result := False;

  if not ResourceExists(HInstance, cResName) then Exit;
  LResStream := TResourceStream.Create(HInstance, cResName, RT_RCDATA);
  try
    LResStream.Position := 0;
    LRWops := GetMemRWops(LResStream.Memory, LResStream.Size);
    if not Assigned(LRWops) then Exit;
    Result := Load(LRWops, aSize, aGlyphs);
  finally
    FreeNilObject(LResStream);
  end;
end;

procedure TFont.DrawText(const aX, aY: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const);
var
  LText: string;
  LChar: Integer;
  LGlyph: TGlyph;
  I, LLen: Integer;
  LX, LY: Single;
  LViewport: TRect;
  LWidth: Single;
  LTexRect: SDL_FRect;
begin
  LText := Format(aMsg, aArgs);
  LLen := LText.Length;

  LX := aX;
  LY := aY;

  LViewport := Game.Window.GetViewport;

  case aHAlign of
    haLeft:
      begin
      end;
    haCenter:
      begin
        LWidth := TextLength(aMsg, aArgs);
        LX := (LViewport.Width - LWidth)/2;
      end;
    haRight:
      begin
        LWidth := TextLength(aMsg, aArgs);
        LX := LViewport.Width - LWidth;
      end;
  end;

  SDL_SetTextureColorMod(FAtlas, aColor.Red, aColor.Green, aColor.BLue);
  SDL_SetTextureAlphaMod(FAtlas, aColor.Alpha);

  for I := 1 to LLen do
  begin
    LChar := Integer(Char(LText[I]));
    if FGlyph.TryGetValue(LChar, LGlyph) then
    begin
      LTexRect.x := LGlyph.SrcRect.x / FAtlasSize;
      LTexRect.y := LGlyph.SrcRect.y / FAtlasSize;
      LTexRect.w := LGlyph.SrcRect.w / FAtlasSize;
      LTexRect.h := LGlyph.SrcRect.h / FAtlasSize;

      LGlyph.DstRect.x := LGlyph.DstRect.x + LX;
      LGlyph.DstRect.y := LGlyph.DstRect.y + LY;

      if not FUseVertexBuffer then
        begin
          SDL_RenderCopyF(Game.Window.GetRendererHandle, FAtlas, @LGlyph.SrcRect, @LGlyph.DstRect)
        end
      else
        begin
          FGeometry.AddVertex(LGlyph.DstRect.x, LGlyph.DstRect.y, aColor, LTexRect.x, LTexRect.y);
          FGeometry.AddVertex(LGlyph.DstRect.x+LGlyph.DstRect.w, LGlyph.DstRect.y+LGlyph.DstRect.h, aColor, LTexRect.x+LTexRect.w, LTexRect.y+LTexRect.h);
          FGeometry.AddVertex(LGlyph.DstRect.x, LGlyph.DstRect.y+LGlyph.DstRect.h, aColor, LTexRect.x, LTexRect.y+LTexRect.h);

          FGeometry.AddVertex(LGlyph.DstRect.x, LGlyph.DstRect.y, aColor, LTexRect.x, LTexRect.y);
          FGeometry.AddVertex(LGlyph.DstRect.x+LGlyph.DstRect.w, LGlyph.DstRect.y, aColor, LTexRect.x+LTexRect.w, LTexRect.y);
          FGeometry.AddVertex(LGlyph.DstRect.x+LGlyph.DstRect.w, LGlyph.DstRect.y+LGlyph.DstRect.h, aColor, LTexRect.x+LTexRect.w, LTexRect.y+LTexRect.h);
        end;

      LX := LX + LGlyph.XAdvance;
    end;
  end;
end;

procedure TFont.DrawText(const aX: Single; var aY: Single; const aLineSpace: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const);
begin
  DrawText(aX, aY, aColor, aHAlign, aMsg, aArgs);
  aY := aY + FBaseLine + aLineSpace;
end;

function  TFont.TextLength(const aMsg: string; const aArgs: array of const): Single;
var
  LText: string;
  LChar: Integer;
  LGlyph: TGlyph;
  I, LLen: Integer;
  LWidth: Single;
begin
  LText := Format(aMsg, aArgs);
  LLen := LText.Length;

  LWidth := 0;

  for I := 1 to LLen do
  begin
    LChar := Integer(Char(LText[I]));
    if FGlyph.TryGetValue(LChar, LGlyph) then
    begin
      LWidth := LWidth + LGlyph.XAdvance;
    end;
  end;

  Result := LWidth;
end;

function  TFont.TextHeight: Single;
begin
  Result := FBaseLine;
end;

procedure TFont.RenderVertices(const aReset: Boolean);
begin
  if FUseVertexBuffer then
    FGeometry.Render(FAtlas, aReset);
end;

class operator THud.Initialize (out aDest: THud);
begin
  aDest.FTextItemPadWidth := 0;
end;

class operator THud.Finalize (var aDest: THud);
begin
end;

class procedure THud.ResetPos;
begin
  SetPos(Game.Settings.HudPosX, Game.Settings.HudPosY);
end;

class procedure THud.SetPos(const aX, aY: Integer);
begin
  FPos.X := aX;
  FPos.Y := aY;
end;

class procedure THud.SetLineSpace(const aLineSpace: Integer);
begin
  FPos.Z := aLineSpace;
end;

class procedure THud.SetTextItemPadWidth(const aWidth: Integer);
begin
  FTextItemPadWidth := aWidth;
end;

class procedure THud.Text(const aFont: TFont; const aColor: TColor; const aHAlign: THAlign; const aMsg: string; const aArgs: array of const);
begin
  aFont.DrawText(FPos.x, FPos.y, FPos.Z, aColor, aHAlign, aMsg, aArgs);
end;

class function  THud.TextItem(const aKey: string; const aValue: string; const aSeperator: string): string;
begin
  Result := Format('%s %s %s', [string(aKey).PadRight(FTextItemPadWidth, ' '), aSeperator, aValue]);
end;

procedure OnDecodeVideo(aPplm: pplm_t; aFrame: pplm_frame_t; aUserData: pointer); cdecl;
var
  LVideo: PVideo;
  pixels: Pointer;
  pitch: Integer;
begin
  LVideo := aUserData;
  if not Assigned(LVideo) then Exit;

  SDL_LockTexture(LVideo.FTexture, nil, @pixels, @pitch);
  plm_frame_to_rgb(aFrame, Pixels, Pitch);
  SDL_UnlockTexture(LVideo.FTexture);
end;

procedure OnDecodeAudio(aPlm: pplm_t; aSamples: pplm_samples_t;
  aUserData: Pointer); cdecl;
var
  LVideo: PVideo;
  LSize: Cardinal;
  LGainB: Double;
  LFactor: Double;
  LCount: Integer;
  LPtr: PSingle;
begin
  LVideo := aUserData;
  if not Assigned(LVideo) then Exit;

  LSize := SizeOf(Single) * aSamples.count * 2;
  LGainB := (EnsureRange(LVideo.FVolume, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGainB * 0.05);

  LCount := 0;
  LPtr := @aSamples.interleaved[0];
  while LCount < VIDEO_SAMPLEBUFFERSIZE do
  begin
    LPtr^ := EnsureRange(LPtr^ * LFactor, -1.0, 1.0);
    Inc(LPtr);
    Inc(LCount);
  end;

  SDL_QueueAudio(LVideo.FAudioDevice, @aSamples.interleaved[0], LSize);
end;

procedure OnLoadPlmBuffer(aBuffer: pplm_buffer_t; aUserData: pointer); cdecl;
var
  LVideo: PVideo;
  LBytesRead: NativeUInt;
begin
  LVideo := aUserData;
  if not Assigned(LVideo) then Exit;

  LBytesRead := LVideo.FRWops.read(LVideo.FRWops, @LVideo.FStaticPlmBuffer[0], PLM_BUFFER_DEFAULT_SIZE, 1);
  if LBytesRead > 0 then
    plm_buffer_write(aBuffer, @LVideo.FStaticPlmBuffer[0], PLM_BUFFER_DEFAULT_SIZE)
  else
    begin
      if LVideo.FLoop > 0 then
        Dec(LVideo.FLoop)
      else
        if LVideo.FLoop = 0 then
        begin
          LVideo.FStatus := vsStopped;
          LVideo.FStopFlag := True;
          Exit;
        end;

      if Assigned(LVideo.FPlm) then
      begin
        if LVideo.FAudioDevice <> 0 then
          SDL_ClearQueuedAudio(LVideo.FAudioDevice);

        if Assigned(LVideo.FRWops) then
          LVideo.FRWops.seek(LVideo.FRWops, 0, RW_SEEK_SET);

        plm_rewind(LVideo.FPlm);
      end;
    end;
end;

class procedure TVideo.DoVideoStatus(const aStatus: TVideoStatus;
  const aFilename: string);
begin
  if not Assigned(Game) then Exit;
  Game.OnVideoStatus(aStatus, aFilename);
end;

class operator TVideo.Initialize (out aDest: TVideo);
begin
end;

class operator TVideo.Finalize (var aDest: TVideo);
begin
end;

class function  TVideo.Load(const aArchive: TArchive; const aFilename: string): Boolean;
var
  LBuffer: pplm_buffer_t;
begin
  Result := False;

  Unload;

  if Assigned(aArchive) then
    begin
      if aArchive.IsOpen then
        FRWops := aArchive.OpenFileRWops(aFilename)
      else
        FRWops := GetFileRWops(aFilename);
    end
  else
    FRWops := GetFileRWops(aFilename);

  if FRWops = nil then Exit;

  LBuffer := plm_buffer_create_with_capacity(PLM_BUFFER_DEFAULT_SIZE);
  plm_buffer_set_load_callback(LBuffer, OnLoadPlmBuffer, @Game.Video);
  FPlm := plm_create_with_buffer(LBuffer, Ord(SDL_True));

  plm_set_audio_enabled(FPlm, Ord(SDL_True));
  plm_set_audio_stream(FPlm, 0);
  plm_set_loop(FPlm, Ord(SDL_False));

  FAudioSampleRate := plm_get_samplerate(FPlm);

  FillChar(FAudioSpec, sizeof(FAudioSpec), 0);
  FAudioSpec.freq := FAudioSampleRate;
  FAudioSpec.format := AUDIO_F32;
  FAudioSpec.channels := 2;
  FAudioSpec.samples := VIDEO_SAMPLEBUFFERSIZE;
  FAudioDevice := SDL_OpenAudioDevice(nil, 0, @FAudioSpec, nil, 0);
  SDL_PauseAudioDevice(FAudioDevice, 0);
  plm_set_audio_lead_time(FPlm, (FAudioSpec.samples*FAudioSpec.channels)/FAudioSampleRate);

  FWidth := plm_get_width(FPlm);
  FHeight := plm_get_height(FPlm);
  FVolume := 1.0;

  FTexture := SDL_CreateTexture(Game.Window.GetRendererHandle, Ord(SDL_PIXELFORMAT_RGB24), Ord(SDL_TEXTUREACCESS_STREAMING), FWidth, FHeight);
  if not Assigned(FTexture) then
    begin
    Unload;
    Exit;
  end;

  plm_set_video_decode_callback(FPlm, OnDecodeVideo, @Game.Video);
  plm_set_audio_decode_callback(FPlm, OnDecodeAudio, @Game.Video);

  FFilename := aFilename;
  FStatus := vsStopped;

  Result := True;
end;

class procedure TVideo.Unload;
begin

  if FAudioDevice > 0 then SDL_CloseAudioDevice(FAudioDevice);
  if Assigned(FPlm) then plm_destroy(FPlm);
  if Assigned(FTexture) then SDL_DestroyTexture(FTexture);
  if Assigned(FRWops) then FRWops.close(FRWops);

  FillChar(FAudioSpec, SizeOf(FAudioSpec), 0);
  FAudioDevice := 0;
  FAudioSampleRate := 0;
  FRWops := nil;
  FPlm := nil;
  FillChar(FStaticPlmBuffer, SizeOf(FStaticPlmBuffer), 0);
  FTexture := nil;
  FWidth := 0;
  FHeight := 0;
  FVolume := 0;
  FFrameRate := 0;
  FStatus := vsStopped;
  FStopFlag := False;
  FLoop := 0;
  FFilename := '';
end;

class procedure TVideo.Play(const aVolume: Single; const aLoop: Integer);
begin
  if FFilename.IsEmpty then Exit;

  FVolume := aVolume;
  FLoop := aLoop;
  FStatus := vsPlaying;
  DoVideoStatus(FStatus, FFilename);
end;

class procedure TVideo.LoadPlay(const aArchive: TArchive; const aFilename: string; const aVolume: Single; const aLoop: Integer);
begin
  if Load(aArchive, aFilename) then
  begin
    Play(aVolume, aLoop);
  end;
end;

class procedure TVideo.Pause(const aPause: Boolean);
begin
  if FFilename.IsEmpty then Exit;
  if aPause then
    FStatus := vsPaused
  else
    FStatus := vsPlaying;
  DoVideoStatus(FStatus, FFilename);
end;

class procedure TVideo.Stop;
begin
  if FFilename.IsEmpty then Exit;
  Rewind;
  FStatus := vsStopped;
  DoVideoStatus(FStatus, FFilename);
end;

class procedure TVideo.Rewind;
begin
  if FFilename.IsEmpty then Exit;

  if not Assigned(FPlm) then Exit;
  if not Assigned(FRWops) then Exit;

  plm_rewind(FPlm);
  FRWops.seek(FRWops, 0, RW_SEEK_SET);
  SDL_ClearQueuedAudio(FAudioDevice);
end;

class function  TVideo.GetStatus: TVideoStatus;
begin
  Result := FStatus;
end;

class function  TVideo.GetWidth: Cardinal;
begin
  Result := FWidth;
end;

class function  TVideo.GetHeight: Cardinal;
begin
  Result := FHeight;
end;

class function  TVideo.GetFrameRate: Single;
begin
  Result := FFrameRate;
end;

class function  TVideo.GetVolume: Single;
begin
  Result := FVolume;
end;

class procedure TVideo.SetVolume(const aVolume: Single);
begin
  FVolume := aVolume;
end;

class procedure TVideo.Update(const aDeltaTime: Double);
begin
  if FStopFlag then
  begin
    FStopFlag := False;
    DoVideoStatus(FStatus, FFilename);
    Exit;
  end;

  if FStatus <> vsPlaying then Exit;
  if not Assigned(FPlm) then Exit;
  plm_decode(FPlm, aDeltaTime);
end;

class procedure TVideo.Draw(const aX, aY, aScale: Single);
var
  LRect: SDL_FRect;
begin
  if not Assigned(FTexture) then Exit;
  if FStatus <> vsPlaying then Exit;

  LRect.X := aX;
  LRect.Y := aY;
  LRect.w := FWidth *  aScale;
  LRect.h := FHeight * aScale;

  SDL_RenderCopyF(Game.Window.GetRendererHandle, FTexture, nil, @LRect);
end;



{$ENDREGION}

{$REGION ' DelphiGamekit.Network '}
{$ENDREGION}

{$REGION ' DelphiGamekit.Audio '}
type
  TSpeechCallbacks = class
  public
    procedure OnWord(aSender: TObject; aStreamNumber: Integer;
      aStreamPosition: OleVariant; aCharacterPosition, aLength: Integer);
  end;

procedure TSpeechCallbacks.OnWord(aSender: TObject; aStreamNumber: Integer;
  aStreamPosition: OleVariant; aCharacterPosition, aLength: Integer);
begin
  TSpeech.OnWord(aSender, aStreamNumber, aStreamPosition, aCharacterPosition,
  aLength)
end;

class procedure TSpeech.OnWord(aSender: TObject; aStreamNumber: Integer;
  aStreamPosition: OleVariant; aCharacterPosition, aLength: Integer);
var
  LWord: string;
begin
  if FText.IsEmpty then Exit;
  LWord := FText.Substring(aCharacterPosition, aLength);
  if not FSubList.TryGetValue(LWord, FWord) then
    FWord := LWord;
  Game.OnSpeechWord(FWord, FText);
end;

class procedure TSpeech.DoSpeak(const aText: string; const aFlags: Integer);
begin
  if FSpVoice = nil then Exit;
  if aText.IsEmpty then Exit;
  if FPaused then Resume;
  FSpVoice.Speak(aText, aFlags);
  FText := aText;
end;

class procedure TSpeech.EnumVoices;
var
  LI: Integer;
  LSOToken: ISpeechObjectToken;
  LSOTokens: ISpeechObjectTokens;
begin
  FVoiceList := TInterfaceList.Create;
  FVoiceDescList := TStringList.Create;
  LSOTokens := FSpVoice.GetVoices('', '');
  for LI := 0 to LSOTokens.Count - 1 do
  begin
    LSOToken := LSOTokens.Item(LI);
    FVoiceDescList.Add(LSOToken.GetDescription(0));
    FVoiceList.Add(LSOToken);
  end;
end;

class procedure TSpeech.FreeVoices;
begin
  FreeAndNil(FVoiceDescList);
  FreeAndNil(FVoiceList);
end;

class operator TSpeech.Initialize (out aDest: TSpeech);
begin
  aDest.FPaused := False;
  aDest.FText := '';
  aDest.FWord := '';
  aDest.FVoice := 0;
  aDest.FSpVoice := TSpVoice.Create(nil);
  aDest.FSpVoice.EventInterests := SVEAllEvents;
  aDest.EnumVoices;
  aDest.FCallbacks := TSpeechCallbacks.Create;
  aDest.FSpVoice.OnWord := TSpeechCallbacks(FCallbacks).OnWord;
  aDest.FSubList := TDictionary<string, string>.Create;
end;

class operator TSpeech.Finalize (var aDest: TSpeech);
begin
  FreeVoices;
  aDest.FSpVoice.OnWord := nil;
  aDest.FSpVoice.Free;
  FreeAndNil(aDest.FSubList);
  FreeAndNil(aDest.FCallbacks);
end;

class function  TSpeech.GetVoiceCount: Integer;
begin
  Result := FVoiceList.Count;
end;

class function  TSpeech.GetVoiceAttribute(const aIndex: Integer;
  const aAttribute: TSpeechVoiceAttribute): string;
var
  LSOToken: ISpeechObjectToken;

  function GetAttr(aItem: string): string;
  begin
    if aItem = 'Id' then
      Result := LSOToken.Id
    else
      Result := LSOToken.GetAttribute(aItem);
  end;

begin
  Result := '';
  if (aIndex < 0) or (aIndex > FVoiceList.Count - 1) then
    Exit;
  LSOToken := ISpeechObjectToken(FVoiceList.Items[aIndex]);
  case aAttribute of
    svaDescription: Result := FVoiceDescList[aIndex];
    svaName       : Result := GetAttr('Name');
    svaVendor     : Result := GetAttr('Vendor');
    svaAge        : Result := GetAttr('Age');
    svaGender     : Result := GetAttr('Gender');
    svaLanguage   : Result := GetAttr('Language');
    svaId         : Result := GetAttr('Id');
  end;
end;

class procedure TSpeech.ChangeVoice(const aIndex: Integer);
var
  LSOToken: ISpeechObjectToken;
begin
  if (aIndex < 0) or (aIndex > FVoiceList.Count - 1) then Exit;
  if aIndex = FVoice then Exit;
  LSOToken := ISpeechObjectToken(FVoiceList.Items[aIndex]);
  FSpVoice.Voice := LSOToken;
  FVoice := aIndex;
end;

class function  TSpeech.GetVoice: Integer;
begin
  Result := FVoice;
end;

class procedure TSpeech.SetVolume(const aVolume: Single);
var
  LVolume: Integer;
begin
  if FSpVoice = nil then Exit;
  LVolume := Round(UnitToScalarValue(aVolume, 100));
  FSpVoice.Volume := LVolume;
end;

class function  TSpeech.GetVolume: Single;
begin
  Result := 0;
  if FSpVoice = nil then Exit;
  Result := FSpVoice.Volume / 100.0;
end;

class procedure TSpeech.SetRate(const aRate: Single);
var
  LVolume: Integer;
  LRate: Single;
begin
  if FSpVoice = nil then Exit;

  LRate := EnsureRange(aRate, 0, 1);
  LVolume := Round(20.0 * LRate) - 10;

  if LVolume < -10 then
    LVolume := -10
  else if LVolume > 10 then
    LVolume := 10;

  FSpVoice.Rate := LVolume;
end;

class function  TSpeech.GetRate: Single;
begin
  Result := 0;
  if FSpVoice = nil then Exit;
  Result := (FSpVoice.Rate + 10.0) / 20.0;
end;

class procedure TSpeech.Clear;
begin
  if FSpVoice = nil then Exit;
  if Active then
  begin
    FSpVoice.Skip('Sentence', MaxInt);
    Say(' ', True);
  end;
  FText := '';
end;

class procedure TSpeech.Say(const aText: string; const aPurge: Boolean);
var
  LFlag: Integer;
  LText: string;
begin
  LFlag := SVSFlagsAsync;
  LText := aText;
  if aPurge then
    LFlag := LFlag or SVSFPurgeBeforeSpeak;
  DoSpeak(LText, LFlag);
end;

class function  TSpeech.Active: Boolean;
begin
  Result := False;
  if FSpVoice = nil then Exit;
  Result := Boolean(FSpVoice.Status.RunningState <> SRSEDone);
end;

class procedure TSpeech.Pause;
begin
  if FSpVoice = nil then Exit;
  FSpVoice.Pause;
  FPaused := True;
end;

class procedure TSpeech.Resume;
begin
  if FSpVoice = nil then Exit;
  FSpVoice.Resume;
  FPaused := False;
end;

class procedure TSpeech.Reset;
begin
  Clear;
end;

class procedure TSpeech.SubstituteWord(const aWord: string;
  const aSubstituteWord: string);
var
  LWord: string;
  LSubstituteWord: string;
begin
  LWord := aWord;
  LSubstituteWord := aSubstituteWord;
  if LWord.IsEmpty then Exit;
  if LSubstituteWord.IsEmpty then Exit;
  FSubList.AddOrSetValue(LWord, LSubstituteWord);
end;

class operator TAudio.Initialize (out aDest: TAudio);
begin
end;

class operator TAudio.Finalize (var aDest: TAudio);
begin
end;

class function  TAudio.LoadMusic(const aArchive: TArchive; const aFilename: string; const aUseBuffer: Boolean): TMusic;
var
  LBuffer: TBuffer;
begin
  Result := nil;
  if Assigned(aArchive) then
    begin
      if aArchive.IsOpen then
      begin
        if aUseBuffer then
          begin
            LBuffer := aArchive.OpenFileBuffer(aFilename);
            if not Assigned(LBuffer) then Exit;
            Result := Mix_LoadMUS_RW(GetMemRWops(LBuffer.Memory, LBuffer.Size), Ord(SDL_True));
            if not Assigned(Result) then
            begin
              FreeNilObject(LBuffer);
              Exit;
            end;
            FMusicBuffer := LBuffer;
          end
        else
          begin
            Result := Mix_LoadMUS_RW(aArchive.OpenFileRWops(aFilename), Ord(SDL_True))
          end;
      end;
    end
  else
    Result := Mix_LoadMUS_RW(GetFileRWops(aFilename), Ord(SDL_True));
end;

class function  TAudio.LoadPlayMusic(const aArchive: TArchive; const aFilename: string; const aVolume: Single; const aLoop: Integer; const aUseBuffer: Boolean=False): TMusic;
begin
  Result := LoadMusic(aArchive, aFilename, aUseBuffer);
  PlayMusic(Result, aVolume, aLoop);
end;

class procedure TAudio.UnloadMusic(var aMusic: TMusic);
begin
  if Assigned(aMusic) then
  begin
    Mix_FreeMusic(aMusic);
    aMusic := nil;

    if Assigned(FMusicBuffer) then
      FreeNilObject(FMusicBuffer);
  end;
end;

class function  TAudio.PlayMusic(const aMusic: TMusic; const aVolume: Single;
  const aLoop: Integer): Boolean;
begin
  Result := False;
  if not Assigned(aMusic) then Exit;
  Result := Boolean(Mix_PlayMusic(aMusic, aLoop) = 0);
  if Result then
    SetMusicVolume(aVolume);
end;

class function  TAudio.GetMusicVolume(const aMusic: TMusic): Single;
var
  LVolume: Integer;
begin
  Result := 0;
  if not Assigned(aMusic) then Exit;
  LVolume := Mix_GetMusicVolume(aMusic);
  Result :=  LVolume / MIX_MAX_VOLUME;
end;

class procedure TAudio.SetMusicVolume(const aVolume: Single);
begin
  Mix_VolumeMusic(Round(UnitToScalarValue(aVolume, MIX_MAX_VOLUME)));
end;


class function  TAudio.LoadSound(const aArchive: TArchive; const aFilename: string): TSound;
begin
  Result := nil;
  if Assigned(aArchive) then
    begin
      if aArchive.IsOpen then
        Result := Mix_LoadWAV_RW(aArchive.OpenFileRWops(aFilename), Ord(SDL_True))
    end
  else
    Result := Mix_LoadWAV_RW(GetFileRWops(aFilename), Ord(SDL_True));
end;

class procedure TAudio.UnloadSound(var aSound: TSound);
begin
  if Assigned(aSound) then
  begin
    Mix_FreeChunk(aSound);
    aSound := nil;
  end;
end;

class procedure TAudio.AllocateSoundChannels(const aCount: Integer);
var
  LCount: Integer;
begin
  LCount := EnsureRange(aCount, 1, AUDIO_CHANNEL_MAX);
  Mix_AllocateChannels(LCount);
end;

class procedure TAudio.ReserveSoundChannels(const aCount: Integer);
var
  LCount: Integer;
begin
  LCount := EnsureRange(aCount, 0, Mix_AllocateChannels(-1));
  Mix_ReserveChannels(LCount);
end;

class function  TAudio.PlaySound(const aSound: TSound; const aChannel: Integer;
  const aVolume: Single; const aLoops: Integer): Integer;
begin
  Result := Mix_PlayChannel(aChannel, aSound, aLoops);
  SetSoundVolume(Result, aVolume);
end;

class function  TAudio.FadeInSound(const aSound: TSound; const aChannel: Integer;
  const aVolume: Single; const aLoops: Integer;
  const aMilliseconds: Integer): Integer;
begin
  Result := Mix_FadeInChannel(aChannel, aSound, aLoops, aMilliseconds);
  SetSoundVolume(Result, aVolume);
end;

class procedure TAudio.FadeOutSound(const aChannel: Integer;
  const aMilliseconds: Integer);
begin
  Mix_FadeOutChannel(aChannel, aMilliseconds);
end;

class function  TAudio.FadingSound(const aChannel: Integer): TAudioFading;
begin
  Result := TAudioFading(Mix_FadingChannel(aChannel));
end;

class procedure TAudio.StopSound(const aChannel: Integer);
begin
  Mix_HaltChannel(aChannel);
end;

class function  TAudio.IsSoundPlaying(const aChannel: Integer): Boolean;
begin
  if Mix_Playing(aChannel) > 0 then
    Result := True
  else
    Result := False;
end;

class procedure TAudio.SetSoundVolume(const aChannel: Integer; const aVolume: Single);
begin
  Mix_Volume(aChannel, Round(UnitToScalarValue(aVolume, MIX_MAX_VOLUME)));
end;

class function  TAudio.GetSoundVolume(const aChannel: Integer): Single;
var
  LVol: Integer;
begin
  LVol := Mix_Volume(aChannel, -1);
  Result := (LVol / MIX_MAX_VOLUME);
end;

class procedure TAudio.PauseSound(const aChannel: Integer);
begin
  Mix_Pause(aChannel);
end;

class procedure TAudio.ResumeSound(const aChannel: Integer);
begin
  Mix_Resume(aChannel);
end;

class function  TAudio.IsSoundPaused(const aChannel: Integer): Boolean;
begin
  if Mix_Paused(aChannel) > 0 then
    Result := True
  else
    Result := False;
end;

class procedure TAudio.ExpireSound(const aChannel: Integer;
  const aMilliseconds: Integer);
begin
  Mix_ExpireChannel(aChannel, aMilliseconds);
end;

class function  TAudio.SetSoundPosition(const aChannel: Integer;
  const aAngle: SmallInt; const aDistance: Byte): Boolean;
begin
  Result := Boolean(Mix_SetPosition(aChannel, aAngle, aDistance) <> 0);
end;

{$ENDREGION}

{$REGION ' DelphiGamekit.Game '}
procedure RunGame(const aGame: TGameClass);
var
  LGame: TGame;
  LMsg: string;
begin
  if not IsSingleInstance(TPath.GetFileName(ParamStr(0)) + ' - DG_App') then
  begin
    LMsg := 'An instance of the application is already running, terminating!';
    if HasConsoleOutput then
      begin
        PrintLn(LMsg);
        Pause;
      end
    else
      MessageBox(0, PChar(LMsg), 'Hold up!', MB_OK);
    Exit;
  end;

  try
    LGame := Game;
    try
      Game := aGame.Create;
      try
        Game.Run;
      finally
        FreeNilObject(Game);
      end;
    finally
      Game := LGame;
    end;
  except
    on E: Exception do
    begin
      MessageBox(0, PChar(Format('%s: %s', [E.ClassName, E.Message])), 'Fatal Error', MB_OK);
    end;
  end;
end;

constructor TGame.Create;
begin
  inherited;
end;

destructor TGame.Destroy;
begin
  inherited;
end;

procedure TGame.Shutdown;
begin
  FreeNilObject(FArchive);
  Mix_CloseAudio;
  Mix_Quit;
  SDL_Quit;
end;

function  TGame.SDKVersion: string;
begin
  Result := Format('%s.%s.%s', [VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH]);
end;

function  TGame.Settings: PSettings;
begin
  Result := @FSettings;
end;

function TGame.Startup: Boolean;
begin
  Result := False;


  SDL_SetHint(SDL_HINT_VIDEO_HIGHDPI_DISABLED, '0');

  SDL_SetHint(SDL_HINT_WINDOWS_DPI_AWARENESS, '1');
  SDL_SetHint(SDL_HINT_WINDOWS_DPI_SCALING, '1');
  SDL_SetHint(SDL_HINT_WINDOWS_USE_D3D9EX, '1');

  SDL_SetHint(SDL_HINT_RENDER_LINE_METHOD, '3');
  SDL_SetHint(SDL_HINT_RENDER_DIRECT3D_THREADSAFE, '1');
  SDL_SetHint(SDL_HINT_RENDER_LOGICAL_SIZE_MODE, '0');
  SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, '2' );
  SDL_SetHint(SDL_HINT_RENDER_BATCHING, '1');
  SDL_SetHint(SDL_HINT_RENDER_DRIVER, 'direct3d');

  if SDL_Init(SDL_INIT_EVERYTHING) <> 0 then Exit;
  if Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 2048) <> 0 then Exit;

  FArchive := TArchive.Create;
  if not Assigned(FArchive) then Exit;

  Result := True;
end;

procedure TGame.Process;
var
  LEvent: SDL_Event;

  procedure UpdateFrame;
  begin
    Timer.Update;

    OnClearWindow;

    OnRender;

    FWindow.ShowRenderTarget;

    OnRenderHud;

    OnShowWindow;
  end;

begin
  OnLoadConfig;
  try
    try
      OnSetSettings;
      if not OnApplySettings then Exit;
      if not FWindow.IsOpen then Exit;

      OnStartup;
      try
        FInput.Open;
        try
          FReady := False;
          FTerminate := False;

          while not FTerminate do
          begin
            while SDL_PollEvent(@LEvent) = Ord(SDL_True) do
            begin
              case LEvent.type_ of
                Ord(SDL_QUIT_):
                begin
                  FTerminate := True;
                end;

                Ord(SDL_WINDOWEVENT_):
                begin
                  case LEvent.window.event of
                    Ord(SDL_WINDOWEVENT_MOVED),
                    Ord(SDL_WINDOWEVENT_RESIZED),
                    Ord(SDL_WINDOWEVENT_SIZE_CHANGED):
                    begin
                      Timer.Reset;
                    end;

                    Ord(SDL_WINDOWEVENT_HIDDEN),
                    Ord(SDL_WINDOWEVENT_MINIMIZED),
                    Ord(SDL_WINDOWEVENT_FOCUS_LOST):
                    begin
                      FReady := False;
                      Mix_Pause(-1);
                      Mix_PauseMusic;
                      OnReady(FReady);
                    end;

                    Ord(SDL_WINDOWEVENT_EXPOSED),
                    Ord(SDL_WINDOWEVENT_MAXIMIZED),
                    Ord(SDL_WINDOWEVENT_RESTORED),
                    Ord(SDL_WINDOWEVENT_FOCUS_GAINED):
                      begin
                        FReady := True;
                        Mix_Resume(-1);
                        Mix_ResumeMusic;
                        OnReady(FReady);
                        Timer.Reset;
                      end;
                  end;
                end;
              end;

              FInput.Update(@LEvent);
            end;

            if Settings.WindowUpdateOnLostFocus then
              begin
                UpdateFrame;
              end
            else
              begin
                if FReady then
                  begin
                    UpdateFrame;
                  end
                else
                  begin
                    SDL_Delay(1);
                  end;
              end;
          end;
          FVideo.Unload;
        finally
          FInput.Close;
        end;
      finally
        OnShutdown;
      end;
    finally
      OnUnapplySettings;
    end;
  finally
    OnSaveConfig;
  end;

end;

procedure TGame.Run;
begin
  try
    if not Startup then Exit;
    Process;
  finally
    Shutdown;
  end;
end;

procedure TGame.OnSetSettings;
begin
  Settings.OrgName := 'tinyBigGAMES';
  Settings.AppName := 'DelphiGamekit';

  Settings.LogToConsole := True;

  Settings.ArchivePassword := '';
  Settings.ArchiveFilename := '';

  Settings.WindowTitle := 'DelphiGamekit';
  Settings.WindowPosX := -1;
  Settings.WindowPosY := -1;
  Settings.WindowWidth := WINDOW_WIDTH;
  Settings.WindowHeight := WINDOW_HEIGHT;
  Settings.WindowClearColor := DARKSLATEBROWN;
  Settings.WindowUpdateOnLostFocus := False;

  Settings.DefaultFontSize := 9;
  Settings.DefaultFontGlyphs := '';

  Settings.HudTextItemPadWidth := 10;
  Settings.HudPosX := 3;
  Settings.HudPosY := 3;
  Settings.HudLineSpace := 0;

  Settings.AllocateSoundChannels := AUDIO_CHANNEL_MAX;
  Settings.ReserveSoundChannels := 1;

  Settings.TimerUpdateRate := 60;
  Settings.TimerFixedUpdateRate := 1;
end;

function TGame.OnApplySettings: Boolean;
begin
  Result := False;

  Prefs.SetOrgName(Settings.OrgName);
  Prefs.SetAppName(Settings.AppName);

  if not Log.Open then Exit;
  Log.SetConsoleOutput(Settings.LogToConsole);
  Log.Add('Startup DelphiGame™ v%s', [SDKVersion]);

  Archive.Open(Settings.ArchivePassword, Settings.ArchiveFilename);

  if not Window.Open(Settings.WindowTitle, Settings.WindowPosX, Settings.WindowPosY, Settings.WindowWidth, Settings.WindowHeight) then Exit;

  FDefaultFont := TFont.Create;
  FDefaultFont.LoadDefault(Settings.DefaultFontSize, Settings.DefaultFontGlyphs);

  Hud.SetPos(FSettings.HudPosX, FSettings.HudPosY);
  Hud.SetLineSpace(FSettings.HudLineSpace);
  Hud.SetTextItemPadWidth(FSettings.HudTextItemPadWidth);

  Audio.AllocateSoundChannels(Settings.AllocateSoundChannels);
  Audio.ReserveSoundChannels(Settings.ReserveSoundChannels);

  Timer.Reset(Settings.TimerUpdateRate, Settings.TimerFixedUpdateRate);

  Result := True;
end;

procedure TGame.OnUnapplySettings;
begin

  FreeNilObject(FDefaultFont);

  Window.Close;

  Archive.Close;

  Log.Close;

end;

procedure TGame.OnLoadConfig;
begin
end;

procedure TGame.OnSaveConfig;
begin
end;

procedure TGame.OnStartup;
begin
end;

procedure TGame.OnShutdown;
begin
end;

procedure TGame.OnReady(const aReady: Boolean);
begin
  if aReady then
    PrintLn('Ready...')
  else
    PrintLn('Not ready...')
end;

procedure TGame.OnUpdate(const aDeltaTime: Double);
begin
  if FInput.KeyPressed(KEY_ESCAPE) then
    Terminate := True;
end;

procedure TGame.OnFixedUpdate(const aFixedUpdateSpeed: Single);
begin
end;

procedure TGame.OnClearWindow;
begin
  Window.Clear(Settings.WindowClearColor);
end;

procedure TGame.OnShowWindow;
begin
  Window.Show;
end;

procedure TGame.OnRender;
begin
end;

procedure TGame.OnRenderHud;
begin
  Hud.ResetPos;
  Hud.Text(FDefaultFont, WHITE, haLeft  , 'fps %d', [Timer.FrameRate]);
  Hud.Text(FDefaultFont, GREEN, haLeft, Hud.TextItem('ESC', 'Quit'), []);
end;

procedure TGame.OnBuildArchiveProgress(const aFilename: string; const aProgress: Cardinal; const aNewFile: Boolean);
begin
  if aNewFile then PrintLn;
  Print(#13'Adding %s(%d%s)...', [aFilename, aProgress, '%']);
end;

procedure TGame.OnSpeechWord(const aWord, aText: string);
begin
  PrintLn(aWord);
end;

procedure TGame.OnVideoStatus(const aStatus: TVideoStatus; const aFilename: string);
begin
  case aStatus of
    vsStopped: PrintLn('Video "%s" stopped', [aFilename]);
    vsPlaying: PrintLn('Video "%s" playing', [aFilename]);
    vsPaused : PrintLn('Video "%s" paused', [aFilename]);
  end;

end;

{$ENDREGION}

{$REGION ' Unit Init Section '}
initialization
begin
  ReportMemoryLeaksOnShutdown := True;
  LoadDLL;
  SystemStartup;
end;

finalization
begin
  SystemShutdown;
  UnloadDLL;
end;
{$ENDREGION}

end.
