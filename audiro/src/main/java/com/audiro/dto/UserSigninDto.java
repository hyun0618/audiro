package com.audiro.dto;

import lombok.Data;

@Data
public class UserSigninDto {
	private String id;
	private String passwordHash;

}
