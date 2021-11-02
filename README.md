# Dotfiles

My dotfile repository containing everything needed for my i3 setup : i3-gaps, rounded corners and pywal themes ! I am currently using EndeavourOS (arch based) but it should work on other distro with minor modifications.

![Desktop gif](screenshots/overview.gif)


## What's in it?

- WM: i3-gaps
- Compositor: picom with rounded corners (ibhagwan's fork)
- Terminal: Alacritty  (*Applications shown below are : vim, pipes.sh, thunar*)
![launcher rofi](screenshots/terminal.png)
- Notifications: Dunst
- Launcher & Powermenu: Rofi
![launcher rofi](screenshots/rofi.png)
![powermenu](screenshots/powermenu.png)
- Status bar: polybar, with Nerd Fonts Hack
- File manager: Thunar, with Nordic darker theme
- Colors and theme management using pywal
- Basic dotfiles :
    - i3 config file
    - .zshrc and .zshrc.d
    - .vimrc
## Usage & Installation

For an easy way to install and use those dotfiles, please check [ansible-dotfiles](https://github.com/BaptisteBdn/ansible-dotfiles).

## Notes
- Wallpapers can be found in `.config/wallpaper`.
- Font is DejaVuSans
- Original resolution is 1440p but it should work with other resolutions (screenshots are 1080p)
- I tweaked some generated pywal schemes in order to have better results, in order to keep those changes I added the `.cache/wal/schemes` folder.
- This design is inspired by [k-vernooy](https://github.com/k-vernooy/dotfiles).
