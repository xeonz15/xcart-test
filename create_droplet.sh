
do_token=$1
wait_time=60
terraform_bin=/usr/local/bin/terraform

if [ -z "$do_token" ]
then
  echo "Usage: $0 [digital_ocean_token]"
  exit 1
fi

cd terraform
$terraform_bin init
$terraform_bin plan -var "digitalocean_token=$do_token"
$terraform_bin apply -var "digitalocean_token=$do_token" -auto-approve
$terraform_bin output instance_ip_addr > instance_ip.txt
echo Waiting $wait_time sec while instance booting...
sleep $wait_time
cd ..