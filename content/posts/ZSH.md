---
title: 更換shell，讓終端機更好用—ZSH簡易配置
date: 2022-08-09T22:17:28+08:00
draft: false
cover:
  image: /img/zsh.jpg
  alt: ""
  caption: ""
categories:
  - Linux
  - 電腦軟體
tags:
  - Linux
  - 電腦軟體
keywords:
  - linux
  - zsh
  - bash
  - shell
description: "介紹一下簡易配置的 zsh "
---

## 快更換你的終端機界面吧！

終端機(terminal)是所有 linux 用戶會接觸到的軟體，與習慣使用滑鼠操作的 Windows 不同，終端基本身是一個純文字界面的軟體，使用上就像記事本一樣，沒有其他樣式可以區別文字內容，所以終端機本身可以加上一層樣式，英文上稱為 shell。
在各家linux發行版中，最常見的 shell 叫做 bash，本篇文章將會介紹您如何更換自己的 shell ，並且更換為更好用的 zsh。

### 首先是下載

從`arch linux`的 package 中下載[zsh](https://archlinux.org/packages/extra/x86_64/zsh/)，接著在終端機輸入以下指令
```
sudo pacman -S zsh
```
如果是`ubuntu`可以輸入以下指令
```
sudo apt-get install zsh
```
### 更改 shell 從 bash 換為 zsh
先列出所有 shell
```
cat /etc/shells
```
須確認有看到出現`/bin/zsh`或者是`/usr/bin/zsh`才可以更換，如果沒有出現須重複檢視本文上面的步驟是否正確安裝。
接著輸入以下指令更換 shell
```
chsh -s /usr/bin/zsh
```
接著關閉終端機再重啟，就可以看到zsh的起始界面了！
一開始須做一點簡易配置，雖然是英文界面，但裡面都是一些很簡單的單字，可以很簡易的去執行，如果真的不知道該如何執行，建議就是照著程式中的(recommend.)去配置吧！配置完成以後會在`home`生成`.zshrc`檔案。
### 安裝擴充功能
網路上很多教學會教你直接使用`oh my zsh`，但這樣並不夠簡潔，而且會多安裝很多自己不需要的功能，一點也不 simple，我們接著只需要以下三個擴充功能
   
   `zsh-autosuggestions`：必裝，讓 zsh 獲得像bash建議功能，但功能更強大。
   
   `zsh-syntax-highlighting`：使得終端機中的字樣得以區別各項文字的功能。
   
   `zsh-theme-powerlevel10k`：一個終端機主題樣式，讓終端機變得可愛許多。
   
   一樣都在終端機中下載
   ```
   sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k zsh-completion
   ```
### 在`.zshrc`中啟用擴充功能
`nano ~/.zshrc`使用nano編輯文字檔案，使用其他自己熟悉的文字編輯器亦可。在`home`主目錄中的`.zshrc`檔案中加入以下幾句文字
```
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
```
第一次使用powerlevel10k也會需要按照步驟配置文件，大家可依照自己對主題的喜好去配置，可以選擇很花俏的款式，也可以選擇很簡單的樣式，最終都會得到一個美麗的終端機！
