package com.turnip.turnipjava.utils.bak;
//
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.Jwts;
//import io.jsonwebtoken.SignatureAlgorithm;
//
//import java.util.Date;
//import java.util.Map;
//
public class JWTUtil_bak {
//    private static final String SECRET_KEY  = "turnip";
//    private static final long EXPIRATION_TIME  = 60 * 60 * 1000;
//
//    /**
//     * 生成JWT令牌
//     *
//     * - 使用Jwts.builder()创建JWT构建器
//     * - 设置用户名作为主题（subject）
//     * - 设置签发时间为当前时间
//     * - 设置过期时间为当前时间加上指定的过期时长（EXPIRATION_TIME）
//     * - 使用HS512算法和SECRET_KEY进行签名
//     * - 最终生成并返回紧凑的JWT字符串
//     *
//     * @param username 用户名
//     * @return 生成的JWT令牌字符串
//     */
//    public static String generateToken(String id, String username, Map<String,Object> claims)  {
//// 创建JWT令牌
//        return Jwt.builder()
//                // 设置令牌的唯一标识
//                .setId(id)
//                // 设置令牌的主题，通常是用户名或用户ID
//                .setSubject(username)
//                // 设置令牌的签发时间
//                .setIssuedAt(new Date())
//                // 设置令牌的过期时间，EXPIRATION_TIME是预定义的过期时间常量
//                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
//                // 使用HS512算法和SECRET_KEY对令牌进行签名
//                .signWith(SignatureAlgorithm.HS512, SECRET_KEY)
//                // 设置令牌的自定义声明
//                .setClaims(claims)
//                // 添加一个名为"roles"的声明，并设置其值为"admin"
////                .claim("roles", "admin")
//                // 构建并返回最终的JWT令牌
//                .compact();
//
//
//    }
//    /**
//     * 解析令牌
//     */
//    public static Claims parseToken(String token) {
//        return Jwts.parser()
//                .setSigningKey(SECRET_KEY)
//                .parseClaimsJws(token).getBody();
//    }
//
//    /**
//     * 验证令牌
//     */
//    public static boolean validateToken(String token) {
//        try {
//            Claims claims = parseToken(token);
//            return !claims.getExpiration().before(new Date());
//        } catch (Exception e) {
//            return false;
//        }
//    }
//
//    /**
//     * 从令牌中去除用户名
//     */
//    public static String getUsername(String token) {
//        Claims claims= parseToken(token);
//        return claims.getSubject();
//    }
//
//
//    //私有化构造方法
//    private JWTUtil_bak() {
//    }
}
