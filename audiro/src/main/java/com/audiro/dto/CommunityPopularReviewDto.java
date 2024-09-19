package com.audiro.dto;

import lombok.Data;

@Data
public class CommunityPopularReviewDto {
    
     // post_id 컬럼 
    private Integer postId;
     //count 컬럼: 게시글이 찜 된 횟수
    private Integer count;
}
