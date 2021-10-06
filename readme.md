# 使用方法
## 1. 文件修改
### 1.1. 修改Dockerfile (决定你的服务器版本)
修改Dockerfile第三行的环境变量

### 1.2. 修改配置文件
`mcbe_config/`文件夹中  
- `server.properties` 游戏配置  （地图名字 地图种子 难度...）

- 另外两个文件是权限 白名单  
 看需求随意...

### 1.3. 加入自己的图 （如果你有的话）
 目录下创建`worlds/`文件夹  
`worlds/` 中放入地图  _地图文件夹放这里 (名字要对应`server.properties`中的)_


## 2.创建image

```shell
docker build -t mcbe_server .
```



## 3.创建容器

```shell
docker run -itd -v "$(pwd)/mcbe_config:/mcbe_config/"\
 -v "$(pwd)/worlds:/mcbe_server/worlds"\
 -p 9000:19132/udp --name mcbe mcbe_server
```



## 启动/停止/重启 容器

```shell
# mcbe 对应创建容器的 --name
docker start mcbe
docker stop mcbe
docker restart mcbe
```

