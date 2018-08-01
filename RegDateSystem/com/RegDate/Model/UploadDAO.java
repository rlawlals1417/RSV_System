package com.RegDate.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

public class UploadDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	String sql = null;
	
	public UploadDAO() {
		
		
		Context init = new InitialContext();
		DataSource ds = init.lookup("java:comp/env/jdbc/myoracle");
		con = ds.getConnection();
		
		
	}
	
	public List<UploadVO> selectList() {
		List<UploadVO> list = new ArrayList<UploadVO>();
		
		sql = "select * from upload order by upload_num desc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			UploadVO vo = new UploadVO();
			
			vo.setUpload_num(rs.getInt("upload_num"));
			vo.setUpload_name(rs.getString("upload_name"));
			vo.setUpload_regdate(rs.getString("upload_regdate"));
			vo.setUpload_subject(rs.getString("upload_class"));
			vo.setUpload_comment(rs.getString("upload_comment"));
			list.add(vo);
		}
		rs.close();	pstmt.close();con.close();
		return list;
	}
	
	
	public void delete(int upload_no) {
		int result = 0;
		
		sql = "select upload_pwd from RegDateSystem where upload_no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo.getUpload_no);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			
			if(vo.getUpload_pwd.equals(rs.getInt("upload_pwd"))) {
			sql = "delete from RegDateSystem "
						+ "where upload_no=?";		// 해당 행 삭제 
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getUpload_no());
			result = pstmt.executeUpdate();
			}else {
				result =1;
			
			
			}
			rs.close(); pstmt.close(); con.close();
		}
		
		return result;
		
		
		
	}
	
	
	public int upload(UploadVO vo) {
		int result = 0;
		int no =0;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			no = rs.getInt(1)+ 1;
			
		}else {
			no =1;
		}
		sql = "insert into upload values(?,?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setString(2, vo.getUpload_regdate());
		pstmt.setString(3, vo.getUpload_name());
		pstmt.setString(4, vo.getUpload_class());
		pstmt.setString(5, vo.getUpload_tel());
		pstmt.setString(6, vo.getUpload_writer());
		pstmt.setString(7, vo.getUpload_comment());
		pstmt.setInt(8, 0);
		result = pstmt.executeUpdate();
		
		rs.close(); pstmt.close(); con.close();
		
	return result;
	}
	
	public UploadVO uploadCont(int upload_no) {
		UploadVO vo = new UploadVO();
		
		sql = "select * from RegDateSystem where upload_no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, upload_no);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			vo.setUpload_num(rs.getInt("upload_no"));
			vo.setUpload_regdate(rs.getString("upload_regdate"));
			vo.setUpload_name(rs.getString("upload_name"));
			vo.setUplaod_class(rs.getString("upload_class"));
			vo.setUpload_tel(rs.getString("upload_tel"));
			vo.setUpload_writer(rs.getString("upload_writer"));
			vo.setUpload_comment(rs.getString("upload_comment"));
			vo.setUpload_pwd(rs.getInt("upload_pwd"));
		}
		
		rs.close(); pstmt.close(); con.close()
		
		return vo;
	}
	
	public int edit(UploadVO vo) {
		int result =0;
		
		sql = "select * from upload where upload_no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo.getUpload_no);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			if(vo.getUpload_pwd.equals(rs.getInt("upload_pwd"))) {
				sql = "update RegDateSystem "
						+ "set upload_name=?,"
						+ "upload_class=?,"
						+ "upload_tel=?,"
						+ "upload_writer=?,"
						+ "upload_comment=? "
						+ "where upload_no=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getUpload_name());
				pstmt.setString(2, vo.getUpload_class());
				pstmt.setString(3, vo.getUpload_tel());
				pstmt.setString(4, vo.getUpload_writer());
				pstmt.setString(5, vo.getUpload_comment());
				pstmt.setString(6, vo.getUpload_no());
				result = pstmt.executeUpdate();
			}else {
				result =1;
			}
			
			rs.close(); pstmt.close(); con.close();
		}
		
		return result;	
	}
	
	
	
	
	
}