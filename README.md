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

# Atlassian Stack

Running the whole Atlassian software stack on your local computer.

* Nginx Reverse Proxy (Http)
* Jira Software
* Confluence
* Bitbucket
* Crowd
* PostgreSQL Databases

Start here: [Documentation](https://github.com/blacklabelops/atlassian/tree/master/AtlassianStack)

# Jira

The basic Jira stack:

* Nginx Reverse Proxy (Http)
* Jira Software
* PostgreSQL Database

Start here: [Documentation](https://github.com/blacklabelops/atlassian/tree/master/Jira)

# Letsencrypt SSL Certificates

In order to obtain free SSL certificates for your Atlassian instances use my letsencrypt Docker image.

The creation of SSL certificates is dependent on your stack. See the documentation of each stack.

Further documentation: [Documentation](https://github.com/blacklabelops/atlassian/tree/master/Letsencrypt)

# Support

Leave a message and ask questions on Hipchat: [blacklabelops/hipchat](http://support.blacklabelops.com)

# References

* [Atlassian Jira](https://www.atlassian.com/software/jira)
* [Atlassian Confluence](https://www.atlassian.com/software/confluence)
* [Atlassian Bitbucket](https://www.atlassian.com/software/bitbucket)
* [Atlassian Crowd](https://www.atlassian.com/software/crowd/overview/)
* [Nginx](http://nginx.org/)
* [Letsencrypt](https://letsencrypt.org/)
* [Docker Homepage](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Userguide](https://docs.docker.com/userguide/)
