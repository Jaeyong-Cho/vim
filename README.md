# Vim Configuration

## Installation

```sh
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

```sh
cp ./.ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe
```

## Change Syntax Highlighting Colors
```sh
cp -r ./jellybeans.vim ./vim-cpp-enhanced-highlight ~/.vim/bundle/
```
# Tmux Configuration
## Tmux Plugin Install
1. install tpm (tmux plugin manager)
2. in tmux
```sh
<Ctrl-b> I
```

## Tmux pop and set active pane background color
```sh
cp -r ./tmux-pop ~/.tmux/plugins
```
