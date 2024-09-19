package com.audiro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.MypageDto;
import com.audiro.repository.MypageDao;
import com.audiro.repository.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MypageService {
	private final MypageDao mypageDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//회원정보+프로필 불러오기
	public MypageDto selectUsersAllProfileAllById(String id) {
		log.debug("selectUsersAllProfileAllById(id:{})",id);
		MypageDto dto = mypageDao.selectUsersAllProfileAllById(id);
		log.debug(dto.toString());
		return dto;
	}
	
	//비밀번호 변경
	public int updatePasswardHashById(MypageDto dto) {
		log.debug("updatePasswardHashById(dto:{})",dto);
		
		// 비밀번호 암호화
		String password = passwordEncoder.encode(dto.getPasswordHash());
		dto.setPasswordHash(password);
		log.debug("updatePasswardHashById(dto:{})",dto);
		
		//DB에 업데이트
		int result = mypageDao.updatePasswordHash(dto);
		
		return result;
	}
	
	//이름 변경
	public int updateUserNameById(MypageDto dto) {
		log.debug("updateUserNameById({})",dto);
		
		//DB에 업데이트
		int result = mypageDao.updateUserName(dto);
		log.debug("result : {}",result);
		return result;
	}	
	
	//닉네임 변경
	public int updateNicknameById(MypageDto dto) {
		log.debug("updateNicknameById({})",dto);
		
		//DB에 업데이트
		int result = mypageDao.updateNickname(dto);
		
		return result;
	}		

	//전화번호 변경
	public int updatePhoneById(MypageDto dto) {
		log.debug("updatePhoneById({})",dto);
		
		//DB에 업데이트
		int result = mypageDao.updatePhone(dto);
		
		return result;
	}
	
	//이메일 변경
		public int updateEmailById(MypageDto dto) {
			log.debug("updatePhoneById({})",dto);
			
			//DB에 업데이트
			int result = mypageDao.updateEmail(dto);
			
			return result;
		}
		
		//자기소개 변경
		public int updateIntroductionById(MypageDto dto) {
			log.debug("updateIntroductionById({})",dto);
			
			//DB에 업데이트
			int result = mypageDao.updateIntroduction(dto);
			
			return result;
		}
		
	    
	    // 닉네임 중복 체크: true - 중복되지 않은 닉네임(사용 가능한 닉네임), false - 중복된 닉네임.
	    public boolean checkNickname(String nickname) {
	        log.debug("checkNickname({})", nickname);
	        
	        MypageDto user = mypageDao.selectNickname(nickname);
	        if (user == null) { // nickname 일치하는 레코드가 없을 때(중복된 닉네임이 없는 경우)
	            return true;
	        } else { // nickname 일치하는 레코드가 있을 때(중복된 닉네임이 있는 경우)
	            return false;
	        }
	    }
	    
	    // 전화번호 중복 체크: true - 중복되지 않은 전화번호(사용 가능한 전화번호), false - 중복된 전화번호.
	    public boolean checkPhone(String phone) {
	        log.debug("checkPhone({})", phone);
	        
	        MypageDto user = mypageDao.selectPhone(phone);
	        if (user == null) { // phone 일치하는 레코드가 없을 때(중복된 전화번호 없는 경우)
	            return true;
	        } else { // phone 일치하는 레코드가 있을 때(중복된 전화번호 있는 경우)
	            return false;
	        }
	    }
	    
	    
	    // 이메일 중복 체크: true - 중복되지 않은 이메일 (사용 가능한 이메일 ), false - 중복된 이메일 .
	    public boolean checkEmail(String email) {
	        log.debug("checkEmail({})", email);
	        
	        MypageDto user = mypageDao.selectEmail(email);
	        if (user == null) { // email 일치하는 레코드가 없을 때(중복된 이메일  없는 경우)
	            return true;
	        } else { // email 일치하는 레코드가 있을 때(중복된 이메일  있는 경우)
	            return false;
	        }
	    }
	    
	    //프로필 이미지 변경 서비스
	    public int updateProfileImg(String path, Integer usersId) {
	    	log.debug("updateProfileImg(path:{},usersId:{})",path,usersId);
	    	int result = mypageDao.updateProfilePathByUsersId(path, usersId);
	    	return result;
	    }
	    
	    //비밀번호 가져오기
	    public String selectPasswordHash(Integer usersId) {
	    	log.debug("selectPasswordHash({})",usersId);
	    	String passwordHash = mypageDao.selectPasswordByUsersId(usersId);
	    	log.debug("passwordHash:{}",passwordHash);
	    
	    	return passwordHash;
	    }
	    
	    //탈퇴
	    public int deleteUser(Integer usersId) {
	    	log.debug("deleteUser(dto:{})",usersId);
	    	int result	= mypageDao.deleteUserByUsersId(usersId);
	    	
	    	return result;
	    }
	

}
