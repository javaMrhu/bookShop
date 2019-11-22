package com.nyist.utils;

import java.util.UUID;

public class WebUtil {
    public static String makeID()  {


        return UUID.randomUUID().toString().replace("-","");
    }
}
