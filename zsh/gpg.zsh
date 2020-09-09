if command -v gpgconf >/dev/null
then
    gpgconf --launch gpg-agent

    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"

    TSOCK=$(gpgconf --list-dirs agent-ssh-socket || true)
    if [[ -n "$TSOCK" ]]
    then
        export SSH_AUTH_SOCK="$TSOCK"
        unset TSOCK
    fi
fi
