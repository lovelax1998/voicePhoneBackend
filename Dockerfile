# 使用官方Python镜像作为基础
FROM python:3.9

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用代码
COPY main.py .

# 创建存储上传文件的目录
RUN mkdir -p /var/data/sound

# 暴露端口
EXPOSE 4088

# 启动命令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4088"]
