package com.audiro.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class User {
	private Integer usersId;
	private String id;
	private String passwordHash;
	private String userName;
	private String nickname;
	private String phone;
	private String email;

}
