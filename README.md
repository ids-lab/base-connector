# Industrial Data Space - BaseConnector
This is a minimal setup of a **BaseConnector** for the **Industrial Data Space** based on the following Open Source components:

* [Docker](https://www.docker.com/)
* [Apache ActiveMQ](http://activemq.apache.org/)
* [Apache Camel (embedded in ActiveMQ)](http://camel.apache.org/)
* [Portainer](https://portainer.io/)

## Preliminaries

You need a preconfigured Docker environment for the BaseConnector:

* Linux
* Docker
* Docker-compose

We recommend **Ubuntu** & **Docker CE** for development environments.

## Setup
Use the following command to start:

    docker-compose up

Edit `docker-compose.yml` as required.

## Configuration

Use **Portainer** to add Data-Apps to the BaseConnector:

    http://<your-ip>:9000

Change configuration in `./etc/conf/activemq.xml` and add custom routes in `routes.xml`.
You can add additional jars by adding them in `./etc/activemq/lib`.
Changes will take effect after you restart the container.

See **Reference Use-Case Logistics** for more verbose examples.

# Contact
Fraunhofer-Institut für Software- und Systemtechnik ISST

<https://www.isst.fraunhofer.de>

ids-lab@isst.fraunhofer.de
