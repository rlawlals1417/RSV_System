create table RegDateSystem(

	upload_no number(6) primary key,			--등록번호
	upload_regdate varchar2(10) not null,		--예약날짜
	upload_name varchar2(10) not null,			--학생이름
	upload_class varchar2(10) not null,			--수강과목
	upload_tel varchar2(20),					--학생 전화번호
	upload_writer varchar2(10) not null,		--담당멘토
	upload_comment varchar2(100),				--추가 설명
	upload_pwd number(4) not null				--등록,취소 비밀번호

);