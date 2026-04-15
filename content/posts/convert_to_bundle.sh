#!/bin/zsh

# 遍歷目前目錄下所有的 .md 檔案
for f in *.md; do
    # 排除 index.md, _index.md 以及檔名包含空格可能導致的問題
    if [[ "$f" == "index.md" || "$f" == "_index.md" || ! -f "$f" ]]; then
        continue
    fi

    # 取得檔名（不含 .md）
    dir="${f%.md}"

    # 建立與檔案同名的資料夾
    mkdir -p "$dir"

    # 將檔案移動進去並更名為 index.md
    mv "$f" "$dir/index.md"

    echo "✅ 轉換成功: $f -> $dir/index.md"
done

echo "--- 任務完成 ---"
