# Running And Maintaining Dockerized Atlassian Products

This project will show you how to setup and maintain Atlassian products with Docker.

Deployment and maintainance will be done by docker-compose yaml files and all commands will be based on Blacklabelops dockerized atlassian product images.

Requirements:

* Docker
* Docker-Compose

Based on the following containers:

* [blacklabelops/jira](https://github.com/blacklabelops/jira): The #1 software development tool used by agile teams
* [blacklabelops/confluence](https://github.com/blacklabelops/confluence): Create, organize, and discuss work with your team
* [blacklabelops/bitbucket](https://github.com/blacklabelops/bitbucket): Code, Manage, Collaborate
* [blacklabelops/crowd](https://github.com/blacklabelops/crowd): Identity management for web apps
* [blacklabelops/nginx](https://github.com/blacklabelops/nginx): Http Server
* [blacklabelops/postgres](https://github.com/blacklabelops/postgres): Database

# Support & Feature Requests

Leave a message and ask questions on Hipchat: [blacklabelops/hipchat](https://www.hipchat.com/geogBFvEM)

# Deploying Atlassian Stack

Running the whole Atlassian software stack on your local computer.

* Nginx Reverse Proxy (Http)
* Jira Software
* Confluence
* Bitbucket
* Crowd
* PostgreSQL Databases

Prerequisite:

If you want to try the stack on your local compute then setup the following domains in your host settings (Mac/Linux: /etc/hosts):

* jira.yourhost.com
* confluence.yourhost.com
* bitbucket.yourhost.com
* crowd.yourhost.com

Running the software stack:

1. Download the blacklabelops docker-compose file by running:

~~~~
$ mkdir AtlassianStack
$ curl -o /AtlassianStack/default.env https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/default.env
$ curl -o /AtlassianStack/docker-compose.yml https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/docker-compose.yml
$ cd AtlassianStack
~~~~

1. Now set the default environment variables:

~~~~
$ source default.env
~~~~

> Bash command for setting environment variables, you have to manually define the environment variables under Windows

1. Override password variables:

~~~~
$ export ATLASSIAN_TIME_ZONE=Europe/Berlin
~~~~

> You can override any environment variable inside the file default.env.

1. Start the whole setup:

~~~~
$ docker-compose up -d
~~~~

> Jira will be accessible under http://jira.yourhost.com

# Deploying Jira

The basic Jira stack:

* Nginx Reverse Proxy (Http)
* Jira Software
* PostgreSQL Database

Running the stack:

1. Download the blacklabelops docker-compose file by running:

~~~~
$ mkdir Jira
$ curl -o /Jira/default.env https://raw.githubusercontent.com/blacklabelops/atlassian/master/Jira/default.env
$ curl -o /Jira/docker-compose.yml https://raw.githubusercontent.com/blacklabelops/atlassian/master/Jira/docker-compose.yml
$ cd Jira
~~~~

1. Now set the default environment variables:

~~~~
$ source default.env
~~~~

> Bash command for setting environment variables, you have to manually define the environment variables under Windows

1. Override password variables:

~~~~
$ export JIRA_DB_USERNAME=yourusername
$ export JIRA_DB_PASSWORD=yourdbpassword
$ export JIRA_TIME_ZONE=Europe/Berlin
$ export JIRA_DOMAIN_NAME=localhost
~~~~

> You can override any environment variable inside the file default.env.

1. Start the whole setup:

~~~~
$ docker-compose up -d
~~~~

> Jira will be accessible under http://localhost

# Letsencrypt SSL Certificates

In order to obtain free SSL certificates for your Atlassian instances use my letsencrypt Docker image.

Requirements: Your host must be reachable under the respective domain name. E.g. www.myatlassianhost.com. Then
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
$ export LETSENCRYPT_DOMAIN="www.youratlassianhost.com"
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
    -e LETSENCRYPT_EMAIL=youremail@emailhost.de
    -e LETSENCRYPT_DOMAIN=jira.youratlassianhost.com \
    -e LETSENCRYPT_DOMAIN2=confluence.youratlassianhost.com \
    -e LETSENCRYPT_DOMAIN3=bitbucket.youratlassianhost.com \
    letsencrypt install
~~~~

> Will create a single multidomain certificate.

Renewal Command:

~~~~
$ docker-compose run --rm \
    -p 443:443 \
    -e LETSENCRYPT_EMAIL=youremail@emailhost.de
    -e LETSENCRYPT_DOMAIN=jira.youratlassianhost.com \
    -e LETSENCRYPT_DOMAIN2=confluence.youratlassianhost.com \
    -e LETSENCRYPT_DOMAIN3=bitbucket.youratlassianhost.com \
    letsencrypt renewal
~~~~

# References

* [Atlassian Jira](https://www.atlassian.com/software/jira)
* [Docker Homepage](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Userguide](https://docs.docker.com/userguide/)
