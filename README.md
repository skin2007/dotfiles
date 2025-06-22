# Dotfiles

Personal configuration files for macOS, featuring setups for **nvim**, **yabai**, **skhd**, **sketchybar**, **iTerm2**, and **bpytop**. These dotfiles focus on creating a clean and efficient tiling window manager environment with custom borders and keybindings.

---

## Table of Contents
1. [macOS Rice](#macos-rice)
2. [SketchyBar + Yabai (Video Demo)](#sketchybar--yabai-video-demo)
3. [SketchyBar](#sketchybar)
4. [SKHD Configuration for Yabai and SketchyBar](#skhd-configuration-for-yabai-and-sketchybar)
   - [Shortcuts and Actions](#shortcuts-and-actions)
     - [Window Focus](#window-focus)
     - [Window Swap](#window-swap)
     - [Window Movement (Warp)](#window-movement-warp)
     - [Layout Actions](#layout-actions)
     - [Float, Zoom, Maximize](#float-zoom-maximize)
     - [Switch Active Space](#switch-active-space)
     - [Move Window Between Spaces](#move-window-between-spaces)
     - [Move Window to Previous or Next Space](#move-window-to-previous-or-next-space)
     - [Remove Empty Spaces](#remove-empty-spaces)
     - [SketchyBar and Menu Bar Management](#sketchybar-and-menu-bar-management)
     - [Yabai Management](#yabai-management)
   - [Important Information](#important-information)
5. [Technical Details](#technical-details)
   - [Dynamic Monitor Configuration](#dynamic-monitor-configuration)
     - [Features](#features)
     - [Script Location](#script-location)
     - [Shortcut Example](#shortcut-example)
     - [Automation with launchd](#automation-with-launchd)
     - [Limitations](#limitations)
     - [Logs](#logs)
     - [Contribution](#contribution)
6. [Configuration of Yabai and SketchyBar](#configuration-of-yabai-and-sketchybar)
   - [Configured Actions](#configured-actions)
     - [General Settings](#general-settings)
     - [Window Layout and Placement](#window-layout-and-placement)
     - [Padding and Gap](#padding-and-gap)
     - [Mouse Behavior](#mouse-behavior)
     - [Window Borders](#window-borders)
     - [Application Rules](#application-rules)
     - [Space-Specific Layouts](#space-specific-layouts)
     - [Multi-Display Configurations (Optional)](#multi-display-configurations-optional)
   - [Contribution](#contribution)

---

## macOS Rice

![macOS Rice](https://github.com/user-attachments/assets/a4b4907c-e1ec-4f86-b2e2-8f355b2ea717)

---

## SketchyBar + Yabai (Video Demo)

[Watch the Demo](https://github.com/user-attachments/assets/22449e05-7ebf-4952-80b2-0c8137b8fd95)

---

## SketchyBar

![SketchyBar](https://github.com/user-attachments/assets/39455d80-4555-4140-847b-f21c756b6ca8)

---

## SKHD Configuration for Yabai and SketchyBar

The `SKHDRC` file outlines the advanced configuration of **SKHD** for managing **Yabai** and **SketchyBar**, using custom keybindings to control windows, spaces, and layouts.

### Shortcuts and Actions

#### Window Focus
| Shortcut   | Action                              |
|------------|-------------------------------------|
| `alt - j`  | Focus on the window below           |
| `alt - k`  | Focus on the window above           |
| `alt - h`  | Focus on the window to the left     |
| `alt - l`  | Focus on the window to the right    |

#### Window Swap
| Shortcut           | Action                              |
|--------------------|-------------------------------------|
| `shift + alt - j`  | Swap with the window below          |
| `shift + alt - k`  | Swap with the window above          |
| `shift + alt - h`  | Swap with the window to the left    |
| `shift + alt - l`  | Swap with the window to the right   |

#### Window Movement (Warp)
| Shortcut           | Action                              |
|--------------------|-------------------------------------|
| `ctrl + alt - j`   | Move window down                   |
| `ctrl + alt - k`   | Move window up                     |
| `ctrl + alt - h`   | Move window left                   |
| `ctrl + alt - l`   | Move window right                  |

#### Layout Actions
| Shortcut           | Action                              |
|--------------------|-------------------------------------|
| `shift + alt - e`  | Balance the layout                 |
| `shift + alt - r`  | Rotate layout (270°, clockwise)    |
| `shift + alt - y`  | Mirror layout across the Y-axis    |
| `shift + alt - x`  | Mirror layout across the X-axis    |

#### Float, Zoom, Maximize
| Shortcut   | Action                              |
|------------|-------------------------------------|
| `alt - s`  | Toggle float with center grid       |
| `alt - f`  | Toggle fullscreen                   |

#### Switch Active Space
| Shortcut   | Action                              |
|------------|-------------------------------------|
| `alt - 1`  | Create and/or focus on space 1      |
| `alt - 2`  | Create and/or focus on space 2      |
| `alt - 3`  | Create and/or focus on space 3      |
| `alt - 4`  | Create and/or focus on space 4      |
| `alt - ...`| Repeat for spaces up to 10          |
| `alt - tab`| Focus on the most recent space      |

#### Move Window Between Spaces
| Shortcut           | Action                              |
|--------------------|-------------------------------------|
| `shift + alt - 1`  | Move window to space 1             |
| `shift + alt - 2`  | Move window to space 2             |
| `shift + alt - ...`| Repeat for spaces up to 10         |

#### Move Window to Previous or Next Space
| Shortcut           | Action                              |
|--------------------|-------------------------------------|
| `shift + alt - p`  | Move window to the previous space   |
| `shift + alt - n`  | Move window to the next space       |

#### Remove Empty Spaces
| Shortcut         | Action                              |
|------------------|-------------------------------------|
| `alt - backspace`| Remove unfocused empty spaces       |

#### SketchyBar and Menu Bar Management
| Shortcut          | Action                              |
|-------------------|-------------------------------------|
| `alt - q`         | Toggle bar with dynamic configuration |

#### Yabai Management
| Shortcut           | Action                              |
|--------------------|-------------------------------------|
| `ctrl + alt - q`   | Stop Yabai service                 |
| `ctrl + alt - s`   | Start Yabai service                |
| `ctrl + alt - r`   | Restart Yabai service              |

### Important Information
To ensure Yabai works properly, execute:
```bash
sudo yabai --load-sa
```

These shortcuts are designed to optimize dynamic space and window management, improving productivity.

---

## Technical Details

### Dynamic Monitor Configuration

A script is included to dynamically manage **yabai** and **sketchybar** configurations based on connected monitors. The script detects the active monitor ID and applies specific settings for the internal monitor (ID 1) and external monitors.

#### Features
- **Internal Monitor (ID 1):**
  - `yabai -m config external_bar all:0:0`
  - Optimized for use without an external bar.
- **External Monitor (Other IDs):**
  - `yabai -m config external_bar all:15:0`
  - Configured with an external bar visible.

#### Script Location
The file `bar_toggle.sh` is located in `~/.config/skhd/` and can be executed manually or via a shortcut configured with **skhd**.

#### Shortcut Example
In the file `~/.skhdrc`, the following keybinding is set to execute the script:
```bash
alt - q : ~/.config/skhd/bar_toggle.sh
```

#### Automation with `launchd`
To automate script execution when monitor states change:
1. Create a configuration file `com.user.dynamic_monitor.plist` in `~/Library/LaunchAgents`.
2. Load the service with:
   ```bash
   launchctl load ~/Library/LaunchAgents/com.user.dynamic_monitor.plist
   ```

#### Limitations
- **yabai** does not natively support monitor-specific configurations. The script dynamically applies settings each time it is executed.
- The script must be re-run whenever monitor states change.

#### Logs
Script outputs can be monitored through log files:
- **Standard Log:** `/tmp/dynamic_monitor.log`
- **Error Log:** `/tmp/dynamic_monitor_error.log`

### Contribution
If you have ideas to improve monitor configuration management or further automate processes, feel free to open a pull request or an issue.

---

## Configuration of Yabai and SketchyBar

This section details the configuration of **Yabai** and **SketchyBar** to optimize window and layout management on macOS.

### Configured Actions

#### General Settings
- **Services:** Wait for services to be ready with `yabai --wait-for-services`.
- **Menu bar:** Completely hide macOS menu bar using:
  ```bash
  sketchybar --bar topmost=on
  yabai -m config menubar_opacity 0.0
  ```

#### Window Layout and Placement
- **Default Layout:** Set to `bsp` (Binary Space Partitioning).
  ```bash
  yabai -m config layout bsp
  ```
- **Window Placement:** New windows are positioned:
  - To the right if split is vertical.
  - Below if split is horizontal.
  ```bash
  yabai -m config window_placement second_child
  ```

#### Padding and Gap
| Configuration      | Value |
|---------------------|-------|
| Top padding         | 8     |
| Bottom padding      | 8     |
| Left padding        | 8     |
| Right padding       | 8     |
| Window gap          | 8     |

Commands:
```bash
yabai -m config top_padding 8
yabai -m config bottom_padding 8
yabai -m config left_padding 8
yabai -m config right_padding 8
yabai -m config window_gap 8
```

#### Mouse Behavior
| Configuration               | Value        |
|------------------------------|--------------|
| Mouse follows focus         | `on`         |
| Mouse modifier              | `alt`        |
| Primary mouse action        | `move`       |
| Secondary mouse action      | `resize`     |
| Window drop action          | `swap`       |

Commands:
```bash
yabai -m config mouse_follows_focus on
yabai -m config mouse_modifier alt
yabai -m config mouse_action1 move
yabai -m config mouse_action2 resize
yabai -m mouse_drop_action swap
yabai -m config focus_follows_mouse autofocus
```

#### Window Borders
| Configuration                  | Value          |
|--------------------------------|----------------|
| Border width                   | `2`            |
| Active window border color     | `0xff5ac8fa`   |
| Normal window border color     | `0xff3c3c3c`   |

Commands:
```bash
yabai -m config border_width 2
yabai -m config active_window_border_color 0xff5ac8fa
yabai -m config normal_window_border_color 0xff3c3c3c
```

#### Application Rules
Certain applications are configured to float (not managed):
| Application          | Action       |
|-----------------------|--------------|
| System Settings       | Not managed |
| Calculator            | Not managed |
| Karabiner-Elements    | Not managed |

Commands:
```bash
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^Calculator$" manage=off
yabai -m rule --add app="^Karabiner-Elements$" manage=off
```

#### Space-Specific Layouts
Each space is configured to use the `bsp` layout:
| Space | Layout |
|-------|--------|
| 1     | `bsp`  |
| 2     | `bsp`  |
| 3     | `bsp`  |
| 4     | `bsp`  |
| ...   | `bsp`  |

Commands:
```bash
yabai -m config space 1 layout bsp
yabai -m config space 2 layout bsp
...
yabai -m config space 10 layout bsp
```

#### Multi-Display Configurations (Optional)
For multiple displays, assign spaces to the second display:
```bash
sleep 2
yabai -m space 4 --display 2
yabai -m space 5 --display 2
```

### Contribution
If you have suggestions to improve or further optimize configurations for **Yabai** and **SketchyBar**, feel free to open a pull request or an issue.
