package com.audiro.dto;

import java.util.List;
import java.util.stream.Collectors;

import com.audiro.repository.TravelDestination;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class TravelDestinationListDto {
	private Integer travelDestinationId;
	private String name;
	private String imgUrl;
	
	public static List<TravelDestinationListDto> fromEntities(List<TravelDestination> destinations) {
        return destinations.stream()
                .map(destination -> TravelDestinationListDto.builder()
                        .travelDestinationId(destination.getTravelDestinationId())
                        .name(destination.getName())
                        .imgUrl(destination.getImgUrl())
                        .build())
                .collect(Collectors.toList());
    }
}
