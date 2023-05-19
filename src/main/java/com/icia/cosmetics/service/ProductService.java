package com.icia.cosmetics.service;


import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import com.icia.cosmetics.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public void save(ProductDTO productDTO) {

            productRepository.save(productDTO);

    }
}
