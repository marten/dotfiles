# dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

## Installation

```
brew install 1password-cli
op document get rluxtqym3zcgnbakp34splkwhi >~/.ssh/id_rsa
op document get n6hm34v5azgavgzzj3x4mxea3e > ~/.ssh/id_rsa.pub

git clone git://github.com/marten/dotfiles ~/dotfiles
cd ~/dotfiles
brew bundle
./install # run dotbot for symlinking everything

cd ~
mr up
```

## Other setup

- `doom install`
- `docker login registry.roqua.nl`
