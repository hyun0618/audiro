package com.audiro.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class DraftPost {
	
	private Integer draftPostId;
	private Integer typeId;
	private String title;
	private String usersId;
	private String content;
	private LocalDateTime modifiedTime;
	
	
	

}
