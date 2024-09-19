package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.RecentlyViewedDto;
import com.audiro.repository.RecentlyViewedDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class RecentlyViewedService {
	
	private final RecentlyViewedDao recentlyViewedDao;

    public List<RecentlyViewedDto> getRecentlyViewedDest() {
        return recentlyViewedDao.selectRecentlyReviewedDest();
    }
    
    public void addRecentlyViewedDest(Integer destinationId) {
    		recentlyViewedDao.insertRecentlyViewedDest(destinationId);        
    }
}
