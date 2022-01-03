
# Check for an interactive session
[ -z "$PS1" ] && return

set -o vi

# Mis atajos
alias ls='exa'
#alias ls='ls --color=auto'
alias ll='ls -l'
alias lt='ll -snew'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias diff='colordiff'
alias grep='grep --color=auto'
alias r='fc -s '
alias vi='nvim'
alias dc='docker-compose'

# Complete after sudo
complete -cf sudo
# Complete after man
complete -cf man

export HISTCONTROL=ignoreboth
export EDITOR=nvim
export TERM=xterm

shopt -s histappend
export PROMPT_COMMAND='history -a; history -c; history -r'

export HISTFILE=${HOME}/.alvaro_hist
export HISTSIZE=300000

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[01;37m\]\$?\$(parse_git_branch) \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) \[\033[01;37m\] \W \[\033[01;37m\]>\[\033[00m\] "
#eval "$(starship init bash)"

# PATH
export PATH=/usr/lib64/ccache:$PATH:.:$HOME/utils:/sbin:~/.yarn/bin:~/.local/bin

# Colores directorios
eval `dircolors $HOME/.dir_colors`

# Colores mínimos al compilar
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Patrones de tipo ** para comandos
shopt -s globstar

xhost + &>/dev/null

# Para virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.10
source /usr/bin/virtualenvwrapper.sh

# export PATH=/home/ang/.gem/ruby/2.1.0/bin:$PATH
. /usr/share/fzf/key-bindings.bash

export DESKTOP_SESSION=KDE
export XDG_SESSION_DESKTOP=KDE
export XDG_CURRENT_DESKTOP=KDE
export QT_QPA_PLATFORMTHEME=qt5ct

# Mejorar visualización de aplicaciones java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Configuracion fzf
# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag -g "" --ignore-dir={htmlcov,__pycache__,tmp}'
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# More rg config
export RIPGREP_CONFIG_PATH=${HOME}/.ripgreprc

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Bash completion
source /usr/share/git/completion/git-completion.bash
source /usr/share/bash-completion/bash_completion

# nodejs versions with nvm
source /usr/share/nvm/init-nvm.sh

# Configure ssh agent to deploy helpapp
export AWS_REGION='eu-west-1'
eval $(keychain  --ignore-missing --eval --quiet id_rsa_bastion id_rsa dfSrvKey)

#. /opt/asdf-vm/asdf.sh

# . /opt/asdf-vm/completions/asdf.bash

# Refresh when recreate the container
export SIWAPP_TOKEN=d824a2f1f81b4f2bb6aedebbebd5ea44

[ -f /usr/share/zsh/plugins/forgit-git/forgit.plugin.zsh ] && source /usr/share/zsh/plugins/forgit-git/forgit.plugin.zsh
