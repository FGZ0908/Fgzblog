#!/bin/bash

# 確保在發生錯誤時停止執行
set -e

echo -e "\033[0;34m>>> 準備推送到 Netlify...\033[0m"

# 1. (選填) 檢查是否有忘記關閉的 draft: true
# 如果你想確保草稿不被發布，可以執行這行檢查
# grep -r "draft: true" content/

# 2. 加入所有變更
git add .

# 3. 建立提交訊息
# 如果執行時有給參數就用參數，沒有就用當前時間
msg="Site update: $(date +'%Y-%m-%d %H:%M:%S')"
if [ -n "$1" ]; then
	msg="$1"
fi

git commit -m "$msg"

# 4. 推送到 GitHub (Netlify 會自動抓取這個動作)
echo -e "\033[0;32m>>> 正在推送到 GitHub origin main...\033[0m"
git push origin main

echo -e "\033[0;36m>>> 成功！請前往 Netlify 控制面板查看構建進度。\033[0m"
