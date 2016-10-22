# Jira Product

The default Jira product is Jira Software. The Jira product can be changed with the environment variable JIRA_VERSION.

| Product     | JIRA_VERSION | Tagged JIRA_VERSION |
|-------------|--------------|---------------------|
| Jira Software | latest | 7.2.2 |
| Jira Core | core | core.7.2.2 |
| Jira Service Desk | servicedesk.3.2.2 | servicedesk.3.2.2 |

Example Jira Service Desk version 3.2.2 setting environment variable:

~~~~
$ export JIRA_VERSION servicedesk.3.2.2
~~~~

> Export cmd Mac/Linux. Use Set on windows.

Alternatively change the value JIRA_VERSION inside the file `default.env`.

~~~~
$ curl -o /Jira/default.env https://raw.githubusercontent.com/blacklabelops/atlassian/master/Jira/default.env
~~~~

> Downloads default configuration file.

# Deploying Jira

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
