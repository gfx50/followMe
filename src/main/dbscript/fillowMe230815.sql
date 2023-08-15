/* trail테이블 */
DROP TABLE trail 
	CASCADE CONSTRAINTS;

/* 댓글테이블 */
DROP TABLE cmt 
	CASCADE CONSTRAINTS;

/* 멤버 테이블 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 공지사항테이블 */
DROP TABLE notice 
	CASCADE CONSTRAINTS;

/* 태그 테이블 */
DROP TABLE tag 
	CASCADE CONSTRAINTS;

/* 팔로우 상태 */
DROP TABLE follow 
	CASCADE CONSTRAINTS;

/* trail 좋아요 상태 */
DROP TABLE good 
	CASCADE CONSTRAINTS;

/* trail 북마크 상태 */
DROP TABLE book 
	CASCADE CONSTRAINTS;

/* 관리자 테이블 */
DROP TABLE adm 
	CASCADE CONSTRAINTS;

/* 메세지 테이블 */
DROP TABLE msg 
	CASCADE CONSTRAINTS;

/* 태그ID 테이블 */
DROP TABLE tagId 
	CASCADE CONSTRAINTS;

/* 연관trail */
DROP TABLE reTrail 
	CASCADE CONSTRAINTS;

/* trail테이블 */
CREATE TABLE trail (
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* trail ID */
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* trail 작성자 */
	trailDate DATE DEFAULT SYSDATE NOT NULL, /* trail작성일 */
	trailJson CLOB NOT NULL, /* trail 본문 */
	trailCount NUMBER DEFAULT 0 NOT NULL, /* 조회수 */
	trailGood NUMBER DEFAULT 0 NOT NULL, /* 좋아요 수 */
	trailRange NUMBER DEFAULT 0 NOT NULL, /* 공개범위 */
	reTrailYN VARCHAR2(1), /* 연관트레일YN */
	trailReportYN VARCHAR2(1), /* 신고처리 여부 */
	trailMeta CLOB /* trail 메타데이터 */
);

COMMENT ON TABLE trail IS 'trail테이블';

COMMENT ON COLUMN trail.trailId IS 'trail ID';

COMMENT ON COLUMN trail.mid IS 'trail 작성자';

COMMENT ON COLUMN trail.trailDate IS 'trail작성일';

COMMENT ON COLUMN trail.trailJson IS 'trail 본문';

COMMENT ON COLUMN trail.trailCount IS '조회수';

COMMENT ON COLUMN trail.trailGood IS '좋아요 수';

COMMENT ON COLUMN trail.trailRange IS '공개범위';

COMMENT ON COLUMN trail.reTrailYN IS '연관트레일YN';

COMMENT ON COLUMN trail.trailReportYN IS '신고처리 여부';

COMMENT ON COLUMN trail.trailMeta IS 'trail 메타데이터';

CREATE UNIQUE INDEX PK_trail
	ON trail (
		trailId ASC
	);

