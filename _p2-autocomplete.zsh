function _p2() {

    _subcmd() {
        local commands
        commands=(
            'attach:Attach into container'
            'build:Build Docker image'
            'rm:Remove container and its volumes'
            'kill:Stop container from running'
            'volume:Enter into container volume'
            'ls:List pwnboxes'
            'update:Update image to the latest build'
        )
        _describe 'command' commands
    }

    _getcontainer() {
        compadd `docker container ls -a --filter "ancestor=platypew/pwnbox2" --filter "ancestor=platypew/pwnbox2:extra" --format "{{.Names}}" | tr "\n" " "`
    }

    local state
    _arguments -C \
        '1: :_subcmd' \
        '*::arg:->args'

    case $state in
        args)
            case $line[1] in
                attach)
                    _getcontainer
                    _arguments  -s : \
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
                    _arguments -s : \
                        '-i[image]' \
                        '-p[platform]'
                    ;;
                rm)
                    _getcontainer
                    _arguments -s : \
                        '-f[forcefully remove mounted shared directory]'
                    ;;
                kill)
                    _getcontainer
                    ;;
                volume)
                    _getcontainer
                    ;;
            esac
            ;;
    esac
}

compdef _p2 p2
