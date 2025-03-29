# 基于官方 Attic 镜像
FROM ghcr.io/zhaofengli/attic:latest

# 创建工作目录
WORKDIR /attic

# 复制配置文件
COPY server.toml /attic/server.toml

# 暴露端口
EXPOSE 8080

# 健康检查配置
HEALTHCHECK --interval=30s --timeout=10s --retries=5 --start-period=60s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080 || exit 1

# 启动命令
CMD ["-f", "/attic/server.toml"]
