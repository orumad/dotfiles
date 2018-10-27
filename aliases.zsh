# Shortcuts
alias c="clear"
alias cat="bat"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reload="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
weather() { curl -4 es.wttr.in/${1:-antwerp} }
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Laravel
alias art="php artisan"
alias ams="php artisan migrate:fresh --seed"

# Git
alias gl="glola"
alias gcm="git commit -m"
alias gpo="git push origin"
alias glo="git pull origin"
alias dracarys="git reset --hard && git clean -df"

# gitignore.io
function gi() { curl -sL https://www.gitignore.io/api/$@ ;}
_gitignoreio_get_command_list() {
  curl -sL https://www.gitignore.io/api/list | tr "," "\n"
}
_gitignoreio () {
  compset -P '*,'
  compadd -S '' `_gitignoreio_get_command_list`
}
compdef _gitignoreio gi
