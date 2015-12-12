# linux-config

这里我共享了我的 `linux` 上的相关配置 (`vim`, `tmux`)
希望对你有用

---

## 使用方法

###### VIM

如果你喜欢我的 `vim` 配置，你可以直接将 `.vimrc` 复制到你的用户目录下

###### TMUX

同样的方法，如果你也用 `tmux`，你可以复制 `.tmux.conf` 到你的用户目录下，至少我用的还是很顺手的

###### Ubuntu Init

我的 `Ubuntu` 版本为 `ubuntu-14.04-desktop-amd64.iso`，你可以到 [这里](http://pan.baidu.com/s/1i3YGBvZ) 下载。

安装完 `Ubuntu` 之后，你需要安装 `git`，之后将该项目复制到你的用户目录内，运行以下两条命令：

```
sudo apt-get install git
git clone https://github.com/pmars/linux-config.git
```

这时你只需要运行下面一条命令即可：

```
bash linux-config/init-ubuntu.sh username password
```

### END
