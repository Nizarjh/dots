# Hyprland Dotfiles
Based void theme 

![View](https://github.com/Nizarjh/dots/blob/main/View.png)

## Add the [Blackhole-vl](https://github.com/Event-Horizon-VL/blackhole-vl) community repo
1. Create an entry in `/etc/xbps.d/` and add this repository  
   (replace the architecture as needed):

    ```
    echo repository=https://raw.githubusercontent.com/Event-Horizon-VL/blackhole-vl/repository-x86_64 | sudo tee /etc/xbps.d/20-repository-extra.conf
    ```

2. Refresh repositories and accept the fingerprint:

    ```
    sudo xbps-install -S
    ```
## Installation

Clone the repository:
```bash
  git clone https://github.com/Nizarjh/dots.git 
```

Navigate to the dotfiles directory:
```bash
  cd dots
```

Install Dependecies
Using AUR Helper (Arch Linux - yay):
```bash
sudo xbps-install -Syu pavucontrol brightnessctl fastfetch hyprland hyprlock kitty cava wofi Waybar jq pipewire btop htop slurp playerctl playerctl wl-clipboard
```
