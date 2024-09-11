---
title: "GrapheneOS 迎來重大更新，加入 Android Auto 系統！"
date: 2024-01-04T21:17:09+08:00
draft: false
cover:
    image: "/img/android_auto.jpg"
    alt: ""
    caption: ""
categories: 
- 手機軟體
tags: 
- 手機軟體
description: "GrapheneOS迎來了大更新，終於加入 Android Auto 功能，更沒有使用 Google 原廠作業軟體的理由。"
---

之前在[這篇文章](https://fgzblog.com/2023/02/grapheneos-%E4%BD%BF%E7%94%A8%E5%BF%83%E5%BE%97/)介紹過GrapheneOS，這個非常重視用戶隱私的手機作業軟體，我近期用了大概有半年以上，可以完全滿足我的日常需求，幾乎沒有什麼東西有必要犧牲。

但如果說真的有令我比較困擾的地方，就是以前開車時經常使用Android Auto 這個手機連接汽車的車機功能，可以透過手機藍芽連接到汽車系統，再加以控制手機上的導航及媒體軟體。這點在以前的 GrapheneOS 真的無法做到，但是在官方的努力下，終於在今年初可以正式使用了！非常感謝 GrapheneOS 團隊的努力，讓大家保有隱私的情況下，作到更小的犧牲。

### 使用說明
首先，當然你必須要安裝好 GrapheneOS，接著在裡面的官方App列表中安裝Google Play Service以及Android Auto。
待安裝完成後，進入到設定 → 應用程式 → Sandboxed Google Play → Android Auto → 打開使用權限Allow permissions for wired(wireless) Android Auto
之後就可以安心使用Android Auto 功能了。

### 其他選項
官方為保持一貫維護用戶隱私的作風，使用 Android Auto 可以再另外打開其他權限，以下說明一下我開啟了哪些功能：
1. Allow to reroute audio from device to the car （以便控制音樂）
2. Allow permissions for handing phone calls （以便接聽電話）
3. Google Maps（導航使用，雖然Organic Maps有時更好用）

### 常見問題
一開始我安裝並設定完成後，Android Auto 並沒有出現我手機上所安裝的 Spotify等其他 App，後來才爬文得知要在設定中再開啟，以下是使用方式：

開啟設定→應用程式→查看所有應用程式→Android Auto→應用程式中的其他設定→下滑頁面到最下面的版本→點擊版本那個欄位十次→開啟開發人員模式→點右上角的三個小點點→開發人員設定→將不明的來源選項打勾→重新啟動Android Auto

這樣設定過後就多了很多手機上的App出現了！
推薦大家使用從 F-droid 下載的自由軟體來收聽音樂，我使用的串流服務是：[Innertune](https://github.com/z-huang/InnerTune)；離線播放使用的是：[Retro Music](https://github.com/RetroMusicPlayer/RetroMusicPlayer)。都可以在車機上獲得很好的使用體驗。