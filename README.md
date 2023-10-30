# Slack Bot

This bot integrates GitHub App and Slack to notify users of the progress of PR executions.

It is used in conjunction with the project: https://github.com/FRRouting/netdef-ci-github-app

# Commands

These are the supported commands:
```
/ci notify <pr> [all | errors | pass | off]
/ci subscribe <github_name> [all | errors | pass | off]
/ci settings
/ci help
```

## Slack Config

Our bot only uses slash commands so we need to register the `/ci` command for this.

- Access the bot configuration page
- Access the slash commands menu
- Add a new command

![Alt text](docs/img/slash_command.png?raw=true "Slash Commands")
![Alt text](docs/img/create.png?raw=true "Config")

# Usage

Executing the bot can be done using the following command `rackup -o 0.0.0.0 -p 5000 config.ru`, 
you can replace the IP 0.0.0.0 with another valid one that is accessible 
via the internet or using a tool that generates an address for you.

## What do you need?

- Copy config/postgresql.sample.yml to config/postgresql.yml
- Configure the config/postgresql.yml file to access the database
- Copy .env.sample to .env
- Edit the fields in the .env file with the bot's info
