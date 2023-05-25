package com.icia.cosmetics.service;

import com.icia.cosmetics.dto.CartDTO;
import com.icia.cosmetics.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    // 장바구니 상품 확인
    public int countCart(Long productId, Long memberId) {
        return cartRepository.countCart(productId,memberId);
    }

    // 장바구니 상품수량 변경
    public void updateCart(CartDTO cartDTO) {
        cartRepository.updateCart(cartDTO);
    }

    // 장바구니에 추가
    public void insert(CartDTO cartDTO) {
        cartRepository.insert(cartDTO);
    }

    // 장바구니 리스트
    public List<CartDTO> listCart(Long memberId) {

        return cartRepository.listCart(memberId);
    }

    // 장바구니 금액 합계
    public int sumMoney(Long memberId) {
        return cartRepository.sumMoney(memberId);
    }

    public void modifyCart(CartDTO cartDTO) {
        cartRepository.modifyCart(cartDTO);
    }

    public void delete(long id) {
        cartRepository.delete(id);
    }
}
