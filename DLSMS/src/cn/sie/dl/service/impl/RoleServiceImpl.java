package cn.sie.dl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sie.dl.dao.RoleDao;
import cn.sie.dl.entity.Role;
import cn.sie.dl.entity.UserInfo;
import cn.sie.dl.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;

	@Override
	public List<Role> findRolePage(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return roleDao.findRolePage(params);
	}

	@Override
	public long findroleCont(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return roleDao.findroleCont(params);
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		roleDao.deleteById(id);
	}

	@Override
	public void save(Role role) {
		// TODO Auto-generated method stub
		roleDao.save(role);
	}

	@Override
	public List<Role> toupfindbyid(Integer roleId) {
		// TODO Auto-generated method stub
		return roleDao.toupfindbyid(roleId);
	}

	@Override
	public void updateByrole(Role role) {
		// TODO Auto-generated method stub
		roleDao.updateByrole(role);
	}

	@Override
	public List<Role> roleFindAll() {
		// TODO Auto-generated method stub
		return roleDao.roleFindAll();
	}

	@Override
	public List<Role> userGetRole(Integer userId) {
		// TODO Auto-generated method stub
		return roleDao.userGetRole(userId);
	}

	@Override
	public void upAddRole(Integer roleId, Integer userId) {
		// TODO Auto-generated method stub
		roleDao.upAddRole(roleId,userId);
	}

	@Override
	public void upDelRole(Integer roleId, Integer userId) {
		// TODO Auto-generated method stub
		roleDao.upDelRole(roleId,userId);
	}
}
