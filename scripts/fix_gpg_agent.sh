#!/bin/bash
# GPG-agent on Ubuntu Bionic complains with the following error when trying
# to use gpg-agent as an ssh-agent.
# sign_and_send_pubkey: signing failed: agent refused operation

# A search indicates the following bug report on Debian, which also
# gives a helpful hint for fixing this problem.
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835394

gpg-connect-agent updatestartuptty /bye
