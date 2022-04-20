# Manual Install

## Applications
- [VS Code](https://code.visualstudio.com/)
- [Cmder](https://cmder.net/)
- [Git](https://git-scm.com/download/win)
- [Vim](https://www.vim.org/)
- [NodeJS](https://nodejs.org/en/)

## Installation Instructions

### Cmder

#### Cmder Installation
1. Download from [Cmder](https://cmder.net/).
2. Extract everything to C:\tools
3. Add c:\tools to PATH 

#### Cmder Confguration
1. Configure legacy console ([due to this issue](https://github.com/Maximus5/ConEmu/issues/2384))
    1. Launch cmder (start > run > cmder)
    2. Bottom right corner > Click settings menu (hamburger menu)
    3. Debug
    4. Properties
    5. Use legacy console (checkbox)
2. Configure startup path
    1. Launch cmder (start > run > cmder)
    2. Bottom right corner > Click settings menu (hamburger menu)
    3. Settings
    4. Startup > Tasks
    5. Select Cmder
    6. Startup Directory
    7. Set startup directory / close
    8. Save Settings

### Git

Download and install from [Git](https://git-scm.com/download/win) or:
    `winget install --id Git.Git -e --source winget`

#### Git SSH Configuration

1. cd c:\Users\[name]\.ssh
2. Run `ssh-keygen`
3. Copy `c:\Users\[name]\.ssh\id_rsa.pub
4. Upload as a Git SSH key

#### Git Config Setup

Copy gitconfig to c:\Users\[name]\.gitconfig

### Vim

Download and install from [Vim](https://www.vim.org/).

#### Vim Configuration

Copy vimrc to c:\Users\[name]\.vimrc