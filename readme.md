# 使用方法

## 0. 前期环境
### 0.1. 安装docker
### 0.2. 开放端口 ( 对应 `3.创建容器` 中的`-p` )
### 0.3. 下载项目
```shell
git clone git@github.com:Zeta-qixi/MCBE-Server-Docker.git
cd MCBE-Server-Docker
```

## 1. 文件修改
### 1.1. 修改Dockerfile (决定你的服务器版本)
到[官网 服务器下载](https://www.minecraft.net/zh-hans/download/server/bedrock/)获取下载链接，
修改Dockerfile第三行的环境变量 


## 2.创建image

```shell
docker build -t mcbe_server .
```


## 3.创建容器

```shell
docker run -itd -v "$(pwd)/mcbe_config:/mcbe_config/"\
 -v "$(pwd)/worlds:/mcbe_server/worlds"\
 -v "$(pwd)/mcbe_packs:/mcbe_packs"\
 -p 9000:19132/udp --name mcbe mcbe_server
```

# 地图与资源包&行为包的导入

## 导入自己的地图
 
1.将地图文件放到 `worlds/` 目录下  
2.修改`server.properties`
```
# server.properties
...
level-name=地图文件的名字
...
```

## 导入资源包&行为包
### 添加到文件
解压后的行为包放入`mcbe_packs/behavior_packs/`目录下  
解压后的资源包放入`mcbe_packs/resource_packs/`目录下  
### 修改设置
在所玩的游戏地图的目录下创建`world_behavior_packs.json` 和 `world_resource_packs.json`两个文件  
修改对应`json`文件内容为
```
[
    {
        "pack_id" : "对应要导入包的manifest.json文件的内header中的uuid",
        "version" : "对应要导入包的manifest.json文件的内header中的version"
    },
    {
        ...
    },
    {
        ...
    }
]
```
### 修改`server.properties`
```
# server.properties
...
texturepack-required=true
...
```

## docker 启动/停止/重启 命令

```shell
# mcbe 对应创建容器的 --name
docker start mcbe
docker stop mcbe
docker restart mcbe
```
