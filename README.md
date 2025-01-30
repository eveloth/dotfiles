# dotfiles

This repo uses [chezmoi](https://www.chezmoi.io) as a dotfiles manager. If you want to try it out:
- [install](https://www.chezmoi.io/install/) chezmoi
- run `chezmoi init https://github.com/eveloth/dotfiles.git`
- run `chezmoi diff` to see what changes to your home directory it will apply
- run `chezmoi apply -v`

Please note that the former will override **everything** configured in this repo. You can also just browse the repo
and copy over only the files that you need. As you can see `chezmoi` stores files like `.zshrc` in `dot_zshrc` format, so
you should adjust filenames accordingly by renaming them.
