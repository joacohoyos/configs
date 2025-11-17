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

source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# direnv
eval "$(direnv hook zsh)"
 
# Autojump
[[ -s /Users/joaquin/.autojump/etc/profile.d/autojump.sh ]] && source /Users/joaquin/.autojump/etc/profile.d/autojump.sh


 # bun
 export BUN_INSTALL="$HOME/.bun"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
 export LANG=en_US.UTF-8
 export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# asdf
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

export GEMINI_API_KEY=$(pass show gemini-api-key)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/joaquin/.docker/completions $fpath)

# autoload -Uz compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
# autoload -U +X compinit && compinit
# End of Docker CLI completions

complete -o nospace -C /opt/homebrew/bin/terraform terraform

eval "$(ssh-agent -s)" &>/dev/null
ssh-add ~/.ssh/id_rsa_github_personal &>/dev/null

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/configs/zsh/git.zsh
source ~/configs/zsh/history.zsh

bindkey -v
bindkey '^R' history-incremental-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -s ^f "tmux-fzf\n"
setopt auto_cd

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
