# Hyprland Dotfiles
Based void theme 
![View](https://github.com/Nizarjh/dots/blob/main/View.png)

## 🔗 Related projects

This setup uses:

- 👉 **[wofi-bluetooth](https://github.com/Nizarjh/wofi-bluetooth)** — Bluetooth menu for Wofi  
- 👉 **[Blackhole-vl](https://github.com/Event-Horizon-VL/blackhole-vl)** — community repository for Void Linux packages  

If you like this setup, consider giving them a ⭐
## Add the [Blackhole-vl](https://github.com/Event-Horizon-VL/blackhole-vl) community repo
1. Create an entry in `/etc/xbps.d/` and add this repository  
   (replace the architecture as needed):

    ```
    sudo cp /usr/share/xbps.d/00-repository-main.conf /etc/xbps.d/
    sudo sed -i "1i repository=https://mirror.black-hole.dev/$(xbps-uhelper arch)" /etc/xbps.d/00-repository-main.conf
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

```bash
sudo xbps-install -Syu pavucontrol brightnessctl fastfetch hyprland hyprlock kitty cava wofi Waybar jq pipewire btop htop slurp playerctl playerctl wl-clipboard
```
More pictures

![View](https://github.com/Nizarjh/dots/blob/main/photo_2026-04-07_05-29-08.jpg)
![View](https://github.com/Nizarjh/dots/blob/main/image_2026-04-07_05-26-28.png)
![View](https://github.com/Nizarjh/dots/blob/main/photo_2026-04-07_05-28-50.jpg)
