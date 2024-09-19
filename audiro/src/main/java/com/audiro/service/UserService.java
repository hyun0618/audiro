package com.audiro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.audiro.dto.UserSignUpDto;
import com.audiro.dto.UserSigninDto;
import com.audiro.repository.ProfileDao;
import com.audiro.repository.User;
import com.audiro.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
	
	private final UserDao userDao;
	private final ProfileDao profileDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 아이디 중복 체크
	public boolean checkId(String id) {
		User user = userDao.selectById(id);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkNickname(String nickname) {
		User user = userDao.selectByNickname(nickname);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkPhone(String phone) {
		User user = userDao.selectByPhone(phone);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkEmail(String email) {
		User user = userDao.selectByEmail(email);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public int signup(UserSignUpDto dto) {
		// 비밀번호 암호화
		String password = passwordEncoder.encode(dto.getPasswordHash());
		dto.setPasswordHash(password);
		
		// 유저 생성
		int result = userDao.insertUser(dto.toEntity());
		
		// 등록한 유저의 pk id 찾기
		User user = userDao.selectById(dto.getId());
	
		// 프로필 생성
		profileDao.insertProfileByUsersId(user.getUsersId());
		
		return result;
	}
	
	public User signin(UserSigninDto dto) {
		User user = userDao.selectById(dto.getId());
		
		if (user != null && passwordEncoder.matches(dto.getPasswordHash(), user.getPasswordHash())) {
			return user;
		} else {
			return null;
		}
		
	}
}
