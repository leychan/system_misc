#! /bin/bash
# 该脚本用于处理pamac安装软件时，由github下载缓慢甚至无法下载的问题
# 检测域名是不是github，如果是，则使用代理进行下载

domain=`echo $2 | cut -f3 -d'/'`;
https_proxy="socks5://localhost:7891"
case "$domain" in 
    "github.com")
    echo "download from github $2 using proxy";
    export $https_proxy  && /usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o $1 $2 && unset https_proxy;
esac
