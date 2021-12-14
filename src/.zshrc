# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load zsh plugins' config
source ~/.zsh-plugin

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=()

# source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### Added by Zinit's installer
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi

# source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

setopt promptsubst
PS1="READY >" # provide a simple prompt till the theme loads

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit wait lucid for \
        OMZL::clipboard.zsh \
        OMZL::git.zsh \
        OMZL::history.zsh \
        OMZL::termsupport.zsh \
  atload"unalias grv" \
        OMZP::git

# https://github.com/Zsh-Packages/fzf
zinit pack"bgn-binary+keys" for fzf

zinit wait lucid light-mode for \
    Aloxaf/fzf-tab

zinit wait lucid for \
    OMZP::colored-man-pages \
    OMZP::docker-compose \
    OMZP::kubectl \
    OMZP::helm \
    OMZP::minikube \
    OMZP::npm \
    OMZP::yarn \
    OMZP::golang

zinit ice wait lucid \
    atload'function _aws_profiles {
        local -a tmp=($(aws_profiles))
        _describe "command" tmp
    }
    compdef _aws_profiles asp acp aws_change_access_key'
zinit snippet OMZP::aws

zinit wait lucid has'docker' for \
    as'completion' is-snippet \
        'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker' \
    as'completion' is-snippet \
        'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose' \

# zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
#     atpull'%atclone' pick"clrs.zsh" nocompile'!' \
#     atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
# zinit light trapd00r/LS_COLORS

# The next line updates PATH and enables shell command completion for gcloud.
zinit wait lucid as'null' is-snippet if'[[ "$OSTYPE" = *darwin* ]]' for \
    atload'source "${HOMEBREW_PREFIX:-/usr/local}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"' \
        /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc \
    atload'source "${HOMEBREW_PREFIX:-/usr/local}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"' \
        /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

zinit ice wait lucid depth'1' \
    atclone'PYENV_ROOT="${HOME}/.pyenv" ./libexec/pyenv init - > zpyenv.zsh' \
    atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" compile'{zpyenv,completions/*}.zsh' nocompile'!' \
    atload'
    # make zsh completion works no need source in zshrc. #1644
    # https://github.com/pyenv/pyenv/pull/1644
    _pyenv() {
        local -a comples
        if [ "${#words}" -eq 2 ]; then
            comples=($(pyenv commands))
        else
            comples=($(pyenv completions ${words[2,-2]}))
        fi
        _describe -t comples 'comples' comples
    }
    compdef _pyenv pyenv' \
    id-as'pyenv'
zinit light pyenv/pyenv

zinit ice wait lucid depth'1' \
    atclone'PYENV_ROOT="${HOME}/.pyenv" ./bin/pyenv-virtualenv-init - > zpyenv-virtualenv.zsh' \
    atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
    as'command' pick'bin/*' src"zpyenv-virtualenv.zsh" compile'*.zsh' nocompile'!' \
    id-as'pyenv-virtualenv'
zinit light pyenv/pyenv-virtualenv

# inspired from thefuck, built-in OMZ plugin
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/thefuck
# zinit wait lucid for \
#     OMZP::thefuck \
zinit ice wait lucid \
    atclone'thefuck --alias > zthefuck.zsh' atpull'%atclone' \
    src'zthefuck.zsh' \
    id-as'thefuck' \
    if'[[ -n $commands[thefuck] ]]'
zinit light whatthefar/null

zinit ice wait lucid \
    atload'. $(pack completion --shell zsh)' \
    id-as'pack' \
    if'[[ -n $commands[pack] ]]'
zinit light whatthefar/null

# After finishing the configuration wizard change the atload'' ice to:
# -> atload'source ~/.p10k.zsh; _p9k_precmd'
zinit ice lucid atload'source ~/.p10k.zsh; _p9k_precmd' nocd
# [ERROR]: When using instant prompt, Powerlevel10k must be loaded before the first prompt.
# zinit ice wait'!' lucid atload'source ~/.p10k.zsh; _p9k_precmd' nocd
zinit light romkatv/powerlevel10k

# [ERROR]: When using Powerlevel10k with instant prompt, prompt_cr must be unset.
# You can:
#   - Recommended: call p10k finalize at the end of ~/.zshrc.
#     You can do this by running the following command:

#       echo '(( ! ${+functions[p10k]} )) || p10k finalize' >>! ~/.zshrc
(( ! ${+functions[p10k]} )) || p10k finalize

