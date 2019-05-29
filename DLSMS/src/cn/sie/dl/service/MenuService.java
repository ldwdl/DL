package cn.sie.dl.service;

import java.util.List;
import java.util.Map;

import cn.sie.dl.entity.Menu;

public interface MenuService {

	long findroleCont(Map<String, Object> params);

	List<Menu> findRolePage(Map<String, Object> params);

	void save(Menu menu);

	void deleteById(Integer menuId);

}
