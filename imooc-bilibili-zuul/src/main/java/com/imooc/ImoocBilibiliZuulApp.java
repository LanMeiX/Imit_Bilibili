package com.imooc;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
@EnableZuulProxy //开启Zuul网关功能
public class ImoocBilibiliZuulApp {

    public static void main(String[] args){
        ApplicationContext app = SpringApplication.run(ImoocBilibiliZuulApp.class, args);
    }

}
