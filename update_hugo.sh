#!/bin/bash

# 取得最新版本號
LATEST_VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

echo "------------------------------------------"
echo "正在準備安裝 Hugo Extended v$LATEST_VERSION"
echo "------------------------------------------"

# 下載暫存檔案
FILENAME="hugo_extended_${LATEST_VERSION}_linux-amd64.deb"
URL="https://github.com/gohugoio/hugo/releases/download/v${LATEST_VERSION}/${FILENAME}"

wget $URL

# 安裝 (如果報錯會自動修復相依性)
sudo dpkg -i $FILENAME || sudo apt --fix-broken install -y

# 清理並驗證
rm $FILENAME
echo "------------------------------------------"
hugo version
echo "安裝完成！"
