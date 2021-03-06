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
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List

mod = "mod4"
mod1 = "mod1"
# terminal = guess_terminal()
terminal = 'kitty'
browser = "qutebrowser"
file_manager = terminal + " -e vifm"
gui_file_manager = "pcmanfm"
cmus = terminal + " -e cmus"
mpv =  "mpv"
picom = terminal + " -e picom --experimental-backends --daemon"

keys = [
    Key([mod], "Up", lazy.layout.increase_margin(), desc="Move focus to left"),
    Key([mod], "Down", lazy.layout.decrease_magrin(), desc="Move focus to left"),
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    #==========================my bsp============================================

    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "shift"], "n", lazy.layout.normalize()),

    # #==========================my qtile ============================================
    # Key([mod, "shift"], "h", lazy.layout.swap_left(), desc="Move window to the left"),
    # Key([mod, "shift"], "l", lazy.layout.swap_right(), desc="Move window to the right"),
    # Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    # Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Key([mod, "shift"], "space", lazy.layout.flip(), desc="Flip layout"),
    #
    # # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    #
    # Key([mod, "control"], "h", lazy.layout.grow(), desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.shrink(), desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.normalize(), desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.maximize(), desc="Grow window up"),
    # #------------------------------------------------------------------------------
    Key([mod], "F1", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen for pane in focus"),

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
    # Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod, "shift"], "e", lazy.spawn(gui_file_manager)), # run PCmanFM
    # Key([mod], "e", lazy.spawn(file_manager)), # run VIFM
    # Key([mod], "r", lazy.spawn('rofi -show drun')), # run Rofi
    # Key([mod], "m", lazy.spawn(cmus)), # run cmus music player
    # Key([mod], "b", lazy.spawn(browser)), # run FIREFOX 
    # Key([mod], "p", lazy.spawn(mpv)), # run mpv video player  
    # Key([mod], "Print", lazy.spawn('scrot "%Y-%m-%d_$wx$h.png" -e "optipng $f"')), # run FIREFOX 

    # KeyChords ==========================
    # KeyChord([mod], 'r', [
    #              Key([], 'r', lazy.spawn('rofi -show drun')), # run app
    #              Key([], 'e', lazy.spawn('rofiedit')), # edit confi:s
    #              Key([], 'q', lazy.spawn('powermenu')), # power mend
    #          ]),
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
bgColor = '#181825'
thm_pink = cats[3]
thm_blue = cats[10]
thm_green = cats[8]
bgTrans = "#00000000" 

groups = [
    Group(
        "1",
        label='???',
        layout='Bsp',
    ),
    Group(
        "2",
        label='???',
        layout='Bsp',
    ),
    Group(
        "3",
        label='???',
        layout='Bsp',
    ),
    Group(
        "4",
        label='???',
        layout='Bsp',
        matches=[Match(wm_class=["Steam"])],
    ),
    Group(
        "5",
        label='???',
        layout='Bsp',
    ),
    Group(
        "6",
        label='???',
        layout='Bsp',
    ),
    Group(
        "7",
        label='???',
        layout='Bsp',
        matches=[Match(wm_class=["Figma"])],
    ),
    Group(
        "8",
        label='???',
        layout='Bsp',
        matches=[
            Match(wm_class=["TelegramDesktop"]), 
            Match(wm_class=["discord"])],
    ),
    Group(
        "9",
        label='???',
        layout='Bsp',
    ),
    Group(
        "0",
        label='???',
        layout='Bsp',
    ),
]
#
# from libqtile.dgroups import simple_key_binder
# dgroups_key_binder = simple_key_binder("mod4")

# groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key(
            [mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name),
        ),
        # mod1 + shift + letter of group = switch to & move focused window to group
        Key(
            [mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name),
        ),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
        Key([mod1, 'control'], '1', lazy.group['scratchpad'].dropdown_toggle('term')),
        Key([mod1, 'control'], '2', lazy.group['scratchpad'].dropdown_toggle('vifm')),
        Key([mod1, 'control'], '3', lazy.group['scratchpad'].dropdown_toggle('cmus')),
        Key([mod1, 'control'], '4', lazy.group['scratchpad'].dropdown_toggle('htop')),
        Key([mod1, 'control'], '8', lazy.group['scratchpad'].dropdown_toggle('manfm')),
        Key([mod1, 'control'], '0', lazy.group['scratchpad'].dropdown_toggle('mutt')),
    ])

