package com.icia.cosmetics.repository;

import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import com.icia.cosmetics.dto.ProductsDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public ProductDTO findById(Long id) {
        return sql.selectOne("Product.findById",id);
    }

    public void delete(ProductDTO productDTO) {
        sql.delete("Product.delete",productDTO);
    }

    public void update(ProductDTO productDTO) {
        sql.update("Product.update",productDTO);
    }

    public ProductFileDTO findFile(Long productId) {
        return sql.selectOne("Product.findFile",productId);
    }

    public List<ProductsDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Product.paging",pagingParams);
    }

    public int productCount() {
        return sql.selectOne("Product.count");
    }



}
