#!/bin/zsh
#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v1.2.0
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
        # 1: ├─ 2: └─  3: │
       case $NAME in
        DESKTOP-ORI7896)
            # Display Console Message
            printf "\n├─ Unlocking SSH keys for 'Desktop-ORI7896'.\n"
            # Loading the SSH key(s) using KeyChain.
            printf "│  ├─ SSH key: 'id_rsa_alban_desktop-ori7896'\n"
            [ -f ~/.ssh/id_rsa_alban_desktop-ori7896 ] && /usr/bin/keychain --nogui -q ~/.ssh/id_rsa_alban_desktop-ori7896          # Under..!
            printf "│  ├─ SSH key: 'id_ed25519_albandaquino_gmail'\n"
            [ -f ~/.ssh/id_ed25519_albandaquino_gmail ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_albandaquino_gmail        # Ori..
            printf "│  ├─ SSH key: 'id_ed25519_alban_devops'\n"
            [ -f ~/.ssh/id_ed25519_alban_devops ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_alban_devops                    # Ori..!
            printf "│  └─ SSH key: 'id_ed25519_groot'\n"
            [ -f ~/.ssh/id_ed25519_groot ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_groot                                  # Gro..!
            # Set the SSL_KEY_LOADED Variable to DONE
            SSH_KEY_LOADED="DONE"
            ;;
        zorinos-vmw)
            # Display Console Message
            printf "\n├─ Unlocking SSH keys for 'ZorinOS-vMW'.\n"
            # Loading the SSH key(s) using KeyChain.
            printf "│  ├─ SSH key: 'id_rsa_alban_desktop-ori7896'\n"
            [ -f ~/.ssh/id_rsa_alban_desktop-ori7896 ] && /usr/bin/keychain --nogui -q ~/.ssh/id_rsa_alban_desktop-ori7896          # Under..!
            printf "│  ├─ SSH key: 'id_ed25519_alban_desktop-hp6740'\n"
            [ -f ~/.ssh/id_ed25519_alban_desktop-hp6740 ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_alban_desktop-hp6740    # UnderKiMo..!
            printf "│  ├─ SSH key: 'id_ed25519_albandaquino_gmail'\n"
            [ -f ~/.ssh/id_ed25519_albandaquino_gmail ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_albandaquino_gmail        # Ori..
            printf "│  └─ SSH key: 'id_ed25519_alban_devops'\n"
            [ -f ~/.ssh/id_ed25519_alban_devops ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_alban_devops                    # Ori..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        desktop-hp6740)
            # 
            printf "\n├─ Unlocking SSH keys for 'Desktop-HP6740'.\n"
            # Loading the SSH key(s) using KeyChain.
            printf "│  └─ SSH key: 'id_ed25519_alban_desktop-hp6740'\n"
            [ -f ~/.ssh/id_ed25519_alban_desktop-hp6740 ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_alban_desktop-hp6740            # UnderKiMo..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        CL-3GKR3F3)
            # Display Console Message
            printf "\n├─ Unlocking SSH keys for 'CL-3GKR3F3'.\n"
            # Loading the SSH key(s) using KeyChain.
            printf "│  ├─ SSH key: 'id_ed25519_alban_cdiscount'\n"
            [ -f ~/.ssh/id_ed25519_alban_cdiscount ] && /usr/bin/keychain --nogui -q ~/.ssh/id_ed25519_alban_cdiscount              # UnderMo..!
            printf "│  └─ SSH key: 'id_rsa_albandaquino_cdiscount'\n"
            [ -f ~/.ssh/id_rsa_albandaquino_cdiscount ] && /usr/bin/keychain --nogui -q ~/.ssh/id_rsa_albandaquino_cdiscount        # Ori..!
            # Set the SSL_KEY_LOADED Variable to DONE
            _SSH_KEY_LOADED=DONE
            ;;
        *)
            # Display Console Message
            printf "\n├─ Unregistered terminal, skipping unlock (Error: '$NAME').\n"
            # Set the SSL_KEY_LOADED Variable to ERROR
            SSH_KEY_LOADED="ERROR.UNREGISTERED"
            ;;
        esac
        ;;
    n)
        # Display Console Message
        printf "\n├─ User input: Forced skip.\n"
        ;;
    *)
        # Display Console Message
        # printf "\n├─ Timeout...\n"
        printf "\n"
        ;;
esac

export SSH_KEY_UNLOCK
export SSH_KEY_LOADED
