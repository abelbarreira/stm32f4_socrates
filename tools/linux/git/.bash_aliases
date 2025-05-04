# Aliases
alias clr='clear'
alias l='ls --color=auto -lah'
alias ls='ls --color=auto -lah'
alias lsl='ls --color=auto -lah'
alias rst='exec bash'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd..;cd..'
alias dud='du -h --max-depth=1'

# Git
alias gsync='git submodule sync --recursive'
alias gsuir='git submodule update --init --recursive'
alias gsur='git submodule update --recursive'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl1="git log --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' -1"
alias glg='git lg'
alias gfa='git fetch --prune --recurse-submodules'
alias ga='git add'
alias gaa='git add .'
alias gai='git add -i'
alias gs='git status'
alias gr='git restore'
alias gsr='git submodule foreach git s'
alias gm='git merge --no-ff --no-edit'
alias gc='git commit --no-edit'
alias gcam='git commit -am'
alias gb='git branch'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gpull='git pull --recurse-submodules=on-demand'
alias gpush='git push --recurse-submodules=on-demand'
alias gd='git diff'
alias gds='git diff --cached'
alias gnah='git restore .'
alias grh='git reset --hard'
alias grm='git reset --mixed'
alias geturl='git remote get-url origin'
alias seturl='git remote set-url origin'

alias grma='git rma'
alias gssync='git ssync'
alias gupdate='git update-git-for-windows'
alias gunmerged='git unmerged'
alias gpristine='git reset --hard && git clean -dfx'
alias gspristine='git submodule foreach '\''git reset --hard && git clean -dfx'\'
alias gfar='git submodule foreach git fetch --all'
alias gorid='git submodule foreach git checkout origin/develop'

## Rinse repository
alias gclean='git clean -xfdfi'
alias gsclean='git submodule foreach --recursive git clean -xfdi'
alias greset='git reset --hard'
alias gsreset='git submodule foreach --recursive git reset --hard'

# PyPi: disable SSL validation
# Read about this here https://stackoverflow.com/questions/48391750/disable-python-requests-ssl-validation-for-an-imported-module
export CURL_CA_BUNDLE=""

# git commit -m ""
function gcm {
    if [[ -z "$*" ]]; then
        git commit
    elif [[ -n "$*" ]]; then
        git commit -m "$*"
    fi
}

function grhs {
    if [ -f ".gitmodules" ]; then
        while read line; do
            POSSIBLE_SUBMODULE=$(echo $line | grep -oP 'path = [^[:blank:]]*')

            # check if a submodule was found
            if [ "$POSSIBLE_SUBMODULE" != "" ]; then
                SUBMODULE=$(echo $POSSIBLE_SUBMODULE | awk -F "path = " '{print "./"$NF}')
                pushd $SUBMODULE > /dev/null
                grhs
                popd > /dev/null
            fi
        done < .gitmodules
    else
        echo "No .gitmodules found"
    fi

    grh
}
