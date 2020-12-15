# Revtel zsh configuration

## 如何安裝zsh ? (How to use this repo to setup .zshrc) 

```
# pwd -> $HOME
$ git clone https://github.com/revtel/.zsh
$ echo "source $HOME/.zsh/.zshrc" > $HOME/.zshrc
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

