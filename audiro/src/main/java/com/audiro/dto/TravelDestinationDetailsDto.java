package com.audiro.dto;

import com.audiro.repository.TravelDestination;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class TravelDestinationDetailsDto {
	private Integer travelDestinationId;
	private String name;
	private String description;
	private String phone;
	private String site;
	private String address;
	private Double latitude;
	private Double longitude;
	private String imgUrl;
	
	public static TravelDestinationDetailsDto fromEntity(TravelDestination destination) {
		return TravelDestinationDetailsDto.builder()
				.travelDestinationId(destination.getTravelDestinationId())
				.name(destination.getName())
				.description(destination.getDescription())
				.phone(destination.getPhone())
				.site(destination.getSite())
				.address(destination.getAddress())
				.latitude(destination.getLatitude())
				.longitude(destination.getLongitude())
				.imgUrl(destination.getImgUrl())
				.build();
	}
}
