package com.icia.cosmetics.service;

import com.icia.cosmetics.dto.BoardDTO;
import com.icia.cosmetics.dto.PageDTO;
import com.icia.cosmetics.dto.ProductDTO;
import com.icia.cosmetics.dto.ProductsDTO;
import com.icia.cosmetics.dto.ProductFileDTO;
import com.icia.cosmetics.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public void save(ProductDTO productDTO) throws IOException {
        // 파일 있음, 없음.
        if (productDTO.getProductFile().isEmpty()) {
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

            // 원본 파일 이름 가져오기
            String originalFilename = productDTO.getProductFile().getOriginalFilename();
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
            productDTO.getProductFile().transferTo(new File(savePath));
            productRepository.saveFile(productFileDTO);


        }


    }

    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }

    public ProductDTO findById(Long id) {
        return productRepository.findById(id);
    }

    public void delete(ProductDTO productDTO) {
        productRepository.delete(productDTO);
    }

    public void update(ProductDTO productDTO) {
        productRepository.update(productDTO);
    }

    public List<ProductFileDTO> findFile(Long productId) {
        return productRepository.findFile(productId);
    }

    public List<ProductsDTO> pagingList(int page) {
        int pageLimit = 3; // 한페이지에 보여줄 글 목록 갯수
        int pagingStart = (page - 1) * pageLimit; //사용자가 보고싶은 페이지의 게시글 시작 번호(?)
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("Limit", pageLimit);
        List<ProductsDTO> productsDTOList = productRepository.pagingList(pagingParams);
        return productsDTOList;
    }

    public PageDTO pagingParam(int page) {
        int pageLimit = 3; //한 페이지에 보여줄 글 갯수
        int blockLimit = 3; //하단에 보여줄 페이지 번호 갯수
        // 전체 글 갯수 조회
        int productCount = productRepository.productCount();

        // 전체 페이지 갯수 계산
        //전체 글게수를 실수로 바꿔서 3의로 나눈 뒤 올림처리를 한 후 정수로 형변환을 해서 maxPage에 담는다
        int maxPage = (int) (Math.ceil((double) productCount / pageLimit)); // 정수/정수 = 정수(소수는 버림)-->올림처리를 해서 소수점도 가져가야됨

        //시작 페이지 값 계산(1,4,7,10~~`~`)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 마지막 페이지 값 계산(3,6,9,12~~)
        int endPage = startPage + blockLimit - 1;

        // 전체 페이지 갯수가 계산한 endPage보다 작을 때는 endPAge값을 maxPage 값과 같게 세팅
        // 맥스랑 앤드를 비교해서 필요없으면 맥스를 앤드로
        //13게시글에서 엔드를 6으로 했는데 맥스는 5일때 6은 필요없으니까 맥스값을 넣어서 앤드를 5로 해줌
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;

    }


}
