package net.wendal.nutzbook.module;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.wendal.nutzbook.bean.User;
import net.wendal.nutzbook.bean.VideoFile;

import org.nutz.dao.Dao;
import org.nutz.ioc.impl.PropertiesProxy;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
@At("/user")
@Ok("json")
@Fail("http:500")
public class UserModule {

	@Inject
	protected Dao dao;
	@Inject
	protected PropertiesProxy conf;
	
	@At
	public int count() {
		return dao.count(User.class);
	}
	
	@At
/*	public Object login(@Param("name")String name, @Param("password")String password, HttpSession session) {*/
	public List<VideoFile> serchall() {
		ReadFile readFile=new ReadFile();
		String filesrc1=conf.get("localsrc.filesrc");
		List<VideoFile> videoList =new ArrayList<VideoFile>();
			try {
				videoList = readFile.readfile(filesrc1,videoList,filesrc1.length());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return videoList;
	}
	
	@At
/*	public Object login(@Param("name")String name, @Param("password")String password, HttpSession session) {*/
	public List<VideoFile> serch(@Param("path")String path) {
		String filesrc=conf.get("localsrc.filesrc");
		if(path.equals(""))
		{
			path=conf.get("localsrc.filesrc");
		}
		ReadFile readFile=new ReadFile();
		List<VideoFile> videoList =new ArrayList<VideoFile>();
			try {
				videoList = readFile.readfiles(path,videoList,filesrc.length());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return videoList;
	}
}
