var ioc = {
		conf : {
			type : "org.nutz.ioc.impl.PropertiesProxy",
			fields : {
				paths : ["customer/localsrc.properties"]
			}
		},
/*	    dataSource : {
	        type : "com.alibaba.druid.pool.DruidDataSource",
	        events : {
	        	create : "init",
	            depose : 'close'
	        },
	        fields : {
	            url : "jdbc:mysql://127.0.0.1:3306/nutzbook",
	            username : "root",
	            password : "root",
	            testWhileIdle : true,
	            validationQuery : "select 1" ,
	            maxActive : 100
	        }
	    },*/
	    dao : {
	    	type : "org.nutz.dao.impl.NutDao"
	    }
};