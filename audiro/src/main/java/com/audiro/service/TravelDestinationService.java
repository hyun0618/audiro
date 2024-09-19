package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.TravelDestinationDetailsDto;
import com.audiro.dto.TravelDestinationListDto;
import com.audiro.repository.TravelDestination;
import com.audiro.repository.TravelDestinationDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelDestinationService {

	private final TravelDestinationDao dao;

	public List<TravelDestination> findAll() {
		return dao.findAll();
	}
	
	public TravelDestinationDetailsDto readDetails(Integer id) {
		TravelDestination destination = dao.selectAllById(id);
		
		TravelDestinationDetailsDto dto = TravelDestinationDetailsDto.fromEntity(destination);
		
		return dto;
	}
	
	public List<TravelDestinationListDto> searchByTagsAndKeyword(
			String[] regions, String[] themes, String[] companions, String keyword,
			int currentPage, int itemsPerPage) {
		
		int offset = (currentPage - 1) * itemsPerPage;
		
        List<TravelDestination> destinations = 
        		dao.selectNameAndImgUrlByTagsAndKeyword(regions, themes, companions, keyword, offset, itemsPerPage);
        List<TravelDestinationListDto> dto = TravelDestinationListDto.fromEntities(destinations);
		
		return dto;
    }
	
	public int getTotalPages(
			String[] regions, String[] themes, String[] companions, String keyword, int itemsPerPage) {
		
		int totalDestinations = dao.countDestinations(regions, themes, companions, keyword);
		int totalPages = (int) Math.ceil((double) totalDestinations / itemsPerPage);
		
		return totalPages;
	}
}
