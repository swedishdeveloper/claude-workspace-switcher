#!/usr/bin/env bash
# Bash completion for cw (Claude Code workspace switcher)

_cw() {
    local cur prev commands
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    commands="list add remove login set-key use alias help"

    case "$COMP_CWORD" in
        1)
            COMPREPLY=($(compgen -W "$commands" -- "$cur"))
            ;;
        2)
            case "$prev" in
                use|remove|rm|login|set-key|key)
                    local profiles
                    profiles="$(cw --completions 2>/dev/null)"
                    COMPREPLY=($(compgen -W "$profiles" -- "$cur"))
                    ;;
            esac
            ;;
    esac
}

complete -F _cw cw
