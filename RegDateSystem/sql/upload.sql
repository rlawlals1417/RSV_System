create table RSV_System(

	upload_no number(6) primary key,			
	upload_regdate varchar2(10) not null,		
	upload_name varchar2(10) not null,			
	upload_class varchar2(10) not null,			
	upload_tel varchar2(20),					
	upload_writer varchar2(10) not null,		
	upload_comment varchar2(100),				
	upload_pwd number(4) not null,				
	rtime number(5) not null,
	ryear number(3) not null,
	rmonth number(3) not null,
	rday number(3) not null
);