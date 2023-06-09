package com.icia.cosmetics.repository;

import com.icia.cosmetics.dto.MemberDTO;
import com.icia.cosmetics.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save",memberDTO);
        return memberDTO;
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return sql.selectOne("Member.findByMemberEmail",loginEmail);
    }

    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.selectOne("Member.saveFile",memberFileDTO);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }

    public MemberFileDTO findFile(Long id) {
        return sql.selectOne("Member.findFile",id);
    }

    public void delete(MemberDTO memberDTO) {
        sql.delete("Member.delete",memberDTO);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
}
