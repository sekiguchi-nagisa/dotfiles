cat << EOF >> ~/.bashrc

# custom settting
keychain --nogui --quiet ~/.ssh/id_rsa
source ~/.keychain/$HOST-sh

EOF