ALTER TABLE trail
	ADD
		CONSTRAINT PK_trail
		PRIMARY KEY (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 댓글테이블 */
CREATE TABLE cmt (
	cmtid raw(16) NOT NULL, /* 댓글 번호 */
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* trail ID */
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 댓글 작성자 */
	cmtContent VARCHAR2(4000) NOT NULL, /* 댓글 내용 */
	cmtType NUMBER, /* 댓글타입 */
	cmtTime DATE DEFAULT SYSDATE NOT NULL, /* 댓글 단 시간 */
	cmtReportYN VARCHAR2(1) NOT NULL /* 댓글 신고 여부 */
);

COMMENT ON TABLE cmt IS '댓글테이블';

COMMENT ON COLUMN cmt.cmtid IS '댓글 번호';

COMMENT ON COLUMN cmt.trailId IS 'trail ID';

COMMENT ON COLUMN cmt.mid IS '댓글 작성자';

COMMENT ON COLUMN cmt.cmtContent IS '댓글 내용';

COMMENT ON COLUMN cmt.cmtType IS '댓글타입';

COMMENT ON COLUMN cmt.cmtTime IS '댓글 단 시간';

COMMENT ON COLUMN cmt.cmtReportYN IS '댓글 신고 여부';

CREATE UNIQUE INDEX PK_cmt
	ON cmt (
		cmtid ASC
	);

ALTER TABLE cmt
	ADD
		CONSTRAINT PK_cmt
		PRIMARY KEY (
			cmtid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 멤버 테이블 */
CREATE TABLE member (
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 멤버 식별번호 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	socialid VARCHAR2(255), /* 소셜로그인id */
	nickName VARCHAR2(30), /* 닉네임 */
	profilePic VARCHAR2(1024), /* 프로필사진 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	mname VARCHAR2(50) NOT NULL, /* 이름 */
	birthDate DATE NOT NULL, /* 생년월일 */
	gender VARCHAR2(1) DEFAULT 'M' NOT NULL, /* 성별 */
	phone VARCHAR2(20), /* 전화번호 */
	entranceDate DATE DEFAULT SYSDATE NOT NULL, /* 가입일 */
	passModifyDate DATE NOT NULL, /* 비밀번호 수정일 */
	loginLv NUMBER DEFAULT 5 NOT NULL, /* 멤버 레벨 */
	memberMeta CLOB DEFAULT NULL /* 멤버메타데이터 */
);

COMMENT ON TABLE member IS '멤버 테이블';

COMMENT ON COLUMN member.mid IS '멤버 식별번호';

COMMENT ON COLUMN member.email IS '이메일';

COMMENT ON COLUMN member.socialid IS '소셜로그인id';

COMMENT ON COLUMN member.nickName IS '닉네임';

COMMENT ON COLUMN member.profilePic IS '프로필사진';

COMMENT ON COLUMN member.pwd IS '비밀번호';

COMMENT ON COLUMN member.mname IS '이름';

COMMENT ON COLUMN member.birthDate IS '생년월일';

COMMENT ON COLUMN member.gender IS '성별';

COMMENT ON COLUMN member.phone IS '전화번호';

COMMENT ON COLUMN member.entranceDate IS '가입일';

COMMENT ON COLUMN member.passModifyDate IS '비밀번호 수정일';

COMMENT ON COLUMN member.loginLv IS '멤버 레벨';

COMMENT ON COLUMN member.memberMeta IS '멤버메타데이터';

CREATE UNIQUE INDEX PK_member
	ON member (
		mid ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 공지사항테이블 */
CREATE TABLE notice (
	admEmail VARCHAR2(20) NOT NULL, /* 작성자 이메일 */
	noticeTitle VARCHAR2(30) NOT NULL, /* 공지사항 제목 */
	noticeContent VARCHAR2(500) NOT NULL, /* 공지사항 내용 */
	noticeDate DATE NOT NULL, /* 공지사항 날짜 */
	noticeCount NUMBER NOT NULL /* 공지사항 조회수 */
);

COMMENT ON TABLE notice IS '공지사항테이블';

COMMENT ON COLUMN notice.admEmail IS '작성자 이메일';

COMMENT ON COLUMN notice.noticeTitle IS '공지사항 제목';

COMMENT ON COLUMN notice.noticeContent IS '공지사항 내용';

COMMENT ON COLUMN notice.noticeDate IS '공지사항 날짜';

COMMENT ON COLUMN notice.noticeCount IS '공지사항 조회수';

CREATE UNIQUE INDEX PK_notice
	ON notice (
		admEmail ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			admEmail
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 태그 테이블 */
CREATE TABLE tag (
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* trail ID */
	tagId NUMBER NOT NULL, /* 태그id */
	tagName VARCHAR2(30) /* 태그네임 */
);

COMMENT ON TABLE tag IS '태그 테이블';

COMMENT ON COLUMN tag.trailId IS 'trail ID';

COMMENT ON COLUMN tag.tagId IS '태그id';

COMMENT ON COLUMN tag.tagName IS '태그네임';

CREATE UNIQUE INDEX PK_tag
	ON tag (
		trailId ASC,
		tagId ASC
	);

ALTER TABLE tag
	ADD
		CONSTRAINT PK_tag
		PRIMARY KEY (
			trailId,
			tagId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 팔로우 상태 */
CREATE TABLE follow (
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 팔로잉 */
	mid2 raw(16) DEFAULT sys_guid() NOT NULL, /* 팔로워 */
	followYN VARCHAR2(1) NOT NULL, /* 팔로우 상태 */
	followTime DATE DEFAULT SYSDATE NOT NULL /* 팔로우 한 시간 */
);

COMMENT ON TABLE follow IS '팔로우 상태';

COMMENT ON COLUMN follow.mid IS '팔로잉';

COMMENT ON COLUMN follow.mid2 IS '팔로워';

COMMENT ON COLUMN follow.followYN IS '팔로우 상태';

COMMENT ON COLUMN follow.followTime IS '팔로우 한 시간';

CREATE UNIQUE INDEX PK_follow
	ON follow (
		mid ASC,
		mid2 ASC
	);

ALTER TABLE follow
	ADD
		CONSTRAINT PK_follow
		PRIMARY KEY (
			mid,
			mid2
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* trail 좋아요 상태 */
CREATE TABLE good (
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 멤버 식별번호 */
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* 게시글번호 */
	likeYN VARCHAR2(1) NOT NULL /* 좋아요 상태 */
);

COMMENT ON TABLE good IS 'trail 좋아요 상태';

COMMENT ON COLUMN good.mid IS '멤버 식별번호';

COMMENT ON COLUMN good.trailId IS '게시글번호';

COMMENT ON COLUMN good.likeYN IS '좋아요 상태';

CREATE UNIQUE INDEX PK_good
	ON good (
		mid ASC,
		trailId ASC
	);

ALTER TABLE good
	ADD
		CONSTRAINT PK_good
		PRIMARY KEY (
			mid,
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* trail 북마크 상태 */
CREATE TABLE book (
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 멤버 식별번호 */
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* 게시글번호 */
	bookTime DATE DEFAULT SYSDATE NOT NULL, /* 북마크 한 시간 */
	bookYN VARCHAR2(1) NOT NULL /* 북마크 상태 */
);

COMMENT ON TABLE book IS 'trail 북마크 상태';

COMMENT ON COLUMN book.mid IS '멤버 식별번호';

COMMENT ON COLUMN book.trailId IS '게시글번호';

COMMENT ON COLUMN book.bookTime IS '북마크 한 시간';

COMMENT ON COLUMN book.bookYN IS '북마크 상태';

CREATE UNIQUE INDEX PK_book
	ON book (
		mid ASC,
		trailId ASC
	);

ALTER TABLE book
	ADD
		CONSTRAINT PK_book
		PRIMARY KEY (
			mid,
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 관리자 테이블 */
CREATE TABLE adm (
	admEmail VARCHAR2(20) NOT NULL, /* 관리자 이메일 */
	admPwd VARCHAR2(20) NOT NULL, /* 관리자 비밀번호 */
	admLv NUMBER NOT NULL /* 관리자 레벨 */
);

COMMENT ON TABLE adm IS '관리자 테이블';

COMMENT ON COLUMN adm.admEmail IS '관리자 이메일';

COMMENT ON COLUMN adm.admPwd IS '관리자 비밀번호';

COMMENT ON COLUMN adm.admLv IS '관리자 레벨';

CREATE UNIQUE INDEX PK_adm
	ON adm (
		admEmail ASC
	);

ALTER TABLE adm
	ADD
		CONSTRAINT PK_adm
		PRIMARY KEY (
			admEmail
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 메세지 테이블 */
CREATE TABLE msg (
	msgId NUMBER NOT NULL, /* 메세지ID */
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 작성자 */
	rcvmid raw(16) DEFAULT sys_guid() NOT NULL, /* 메세지 수신자 */
	msgContent VARCHAR2(4000) NOT NULL, /* 메세지 내용 */
	msgTime DATE NOT NULL, /* 메세지 작성시간 */
	rcvYN VARCHAR2(1) NOT NULL /* 메세지 수신확인 */
);

COMMENT ON TABLE msg IS '메세지 테이블';

COMMENT ON COLUMN msg.msgId IS '메세지ID';

COMMENT ON COLUMN msg.mid IS '작성자';

COMMENT ON COLUMN msg.rcvmid IS '메세지 수신자';

COMMENT ON COLUMN msg.msgContent IS '메세지 내용';

COMMENT ON COLUMN msg.msgTime IS '메세지 작성시간';

COMMENT ON COLUMN msg.rcvYN IS '메세지 수신확인';

CREATE UNIQUE INDEX PK_msg
	ON msg (
		msgId ASC
	);

ALTER TABLE msg
	ADD
		CONSTRAINT PK_msg
		PRIMARY KEY (
			msgId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 태그ID 테이블 */
CREATE TABLE tagId (
	tagId NUMBER NOT NULL, /* 태그id */
	tagName VARCHAR2(30) NOT NULL, /* 태그네임 */
	tagDate DATE NOT NULL, /* 태그생성시간 */
	tagMeta CLOB /* tag메타 */
);

COMMENT ON TABLE tagId IS '태그ID 테이블';

COMMENT ON COLUMN tagId.tagId IS '태그id';

COMMENT ON COLUMN tagId.tagName IS '태그네임';

COMMENT ON COLUMN tagId.tagDate IS '태그생성시간';

COMMENT ON COLUMN tagId.tagMeta IS 'tag메타';

CREATE UNIQUE INDEX PK_tagId
	ON tagId (
		tagId ASC
	);

ALTER TABLE tagId
	ADD
		CONSTRAINT PK_tagId
		PRIMARY KEY (
			tagId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

/* 연관trail */
CREATE TABLE reTrail (
	reTrailNo raw(16) DEFAULT sys_guid() NOT NULL, /* 연관trail 번호 */
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* 본trail 번호 */
	reTrailDate DATE DEFAULT SYSDATE NOT NULL /* 관계 생성시간 */
);

COMMENT ON TABLE reTrail IS '연관trail';

COMMENT ON COLUMN reTrail.reTrailNo IS '연관trail 번호';

COMMENT ON COLUMN reTrail.trailId IS '본trail 번호';

COMMENT ON COLUMN reTrail.reTrailDate IS '관계 생성시간';

ALTER TABLE trail
	ADD
		CONSTRAINT FK_member_TO_trail
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE cmt
	ADD
		CONSTRAINT FK_trail_TO_cmt
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE cmt
	ADD
		CONSTRAINT FK_member_TO_cmt
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE notice
	ADD
		CONSTRAINT FK_adm_TO_notice
		FOREIGN KEY (
			admEmail
		)
		REFERENCES adm (
			admEmail
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE tag
	ADD
		CONSTRAINT FK_trail_TO_tag
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE tag
	ADD
		CONSTRAINT FK_tagId_TO_tag
		FOREIGN KEY (
			tagId
		)
		REFERENCES tagId (
			tagId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE follow
	ADD
		CONSTRAINT FK_member_TO_follow
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE follow
	ADD
		CONSTRAINT FK_member_TO_follow2
		FOREIGN KEY (
			mid2
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE good
	ADD
		CONSTRAINT FK_member_TO_good
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE good
	ADD
		CONSTRAINT FK_trail_TO_good
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE book
	ADD
		CONSTRAINT FK_member_TO_book
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE book
	ADD
		CONSTRAINT FK_trail_TO_book
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE msg
	ADD
		CONSTRAINT FK_member_TO_msg
		FOREIGN KEY (
			rcvmid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE msg
	ADD
		CONSTRAINT FK_member_TO_msg2
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE reTrail
	ADD
		CONSTRAINT FK_trail_TO_reTrail
		FOREIGN KEY (
			reTrailNo
		)
		REFERENCES trail (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

ALTER TABLE reTrail
	ADD
		CONSTRAINT FK_trail_TO_reTrail2
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		)
		NOT DEFERRABLE
		ENABLE
		VALIDATE;

set define off;

insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'msmardon0@cnbc.com', null, 'msmardon0', 'https://robohash.org/sitquaedolore.jpg?size=50x50&set=set1', 'Solarbreeze', 'Modestine Smardon', '1932/11/23', 'F', null, '2023/09/01', '2023/06/07', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'lfawlo1@illinois.edu', 'so-net.ne.jp', 'lfawlo1', 'https://robohash.org/quaeexdeserunt.jpg?size=50x50&set=set1', 'Prodder', 'Luther Fawlo', '1914/02/18', 'F', null, '2023/08/13', '2023/12/18', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'dbirtwell2@xrea.com', 'ftc.gov', 'dbirtwell2', null, 'Veribet', 'Donn Birtwell', '1912/03/26', 'M', '850-374-7463', '2023/08/29', '2023/12/24', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'vhillan3@dropbox.com', 'uol.com.br', 'vhillan3', null, 'Quo Lux', 'Vita Hillan', '1937/02/08', 'M', null, '2023/01/23', '2023/12/08', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'jszymonwicz4@oracle.com', null, 'jszymonwicz4', 'https://robohash.org/corruptiveniamquas.jpg?size=50x50&set=set1', 'Fintone', 'Jania Szymonwicz', '2021/02/04', 'M', '691-628-0016', '2023/02/28', '2023/05/30', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'nlarrington5@posterous.com', 'dailymotion.com', 'nlarrington5', 'https://robohash.org/adexcepturieveniet.jpg?size=50x50&set=set1', 'Namfix', 'Nada Larrington', '1949/10/16', 'F', '296-220-9602', '2023/01/27', '2023/08/25', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cdickin6@webnode.com', null, 'cdickin6', 'https://robohash.org/etodiosit.jpg?size=50x50&set=set1', 'Konklab', 'Chase Dickin', '1997/08/16', 'M', '562-289-2014', '2023/12/30', '2023/02/14', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'sjacmar7@mit.edu', null, 'sjacmar7', null, 'Cookley', 'Sharleen Jacmar', '1904/09/16', 'F', null, '2023/02/19', '2023/10/30', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'vmacvay8@yahoo.co.jp', null, 'vmacvay8', null, 'Tresom', 'Virgie MacVay', '1990/09/03', 'F', '273-887-8850', '2023/11/22', '2023/08/21', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'omatushevich9@bizjournals.com', null, 'omatushevich9', null, 'Stim', 'Opal Matushevich', '2011/10/21', 'F', '785-247-6880', '2023/12/20', '2023/08/09', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'pchithama@photobucket.com', 'twitpic.com', 'pchithama', 'https://robohash.org/fugitinvelit.jpg?size=50x50&set=set1', 'Cardguard', 'Poul Chitham', '1989/05/26', 'M', '227-309-7102', '2023/05/28', '2023/06/18', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cbolsoverb@furl.net', 'usatoday.com', 'cbolsoverb', null, 'Trippledex', 'Carri Bolsover', '2002/03/11', 'F', '214-337-0163', '2023/11/02', '2023/06/17', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ljeyesc@rediff.com', null, 'ljeyesc', null, 'Zathin', 'Laurice Jeyes', '1955/04/07', 'F', null, '2023/10/16', '2023/06/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'bnoird@xinhuanet.com', null, 'bnoird', null, 'Transcof', 'Barbara Noir', '2005/05/10', 'F', '555-924-4608', '2023/03/21', '2023/07/07', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'hgringleye@stumbleupon.com', null, 'hgringleye', 'https://robohash.org/doloresipsaexpedita.jpg?size=50x50&set=set1', 'Overhold', 'Hermon Gringley', '1936/07/11', 'F', '861-984-4056', '2023/03/12', '2023/05/12', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'gkarlowiczf@github.io', 'unblog.fr', null, null, 'Duobam', 'Garnet Karlowicz', '2007/12/14', 'F', null, '2023/09/13', '2023/06/25', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'tswateridgeg@gnu.org', null, 'tswateridgeg', null, 'Matsoft', 'Trudey Swateridge', '1992/09/10', 'F', '897-932-1024', '2023/05/14', '2023/06/08', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'afrankenh@ox.ac.uk', null, 'afrankenh', 'https://robohash.org/errorilloratione.jpg?size=50x50&set=set1', 'Viva', 'Alfreda Franken', '1978/03/25', 'F', '734-628-3518', '2023/04/30', '2023/01/11', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'gcayeti@independent.co.uk', null, 'gcayeti', null, 'Temp', 'Garold Cayet', '1961/04/20', 'M', '335-614-4743', '2023/02/22', '2023/05/02', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'kropkinsj@oakley.com', null, 'kropkinsj', null, 'Daltfresh', 'Kelcie Ropkins', '1953/12/17', 'F', '964-542-0452', '2023/06/27', '2023/08/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'hbickerdykek@goo.ne.jp', null, 'hbickerdykek', null, 'Namfix', 'Hynda Bickerdyke', '1936/01/26', 'M', null, '2023/07/06', '2023/06/16', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'hbrissardl@webnode.com', null, null, null, 'Greenlam', 'Hildegaard Brissard', '1969/10/26', 'F', '895-332-1796', '2023/04/26', '2023/09/22', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'aalbrookm@typepad.com', null, 'aalbrookm', 'https://robohash.org/molestiaeoditenim.jpg?size=50x50&set=set1', 'Subin', 'Alfreda Albrook', '1967/09/07', 'F', null, '2023/09/03', '2023/09/11', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cteuliern@cocolog-nifty.com', 'examiner.com', 'cteuliern', null, 'Vagram', 'Cissy Teulier', '1940/11/21', 'F', '830-869-5261', '2023/05/12', '2023/10/23', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ecuckooo@unesco.org', null, 'ecuckooo', null, 'Solarbreeze', 'Ezechiel Cuckoo', '1913/01/28', 'F', '113-321-5233', '2023/08/05', '2023/08/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'agyrgorcewicxp@aol.com', null, 'agyrgorcewicxp', 'https://robohash.org/temporavoluptasvoluptas.jpg?size=50x50&set=set1', 'Solarbreeze', 'Ammamaria Gyrgorcewicx', '1928/03/09', 'M', '360-107-3430', '2023/12/02', '2023/07/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'bnottiq@google.es', 'wufoo.com', 'bnottiq', null, 'Subin', 'Berti Notti', '1952/11/12', 'F', null, '2023/12/23', '2023/01/29', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ipeckhamr@163.com', null, 'ipeckhamr', 'https://robohash.org/facereeiusperferendis.jpg?size=50x50&set=set1', 'Solarbreeze', 'Ingelbert Peckham', '1997/08/18', 'F', '297-482-0362', '2023/11/19', '2023/04/24', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'rdeals@senate.gov', null, 'rdeals', 'https://robohash.org/similiqueestneque.jpg?size=50x50&set=set1', 'Viva', 'Roberto Deal', '1910/02/22', 'M', '138-879-0484', '2023/11/23', '2023/08/12', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'jbarrast@baidu.com', 'yolasite.com', null, 'https://robohash.org/magnamquisquamsit.jpg?size=50x50&set=set1', 'Zoolab', 'Jandy Barras', '1946/12/21', 'F', '457-781-8113', '2023/04/21', '2023/07/05', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'vbartolommeou@google.it', 'dot.gov', 'vbartolommeou', null, 'Cardify', 'Velvet Bartolommeo', '1975/01/31', 'M', null, '2023/11/02', '2023/07/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'deverettv@tiny.cc', null, 'deverettv', 'https://robohash.org/nisivoluptatemvoluptates.jpg?size=50x50&set=set1', 'Andalax', 'Dicky Everett', '1919/11/21', 'F', null, '2023/03/24', '2023/10/21', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'mcramondw@trellian.com', 'noaa.gov', 'mcramondw', 'https://robohash.org/suntpraesentiumdolore.jpg?size=50x50&set=set1', 'It', 'Michal Cramond', '1990/07/16', 'M', '117-480-7125', '2023/03/29', '2023/10/04', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'jbrooksbiex@nasa.gov', null, 'jbrooksbiex', 'https://robohash.org/laudantiumesseipsum.jpg?size=50x50&set=set1', 'Redhold', 'Justinn Brooksbie', '1907/04/11', 'M', '635-364-4951', '2023/01/26', '2023/02/20', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'vannotty@sogou.com', 'smugmug.com', 'vannotty', null, 'Alpha', 'Vanya Annott', '1999/09/28', 'F', '991-537-1583', '2023/07/19', '2023/07/17', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'fitzaksonz@businessinsider.com', 'wisc.edu', 'fitzaksonz', 'https://robohash.org/doloribusnihileum.jpg?size=50x50&set=set1', 'Tempsoft', 'Feliks Itzakson', '1916/06/13', 'F', '883-485-3366', '2023/10/09', '2023/09/09', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'feckhard10@shinystat.com', null, 'feckhard10', null, 'Home Ing', 'Franciskus Eckhard', '2016/08/02', 'M', '787-346-3968', '2023/04/20', '2023/11/27', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'mbunstone11@ezinearticles.com', 'jigsy.com', 'mbunstone11', null, 'Bytecard', 'Matilda Bunstone', '1913/09/11', 'M', '213-699-8856', '2023/12/13', '2023/05/10', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'hpawlata12@netvibes.com', null, 'hpawlata12', 'https://robohash.org/cumquererumrepudiandae.jpg?size=50x50&set=set1', 'Toughjoyfax', 'Humfried Pawlata', '1925/09/26', 'M', '238-300-1125', '2023/12/07', '2023/12/20', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'mgiovannardi13@msn.com', null, 'mgiovannardi13', null, 'Veribet', 'Maison Giovannardi', '1996/02/06', 'M', '232-469-3305', '2023/04/04', '2023/01/09', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'jbrierton14@vinaora.com', null, 'jbrierton14', null, 'Zontrax', 'Jolynn Brierton', '1955/06/24', 'M', '219-240-0703', '2023/03/06', '2023/02/11', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ekingston15@paginegialle.it', 'state.gov', 'ekingston15', null, 'Viva', 'Elston Kingston', '1948/05/08', 'F', null, '2023/06/01', '2023/11/02', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'jbakhrushin16@dailymail.co.uk', 'sakura.ne.jp', null, 'https://robohash.org/assumendanesciuntet.jpg?size=50x50&set=set1', 'Zoolab', 'Jeffy Bakhrushin', '1948/02/22', 'F', '205-900-5870', '2023/10/27', '2023/09/08', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'rcleverley17@hhs.gov', null, 'rcleverley17', 'https://robohash.org/inminimaqui.jpg?size=50x50&set=set1', 'Treeflex', 'Rad Cleverley', '1921/08/11', 'M', '625-951-1300', '2023/12/18', '2023/07/23', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'pmillmore18@dailymail.co.uk', null, 'pmillmore18', null, 'Domainer', 'Petey Millmore', '1966/12/31', 'F', '316-725-6106', '2023/05/02', '2023/06/01', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'scoursor19@mashable.com', 'cbsnews.com', 'scoursor19', 'https://robohash.org/repellatquiunde.jpg?size=50x50&set=set1', 'Quo Lux', 'Syman Coursor', '1911/04/03', 'M', '953-368-0995', '2023/10/01', '2023/11/08', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'aklesel1a@ft.com', null, null, 'https://robohash.org/quamquiset.jpg?size=50x50&set=set1', 'Zoolab', 'Aubrey Klesel', '2020/12/01', 'F', '414-498-3676', '2023/12/05', '2023/11/14', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'fjendrassik1b@abc.net.au', null, 'fjendrassik1b', null, 'Bytecard', 'Feliza Jendrassik', '1971/07/03', 'M', null, '2023/02/15', '2023/08/07', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'rstutely1c@amazon.com', 'princeton.edu', 'rstutely1c', 'https://robohash.org/doloribusconsequunturreiciendis.jpg?size=50x50&set=set1', 'Zontrax', 'Ricki Stutely', '1985/07/06', 'F', '778-507-7981', '2023/11/11', '2023/02/16', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'tlailey1d@admin.ch', 'berkeley.edu', 'tlailey1d', 'https://robohash.org/autemeoslaboriosam.jpg?size=50x50&set=set1', 'Holdlamis', 'Tybi Lailey', '1989/04/25', 'M', '648-377-2639', '2023/08/29', '2023/03/31', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'csimic1e@soup.io', null, 'csimic1e', 'https://robohash.org/doloresnihilid.jpg?size=50x50&set=set1', 'Quo Lux', 'Calla Simic', '1915/05/24', 'F', null, '2023/03/23', '2023/08/26', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'tliepina1f@yellowpages.com', 'nih.gov', 'tliepina1f', 'https://robohash.org/distinctionobisperspiciatis.jpg?size=50x50&set=set1', 'Cardguard', 'Thorvald Liepina', '1937/07/24', 'M', '213-982-3702', '2023/03/05', '2023/06/06', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ewater1g@time.com', null, 'ewater1g', null, 'Tresom', 'Ernestus Water', '2000/10/30', 'F', '823-502-2253', '2023/10/24', '2023/11/07', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'mbottomley1h@t-online.de', null, 'mbottomley1h', 'https://robohash.org/deseruntlaborumdolorem.jpg?size=50x50&set=set1', 'Sonsing', 'Marietta Bottomley', '1903/11/12', 'F', '286-401-3284', '2023/03/11', '2023/07/09', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'dpirson1i@weebly.com', null, 'dpirson1i', null, 'Job', 'Dare Pirson', '1903/09/15', 'F', '100-420-3475', '2023/10/09', '2023/10/30', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'fquirke1j@webs.com', null, 'fquirke1j', 'https://robohash.org/cupiditaterepudiandaepossimus.jpg?size=50x50&set=set1', 'Greenlam', 'Freemon Quirke', '1974/08/16', 'F', '537-106-9146', '2023/12/05', '2023/08/30', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'kedginton1k@oaic.gov.au', 'miibeian.gov.cn', 'kedginton1k', 'https://robohash.org/praesentiumquasienim.jpg?size=50x50&set=set1', 'Cookley', 'Kari Edginton', '1958/01/10', 'F', null, '2023/12/18', '2023/08/18', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'nhendricks1l@npr.org', 'list-manage.com', 'nhendricks1l', null, 'Home Ing', 'Nady Hendricks', '2016/08/25', 'F', '120-143-6817', '2023/04/18', '2023/06/26', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'omccalum1m@noaa.gov', null, 'omccalum1m', null, 'Flowdesk', 'Oriana McCalum', '1935/02/01', 'M', '471-621-8461', '2023/04/27', '2023/01/19', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'rwitheford1n@eepurl.com', null, 'rwitheford1n', null, 'Domainer', 'Ralph Witheford', '2000/07/28', 'M', '438-810-4657', '2023/01/10', '2023/04/29', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'stoderi1o@miitbeian.gov.cn', null, 'stoderi1o', null, 'Fintone', 'Silvano Toderi', '1907/07/14', 'F', '699-171-4625', '2023/10/07', '2023/05/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'pguerin1p@yellowbook.com', null, 'pguerin1p', null, 'Job', 'Philis Guerin', '1986/06/16', 'M', '501-678-7919', '2023/07/03', '2023/09/27', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ode1q@cdc.gov', null, 'ode1q', 'https://robohash.org/verodelectusvelit.jpg?size=50x50&set=set1', 'Zoolab', 'Odelle De Benedictis', '1904/03/30', 'F', '279-747-0781', '2023/03/28', '2023/09/13', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'abarrack1r@loc.gov', null, null, null, 'It', 'Aron Barrack', '1935/05/23', 'F', '114-959-3403', '2023/01/30', '2023/06/04', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'bhatherley1s@mit.edu', 'chicagotribune.com', 'bhatherley1s', 'https://robohash.org/nesciuntatperferendis.jpg?size=50x50&set=set1', 'Holdlamis', 'Bartholomeo Hatherley', '1994/10/06', 'F', '132-731-5812', '2023/09/13', '2023/02/14', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'lismay1t@de.vu', null, 'lismay1t', 'https://robohash.org/inventoretemporaest.jpg?size=50x50&set=set1', 'Konklab', 'Lanny Ismay', '2005/10/02', 'F', '100-884-5505', '2023/11/01', '2023/03/29', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'afeitosa1u@hhs.gov', 'joomla.org', null, null, 'Zontrax', 'Alverta Feitosa', '1971/02/09', 'F', '762-799-1702', '2023/05/11', '2023/08/23', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'elethby1v@studiopress.com', null, 'elethby1v', null, 'Transcof', 'Eleni Lethby', '2012/03/06', 'M', '984-247-5875', '2023/04/02', '2023/06/06', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'gglaze1w@chronoengine.com', null, null, 'https://robohash.org/facereutnam.jpg?size=50x50&set=set1', 'Bytecard', 'Geoffry Glaze', '1938/05/29', 'F', null, '2023/02/27', '2023/10/10', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'uizhakov1x@bbb.org', 'baidu.com', 'uizhakov1x', null, 'Lotstring', 'Udall Izhakov', '1953/09/14', 'F', '647-112-8053', '2023/01/30', '2023/08/05', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ltruwert1y@ifeng.com', 'bizjournals.com', 'ltruwert1y', null, 'Redhold', 'Lorette Truwert', '1905/08/06', 'F', '334-330-3625', '2023/10/06', '2023/09/08', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'laccum1z@wikia.com', null, 'laccum1z', 'https://robohash.org/consequaturinquia.jpg?size=50x50&set=set1', 'Zamit', 'Lowe Accum', '1926/04/14', 'M', '632-867-3278', '2023/04/17', '2023/01/07', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'htreamayne20@dropbox.com', 'stumbleupon.com', 'htreamayne20', 'https://robohash.org/inventorecumdicta.jpg?size=50x50&set=set1', 'Tampflex', 'Hinda Treamayne', '1936/05/25', 'M', '336-980-2873', '2023/10/05', '2023/10/29', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'grubica21@ehow.com', null, 'grubica21', 'https://robohash.org/molestiaslaudantiumaut.jpg?size=50x50&set=set1', 'Quo Lux', 'Galvin Rubica', '2019/03/09', 'F', '930-861-4681', '2023/11/29', '2023/06/09', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cclemes22@blog.com', 'mac.com', null, null, 'Otcom', 'Chase Clemes', '1967/12/01', 'M', '942-160-9223', '2023/10/02', '2023/12/30', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'whilland23@mail.ru', 'comsenz.com', 'whilland23', 'https://robohash.org/natusprovidentdolores.jpg?size=50x50&set=set1', 'Bytecard', 'Wenona Hilland', '1972/11/12', 'M', '419-477-2034', '2023/03/09', '2023/10/28', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'mpendry24@oaic.gov.au', null, 'mpendry24', null, 'Zontrax', 'Marian Pendry', '1974/06/21', 'F', '406-723-7951', '2023/02/07', '2023/03/29', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'bhebard25@goo.ne.jp', null, null, null, 'Ronstring', 'Brnaba Hebard', '1978/10/04', 'F', '998-216-9018', '2023/09/08', '2023/03/27', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'rstollsteimer26@webeden.co.uk', 'disqus.com', 'rstollsteimer26', 'https://robohash.org/autemnatusut.jpg?size=50x50&set=set1', 'Domainer', 'Rowena Stollsteimer', '1936/02/15', 'F', '809-435-8256', '2023/08/06', '2023/02/05', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'fsteckings27@fc2.com', 'usatoday.com', 'fsteckings27', 'https://robohash.org/pariaturquiain.jpg?size=50x50&set=set1', 'Ventosanzap', 'Frannie Steckings', '1969/02/04', 'F', null, '2023/08/29', '2023/12/26', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ascotchmoor28@stumbleupon.com', 'newyorker.com', 'ascotchmoor28', null, 'Redhold', 'Antonie Scotchmoor', '1964/09/09', 'F', null, '2023/01/09', '2023/01/30', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'dfannon29@time.com', 'google.ca', 'dfannon29', null, 'Trippledex', 'Dawna Fannon', '1961/06/23', 'M', '777-560-0577', '2023/01/14', '2023/07/01', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'lfaichnie2a@goo.ne.jp', 'salon.com', 'lfaichnie2a', null, 'Pannier', 'Langsdon Faichnie', '1912/06/14', 'M', null, '2023/02/25', '2023/11/06', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'lshieber2b@home.pl', null, 'lshieber2b', 'https://robohash.org/facilisconsequaturdebitis.jpg?size=50x50&set=set1', 'Alpha', 'Leora Shieber', '1951/08/11', 'F', '230-879-9368', '2023/03/18', '2023/07/12', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cadao2c@seattletimes.com', 'taobao.com', 'cadao2c', 'https://robohash.org/quisquaminsequi.jpg?size=50x50&set=set1', 'Biodex', 'Cristionna Adao', '2008/12/08', 'M', '318-853-3160', '2023/11/09', '2023/08/03', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'szelley2d@deliciousdays.com', null, 'szelley2d', 'https://robohash.org/minusfacilisblanditiis.jpg?size=50x50&set=set1', 'Subin', 'Sammy Zelley', '1986/05/19', 'M', '591-437-9963', '2023/09/26', '2023/05/21', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'fginni2e@multiply.com', null, 'fginni2e', 'https://robohash.org/explicaboadenim.jpg?size=50x50&set=set1', 'Prodder', 'Forrest Ginni', '1975/07/31', 'F', null, '2023/05/02', '2023/12/26', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cfeaviour2f@cnbc.com', 'ezinearticles.com', 'cfeaviour2f', null, 'Tempsoft', 'Catherin Feaviour', '1920/12/15', 'F', '367-116-4879', '2023/01/02', '2023/01/10', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'lyearron2g@vinaora.com', 'sogou.com', null, null, 'Viva', 'Lara Yearron', '1990/12/14', 'M', '839-579-3466', '2023/12/03', '2023/09/26', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cbirwhistle2h@yahoo.co.jp', null, 'cbirwhistle2h', null, 'Tresom', 'Claresta Birwhistle', '1982/05/08', 'F', '624-400-1066', '2023/06/01', '2023/11/11', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'bcicculini2i@webeden.co.uk', 'yellowpages.com', 'bcicculini2i', null, 'Asoka', 'Bradan Cicculini', '1960/05/24', 'F', null, '2023/10/24', '2023/07/02', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'ejauncey2j@issuu.com', null, 'ejauncey2j', 'https://robohash.org/remetet.jpg?size=50x50&set=set1', 'Fintone', 'Ezri Jauncey', '2011/07/27', 'M', '584-901-3241', '2023/02/15', '2023/10/10', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'avalenta2k@unblog.fr', 't-online.de', 'avalenta2k', 'https://robohash.org/rationeetrerum.jpg?size=50x50&set=set1', 'Bitwolf', 'Aurelie Valenta', '2016/10/09', 'F', '728-784-2955', '2023/11/13', '2023/12/06', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'jvannucci2l@ft.com', 'wiley.com', 'jvannucci2l', null, 'Solarbreeze', 'Jermain Vannucci', '1904/11/12', 'F', '477-738-6836', '2023/07/14', '2023/04/10', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'hjostan2m@ed.gov', 'boston.com', null, 'https://robohash.org/veritatisvoluptatemsit.jpg?size=50x50&set=set1', 'Cardguard', 'Haley Jostan', '1938/12/20', 'M', null, '2023/09/15', '2023/12/17', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'iohm2n@google.cn', 'dion.ne.jp', 'iohm2n', null, 'Konklux', 'Ingeborg Ohm', '1987/01/12', 'F', '485-130-1439', '2023/01/21', '2023/03/28', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'gscoates2o@biglobe.ne.jp', 'bandcamp.com', 'gscoates2o', null, 'Tempsoft', 'Gregorius Scoates', '2011/09/06', 'F', null, '2023/08/22', '2023/07/18', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'fshiril2p@wordpress.org', 'hexun.com', 'fshiril2p', null, 'Alpha', 'Forester Shiril', '1939/12/19', 'F', null, '2023/02/16', '2023/02/11', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'cweins2q@google.co.jp', 'biglobe.ne.jp', 'cweins2q', null, 'Tampflex', 'Caty Weins', '2021/10/24', 'M', null, '2023/02/13', '2023/12/28', 5, null);
insert into member (MID, EMAIL, SOCIALID, NICKNAME, PROFILEPIC, PWD, MNAME, BIRTHDATE, GENDER, PHONE, ENTRANCEDATE, PASSMODIFYDATE, LOGINLV, MEMBERMETA) values (sys_guid(), 'bbarriball2r@github.io', null, 'bbarriball2r', 'https://robohash.org/autcupiditateconsequuntur.jpg?size=50x50&set=set1', 'Opela', 'Bronson Barriball', '1935/07/25', 'F', null, '2023/07/11', '2023/07/14', 5, null);





insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/14', '[{},{},{}]', 452, 578, 280, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/24', '[{}]', 911, 5, 42, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/23', '[{},{},{},{},{}]', 307, 45, 620, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/12', '[{},{},{},{}]', 443, 971, 942, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/04', '[{},{}]', 669, 539, 261, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/22', '[{},{},{},{},{}]', 134, 453, 710, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/12', '[{},{},{}]', 709, 999, 123, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[]', 954, 727, 507, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/25', '[{}]', 699, 545, 419, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[{},{}]', 755, 965, 29, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/10', '[{},{},{}]', 762, 13, 91, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/26', '[]', 47, 784, 252, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/04', '[{},{},{},{},{}]', 111, 581, 655, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/03', '[{},{},{},{}]', 196, 399, 803, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/08', '[]', 286, 114, 967, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/16', '[{},{},{}]', 474, 467, 471, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/12', '[{}]', 256, 338, 883, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/03', '[{},{}]', 842, 721, 685, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/01', '[{},{},{},{},{}]', 742, 161, 763, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/18', '[]', 268, 308, 191, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/13', '[{},{}]', 559, 334, 882, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/26', '[{},{},{},{}]', 593, 942, 744, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/19', '[{},{},{}]', 435, 874, 409, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/24', '[{},{},{},{},{}]', 578, 14, 450, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/15', '[]', 400, 215, 817, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/02', '[]', 139, 624, 283, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/12', '[]', 938, 300, 610, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/05', '[{},{},{},{},{}]', 773, 650, 812, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/17', '[{},{}]', 35, 418, 223, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/24', '[{},{},{}]', 95, 966, 766, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/21', '[]', 773, 177, 827, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/11', '[{},{},{},{}]', 901, 976, 806, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/07', '[{},{},{}]', 704, 3, 987, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/13', '[{},{},{}]', 472, 593, 348, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/18', '[{}]', 1, 981, 761, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/26', '[{},{},{}]', 502, 327, 872, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/05', '[{},{},{},{}]', 803, 977, 447, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/12', '[{},{},{},{},{}]', 728, 1, 985, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/28', '[{},{}]', 654, 364, 969, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/17', '[{},{}]', 627, 835, 442, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/15', '[{},{},{},{},{}]', 113, 200, 37, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/07', '[{},{},{}]', 623, 919, 419, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/20', '[{},{},{},{},{}]', 617, 6, 6, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/30', '[{}]', 416, 642, 166, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/29', '[]', 124, 319, 199, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/17', '[{},{}]', 510, 294, 122, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/21', '[{},{},{},{}]', 849, 546, 905, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/29', '[{},{},{},{}]', 47, 944, 540, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{},{},{}]', 768, 26, 423, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/16', '[{}]', 807, 841, 806, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/18', '[{},{}]', 433, 575, 69, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/30', '[{},{},{},{}]', 176, 819, 93, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/16', '[{},{},{}]', 896, 137, 917, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/25', '[{},{},{},{},{}]', 347, 949, 109, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/11', '[]', 947, 827, 219, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/23', '[]', 160, 463, 134, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{}]', 599, 200, 177, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/29', '[{},{},{},{}]', 271, 356, 339, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/31', '[]', 749, 707, 579, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[{},{}]', 40, 300, 811, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/09', '[]', 581, 999, 362, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/01', '[]', 192, 771, 360, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/14', '[{},{},{}]', 804, 869, 183, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/07', '[]', 141, 230, 925, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/23', '[{},{}]', 730, 818, 323, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/20', '[{}]', 432, 35, 238, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/26', '[{},{}]', 949, 305, 666, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/23', '[{},{}]', 399, 681, 891, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/24', '[]', 723, 890, 374, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/28', '[]', 811, 687, 55, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[{},{},{},{},{}]', 622, 688, 765, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/01', '[{},{},{},{},{}]', 802, 384, 775, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/06', '[{},{},{},{},{}]', 871, 303, 278, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[{},{},{},{}]', 527, 162, 524, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/23', '[{},{},{},{},{}]', 268, 842, 374, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/18', '[{}]', 353, 629, 707, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/17', '[{},{},{},{},{}]', 409, 504, 150, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/06', '[{},{},{}]', 33, 183, 690, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/11', '[{},{},{}]', 277, 343, 202, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/05', '[{},{}]', 25, 938, 510, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/13', '[{}]', 629, 447, 870, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/25', '[{},{}]', 718, 814, 227, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/28', '[{},{},{},{},{}]', 1000, 240, 334, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/06', '[{},{},{},{}]', 965, 546, 72, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/18', '[{},{},{},{},{}]', 391, 321, 988, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/04', '[{},{}]', 338, 441, 957, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/15', '[{},{},{},{},{}]', 697, 521, 561, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/21', '[{},{},{},{},{}]', 660, 150, 269, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/22', '[{}]', 205, 961, 625, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/21', '[{},{},{},{},{}]', 523, 75, 47, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/01', '[]', 750, 438, 53, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/30', '[{},{},{},{},{}]', 122, 71, 760, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/15', '[]', 658, 331, 500, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/25', '[{},{},{}]', 594, 244, 730, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/14', '[{},{}]', 254, 921, 278, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/03', '[{},{},{},{},{}]', 678, 503, 530, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[{}]', 457, 260, 699, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/04', '[]', 487, 819, 349, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/23', '[{},{},{},{}]', 473, 838, 625, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/03', '[{}]', 401, 447, 621, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/07', '[{},{},{},{},{}]', 318, 509, 159, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/10', '[{},{},{},{}]', 637, 212, 287, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/15', '[{},{},{}]', 762, 436, 125, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/24', '[{},{},{},{}]', 480, 226, 399, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/15', '[]', 907, 775, 62, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/15', '[]', 940, 318, 695, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[{},{},{},{},{}]', 471, 562, 505, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/08', '[{},{},{},{}]', 607, 549, 779, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/21', '[{},{},{}]', 246, 133, 838, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/30', '[]', 123, 582, 714, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/26', '[{}]', 421, 302, 448, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/26', '[]', 575, 902, 650, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/10', '[{},{},{}]', 86, 238, 2, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/29', '[{},{}]', 640, 811, 461, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/14', '[{},{},{}]', 907, 853, 24, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/08', '[{},{},{},{}]', 589, 987, 589, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/01', '[{},{}]', 360, 817, 622, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/02', '[{},{}]', 846, 396, 980, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/09', '[{},{}]', 828, 909, 364, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/07', '[{}]', 542, 500, 568, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/19', '[{},{},{},{},{}]', 3, 682, 915, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/25', '[{},{},{},{}]', 889, 972, 779, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/30', '[{},{},{},{},{}]', 68, 210, 902, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/12', '[{},{},{},{}]', 601, 671, 579, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/07', '[{}]', 966, 859, 101, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/20', '[{}]', 15, 734, 150, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/04', '[{},{},{},{}]', 160, 95, 756, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/01', '[{},{},{}]', 842, 48, 308, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/18', '[{}]', 369, 907, 351, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/15', '[{}]', 0, 712, 313, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/25', '[]', 763, 887, 539, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/07', '[{}]', 500, 72, 907, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/29', '[{},{}]', 452, 925, 892, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/30', '[{},{},{},{},{}]', 681, 165, 296, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/23', '[{},{},{},{},{}]', 386, 277, 794, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/30', '[{},{},{},{}]', 160, 973, 135, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/05', '[{},{},{},{}]', 926, 41, 970, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/05', '[]', 670, 766, 794, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/18', '[]', 614, 808, 400, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/19', '[{},{},{},{},{}]', 210, 818, 227, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/20', '[]', 148, 631, 315, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/17', '[{},{},{},{},{}]', 541, 430, 625, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/07', '[{},{},{}]', 772, 362, 461, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/05', '[{}]', 417, 223, 227, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/17', '[{}]', 855, 742, 179, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/20', '[{},{},{},{},{}]', 256, 569, 745, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/03', '[{},{},{},{},{}]', 660, 776, 823, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/28', '[{},{},{},{}]', 669, 150, 647, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/11', '[{}]', 449, 108, 734, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/05', '[{}]', 967, 624, 400, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/22', '[]', 536, 150, 932, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/21', '[]', 269, 381, 553, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/13', '[]', 147, 494, 146, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[{},{}]', 317, 21, 290, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/24', '[{},{},{},{}]', 189, 51, 499, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/14', '[{},{},{},{},{}]', 244, 643, 497, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/13', '[{},{},{}]', 865, 957, 759, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/13', '[]', 769, 914, 941, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/25', '[{},{}]', 561, 256, 637, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/26', '[{},{},{},{}]', 953, 779, 361, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/01', '[{},{},{},{},{}]', 842, 423, 511, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/31', '[{},{},{}]', 666, 67, 268, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/06', '[{},{},{},{},{}]', 266, 770, 90, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/05', '[{},{},{},{},{}]', 646, 575, 515, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{},{},{}]', 778, 115, 597, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/13', '[{}]', 36, 505, 787, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/23', '[{}]', 135, 457, 707, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/15', '[{},{},{}]', 265, 144, 358, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/20', '[{},{},{}]', 939, 852, 267, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/13', '[{},{},{},{}]', 877, 865, 753, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/18', '[{},{}]', 156, 78, 378, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/12', '[{}]', 343, 658, 609, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/19', '[{},{}]', 490, 19, 840, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[{},{},{}]', 281, 82, 206, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/15', '[{},{}]', 155, 974, 97, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/31', '[{},{}]', 678, 602, 378, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/21', '[{},{},{},{},{}]', 14, 492, 567, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{},{}]', 945, 340, 327, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/02', '[{}]', 230, 735, 390, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/30', '[{},{},{}]', 102, 583, 386, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/16', '[{},{},{},{},{}]', 465, 60, 471, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/28', '[{},{}]', 780, 121, 981, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/06', '[{},{},{},{}]', 77, 506, 63, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[]', 887, 87, 118, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/24', '[{}]', 937, 493, 755, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/26', '[{},{},{},{},{}]', 464, 841, 617, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/02', '[{},{},{},{}]', 943, 6, 457, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/08', '[{},{},{},{}]', 532, 163, 163, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/14', '[{},{}]', 264, 135, 233, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/14', '[{},{}]', 433, 142, 303, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/03', '[]', 956, 886, 803, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/04', '[]', 276, 205, 750, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/29', '[{},{},{},{},{}]', 921, 447, 796, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/26', '[{},{},{},{}]', 230, 151, 893, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/26', '[{},{},{}]', 109, 71, 646, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/22', '[{},{},{},{},{}]', 736, 314, 64, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/20', '[{}]', 903, 772, 401, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/08', '[{},{},{}]', 168, 671, 615, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/02', '[{},{},{}]', 43, 405, 956, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/28', '[{}]', 180, 341, 838, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/15', '[{},{},{},{},{}]', 361, 878, 546, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/17', '[{}]', 275, 564, 524, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/19', '[{},{},{},{},{}]', 907, 106, 126, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/15', '[{},{}]', 312, 392, 1, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/22', '[{},{},{},{},{}]', 74, 379, 504, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/10', '[{},{}]', 994, 177, 619, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/09', '[{},{}]', 647, 443, 980, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[]', 64, 953, 978, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/08', '[{},{},{},{}]', 54, 873, 398, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/29', '[{},{}]', 714, 887, 319, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/13', '[{},{},{}]', 253, 272, 501, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/29', '[{}]', 313, 130, 855, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/11', '[{},{}]', 215, 891, 373, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/02', '[{},{},{},{}]', 544, 823, 528, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/13', '[{}]', 509, 565, 150, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/30', '[{},{},{}]', 228, 310, 218, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/01', '[]', 981, 27, 578, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/27', '[{},{},{},{},{}]', 190, 355, 947, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/02', '[{},{},{},{},{}]', 544, 733, 771, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/08', '[]', 980, 46, 57, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/02', '[{},{}]', 658, 446, 135, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/11', '[{},{},{},{}]', 857, 883, 42, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/30', '[{},{},{}]', 899, 178, 998, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/15', '[]', 871, 346, 440, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/20', '[{},{},{},{},{}]', 886, 540, 880, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/08', '[]', 787, 928, 192, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[{},{}]', 880, 418, 385, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/01', '[]', 919, 782, 565, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/21', '[{},{},{}]', 238, 819, 470, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/29', '[]', 797, 205, 247, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/28', '[{},{},{},{},{}]', 915, 171, 457, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/08', '[]', 400, 203, 56, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/21', '[]', 120, 172, 328, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{},{},{}]', 521, 737, 924, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/21', '[{},{},{},{}]', 290, 144, 830, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/03', '[{},{}]', 501, 169, 757, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/28', '[{},{},{},{}]', 286, 563, 780, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/03', '[{},{},{},{},{}]', 819, 333, 718, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/05', '[{},{},{},{},{}]', 200, 165, 61, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/29', '[]', 744, 694, 322, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/23', '[{}]', 882, 344, 648, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/25', '[]', 799, 143, 92, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/22', '[{},{},{},{},{}]', 281, 708, 529, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/08', '[{},{},{},{},{}]', 513, 297, 384, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/03', '[{}]', 664, 910, 366, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/28', '[{},{}]', 59, 739, 657, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/04', '[]', 952, 703, 925, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/28', '[{},{},{},{}]', 462, 66, 789, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/28', '[{},{}]', 256, 112, 738, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/25', '[{},{},{}]', 384, 374, 111, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/23', '[{},{},{},{}]', 928, 50, 36, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/09', '[]', 658, 249, 511, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/26', '[{},{},{}]', 276, 461, 44, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/04', '[{},{}]', 448, 263, 55, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/25', '[]', 919, 388, 2, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/16', '[{},{},{},{},{}]', 770, 379, 884, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/11', '[{}]', 868, 374, 508, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{}]', 983, 277, 519, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/03', '[{},{},{},{}]', 294, 559, 666, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/14', '[{},{},{},{},{}]', 368, 155, 923, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/23', '[]', 631, 300, 891, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/24', '[{}]', 857, 580, 375, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/30', '[{},{},{},{}]', 303, 825, 235, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/19', '[{}]', 866, 755, 568, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/06', '[{},{},{}]', 815, 875, 666, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/05', '[{}]', 896, 63, 361, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/06', '[{},{}]', 899, 462, 647, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/02', '[{},{},{}]', 524, 890, 382, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/15', '[{},{},{}]', 98, 603, 857, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/08', '[{},{}]', 975, 106, 117, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/10', '[{},{},{},{}]', 346, 453, 831, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/04', '[{},{},{}]', 730, 920, 398, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/05', '[{},{},{},{},{}]', 669, 345, 719, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/30', '[{},{}]', 2, 710, 835, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/23', '[]', 633, 668, 670, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/21', '[]', 653, 275, 589, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/04', '[{},{},{}]', 600, 649, 225, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/23', '[{},{}]', 850, 90, 981, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/24', '[{}]', 77, 15, 542, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/28', '[{},{},{}]', 394, 860, 889, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/24', '[{},{},{},{},{}]', 630, 959, 210, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/09', '[{}]', 986, 432, 899, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/27', '[{}]', 222, 798, 161, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{},{},{},{}]', 346, 832, 234, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/09', '[{},{}]', 636, 448, 691, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/25', '[{},{},{}]', 354, 619, 941, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/07', '[{},{},{},{},{}]', 718, 446, 980, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/12', '[{},{},{},{}]', 582, 151, 471, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/04', '[{},{},{},{}]', 262, 229, 555, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/11', '[{}]', 320, 708, 50, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/15', '[{},{}]', 648, 764, 613, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/11', '[{},{}]', 831, 876, 762, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/20', '[{},{},{}]', 323, 781, 116, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/12', '[{},{},{},{},{}]', 594, 588, 751, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/19', '[{},{}]', 32, 859, 302, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/04', '[{},{},{},{},{}]', 782, 907, 382, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/31', '[{},{},{}]', 445, 666, 15, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{},{},{},{},{}]', 635, 409, 89, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/29', '[{},{},{},{}]', 870, 344, 581, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/02', '[{},{},{},{}]', 617, 913, 132, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/13', '[{},{},{},{},{}]', 708, 917, 358, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/22', '[]', 862, 951, 259, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/22', '[{},{},{}]', 297, 524, 270, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/18', '[]', 655, 312, 110, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/25', '[{},{}]', 915, 625, 112, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/23', '[{}]', 709, 630, 932, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/28', '[{},{}]', 384, 421, 391, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/23', '[{},{},{},{},{}]', 253, 395, 460, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/06', '[{},{}]', 231, 446, 404, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/12', '[{},{},{},{}]', 480, 497, 736, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/22', '[{},{},{},{},{}]', 963, 451, 512, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/04', '[{},{},{},{}]', 541, 776, 427, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/12', '[]', 292, 524, 284, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/05', '[{},{},{},{}]', 603, 857, 587, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/04', '[{},{},{},{}]', 270, 762, 655, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/19', '[{}]', 304, 224, 455, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/10', '[{},{}]', 402, 365, 352, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{}]', 648, 722, 7, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/06', '[{},{},{},{}]', 56, 108, 329, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/18', '[{},{},{}]', 769, 728, 103, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/07', '[{},{},{}]', 107, 850, 632, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/24', '[]', 195, 13, 201, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/05', '[{},{}]', 224, 277, 310, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/28', '[{},{},{},{}]', 584, 184, 786, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/03', '[]', 173, 843, 525, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/22', '[{},{}]', 217, 947, 920, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{},{},{}]', 895, 61, 326, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/26', '[]', 312, 534, 976, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/07', '[{},{},{}]', 194, 440, 86, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/24', '[{},{},{},{},{}]', 372, 490, 702, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/15', '[{},{},{}]', 514, 903, 649, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/06', '[{},{}]', 504, 314, 636, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/01', '[{}]', 111, 631, 715, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/27', '[{},{},{}]', 207, 907, 936, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[{}]', 255, 160, 291, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/01', '[{},{},{},{}]', 164, 636, 896, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/05', '[]', 555, 66, 395, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/08', '[{},{},{},{}]', 515, 566, 404, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/14', '[{},{},{},{},{}]', 287, 281, 455, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/25', '[{}]', 272, 540, 562, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/28', '[{},{},{},{}]', 799, 972, 334, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/13', '[{},{},{}]', 991, 793, 106, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/05', '[{},{},{}]', 833, 256, 762, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/02', '[{},{}]', 92, 777, 572, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/04', '[]', 65, 359, 620, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/09', '[{},{}]', 628, 119, 156, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/28', '[{},{},{},{}]', 957, 55, 367, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/26', '[{},{},{},{}]', 890, 682, 78, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/02', '[{},{}]', 754, 380, 16, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/15', '[{},{},{},{},{}]', 820, 674, 121, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[]', 70, 835, 242, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/22', '[{},{},{},{},{}]', 375, 736, 948, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/08', '[{},{},{},{},{}]', 873, 921, 614, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/14', '[{},{},{},{}]', 534, 656, 883, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/25', '[{},{},{}]', 657, 654, 122, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/03', '[{},{},{}]', 306, 482, 892, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/21', '[]', 373, 824, 338, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/19', '[{},{}]', 59, 612, 35, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/02', '[{},{}]', 975, 471, 501, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/26', '[{},{},{},{},{}]', 560, 371, 826, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/18', '[{},{},{},{}]', 164, 591, 595, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/28', '[{},{}]', 815, 835, 112, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/27', '[{}]', 632, 593, 651, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/26', '[{},{},{}]', 604, 564, 193, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/04', '[{},{},{},{}]', 768, 572, 758, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/30', '[{},{}]', 621, 96, 104, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/18', '[{}]', 708, 338, 222, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/12', '[{}]', 833, 855, 774, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/06', '[{}]', 77, 513, 302, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/26', '[{},{},{},{},{}]', 818, 560, 942, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/07', '[]', 83, 895, 70, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/02', '[{},{},{},{},{}]', 199, 346, 215, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/26', '[{},{},{}]', 412, 580, 471, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/02', '[{}]', 91, 345, 99, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/16', '[{},{},{},{},{}]', 162, 808, 124, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/04', '[{},{},{},{},{}]', 824, 108, 832, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/03', '[{}]', 707, 463, 478, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/20', '[{}]', 718, 857, 460, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/05', '[{}]', 994, 560, 585, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/20', '[{},{}]', 708, 534, 934, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/14', '[{}]', 167, 202, 213, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/29', '[{},{},{},{},{}]', 297, 693, 470, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/18', '[{},{}]', 873, 139, 797, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/04', '[{}]', 271, 302, 612, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/05', '[{}]', 110, 806, 989, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/20', '[]', 963, 927, 475, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/17', '[{},{}]', 34, 28, 826, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/23', '[]', 418, 549, 274, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/04', '[{},{},{},{},{}]', 800, 409, 693, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/07', '[{},{},{},{},{}]', 883, 181, 115, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/26', '[{},{},{}]', 900, 119, 915, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/28', '[{},{},{},{},{}]', 742, 540, 187, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/11', '[]', 753, 742, 460, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/14', '[{},{},{},{},{}]', 399, 974, 382, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/17', '[{},{}]', 492, 610, 875, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/01', '[{},{},{},{},{}]', 368, 250, 290, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/28', '[{}]', 101, 177, 854, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/26', '[]', 324, 143, 407, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/23', '[{}]', 585, 909, 208, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/25', '[]', 746, 492, 806, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/11', '[{},{},{},{}]', 200, 355, 642, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/24', '[{},{}]', 570, 725, 220, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/23', '[{}]', 785, 784, 542, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/22', '[{}]', 656, 938, 13, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/21', '[{},{},{}]', 643, 189, 909, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[{},{},{},{},{}]', 260, 218, 759, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/22', '[{},{},{},{},{}]', 971, 352, 384, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/19', '[{}]', 626, 245, 35, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{},{}]', 934, 896, 492, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/08', '[{},{},{}]', 176, 902, 717, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[{},{},{}]', 620, 73, 61, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/27', '[{},{},{}]', 641, 275, 569, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/12', '[]', 41, 896, 650, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/12', '[{},{},{},{}]', 21, 228, 722, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/22', '[{}]', 26, 452, 386, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/10', '[]', 20, 564, 32, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/15', '[{},{},{},{}]', 8, 313, 204, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/18', '[{},{},{},{},{}]', 202, 953, 868, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[]', 120, 760, 818, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/21', '[{}]', 840, 449, 443, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{}]', 555, 544, 702, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/13', '[]', 944, 989, 886, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/30', '[]', 777, 391, 808, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/08', '[]', 230, 422, 658, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/12', '[{},{},{}]', 797, 974, 866, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/06', '[{},{},{}]', 781, 674, 637, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/26', '[{},{}]', 566, 963, 923, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/02', '[{},{}]', 961, 710, 602, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/22', '[{}]', 766, 157, 924, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/19', '[]', 564, 88, 403, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/10', '[{},{}]', 83, 940, 814, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/13', '[{},{}]', 438, 326, 371, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/07', '[{},{}]', 836, 373, 928, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/08', '[{},{},{},{},{}]', 920, 547, 792, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/30', '[{},{}]', 679, 880, 706, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/17', '[]', 338, 483, 383, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/20', '[{}]', 322, 867, 228, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/22', '[{},{},{}]', 798, 190, 334, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/15', '[{},{},{}]', 721, 408, 397, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{},{}]', 522, 216, 983, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/09', '[{},{},{},{}]', 515, 685, 794, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/14', '[{}]', 379, 37, 431, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/26', '[{},{},{},{},{}]', 870, 64, 361, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/21', '[{},{},{}]', 608, 975, 20, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/05', '[{},{},{}]', 623, 338, 43, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/20', '[]', 181, 68, 452, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/24', '[{},{},{},{},{}]', 906, 134, 177, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/09', '[{},{},{}]', 774, 720, 387, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/26', '[{},{},{},{},{}]', 697, 763, 254, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/12', '[]', 800, 182, 343, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/13', '[{}]', 355, 866, 199, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/26', '[{},{},{}]', 701, 835, 153, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/10', '[{},{}]', 778, 918, 144, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{}]', 541, 395, 968, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[]', 526, 525, 921, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/30', '[{}]', 91, 60, 633, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/18', '[]', 31, 928, 361, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/28', '[{},{}]', 197, 507, 50, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/02', '[{},{}]', 190, 886, 9, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/18', '[{},{},{},{},{}]', 855, 41, 322, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/13', '[{}]', 350, 815, 123, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/30', '[]', 976, 3, 699, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/26', '[{},{}]', 892, 596, 911, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/26', '[{},{},{},{},{}]', 760, 939, 203, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/01', '[{},{},{},{},{}]', 816, 604, 591, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/09', '[]', 724, 63, 495, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/16', '[{}]', 690, 35, 785, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/24', '[]', 640, 201, 210, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/10', '[{},{},{},{},{}]', 711, 532, 108, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/05', '[{},{}]', 830, 281, 899, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/02', '[]', 297, 525, 137, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/28', '[{}]', 248, 299, 138, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/05', '[{},{}]', 591, 726, 597, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/28', '[{},{},{},{},{}]', 632, 623, 382, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/05', '[{},{}]', 251, 585, 97, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/15', '[{},{},{}]', 933, 411, 412, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/24', '[{},{},{},{}]', 249, 42, 745, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/05', '[{},{},{}]', 238, 601, 650, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/24', '[{},{}]', 661, 231, 601, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/10', '[{},{},{},{}]', 207, 186, 143, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/07', '[]', 917, 684, 487, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/06', '[]', 107, 390, 119, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/22', '[{},{},{}]', 788, 669, 169, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/28', '[{},{},{},{}]', 624, 733, 849, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/09', '[{},{},{}]', 84, 389, 446, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/20', '[]', 235, 202, 216, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/03', '[{},{},{},{}]', 209, 959, 782, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/11', '[{},{},{},{}]', 523, 598, 911, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/13', '[{},{}]', 657, 912, 837, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/07', '[]', 88, 3, 449, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/08', '[{}]', 642, 525, 849, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/02', '[{},{},{},{}]', 991, 227, 828, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/01', '[{},{},{},{},{}]', 231, 536, 310, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/06', '[{},{},{}]', 598, 132, 461, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[{},{},{},{}]', 516, 483, 723, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/18', '[{},{},{},{},{}]', 634, 746, 151, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/06', '[{},{},{},{}]', 940, 809, 446, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/10', '[{}]', 987, 615, 38, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/01', '[{},{},{},{},{}]', 794, 14, 199, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/05', '[]', 423, 236, 336, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/20', '[{},{},{}]', 159, 991, 720, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/10', '[{}]', 624, 547, 455, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/22', '[]', 38, 268, 435, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[{},{},{},{},{}]', 573, 618, 332, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/17', '[{},{},{}]', 409, 579, 171, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/02', '[{},{},{},{},{}]', 267, 805, 859, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/18', '[{},{},{}]', 720, 830, 491, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/18', '[{},{},{},{},{}]', 821, 58, 211, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/22', '[{}]', 918, 804, 320, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/28', '[{},{},{}]', 461, 536, 399, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/08', '[{}]', 160, 1000, 788, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/30', '[]', 286, 700, 798, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/19', '[]', 715, 929, 756, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/12', '[{},{},{}]', 701, 947, 403, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/07', '[{},{},{},{},{}]', 725, 873, 575, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/28', '[{}]', 705, 605, 444, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/14', '[{},{},{}]', 861, 218, 248, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/12', '[{},{},{},{},{}]', 268, 678, 458, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/23', '[{},{},{}]', 139, 910, 862, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/11', '[{},{},{},{}]', 168, 534, 922, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/24', '[{},{},{},{},{}]', 358, 647, 5, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/15', '[{},{},{}]', 744, 197, 213, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/11', '[{},{},{},{},{}]', 52, 208, 165, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/03', '[{},{}]', 168, 360, 735, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/18', '[{},{},{}]', 577, 567, 28, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/07', '[{},{},{},{}]', 834, 974, 950, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/21', '[{},{},{},{}]', 932, 59, 501, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/03', '[]', 773, 146, 522, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/16', '[]', 943, 514, 270, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/28', '[{}]', 224, 886, 134, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/07', '[{},{}]', 452, 282, 87, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/28', '[{},{},{},{},{}]', 832, 740, 633, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/29', '[]', 286, 180, 296, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/12', '[{}]', 245, 811, 419, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/02', '[{},{},{},{}]', 554, 96, 834, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{},{}]', 928, 208, 613, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/06', '[{},{},{}]', 178, 179, 155, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/16', '[{},{},{}]', 848, 553, 307, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/07', '[{},{},{}]', 453, 420, 754, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/17', '[{},{}]', 598, 909, 528, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/12', '[{},{},{}]', 357, 871, 25, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/28', '[{},{},{}]', 776, 690, 529, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/19', '[{},{}]', 2, 370, 674, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/22', '[{},{},{},{},{}]', 737, 482, 773, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/10', '[{},{},{}]', 937, 178, 832, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/23', '[{}]', 406, 961, 281, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/17', '[{},{}]', 610, 418, 56, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/11', '[{},{}]', 377, 673, 201, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/29', '[{},{},{}]', 685, 284, 462, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/25', '[{},{},{}]', 353, 683, 490, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/04', '[{},{},{},{},{}]', 796, 846, 597, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/14', '[]', 232, 508, 546, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/18', '[{},{},{},{}]', 979, 175, 296, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/14', '[{},{},{},{},{}]', 351, 561, 228, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/08', '[{}]', 812, 407, 292, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/15', '[{},{},{},{}]', 625, 538, 78, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/13', '[{},{},{}]', 222, 348, 114, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/28', '[{},{},{}]', 67, 307, 183, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/18', '[{}]', 656, 582, 496, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/25', '[{},{}]', 235, 792, 64, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/15', '[{}]', 48, 587, 51, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/02', '[{},{},{},{},{}]', 201, 527, 786, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/08', '[{},{},{}]', 430, 771, 830, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/17', '[]', 247, 73, 851, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/24', '[{},{},{},{},{}]', 492, 769, 921, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/14', '[{},{},{},{},{}]', 448, 495, 849, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/09', '[{},{},{},{}]', 558, 46, 758, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[{},{}]', 68, 727, 238, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/30', '[]', 995, 905, 527, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{},{},{}]', 639, 643, 620, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/14', '[{},{},{}]', 540, 11, 639, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/11', '[{},{},{}]', 561, 926, 428, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/01', '[{},{},{}]', 548, 674, 198, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/08', '[{},{},{},{},{}]', 940, 543, 255, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/10', '[{},{},{},{},{}]', 248, 371, 613, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/23', '[{},{},{},{},{}]', 651, 680, 265, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/18', '[{},{},{},{}]', 754, 540, 548, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/13', '[{},{},{},{}]', 584, 28, 22, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/20', '[{},{},{},{},{}]', 789, 789, 53, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/07', '[{},{}]', 789, 203, 744, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/05', '[{}]', 290, 243, 273, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/08', '[{},{},{}]', 924, 374, 632, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/02', '[{}]', 653, 627, 912, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/13', '[{},{},{},{},{}]', 646, 982, 850, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/30', '[{}]', 969, 820, 981, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/16', '[{},{},{},{},{}]', 337, 670, 854, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/26', '[{},{},{}]', 563, 63, 673, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/08', '[{},{},{},{},{}]', 163, 343, 455, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/10', '[]', 587, 840, 993, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/23', '[{},{},{},{}]', 891, 503, 950, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/28', '[{}]', 389, 587, 979, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/24', '[{},{},{},{}]', 78, 498, 173, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/25', '[{},{}]', 614, 32, 899, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/10', '[]', 392, 145, 405, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/18', '[]', 28, 84, 212, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/01', '[]', 641, 616, 119, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/13', '[]', 379, 548, 913, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/07', '[{}]', 761, 542, 73, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/28', '[{},{},{},{}]', 350, 650, 211, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/17', '[{}]', 234, 383, 611, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/03', '[{},{},{},{},{}]', 448, 62, 532, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/27', '[{},{},{},{},{}]', 51, 982, 921, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/10', '[]', 723, 489, 18, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/28', '[{},{},{}]', 136, 97, 257, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/31', '[{}]', 85, 823, 517, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/17', '[{},{},{}]', 170, 843, 88, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/06', '[]', 500, 162, 218, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{},{},{}]', 679, 250, 413, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/27', '[{}]', 340, 48, 941, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/01', '[{}]', 335, 286, 852, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/19', '[{},{},{},{}]', 35, 472, 848, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/03', '[]', 383, 213, 166, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/15', '[]', 96, 437, 812, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[{},{}]', 598, 492, 402, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/18', '[{}]', 259, 597, 728, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/25', '[{},{}]', 874, 304, 528, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/25', '[{}]', 580, 917, 2, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/30', '[]', 935, 632, 216, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/06', '[{},{},{},{}]', 115, 6, 794, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/13', '[]', 677, 806, 256, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/16', '[{},{}]', 476, 246, 879, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/21', '[{},{}]', 130, 284, 687, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/06', '[{},{},{},{}]', 722, 253, 623, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/14', '[]', 425, 130, 788, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/22', '[{},{}]', 800, 796, 277, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/20', '[{}]', 265, 217, 96, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/27', '[{},{},{}]', 243, 273, 410, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/26', '[{},{},{},{}]', 326, 305, 413, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/17', '[{},{},{}]', 955, 195, 974, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/09', '[{},{}]', 537, 777, 853, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/09', '[{},{},{},{}]', 95, 402, 983, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/27', '[]', 765, 627, 255, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/17', '[{},{}]', 576, 471, 97, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/12', '[{},{}]', 22, 740, 842, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/15', '[{},{},{}]', 442, 902, 712, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/18', '[{},{},{},{}]', 863, 501, 376, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/18', '[{},{},{},{},{}]', 284, 270, 721, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/10', '[{},{},{},{}]', 926, 453, 318, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/02', '[{},{}]', 131, 121, 968, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/22', '[{},{},{},{},{}]', 346, 936, 806, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/02', '[{}]', 489, 392, 525, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/17', '[{}]', 591, 313, 893, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/19', '[{},{},{},{},{}]', 944, 65, 897, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/03', '[]', 666, 657, 183, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/08', '[{},{},{},{},{}]', 811, 594, 669, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/08', '[{},{},{},{},{}]', 891, 447, 746, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/29', '[]', 714, 102, 342, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/28', '[{},{},{}]', 398, 646, 527, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/09', '[{},{}]', 32, 145, 802, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/09', '[{}]', 692, 235, 766, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/29', '[{},{},{},{}]', 211, 50, 30, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/20', '[{},{},{},{},{}]', 767, 427, 352, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/16', '[{}]', 139, 20, 707, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/16', '[{},{},{},{}]', 831, 301, 634, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/13', '[{},{},{},{},{}]', 507, 733, 465, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/20', '[{},{},{},{}]', 45, 428, 68, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[]', 674, 962, 498, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/14', '[{}]', 17, 576, 456, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/11', '[{},{}]', 486, 11, 607, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/21', '[{},{},{},{},{}]', 937, 310, 466, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/26', '[{},{},{},{}]', 845, 362, 933, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/05', '[{},{},{},{}]', 116, 622, 58, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/15', '[{},{},{},{},{}]', 282, 250, 899, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/25', '[]', 303, 532, 662, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/07', '[{}]', 439, 200, 536, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[{},{}]', 632, 315, 580, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/07', '[]', 57, 237, 217, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/07', '[{},{},{}]', 600, 397, 132, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/20', '[{},{},{},{}]', 904, 39, 879, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/01', '[{},{},{},{},{}]', 83, 902, 543, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/14', '[{},{},{}]', 733, 479, 706, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/26', '[{}]', 207, 198, 567, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/15', '[{},{}]', 286, 973, 476, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/26', '[]', 403, 366, 884, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/15', '[]', 972, 434, 269, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/22', '[{},{},{},{}]', 407, 742, 33, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/30', '[{},{},{}]', 281, 847, 284, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/29', '[{},{},{},{},{}]', 463, 281, 966, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/06', '[{},{},{},{}]', 964, 241, 970, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/24', '[{},{},{},{}]', 444, 919, 583, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/05', '[{},{}]', 498, 446, 894, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/18', '[]', 173, 313, 432, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/17', '[{},{}]', 887, 102, 761, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/12', '[{}]', 855, 246, 641, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/21', '[{},{},{},{},{}]', 107, 324, 908, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/24', '[{},{},{},{}]', 950, 860, 585, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/24', '[{},{},{}]', 298, 187, 47, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/07', '[{},{}]', 731, 153, 217, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/01', '[{},{},{},{},{}]', 38, 288, 634, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/16', '[{},{},{}]', 342, 885, 304, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/22', '[{}]', 639, 809, 698, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/27', '[{},{}]', 110, 741, 79, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/20', '[{},{},{}]', 36, 707, 440, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/16', '[{}]', 903, 559, 295, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/13', '[{},{},{}]', 6, 60, 685, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/04', '[{},{},{},{}]', 329, 599, 356, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/06', '[{},{},{}]', 627, 12, 647, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/11', '[{},{},{},{},{}]', 167, 537, 655, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/20', '[{},{}]', 426, 764, 96, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/14', '[{},{}]', 977, 718, 636, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/15', '[{},{},{},{},{}]', 547, 219, 743, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/25', '[{},{},{},{}]', 419, 312, 421, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/26', '[{},{},{},{},{}]', 582, 276, 977, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/18', '[{},{},{},{}]', 651, 575, 322, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/23', '[{},{}]', 814, 941, 296, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/20', '[{},{},{},{},{}]', 576, 551, 274, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/30', '[{}]', 287, 387, 31, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/20', '[{},{},{},{}]', 474, 801, 346, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[{},{},{},{}]', 207, 40, 749, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/16', '[{},{},{}]', 906, 14, 312, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{},{},{}]', 591, 218, 591, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/25', '[]', 851, 112, 339, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/26', '[{},{},{},{}]', 614, 881, 204, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/30', '[{},{},{}]', 11, 982, 735, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/27', '[{},{},{}]', 665, 287, 987, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/08', '[{},{},{},{}]', 736, 63, 33, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/16', '[{}]', 233, 14, 180, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/27', '[{},{},{}]', 870, 279, 941, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/23', '[{},{},{}]', 706, 944, 724, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/01', '[{},{},{},{}]', 857, 152, 650, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/19', '[{},{}]', 868, 11, 265, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/26', '[{},{},{},{}]', 497, 183, 993, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/21', '[{},{}]', 934, 394, 673, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/17', '[{},{},{},{},{}]', 904, 865, 699, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/25', '[{},{},{}]', 855, 686, 702, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/13', '[{},{}]', 370, 475, 409, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/17', '[{},{},{},{}]', 987, 346, 52, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/04', '[{}]', 474, 861, 339, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/31', '[{},{},{}]', 486, 909, 729, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/14', '[{},{},{},{},{}]', 514, 278, 444, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/06', '[{},{},{},{}]', 513, 417, 971, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/25', '[{},{}]', 204, 979, 426, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/26', '[]', 403, 610, 512, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/09', '[{},{},{},{}]', 36, 482, 322, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/01', '[{},{}]', 371, 227, 377, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/26', '[{},{}]', 56, 574, 865, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/15', '[]', 130, 543, 896, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/02', '[]', 886, 764, 208, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/30', '[]', 626, 159, 694, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/25', '[{},{}]', 50, 81, 962, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/27', '[{},{},{},{},{}]', 24, 737, 809, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[]', 520, 243, 904, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/01', '[{}]', 127, 648, 602, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/06', '[{},{},{}]', 683, 356, 558, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/16', '[]', 501, 968, 760, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/05', '[{},{},{},{},{}]', 100, 622, 553, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/29', '[{},{},{}]', 468, 302, 279, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/28', '[{},{},{},{},{}]', 66, 947, 84, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/27', '[{}]', 630, 15, 205, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/11', '[{},{},{}]', 682, 970, 696, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/20', '[{},{}]', 433, 513, 350, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/08', '[{}]', 953, 801, 979, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/03', '[{}]', 440, 164, 366, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/29', '[{},{},{},{},{}]', 523, 816, 925, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/24', '[]', 53, 759, 560, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/31', '[{}]', 627, 760, 926, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/15', '[{},{},{}]', 394, 96, 795, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/08', '[{},{},{},{}]', 954, 22, 463, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/22', '[{},{},{},{},{}]', 935, 795, 729, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/21', '[{},{}]', 2, 128, 47, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/12', '[]', 216, 293, 576, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/22', '[{},{},{},{},{}]', 30, 219, 390, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/18', '[{},{},{},{}]', 761, 755, 998, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/17', '[{},{},{},{}]', 433, 887, 458, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/04', '[{},{},{},{}]', 844, 513, 766, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/20', '[{},{},{},{},{}]', 359, 898, 298, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/08', '[{}]', 35, 586, 852, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/19', '[{},{},{},{},{}]', 790, 488, 374, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/23', '[]', 188, 307, 718, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/16', '[{},{},{},{},{}]', 946, 13, 238, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/21', '[{},{},{}]', 241, 798, 56, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/27', '[{}]', 732, 93, 730, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[{},{},{}]', 428, 205, 264, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/18', '[{},{},{},{},{}]', 736, 114, 307, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/01', '[{},{},{},{}]', 223, 367, 397, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/28', '[{},{}]', 505, 687, 785, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/23', '[{},{},{},{}]', 961, 251, 872, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/12', '[{},{},{}]', 296, 968, 58, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/11', '[{}]', 860, 146, 860, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/10', '[{},{},{},{},{}]', 481, 290, 83, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/05', '[]', 934, 763, 302, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[{}]', 729, 423, 205, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/08', '[{},{},{}]', 429, 159, 78, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/07', '[{}]', 347, 857, 175, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/16', '[]', 537, 577, 1000, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/17', '[{},{},{}]', 129, 165, 218, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/26', '[{},{},{},{}]', 712, 307, 925, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/12', '[{}]', 73, 151, 5, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/28', '[{},{},{},{},{}]', 815, 586, 583, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/06', '[{},{}]', 211, 317, 966, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/16', '[]', 13, 695, 127, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/08', '[]', 245, 791, 771, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/04', '[]', 17, 260, 760, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/19', '[{},{},{},{},{}]', 420, 886, 935, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/30', '[{},{},{},{},{}]', 518, 915, 931, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/20', '[{},{},{},{}]', 331, 844, 83, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/29', '[]', 959, 217, 285, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/04', '[]', 213, 363, 285, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/18', '[]', 960, 306, 28, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[{},{},{},{}]', 273, 106, 454, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/28', '[{},{},{},{}]', 385, 444, 902, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/21', '[]', 42, 420, 547, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/27', '[]', 781, 170, 490, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/04', '[{},{},{},{}]', 34, 407, 100, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/12', '[{}]', 764, 77, 99, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/16', '[{}]', 732, 676, 369, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/19', '[{},{}]', 898, 933, 43, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/08', '[{}]', 527, 761, 92, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/20', '[{},{},{},{}]', 1, 23, 286, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/05', '[{},{},{}]', 790, 947, 905, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/03', '[{}]', 417, 185, 717, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/25', '[{},{}]', 362, 712, 231, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/23', '[{}]', 277, 561, 396, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/05', '[{}]', 545, 358, 716, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/15', '[{},{}]', 561, 306, 803, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/29', '[{},{},{},{},{}]', 68, 875, 816, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/19', '[]', 92, 382, 571, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/10', '[{}]', 370, 588, 826, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/12', '[{}]', 30, 288, 575, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/30', '[{},{}]', 468, 201, 184, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/12', '[{},{}]', 244, 426, 636, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/22', '[]', 316, 159, 984, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/18', '[{},{}]', 344, 501, 732, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/29', '[{},{},{},{}]', 236, 339, 701, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/07', '[{},{},{},{}]', 414, 748, 86, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/21', '[{},{},{},{},{}]', 353, 11, 565, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/05', '[{},{},{}]', 983, 324, 5, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/18', '[{},{}]', 704, 67, 801, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/28', '[]', 666, 909, 341, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/26', '[{},{},{},{}]', 605, 342, 468, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/20', '[{},{},{},{},{}]', 659, 736, 613, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/13', '[{},{}]', 211, 243, 652, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/16', '[{}]', 361, 542, 290, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/03', '[{},{},{},{}]', 612, 178, 149, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/09', '[]', 69, 536, 778, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/09', '[{}]', 603, 266, 554, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/03', '[{},{},{},{},{}]', 89, 727, 164, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/22', '[]', 765, 260, 874, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/07', '[{},{},{}]', 356, 737, 811, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/24', '[{},{},{},{}]', 127, 62, 887, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/28', '[{},{},{},{},{}]', 331, 853, 609, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/10', '[{},{},{},{},{}]', 269, 43, 933, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/19', '[]', 64, 389, 871, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/21', '[]', 50, 483, 32, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/10', '[{}]', 367, 182, 293, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/14', '[]', 423, 656, 64, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/28', '[{},{},{},{},{}]', 495, 44, 659, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/13', '[{},{},{},{},{}]', 266, 407, 227, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/01', '[{},{},{}]', 619, 684, 215, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/01', '[{},{}]', 787, 322, 209, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/15', '[{},{},{},{}]', 813, 608, 403, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/04', '[{},{},{}]', 421, 222, 389, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/19', '[{},{},{}]', 432, 729, 769, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/22', '[{},{}]', 863, 319, 49, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/04', '[{},{},{},{},{}]', 549, 161, 57, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/15', '[{},{}]', 15, 278, 137, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/10', '[{},{},{},{}]', 579, 102, 361, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/01', '[{},{}]', 996, 754, 655, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/12', '[{},{},{}]', 341, 912, 201, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/25', '[{}]', 373, 953, 874, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/20', '[{},{},{},{},{}]', 430, 154, 492, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/01', '[{},{},{},{}]', 157, 729, 832, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/28', '[{},{},{}]', 88, 47, 365, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/30', '[]', 387, 729, 496, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/23', '[{},{},{},{}]', 269, 361, 420, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/07', '[]', 520, 17, 697, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/28', '[]', 211, 514, 826, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/29', '[{},{},{},{},{}]', 710, 241, 923, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/30', '[{},{}]', 214, 294, 635, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/08', '[{},{},{},{}]', 366, 967, 95, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/02', '[{},{},{}]', 309, 238, 61, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/07', '[{},{},{},{},{}]', 763, 30, 261, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/30', '[]', 541, 909, 36, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/30', '[{},{},{}]', 28, 977, 816, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/15', '[{},{},{},{}]', 851, 313, 620, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/29', '[{},{},{}]', 774, 183, 405, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/08', '[{}]', 428, 627, 341, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/20', '[]', 141, 502, 421, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/19', '[{},{},{}]', 810, 761, 688, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/29', '[{},{},{},{}]', 984, 728, 35, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/17', '[{}]', 819, 712, 179, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/17', '[{},{},{}]', 190, 178, 549, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[{},{},{},{}]', 731, 277, 564, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/01', '[{},{},{}]', 110, 361, 288, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/11', '[{},{},{}]', 887, 475, 407, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/09', '[]', 482, 370, 847, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/05', '[{},{},{}]', 536, 12, 64, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/01', '[]', 596, 380, 669, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/27', '[{},{},{},{},{}]', 925, 812, 657, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/18', '[{},{},{},{},{}]', 92, 962, 282, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/02', '[{},{},{}]', 345, 8, 820, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/24', '[{},{},{},{}]', 344, 89, 15, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/04', '[{},{},{}]', 701, 367, 460, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/22', '[]', 688, 793, 969, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/21', '[{},{},{}]', 315, 327, 496, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/20', '[{}]', 873, 787, 13, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/26', '[{}]', 905, 186, 107, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/02', '[]', 129, 326, 240, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/26', '[{},{},{},{},{}]', 931, 995, 372, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/10', '[{},{},{},{}]', 97, 211, 655, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/10', '[{}]', 907, 88, 240, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/23', '[{},{},{},{}]', 655, 449, 82, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/22', '[{}]', 244, 868, 562, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/27', '[{},{},{}]', 955, 495, 921, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/25', '[{}]', 910, 401, 128, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/25', '[]', 176, 779, 781, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/24', '[{},{},{}]', 191, 696, 728, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/19', '[{},{},{}]', 792, 998, 501, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/13', '[{},{},{}]', 517, 510, 177, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/09', '[{},{},{},{},{}]', 727, 151, 159, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/16', '[{},{}]', 877, 654, 772, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/18', '[{},{},{},{}]', 213, 814, 266, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/15', '[{}]', 259, 133, 553, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/14', '[{},{},{}]', 204, 624, 794, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/22', '[{},{},{},{}]', 927, 376, 857, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/26', '[{},{},{},{},{}]', 0, 831, 799, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/08', '[{},{},{}]', 782, 443, 381, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/10', '[{}]', 126, 300, 629, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/05', '[{},{},{},{},{}]', 696, 683, 110, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/16', '[{},{},{}]', 497, 271, 255, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/18', '[{},{},{},{}]', 320, 267, 70, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/18', '[{},{},{},{}]', 73, 71, 781, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/08', '[{},{},{},{}]', 480, 575, 285, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/08', '[{},{}]', 959, 557, 692, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/05', '[{},{},{},{},{}]', 484, 396, 459, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/18', '[{},{},{}]', 503, 75, 907, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/23', '[]', 220, 869, 313, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/15', '[{},{},{},{},{}]', 55, 869, 515, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/16', '[{}]', 910, 357, 595, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/16', '[{}]', 967, 243, 329, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/29', '[{}]', 278, 483, 370, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/11', '[{}]', 510, 31, 133, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/08', '[{},{}]', 675, 731, 488, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[{},{},{},{}]', 675, 710, 898, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/05', '[{},{},{}]', 798, 654, 59, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/31', '[{},{},{},{},{}]', 433, 734, 528, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/10', '[{},{},{},{},{}]', 567, 237, 636, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/28', '[{},{},{},{},{}]', 909, 295, 826, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[]', 508, 915, 273, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/13', '[{},{},{},{}]', 913, 407, 327, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/12', '[{},{},{}]', 783, 628, 169, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/21', '[{},{},{},{},{}]', 610, 121, 367, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/14', '[{},{},{},{},{}]', 60, 494, 539, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/21', '[{},{},{},{},{}]', 621, 750, 7, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/09', '[{},{}]', 439, 818, 129, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/10', '[{},{}]', 689, 873, 729, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/03', '[{},{},{},{},{}]', 16, 72, 493, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/25', '[{},{},{},{}]', 850, 388, 952, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/20', '[{},{},{},{},{}]', 89, 891, 763, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/26', '[{},{}]', 626, 501, 976, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/09', '[{},{},{},{},{}]', 360, 382, 773, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/23', '[{},{},{},{}]', 752, 546, 567, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/05', '[{},{},{}]', 83, 966, 655, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/17', '[{},{},{},{}]', 688, 938, 473, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/24', '[]', 143, 994, 302, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/03', '[{},{},{},{},{}]', 789, 72, 291, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[{},{}]', 947, 603, 390, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/25', '[{},{},{},{},{}]', 333, 6, 776, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/16', '[{},{},{},{}]', 818, 186, 68, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/09', '[{},{},{}]', 754, 4, 482, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/07', '[{},{},{},{},{}]', 611, 433, 291, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/21', '[]', 710, 489, 19, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/25', '[]', 579, 663, 910, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/04', '[{},{},{}]', 12, 639, 529, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/18', '[{}]', 644, 846, 14, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/14', '[{},{}]', 433, 721, 726, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/29', '[{},{}]', 230, 176, 562, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/02', '[{},{},{},{},{}]', 578, 44, 285, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/03', '[]', 45, 254, 362, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/29', '[{},{},{},{},{}]', 786, 860, 429, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/08', '[{}]', 304, 645, 290, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/03', '[{}]', 195, 422, 317, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/22', '[{},{},{}]', 175, 425, 719, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/13', '[{},{},{},{},{}]', 887, 284, 422, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/02', '[{},{},{},{},{}]', 519, 842, 756, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/01', '[{},{},{},{}]', 475, 899, 483, null, 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/22', '[{}]', 710, 548, 387, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/27', '[{}]', 396, 73, 166, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/01', '[{},{},{}]', 397, 358, 52, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/09', '[]', 358, 977, 80, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/12', '[]', 459, 82, 980, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/11/21', '[{}]', 548, 76, 92, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/27', '[{},{},{},{}]', 620, 430, 175, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/12/10', '[{},{},{}]', 495, 182, 105, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/02', '[{},{},{}]', 179, 238, 16, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/04/19', '[{},{},{}]', 393, 7, 662, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/17', '[{},{},{},{},{}]', 806, 337, 647, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/06/10', '[{},{},{},{}]', 502, 749, 24, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/01/07', '[]', 38, 472, 530, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/19', '[{}]', 185, 430, 260, 'N', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/20', '[{},{},{},{}]', 300, 501, 307, null, 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/09/09', '[{}]', 606, 72, 423, 'Y', 'Y');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/05/05', '[{}]', 177, 815, 514, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/05', '[{},{},{}]', 923, 535, 728, 'Y', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/10/23', '[{},{},{}]', 954, 641, 269, null, null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/08/30', '[{},{},{},{},{}]', 793, 438, 547, 'Y', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/07', '[{},{}]', 998, 91, 104, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/03/16', '[{},{},{},{}]', 717, 715, 95, 'N', null);
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/02/23', '[{},{},{},{}]', 831, 772, 286, 'N', 'N');
insert into trail (TRAILID, MID, TRAILDATE, trailjson, TRAILCOUNT, TRAILGOOD, TRAILRANGE, RETRAILYN, TRAILREPORTYN) values (sys_guid(), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), '2023/07/15', '[{},{},{}]', 312, 360, 438, 'N', null);


insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/03/08');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/11/20');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/04/27');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/06/03');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/16');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/01/05');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/12/13');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/11/18');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/04/04');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/07/02');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/05/15');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/06/26');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/05/22');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/03/31');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/22');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/04/20');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/11/26');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/09/14');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/11/05');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/02/19');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/06/07');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/08/06');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/10/26');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/01/29');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/07');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/08');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/05/10');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/10/11');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/11/17');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/10/27');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/04/30');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/08/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/04/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/09/03');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/03/31');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/10/07');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/01/19');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/08/15');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/11/02');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/12/02');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/07/14');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/18');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/11/05');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/12/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/03/08');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/06/21');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/08/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/09/01');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/02/13');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/01/31');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/05/01');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/02/07');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/05/22');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/04/08');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/03/14');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/07/30');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/10/29');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/07/06');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/14');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/02/04');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/01/23');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/03/03');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/11/10');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/01/27');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/03/24');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/11/26');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/08/21');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/09/09');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/05/02');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/05/31');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/05/18');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/10/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/11/21');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/05/15');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/05/21');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/06/30');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/01/16');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/03/18');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/12/02');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), null, '2023/04/20');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/01/06');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/08/06');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/06/08');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/04/10');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/08/10');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/12/10');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/12/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/06/12');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/02/04');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/02/18');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/05/31');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/03/06');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/05/21');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/09/29');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/07/19');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/12/30');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/12/28');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'Y', '2023/08/23');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/07/31');
insert into follow (mid, mid2, followyn, FOLLOWTIME) values ((select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT mid FROM member ORDER BY dbms_random.value) where rownum=1), 'N', '2023/01/24');


insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/23');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/24');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/22');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/13');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/01');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/12/01');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/16');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/02');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/22');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/05');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/31');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/05');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/04/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/01');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/28');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/16');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/24');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/09');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/18');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/01');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/17');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/25');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/04/04');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/27');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/04/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/03');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/05');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/15');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/08');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/27');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/06');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/04/28');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/26');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/03');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/14');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/25');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/11');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/13');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/02');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/17');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/12/16');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/28');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/17');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/05');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/11');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/07');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/11');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/18');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/12/24');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/21');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/12');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/22');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/19');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/12');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/30');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/17');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/20');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/04/26');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/04/13');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/08');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/06');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/09');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/29');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/22');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/22');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/09/12');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/12/19');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/11');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/28');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/07');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/21');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/13');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/30');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/21');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/06/24');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/16');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/03');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/11');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/12/08');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/08/26');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/15');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/05/15');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/27');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/10');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/03');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/01/13');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/03/23');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/10/20');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/11/30');
insert into retrail (RETRAILNO, TRAILID, RETRAILDATE) values ((select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), (select * from (SELECT trailid FROM trail ORDER BY dbms_random.value) where rownum=1), '2023/02/14');




