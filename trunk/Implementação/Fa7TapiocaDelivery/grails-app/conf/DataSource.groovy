dataSource {
	pooled = true
	//driverClassName = "org.hsqldb.jdbcDriver"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = "mysql"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:mem:devDB"
			url = "jdbc:mysql://localhost/fa7delivery"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:hsqldb:mem:testDb"
			url = "jdbc:mysql://localhost/fa7delivery"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			url = "jdbc:mysql://localhost/fa7delivery"

		}
	}
}