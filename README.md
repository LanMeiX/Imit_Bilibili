# SpringBoot 2.x 实战仿B站高性能后端项目

## 1、项目简介

 本项目基于SpringCloud微服务架构+Springboot+JDK+Maven等技术，实现B站核心功能（视频流、弹幕流）+百万量级的高性能优化。该项目要求仿照目前比较流行的"哔哩哔哩"视频网站，以MVC架构为技术基础搭建网站后台，实现视频、弹幕、用户注册、动态订阅、粉丝关注等核心业务功能。该项目是一个后端工程，重点实现其中以用户关注、动态订阅、视频、弹幕等为主线的核心业务。

![1654760337467](https://user-images.githubusercontent.com/82700457/172793573-fe8aae57-5a1d-4087-9049-80086058af7c.png)


## 2、技术栈

Spring、SpringBoot、JWT、Git、Mysql、MyBatis、FastDFS、Elasticsearch、RocketMQ、Redis、Nginx、SpringCloud(Feign、Eureka、Zuul)、jenkin、WebSocket 

## 3、项目架构

![1654760268185](https://user-images.githubusercontent.com/82700457/172793621-dc172be6-7058-4139-81d0-5420d536bbcf.png)


## 4、业务开发流程

通用功能

- 数据加解密、安全验证、跨域处理、热部署、                            
- Json 处理                            

用户服务

- 用户注册和登录、忘记和修改密码、项目权限分配、                            
- 用户即时通讯、消息、订阅、关注                            

核心功能

- 视频上传和下载、视频轮播和异步加载、视频分享、                            
- 点赞、投币、分片、大规模弹幕实时加载、                            
- 观看记录同步                            

系统开发&部署

- 自动化部署、智能推荐、异步推送、数据统计、                           
- 日志记录、全局搜索、系统广播、负载均衡                            
