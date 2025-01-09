package com.turnip.turnipjava.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.Verification;

import java.util.Date;
import java.util.Map;

public class JWTUtil {
    private static final String SECRET_KEY = "turnip"; // 应该存储在安全的地方
    private static final long EXPIRATION_TIME = 60 * 60 * 1000; // 1小时

    /**
     * 生成JWT令牌
     *
     * @param id       用户ID
     * @param username 用户名
     * @param claims   自定义声明
     * @return 生成的JWT令牌字符串
     */
    public static String generateToken(String id, String username, Map<String, Object> claims) {
        Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);

        return JWT.create()
                .withJWTId(id) // 设置令牌的唯一标识
                .withSubject(username) // 设置令牌的主题，通常是用户名或用户ID
                .withIssuedAt(new Date()) // 设置令牌的签发时间
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_TIME)) // 设置令牌的过期时间
                .withPayload(claims) // 设置令牌的自定义声明
                .sign(algorithm) // 使用HS512算法和SECRET_KEY对令牌进行签名
                ;
    }

    /**
     * 解析令牌
     *
     * @param token JWT令牌
     * @return DecodedJWT对象
     */
    public static DecodedJWT parseToken(String token) {
        Algorithm algorithm = Algorithm.HMAC512(SECRET_KEY);
        JWTVerifier verifier = JWT.require(algorithm).build();
        return verifier.verify(token);
    }

    /**
     * 验证令牌
     *
     * @param token JWT令牌
     * @return 是否有效
     */
    public static boolean validateToken(String token) {
        try {
            DecodedJWT decodedJWT = parseToken(token);
            return !decodedJWT.getExpiresAt().before(new Date());
        } catch (JWTVerificationException e) {
            return false;
        }
    }

    /**
     * 从令牌中获取用户名
     *
     * @param token JWT令牌
     * @return 用户名
     */
    public static String getUsername(String token) {
        DecodedJWT decodedJWT = parseToken(token);
        return decodedJWT.getSubject();
    }

    // 私有化构造方法
    private JWTUtil() {
    }
}