package com.audiro.repository;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
//DB 테이블 comments의 모델(Model) 클래스
public class Comment {
	    private Integer commentsId; // Primary Key
	    private Integer postId; //nn Foreign Key: post 테이블의 post_id(pk) 컬럼을 참조.
	    private Integer usersId; //nn Foreign Key: users 테이블의 users_id(pk) 컬럼을 참조.
	    private String content; //nn 댓글 내용.
	    private LocalDateTime createdTime; // 댓글 최초 작성 시간.
	    private LocalDateTime modifiedTime; // 댓글 최종 수정 시간.
	    private Integer parentCommentId; //대댓글에 쓰일 부모 댓글 아이디 부모댓글의 commentsId를 저장insert시키면 된다.
	    private Integer isPrivate; //default 0, --> 비밀댓글(0=공개 1=비밀)
	    //-> 비밀 댓글. DB에서 default 0으로 되어있음(공개 0, 비밀1로 하기로 정함)
	    private String nickname;// 닉네님으로 댓글 보여주기위해
	    private String path; //프로필 이미지
	    private String id; //유저아이디
}