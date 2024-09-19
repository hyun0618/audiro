package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.FavoriteListUserStateReqDto;
import com.audiro.dto.FavoriteListUserUpdateReqDto;

public interface FavoriteUsersDao {
	List<FavoriteUsers> selectFavoriteUsers(@Param("sort") String sort); 
	
	Integer selectFavoriteListUserState(FavoriteListUserStateReqDto dto);
	void insertFavoriteListUser(FavoriteListUserUpdateReqDto dto);
    void deleteFavoriteListUser(FavoriteListUserUpdateReqDto dto);

}
