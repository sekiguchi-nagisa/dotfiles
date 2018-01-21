cat << EOF >> ~/.bashrc

# custom settting
ssh_pass() {
    keychain --nogui --quiet ~/.ssh/id_rsa
    source ~/.keychain/$HOST-sh
}
EOF
