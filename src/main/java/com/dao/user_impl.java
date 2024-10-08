package com.dao;

import com.entity.user;

public interface user_impl {

		public int Register(user ob);
		
		public user login(String email,String password);
		
		public boolean CheckPassword(int id,String password);
		
		public int updateprofile(user us);
		
		public boolean CheckUser(String em);
}
