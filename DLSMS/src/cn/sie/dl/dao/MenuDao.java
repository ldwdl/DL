package cn.sie.dl.dao;

import java.util.List;
import java.util.Map;

import cn.sie.dl.entity.Menu;

public interface MenuDao {

	long findroleCont(Map<String, Object> params);

	List<Menu> findRolePage(Map<String, Object> params);

	void save(Menu menu);

	void deleteById(Integer id);

}
