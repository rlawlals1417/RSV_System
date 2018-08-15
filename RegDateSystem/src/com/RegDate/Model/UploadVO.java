package com.RegDate.Model;

public class UploadVO {
	
	private int upload_no;
	private int uniqueNo;
	private String upload_name;
	private String upload_class;
	private String upload_tel;
	private String upload_writer;
	private String upload_comment;
	private String upload_pwd;
	
	//Calendar
	private int ryear;
	private int rmonth;
	private int rday;
	private String rtime;
	private String upload_start_time;
	private String upload_end_time;
	
	
	
	public int getUpload_no() {return upload_no;}
	public void setUpload_no(int upload_no) {this.upload_no = upload_no;}
	
	public int getUniqueNo() {return uniqueNo;}
	public void setUniqueN0(int uniqueNo) {this.uniqueNo = uniqueNo;}
	
	public String getUpload_name() {return upload_name;}
	public void setUpload_name(String upload_name) {this.upload_name = upload_name;}
	
	public String getUpload_class() {return upload_class;}
	public void setUpload_class(String upload_class) {this.upload_class = upload_class;}
	
	public String getUpload_tel() {return upload_tel;}
	public void setUpload_tel(String upload_tel) {this.upload_tel = upload_tel;}
	
	public String getUpload_comment() {return upload_comment;}
	public void setUpload_comment(String upload_comment) {this.upload_comment = upload_comment;}
	
	
	public String getUpload_writer() {return upload_writer;}
	public void setUpload_writer(String upload_writer) {this.upload_writer = upload_writer;}
	
	
	public String getUpload_pwd() {return upload_pwd;}
	public void setUpload_pwd(String upload_pwd) {this.upload_pwd = upload_pwd;}
	

	/*-----------------------------------------------------------------------------------------*/
	
	public int getRyear() {return ryear;}
	public void setRyear(int ryear) {this.ryear = ryear;}
	
	public int getRmonth() {return rmonth;}
	public void setRmonth(int rmonth) {this.rmonth = rmonth;}
	
	public int getRday() {return rday;}
	public void setRday(int rday) {this.rday = rday;}

	public String getUpload_start_time() {return upload_start_time;}
	public void setUpload_start_time(String upload_start_time) {this.upload_start_time = upload_start_time;}
	
	public String getUpload_end_time() {return upload_end_time;}
	public void setUpload_end_time(String upload_end_time) {this.upload_end_time = upload_end_time;}
	
	public String getRtime(String s_time, String e_time) {
		this.upload_start_time = s_time;
		this.upload_end_time = e_time;
		rtime = s_time+"~"+e_time;
		return rtime;
		}
	
	public void setRtime(String rtime) {this.rtime = rtime;}
	
	
	
	
}