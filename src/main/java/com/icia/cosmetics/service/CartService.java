package com.icia.cosmetics.service;

import com.icia.cosmetics.dto.CartDTO;
import com.icia.cosmetics.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    public void save(CartDTO cartDTO) {
        cartRepository.save(cartDTO);
    }

    public void updateCart(Long id) {
        cartRepository.updateCart(id);
    }
}
