package net.wendal.nutzbook;

import java.util.Date;

import net.wendal.nutzbook.bean.User;

import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.Ioc;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

public class MainSetup implements Setup {

	public void init(NutConfig conf) {
/*		Ioc ioc = conf.getIoc();
		Dao dao = ioc.get(Dao.class);
		Daos.createTablesInPackage(dao, "net.wendal.nutzbook", false);*/
	}
	
	public void destroy(NutConfig conf) {
	}

}
