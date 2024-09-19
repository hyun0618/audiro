package com.audiro.repository;

import com.audiro.dto.MypageDto;

public interface MypageDao {
	//로그인 한 id로 users 모든 컬럼, profile의 모든 컬럼 select
	MypageDto selectUsersAllProfileAllById(String id);
	
	//비밀번호 변경 - where 로그인한 id로  
	int updatePasswordHash(MypageDto dto);
	
	//이름 변경 - where 로그인한 id로 
	int updateUserName(MypageDto dto);
	
	//닉네임 변경 - where 로그인한 id로 
	int updateNickname(MypageDto dto);
	//전화번호 변경 - where 로그인한 id로 
	int updatePhone(MypageDto dto);
	//이메일 변경 - where 로그인한 id로 
	int updateEmail(MypageDto dto);
	//이건 프로필 테이블 변경 자기소개 변경 - where 로그인한 id의 usersId로 
	int updateIntroduction(MypageDto dto);
	
	//중복검사
	//닉네임 중복 검사
	MypageDto selectNickname(String nickname);
	
	//전화번호 중복 검사
	MypageDto selectPhone(String phone);
	//이메일 중복 검사
	MypageDto selectEmail(String email);
	
	//프로필 이미지(경로 수정) 업데이트
	int updateProfilePathByUsersId(String path, Integer usersId);
	
	//비밀번호 가져오기
	String selectPasswordByUsersId(Integer usersId);
	
	//탈퇴
	int deleteUserByUsersId(Integer usersId);
}
