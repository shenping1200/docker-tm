# 使用一个包含Docker客户端的镜像
FROM docker:24-cli-alpine

# 复制你的启动脚本到镜像中
COPY start_container.sh /usr/local/bin/start_container.sh

# 赋予脚本执行权限
RUN chmod +x /usr/local/bin/start_container.sh

# 定义容器启动时执行的命令
CMD ["/usr/local/bin/start_container.sh"]
