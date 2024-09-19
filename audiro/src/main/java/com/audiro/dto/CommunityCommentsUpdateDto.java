package com.audiro.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class CommunityCommentsUpdateDto {
    private Integer commentsId;
    private String content;
    private Integer isPrivate;
    @JsonFormat(pattern = "YYYY-MM-DD hh:mm:ss")
    private LocalDateTime modifiedTime;
}
