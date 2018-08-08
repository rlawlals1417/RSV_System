package com.RegDate.Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UploadDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	public UploadDAO() {
		/*-----------------JNDI설정-----------------*/
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*------------------예약 하기------------------*/

	public int write(UploadVO vo) {
		int result = 0;
		int no = 0;

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				no = rs.getInt(1) + 1;

			} else {
				no = 1;
			}
			sql = "insert into RSV_System values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, vo.getUpload_regdate());
			pstmt.setString(3, vo.getUpload_name());
			pstmt.setString(4, vo.getUpload_class());
			pstmt.setString(5, vo.getUpload_tel());
			pstmt.setString(6, vo.getUpload_writer());
			pstmt.setString(7, vo.getUpload_comment());
			pstmt.setInt(8, 0);
			result = pstmt.executeUpdate();

			rs.close();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/*------------------예약 정보------------------*/

	public List<UploadVO> selectList() {
		List<UploadVO> list = new ArrayList<UploadVO>();

		try {

			sql = "select upload_no, upload_name, upload_regdate, upload_class, upload_comment from RSV_System";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UploadVO vo = new UploadVO();
				vo.setUpload_no(rs.getInt("upload_no"));
				vo.setUpload_name(rs.getString("upload_name"));
				vo.setUpload_regdate(rs.getString("upload_regdate"));
				vo.setUpload_class(rs.getString("upload_class"));
				vo.setUpload_comment(rs.getString("upload_comment"));
				list.add(vo);

			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리스트 매서드에서 SQL문 에러가 발생했습니다.");
		}
		return list;
	}

	/* 선택한 일짜에 해당하는 데이터 정보 가져오기 */
	public List<UploadVO> selectListCont() {
		List<UploadVO> listCont = new ArrayList<UploadVO>();

		try {
			sql = "select upload_name, rtime, upload_class from RSV_System";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UploadVO vo = new UploadVO();
				vo.setUpload_name(rs.getString("upload_name"));
				vo.setRtime(rs.getString("rtime"));
				vo.setUpload_class(rs.getString("upload_class"));

				listCont.add(vo);

			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("리스트컨탠츠 매서드에서 SQL문 에러가 발생했습니다.");

		}

		return listCont;
	}

	/*------------------예약 취소------------------*/

	public void cancel(int upload_no) {

		try {

			sql = "delete from RSV_System where upload_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, upload_no);
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/*------------------예약 자세히보기------------------*/

	public UploadVO uploadCont(int upload_no) {
		UploadVO vo = new UploadVO();

		try {

			sql = "select * from RSV_System where upload_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, upload_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				vo.setUpload_no(rs.getInt("upload_no"));
				vo.setUpload_regdate(rs.getString("upload_regdate"));
				vo.setUpload_name(rs.getString("upload_name"));
				vo.setUpload_class(rs.getString("upload_class"));
				vo.setUpload_tel(rs.getString("upload_tel"));
				vo.setUpload_writer(rs.getString("upload_writer"));
				vo.setUpload_comment(rs.getString("upload_comment"));
				vo.setUpload_pwd(rs.getString("upload_pwd"));
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	/*------------------예약 수정------------------*/

	public int edit(UploadVO vo) {
		int result = 0;

		try {

			sql = "select * from RSV_System where upload_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getUpload_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (vo.getUpload_pwd().equals(rs.getString("upload_pwd"))) {
					sql = "update RSV_System " + "set upload_name=?," + "upload_class=?," + "upload_tel=?,"
							+ "upload_writer=?," + "upload_comment=? " + "where upload_no=?";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getUpload_name());
					pstmt.setString(2, vo.getUpload_class());
					pstmt.setString(3, vo.getUpload_tel());
					pstmt.setString(4, vo.getUpload_writer());
					pstmt.setString(5, vo.getUpload_comment());
					pstmt.setInt(6, vo.getUpload_no());
					result = pstmt.executeUpdate();
				} else {
					result = 1;
				}

				rs.close();
				pstmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}