package com.audiro.service;

import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.dto.FavoriteListDestStateReqDto;
import com.audiro.dto.FavoriteListDestUpdateReqDto;
import com.audiro.dto.FavoriteListPostStateReqDto;
import com.audiro.dto.FavoriteListPostUpdateReqDto;
import com.audiro.dto.FavoriteListUserStateReqDto;
import com.audiro.dto.FavoriteListUserUpdateReqDto;
import com.audiro.dto.FavoritePostDto;
import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.FavoriteUsersDto;
import com.audiro.repository.FavoriteDestination;
import com.audiro.repository.FavoriteDestinationDao;
import com.audiro.repository.FavoritePost;
import com.audiro.repository.FavoritePostDao;
import com.audiro.repository.FavoriteUsers;
import com.audiro.repository.FavoriteUsersDao;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class FavoriteService {
	
	private final FavoriteUsersDao favoriteUsersDao;
	private final FavoriteDestinationDao favoriteDestinationDao;
	private final FavoritePostDao favoritePostDao;
	
	// 로그인한 유저의 찜 목록 불러오기 
	public List<FavoriteUsersDto> readUsers(String sort) {
		List<FavoriteUsers> list = favoriteUsersDao.selectFavoriteUsers(sort);
		return list.stream()
				.map(FavoriteUsersDto::fromEntity)
				.toList();
	}	
	public List<FavoriteDestinationDto> readDestination(String sort) {
        List<FavoriteDestination> list = favoriteDestinationDao.selectFavoriteDestination(sort);
        return list.stream()
                .map(FavoriteDestinationDto::fromEntity)
                .toList();
    }	
	
	public List<FavoritePostDto> readPost(String sort) {
		List<FavoritePost> list = favoritePostDao.selectFavoritePost(sort);
		return list.stream()
				.map(FavoritePostDto::fromEntity)
				.toList();
	}
	
	// 찜 상태
	public Integer getFavoriteListDestState(FavoriteListDestStateReqDto dto) {
		return favoriteDestinationDao.selectFavoriteListDestState(dto);
	}
	public Integer getFavoriteListUserState(FavoriteListUserStateReqDto dto) {
		return favoriteUsersDao.selectFavoriteListUserState(dto);
	}
	public Integer getFavoriteListPostState(FavoriteListPostStateReqDto dto) {
		return favoritePostDao.selectFavoriteListPostState(dto);
	}
	
	// 찜 추가
	public void addFavoriteListDest(FavoriteListDestUpdateReqDto dto) {
		favoriteDestinationDao.insertFavoriteListDest(dto);     
	}
	public void addFavoriteListUser(FavoriteListUserUpdateReqDto dto) {
		favoriteUsersDao.insertFavoriteListUser(dto);     
	}
	public void addFavoriteListPost(FavoriteListPostUpdateReqDto dto) {
		favoritePostDao.insertFavoriteListPost(dto);     
	}
		
	// 찜 삭제
	public void removeFavoriteListDest(FavoriteListDestUpdateReqDto dto) {	    		
	    favoriteDestinationDao.deleteFavoriteListDest(dto);  
	}
	public void removeFavoriteListUser(FavoriteListUserUpdateReqDto dto) {
		favoriteUsersDao.deleteFavoriteListUser(dto);   
	}
	public void removeaddFavoriteListPost(FavoriteListPostUpdateReqDto dto) {
		favoritePostDao.deleteFavoriteListPost(dto);     
	}
	
	//
	public boolean isFavoriteListDest(String signedInUser, Integer destinationId) {
		Integer favoriteId = favoriteDestinationDao.selectFavoriteListDestState(
				new FavoriteListDestStateReqDto(destinationId, signedInUser)
		);   
		return favoriteId != null;
	}
	public boolean isFavoriteListUser(String signedInUser, Integer interestedUserId) {
		Integer favoriteId = favoriteUsersDao.selectFavoriteListUserState(
				new FavoriteListUserStateReqDto(interestedUserId, signedInUser)
		);    
		return favoriteId != null;
	}	
	public boolean isFavoriteListPost(String signedInUser, Integer postId) {
		Integer favoriteId = favoritePostDao.selectFavoriteListPostState(
				new FavoriteListPostStateReqDto(postId, signedInUser)
		);	    
		return favoriteId != null;
	}

}
	
	
