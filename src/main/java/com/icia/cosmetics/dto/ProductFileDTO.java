package com.icia.cosmetics.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductFileDTO {

    private Long id;
    private Long productId;
    private String originalFileName;
    private String storedFileName;


}
