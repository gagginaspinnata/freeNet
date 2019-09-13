#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Available Commands:" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "addhost " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Add 'host' domain to allowed domain list in Squid Proxy" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "alterarlimite " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Change the maximum number of concurrent connections allowed for a user" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "alterarsenha " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Change a user's password" ; echo "" ;
tput setaf 2 ; tput bold ; printf '%s' "criarusuario " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Create SSH user with no terminal access and expiration date" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "delhost " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Remove host domain from list of allowed domains in Proxy Squid" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "expcleaner " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Remove expired SSH users" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "mudardata " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Change a user's expiration date" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "remover " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Remove an SSH User" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "sshlimiter " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Concurrent SSH connection limiter (must be run in a screen session)" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "sshmonitor " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Check each user's simultaneous connection number" ; echo ""
tput sgr0