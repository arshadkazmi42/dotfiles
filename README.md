# dotfiles
Personal dotfiles

## List

- [.p10k.zsh.ubuntu](https://github.com/arshadkazmi42/dotfiles/blob/main/.p10k.zsh.ubuntu) : Contains terminal setup for ubuntu
- [.p10k.zsh.mac](https://github.com/arshadkazmi42/dotfiles/blob/main/.p10k.zsh.mac) : Contains terminal setup for Mac
  - Install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
  - Install [powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - Select the powerlevel10k fonts in iterm preferences
  - Copy .p10k.zsh.{{OS}} to your home directory `~/.p10k.zsh`
  - Restart terminal
- [tmux.conf](https://github.com/arshadkazmi42/dotfiles/blob/main/tmux.conf): Tmux configuration
  - Install `tpm` using `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
  - Copy `tmux.conf` file to `~/.config/tmux/tmux.conf`
  - Source the tmux file `tmux source ~/.config/tmux/tmux.conf`
  - Install [tpm](https://github.com/tmux-plugins/tpm)
  - In tmux terminal run `CTRL + B + I` to install all the plugins
