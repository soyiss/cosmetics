package com.icia.cosmetics.controller;

import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import com.icia.cosmetics.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/save")
    public String saveForm(){
        return "/products/productSave";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute ProductDTO productDTO , Model model) {
        System.out.println("아아아 productDTO = " + productDTO);
        productService.save(productDTO);
        System.out.println("2222productDTO = " + productDTO);
        return "redirect:/";
    }


}
