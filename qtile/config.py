import os
import subprocess
from libqtile import qtile
from libqtile import layout, hook
from libqtile import bar, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown, EzKey
# from libqtile.config import KeyChord
from libqtile.command import lazy
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal
# from typing import List
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
# from qtile_extras.widget.decorations import BorderDecoration

# local
from modules.widgets import *

mod = "mod4"
mod1 = "mod1"
terminal = 'kitty'
browser = "qutebrowser"
file_manager = terminal + " -e vifm"
gui_file_manager = "pcmanfm"
cmus = terminal + " -e cmus"
mpv =  "mpv"
picom = terminal + " -e picom --experimental-backends --daemon"

keys = [
    Key([mod], "i",  lazy.toggle_layout('Max')),
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
    Key([mod, "control"], "n", lazy.hide_show_bar()),
    Key([mod], "z", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen for pane in focus"),
    Key([mod, "shift"], "n", lazy.layout.normalize()),

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
        # label='',
        layout='Stack',
        matches=[Match(wm_class=["qutebrowser"])],
    ),
    Group(
        "2",
        # label='',
        layout='Bsp',
    ),
    Group(
        "3",
        # label='',
        layout='Bsp',
    ),
    Group(
        "4",
        # label='',
        layout='Bsp',
        matches=[Match(wm_class=["Steam"])],
    ),
    Group(
        "5",
        # label='',
        layout='Bsp',
    ),
    Group(
        "6",
        # label='',
        layout='Bsp',
    ),
    Group(
        "7",
        # label='',
        layout='Bsp',
    ),
    Group(
        "8",
        # label='',
        layout='Bsp',
        matches=[
            Match(wm_class=["TelegramDesktop"]), 
            Match(wm_class=["discord"])],
    ),
    Group(
        "9",
        # label='',
        layout='Bsp',
        matches=[
            Match(wm_class=["Figma"])],
    ),
    Group(
        "0",
        # label='',
        layout='Stack',
    ),
]

for i in groups:
    keys.extend([
        Key(
            [mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name),
        ),
        Key(
            [mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name),
        ),
        Key([mod1, 'control'], '1', lazy.group['scratchpad'].dropdown_toggle('term')),
        Key([mod1, 'control'], '2', lazy.group['scratchpad'].dropdown_toggle('vifm')),
        Key([mod1, 'control'], '3', lazy.group['scratchpad'].dropdown_toggle('cmus')),
        Key([mod1, 'control'], '4', lazy.group['scratchpad'].dropdown_toggle('htop')),
        Key([mod1, 'control'], '8', lazy.group['scratchpad'].dropdown_toggle('manfm')),
        Key([mod1, 'control'], '9', lazy.group['scratchpad'].dropdown_toggle('mutt')),
        Key([mod1, 'control'], '0', lazy.group['scratchpad'].dropdown_toggle('vi')),
    ])

