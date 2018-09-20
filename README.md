# -更改Mac 键盘绑定（将caps lock 改为ctrl键）
打开系统偏好设置－键盘－键盘－修饰键，将Caps Lock键设为^control。

# -登录GitHub，download threeEverthing项目
在命令行工具中使用cp命令，将下载的myConfig里的所有文件复制到根目录

# -安装iTerm2 并配置

Key -- HotKey 勾选show/hide all……


# -安装 Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim

完成后打开 vim，输入 :PluginInstall，开始安装。

安装 vim-airline/vim-airline 的打过补丁的字体
https://github.com/powerline/fonts 下载，然后运行install.sh

# -把bash切换成zsh
chsh -s /bin/zsh  然后重启iTerm2
（如果你哪一天又想用bash了，也可以使用下列命令：chsh -s /bin/bash）

 
安装 oh my zsh
1、在.zshrc文件里修改路径,eg:huyi_fenghuang
  # Path to your oh-my-zsh installation.
  export ZSH="/Users/huyi_fenghuang/.oh-my-zsh"

2、安装
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


