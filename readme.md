# 文件修改
## 1. 修改Dockerfile
修改Dockerfile第三行的环境变量 为最新版本(或想玩的版本)的服务器下载链接

## 2. 修改配置文件 mcbe_config/
`server.properties` 游戏配置  
__世界名称__(对应worlds的子文件夹)  __世界种子__ 难度 模式  ...  

## 3. 权限 白名单  
随意...



# 通过dockerfile 创建image

```shell
docker build -t mcbe_server .
```



# 通过image 创建容器

```shell
docker run -itd -v "$(pwd)/mcbe_config:/mcbe_config/"\
 -v "$(pwd)/worlds:/mcbe_server/worlds"\
 -p 9000:19132/udp --name mcbe mcbe_server
```



# 启动/停止/重启 服务器

```shell
# mcbe 对应创建容器的 --name
docker start mcbe
docker stop mcbe
docker restart mcbe
```

