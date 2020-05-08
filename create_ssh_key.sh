FILE=~/.ssh/id_rsa
if test -f "$FILE"; then
    echo "SSH keys already present"
else 
    echo "No ssh keys found in ~/.ssh, creating new..."
    mkdir ~/.ssh
    mkdir ~/.ssh/key_backup
    cp id_rsa* ~/.ssh/key_backup
    ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null
fi
    