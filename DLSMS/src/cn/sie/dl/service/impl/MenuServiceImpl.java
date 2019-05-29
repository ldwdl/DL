package cn.sie.dl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sie.dl.dao.MenuDao;
import cn.sie.dl.entity.Menu;
import cn.sie.dl.service.MenuService;


@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDao menuDao;

	@Override
	public long findroleCont(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return menuDao.findroleCont(params);
	}

	@Override
	public List<Menu> findRolePage(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return menuDao.findRolePage(params);
	}

	@Override
	public void save(Menu menu) {
		// TODO Auto-generated method stub
		menuDao.save(menu);
	}

	@Override
	public void deleteById(Integer menuId) {
		// TODO Auto-generated method stub
		menuDao.deleteById(menuId);
	}
	
	
	
}
