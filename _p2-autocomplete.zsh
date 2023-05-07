function _p2() {

    _subcmd() {
        local commands
        commands=(
            'attach:Attach into container'
            'build:Build Docker image'
            'rm:Remove container and its volumes'
            'kill:Stop container from running'
            'volume:Enter into container volume'
            'ls:List pwnpad instances'
            'update:Update image to the latest build'
        )
        _describe 'command' commands
    }

    _getcontainer() {
        local listed=${words[${#words[@]}-1]}
        local containers=( $(docker container ls -a --filter "ancestor=platypew/pwnpad" --filter "ancestor=platypew/pwnpad:extra" --format "{{.Names}}") )

        for con in "${containers[@]}"; do
            if [[ "$con" == "$listed" ]]; then
                return
            fi
        done

        compadd $containers
    }

    _arguments -C \
        '1: :_subcmd' \
        '*::arg:->args'

    case $state in
        args)
            case $line[1] in
                attach)
                    _getcontainer
                    _arguments -C \
                        '(-P)-P[use privileged mode (not recommended)]' \
                        '(-X)-X[support X11 forwarding]' \
                        '(-D)-D[run as daemon mode]' \
                        '(-d)-d[display]' \
                        '(-e)-e[use environmental variables]' \
                        '(-p)-p[port range]' \
                        '(-v)-v[mount volumes]' \
                        '(-i)-i[select image]'
                    ;;
                build)
                    _arguments -C : \
                        '-i[image]' \
                        '-p[platform]'
                    ;;
                rm)
                    _getcontainer
                    _arguments -C : \
                        '-f[forcefully remove mounted shared directory]'
                    ;;
                kill | volume)
                    _getcontainer
                    ;;
            esac
            ;;
    esac
}

compdef _p2 p2
