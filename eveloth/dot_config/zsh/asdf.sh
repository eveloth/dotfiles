if [[ $(command -v asdf) ]]; then
  # add asdf shims to path
  path=(${HOME}/.asdf/shims $path )
  #setup completions
  if [[ -d $HOME/.asdf/completions ]] || [[ $- != *i* ]]; then
    fpath=(${HOME}/.asdf/completions $fpath)
  fi
  mkdir -p $HOME/.asdf/completions
  asdf completion zsh > "$HOME/.asdf/completions/_asdf"
  fpath=(${HOME}/.asdf/completions $fpath)
else
  print "ASDF is configured but not installed"
fi
