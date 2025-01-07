package com.turnip.turnipjava.controller.admin.DTO;


import com.turnip.turnipjava.model.entity.AdminUserLoginHistoryEntity;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Accessors(chain = true)
public class AdminUserLoginHistoryDTO  implements Serializable {

    private Long id;

    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 登录时间
     */
    private LocalDateTime loginTime;

    /**
     * IP地址
     */
    private String ipAddress;

    /**
     * 登录类型：1-账号密码，2-手机验证码，3-微信，4-其他
     */
    private Boolean loginType;

    /**
     * 登录状态：0-失败，1-成功
     */
    private Boolean loginStatus;

    /**
     * 设备类型
     */
    private String deviceType;

    /**
     * 浏览器代理信息
     */
    private String userAgent;

    /**
     * IP归属地
     */
    private String loginLocation;

    public AdminUserLoginHistoryEntity getEntity(){
        AdminUserLoginHistoryEntity adminUserLoginHistoryEntity = new AdminUserLoginHistoryEntity();
         BeanUtils.copyProperties(this,adminUserLoginHistoryEntity);
        return adminUserLoginHistoryEntity;
    }

}
