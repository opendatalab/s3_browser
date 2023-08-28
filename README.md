## S3 Browser

基于Streamlit开发，可在线查看S3存储内容的工具。

### 特性

* 文件夹/文件浏览，注：对象存储没有文件夹概念，仅为模拟文件系统方式进行查看。出于性能考虑，一个文件夹仅支持查看前1000个文件。
* 丰富的文件查看模式
    * 针对JSONL格式优化，可按行预览前1MB的内容
    * 存在图片的路径，支持预览查看图片
* 支持配置多个S3服务，灵活切换
* 支持通过浏览器下载文件

### 使用

编写配置文件`secrets.toml`，多套S3服务配置

```toml
[S3_Servers]

[S3_Servers.S1]
AK = "<Your S3 AK>"
SK = "<Your S3 SK>"
ENDPOINT_URL = "<Your S3 Endpoint Url>"

[S3_Servers.S2]
AK = "<Your S3 AK>"
SK = "<Your S3 SK>"
ENDPOINT_URL = "<Your S3 Endpoint Url>"
```

单个S3也可以配置为

```
[S3]
AK = "<Your S3 AK>"
SK = "<Your S3 SK>"
ENDPOINT_URL = "<Your S3 Endpoint Url>"
```

启动服务 - docker启动

```bash
$ docker run -p 8501:8501 -v $(pwd)/secrets.toml:/s3_browser/.streamlit/secrets.toml zhchbin/s3_browser:v0.0.5
```

在浏览器中访问：`http://127.0.0.1:8501`

### 开发

* 安装poetry: https://python-poetry.org/

* 运行

    ```bash
    $ poetry run streamlit run s3_browser/Welcome.py
    ```

### 作者

* [@jinzhenj](https://github.com/jinzhenj)
* [@zhchbin](https://github.com/zhchbin)
