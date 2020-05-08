hdir=$1

if [ -z "$hdir" ]
then
  echo "Usage: $0 [home-dir for storing ssh keys]"
  exit 1
fi
    

FILE=$hdir/.ssh/id_rsa
if test -f "$FILE"; then
    echo "SSH keys already present"
else 
    echo "No ssh keys found in ~/.ssh, creating new..."
    mkdir $hdir/.ssh
    mkdir $hdir/.ssh/key_backup
    cp id_rsa* $hdir/.ssh/key_backup
    ssh-keygen -q -t rsa -N '' -f $hdir/.ssh/id_rsa 2>/dev/null <<< y >/dev/null
fi
    