package com.audiro.dto;

import lombok.Data;

@Data
public class CommunityRankingDto {
  //  private Integer usersId;  //찜사용자?테이블의 fk users테이블의 pk를 참조
	private Integer interestedUserId;
    private Integer count;  // 좋아요 수
    private Integer rank;  // 사용자 순위
    
    private String nickname;
    private Integer postId;
    private String title;
    private Integer users_id;
    private Integer good;

}
