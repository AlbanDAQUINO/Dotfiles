#!/bin/zsh
#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v1.1.0
#
# Alh's SSH Unlock script.

# 
set +o allexport
set +x

# Prompt the user
# read -n 1 -p "Do you want to unlock your SSH keys [y/n] " _SSH_KEY_UNLOCK
read -q -t 3 _SSH_KEY_UNLOCK\?"Do you want to unlock your SSH keys [y/n] "

# 
case $_SSH_KEY_UNLOCK in
    y)
        # 1: ├─ 2: └─
       case $NAME in
        DESKTOP-ORI7896)
            # Display Console Message
            printf "\n├─ Unlocking SSH keys for 'Desktop-ORI7896'.\n"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896.pem      # Under..!
            [[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
            [[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        zorinos-vmw)
            # Display Console Message
            printf "\n├─ Unlocking SSH keys for 'ZorinOS-vMW'.\n"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896.pem      # Under..!
            [[ ! -f ~/.ssh/id_ed25519_alban_desktop-hp6740.pem ]] || /usr/bin/keychain -q ~/.ssh/id_ed25519_alban_desktop-hp6740.pem        # UnderKiMo..!
            [[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
            [[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        desktop-hp6740)
            # 
            printf "\n├─ Unlocking SSH keys for 'Desktop-HP6740'.\n"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_ed25519_alban_desktop-hp6740.pem ]] || /usr/bin/keychain -q ~/.ssh/id_ed25519_alban_desktop-hp6740.pem        # UnderKiMo..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        CL-3GKR3F3)
            # Display Console Message
            printf "\n├─ Unlocking SSH keys for 'CL-3GKR3F3'.\n"
            # Loading the SSH key(s) using KeyChain.
            [[ ! -f ~/.ssh/id_ed25519_alban_cdiscount.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_cdiscount.pem          # UnderMo..!
            [[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
            [[ ! -f ~/.ssh/id_rsa_albandaquino_cdiscount.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_albandaquino_cdiscount.pem    # Ori..!
            [[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        *)
            # Display Console Message
            printf "\n├─ Unregistered terminal, skipping unlock (Error: '$NAME').\n"
            # Set the SSL_KEY_LOADED Variable to ERROR
            _SSH_KEY_LOADED=ERROR.UNREGISTERED
            ;;
        esac
        ;;
    n)
        # Display Console Message
        printf "\n├─ User input: Skipping forced.\n"
        ;;
    *)
        # Display Console Message
        # printf "\n├─ Timeout...\n"
        printf "\n"
        ;;
esac

export _SSH_KEY_UNLOCK
export _SSH_KEY_LOADED
