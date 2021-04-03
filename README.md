# WhatTheFar’s dotfiles

![](img/terminal.png)

> This setup is heavily inspired from [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

## Features

### Supercharge <kbd>caps lock</kbd> key

By repurposing the anachronistic <kbd>caps lock</kbd> key, we can make <kbd>control</kbd> and <kbd>escape</kbd> accessible via the home row.

- Tap <kbd>caps lock</kbd> for <kbd>escape</kbd>
- Hold <kbd>caps lock</kbd> for <kbd>control</kbd>

Say goodbye to [Emacs pinky](http://wiki.c2.com/?EmacsPinky). 👋

### (S)uper (D)uper Mode

To activate, push the <kbd>s</kbd> and <kbd>d</kbd> keys simultaneously and hold them down. Now you're in (S)uper (D)uper Mode. It's like a secret keyboard _inside_ your keyboard. (Whoa.) It's optimized for keeping you on the home row, or very close to it. Now you can:

- Use <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> for **left**/**down**/**up**/**right** respectively
- Use <kbd>a</kbd> for <kbd>option</kbd> (AKA <kbd>alt</kbd>)
- Use <kbd>f</kbd> for <kbd>command</kbd>
- Use <kbd>space</kbd> for <kbd>shift</kbd>
- Use <kbd>a</kbd> + <kbd>j</kbd> / <kbd>k</kbd> for <kbd>page down</kbd> / <kbd>page up</kbd>
- Use <kbd>i</kbd> / <kbd>o</kbd> to move to the previous/next tab
- Use <kbd>u</kbd> / <kbd>p</kbd> to go to the first/last tab (in most apps)
- Use <kbd>a</kbd> + <kbd>h</kbd> / <kbd>l</kbd> to move to previous/next word (in most apps)

[<img width="400" alt="(S)uper (D)uper Mode Keybindings" src="img/super-duper-mode.png">](img/super-duper-mode.png)

📣 Shout-out to [Karabiner's Simultaneous vi Mode](https://github.com/tekezo/Karabiner/blob/05ca98733f3e3501e0679814c3795d1cb57e177f/src/core/server/Resources/include/checkbox/simultaneouskeypresses_vi_mode.xml#L4-L10) for providing the inspiration for (S)uper (D)uper Mode. ⌨:neckbeard:✨

## Prerequisite

- Set Apple ID for App Store
- Run the following codes to:
  - Install Homebrew
  - Install oh-my-zsh

```bash
# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Bootstrapping

```bash
./bootstrap.sh
```

## Manual Setups

### Keyboard

#### Remap CAPS LOCK to ESCAPE

Go to `System Preferences -> Keyboard -> Modifier Keys...` and set Caps Lock Key to `Escape`

![](img/keyboard-keys.png)

### Accessibility

#### Zoom

Go to `System Preferences -> Accessibility -> Zoom`

- Use scroll gesture with modifier keys to zoom -> `^ Control`
- Zoom follows the keyboard focus

#### Three finger dragging

Go to `System Preferences -> Accessibility -> Mouse & Trackpad -> Trackpad Options...`

- Enable dragging -> `three finger drag`

### Alfred

In advanced setting page, set preferences folder to `alfred3`.

![](img/alfred-sync.png)

## References

[Bash scripting cheatsheet](https://devhints.io/bash)

[Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

    Copyright 2019 Jakpat Mingmongkolmitr

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
