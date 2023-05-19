package com.icia.cosmetics.service;

import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import com.icia.cosmetics.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public void save(ProductDTO productDTO) throws IOException {
        // 파일 있음, 없음.
        if (productDTO.getProductFile().get(0).isEmpty()) {
            // 파일 없음.
            System.out.println("파일없음");
            productDTO.setFileAttached(0);
            productRepository.save(productDTO);
        } else {
            // 파일 있음.
            /*
                1. 파일첨부 여부 값 1로 세팅하고 DB에 제목 등 내용 board_table에 저장 처리
                2. 파일의 이름을 가져오고 DTO 필드값에 세팅
                3. 저장용 파일 이름 만들고 DTO 필드값에 세팅
                4. 로컬에 파일 저장
                5. board_file_table에 저장 처리
             */
            System.out.println("파일있음");
            productDTO.setFileAttached(1);
            ProductDTO dto = productRepository.save(productDTO);
            for(MultipartFile productFile: productDTO.getProductFile()){
                // 원본 파일 이름 가져오기
                String originalFilename = productFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // 저장을 위한 BoardFileDTO 세팅
                ProductFileDTO productFileDTO = new ProductFileDTO();
                productFileDTO.setOriginalFileName(originalFilename);
                productFileDTO.setStoredFileName(storedFileName);
                productFileDTO.setProductId(dto.getId());
                // 로컬에 파일 저장
                // 저장할 경로 설정 (저장할폴더+저장할이름)
                String savePath = "D:\\springframework_img\\" + storedFileName;
                // 저장처리
                productFile.transferTo(new File(savePath));
                productRepository.saveFile(productFileDTO);
            }



        }


    }

    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }
}
