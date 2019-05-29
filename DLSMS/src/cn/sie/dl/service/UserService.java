package cn.sie.dl.service;

import java.util.List;
import java.util.Map;

import cn.sie.dl.entity.UserInfo;

public interface UserService {

	Long save(UserInfo user);

	List<UserInfo> finduser(UserInfo user);

	List<UserInfo> findAll();

	void deleteById(Integer id);

	List<UserInfo> finduserById(Integer id);

	void updateuserById(UserInfo user);

	long findNewCont(Map<String, Object> params);

	List<UserInfo> findNewsPage(Map<String, Object> params);

	List<UserInfo> userFindByName(String name);

}
