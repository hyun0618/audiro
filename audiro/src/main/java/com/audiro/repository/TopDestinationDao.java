package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopDestinationDto;

@Mapper
public interface TopDestinationDao {
	// 메인 인기 여행지 
	List<TopDestinationDto> selectTopDestination();
	
	// 메인 인기 여행지 찜 상태, 업데이트 
	Integer selectFavoriteState(FavoriteStateReqDto dto);
	void insertFavorite(FavoriteUpdateReqDto dto);
    void deleteFavorite(FavoriteUpdateReqDto dto);
}
