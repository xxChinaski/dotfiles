# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import re
import socket
import subprocess

from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List

mod = "mod4"
terminal = guess_terminal()
browser = "qutebrowser"
file_manager = terminal + " -e vifm"
gui_file_manager = "pcmanfm"
cmus = terminal + " -e cmus"
mpv =  "mpv"
picom = terminal + " -e picom --experimental-backends --daemon"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.swap_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.swap_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "space", lazy.layout.flip(), desc="Flip layout"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.

    # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "control"], "h", lazy.layout.grow(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.shrink(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.normalize(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.maximize(), desc="Grow window up"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen for pane in focus"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn('rofi -show drun')), # run Rofi
    Key([mod], "e", lazy.spawn(file_manager)), # run VIFM
    Key([mod, "shift"], "e", lazy.spawn(gui_file_manager)), # run VIFM
    Key([mod], "m", lazy.spawn(cmus)), # run VIFM
    Key([mod], "b", lazy.spawn(browser)), # run FIREFOX 
    Key([mod], "p", lazy.spawn(mpv)), # run FIREFOX 
    Key([mod], "Print", lazy.spawn('scrot "%Y-%m-%d_$wx$h.png" -e "optipng $f"')), # run FIREFOX 
]


cats = [
    ["#F5E0DC", "#F5E0DC"],
    ["#F2CDCD", "#F2CDCD"],
    ["#DDB6F2", "#DDB6F2"],
    ["#F5C2E7", "#F5C2E7"],
    ["#E8A2AF", "#E8A2AF"],
    ["#F28FAD", "#F28FAD"],
    ["#F8BD96", "#F8BD96"],
    ["#FAE3B0", "#FAE3B0"],
    ["#ABE9B3", "#ABE9B3"],
    ["#B5E8E0", "#B5E8E0"],
    ["#96CDFB", "#96CDFB"],
    ["#89DCEB", "#89DCEB"],
    ["#C9CBFF", "#C9CBFF"],
    ["#161320", "#161320"],
    ["#1A1826", "#1A1826"],
    ["#1E1E2E", "#1E1E2E"],
    ["#302D41", "#302D41"],
    ["#575268", "#575268"],
    ["#6E6C7E", "#6E6C7E"],
    ["#988BA2", "#988BA2"],
    ["#C3BAC6", "#C3BAC6"],
    ["#D9E0EE", "#D9E0EE"]]

accentColor = cats[20]
bgColor = cats[15]
thm_pink = cats[3]
thm_blue = cats[10]
thm_green = cats[8]
bgTrans = "#00000000" 


groups = [Group(" Home", layout='MonadTall'),
          Group(" Chat", layout='MonadTall'),
          Group("SYS", layout='MonadTall'),
          Group("DOC", layout='MonadTall'),
          Group("VBOX", layout='MonadTall'),
          Group("CHAT", layout='MonadTall'),
          Group("MUS", layout='MonadTall'),
          Group("VID", layout='MonadTall'),
          Group("GFX", layout='MonadTall'),
          Group(" Code", layout='MonadTall')]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

layout_theme = {
        "border_width": 1,
        "single_border_width": 0,
        "margin": 10, 
        "border_focus": thm_pink,
        "border_normal": bgColor,
        }

layouts = [
    layout.MonadTall(
        **layout_theme,
        ),
    # layout.Max(**layout_theme),
    layout.MonadThreeCol(**layout_theme),
    layout.Stack(num_stacks=1, margin=10, border_focus="#1E1E2E"),
    # layout.Bsp(**layout_theme),
    # layout.Slice(**layout_theme),
    # layout.Tile(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Columns(**layout_theme,
    #     split='false',
    #     num_collumns=1,
    #     ),
    # layout.RatioTile(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.Matrix(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


#"#0b151e", "#0b151e"],
colors = [
        # ["#00000000", "#00000000"],
          # ["#0b151e", "#0b151e"],
          ["#0b151ea6", "#0b151ea6"],
          ["#1c1f24", "#1c1f24"],
          ["#c0caf5", "#c0caf5"],
          # ["#dfdfdf", "#dfdfdf"],
          # ["#dadada", "#dadada"],
          ["#ff6c6b", "#ff6c6b"],
          ["#98be65", "#98be65"],
          ["#da8548", "#da8548"],
          ["#51afef", "#51afef"],
          ["#c678dd", "#c678dd"],
          ["#46d9ff", "#46d9ff"],
          ["#a9a1e1", "#a9a1e1"]]


widget_defaults = dict(
    font="UbuntuMono Nerd Font",
    fontsize=12,
    padding=0,
    background=cats[16],
    foreground=cats[0],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
#          top=bar.Bar(
#              [
#                  widget.Sep(
#                         linewidth = 0,
#                         padding = 10,
#                         foreground = colors[2],
#                         background = bgColor,
#                         ),
#                  widget.TextBox(
#                    text='',
#                    foreground = accentColor,
#                    background = bgColor,
#                    fontsize= 30,
#                    padding=5,
#                    ),
#                  widget.Sep(
#                         linewidth = 0,
#                         padding = 10,
#                         foreground = colors[2],
#                         background = bgColor
#                         ),
#                  widget.CurrentLayoutIcon(scale=0.7),
#                  widget.CurrentLayout(
#                      background = bgColor,
#                      padding=5,
#                      ),
#                  widget.GroupBox(
#                      highlight_method = 'text',
#                      center_aligned = 'true',
#                      this_current_screen_border=accentColor,
#                      inactive = cats[16],
#                      background = bgColor,
#                      foreground = colors[2],
#                      fontsize = 18,
#                      rounded = 'true',
#                      spacing = 12,
#                      ),
#                  widget.Spacer(
#                      background = bgTrans,
#                      ),
#                  widget.Chord(
#                      chords_colors={
#                          "launch": ("#ff0000", "#ffffff"),
#                      },
#                      name_transform=lambda name: name.upper(),
#                  ),
#                  widget.Net(
#                      interface='all',
#                      format = 'Net:{down} ↓ ↑ {up}',
#                      background = bgColor,
#                      ),
#                  widget.Cmus(),
#                  widget.Volume(
#                         fmt = 'Vol: {}',
#                          background = bgColor,
#                         ),
#                  widget.Clock(
#                      format="%A, %B %d %I:%M:%S %p",
#                      background = bgColor,
#                      ),
#                  widget.Sep(
#                         linewidth = 0,
#                         padding = 10,
#                         foreground = colors[2],
#                         background = bgColor
#                         ),
#                  widget.QuickExit(
#                      default_text = '襤',
#                      fontsize = 18,
#                      background = bgColor,
#                      countdown_format = '{}'
#                      ),
#                  widget.Sep(
#                         linewidth = 0,
#                         padding = 10,
#                         foreground = colors[2],
#                         background = bgColor
#                         ),
#              ],
#              21,
#              # background="#0b151ea6",
#              background=bgTrans,
#              margin=[10, 10, 0, 10],
#          ),
        wallpaper='~/Downloads/wallpapers/WallpaperTHREE.jpg',
        wallpaper_mode='fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width = 0,

)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~')
    subprocess.run([home + '/.config/qtile/autostart.sh'])
    subprocess.run([home + '/.config/polybar/launch.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
