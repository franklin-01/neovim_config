# neovim_config

### dependencies:
- neovim@^0.12
- nodejs@^16.16
- npm@^7.10
- python@^3.7
- zsh@^4.0
- git
- ripgrep
- a C compiler (make + gcc/clang), needed to build telescope-fzf-native
### not required
- rust_analyzer
- dart
- flutter
- go
- gopls
- java (JDK), needed for jdtls and kotlin_lsp
- Xcode/Swift toolchain (macOS only), needed for sourcekit
- Claude Code CLI, needed for the claudecode.nvim integration

### How to install
- install all dependencies packages above
- install a nerdfont and set it on your terminal emulator (alacritty, kitty, foot...)
- run the following command:
 ```sh
$ mkdir -p $HOME/.config/nvim && cd $HOME/.config/nvim && git clone https://github.com/franklin-01/neovim_config.git .
 ```

#### tips
if you are not using zsh, the internal shell can be changed in:
```sh
$HOME/.config/nvim/lua/v2/plugin/plugins/toggle-term.lua:82
```

there are extra plugins for go, java, rust and (dart/flutter), it can be activated by theirs respective lines in:
```sh
$HOME/.config/nvim/lua/v2/plugin/init.lua
```

to use golang debug install dvl:
```sh
$ go install github.com/go-delve/delve/cmd/dlv@latest
```
