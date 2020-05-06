db=$1
dbuser=$2
dbpass=$3

#ans_bin=/usr/bin/ansible-playbook
#ansible bin for jenkins in docker
ans_bin=/usr/local/bin/ansible-playbook

target_hosts=terraform/instance_ip.txt

if [ -z "$db" ] || [ -z "$dbuser" ] || [ -z "$dbpass" ]
then
  echo "Usage: $0 [DB_name DBUser DB_Pass]"
  exit 1
fi

export ANSIBLE_HOST_KEY_CHECKING=False


#--extra-vars '{"name":"Thor"}'
$ans_bin ansible/deploy-xcart.yml \
  --extra-vars "mysql_db=$db mysql_dbuser=$dbuser mysql_dbpass=$dbpass" \
  -i $target_hosts -u root
