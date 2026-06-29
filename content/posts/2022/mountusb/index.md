---
title: "在 ArchLinux 中載入（掛載）隨身碟的方法。"
date: 2022-09-04T18:30:30+08:00
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
- usb
- mountusb
- Archlinux
description: "重新安裝了作業系統，開始使用 ArchLinux，今天遇上了掛載 USB 隨身碟的問題，順便紀錄一下。"
---

在 ArchLinux 裡面，如果使用的是成套的作業系統，如 KDE,Gnome,Xfce，插入 USB 隨身碟即可直接讀取其中的內容，理當來講是沒有什麼問題。但小弟使用的是極簡風格的 suckless 全家餐，一般日常所需功能都需要自己一個一個去安裝，講實在是蠻麻煩的，但也在過程中可以多學到一點電腦知識，就是折騰當好玩吧哈哈～

## 確認要插入的硬碟路徑

可以使用`lsblk`指令來確認要讀取的隨身碟是什麼路徑

```
lsblk
NAME MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS                               
sda    8:0    1  57.7G  0 disk
└─sda1
       8:1    1  57.7G  0 part 
nvme0n1
     259:0    0 238.5G  0 disk
├─nvme0n1p1
│    259:1    0    50G  0 part /
├─nvme0n1p2
│    259:2    0   500M  0 part /boot/efi
├─nvme0n1p3
│    259:3    0   180G  0 part /home
└─nvme0n1p4
     259:4    0     8G  0 part [SWAP]
```
從我的指令中可以看出`nvme0n1`是我的電腦系統碟，`sda`是我所插入的隨身碟。

## 格式化隨身碟（非必要插入啟動開機碟可省略）
首先使用`cfdisk`將隨身碟格式化，在重新選取格式建議選取為`HPFS/NTFS/exFAT`比較符合現代電腦使用。
接下來還有一個重點，就是將隨身碟寫入檔案格式，不然怎麼樣都讀不到硬碟，小弟在這個地方就卡了很久，以下使用/dev/sda1為例：
```
cfdisk # 進入偽gui界面操作格式化硬碟
mkfs.ext4 /dev/sda1
```

## 下載掛載隨身碟工具

幾乎所有作業系統好像都是使用這個程式去掛載隨身碟，平常一般使用者不會下載到，如果你下載了代表你真的很宅哈哈😂

udisks2是掛載USB隨身碟的基本軟體，udiskie是使用udisks2為基礎的自動掛載程式。
```
sudo pacman -S udisks2 udiskie
```

## 使用終端機掛載及卸載
這邊以/dev/sdc1為例，大家千萬要先用`lsblk`確認好自己要掛的usb位置在哪裡。

### 掛載
```
udisksctl mount -b /dev/sdc1
```
### 卸載
```
udisksctl unmount -b /dev/sdc1
```

## 使用自動掛載模式
這個就無腦了只要使用`udiskie`就可以直接自動載入隨身碟，只要按Ctrl+C就可以退出程式也可以直接使用`udiskie &`在背景執行軟體。
在背景執行中可以使用`pkill udiskie`來終止執行。

## USB掛載位置

一般使用 Windows 的用戶會難以理解硬碟到底掛載在哪個位置。但一般我們使用的是自由的作業系統，一般而言 USB 隨身碟的路徑都在
`/run/media/<用戶名稱>/<USB名稱>`

## 參考資料

1. [udiskie](https://github.com/coldfix/udiskie/wiki/Usage)
1. [udisk 的 Arch 維基](https://wiki.archlinux.org/title/Udisks#NTFS_mount_failing)
1. [ Brodie Robertson的教學影片](https://www.youtube.com/watch?v=eVZBvRkLqaE)


