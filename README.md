# Zsh Config

## Outline

- [Setup](#setup)
- [Directory Structure](#directory-structure)
- [Troubleshooting](#troubleshooting)
- Setup on Server
    - [Setup on Amazon Linux](#setup-on-amazon-linux)
    - [Setup on Ubuntu](#setup-on-ubuntu)
- [Contact Us](#contact-us)

## Setup 

```
$ git clone https://github.com/revtel/.zsh ~/.zsh 
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
```

## Directory Structure

```
.zsh
├── README.md
└── aliases
    └── zsh.sh
```

## Troubleshooting

- 安裝完若遇到權限問題，可嘗試以下指令。(if you encountered the permission denied , can try below command)

```
# pwd -> $HOME/.zsh
$ chmod u+x *.sh
```
> chmod 是權限管理命令 change the permissions mode of a file 的縮寫。
> u 代表所有者。 x 代表執行權限。 ’+’ 表示增加權限。
> chmod u+x file.sh 就表示對當前目錄下的file.sh文件的所有者增加可執行權限。

## Setup on Amazon Linux

```
$ docker run -i -t amazonlinux /bin/bash
```

```
$ yum install git zsh
$ cd ~
$ git clone https://github.com/revtel/.zsh
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
$ zsh
```

## Setup on Ubuntu

```
$ docker run -i -t ubuntu /bin/bash
```

```
$ apt update
$ apt install zsh git locales
$ cd ~
$ git clone https://github.com/revtel/.zsh
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
$ locale-gen "en_US.UTF-8"
$ update-locale LC_ALL="en_US.UTF-8"
$ zsh
```

## Contact Us

[Revtel Tech](mailto:contact@revtel.tech)
