FROM  ubuntu:latest
# https://www.minecraft.net/zh-hans/download/server/bedrock
ENV DOWNLOAD_URL https://minecraft.azureedge.net/bin-linux/bedrock-server-1.17.11.01.zip

EXPOSE 19132/udp
# unzip openssl wget
RUN apt-get update \
    && apt-get install unzip openssl wget -y \
    && wget -O mcbe_server.zip ${DOWNLOAD_URL} \
    && unzip mcbe_server.zip -d mcbe_server \
    && rm mcbe_server.zip

ADD mcbe_config/ /mcbe_config/
# remove file
RUN rm /mcbe_server/server.properties \
    && rm mcbe_server/whitelist.json \
    && rm /mcbe_server/permissions.json
# link
RUN ln -s /mcbe_config/server.properties /mcbe_server/server.properties \
    && ln -s /mcbe_config/whitelist.json /mcbe_server/whitelist.json \
    && ln -s /mcbe_config/permissions.json /mcbe_server/permissions.json

RUN rm -rf /var/lib/apy/list/*

WORKDIR /mcbe_server
 
ENV LD_LIBRARY_PATH=.
CMD ["./bedrock_server"]