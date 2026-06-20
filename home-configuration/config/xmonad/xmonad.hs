import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition
import qualified XMonad.StackSet as W

myLayoutHook = avoidStruts $ spacingWithEdge 3 $ layoutHook def

myXmobarPP :: PP
myXmobarPP = def
  {
    ppCurrent = xmobarColor "#0db9d7" "",
    ppHidden = xmobarColor "#a9b1d6" "",
    ppHiddenNoWindows = xmobarColor "#444b6a" ""
  }

myStatusBar = statusBarPropTo "_XMONAD_LOG" "xmobar -x 1" (pure myXmobarPP)

myManageHook = insertPosition End Newer

myKeys =
  [
    ("M-<Return>", spawn "alacritty"),
    ("M-r", spawn "rofi -show drun"),
    ("M-S-r", spawn "xmonad --recompile" >> spawn "xmonad --restart"),
    ("M-s", kill),
    ("M-S-s", spawn "/home/coast/.local/bin/screenshot"),
    ("M-f", withFocused $ \w -> windows $ W.float w (W.RationalRect 0 0 1 1)),
    ("M-S-f", withFocused (windows . W.sink))
  ]

main = xmonad $ withEasySB myStatusBar defToggleStrutsKey $ def
  {
    modMask = mod4Mask,
    terminal = "alacritty",
    borderWidth = 2,
    normalBorderColor = "#444b6a",
    focusedBorderColor = "#ad8ee6",
    layoutHook = myLayoutHook,
    manageHook = myManageHook
  }
  `additionalKeysP` myKeys
