#!/bin/bash
#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v1.0.0
#
# Alh's SSH Unlock script.

# 
set +x

# 
read -p "Do you want to unlock your SSH keys [y/n] " unlock_ssh_keys
# 
case $unlock_ssh_keys in
    y)
        # 
        echo "├─ Unlocking SSH keys ..."
        # 
        case $NAME in
        DESKTOP-ORI7896)
            echo "└─ For: 'DESKTOP-ORI7896'"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896.pem      # Under..!
            [[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
            [[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!

            # For my WSLs (Debian, Ubuntu, ...)
            [[ ! -f ~/.keychain/DESKTOP-ORI7896-sh ]] || source ~/.keychain/DESKTOP-ORI7896-sh
        ;;
        DESKTOP-HP6740)
            echo "└─ For: 'DESKTOP-HP6740'"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_ed25519_alban_desktop-hp6740.pem ]] || /usr/bin/keychain -q ~/.ssh/id_ed25519_alban_desktop-hp6740.pem        # UnderKiMo..!

            # For my WSLs (Debian, Ubuntu, ...)
            [[ ! -f ~/.keychain/DESKTOP-ORI7896-sh ]] || source ~/.keychain/DESKTOP-HP6740-sh
        ;;
        CL-3GKR3F3)
            echo "└─ For: 'CL-3GKR3F3'"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_ed25519_alban_cdiscount.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_cdiscount.pem          # UnderMo..!
            [[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
            [[ ! -f ~/.ssh/id_rsa_albandaquino_cdiscount.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_albandaquino_cdiscount.pem    # Ori..!
            [[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!

            # For my C-Discount Work Computer
            [[ ! -f ~/.keychain/CL-3GKR3F3-sh ]] || source ~/.keychain/CL-3GKR3F3-sh
        ;;
        zorinos-vmw)
            echo "└─ For: 'zorinos-vmw'"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896.pem      # Under..!
            [[ ! -f ~/.ssh/id_ed25519_alban_desktop-hp6740.pem ]] || /usr/bin/keychain -q ~/.ssh/id_ed25519_alban_desktop-hp6740.pem        # UnderKiMo..!
            [[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
            [[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!

            # For my Zorin OS Virtual Machine
            [[ ! -f ~/.keychain/zorinos-vmw-sh ]] || source ~/.keychain/zorinos-vmw-sh
        ;;
        *)
            echo "├─ For: (Unregistered)"
            echo "└─ Skipping unlock."
        ;;
        esac
    ;;
    *)
        echo "└─ Skipping unlock."
    ;;
esac
