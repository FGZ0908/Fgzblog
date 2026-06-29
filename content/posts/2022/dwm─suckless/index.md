---
title: "Dwm ─ suckless 平鋪式桌面環境"
date: 2022-09-03T23:35:36+08:00
draft: false
cover:
    image: ""
    alt: ""
    caption: ""
categories: 
- Linux
- 自由軟體
tags: 
- Linux
- 自由軟體
keywords: 
- suckless
- linux
- 自由軟體
- 軟體介紹
description: "介紹suckless的桌面視窗管理軟體 ─ dwm"
---

## dwm 介紹
[dwm (dynamic window manager)](https://dwm.suckless.org)是前文介紹的 suckless 團隊所開發的桌面服務軟體。與平常大家常接觸的 Windows 和 MacOS 桌面環境不同，平鋪式桌面環境會主動排列所有視窗大小，並加以整齊排列，著名的平鋪式軟體還有： i3,bspwm,sway…等，每家平鋪式桌面環境都有自己的邏輯所在，suckless 家的 dwm 是以動態式排列，使用上主要以快捷鍵方式操作，與一般桌面環境以滑鼠操作之方式不同，剛開始接觸容易感到困難，但習慣快捷鍵操作模式以後，可以大大節省操作時間。本文介紹如何安裝及使用。

## 安裝

開啟終端機(terminal)我喜歡先在主目錄建立一個suckless資料夾，再將所需要的東西放在裡面：
```
mkdir suckless  # 建立 suckless 資料夾
cd suckless # 進入資料夾
git clone https://git.suckless.org/dwm # 使用 git 複製官方網站的 dwm 檔案
cd dwm
sudo make clean install
```

## 啟用軟體
安裝完成後不像一般軟體可以在軟體清單中使用，還必須操作在許多地方中開啟使用服務下面依不同桌面環境分別介紹

### 在一般 Linux 發行版桌面環境中使用（如 Gnome,KDE）
一般桌面環境底下一般會使用登入界面(Display Manager)所以在這裡需要編寫啟動選項：
```
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic Window Manager
Exec=/usr/local/bin/dwm
Icon=
Type=Application
```
再將上面的內容命名為`dwm.desktop`保存到`/usr/share/xsessions`這個資料夾（目錄）中，完成以後在登出再重新登入，即可以在登入界面中選取 dwm 作為登入界面。

### 在無其他桌面環境開始使用（以新安裝 ArchLinux 的使用者為例）
沒有其他桌面環境的使用者，讓 dwm 作為啟用圖形界面，首先必須安裝 Xorg 作為圖形界面啟動：
```
sudo pacman -S xorg xorg-xinit
```
接著在`~/.xinitrc`中加入`exec dwm`：
```
sudo vim ~/.xinitrc # 使用vim編輯主目錄底下的.xinitrc
exec dwm # 在.xinitrc文件中輸入這行文字即可
```
接著從終端界面中輸入`startx`即可啟動 dwm

### 簡易使用教學

dwm主要以快捷鍵操作，ModKey 為 Alt，預設使用的軟體起動器為 dmenu，終端機為 st，之後會有專文介紹，但依舊支援滑鼠使用：

|鍵盤輸入|指令|
|--------|----|
|Alt+Shift+Q|退出dwm|
|Alt+D|開啟dmenu|
|Alt+Enter|開啟st終端機|
|Alt+j/k|切換視窗|
|Shift+Alt+c|關閉目前視窗|
|Alt+m|將視窗轉換為最大化模式|
|Alt+t|將視窗切換為平鋪模式|
|Alt+(1~9)|切換視窗標籤(tags)|
|Ctrl+Shift+PageUp/PageDown|zoom in/zoom out|

這些快捷鍵皆可按照自己使用習慣來切換、編輯，例如可以使用快捷鍵開啟瀏覽器、檔案管理員等軟體，更自己編寫腳本再以快捷鍵使用調整音量、螢幕亮度、關機，實現無限可能。

---
參考資料：

1. [ArchLinux維基的dwm介紹](https://wiki.archlinux.org/title/Dwm)
	
1. [知乎文章1](https://zhuanlan.zhihu.com/p/430217503)
	
1. [知乎文章2](https://zhuanlan.zhihu.com/p/408552473)
	
1. [我的dwm配置](https://github.com/FGZ0908/dwm)
	

