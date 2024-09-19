package com.audiro.repository;

import java.util.List;
import com.audiro.dto.RecentlyViewedDto;

public interface RecentlyViewedDao {

	List<RecentlyViewedDto> selectRecentlyReviewedDest();
	void insertRecentlyViewedDest(Integer destinationId);
}
