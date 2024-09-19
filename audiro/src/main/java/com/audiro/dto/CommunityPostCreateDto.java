package com.audiro.dto;


import com.audiro.repository.Post;

import lombok.Data;

@Data
public class CommunityPostCreateDto {
    // 필드 이름을 요청 파라미터 이름과 같게 선언 & 기본 생성자 & setter.
	private Integer usersId;
	private String title;
    private String content;
    private Integer postTypeId;
    

    public Post toEntity() {
        return Post.builder().usersId(usersId).title(title).content(content).postTypeId(postTypeId).build();
    }
}
