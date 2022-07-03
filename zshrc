# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/panickk/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


POWERLEVEL10K_SHORTEN_DIR_LENGTH=2
POWERLEVEL10K_MODE='awesome-patched'
POWERLEVEL10K_PROMPT_ON_NEWLINE=true

POWERLEVEL10K_VCS_GIT_ICON=''
POWERLEVEL10K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL10K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL10K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL10K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL10K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL10K_RAM_BACKGROUND="black"
POWERLEVEL10K_RAM_FOREGROUND="249"
POWERLEVEL10K_RAM_ELEMENTS=(ram_free)

POWERLEVEL10K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
POWERLEVEL10K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{black} `date +%T` \UE12E %f%k%F{white}%f "

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm rvm background_jobs ram battery)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status load ram) 




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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
plugins=(
    git
    history
    command-not-found
    composer
    npm
    macos
    sudo
    vagrant
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#LF
bindkey -v
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
 
bindkey -s '^o' 'cd && ranger\n'


# Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias i3config="sudo -E nvim ~/.config/i3/config"
alias vimconfig="nvim ~/.vimrc"
alias ll='colorls -lA --sd --group-directories-first'
alias ls='colorls --group-directories-first'
alias configd="cd ~/.config/"
alias rwall='feh /home/panickk/Wallpapers/ --bg-fill -z'
alias cmatrix="cmatrix -C blue -b"
alias pipes-sh='pipes.sh -c 4'
alias tty-clock='tty-clock -s -c -C 4'
alias pacman='pacman --color=auto'
alias runblender='~/Desktop/Apps/Blender/blender'
alias tb='taskbook'
alias decay="sh ~/custom-scripts/print_colors.sh"
alias panes="sh ~/custom-scripts/panes.sh"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PF_ASCII="arch"

# CS50 Aliases
alias cc50="clang -fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow -lcrypt -lcs50 -lm"

