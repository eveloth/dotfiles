alias cp='cp -v'
alias mv='mv -v'
alias cl='clear'
alias sun='loginctl poweroff'

alias lg='lazygit'

alias ip='ip -color'
alias ls='eza'
alias la='eza -lah --group-directories-first'

alias cm='chezmoi'
alias cmc='chezmoi cd'
alias cme='chezmoi edit'
alias cmdi='chezmoi diff'
alias cma='chezmoi apply'

alias dc='docker compose'
alias tf='terraform'
alias kc='kubectl'
alias kx='kubectx'
alias kns='kubens'
alias kda='kubectl delete all --all'

alias esync='sudo eix-sync'
alias eupdate='sudo emerge -avuND --keep-going @world'
alias ecleanup='sudo emerge -avc'

alias ts='tree-sitter'
alias tsg='tree-sitter generate'
alias tsp='tree-sitter parse'

alias zzz='zellij'
alias qemu='qemu-system-x86_64'

alias gs='git status'
alias gc='git commit -m'
alias gw='git worktree'

alias vimt='nvim $(mktemp)'

alias rc='sudo rc-service'
alias urc='rc-service -U'
alias rca='sudo rc-update add'
alias rcd='sudo rc-update del'
alias urca='rc-update -U add'
alias urcd='rc-update -U del'

alias yap='nvim $(date +%F).md'
