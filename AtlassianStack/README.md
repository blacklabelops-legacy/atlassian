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

# Deploying Atlassian Https Stack

You can deploy the stack with https. First you have to create Letsencrypt Ssl certificates: See Section "Letsencrypt SSL Certificates".

Then start the stack with the https settings.

1. Download the blacklabelops https settings file by running:

~~~~
.. make sure your inside the folder AtlassianStack/ ..
$ curl -o /AtlassianStack/defaultHttps.env https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/defaultHttps.env
~~~~

1. Now set the default environment variables:

~~~~
$ source defaultHttps.env
~~~~

> Bash command for setting environment variables, you have to manually define the environment variables under Windows

1. Define domain name variables:

~~~~
$ export JIRA_DOMAIN_NAME=jira.yourhost.com
$ export CROWD_DOMAIN_NAME=crowd.yourhost.com
$ export CONFLUENCE_DOMAIN_NAME=confluence.yourhost.com
$ export BITBUCKET_DOMAIN_NAME=bitbucket.yourhost.com
~~~~

> Export is a Linux/Mac command, under Windows use SET command.

1. Start the whole setup:

~~~~
$ docker-compose up -d
~~~~

> Jira will be accessible under http://jira.yourhost.com

## Letsencrypt SSL Certificates

You need a letsencrypt chain certificate for all the required domains.

Requirements: Your host must be reachable under the respective domain name. E.g. www.yourhost.com. Then
run the image on the host and the certificates will be saved inside a docker volume.

1. Download the blacklabelops/letsencrypt docker-compose file by running:

~~~~
.. make sure your inside the folder AtlassianStack/ ..
$ curl -o /AtlassianStack/dc-letsencrypt.yml https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/dc-letsencrypt.yml
~~~~

1. Define domain name variables:

~~~~
$ export JIRA_DOMAIN_NAME=jira.yourhost.com
$ export CROWD_DOMAIN_NAME=crowd.yourhost.com
$ export CONFLUENCE_DOMAIN_NAME=confluence.yourhost.com
$ export BITBUCKET_DOMAIN_NAME=bitbucket.yourhost.com
~~~~

> Export is a Linux/Mac command, under Windows use SET command.

1. Install certificates in stack ssl_certificates volume:

~~~~
$ docker-compose -f dc-letsencrypt.yml run --rm -p 443:443 letsencrypt install
~~~~

> Certificate for all domains will be saves inside the appropriate volume.
