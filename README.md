# README in progress
#  Joe's dotfiles
Here are my most precious dotfiles as well as a few handy scripts.  
There are a few of these programs I don't use anymore. Their corresponding dotfiles won't receive updates and might be deleted as well.

## Config files

Dotfiles for the following programs can be found all over the repo.  
They are placed in the corresponding directories where they should be deployed on your system, the repo root being your `$HOME` folder, usually under `/home/user` for GNU/Linux or `/Users/user` for macOS.

Some files here can be found in `1-desktop` and `2-laptop` directories. Some of them are doubled, some are unique. They are specific for my desktop or laptop usage.  
There `1-desktop` or `2-laptop` becomes your `$HOME` directory.

+ dunst  
+ lf
+ vifm
+ nvim
+ vim
+ CDE (experimental)
+ mplayer
+ newsboat
+ my custom Oh My Zsh theme
+ vim
+ bspwm
+ sxhkd
+ Xresources
+ compton
+ bash
+ zsh
+ GNU Emacs
+ urlview
+ xinit
+ GNU Screen

## Scripts

Here is a description of the behaviour of the various scripts you can find in the repo.

You can find them in `.local/bin` and .
`.scripts`

`compiler`

Run by `vim` when saving a LaTeX file. It compiles it into pdf.  
It was design to complie many other file formats like C, go, etc but I an not using it.

`texclear`

Run by `vim` when exiting that cleans all junk files generated when compiling LaTeX.

`refbar`

Run by `dwm` to refresh its status bar when switching keyboard layouts (alt+shift).

`webview.sh`

Used in `urlview` to open content with the pertinent program. Uses `sxiv`, `mpv` and `wget`. Defaults to `qutebrowser` in case of weird file extension.

`lowbat`

A script to notify me when my ThinkPad is low on battery. Uses `libnotify` and `espeak`.

`dualscreen`

Uses `xrandr` to switch screen setup from built-in laptop screen (LVDS1) only to this plus VGA1 out, setting VGA1 to primary.  
Might not work on your your specific GPU + screen config.

`mainscreen`

Uses `xrandr` to switch off any other screen output and use only the laptop built-in (LVDS1).  
Might not work on your your specific GPU + screen setup.

`swscreen`

Uses `xrandr` to switch screen setup from built-in laptop screen (LVDS1) only to VGA1 out only, setting it to primary.  
Might not work on your your specific GPU + screen setup.

`autostart.sh`

My dwm autostart script that runs once the window manager is initialized.  
It launches some programs and sets some settings.

`.vim/`

Used in vim to config compile C and C++ code of various manner. See [About vim](https://github.com/JozanLeClerc/dotfiles#about-vim) for more informations.

## bspwm controls

My `bspwm` and `sxhkd` configs are in here. In this list **"window"** is being called **"tile"**.  
Here are some of the main key bindings provided by my `sxhkdrc`:
+ **switch** to workspace 1-10 with `super+{F1-F10}`
+ **move** focused tile to workspace 1-10 with `super+shift+{F1-F10}`
+ **fire up** `st` terminal emulator with `super+return`. Check my own `st` build [here](https://github.com/JozanLeClerc/st-laptop)
+ **kill** focused tile with `super+q`
+ **focus** tile left/down/up/right with `super+{h/j/k/l}`
+ **move** focused tile left/down/up/right with `super+shift+{h/j/k/l}`
+ **expend** focused tile left/down/up/right with `ctrl+alt+{left/down/up/right}`
+ **shrink** focused tile left/down/up/right with `ctrl+super+{left/down/up/right}`
+ **select direction** of the next application left/down/up/right with `ctrl+super+{h/j/k/l}`
+ **invoke** `vifm` with `super+1`
+ **invoke** `st` with `super+2` (same as `super+return`
+ **invoke** `firefox` with `super+3`
+ **exit** `bspwm` with `super+shift+e`
+ **restart** `bspwm` with `super+shift+r`

## About vim

When using my `vim` or `nvim` configuration, make sure you placed my `.vim` into your home directory. In there are handy scripts.  
They can be executed through the following commands, in **normal mode**:


+ `F5` executes `make -j5` in the current directory
+ `F6` executes `./a.out`. **~>** is added to standard output directly at the end of your program output so you can see clearly where it ends. If something else than **0** is being returned, the return value is displayed. Finally deletes a.out
+ `F9` prompts for arguments then executes `gcc` (or `g++`) with `-Wall -Wextra -Werror` flags ont the current C or C++ buffer. Then it runs `./a.out` with the arguments you entered before, then deletes it
+ `F10` executes `gcc` (or `g++`) with `-Wall -Wextra -Werror` flags ont the current C or C++ buffer. Then it runs `./a.out` and deletes it

Obviously, `make` and `gcc` appear as dependencies for these functions.

## About GNU Emacs

I use a decent amount of packages in my configuration, like **Evil mode**, **Rainbow mode**, **neotree** etc... You will have to install them all manually on the first use or the config will not load entirely.  
For this open **Emacs**, it will notify you about a missing package. To install it execute `M-x` and enter **the following connands**:

```emacs-lisp
package-install
missing-package
```

Close **Emacs** and do it again until no prompt appears anymore. This is not ideal but I haven't found a better way yet.

### Custom commands

Here are the cool key bindings I added:

+ `F1` splits horizontally and opens/reopens an **\*eshell\*** buffer
+ `F2` toggles **neotree** on and off
+ `F5` runs `make -j5` in a **\*compilation\** buffer. If compilation is successful, the buffer closes after **1 second**, otherwise it stays opened
+ `F6` runs `./a.out` in an **\*Async Shell Command\*** buffer, then deletes `a.out`
+ `F9` prompts for arguments, compiles the current buffer with `gcc` (or `g++`) with the flags `-Wall -Wextra -Werror -g3` in a **\*compilation\*** buffer, runs `./a.out` with the  previously entered arguments in an **\*Async Shell Command\*** buffer, then deletes `a.out`
+ `F10` acts the same as `F9` without asking for arguments
+ `alt+{j/k}` navigate through tabs
+ `ctrl+{h/j/k/l}` navigate through split panes
+ `ctrl+o` minimize all other split panes
+ `, w` kill current buffer