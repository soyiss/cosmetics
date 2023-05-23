package com.icia.cosmetics.controller;

import com.icia.cosmetics.dto.*;
import com.icia.cosmetics.service.MemberService;
import com.icia.cosmetics.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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

    @GetMapping("/update")
    public String updateForm(@RequestParam("id")Long id,Model model){
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product",productDTO);
        return "/products/productUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ProductDTO productDTO) {
        System.out.println("9999 productDTO = " + productDTO);
        productService.update(productDTO);
        System.out.println("10 10 10 productDTO = " + productDTO);
        return "redirect:/product/list";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id){
        ProductDTO productDTO = productService.findById(id);
        productService.delete(productDTO);
        return "redirect:/product/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id")Long id,Model model){
        System.out.println("id = " + id);
        ProductDTO productDTO = productService.findById(id);
        System.out.println("호호 productDTO = " + productDTO);
        model.addAttribute("product",productDTO);

        if (productDTO.getFileAttached() == 1) {
            // 파일이 있는 게시글을 선택하면
            ProductFileDTO productFileDTO = productService.findFile(id);
            System.out.println("하하 productFileDTO = " + productFileDTO);
            model.addAttribute("productFileList", productFileDTO);
            System.out.println("productFileList = " + productFileDTO);
        }

        return "/products/productDetail";
    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,Model model){

        List<ProductsDTO> productsDTOList = null;
        PageDTO pageDTO = null;
        productsDTOList = productService.pagingList(page);
        System.out.println("시시시시 productsDTOList = " + productsDTOList);
        // 하단에 보여줄 페이지 번호 목록 데이터
        pageDTO = productService.pagingParam(page);
//         페이지에 들어가는 글 목록들
        model.addAttribute("productList", productsDTOList);
        // 하단에 보여줄 페이지 목록들
        model.addAttribute("paging", pageDTO);

        return "products/productPaging";

    }

    @GetMapping("/detailGo")
    public String DetailGo(@RequestParam("id") Long id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,Model model){
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        model.addAttribute("page", page);
        if(productDTO.getFileAttached() == 1){
            ProductFileDTO productFileDTO = productService.findFile(id);
            model.addAttribute("productFile", productFileDTO);
            System.out.println("파파일 productFileDTO = " + productFileDTO);
        }
        return "/products/detailGo";
    }


    @GetMapping("/productFAQ")
    public String FAQ(){
        return "/products/productFAQ";
    }

    @GetMapping("FAQ_save")
    public String FAQSave(){
        return "redirect:/product/productFAQ";
    }
}
