# vimrc
## 安装过程
### 下载并安装 vim-plug

``` SHELL
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 配置vimrc
``` SHELL
git clone https://github.com/OakMolecule/dot_vimrc.git
cd dot_vimrc
ln vimrc ~/.vimrc
vim +PlugInstall
```

### 字体库安装
不安装也行，就是体验不太好
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

## 快捷键简介
<Leader>未修改，为默认`\`

| 按键        | 作用                    |
|-----------|-----------------------|
| <C\-P>    | 快速代开文件，使用LeaderF插件    |
| <Leader>b | 切换buffer中的文件          |
| <F4>      | 向下切换buffer中的文件，相当于：bn |
| <F5>      | 浏览文件夹中的文件             |
| <F6>      | 调出tagbar              |

