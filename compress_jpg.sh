#!/bin/bash

# 若有輸入參數則使用參數路徑，否則預設處理所有文章
TARGET_DIR="${1:-content/posts}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "錯誤: 目錄 $TARGET_DIR 不存在。"
    exit 1
fi

echo "開始處理目錄: $TARGET_DIR"

# 遞迴搜尋並處理圖片
find "$TARGET_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | while IFS= read -r -d '' file; do
    echo "正在優化: $file"
    mogrify -strip -resize 1100\> -define jpeg:extent=200kb "$file"
done

echo "完成！"
