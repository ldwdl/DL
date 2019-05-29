package cn.sie.dl.entity;

public class Role {
	
	
	private Integer roleId;
	private String roleName;
	private String roleRemark;
	
	
	
	public Role() {
		
	}
	
	
	public Role(String roleName, String roleRemark) {

		this.roleName = roleName;
		this.roleRemark = roleRemark;
	}


	public Role(Integer roleId, String roleName, String roleRemark) {

		this.roleId = roleId;
		this.roleName = roleName;
		this.roleRemark = roleRemark;
		
	}
	
	public Integer getRoleId() {
		return roleId;
	}


	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}


	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleRemark() {
		return roleRemark;
	}
	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
	}
	
	public Integer tod() {
		return roleId;
		
	}

}
