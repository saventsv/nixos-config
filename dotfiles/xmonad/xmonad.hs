import XMonad
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Actions.Submap
import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W


import qualified Data.Map as M


myLayoutHook = avoidStruts $ spacingWithEdge 3 $ Full

myKeys = 
 [ ("M-<Return>", spawn "alacritty") 
 , ("M1-<Space>", spawn "dmenu_run") 
 , ("M-s", spawn "/home/saven/nixos-config/dotfiles/scripts/dmenu-sessions.sh") 
 , ("M-f", spawn "rofi -show window") 
 , ("M-v", spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+") 
 , ("M-S-v", spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-") 
 , ("M-b", spawn "brightnessctl set +5%") 
 , ("M-S-b", spawn "brightnessctl set 5%-") 
 , ("M-S-r", spawn "xmonad --recompile" >> spawn "xmonad --restart") 
 , ("M-q", kill) 
 , ("M-S-q", spawn "/home/saven/nixos-config/dotfiles/scripts/power-menu.sh") 
 , ("M-<Space>", 
      submap. M.fromList $
      [ ((0, xK_f), spawn "firefox")
      , ((0, xK_p), spawn "keepassxc")
      , ((0, xK_s), spawn "flameshot gui")
      , ((0, xK_w), spawn "/home/saven/nixos-config/dotfiles/scripts/wifi.sh")
      , ((0, xK_b), spawn "/home/saven/nixos-config/dotfiles/scripts/wallpapers.sh")
      ]
 )
 ]

myStartupHook :: X()

myStartupHook = do
  spawnOnce "picom"
  spawnOnce "polybar"
  spawnOnce "feh --bg-fill --randomize /home/saven/Pictures/wallpapers"

main = xmonad $ ewmh $ docks def 
  { modMask = mod4Mask
  , terminal = "alacritty"
  , borderWidth = 2
  , normalBorderColor = "#1E2326"
  , focusedBorderColor = "#A7C080"
  , layoutHook = myLayoutHook
  , manageHook = manageDocks <+> manageHook def
  , startupHook = myStartupHook
  }
  `removeKeysP`
    [ "M-j"
    , "M-k"
    , "M-S-j"
    , "M-S-k"
    ]
    `additionalKeysP`
    [ ("M-h", windows W.focusUp)
    , ("M-l", windows W.focusDown)

    , ("M-j", windows W.swapUp)
    , ("M-k", windows W.swapDown)
    ]
  `additionalKeysP` myKeys
