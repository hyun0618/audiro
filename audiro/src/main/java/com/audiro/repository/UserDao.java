package com.audiro.repository;

public interface UserDao {
	User selectById(String id);
	User selectByNickname(String nickname);
	User selectByPhone(String phone);
	User selectByEmail(String email);
	int insertUser(User user);
}
