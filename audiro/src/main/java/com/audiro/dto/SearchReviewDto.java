package com.audiro.dto;

import lombok.Data;

@Data
public class SearchReviewDto {
	
	private String category;
    private String keyword;
    private String nickname;
    private Integer usersId;

}
