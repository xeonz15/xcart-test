
create_droplet.sh [token] - Create digital ocean droplet

configure_droplet.sh      - Install LEMP and X-Cart to the droplet created by "create_droplet.sh"
configure_droplet.sh      - Install LEMP and X-Cart without docker to the droplet 
configure_droplet-docker-ver.sh   
                          - Install LEMP and X-Cart over docker to the droplet 

Jenkins pipeline (jenkinsfile) requires credential of type "Secret text":
 - c_DO_TOKEN: Digital Ocean API Token
 