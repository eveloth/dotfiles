# 
# ███████  █████  ██   ██      ██████  ███████ 
#  ██      ██   ██  ██ ██      ██    ██ ██      
#  █████   ███████   ███       ██    ██ ███████ 
#  ██      ██   ██  ██ ██      ██    ██      ██ 
#  ██      ██   ██ ██   ██      ██████  ███████ 
# 
#----------------------------------------------
#----------------------------------------------
# Fish configuration file                    --
#                                            --
# FAX OS, 14/XII 2021, Moscow                --
#----------------------------------------------
#----------------------------------------------

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias sex='startx' 
alias ls='ls --color=auto'
alias cl='clear'
alias rc='. ~/.bashrc'
alias sun='shutdown now'

#---Changing configurations---

alias chrc='vim ~/.bashrc'
alias chxinit='vim ~/.xinitrc'
alias chmonad='vim ~/.xmonad/xmonad.hs'
alias chmobar='vim ~/.config/xmobar/xmobarrc'
alias chpic='vim ~/.config/picom.conf'
alias chfetch='vim ~/.config/neofetch/config.conf'
alias chship='vim ~/.config/starship.toml'
alias chfish='vim ~/.config/fish/config.fish'

#---Fun---

alias rrun='cmatrix -ab -C red'
alias brun='cmatrix -ab -C blue'


neofetch
theme_gruvbox dark 

starship init fish | source
