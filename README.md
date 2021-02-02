# Zsh Config

## Outline

- [Setup](#setup)
- [Directory Structure](#directory-structure)
- [Troubleshooting](#troubleshooting)
- [Setup on Server](#setup-on-server)
    - [Setup on Amazon Linux](#setup-on-amazon-linux)
    - [Setup on Ubuntu](#setup-on-ubuntu)
- [Contributors](#contributors)
- [Contact Us](#contact-us)

## Setup

```zsh
$ git clone https://github.com/revtel/.zsh ~/.zsh
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
$ echo "source $HOME/.zsh/.zprofile" > $HOME/.zprofile

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

```zsh
# pwd -> $HOME/.zsh
$ chmod u+x *.sh
```
> chmod 是權限管理命令 change the permissions mode of a file 的縮寫。
> u 代表所有者。 x 代表執行權限。 ’+’ 表示增加權限。
> chmod u+x file.sh 就表示對當前目錄下的file.sh文件的所有者增加可執行權限。

## Setup on Server

### Setup on Amazon Linux

```zsh
$ docker run -i -t amazonlinux /bin/bash
```

```zsh
$ yum install git zsh
$ cd ~
$ git clone https://github.com/revtel/.zsh
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
$ zsh
```

### Setup on Ubuntu

```zsh
$ docker run -i -t ubuntu /bin/bash
```

```zsh
$ apt update
$ apt install zsh git locales
$ cd ~
$ git clone https://github.com/revtel/.zsh
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
$ locale-gen "en_US.UTF-8"
$ update-locale LC_ALL="en_US.UTF-8"
$ zsh

```

## Contributors

<table>
  <tbody>
    <tr>
      <td align="center">
        <a href="https://github.com/whitedogg13">
          <img src="https://www.revtel.tech/static/27c58c6bb6f59c00bb890c4d2f9a823f/b7b73/Richie.png" width="100px" />
        </a>
        <br/>
        <div>Richie Hsieh</div>
      </td>
      <td align="center">
        <a href="https://github.com/guychienll">
          <img src="https://www.revtel.tech/static/c0be7e3b863d6941f4946b68cd181ded/b7b73/Guy.png" width="100px" />
        </a>
        <br/>
        <div>Guy Chien</div>
      </td>
    </tr>
  </tbody>
</table>

## Contact Us

[Revtel Tech](mailto:contact@revtel.tech)