groups.append(
   ScratchPad('scratchpad', {
       # DropDown('term', 'kitty', opacity=1, height=0.5, width=1, x=0, y=0.5),
       DropDown('term', 'kitty', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('vifm', 'kitty -e vifm', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('cmus', 'kitty -e cmus', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('htop', 'kitty -e htop', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('mutt', 'kitty -e neomutt', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('vi', 'kitty -e nvim', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
       DropDown('manfm', 'pcmanfm', opacity=1, height=0.5, width=0.5, x=0.25, y=0.25),
   }),
)

layout_theme = {
        "border_width": 2,
        "single_border_width": 0,
        "margin": 5,
        "border_focus": "#45475a",
        # "border_focus": "#96cdfb",
        "border_normal": bgColor,
        }

layouts = [
    # layout.MonadTall(
    #     **layout_theme,
    #     ),
    # layout.Spiral(**layout_theme, ratio=0.5),
    # layout.MonadThreeCol(**layout_theme),
    # layout.Tile(**layout_theme),
    layout.Bsp(**layout_theme,
               fair=False,
               grow_amount=2,
               margin_on_single=5,
               ),
    layout.Stack(num_stacks=1, margin=5, border_focus="#1E1E2E", margin_on_single=0),
    # layout.Max(**layout_theme),
    # layout.Slice(**layout_theme),
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
          ["#2e2e3e", "#2e2e3e"],
          ["#c0caf5", "#c0caf5"],
          ["#ff6c6b", "#ff6c6b"],
          ["#98be65", "#98be65"],
          ["#da8548", "#da8548"],
          ["#51afef", "#51afef"],
          ["#c678dd", "#c678dd"],
          ["#46d9ff", "#46d9ff"],
          ["#a9a1e1", "#a9a1e1"]]

widget_defaults = dict(
    font="UbuntuMono Nerd Font",
    fontsize=15.5,
    # padding=5,
    # background=bgColor,
    background=bgTrans,
    foreground=cats[0],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        # top=bar.Gap(44),
        top=bar.Bar(
            [

                widget.Spacer(),
                # widget.Clock(
                #     format="%a, %b %d %I:%M%p",
                #     foreground="#708183",
                #     padding=8,
                #      fontshadow = "#000000",
                # ),
                separator(),
            ],
            20,
            background="#00000000",
            margin=[5, 35, 5, 35],
        ),
        bottom=bar.Bar(
            [
                widget.GroupBox(
                     hide_unused = True,
                     highlight_method = 'block',
                     center_aligned = True,
                     this_current_screen_border="#259185",
                     # this_current_screen_border="#002b36",
                     block_highlight_text_color = "#ffffff",
                     urgent_alert_method = 'text',
                     urgent_text = "#d01b24",
                     inactive = "#002731",
                     active = "#708183",
                     borderwidth=2,
                     fontsize = 14,
                     fontshadow = "#000000",
                     highlight_color = ['00000000', '2075c7'],
                     ),
                # separator(),
                widget.Spacer(),
                 widget.TextBox(
                    text="",
                    font="JetBrains Nerd Font",
                    fontsize=26,
                    foreground="#708183",
                    padding=8,
                     fontshadow = "#000000",
                ),
                widget.GenPollText(
                    func=get_kb_layout,
                    update_interval=0.5,
                    font="JetBrains Nerd Font",
                    fontsize = 14,
                    foreground="#708183",
                    padding=4,
                     fontshadow = "#000000",
                ),
                widget.TextBox(
                    text="墳",
                    foreground="#708183",
                    font="JetBrainsMono Nerd Font",
                    fontsize=20,
                    padding=8,
                     fontshadow = "#000000",
                ),
                widget.PulseVolume(
                    foreground="#708183",
                    # limit_max_volume="True",
                    padding=4,
                     fontshadow = "#000000",
                ),
                widget.TextBox(
                    text="直",
                    font="JetBrains Nerd Font",
                    fontsize=26,
                    foreground="#708183",
                    padding=8,
                     fontshadow = "#000000",
                ),
                widget.Net(
                    interface='all',
                    format = ' {up}  {down}',
                    foreground="#708183",
                    padding=4,
                     fontshadow = "#000000",
                ),
                widget.Clock(
                    format="%a, %b %d %I:%M%p",
                    foreground="#708183",
                    padding=8,
                     fontshadow = "#000000",
                ),
                separator(),
            ],
            20,
            background="#00000000",
            margin=[5, 35, 5, 35],
        ),
        # bottom=bar.Bar([], 30),
        # right=bar.Bar([
        #         separator(),
        #         widget.Spacer(),
        #         separator(),
        #               ], 30,
        #     background="#00000000",
        #               ),
        # left=bar.Bar([
        #         separator(),
        #         widget.Spacer(),
        #         separator(),
        #              ], 30,
        #     background="#00000000",
        #              ),
        # bottom=bar.Gap(15),
        right=bar.Gap(30),
        left=bar.Gap(30),
        # wallpaper='~/Pictures/cat/cat_nsch.png',
        # wallpaper='~/Downloads/wallpapers/wallpaper1.jpg',
        wallpaper='~/Downloads/wallpapers/max-bender-8FdEwlxP3oU-unsplash.jpg',
        # wallpaper='~/Downloads/wallpapers/nsch.png',
        # wallpaper='~/Downloads/wallpapers/nsch2.png',
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
    # subprocess.run([home + '/.config/polybar/launch.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
