---
title: "Dwm細部修改之介紹"
date: 2024-01-24T15:09:13+08:00
draft: true
cover:
    image: ""
    alt: ""
    caption: ""
categories: 
- 自由軟體
tags: 
- dwm
- suckless
- linux
description: "時隔一年多，終於又要來談談 dwm，這個極簡風格的桌面系統。"
---

## 一年前挖下的坑
大約在[一年前的文章](https://fgzblog.com/2022/09/dwm-suckless-%E5%B9%B3%E9%8B%AA%E5%BC%8F%E6%A1%8C%E9%9D%A2%E7%92%B0%E5%A2%83/)中，我提到會在接下來和大家再介紹一下 dwm 這個軟體的細部使用方式，但實在是出於人類的惰性，加上使用上需要自己折騰一下才能再了解一些內容，我非本科生，想要在網路上與大家分享需要對此方面有更深刻的了解才敢發文，也就拖到了現在。

## dwm的客製化使用

原生的dwm系統非常的素，可以說是除了桌面以外什麼都沒有，所以我們需要對其中的代碼做修訂，才能達到客製化的使用，dwm的客製化修改皆是經由 config.h 中的代碼來製作。

首先要進入dwm安裝好的目錄中，以文字編輯器開啟config.h這一個檔案，這邊我所使用的是 vim，大家可以照自己喜好使用任何文字編輯器，用即便是用 Windows 的記事本也是可以的。
```
cd dwm
vim config.h
```
接下來以 suckless 官方的`config.h`檔案作為範例為大家說明裡面代碼的作用，我雖然不懂C語言怎麼寫，但是其實內容真的淺顯易懂，連我文科生都可以輕鬆了解。

### 修改外觀 (appearance)
```
/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};
```
首先第一行`static const unsigned int borderpx  = 1;        /* border pixel of windows */`是說明個個視窗之間的間距，suckless設定是1，也就是視窗間距極小，此處我也沒有做其他調整，認為這樣的間距是可以接受的。如果喜歡視窗之間留有一點空隙就看各位自行選擇，但不要設得太大。

`static const char *fonts[]          = { "monospace:size=10" };`這行是說工具列的字體大小，預設為10號，在當今解析度極高的螢幕上顯得有點太小，以我個人是將數值調整到14。另外字體設定預設是monospace等寬字體，如果想要更換為自己電腦中有安裝的字體也可以，但要注意是否字元間距是否會過小，以免發生字體重疊的問題。以下是如果想改元中文的思源黑體的範例：
`"Noto Sans CJK TC:size=14:type=Medium,Regular:antialias+true:autohint=true"`

