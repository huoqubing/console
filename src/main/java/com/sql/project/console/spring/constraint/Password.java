package com.sql.project.console.spring.constraint;


import com.sql.project.console.common.MessageConstant;
import com.sql.project.console.spring.validator.PasswordValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @ClassName:     Password.java
 * @Description:   TODO
 * @author         FrankWong
 * @version        V1.0  
 * @Date           2013-7-28 下午3:37:32 
 */
@Target({ ElementType.FIELD, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PasswordValidator.class)
public @interface Password {

	String message() default MessageConstant.ERROR_LOGIN_PASSWORD_REQUIRED;

	int min();

	int max();

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
