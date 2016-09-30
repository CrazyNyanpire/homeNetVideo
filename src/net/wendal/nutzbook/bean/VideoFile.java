package net.wendal.nutzbook.bean;

public class VideoFile {
	String name;
	String path;
	String absolutepath;
	long size;
	String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getAbsolutepath() {
		return absolutepath;
	}
	public void setAbsolutepath(String absolutepath) {
		this.absolutepath = absolutepath;
	}
}
