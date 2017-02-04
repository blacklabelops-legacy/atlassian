@ECHO OFF

:: Global Container Settings
SET ATLASSIAN_TIME_ZONE="Europe/Berlin"

:: Atlassian Container Settings
SET ATLASSIAN_PROXY_PORT="80"
SET ATLASSIAN_PROXY_SCHEME="http"
SET ATLASSIAN_POSTGRES_VERSION="9.4.6"
SET ATLASSIAN_DB_USERNAME="atlassiandb"
SET ATLASSIAN_DB_PASSWORD="atlassiandb"
SET ATLASSIAN_DB_DELAYED_START="10"

:: Letsencrypt Settings
SET LETSENCRYPT_EMAIL=""

:: Nginx Reverse Proxy Settings
SET ATLASSIAN_NGINX_VERSION="1.10.1-r1"
SET ATLASSIAN_PORT80_REDIRECT="false"
SET ATLASSIAN_HTTPS="false"
SET ATLASSIAN_HTTP="true"

:: Jira Settings
SET JIRA_DOMAIN_NAME="jira.yourhost.com"
SET JIRA_VERSION="7.2.2"
SET JIRA_JAVA_OPTIONS=" -Xms1g -Xmx2g"

:: Crowd
SET CROWD_DOMAIN_NAME="crowd.yourhost.com"
SET CROWD_VERSION="2.10.1"

:: Confluence
SET CONFLUENCE_DOMAIN_NAME="confluence.yourhost.com"
SET CONFLUENCE_VERSION="5.10.7"
SET CONFLUENCE_JAVA_OPTIONS=" -Xms1g -Xmx2g"

:: Bitbucket
SET BITBUCKET_DOMAIN_NAME="bitbucket.yourhost.com"
SET BITBUCKET_VERSION="4.9.1"
SET BITBUCKET_JAVA_OPTIONS=" -Xms1g -Xmx2g"

PAUSE