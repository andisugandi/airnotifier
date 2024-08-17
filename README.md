## Introduction

[![Join the chat at https://gitter.im/airnotifier/airnotifier](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/airnotifier/airnotifier?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


AirNotifier is a user friendly yet powerful application server for sending real-time notifications to mobile and desktop applications. AirNotifier provides a unified web service interface to deliver messages to multi devices using multi protocols, it also features a web based administrator UI to configure and manage 

## Supported devices
- iPhone/iPad devices ([APNs HTTP/2](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingwithAPNs.html))
- Android devices and chrome browser ([Firebase Cloud Messaging aka FCM](https://firebase.google.com/docs/cloud-messaging) protocol)
- Windows 10 desktop (WNS protocol)

## Features
- Open source application server, you can install on your own server, own your data
- Unlimited number of devices
- API access control
- Web-based UI to configure
- Access key management
- Logging activities


## Installation

Please read [Installation guide](https://github.com/airnotifier/airnotifier/wiki/Installation)

## Rebuilding Docker container

use ```docker-compose up --build``` to rebuild docker image delete volume
first ```docker volume ls``` and ```docker volume rm ....```

## Deploying on Docker Swarm Cluster

The [docker-compose-SwarmWithTraefik.yml](https://github.com/andisugandi/airnotifier/blob/main/docker-compose-SwarmWithTraefik.yml) file is an example working scenario on deploying Airnotifier instance on [Docker Swarm cluster](https://docs.docker.com/engine/swarm/swarm-tutorial/) with the help of [Traefik](https://traefik.io/traefik/) as reverse proxy (see [the example deployment](https://tech.aufomm.com/traefik/)).

- Get the persitent volumes ready

  ~~~bash
  mkdir -pv /path_to/airnotifier.example.com/{mongodb,certs,logs}
  ~~~

- Provide the proper permission for MongoDB

  ~~~bash
  sudo chown 1001 /path_to/airnotifier.example.com/mongodb
  ~~~

- Deploy on Docker Swarm cluster

  ~~~bash
  docker stack deploy -c docker-compose-SwarmWithTraefik.yml airnotifier-example-com
  ~~~

## Web service documentation
- [Web service interfaces](https://github.com/airnotifier/airnotifier/wiki/API)

## Requirements

- [Python 3.9](http://www.python.org)
- [MongoDB 4.0+](http://www.mongodb.org/)

## Copyright
Copyright (c) Dongsheng Cai and individual contributors
Copyright (c) Georg Glas 2024
