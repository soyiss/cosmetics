package com.icia.cosmetics.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@ToString
public class ProductDTO {

    private Long id;

    // 상품이름
    private String productName;

    // 상품 가격
    private int productPrice;

    // 상품 수량
    private int productQu;

    //상품 설명
    private String productContents;

    //상품 파일 여부
    private int fileAttached;

    //상품 파일(다중)
    private List<MultipartFile> productFile;
}
