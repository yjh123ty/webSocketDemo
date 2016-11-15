package org.xdemo.example.websocket.mapper;

import java.util.List;

import org.xdemo.example.websocket.entity.SysMenu;

public interface SysMenuMapper extends BaseMapper {

	/**
	  * getUserSysMenus(获取用户所有菜单 用来形成树)
	  * @param id 用户id
	  * @return 菜单列表
	  */
	List<SysMenu> getUserSysMenus(Long id);
	
	/**
	 * getAllMenusTree(获取所有菜单 用来形成树)
	 * @return 菜单列表
	 */
	List<SysMenu> getAllMenusTree();
}
