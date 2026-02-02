# It will append to the path if you don't do this; I think custom user paths should be evaluated first anyways
export MISE_ACTIVATE_AGGRESSIVE=1

[[ $(command -v mise) ]] && eval "$(mise activate zsh)"
