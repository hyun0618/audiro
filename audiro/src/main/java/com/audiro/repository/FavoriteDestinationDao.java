package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.dto.FavoriteListDestStateReqDto;
import com.audiro.dto.FavoriteListDestUpdateReqDto;

public interface FavoriteDestinationDao {
	
	List<FavoriteDestinationDto> selectAllOrderById(Integer usersId);	
	FavoriteDestinationDto selectById(Integer favoriteDestinationId);
	
	// views/favorite/list
	List<FavoriteDestination> selectFavoriteDestination(@Param("sort") String sort);
		
	// 
	Integer selectFavoriteListDestState(FavoriteListDestStateReqDto dto);
	void insertFavoriteListDest(FavoriteListDestUpdateReqDto dto);
    void deleteFavoriteListDest(FavoriteListDestUpdateReqDto dto);
}
