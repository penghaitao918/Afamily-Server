package com.xiaotao.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * ━━━━━━神兽出没━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 * <p/>
 * ━━━━━━感觉萌萌哒━━━━━━
 *
 * 获取spring信息的工具类
 * @author xiaoTao
 * @date 2016-03-03  21:17
 */
public class SpringUtil implements ApplicationContextAware {

    private static boolean flag = false;
    private static ApplicationContext applicationContext = null;

    @Override
    public  void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
// TODO Auto-generated method stub
        if(SpringUtil.applicationContext == null){
            SpringUtil.applicationContext  = applicationContext;
            System.out.println("---------------------------------------------------------------------");
            System.out.println("========ApplicationContext配置成功,applicationContext="+applicationContext+"========");
            System.out.println("---------------------------------------------------------------------");

        }
        flag = true;
    }
    private static ApplicationContext getApplicationContext() {
        while (!flag){}
        return applicationContext;
    }
    public static Object getBean(String name){
        return getApplicationContext().getBean(name);
    }
}