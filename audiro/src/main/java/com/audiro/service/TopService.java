package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteTopPostStateReqDto;
import com.audiro.dto.FavoriteTopPostUpdateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopDestinationDto;
import com.audiro.dto.TopPostDto;
import com.audiro.repository.TopDestinationDao;
import com.audiro.repository.TopPostDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TopService {
	
	private final TopDestinationDao topDestinationDao;
	private final TopPostDao topPostDao;
	
	public List<TopDestinationDto> getTopDestination() {
		return topDestinationDao.selectTopDestination();
	}
	public List<TopPostDto> getTopPost() {
		return topPostDao.selectTopPost();
	}
	
	// 찜 상태
	public Integer getFavoriteState(FavoriteStateReqDto dto) {
		return topDestinationDao.selectFavoriteState(dto);
	}
	public Integer getFavoriteTopPostState(FavoriteTopPostStateReqDto dto) {
		return topPostDao.selectFavoritTopPostState(dto);
	}
	
	// 메인 여행지 찜 추가
	public void addFavorite(FavoriteUpdateReqDto dto) {
		log.debug("Adding favorite for user: {} and destination: {}", dto.getSignedInUser(), dto.getTravelDestinationId());
        
        try {
            topDestinationDao.insertFavorite(dto);
        } catch (Exception e) {
            log.error("Error inserting favorite", e);
        }
    }
	// 메인 여행지 찜 삭제
    public void removeFavorite(FavoriteUpdateReqDto dto) {
    		log.debug("Removing favorite for user: {} and destination: {}", dto.getSignedInUser(), dto.getTravelDestinationId());
        try {
            topDestinationDao.deleteFavorite(dto);
        } catch (Exception e) {
            log.error("Error deleting favorite", e);
        }
    }
    // 메인 여행지 찜 상태
    public boolean isFavorite(String signedInUser, Integer travelDestinationId) {
        Integer favoriteId = topDestinationDao.selectFavoriteState(
                new FavoriteStateReqDto(travelDestinationId, signedInUser)
        );
        return favoriteId != null;
    }
    
    // 메인 글 찜 추가
 	public void addFavorite(FavoriteTopPostUpdateReqDto dto) {
 		log.debug("Adding favorite for user: {} and post: {}", dto.getSignedInUser(), dto.getPostId());
         
         try {
             topPostDao.insertFavoriteTopPost(dto);
         } catch (Exception e) {
             log.error("Error inserting favorite", e);
         }
     }
 	// 메인 글 찜 삭제
    public void removeFavorite(FavoriteTopPostUpdateReqDto dto) {
    		log.debug("Removing favorite for user: {} and destination: {}", dto.getSignedInUser(), dto.getPostId());
        try {
            topPostDao.deleteFavoriteTopPost(dto);
        } catch (Exception e) {
            log.error("Error deleting favorite", e);
        }
    }
	public boolean isFavoriteTopPost(String signedInUser, Integer postId) {
        Integer favoriteId = topPostDao.selectFavoritTopPostState(
                new FavoriteTopPostStateReqDto(postId, signedInUser)
        );
        return favoriteId != null;
    }
}
