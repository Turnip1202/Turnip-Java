package com.turnip.turnipjava.aspect;

import com.turnip.turnipjava.annotation.InterfaceEnabled;
import com.turnip.turnipjava.common.R;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class InterfaceEnabledAspect {

    @Pointcut("@annotation(com.turnip.turnipjava.annotation.InterfaceEnabled) || @within(com.turnip.turnipjava.annotation.InterfaceEnabled)")
    public void interfaceEnabledPointcut() {}

    @Around("interfaceEnabledPointcut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        log.info("InterfaceEnabledAspect around() start...");
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();

        // 获取方法上的注解
        InterfaceEnabled annotation = signature.getMethod().getAnnotation(InterfaceEnabled.class);

        // 如果方法上没有注解，尝试获取类上的注解
        if (annotation == null) {
            annotation = signature.getMethod().getDeclaringClass().getAnnotation(InterfaceEnabled.class);
        }

        // 如果注解存在且其值为false，返回null或其他默认值
        if (annotation != null && !annotation.value()) {
            log.info("已禁用接口，接口签名：{}", signature.getMethod());
            return R.error("已禁用接口哦"); // 这里可以根据具体需求返回其他默认值或抛出异常
        }
        log.info("InterfaceEnabledAspect around() end....");

        // 继续执行原方法逻辑
        return joinPoint.proceed();
    }
}