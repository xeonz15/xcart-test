Jenkins Pipeline for creating Digital ocean VPS with XCart installed.

Requirements before start:
Credential of type "Secret text" must exists:
 - c_DO_TOKEN: Digital Ocean API Token


For debug may be used:
create_droplet.sh [token] - Create digital ocean droplet

configure_droplet.sh [token] - Install LEMP and X-Cart without docker to the droplet 

configure_droplet-docker-ver.sh [token] - Install LEMP and X-Cart over docker to the droplet 
 