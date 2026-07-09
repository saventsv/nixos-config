import XMonad
import XMonad.ManageHook
import XMonad.Layout.MultiToggle
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.MultiToggle.Instances
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad
import XMonad.Actions.Submap
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W


import qualified Data.Map as M

centerFloat :: ManageHook
centerFloat =
    customFloating $
        W.RationalRect
            0.15   -- x
            0.10   -- y
            0.70   -- width
            0.80   -- height


-- myLayoutHook = avoidStruts $ spacingWithEdge 5 $ Full
-- myLayoutHook =
--     avoidStruts $
--     spacingWithEdge 3 $
--     mkToggle (single FULL) $ Full ||| Tall 1 (3/100) (1/2)
-- myLayoutHook =
--     toggleLayouts Full $
--     avoidStruts $
--     spacingWithEdge 3 $
--     Tall 1 (3/100) (1/2)

myLayoutHook =
    avoidStruts $
    spacingWithEdge 3 $
    toggleLayouts (Tall 1 (3/100) (1/2)) $
    Full
    

myManageHook = insertPosition Below Newer <+> manageDocks <+> manageHook def
myScratchpads :: [NamedScratchpad]
myScratchpads = 
  [ NS "passwords"
    "keepassxc"
    (className =? "KeePassXC")
    centerFloat
  , NS "discord"
    "vesktop"
    (className =? "vesktop")
    centerFloat
  ]

myKeys = 
 [ ("M-<Return>", spawn "alacritty") 
 , ("M1-<Space>", spawn "dmenu_run") 
 , ("M-s", spawn "/home/saven/nixos-config/dotfiles/scripts/dmenu-sessions.sh") 
 , ("M-f", spawn "rofi -show window") 
 , ("M-v", spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+") 
 , ("M-S-v", spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-") 
 , ("M-b", spawn "brightnessctl set +5%") 
 , ("M-S-b", spawn "brightnessctl set 5%-") 
 , ("M-S-r", spawn "xmonad --restart") 
 , ("M-C-l", nextScreen) 
 , ("M-C-h", prevScreen) 
 , ("M-q", kill) 
 -- , ("M-t", sendMessage $ Toggle FULL)
 , ("M-t", sendMessage ToggleLayout)
 , ("M-S-q", spawn "/home/saven/nixos-config/dotfiles/scripts/power-menu.sh") 
 , ("M-<Space>", 
      submap. M.fromList $
      [ ((0, xK_f), spawn "firefox")
      , ((0, xK_p), namedScratchpadAction myScratchpads "passwords")
      , ((0, xK_d), namedScratchpadAction myScratchpads "discord")
      , ((0, xK_s), spawn "flameshot gui")
      -- , ((0, xK_t), sendMessage $ Toggle FULL)
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
  spawnOnce "firefox"
  spawnOnce "gammastep -O 5000"

main = xmonad $ ewmh $ docks def 
  { modMask = mod4Mask
  , terminal = "st"
  , borderWidth = 3
  , normalBorderColor = "#1E2326"
  , focusedBorderColor = "#A7C080"
  , layoutHook = myLayoutHook
  , manageHook = myManageHook <+> namedScratchpadManageHook myScratchpads
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

    , ("M-j", windows W.swapDown)
    , ("M-k", windows W.swapUp)
    ]
  `additionalKeysP` myKeys
