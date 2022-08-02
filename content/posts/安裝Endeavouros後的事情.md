---
title: "安裝EndeavourOS後做的六件事。"
date: 2022-08-03T00:27:06+08:00
draft: false
cover:
    image: ""
    alt: ""
    caption: ""
categories: 
- Linux
- EndeavourOS
- 軟體介紹
tags: 
- Linux
- EndeavourOS
- 軟體介紹
keywords:
- Linux
- EndeavourOS
- 軟體介紹
description: "上上篇文介紹到了基於Arch的Linux發行版，這篇文來說說之後所作的事情。"
---

和大家分享一下身為中文用戶，在安裝EndeavourOS以後所作的事情，雖然說是分享，但裡面的內容更多是給我自己做一個安裝筆記，內文中的軟體是自己平常常用的幾款，大家可以自行挑選常用的去做選擇。

# Things after install EndeavoursOS

## 常用軟體
小弟愛用的幾款軟體：用來編輯文章及寫點小東西的[neovim](https://neovim.io/),[VScode](https://archlinux.org/packages/community/x86_64/code/)、更改終端機界面的[zsh](https://wiki.archlinux.org/title/Zsh)內容需要再配置，之後會在和大家分享、功能豐富的靜態網頁生產器[hugo](https://gohugo.io/)、同步手機與電腦檔案的[Syncthing](https://syncthing.net/)、強大的影片下載軟體[yt-dlp](https://github.com/yt-dlp/yt-dlp)、以及常用的通訊軟體[signal](https://www.signal.org/)與[telegram](https://telegram.org/)。

```
sudo pacman -S neovim code zsh hugo syncthing yt-dlp signal-desktop telegram-desktop firefox
```
## 中文注音輸入法
上面的東西做完，還不能打中文阿！必須趕快再下載下列這幾樣軟體。
```
sudo pacman -S fcitx5-im fcitx5-chinese-addons  fcitx5-rime
```
## Aur軟體
讀書背書專用的Anki神器、內建擋廣告的Brave瀏覽器、寫筆記專用的Joplin
```
yay -S anki brave-bin joplin-appimage
```

## 中文輸入配置
nano是比較基本的文字編輯器，簡單好上手，大家可以更換成自己習慣的文字編輯器。
```
nano /etc/environment
```

在文件中加入以下內容

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
```
存檔後`reboot`就可以看到更動。
和windows的shift切換字體不同，這裡是預設為Ctrl+空白鍵更換字體。

## 中文字體
什麼好看免費的字體通通都灌進來就對了。
```
sudo pacman -S noto-fonts-cjk wqy-microhei wqy-microhei-lite wqy-bitmapfont
```

```
sudo pacman -S wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

## 設定藍芽
因為EndeavourOS為了達到簡潔的地步，並沒有預設藍芽驅動，需要靠用戶自行下載使用。
```
sudo pacman -S --needed bluez bluez-utils
sudo pacman -S blueberry
```
接著需要開啟藍芽
`sudo systemctl enable bluetooth`

然後就可以在應用軟體中找到圖形化界面的藍芽程式了！

---
# 後記
從Windows開始使用電腦，一直以為電腦界面就應該是這樣，直到最近開始接觸Linux以後，才了解到原來可以用這多不同的可變性，電腦身為一台計算機，並不是只能像Windows那樣被許多商業軟體綁架，歡迎大家一起來試看看使用不同的作業系統吧！

# 參考資料
[ArchLinux安装后的必须配置与图形界面安装教程](https://www.viseator.com/2017/05/19/arch_setup/)

[从零开始配置自己的Arch Linux桌面（极简）](https://zhuanlan.zhihu.com/p/112536524)

[EndeavourOS文章](https://discovery.endeavouros.com/bluetooth/bluetooth/2021/03/)