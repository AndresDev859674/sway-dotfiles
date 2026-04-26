<img width="1440" height="900" alt="screenshot_20260406_211141" src="https://github.com/user-attachments/assets/3fe4e429-f46e-4697-a764-a2bc280c452a" />

# andrew(sway)dotfiles
My Personal and useful and Lightweight Dotfiles, Also you can use with KDE and Sway in the same System!

#### TESTED IN A PC FROM 2011!!!! Intel i3 2120 with integrated graphics, Optimized for PC's of 2011-Present

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

> [!WARNING]
> This Dotfiles does not include install script, so you have to install manually
>

# Screenshots
| | |
| --- | --- |
| <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/d571ac06-22b2-4e99-a1a0-d47cb52c49f4" /> | <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/56db0ae0-3fe8-4a0e-bbbf-aee58c29ab51" /> | <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/804e5519-2342-4208-99c9-143ce1b835b6" /> | 
| <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/0c914879-b156-49f0-b91e-61c9bd8cb986" /> | <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/9b0121f1-6262-4f00-aea0-81955706fa71" /> |
 <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/5c3a82cf-498d-4e00-81fb-ec526cc09c47" /> | <img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/1d96eec8-8886-4962-a130-822be25cf074" /> |

<img width="1280" height="800" alt="image" src="https://github.com/user-attachments/assets/af0f4a8a-02bb-43fb-be62-3cb513c5eec5" />

