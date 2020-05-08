
#ans_bin=/usr/bin/ansible-playbook
#ansible bin for jenkins in docker
ans_bin=/usr/local/bin/ansible-playbook

target_hosts=terraform/instance_ip.txt


export ANSIBLE_HOST_KEY_CHECKING=False

#configure target host with LEMP in docker
$ans_bin ansible-docker-ver/deploy-xcart-docker-ver.yml \
  -i $target_hosts -u root
