#!/bin/bash

# 设置变量
DOCKER_USERNAME="peanutsplash"
IMAGE_NAME="cvonline"
TAG="latest"

# 检查是否设置了DOCKER_PASSWORD环境变量
if [ -z "$DOCKER_PASSWORD" ]; then
    echo "错误：DOCKER_PASSWORD环境变量未设置"
    echo "请使用以下命令设置密码："
    echo "export DOCKER_PASSWORD='你的密码'"
    exit 1
fi

# 构建Vue.js应用
echo "构建Vue.js应用..."
npm run build

# 创建并使用新的builder实例
echo "创建并使用新的builder实例..."
docker buildx create --name mybuilder --use

# 构建多架构Docker镜像并推送
echo "构建多架构Docker镜像并推送..."
echo "$DOCKER_PASSWORD" | docker login -u $DOCKER_USERNAME --password-stdin
docker buildx build --platform linux/amd64,linux/arm64 -t $DOCKER_USERNAME/$IMAGE_NAME:$TAG -f docker/Dockerfile . --push

# 清理本地构建缓存
echo "清理本地构建缓存..."
docker buildx prune -f

# 登出Docker Hub
docker logout

echo "操作完成"