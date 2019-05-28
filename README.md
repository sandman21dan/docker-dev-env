# docker-dev-env

This project describes a Dockerfile and docker-compose.yaml file that
will create a linux ubuntu environment with ansible installed ready to
consume my personal development preferences from my
[automation repo](https://github.com/sandman21dan/dev-environment-automation)
which is a git submodule part of this project

The main use case for this project is having a nice linux environment with all the bash/zsh bells and whistles
and making it work on Windows with minimal effort

I created this after hearing about the upcoming [WSL 2](https://devblogs.microsoft.com/commandline/announcing-wsl-2/)
being a big time user of the current iteration of the WSL and got inspired into creating a VM based (VM through docker on Windows)
so I could have an idea of how the WSL 2 would work in terms of performance and usability

Turns out this is actually quite usable, portable and takes very little time to set up!

By using the compose file you can quickly add more volumes you'd want to share with your host computer
or open ports for projects you might be running inside your container (like web-servers or such)

## How to use

#### Submodule

This project makes use of git Submodules to consume the ansible automation scripts

for the first time clone use:

```sh
git clone --recurse-submodules
```

To clone the project along with the required submodule

### CLI usage

For first time use, just make sure your docker daemon is running and in your shell type:

```sh
docker-compose up -d
```

Once that's finished, to attach into the linux environment just type

```sh
docker exec -it docker-dev-env_dev_1 zsh
```

And that's it! you have a fully working linux environment with zsh, git nvm and node!

For more details into what's available check my [dev-environment-automation](https://github.com/sandman21dan/dev-environment-automation) repo