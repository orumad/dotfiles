# Shortcuts
alias c="clear"
alias cat="bat"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reload="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
weather() { curl -4 es.wttr.in/manilva }
# alias quehago="echo '¯\_(ツ)_/¯' | pbcopy"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias ip="curl ifconfig.co"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias firmware="cd $HOME/Code/muving/firmware"

# Laravel
alias art="php artisan"
alias t="clear && phpunit"
alias ams="php artisan migrate:fresh --seed"
alias aaps="php aaps"

# Composer Package development
composer-link() {
  repositoryName=${3:-local}

  composer config repositories.$repositoryName '{"type": "path", "url": "'$1'", "options": {"symlink": true}}' --file composer.json
  composer require $2 @dev
}
# Add HAYAI dependency to a project
composer-hayai() {
  branchName=dev-${1:-master}

  composer config repositories.laravel-hayai '{"type": "vcs", "url": "git@bitbucket.org:d2pro/laravel-hayai.git"}' --file composer.json
  composer require d2pro/laravel-hayai:$branchName
}

# Git
alias gl="glola"
alias gcm="git commit -m"
alias gpo="git push origin"
alias glo="git pull origin"
# Be careful!!
alias dracarys="git reset --hard && git clean -df"
# Made a complete re-Tagging to the last/current commit
retag() {
  git tag --delete $1
  git push --delete origin $1
  git tag $1
  git push origin --tags
}
# Quickly commit and push changes
wip() {
  msg=${1:-🚧 work in progress 🤗}

  git add --all
  git commit -a -m $msg
  git push origin
}
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

# Visual Studio Code
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
