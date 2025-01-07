package com.turnip.turnipjava.utils;


import org.springframework.util.DigestUtils;

import java.nio.charset.StandardCharsets;
import java.util.UUID;

/**
 * MD5工具类
 */
public class MD5Utils {

    /**
     * 加密字符串
     * @param text 待加密字符串
     * @return 加密后的字符串
     */
    public static String encrypt(String text) {
        return DigestUtils.md5DigestAsHex(text.getBytes(StandardCharsets.UTF_8));
    }

    /**
     * 带盐值加密
     * @param text 待加密字符串
     * @param salt 盐值
     * @return 加密后的字符串
     */
    public static String encrypt(String text, String salt) {
        return DigestUtils.md5DigestAsHex((text + salt).getBytes(StandardCharsets.UTF_8));
    }

    /**
     * 生成随机盐值
     * @return 盐值
     */
    public static String generateSalt() {
        return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
    }

    /**
     * 校验密码是否正确
     * @param text 待校验字符串
     * @param salt 盐值
     * @param md5 加密后的字符串
     * @return 是否匹配
     */
    public static boolean verify(String text, String salt, String md5) {
        return encrypt(text, salt).equals(md5);
    }

    /**
     * 多次加密
     * @param text 待加密字符串
     * @param times 加密次数
     * @return 加密后的字符串
     */
    public static String encryptTimes(String text, int times) {
        String result = text;
        for (int i = 0; i < times; i++) {
            result = encrypt(result);
        }
        return result;
    }

    /**
     * 带盐值多次加密
     * @param text 待加密字符串
     * @param salt 盐值
     * @param times 加密次数
     * @return 加密后的字符串
     */
    public static String encryptTimes(String text, String salt, int times) {
        String result = text + salt;
        for (int i = 0; i < times; i++) {
            result = encrypt(result);
        }
        return result;
    }
}