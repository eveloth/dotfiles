--
-- ███████  █████  ██   ██      ██████  ███████ 
-- ██      ██   ██  ██ ██      ██    ██ ██      
-- █████   ███████   ███       ██    ██ ███████ 
-- ██      ██   ██  ██ ██      ██    ██      ██ 
-- ██      ██   ██ ██   ██      ██████  ███████ 
  
----------------------------------------------------------------
-- FAX OS Xmonad Comfiguration, 9/XII 2021, Moscow -------------
----------------------------------------------------------------

----------------------------------------------------------------
------------------------------IMPORTS---------------------------
----------------------------------------------------------------

import XMonad
import Data.Monoid
import System.Exit

-- Utils

import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig (additionalKeysP) 

-- Hooks

import XMonad.Hooks.ManageDocks

-- Layout

import XMonad.Layout.LayoutModifier
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

----------------------------------------------------------------
----------------------------VARIABLES---------------------------
----------------------------------------------------------------

myTerminal :: String
myTerminal = "alacritty" 

myBrowser :: String
myBrowser = "qutebrowser"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth :: Dimension
myBorderWidth = 2

myModMask :: KeyMask      
myModMask = mod4Mask

-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff5f1f"

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True


----------------------------------------------------------------
--------------------------KEYBINDINGS---------------------------
----------------------------------------------------------------

myKeys :: [(String, X ())]
myKeys =

	[ 

      ("M-S-<Return>", spawn myTerminal) -- launch a terminal

    , ("M-S-p", spawn "gmrun") -- launch gmrun

    , ("M-p", spawn "dmenu_run") --launch dmenu

    , ("M-c", kill) -- close focused window
    
    -- , ("M-S-a", killAll) -- close all windows

    , ("M-<Space>", sendMessage NextLayout) -- Rotate through the available layout algorithms

    -- , ("M-S-<Space>", setLayout $ XMonad.layoutHook conf) --  Reset the layouts on the current workspace to default

    --, ("M-n", refresh) -- Resize viewed windows to the correct size

    , ("M-<Tab>", windows W.focusDown) -- Move focus to the next window

    , ("M-b", spawn myBrowser)

    , ("M-k", windows W.focusUp  ) -- Move focus to the previous window

    , ("M-m", windows W.focusMaster  ) -- Move focus to the master window

    , ("M-z", sendMessage ToggleStruts) -- Toggle struts

    , ("M-S-j", windows W.swapDown  ) -- Swap the focused window with the next window

    , ("M-S-k", windows W.swapUp    ) -- Swap the focused window with the previous window

    , ("M-h", sendMessage Shrink)  -- Shrink the master area

    , ("M-l", sendMessage Expand) -- Expand the master area

    , ("M-t", withFocused $ windows . W.sink) -- Push window back into tiling

    -- , ("M-," sendMessage (IncMasterN 1)) -- Increment the number of windows in the master area

    -- , ("M-.", sendMessage (IncMasterN (-1))) -- Deincrement the number of windows in the master area

    , ("M-<Return>",    toggleWindowSpacingEnabled
                     >> toggleScreenSpacingEnabled
                     >> (sendMessage $ Toggle NOBORDERS)
                     >> (sendMessage ToggleStruts) ) -- Fullscreen mode 

    , ("M-S-q", io (exitWith ExitSuccess)) -- Quit xmonad

    , ("M-q", spawn "xmonad --recompile; xmonad --restart") -- Restart xmonad

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    -- , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    -- ++

----------------------------------------------------------------
-----------------------MOUSE BINDINGS---------------------------
----------------------------------------------------------------

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

----------------------------------------------------------------
------------------------------LAYOUTS---------------------------
----------------------------------------------------------------

myLayout = avoidStruts $ mkToggle (single NOBORDERS) tiled ||| Mirror tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

----------------------------------------------------------------
--------------------------MANAGE HOOK---------------------------
----------------------------------------------------------------

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "qutebrowser"    --> doShift ( myWorkspaces !! 1 )
    , className =? "firefox"        --> doShift ( myWorkspaces !! 1 )
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

----------------------------------------------------------------
---------------------------EVENT HOOK---------------------------
----------------------------------------------------------------

myEventHook = mempty

----------------------------------------------------------------
-----------------------------LOG HOOK---------------------------
----------------------------------------------------------------

myLogHook = return ()

----------------------------------------------------------------
---------------------------ON STARTUP---------------------------
----------------------------------------------------------------

myStartupHook = do
  spawnOnce "nitrogen --restore &"
  spawnOnce "picom &"

----------------------------------------------------------------
------------------------------XMONAD---------------------------
----------------------------------------------------------------

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar -x -0 /home/eveloth/.config/xmobar/xmobarrc"
  xmonad $ docks defaults

defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = mySpacing 7 $ myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys

----------------------------------------------------------------
---------------------------------HELP---------------------------
----------------------------------------------------------------

help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
