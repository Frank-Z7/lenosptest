package com.len.core.exception;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.len.util.LenResponse;

@RestControllerAdvice
public class CustomException {

    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(AuthenticationException.class)
    public LenResponse getAuthenticationException(AuthenticationException e) {
        return new LenResponse(false, e.getMessage(), 401);
    }

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(UnknownAccountException.class)
    public LenResponse getUnknownAccountException(UnknownAccountException e) {
        return new LenResponse(false, e.getMessage(), 401);
    }

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(UnauthorizedException.class)
    public LenResponse getUnauthorizedException(UnauthorizedException e) {
        return new LenResponse(false, e.getMessage(), 401);
    }
}
