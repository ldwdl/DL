package cn.sie.dl.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sie.dl.dao.UserDao;
import cn.sie.dl.entity.UserInfo;
import cn.sie.dl.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public Long save(UserInfo user) {
		// TODO Auto-generated method stub
		System.out.println("sa");
		return userDao.save(user);
	}

	@Override
	public List<UserInfo> finduser(UserInfo user) {
		// TODO Auto-generated method stub
		System.out.println("ww");
		return userDao.finduser(user);
	}

	@Override
	public List<UserInfo> findAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		userDao.deleteById(id);
	}

	@Override
	public List<UserInfo> finduserById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.finduserById(id);
	}

	@Override
	public void updateuserById(UserInfo user) {
		// TODO Auto-generated method stub
		userDao.updateuserById(user);
	}

	@Override
	public long findNewCont(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return userDao.findNewCont(params);
	}

	@Override
	public List<UserInfo> findNewsPage(Map<String, Object> params) {
		// TODO Auto-generated method stub
		List<UserInfo> list = userDao.findNewsPage(params);
			System.out.println("findnewpage"+list.size());
			System.out.println("date-----"+params.get("mincreatdata"));
		return list;
	}

	@Override
	public List<UserInfo> userFindByName(String name) {
		// TODO Auto-generated method stub
		return userDao.userFindByName(name);
	}
	
	
}
