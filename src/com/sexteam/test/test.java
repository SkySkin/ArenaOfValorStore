package com.sexteam.test;

import com.sexteam.util.RegionValue;
import com.sexteam.util.RegionValue_Path;
import com.sexteam.vo.Hero_Commodity;
import org.junit.Test;

import java.io.*;
import java.util.Properties;
import java.util.Random;


public class test {
    @Test
    public void  tests() throws UnsupportedEncodingException {
//        Properties pro = new Properties();
////
//        System.out.println(pro.getProperty(RegionValue_Path.USERIMG_REALPATH));
//        C hero_commodity= new Hero_Commodity();
//        System.out.println(hero_commodity.getClass().getDeclaredFields()[0].getName());

        System.out.println(getNewID("632123820927051"));
    }
    public  String getNewID(String str){
        Random r= new Random();
        int i = r.nextInt(10);

        //前半段
        String begin =str.substring(0,6);
        System.out.println("begin:"+begin);
        //截取年份
        String substring = str.substring(6, 8);
        System.out.println("substring:"+substring);
        //后半段
        String end =str.substring(8)+i;
        System.out.println("end:"+end);
        //判断年份 如果大于19年则增加为19xx 如果小于19则增加为20xx
        String mid=Integer.parseInt(substring)>19? "19":"20";
        return begin+mid+substring+end;

    }


}
