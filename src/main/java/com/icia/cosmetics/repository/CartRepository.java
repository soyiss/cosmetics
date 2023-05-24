package com.icia.cosmetics.repository;

import com.icia.cosmetics.dto.CartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartRepository {

    @Autowired
    private SqlSessionTemplate sql;


    // 장바구니 동일상품 있나 확인
    public int countCart(Long productId, Long memberId) {
        Map<String,Object> map = new HashMap<>();
        map.put("productId",productId);
        map.put("memberId",memberId);
        return sql.selectOne("Cart.countCart",map);
    }

    // 장바구니 상품수량 변경(동일한 상품일 경우 수량을 합산하며 update한다
    public void updateCart(CartDTO cartDTO) {
        sql.update("Cart.updateCart",cartDTO);
    }
    // 장바구니에 추가하기
    public void insert(CartDTO cartDTO) {
        sql.insert("Cart.insert",cartDTO);
    }

    //장바구니 리스트
    public List<CartDTO> listCart(Long memberId) {
        return sql.selectList("Cart.listCart",memberId);
    }

    // 장바구니 ㅈ금액 합계
    public int sumMoney(Long memberId) {
        return sql.selectOne("Cart.sumMoney",memberId);

    }
}
