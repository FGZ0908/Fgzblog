---
title: Ytdlp,功能最強大的影片、音樂下載器！
date: 2024-09-08T14:25:12+08:00
draft: false
cover:
  image: "img/ytdlp.jpg"
  alt: ""
  caption: ""
categories:
  - 自由軟體
  - 電腦軟體
tags:
  - 電腦軟體
description: 下載Youtube及其他網站的影音最佳解。
---
網路上有許多下載Youtube的方式，但許多都包含廣告或者下載功能不全無法取得所有格式，這邊推薦一款終端機軟體[Yt-dlp](https://github.com/yt-dlp/yt-dlp)可以讓你在不限格式的情況下，下載各式各樣的影片。

### 使用方法
到Ytdlp的Github頁面，裡面提供了各式作業軟體的下載管道，整理如下：
[windows下載連結](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe)
[MacOS下載連結](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_macos)
[Linux下載連結](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp)
下載完成後不像一般的軟體會有一個圖形化界面，需要您開啟各家作業系統的終端機才能使用。

開啟終端機後，輸入以下字詞，軟體會自動下載最高畫質的影像及最高音質的音訊，自動合成為一個檔案
```
yt-dlp 影片網址
```
其他詳細使用方式請參考[yt-dlp的官方頁面](https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#installation)

### 下載指定格式影片
```
yt-dlp --output "%(title)s.%(ext)s" 
-f "bestvideo[height<=1080]+bestaudio[ext=m4a]" 
--embed-thumbnail 
--merge-output-format mp4 
"影片網址"
```
以下說明參數的意思：

`--output "%(title)s.%(ext)s"`是指讓影片名稱與Youtube上的名稱相同，以免出現有其他格式代碼。

`"bestvideo[height<=1080]+bestaudio[ext=m4a]"`這段是指要下載為1080p的影片格式，也可以照著自己的喜好轉換為720p或2160p。

`--embed-thumbnail`插入縮圖

`--merge-output-format mp4`將影片檔案轉換為mp4格式

### 下載指定格式音樂
```
yt-dlp
--output "%(title)s.%(ext)s"
--embed-thumbnail
--ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\""
--add-metadata
--extract-audio
--audio-format mp3 
--audio-quality 320K
"Youtube Music 網址"
```
我以Youtube Music為例：

`--ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\""`這段是指將專輯封面以正方形的格式嵌入音訊檔案（因為Youtube Music的專輯封面都是橫的，直接下載會有兩邊的邊框）。

`--add-metadata`增加音樂檔案的相關資訊，便於整理專輯或演唱人的資料。

`--extract-audio` 只下載音樂不下載影片。

`--audio-format mp3 ` 轉換格式為mp3。

`--audio-quality 320K` 將音訊擷取為320k，這樣音質比較好，但檔案會變大，如果介意硬碟容量可以改為128k,192k,256k。

當然以上這些不只是下載單一檔案的作法，也可以改為下載播放清單或者專輯清單，就會一次下載整個播放清單或整個影片。

### 每次這樣打一大串不是很麻煩？

使用更改預設下載參數，將想要的參數直接建立一個檔案，日後就可以簡單輸入`yt-dlp "要下載的網址"`，就可以下載影片啦！

Linux/macOS的設定檔位於`~/.config/yt-dlp/config`，Windows則是`C:\Users\使用者名稱\AppData\Roaming\yt-dlp\config`

在以上的位置，建立一個`yt-dlp.conf`檔案，裡面填入要用的參數，每行分隔，增加使用上的便利性。

### 除了Youtube也可以下載的地方？
官方有提供一個[列表](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md)，請參閱。
其中包含了Facebook,X(twitter),Instagram,Tiktok,Thread,Twitch,Bilibili
可以滿足大家使用上的需求，其實一些奇奇怪怪的網站也都可以試看看，說不定都能下載。
