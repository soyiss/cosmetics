package com.icia.cosmetics.repository;

import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public ProductDTO save(ProductDTO productDTO) {
        sql.insert("Product.save",productDTO);
        return productDTO;
    }

    public void saveFile(ProductFileDTO productFileDTO) {
        sql.insert("Product.saveFile",productFileDTO);
    }

    public List<ProductDTO> findAll() {
       return sql.selectList("Product.findAll");
    }
}
