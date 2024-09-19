package com.audiro.dto;

import java.time.LocalDateTime;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class MypageDto {

	private Integer usersId;
	private String id;
	private String passwordHash;
	private String userName;
	private String nickname;
	private String phone;
	private String email;
	private Integer profileId; //pk  
	private String introduction; //자기 소개
	private String path; //프로필 경로 - 디폴트 기본 프로필
	private LocalDateTime registrationTime; //-> 프로필 등록(insert)된 시간
	
}
