package com.petshop.model.menu;

import java.util.List;

public class SysMenu {

	int id;
	String text;
	String href;
	List<SysMenu> nodes;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public List<SysMenu> getNodes() {
		return nodes;
	}
	public void setNodes(List<SysMenu> nodes) {
		this.nodes = nodes;
	}
	public SysMenu(int id, String text, String href, List<SysMenu> nodes) {
		super();
		this.id = id;
		this.text = text;
		this.href = href;
		this.nodes = nodes;
	}
	public SysMenu(String text, String href, List<SysMenu> nodes) {
		super();
		this.text = text;
		this.href = href;
		this.nodes = nodes;
	}
	public SysMenu() {
		super();
		// TODO Auto-generated constructor stub
    }
}
