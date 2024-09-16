#!/bin/bash

# 定义文件路径
file_path="vendors/openai/openai.go"

git pull

# 使用 sed 进行替换
sed -i '' 's#return NewClientCompatible("OpenAI", "https://api.openai.com/v1", nil)#return NewClientCompatible("OpenAI", "", nil)#' "$file_path"

echo "替换完成：$file_path"

go build .
mv fabric ~/go/bin/fabric

git checkout $file_path
