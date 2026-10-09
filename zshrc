
export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin

export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources

# ls - eza (farbe für ls)B
alias ls='eza --icons=auto'
alias ll='eza --icons -l --group-directories-first'
alias la='eza --icons -la --group-directories-first'

# Syntaxhighliting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship (Prompt)
eval "$(starship init zsh)"

# Zoxide (schnelles cd)
eval "$(zoxide init zsh)"
alias cd="z"  # Damit 'cd' automatisch zoxide nutzt

# Fish-like Features
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Private Konfiguration (Keys, Tokens) - NICHT im Git
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi


# Yazi Wrapper: 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/karlkiehstaller/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/karlkiehstaller/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/karlkiehstaller/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/karlkiehstaller/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

