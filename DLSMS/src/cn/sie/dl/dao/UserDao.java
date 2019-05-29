package cn.sie.dl.dao;

import java.util.List;
import java.util.Map;

import cn.sie.dl.entity.UserInfo;

public interface UserDao {

	public Long save(UserInfo user);

	public List<UserInfo> finduser(UserInfo user);

	public List<UserInfo> findAll();

	public void deleteById(Integer id);

	public List<UserInfo> finduserById(Integer id);

	public void updateuserById(UserInfo user);

	public long findNewCont(Map<String, Object> params);

	public List<UserInfo> findNewsPage(Map<String, Object> params);

	public List<UserInfo> userFindByName(String name);
	
}
