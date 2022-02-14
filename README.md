# my-infra-network

Switch and router's configurations in my labo.

## Overview

![Overview](https://github.com/umatare5/my-infra-network/blob/images/diagram.png)

## Commands

| Command       | Description                                         |
| ------------- | --------------------------------------------------- |
| `make scrape` | Scrape status and configurations from each targets. |
| `make save`   | Save configuration on each targets.                 |
| `make push`   | Push changes with current timestamp.                |

- Prerequisite

  | Command | Description                                                                   |
  | ------- | ----------------------------------------------------------------------------- |
  | telee   | Download from [telee/releases](https://github.com/umatare5/telee/releases).   |
  | gnu-sed | If using Mac, please set a alias `gnu-sed` (`brew install gnu-sed`) to `sed`. |

## My Hosts

```bash
192.168.0.248 lab1-ap-02f-01
192.168.0.249 lab1-ap-02f-02
192.168.0.250 lab1-rtx1200-02f-01
192.168.0.251 lab1-ct25wlc-02f-01
192.168.0.252 lab1-cat29c-02f-01
192.168.0.253 lab1-cat29l-02f-01
192.168.0.254 lab1-cat35c-02f-01
```
