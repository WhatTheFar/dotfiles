# WhatTheFar’s dotfiles

![](img/terminal.png)

> This setup is heavily inspired from [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

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