# Supported Distros
| Distribution | Dotfiles Support | Status |
| :--- | :---: | :---: |
| ![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge) | ✅ | ✅ |
| ![Debian](https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=debian&logoColor=white) | ❓ | ❓ |
| ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) | ❓ | ❓ |
| ![Fedora](https://img.shields.io/badge/Fedora-294172?style=for-the-badge&logo=fedora&logoColor=white) | ❓ | ❓ |
| ![openSUSE](https://img.shields.io/badge/openSUSE-%2364B345?style=for-the-badge&logo=openSUSE&logoColor=white) | ❓ | ❓ |
| ![NixOS](https://img.shields.io/badge/NIXOS-5277C3.svg?style=for-the-badge&logo=NixOS&logoColor=white) | ❓ | ❓ |
| ![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-0D597F?style=for-the-badge&logo=alpine-linux&logoColor=white) | ❓ | ❓ |
| ![Gentoo](https://img.shields.io/badge/Gentoo-9B54FF?style=for-the-badge&logo=gentoo&logoColor=white) | ❓ | ❓ |
| ![FreeBSD](https://img.shields.io/badge/FreeBSD-CF2122?style=for-the-badge&logo=freebsd&logoColor=white) | ❓ | ❓ |

### Legend

| Icon | Meaning |
|:----:|:-------------------|
| **✅** | **Confirmed Working:** Tested and fully supported. |
| **❓** | **Should Work / Pending Confirmation:** Expected to work (often based on its parent distribution), but testing is pending or needs confirmation. or Also, It might not work. |
| **❌** | **Not Supported:** Confirmed not to work or not supported by the dotfiles. |

# Setup
First install the Dependencies, and make sure you are en KDE, i recommend this Dotfiles with KDE installed
## Dependencies
Only tested in **Arch linux**, in **CachyOS** and **EndeavourOS** should work, If you are another distro, install the dependencies that are here
```bash
swayidle swaylock dex network-manager-applet alacritty rofi i3status-rust wlogout dunst gammastep ttf-jetbrains-mono-nerd wl-clipboard grim slurp libnotify alsa-utils swayfx autotiling awww bemoji dmenu tofi ttf-font-awesome playerctl pavucontrol btop nwg-displays swaync swayosd waybar wf-recorder yad pulseaudio-utils ffmpeg
```
### Arch linux
Pacman Dependencies
```bash
sudo pacman -S swayidle swaylock dex network-manager-applet alacritty i3status-rust dunst gammastep ttf-jetbrains-mono-nerd wl-clipboard grim slurp libnotify alsa-utils dmenu autotiling awww ttf-font-awesome playerctl pavucontrol btop nwg-displays swaync waybar wf-recorder yad pulseaudio-utils ffmpeg
```
AUR Dependencies
```bash
yay -S swayfx bemoji wlogout tofi swayosd swaycons
```

## Clone the Repo
This is a Important step
```bash
git clone https://github.com/AndresDev859674/sway-dotfiles.git
```
Go to Repo Directory and...

## Making executable
Run this command
```bash
find . -type f -name "*.sh" -exec chmod +x {} +
```
Make Sure that you are in the sway-dofiles directory

## Setting the configs
Put the Folders in the Next Directories
| Folders | Directory |
|:----:|:-------------------|
| **i3-wallpapers** | ~/ |
| **dunst** | ~/.config/ |
| **sway** | ~/.config/ |
| **swaylock** | ~/.config/ |
| **greenclip.toml** | ~/.config/ |
| **i3blocks** | ~/.config/ |
| **i3status-rust** | ~/.config/ |
| **wlogout** | ~/.config/ |
| **i3** | ~/.config/ |
| **swaync** | ~/.config/ |
| **rofi** | ~/.local/ |
| **waybar** | ~/.config/ |
| **swayosd** | ~/.config/ |
---

## Rofi
Now in your terminal, Put `rofi-theme-selector`
search andrewdf1 or simple-andrewdf1
The one you like best

## Ending
Now Log-off or Restart to Log-in into Sway, NOW enjoy!

## Updating
Follow the previous steps, but again, put the folders with the new changes in their directories, etc.

#### I don't have confirmation if this manual installation/setup works properly.

## alacritty config
These contain the themes and settings to match the aesthetics of dotfiles. the alacritty in `~/.config/` from the repo directory

## waybar
waybar is not default for the moment, here's how to enable, Make sure if you have `waybar` in your sway config, put 
```bash
swaybar_command waybar
```

in the bar in the config

### gtk-3.0
If you want the tray colors to match the Waybar colors, put this in `~/.config/gtk-3.0/gtk.css`, or copy the gtk-3.0 from the repo

```css
menu,
.menu,
.context-menu {
    margin: 10px;
    padding: 8px;
    background-color: rgba(15, 20, 30, 0.9); 
    border: 1px solid rgba(77, 208, 225, 0.3);
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
    font-family: "JetBrainsMono Nerd Font", sans-serif;
    font-size: 13px;
}

menuitem,
modelbutton {
    padding: 6px 12px;
    border-radius: 8px;
    color: #c0caf5;
    transition: all 0.2s ease;
}

menuitem:hover,
modelbutton:hover {
    background-color: rgba(77, 208, 225, 0.2);
    color: #4dd0e1; 
}

separator {
    background-color: rgba(77, 208, 225, 0.15);
    margin: 4px 8px;
    min-height: 1px;
}

check, radio {
    color: #4dd0e1;
}

arrow {
    color: #c0caf5;
}
```

### qt6ct & qt5ct
If you want dark in qt and another things, put this in `~/.bash_profile`, **make sure if you have installed qt6ct and qt5ct** but i recommend for qt6ct, qt6ct-kde For KDE apps and another things..

```bash
if [[ "$XDG_CURRENT_DESKTOP" =~ "sway:wlroots:swayfx" ]]; then
  export QT_QPA_PLATFORMTHEME=qt6ct
  export QT_QPA_PLATFORM=wayland
  export QT_QPA_PLATFORMTHEME=qt5ct
fi
```

# FAQ
1. **So, Where the Keybinds?**
   
   Go to the Config button of the bar and use Complex Keybinds Menu For Sway, Here there's all the Keybinds, BUT, this is a complex       menu, for now this dotfiles does not include a easy keybinds menu

2. **How to get that console appearance shown in the images?**
   
   No, you need to install your bash or zsh or fish themes. If your terminal already looks good, you shouldn't have much of a problem.

3. **Stability?**
   
   I'm focusing on that, but on my personal system, my dotfiles seem to be quite stable. The errors could be from your Linux system or packages. Like SwayFX

4. **It's actually focused on performance?**
   
   If so, having a junk PC I can see that the performance is achievable, and it's quite good compared to heavier KDE or Some Heavy WM like Hyprland. Classicube reaches 400 FPS, and other games like Half-Life 2 reach up to 90 FPS.

5. **How to disable Blur?**
   
   Comment `#` the blur enable in the sway config `~/.config/sway/config`, Like this `# blur enable`

6. **Its really Heavy?**
   
   No, as with the previous FAQs and also on the PC it was tested on, there were no performance issues. It's very lightweight, although I recommend you try it yourself to see the performance for yourself.
    
7. **How Really works? The Menus Etc**
   
   Using only Shell files for menus, i3status-rust for the bar blocks, and others, we use Shell because it is efficient and more convenient.

# Credits    
newmanls for the Themes collection

![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
