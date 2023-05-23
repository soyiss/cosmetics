package com.icia.cosmetics.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartDTO {


    private Long id;
    private Long memberId;
    private Long productId;

    //상품 갯수
    private int cartQu;



}
