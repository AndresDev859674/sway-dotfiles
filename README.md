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
swayidle swaylock dex network-manager-applet alacritty rofi i3status-rust wlogout dunst gammastep ttf-jetbrains-mono-nerd wl-clipboard grim slurp libnotify alsa-utils swayfx autotiling awww bemoji dmenu tofi ttf-font-awesome playerctl pavucontrol btop 
```
### Arch linux
Pacman Dependencies
```bash
sudo pacman -S swayidle swaylock dex network-manager-applet alacritty i3status-rust dunst gammastep ttf-jetbrains-mono-nerd wl-clipboard grim slurp libnotify alsa-utils dmenu autotiling awww ttf-font-awesome playerctl pavucontrol btop 
```
AUR Dependencies
```bash
yay -S swayfx bemoji wlogout tofi
```

## Clone the Repo
This is a Important step
```bash
git clone https://github.com/AndresDev859674/sway-dotfiles.git
```
Go to Repo Directory and...

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
| **rofi** | ~/.local/ |
---
Now in your terminal, Put `rofi-theme-selector`
search andrewdf1 or simple-andrewdf1
The one you like best

## Ending
Now Log-off or Restart to Log-in into Sway, NOW enjoy!

#### I don't have confirmation if this manual installation/setup works properly.

# FAQ
1. **So, Where the Keybinds**
   
   Go to the Config button of the bar and use Complex Keybinds Menu For Sway, Here there's all the Keybinds, BUT, this is a complex       menu, for now this dotfiles does not include a easy keybinds menu
    
# Credits    
newmanls for the Themes collection

# I3 VERSION REPO or BRANCH COMING SOON

![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
