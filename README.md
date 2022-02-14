# my-infra-network

Switch and router's configurations in my labo.

## Overview

![Overview](https://github.com/umatare5/my-infra-network/blob/images/diagram.png)

## Prerequisite

| Command | Description                                                                   |
| ------- | ----------------------------------------------------------------------------- |
| telee   | Download from [telee/releases](https://github.com/umatare5/telee/releases).   |
| gnu-sed | If using Mac, please set a alias `gnu-sed` (`brew install gnu-sed`) to `sed`. |

## Commands

| Command       | Description                                           |
| ------------- | ----------------------------------------------------- |
| `make scrape` | Prepare base configurations on Ubuntu 20.04.          |
| `make save`   | Setup Prometheus exporters on server.                 |
| `make push`   | Setup Prometheus, Alertmanager and Grafana on docker. |

## Hosts

```bash
192.168.0.248 lab1-ap-02f-01
192.168.0.249 lab1-ap-02f-02
192.168.0.250 lab1-rtx1200-02f-01
192.168.0.251 lab1-ct25wlc-02f-01
192.168.0.252 lab1-cat29c-02f-01
192.168.0.253 lab1-cat29l-02f-01
192.168.0.254 lab1-cat35c-02f-01
```

## Operations

### scrape all configs

```plaintext
make scrape
```
