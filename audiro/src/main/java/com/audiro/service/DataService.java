package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.repository.DataDao;
import com.audiro.repository.DestinationTag;
import com.audiro.repository.TravelDestination;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DataService {

	private final DataDao dao;
	
	public void saveAll(List<TravelDestination> data) {
//		log.debug("saveAll({})", data);
		for (TravelDestination d : data) {
			dao.saveAll(d);
		}
	}
	
	public void saveTag(List<DestinationTag> data) {
		for (DestinationTag d : data) {
			dao.saveTag(d);
		}
	}
	
}
