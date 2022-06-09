package com.imooc.zuul.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import io.netty.util.internal.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class VerifyCodeZuulFilter extends ZuulFilter {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    //是否过滤
    @Override
    public boolean shouldFilter() {
        //请求上下文
        RequestContext requestContext = RequestContext.getCurrentContext();
        //获取HttpServletRequest对象
        HttpServletRequest request = requestContext.getRequest();
        //取出表单序列号
        String serialNumber = request.getParameter("serialNumber");
        //如果存在验证码，则启用过滤器进行过滤
        return !StringUtil.isNullOrEmpty(serialNumber);
    }

    //过滤器逻辑方法
    @Override
    public Object run() throws ZuulException {
        //请求上下文
        RequestContext requestContext = RequestContext.getCurrentContext();
        //获取HttpServletRequest对象
        HttpServletRequest request = requestContext.getRequest();
        String serialNumber = request.getParameter("serialNumber");
        String verifyCode = request.getParameter("verifyCode");
        //从redis中取出验证码
        String redisVerifyCode = redisTemplate.opsForValue().get(serialNumber);
        if(!verifyCode.equals(redisVerifyCode)){
            //不在转发请求
            requestContext.setSendZuulResponse(false);
            //设置HTTP响应码为401（未授权）
            requestContext.setResponseStatusCode(401);
            requestContext.getResponse().
                    setContentType("application/json");
            String msg = "{\n" +
                    "    \"success\":false,\n" +
                    "    \"msg\": \"Code is incorrect\"\n" +
                    "}";
            requestContext.setResponseBody(msg);
        }
        //验证通过
        return null;
    }

    //过滤器类型，一共四种：pre请求前；route处理请求；post请求后；error请求错误时
    @Override
    public String filterType() {
        return "pre";
    }

    //过滤器顺序，值越小优先级越高
    @Override
    public int filterOrder() {
        return 0;
    }


}
