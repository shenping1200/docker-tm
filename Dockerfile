# 使用一个轻量级的Linux基础镜像
FROM alpine:latest

# 安装Docker CLI，因为你需要执行docker命令
RUN apk add --no-cache docker

# 复制你的启动脚本到容器中
COPY start_container.sh /usr/local/bin/start_container.sh

# 赋予脚本执行权限
RUN chmod +x /usr/local/bin/start_container.sh

# 定义容器启动时执行的命令
CMD ["/usr/local/bin/start_container.sh"]
