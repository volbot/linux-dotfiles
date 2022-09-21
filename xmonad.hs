import XMonad
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Config.Desktop
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.IndependentScreens
import XMonad.Layout.Spiral(spiral)
import XMonad.Util.Cursor

main::IO()
main = do xmonad $ docks $ ewmh $ myConf
 where
  myBar = "polybar"

myStartupHook = do
 setWMName "LG3D"
 setDefaultCursor xC_left_ptr

myLayout = spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True $ avoidStruts $ mkToggle (NBFULL ?? NOBORDERS ?? EOT ) $ tiled ||| Mirror tiled ||| spiral (6/7) ||| ThreeColMid 1 (3/100) (1/2) ||| Full
 where
  tiled = Tall nmaster delta tiled_ratio
  nmaster = 1
  delta = 3/100
  tiled_ratio = 1/2

myKeys = 
 [ ((mod4Mask, xK_b), spawn "firefox")
 , ((mod4Mask, xK_v), spawn "alacritty -e spt")
 , ((mod4Mask, xK_f), spawn "thunar")
 , ((mod4Mask, xK_g), spawn "discord --start-windowed")
 , ((mod4Mask, xK_p), spawn "rofi -show drun -font \"Brownil 18\" -show-icons")

 , ((mod4Mask, xK_u), sendMessage $ Toggle NBFULL)
 , ((mod4Mask, xK_n), sendMessage ToggleStruts) 
 ]

myConf = def
 {
 layoutHook = myLayout
 , modMask = mod4Mask
 , terminal = "alacritty"
 , borderWidth = 1 
 , normalBorderColor = "#000000"
 , focusedBorderColor = "#FFFFFF"
 } `additionalKeys` myKeys
