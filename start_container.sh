#!/bin/bash

if docker ps --format '{{.Names}}' | grep -q "tm"; then
    echo "容器 'tm' 已经在运行。"
else
    if docker ps -a --format '{{.Names}}' | grep -q "tm"; then
        echo "容器 'tm' 存在但未运行，尝试启动它..."
        docker start tm
        if [ $? -eq 0 ]; then
            echo "容器 'tm' 启动成功。"
        else
            echo "错误：无法启动容器 'tm'。"
            exit 1
        fi
    else
        echo "容器 'tm' 不存在，正在拉取镜像 'traffmonetizer/cli_v2' 并启动..."
        docker pull traffmonetizer/cli_v2
        if [ $? -eq 0 ]; then
            docker run -d --name tm --restart unless-stopped traffmonetizer/cli_v2 start accept --token FzSqb0fcZYiflKhQXOsxW7Lr37r1SaGgf0vktIyYbMs= --device-name docker
            if [ $? -eq 0 ]; then
                echo "容器 'tm' 启动成功并设置为自动重启。"
            else
                echo "错误：无法启动容器，请检查配置。"
                exit 1
            fi
        else
            echo "错误：无法拉取镜像，请检查网络或 Docker 配置。"
            exit 1
        fi
    fi
fi
