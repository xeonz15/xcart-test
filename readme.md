
create_droplet.sh [token] - Create digital ocean droplet

configure_droplet.sh      - Install LEMP and X-Cart to the droplet created by "create_droplet.sh"

Jenkins pipeline (jenkinsfile) requires two credentials of type "Secret text":
 - c_DO_TOKEN: Digital Ocean API Token
 - c_DB_Pass:  xcart database password (database name is preconfigured in Jenkinsfile)
 