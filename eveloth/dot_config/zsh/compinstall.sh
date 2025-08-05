setup_completions_for(){
  if [[ $(command -v $1 ) ]]; then
    mkdir -p ${HOME}/.${1}/completions
    $1 completion zsh > "${HOME}/.${1}/completions/_${1}"
    fpath=(${HOME}/.${1}/completions $fpath)
  else
    print "${1} completions are configured but ${1} is not installed"
  fi
}

zstyle :compinstall filename '/home/eveloth/.zshrc'

# setup_completions_for docker

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

if ! [[ -v SKIP_COMPLETIONS ]]; then
  complete -o nospace -C /usr/bin/terraform terraform
fi

