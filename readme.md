# git clone 

# 文件修改
## 1. 修改Dockerfile
修改Dockerfile第三行 为最新版本(或想玩的版本)

## 2. 修改配置文件 mcbe_config/
`server.properties` 游戏配置  
世界名称(对应worlds的子文件夹) 世界种子 难度 模式  ...  


# 通过dockerfile 创建image
```
docker build -t mcbe_server .
```

# 通过image 创建容器
```
docker run -itd -v "$(pwd)/mcbe_config:/mcbe_config/"\
 -v "$(pwd)/worlds:/mcbe_server/worlds"\
 -p 9000:19132/udp --name mcbe mcbe_server
```



# 启动/停止/重启 服务器
```
docker stop mcbe

docker start mcbe

docker restart mcbe
```