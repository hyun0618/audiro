package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.FavoriteListPostStateReqDto;
import com.audiro.dto.FavoriteListPostUpdateReqDto;


public interface FavoritePostDao {
	List<FavoritePost> selectFavoritePost(@Param("sort") String sort);
	
	Integer selectFavoriteListPostState(FavoriteListPostStateReqDto dto);
	void insertFavoriteListPost(FavoriteListPostUpdateReqDto dto);
    void deleteFavoriteListPost(FavoriteListPostUpdateReqDto dto);

}
