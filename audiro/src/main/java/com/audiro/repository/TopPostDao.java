package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteTopPostStateReqDto;
import com.audiro.dto.FavoriteTopPostUpdateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopPostDto;

@Mapper
public interface TopPostDao {
	// 메인 인기 후기 
	List<TopPostDto> selectTopPost(); 
	
	// 메인 인기 후기 찜 상태, 업데이트 
	Integer selectFavoritTopPostState(FavoriteTopPostStateReqDto dto);
	void insertFavoriteTopPost(FavoriteTopPostUpdateReqDto dto);
    void deleteFavoriteTopPost(FavoriteTopPostUpdateReqDto dto);

}
