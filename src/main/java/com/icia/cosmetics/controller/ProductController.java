package com.icia.cosmetics.controller;

import com.icia.cosmetics.dto.BoardDTO;
import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import com.icia.cosmetics.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

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
    public String save(@ModelAttribute ProductDTO productDTO ) throws IOException {
        System.out.println("아아아 productDTO = " + productDTO);
        productService.save(productDTO);
        System.out.println("2222productDTO = " + productDTO);
        return "redirect:/product/list";
    }

    @GetMapping("/list")
    public String list(Model model){

        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);

        return "/products/productList";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id){
        ProductDTO productDTO = productService.findById(id);
        productService.delete(productDTO);
        return "redirect:/product/list";
    }

}
