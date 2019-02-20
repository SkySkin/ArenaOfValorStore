package com.sexteam.test;

import com.sexteam.util.RegionValue;
import com.sexteam.util.RegionValue_Path;
import org.junit.Test;

import java.io.*;
import java.util.Properties;


public class test {
    @Test
    public void  tests() throws UnsupportedEncodingException {
        Properties pro = new Properties();
//
        System.out.println(pro.getProperty(RegionValue_Path.USERIMG_REALPATH));

    }


}
