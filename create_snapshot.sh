
do_token=$1
wait_time=10

#terraform_bin=/usr/local/bin/terraform
#terraform location for jenkins in docker
terraform_bin=/usr/bin/terraform

if [ -z "$do_token" ]
then
  echo "Usage: $0 [digital_ocean_token]"
  exit 1
fi

echo Waiting $wait_time sec before creating snapshot...
sleep $wait_time

cd terraform/snapshot
pwd
$terraform_bin init
$terraform_bin plan -var "digitalocean_token=$do_token" 
$terraform_bin apply -var "digitalocean_token=$do_token" -auto-approve 
cd ../..