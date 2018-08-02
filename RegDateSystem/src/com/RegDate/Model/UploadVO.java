package com.RegDate.Model;

public class UploadVO {
	
	private int upload_no;
	private String upload_regdate;		
	private String upload_name;
	private String upload_class;
	private String upload_tel;
	private String upload_writer;
	private String upload_comment;
	private String upload_pwd;
	
	//input Calendar
	private int upload_month;
	private int upload_day;
	private int upload_start_time;
	private int upload_end_time;
	
	
	
	public int getUpload_no() {return upload_no;}
	public void setUpload_no(int upload_no) {this.upload_no = upload_no;}
	
	public String getUpload_regdate() {return upload_regdate;}
	public void setUpload_regdate(String upload_regdate) {this.upload_regdate = upload_regdate;}
	
	public String getUpload_name() {return upload_name;}
	public void setUpload_name(String upload_name) {this.upload_name = upload_name;}
	
	public String getUpload_class() {return upload_class;}
	public void setUpload_class(String upload_class) {this.upload_class = upload_class;}
	
	public String getUpload_tel() {return upload_tel;}
	public void setUpload_tel(String upload_tel) {this.upload_tel = upload_tel;}
	
	public String getUpload_writer() {return upload_writer;}
	public void setUpload_writer(String upload_writer) {this.upload_writer = upload_writer;}
	
	public String getUpload_comment() {return upload_comment;}
	public void setUpload_comment(String upload_comment) {this.upload_comment = upload_comment;}
	
	public String getUpload_pwd() {return upload_pwd;}
	public void setUpload_pwd(String upload_pwd) {this.upload_pwd = upload_pwd;}
	

	/*-----------------------------------------------------------------------------------------*/
	
	public int getUpload_month() {return upload_month;}
	public void setUpload_month(int upload_month) {this.upload_month = upload_month;}
	
	public int getUpload_day() {return upload_day;}
	public void setUpload_day(int upload_day) {this.upload_day = upload_day;}

	public int getUpload_start_time() {return upload_start_time;}
	public void setUpload_start_time(int upload_start_time) {this.upload_start_time = upload_start_time;}
	
	public int getUpload_end_time() {return upload_end_time;}
	public void setUpload_end_time(int upload_end_time) {this.upload_end_time = upload_end_time;}
	
	
	
	
	
	
}