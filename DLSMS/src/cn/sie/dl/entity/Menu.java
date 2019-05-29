package cn.sie.dl.entity;

public class Menu {
	
	private Integer menuId;
	private String menuName;
	private String parentMenu;
	private String menuUrl;
	private String autTag;//授权标识
	private String menuType;
	
	
	public Menu() {
		
	}
	
	public Menu(String menuName, String parentMenu, String menuUrl, String autTag, String menuType) {
	
		this.menuName = menuName;
		this.parentMenu = parentMenu;
		this.menuUrl = menuUrl;
		this.autTag = autTag;
		this.menuType = menuType;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(String parentMenu) {
		this.parentMenu = parentMenu;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getAutTag() {
		return autTag;
	}
	public void setAutTag(String autTag) {
		this.autTag = autTag;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

}
