package com.sexteam.util;

import com.sexteam.test.test;

import java.io.*;
import java.util.Properties;

public class RegionValue {
    private String s = " ";
    private static Properties pro;

    static {
        pro = new Properties();
        try {
            InputStream in = test.class.getResourceAsStream("/com/sexteam/properties/resoucePath.properties");
            pro.load(new InputStreamReader(in, "utf-8"));
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static String str(String s) {
        return s + "";
    }

    public static final String USER_MSG = "USER_MSG";
    public static final String HERO_COMMODITY_TYPE = "HERO_COMMODITY_TYPE";
    public static final String HERO_COMMODITY_INITPAGE = "HERO_COMMODITY_INITPAGE";
    public static final String HERO_COMMDITYBYTPYE_ID = "HERO_COMMDITYBYTPYE_ID";
    public static final String SUB_COMMTITYSERVLE_NAME = "SUB_COMMTITYSERVLE_NAME";
    public static final String HERO_TYPE = "HERO_TYPE";
    public static final String HERO_DETAILES = "HERO_DETAILES";
    public static final String USERIMG_REALPATH = pro.getProperty(RegionValue_Path.USERIMG_REALPATH);
    public static final String IMG1_REALPATH = pro.getProperty(RegionValue_Path.IMG1_REALPATH);
    public static final int HERO_COMMODITY_PAGESIZE = 15;
    public static final String HERO_ORDERS_JUDGE = "HERO_ORDERS_JUDGE";
    public static final String JUDGEBUY = "JUDGEBUY";
    public static final String JUDGEADDORDER = "JUDGEADDORDER";

}
