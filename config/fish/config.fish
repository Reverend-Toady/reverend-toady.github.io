# get rid of fish greeting
set fish_greeting ""

# aliases
alias cat "bat $argv"
alias py "bpython"

# exa aliases 
alias tree "exa --icons --color=always -s mod -r -T -L 3"
alias ls "exa --icons --color=always -s mod -r -T -L 1"
alias la "exa --header --binary --modified --created --no-user --no-permissions --long --icons --color=always -a -r"

# bind ctrl-o to ranger cd
bind \co ranger-cd
