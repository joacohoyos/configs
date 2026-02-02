export ZSH="/Users/Joaquin/.oh-my-zsh"
plugins=(git  docker docker-compose zsh-autosuggestions zsh-syntax-highlighting vi-mode)
source $ZSH/oh-my-zsh.sh

#GO
export GOPATH=~/go
export PATH=/usr/local/bin:/sbin:/usr/sbin:~/.gem/ruby/3.0.0/bin:~/configs/bashScripts:$PATH:$GOPATH/bin:$HOME/bin

export DENO_INSTALL="/Users/joaquin/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk 
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export M2_HOME="$HOME/tmp/apache-maven-3.9.3"
export PATH="$JAVA_HOME/bin:$M2_HOME/bin:$PATH"

#NI
export NI_DEFAULT_AGENT="pnpm" 
export NI_GLOBAL_AGENT="pnpm"

# aiken
export PATH="$HOME/.aiken/bin:$PATH"

# Gcloud
## The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joaquin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joaquin/Downloads/google-cloud-sdk/path.zsh.inc'; fi
## The next line enables shell command completion for gcloud.
if [ -f '/Users/joaquin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joaquin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export RUST_WITHOUT=rust-docs
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export LANG=en_US.UTF-8
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
[ -s "/Users/joaquin/.bun/_bun" ] && source "/Users/joaquin/.bun/_bun"

# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# direnv
eval "$(direnv hook zsh)"
 
# Autojump
[[ -s /Users/joaquin/.autojump/etc/profile.d/autojump.sh ]] && source /Users/joaquin/.autojump/etc/profile.d/autojump.sh



# asdf
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

export GEMINI_API_KEY=$(pass show gemini-api-key)

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/joaquin/.docker/completions $fpath)

autoload -Uz compinit bashcompinit
compinit
bashcompinit
# End of Docker CLI completions

complete -o nospace -C /opt/homebrew/bin/terraform terraform

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" &>/dev/null
  ssh-add ~/.ssh/id_rsa_github_personal &>/dev/null
fi



# NVIM
alias ll="ls -lh"
alias cc="claude"
alias e="nvim ."
alias oc="opencode"
alias ocr="opencode run"
alias ep="nvim"
alias ggl="git pull origin"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ......="cd ../../../.."


export EDITOR='nvim'


if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

eval "$(starship init zsh)"


# pnpm
export PNPM_HOME="/Users/joaquin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"
