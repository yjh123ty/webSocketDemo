package org.xdemo.example.websocket.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.xdemo.example.websocket.app.vo.RemoteResult;
import org.xdemo.example.websocket.app.vo.UserInfo;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.exception.ParamException;
import org.xdemo.example.websocket.service.IUserService;
import org.xdemo.example.websocket.utils.ResultUtils;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/user/remote")
@Api(description = "用户端")
public class AppUserController {
    
    @Autowired
    private IUserService userService;
    
    @ApiOperation(value = "获取用户信息")
    @ApiImplicitParam(name = "id", value = "用户id", required = true, dataType = "long", paramType = "query", defaultValue = "1")
    @RequestMapping(value = "getUserInfo.action", method = RequestMethod.POST)
    public RemoteResult<UserInfo> getUserInfo(Long id) {
        if (id == null) {
            throw new ParamException("id不能为空");
        }
        UserInfo userInfo = userService.getInfoById(id);
        return ResultUtils.createDefResult(userInfo);
    }
}
