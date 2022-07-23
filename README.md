# Vim Configuration

## Installation
```sh
cp ./.ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe
```

```sh
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```
## Change Syntax Highlighting Colors
```sh
cp -r ./jellybeans.vim ./vim-cpp-enhanced-highlight ~/.vim/bundle/
```


# Tmux Configuration
## Tmux Plugin Install
1. install tpm (tmux plugin manager)
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/.tmux/plugins/tpm
./tpm
```
2. in tmux
```sh
cp ./.tmux.conf ~/
```
```sh
<Ctrl-b> I
```

## Tmux pop and set active pane background color
```sh
cp -r ./tmux-pop ~/.tmux/plugins
```
