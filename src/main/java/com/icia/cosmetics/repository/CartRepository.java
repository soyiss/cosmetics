package com.icia.cosmetics.repository;

import com.icia.cosmetics.dto.CartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public void save(CartDTO cartDTO) {
        sql.insert("Cart.save",cartDTO);
    }
}
