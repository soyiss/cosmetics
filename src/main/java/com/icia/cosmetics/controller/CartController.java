package com.icia.cosmetics.controller;

import com.icia.cosmetics.dto.CartDTO;
import com.icia.cosmetics.dto.MemberDTO;
import com.icia.cosmetics.service.CartService;
import com.icia.cosmetics.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
@RequestMapping("/cart")
@Controller
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private MemberService memberService ;

    @GetMapping("/cart")
    public String cartForm(HttpSession session, @RequestParam("id")Long id, Model model){
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        System.out.println("가져왔냐 memberDTO = " + memberDTO);
        CartDTO cartDTO = new CartDTO();
        cartDTO.setMemberId(memberDTO.getId());
        cartDTO.setProductId(id);
        cartService.updateCart(id);
        cartService.save(cartDTO);
        model.addAttribute(cartDTO);
//        여기서 cartDTO에 찍어보면 아직 save에 저장되지 않았으니까 id와 수량이 null과 0이 뜬다.
        System.out.println("cartDTO = " + cartDTO);
        return "/carts/cartSave";
    }
}
