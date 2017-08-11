# BITthesis
Thesis Template  of Beijing Institute of Technology  Using LaTeX

北京理工大学LaTeX研究生论文模板
[![GitHub forks](https://img.shields.io/github/forks/qiuzhu/BITthesis.svg?style=flat-square)](https://github.com/qiuzhu/BITthesis/network)
[![GitHub stars](https://img.shields.io/github/stars/qiuzhu/BITthesis.svg?style=flat-square)](https://github.com/qiuzhu/BITthesis/stargazers)
[![GitHub license](https://img.shields.io/badge/license-AGPL-blue.svg?style=flat-square)](https://raw.githubusercontent.com/qiuzhu/BITthesis/master/LICENSE)
[![Build Status](https://travis-ci.org/qiuzhu/BITthesis.svg?branch=master)](https://travis-ci.org/qiuzhu/BITthesis)
![logo](https://github.com/qiuzhu/BITthesis/blob/master/bitlatex.png)

------------------------------------------------------------------------
# 编译方式和环境：
在`Windows`下：
- 强烈建议采用`Texlive 2016`、`2017`或`Miktex` 的发行版套装，利用自带工具，更新宏包到最新，强烈建议到[!清华大学镜像站](https://mirrors.tuna.tsinghua.edu.cn)下载套装，并且更新，这样速度最快；
- 如果安装的是texlive套装（建议2017），安装完成后，更新最新的方法：
                1. 添加清华大学源：`tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet
                          sudo tlmgr update --self --all`
                2. 更新所有的命令：`tlmgr update --self --all`
        
- 最新远离`Ctex`套装，千万不要用，已经过时，不能编译通过！！！
- `XeLatex`方式编译，否则不能通过！
- 强烈推荐`Texstudio`这个编辑器，非常好用；
- 参考文献建议用`jabref`或者`zotero`管理，生成自己的bib文献库，[!参考文章](http://www.360doc.com/content/14/0303/11/176942_357295803.shtml)

在`Linux`系统上：
- 其他如同`Windows`
- 注意字体问题，在`Ubuntu`下，由于版权问题，未能预装宋体等`Windows`下的字体，具体安装方法见百度
- Linux下因为版权的问题, 微软的这些字体不会自动安装,需要我们手动安装方法如下:

        1.sudo apt-get install ttf-mscorefonts-installer 
  
        然后会提示微软的用户协议向导,单击“确定OK”继续
  
       在安装字体后，我们需要使用命令来更新字体缓存：
       2.sudo fc-cache -f -v

  -------------------------------------------------------------------
# 简介

* [什么是LaTeX？](http://baike.baidu.com/link?url=hM-s1PsjuKHD_k_MpAaI5ZgwwrMtbs8mcrlxSemL2DBcxarGaGt5LWCdPbNBjLtFHHqV9z_EBe1YgNaw-bRVE_)和 [维基百科](https://en.wikibooks.org/wiki/LaTeX)
* `BITthesis`是北京理工大学毕业设计的LaTeX论文模板，基本上已经搞定了所有事情，仅仅需要同学们把自己的内容填入即可，而不必纠结于论文的格式与排版。
* 参考文献的管理以及bib文献库的创建，可以参考[这个教程](http://www.jianshu.com/p/68f0e4134b04)。
* 本模板涵盖了硕士博士的论文排版。
* 自动为pdf格式添加目录书签
* 自动化目录生成
* 自动化页码生成
* 多语言兼容
* 自动化参考文献管理
* 自动处理图片与文字的排版
* 格式化的标题、正文、注释、引用的文字样式与大小
* 所有文件均为UTF-8 无 BOM 编码格式。
* 本模板使用LPPL协议发布。
# 用法
- 详见`Wiki`，目前正在编写中，可以持续关注。或者会LaTeX的同学可以先下载来琢磨一下；
- 模板自带一些说明，替换掉相应的文字即可。
# 下载
[发布版](https://github.com/qiuzhu/BITthesis/releases)
# 捐赠
#### 基本上而言，面对数千行代码要一个个修改是一件很枯燥的事情，所以这里有个捐赠二维码。
![捐赠](https://github.com/qiuzhu/BITthesis/blob/master/m.png)

# 更新日志
## V1.0
* 支持了北京理工大学毕业论文格式。时间仓促，难免有遗漏，欢迎提issue。
* 修正章节格式错误
* 修正书脊的排版
## V 0.1
* 1.0来自于原作上海交通大学的template
* 修复旧的模板中不支持的命令

# 北京理工大学LaTeX研究生论文模板

## 使用说明
- 博士采用doctor选项
- 硕士采用master选项
## 存在问题

# TODO
- [ ] 理科的各种定理环境
- [X] 各种list代码的配置
- [X] 文档手册的编写
