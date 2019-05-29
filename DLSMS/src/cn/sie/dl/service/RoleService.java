package cn.sie.dl.service;

import java.util.List;
import java.util.Map;

import cn.sie.dl.entity.Role;

public interface RoleService {

	List<Role> findRolePage(Map<String, Object> params);

	long findroleCont(Map<String, Object> params);

	void deleteById(Integer id);

	void save(Role role);

	List<Role> toupfindbyid(Integer roleId);

	void updateByrole(Role role);

	List<Role> roleFindAll();

	List<Role> userGetRole(Integer userId);

	void upAddRole(Integer roleId, Integer userId);

	void upDelRole(Integer roleId, Integer userId);

}
