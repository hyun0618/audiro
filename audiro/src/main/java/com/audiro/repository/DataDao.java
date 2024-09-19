package com.audiro.repository;

public interface DataDao {
	
	int saveAll(TravelDestination destination);

	int saveTag(DestinationTag tag);
}