groups.append(
   ScratchPad('scratchpad', {
       # DropDown('term', 'kitty', opacity=1, height=0.5, width=1, x=0, y=-0.025),
       DropDown('term', 'kitty', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('vifm', 'kitty -e vifm', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('cmus', 'kitty -e cmus', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('htop', 'kitty -e htop', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('mutt', 'kitty -e neomutt', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('manfm', 'pcmanfm', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
   }),
)

layout_theme = {
        "border_width": 2,
        "single_border_width": 0,
        "margin": 10,
        "margin_on_single": 25,
        # "border_focus": "#a6adc8",
        "border_focus": "#45475a",
        "border_normal": bgColor,
        }

layouts = [
    # layout.MonadTall(
    #     **layout_theme,
    #     ),
    # layout.Max(**layout_theme),
    # layout.Spiral(**layout_theme, ratio=0.5),
    # layout.MonadThreeCol(**layout_theme),
    # layout.Tile(**layout_theme),
    layout.Bsp(**layout_theme,
               fair=False,
               grow_amount=2,
               ),
    layout.Stack(num_stacks=1, margin=10, border_focus="#1E1E2E"),
    # layout.Slice(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Columns(**layout_theme,
    #     split='false',
    #     num_collumns=1,
    #     ),
    # layout.RatioTile(**layout_theme, fancy = True),
    # layout.MonadWide(**layout_theme),
    # layout.Matrix(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [
          ["#0b151ea6", "#0b151ea6"],
          ["#1c1f24", "#1c1f24"],
          ["#c0caf5", "#c0caf5"],
          ["#ff6c6b", "#ff6c6b"],
          ["#98be65", "#98be65"],
          ["#da8548", "#da8548"],
          ["#51afef", "#51afef"],
          ["#c678dd", "#c678dd"],
          ["#46d9ff", "#46d9ff"],
          ["#a9a1e1", "#a9a1e1"]]

widget_defaults = dict(
    font="Ubuntu Nerd Font",
    # font="JetBrains Nerd Font",
    fontsize=14,
    padding=5,
    background=bgColor,
    foreground=cats[0],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
         # top=bar.Bar(
         #     [
         #         widget.Sep(
         #                foreground="#96CDFB",
         #                linewidth=5,
         #                size_percent=200,
         #                ),
         #         widget.CPU(
         #            format = '???  {load_percent} %' ,
         #        ),
         #         widget.Spacer(
         #             background = bgTrans,
         #             ),
         #         widget.GroupBox(
         #             highlight_method = 'text',
         #             center_aligned = 'true',
         #             this_current_screen_border="#abe9b3",
         #             inactive = "#1e1e2e",
         #             active = "#96cdfb",
         #             background = bgTrans,
         #             borderwidth=2,
         #             margin=4,
         #             fontsize = 14,
         #             rounded = True,
         #             ),
         #         widget.Spacer(
         #             background = bgTrans,
         #             ),
         #         widget.Chord(
         #             chords_colors={
         #                 "launch": ("#ff0000", "#ffffff"),
         #             },
         #             name_transform=lambda name: name.upper(),
         #         ),
         #         widget.Net(
         #             interface='all',
         #             format = 'Net:{down}',
         #             background = bgColor,
         #             ),
         #         widget.Sep(
         #                foreground="#96CDFB",
         #                line_width=2,
         #                size_percent=50,
         #                ),
         #         widget.Cmus(
         #            background = "#F28FAD",
         #            foreground = bgColor,
         #            play_color = bgColor,
         #        ),
         #         widget.Sep(
         #                background=bgTrans,
         #                foreground=bgTrans,
         #                line_width=15,
         #                padding=10,
         #                size_percent=50,
         #                ),
         #        widget.TextBox(
         #            text="???",
         #            foreground="#F28FAD",
         #            background=bgTrans,
         #            fontsize=18,
         #            padding=-1,
         #        ),
         #         widget.Volume(
         #            fmt = '??? {}',
         #            foreground = bgColor,
         #            background = "#F28FAD",
         #                ),
         #        widget.TextBox(
         #            text="???  ",
         #            # font="Font Awesome 6 Free Solid",
         #            foreground="#F28FAD",
         #            background=bgTrans,
         #            fontsize=18,
         #            padding=0,
         #        ),
         #         widget.Clock(
         #             format="%b %d, %a %I:%M %p",
         #             foreground = bgColor,
         #             background = "#ddb6f2",
         #             ),
         #         widget.Sep(
         #                foreground="#96CDFB",
         #                linewidth=5,
         #                size_percent=200,
         #                ),
         #     ],
         #     21,
         #     background="#0b151ea6",
         # ),
        # wallpaper='~/Downloads/wallpapers/girl.png',
        wallpaper='~/Downloads/wallpapers/sakura.jpg',
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
    border_width = 2,
    border_focus = "#2e2e3e",
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

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
