# Deploying Atlassian Stack

Running the whole Atlassian software stack on your local computer.

* Nginx Reverse Proxy (Http)
* Jira Software
* Confluence
* Bitbucket
* Crowd
* PostgreSQL Databases

Prerequisite:

If you want to try the stack on your local compute then setup the following domains in your host settings (Mac/Linux: /etc/hosts, Windows: %systemroot%\system32\drivers\etc\):

* `127.0.0.1 jira.yourhost.com`
* `127.0.0.1 confluence.yourhost.com`
* `127.0.0.1 bitbucket.yourhost.com`
* `127.0.0.1 crowd.yourhost.com`

Running the software stack:

Download the blacklabelops docker-compose file by running:

Windows:

Download the repository and extract: [ZIP](https://github.com/blacklabelops/atlassian/archive/master.zip)

Mac/Linux:

~~~~
$ mkdir AtlassianStack
$ curl -o /AtlassianStack/default.env https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/default.env
$ curl -o /AtlassianStack/docker-compose.yml https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/docker-compose.yml
$ cd AtlassianStack
~~~~

Now set the default environment variables:

Windows:

~~~~
$ default.bat
~~~~

> Batch command for setting environment variables.

Mac/Linux:

~~~~
$ source default.env
~~~~

> Bash command for setting environment variables.

Override password variables:

Windows:

~~~~
$ SET ATLASSIAN_TIME_ZONE="Europe/Berlin"
~~~~

> You can override any environment variable inside the file default.bat.

Mac/Linux:

~~~~
$ export ATLASSIAN_TIME_ZONE=Europe/Berlin
~~~~

> You can override any environment variable inside the file default.env.

Start the whole setup:

~~~~
$ docker-compose up -d
~~~~

> Jira will be accessible under http://jira.yourhost.com

## Setup Jira

Configure your Jira yourself and fill it with a test license.

1. Access your Jira instance under http://jira.yourhost.com
1. Enter license information and setup admin account.
1. Have fun using Jira!

## Setup Confluence

Configure your Confluence yourself and fill it with a test license.

1. Access your Confluence instance under http://confluence.yourhost.com
1. Choose `Production Installation` because we have a postgres!
1. Enter license information
1. In `Choose a Database Configuration` choose `PostgeSQL` and press `External Database`
1. In `Configure Database` press `Direct JDBC`
1. In `Configure Database` fill out the form:

* Driver Class Name: `org.postgresql.Driver`
* Database URL: `jdbc:postgresql://confluence_postgresql:5432/atlassiandb`
* User Name: `atlassiandb` (Your entry in environment variable `ATLASSIAN_DB_USERNAME`)
* Password: `atlassiandb` (Your entry in environment variable `ATLASSIAN_DB_PASSWORD`)

## Setup Bitbucket

Configure your Bitbucket yourself and fill it with a test license.

1. Access your Bitbucket instance under http://bitbucket.yourhost.com
1. Choose `External` for `Database` and fill out the form:
  * Database Type: `PostgreSQL`
  * Hostname: `bitbucket_postgresql`
  * Port: `5432`
  * Database name: `atlassiandb`
  * Database username: `atlassiandb` (Your entry in environment variable `ATLASSIAN_DB_USERNAME`)
  * Database password: `atlassiandb` (Your entry in environment variable `ATLASSIAN_DB_PASSWORD`)
1. Create and enter license information
1. Fill out the rest of the installation procedure.

## Setup Crowd

Configure your Crowd yourself and fill it with a test license.

1. Access your Crowd instance under http://crowd.yourhost.com
1. Choose `Set up Crowd`
1. Create and enter license information
1. Choose `New installation`
1. In `Database configuration` choose `JDBC connection` and fill out the form:
  * Database: PostgreSQL
  * Driver Class Name: `org.postgresql.Driver`
  * JDBC URL: `jdbc:postgresql://crowd_postgresql:5432/atlassiandb`
  * Username: `atlassiandb` (Your entry in environment variable `ATLASSIAN_DB_USERNAME`)
  * Password: `atlassiandb` (Your entry in environment variable `ATLASSIAN_DB_PASSWORD`)
  * Hibernate dialect: `org.hibernate.dialect.PostgreSQLDialect`
1. In `Options` choose `http://localhost:8095/crowd` for field `Base URL` otherwise you won't be able to connect later on.
1. Fill out the rest of the installation procedure.

# Deploying Atlassian Https Stack

You can deploy the stack with https. First you have to create Letsencrypt Ssl certificates: See Section "Letsencrypt SSL Certificates".

Then start the stack with the https settings.

Download the blacklabelops https settings file by running:

~~~~
.. make sure your inside the folder AtlassianStack/ ..
$ curl -o /AtlassianStack/defaultHttps.env https://raw.githubusercontent.com/blacklabelops/atlassian/master/AtlassianStack/defaultHttps.env
~~~~

Now set the default environment variables:

Windows:

~~~~
$ defaultHttps.bat
~~~~

> Batch command for setting environment variables.


Mac/Linux:

~~~~
$ source defaultHttps.env
~~~~

> Bash command for setting environment variables.

Define domain name variables:

~~~~
$ export JIRA_DOMAIN_NAME=jira.yourhost.com
$ export CROWD_DOMAIN_NAME=crowd.yourhost.com
$ export CONFLUENCE_DOMAIN_NAME=confluence.yourhost.com
$ export BITBUCKET_DOMAIN_NAME=bitbucket.yourhost.com
~~~~

> Export is a Linux/Mac command, under Windows use SET command.

Start the whole setup:

~~~~
$ docker-compose up -d
~~~~

> Jira will be accessible under https://jira.yourhost.com

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

Windows:

~~~~
$ SET LETSENCRYPT_EMAIL="mail@youremail.com"
$ SET JIRA_DOMAIN_NAME="jira.yourhost.com"
$ SET CROWD_DOMAIN_NAME="crowd.yourhost.com"
$ SET CONFLUENCE_DOMAIN_NAME="confluence.yourhost.com"
$ SET BITBUCKET_DOMAIN_NAME="bitbucket.yourhost.com"
~~~~

Mac/Linux:

~~~~
$ export LETSENCRYPT_EMAIL=mail@youremail.com
$ export JIRA_DOMAIN_NAME=jira.yourhost.com
$ export CROWD_DOMAIN_NAME=crowd.yourhost.com
$ export CONFLUENCE_DOMAIN_NAME=confluence.yourhost.com
$ export BITBUCKET_DOMAIN_NAME=bitbucket.yourhost.com
~~~~

> Export is a Linux/Mac command.

1. Install certificates in stack ssl_certificates volume:

~~~~
$ docker-compose -f dc-letsencrypt.yml run --rm -p 443:443 letsencrypt install
~~~~

> Certificate for all domains will be saves inside the appropriate volume.
