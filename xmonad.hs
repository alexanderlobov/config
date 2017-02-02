import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Layout.NoBorders (smartBorders)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = shorten 80
                        }
        , modMask = mod4Mask
        , borderWidth = 2
        , terminal = "xterm"
        }
        `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((controlMask, xK_F10), spawn "amixer -D pulse set Master toggle")
        , ((controlMask, xK_F11), spawn "amixer set Master 1-")
        , ((controlMask, xK_F12), spawn "amixer set Master 1+")
        ]

myManageHook = composeAll
    [ isFullscreen --> doFullFloat
    ]
