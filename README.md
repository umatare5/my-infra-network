# my-infra-networking

Switch and router's configurations in my labo.

## Prerequisite

| Command | Description                                                                 |
| ------- | --------------------------------------------------------------------------- |
| telee   | Download from [telee/releases](https://github.com/umatare5/telee/releases). |
| gnu-sed | If using Mac, please install gnu-sed (`brew install gnu-sed`).              |

## Hosts

```bash
192.168.0.250 lab1-rtx1200-02f-01
192.168.0.252 lab1-cat29c-02f-01
192.168.0.253 lab1-cat29l-02f-01
192.168.0.254 lab1-cat35c-02f-01
```

## Operations

### scrape all configs

```plaintext
make scrape
```
