# ⚡ Power Plan Switcher (AutoHotkey)

A lightweight tray utility that lets you switch Windows power plans instantly — with hotkeys and dynamic tray icons.

💡 **Tip**

If you have a keyboard with macro keys, you can bind these hotkeys to them so that you have to press only one button to switch, not three.

---

🖱️ **Tray icon reflects current power plan**  
🎯 **Hotkeys**:  
- `Ctrl + Alt + I` → High Performance  
- `Ctrl + Alt + O` → Balanced  
- `Ctrl + Alt + P` → Power Saver  

Designed to be fast, silent, and unobtrusive.

---

## ✨ Features

- 🔁 Switch between power plans using hotkeys or tray menu
- 🎨 Dynamic tray icons: Rocket 🚀, Scales ⚖️, and Turtle 🐢
- 🧠 Remembers current power plan on restart
- 💨 Helps reduce fan noise with Power Saver tweaks
- ✅ Supports both `.ahk` and compiled `.exe` use
- 📁 Works portably — no registry writes, no install required

---

## 🗂️ Folder Structure

```plaintext
power-plan-switcher/
├── power-plan-switcher.ahk
├── power-plan-switcher.exe
├── README.md
└── icons/
    ├── icons8-rocket-16-outlined.ico
    ├── icons8-scales-16-outlined.ico
    └── icons8-turtle-16-outlined.ico
```

---

## 🚀 Setup

### ✅ Option 1: Run the Script (`.ahk` file) (customizable)

1. Download and install [AutoHotkey v1.1+](https://www.autohotkey.com)
2. Clone or download this repo
3. Double-click `power-plan-switcher.ahk` to launch

### ✅ Option 2: Use the Compiled EXE (No AHK Required, but not customizable)

1. Run `power-plan-switcher.exe`
2. It will appear as a tray icon and start working immediately

---

## 🧷 Optional: Launch at Startup

1. Press `Win + R`, type `shell:startup`, press Enter  
2. Place a shortcut to either:
   - `power-plan-switcher.ahk` *(requires AutoHotkey installed)*  
   - or `power-plan-switcher.exe` *(fully portable)*

---

## 🎮 Hotkeys

| Hotkey              | Power Plan         |
|---------------------|--------------------|
| Ctrl + Alt + **I**  | High Performance   |
| Ctrl + Alt + **O**  | Balanced           |
| Ctrl + Alt + **P**  | Power Saver        |

Tray icon updates in real time to reflect the active plan.

---

## 🧰 Tray Menu

Right-click the tray icon for options:

- Switch to High Performance / Balanced / Power Saver
- Exit the script

---

## 🎨 Customization

### Change Icons

Icon files are stored in the `icons/` folder. The script uses:

```ahk
iconHigh    := A_ScriptDir "\icons\icons8-rocket-16-outlined.ico"
iconBalanced:= A_ScriptDir "\icons\icons8-scales-16-outlined.ico"
iconSaver   := A_ScriptDir "\icons\icons8-turtle-16-outlined.ico"
Replace those .ico files with your own if you want different visuals.
```

### 🧪 Behavior Tuning
To actually reduce fan noise with Power Saver, ensure the plan is configured like this:

Minimum processor state: 5%

Maximum processor state: 50–75%

System cooling policy: Passive

Set these in powercfg.cpl → Change plan settings → Advanced settings.

### 🔧 Add Your Own Power Plans
You can use your own custom power plans instead of the default High Performance, Balanced, or Power Saver.

#### 📝 Step 1: Create or Find the GUID
To list all available power plans:

```cmd
powercfg /list
```
You’ll get output like:

```mathematica
Power Scheme GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced) *
Power Scheme GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (Power saver)
Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
Power Scheme GUID: 01234567-89ab-cdef-0123-456789abcdef  (Silent Mode)
```
Copy the GUID for the plan you want to use.

#### ✍️ Step 2: Update the Script
Open power-plan-switcher.ahk and replace or add to these lines near the top:

```ahk
; Default GUIDs — replace with your own if needed
highGUID    := "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
balancedGUID:= "381b4222-f694-41f0-9685-ff5bb260df2e"
saverGUID   := "a1841308-3541-4fab-bc81-f71556f20b4a"

; Example: Add your own silent mode
silentGUID  := "01234567-89ab-cdef-0123-456789abcdef"
```
You can also modify the tray menu and add a new hotkey for your custom plan:


```ahk
Menu, Tray, Add, Silent Mode, SwitchSilent

^!s::Gosub, SwitchSilent

SwitchSilent:
    Run, powercfg /setactive %silentGUID%,, Hide
    ; Menu, Tray, Icon, [your custom icon path]  ← optional
return
```

---

## 📦 Releases
For standalone use, download the latest version from the Releases tab.

---

## 🧠 Why Use This?
Windows doesn't provide easy access to power plan switching — especially with visual feedback or hotkeys. This script fills that gap for people who:

Switch between power plans frequently (e.g., gaming vs browsing)

Want quieter fan profiles during idle/light use

Like minimal, scriptable solutions over bloated apps
