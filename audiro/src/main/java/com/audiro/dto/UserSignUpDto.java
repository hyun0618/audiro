package com.audiro.dto;

import com.audiro.repository.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class UserSignUpDto {
	private Integer usersId;
	private String id;
	private String passwordHash;
	private String userName;
	private String nickname;
	private String phone;
	private String email;
	
	public User toEntity() {
		return User.builder()
				.id(id)
				.passwordHash(passwordHash)
				.userName(userName)
				.nickname(nickname)
				.phone(phone)
				.email(email)
				.build();
	}
}
