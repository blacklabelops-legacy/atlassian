# Letsencrypt SSL Certificates

Requirements: Your host must be reachable under the respective domain name. E.g. www.yourhost.com. Then
run the image on the host and the certificates will be saved inside a docker volume.

1. Download the blacklabelops/letsencrypt docker-compose file by running:

~~~~
$ mkdir Letsencrypt
$ curl -o /Letsencrypt/docker-compose.yml https://raw.githubusercontent.com/blacklabelops/atlassian/master/Letsencrypt/docker-compose.yml
$ cd Letsencrypt
~~~~

1. Now set the your email and hostname with environment variables:

~~~~
$ export LETSENCRYPT_EMAIL="youremail@emailhost.de"
$ export LETSENCRYPT_DOMAIN="www.yourhost.com"
~~~~

> Export is a Linux/Mac command, under Windows use SET command.

1. Generate the certificates

~~~~
$ docker-compose up
~~~~

4. List the certificates

~~~~
$ docker-compose run --rm letsencrypt ls -R /etc/letsencrypt
~~~~

> Lists all files inside the letsencrypt directory. The volume will be automounted.

## Certificate Renewal

Letsencrypt certificates have a lifetime of three months. Run the renewal command periodical in order to update your certificate lifetime.

~~~~
$ docker-compose run --rm letsencrypt renewal
~~~~

> Make sure the required environment variables are set: LETSENCRYPT_EMAIL and LETSENCRYPT_DOMAIN.

## Multiple Domain certificates

The letsencrypt image supports multiple domain certificates.

Example:

1. jira.youratlassianhost.com
1. confluence.youratlassianhost.com
1. bitbucket.youratlassianhost.com

Command:

~~~~
$ docker-compose run --rm \
    -p 443:443 \
    -e LETSENCRYPT_EMAIL=youremail@emailhost.de \
    -e LETSENCRYPT_DOMAIN=jira.yourhost.com \
    -e LETSENCRYPT_DOMAIN2=confluence.yourhost.com \
    -e LETSENCRYPT_DOMAIN3=bitbucket.yourhost.com \
    letsencrypt install
~~~~

> Will create a single multidomain certificate.

Renewal Command:

~~~~
$ docker-compose run --rm \
    -p 443:443 \
    -e LETSENCRYPT_EMAIL=youremail@emailhost.de \
    -e LETSENCRYPT_DOMAIN=jira.yourhost.com \
    -e LETSENCRYPT_DOMAIN2=confluence.yourhost.com \
    -e LETSENCRYPT_DOMAIN3=bitbucket.yourhost.com \
    letsencrypt renewal
~~~~
