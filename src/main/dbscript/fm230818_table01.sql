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

/* 태그 연결 테이블 */
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

/* Trail Thread */
DROP TABLE thread 
	CASCADE CONSTRAINTS;

/* trail테이블 */
CREATE TABLE trail (
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* trail ID */
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* trail 작성자 */
	trailDate DATE DEFAULT SYSDATE NOT NULL, /* trail작성일 */
	trailJson CLOB NOT NULL, /* trail 본문 */
	trailCount NUMBER DEFAULT 0 NOT NULL, /* 조회수 */
	trailGood NUMBER DEFAULT 0 NOT NULL, /* 좋아요 수 */
	trailRange VARCHAR2(1) DEFAULT 'P' NOT NULL, /* 공개범위 */
	threadYN VARCHAR2(1), /* 스레드YN */
	trailReport VARCHAR2(1) DEFAULT 'N', /* 신고처리 */
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

COMMENT ON COLUMN trail.threadYN IS '스레드YN';

COMMENT ON COLUMN trail.trailReport IS '신고처리';

COMMENT ON COLUMN trail.trailMeta IS 'trail 메타데이터';

ALTER TABLE trail
	ADD
		CONSTRAINT PK_trail
		PRIMARY KEY (
			trailId
		);

/* 댓글테이블 */
CREATE TABLE cmt (
	cmtid raw(16) NOT NULL, /* 댓글 번호 */
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* trail ID */
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 댓글 작성자 */
	cmtContent VARCHAR2(4000 CHAR) NOT NULL, /* 댓글 내용 */
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

ALTER TABLE cmt
	ADD
		CONSTRAINT PK_cmt
		PRIMARY KEY (
			cmtid
		);

/* 멤버 테이블 */
CREATE TABLE member (
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 멤버 식별번호 */
	email VARCHAR2(255) NOT NULL, /* 이메일 */
	socialid VARCHAR2(255), /* 소셜로그인id */
	nickName VARCHAR2(30 CHAR), /* 닉네임 */
	profilePic VARCHAR2(255), /* 프로필사진 */
	pwd VARCHAR2(100 BYTE) NOT NULL, /* 비밀번호 */
	mname VARCHAR2(100 CHAR) NOT NULL, /* 이름 */
	birthDate DATE NOT NULL, /* 생년월일 */
	gender VARCHAR2(1) DEFAULT 'M', /* 성별 */
	phone VARCHAR2(20), /* 전화번호 */
	entranceDate DATE DEFAULT SYSDATE NOT NULL, /* 가입일 */
	lastLoginDate DATE, /* 마지막 로그인일 */
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

COMMENT ON COLUMN member.lastLoginDate IS '마지막 로그인일';

COMMENT ON COLUMN member.passModifyDate IS '비밀번호 수정일';

COMMENT ON COLUMN member.loginLv IS '멤버 레벨';

COMMENT ON COLUMN member.memberMeta IS '멤버메타데이터';

CREATE UNIQUE INDEX UIX_member
	ON member (
		email ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			mid
		);

ALTER TABLE member
	ADD
		CONSTRAINT UK_email
		UNIQUE (
			email
		);

ALTER TABLE member
	ADD
		CONSTRAINT CK_mbrmeta
		CHECK (<지정 되지 않음>);

/* 공지사항테이블 */
CREATE TABLE notice (
	noticeid NUMBER NOT NULL, /* 공지사항ID */
	admEmail VARCHAR2(255) NOT NULL, /* 작성자 이메일 */
	noticeTitle VARCHAR2(255) NOT NULL, /* 공지사항 제목 */
	noticeContent VARCHAR2(4000 CHAR) NOT NULL, /* 공지사항 내용 */
	fileName VARCHAR2(255), /* 첨부파일 */
	noticeDate DATE NOT NULL, /* 공지사항 날짜 */
	noticeCount NUMBER NOT NULL /* 공지사항 조회수 */
);

COMMENT ON TABLE notice IS '공지사항테이블';

COMMENT ON COLUMN notice.noticeid IS '공지사항ID';

COMMENT ON COLUMN notice.admEmail IS '작성자 이메일';

COMMENT ON COLUMN notice.noticeTitle IS '공지사항 제목';

COMMENT ON COLUMN notice.noticeContent IS '공지사항 내용';

COMMENT ON COLUMN notice.fileName IS '첨부파일';

COMMENT ON COLUMN notice.noticeDate IS '공지사항 날짜';

COMMENT ON COLUMN notice.noticeCount IS '공지사항 조회수';

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			noticeid,
			admEmail
		);

/* 태그 연결 테이블 */
CREATE TABLE tag (
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* trail ID */
	tagName VARCHAR2(20 CHAR) NOT NULL /* 태그네임 */
);

COMMENT ON TABLE tag IS '태그 연결 테이블';

COMMENT ON COLUMN tag.trailId IS 'trail ID';

COMMENT ON COLUMN tag.tagName IS '태그네임';

ALTER TABLE tag
	ADD
		CONSTRAINT PK_tag
		PRIMARY KEY (
			trailId,
			tagName
		);

/* 팔로우 상태 */
CREATE TABLE follow (
	mid raw(16) DEFAULT sys_guid() NOT NULL, /* 팔로이 */
	mid2 raw(16) DEFAULT sys_guid() NOT NULL, /* 팔로워 */
	followYN VARCHAR2(1) NOT NULL, /* 팔로우 상태 */
	followTime DATE DEFAULT SYSDATE NOT NULL /* 팔로우 한 시간 */
);

COMMENT ON TABLE follow IS '팔로우 상태';

COMMENT ON COLUMN follow.mid IS '팔로이';

COMMENT ON COLUMN follow.mid2 IS '팔로워';

COMMENT ON COLUMN follow.followYN IS '팔로우 상태';

COMMENT ON COLUMN follow.followTime IS '팔로우 한 시간';

ALTER TABLE follow
	ADD
		CONSTRAINT PK_follow
		PRIMARY KEY (
			mid,
			mid2
		);

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

ALTER TABLE good
	ADD
		CONSTRAINT PK_good
		PRIMARY KEY (
			mid,
			trailId
		);

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

ALTER TABLE book
	ADD
		CONSTRAINT PK_book
		PRIMARY KEY (
			mid,
			trailId
		);

/* 관리자 테이블 */
CREATE TABLE adm (
	admEmail VARCHAR2(255) NOT NULL, /* 관리자 이메일 */
	admPwd VARCHAR2(100 BYTE) NOT NULL, /* 관리자 비밀번호 */
	admLv NUMBER NOT NULL /* 관리자 레벨 */
);

COMMENT ON TABLE adm IS '관리자 테이블';

COMMENT ON COLUMN adm.admEmail IS '관리자 이메일';

COMMENT ON COLUMN adm.admPwd IS '관리자 비밀번호';

COMMENT ON COLUMN adm.admLv IS '관리자 레벨';

ALTER TABLE adm
	ADD
		CONSTRAINT PK_adm
		PRIMARY KEY (
			admEmail
		);

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

ALTER TABLE msg
	ADD
		CONSTRAINT PK_msg
		PRIMARY KEY (
			msgId
		);

/* 태그ID 테이블 */
CREATE TABLE tagId (
	tagName VARCHAR2(20 CHAR) NOT NULL, /* 태그네임 */
	tagDate DATE NOT NULL, /* 태그생성시간 */
	tagMeta CLOB /* tag메타 */
);

COMMENT ON TABLE tagId IS '태그ID 테이블';

COMMENT ON COLUMN tagId.tagName IS '태그네임';

COMMENT ON COLUMN tagId.tagDate IS '태그생성시간';

COMMENT ON COLUMN tagId.tagMeta IS 'tag메타';

ALTER TABLE tagId
	ADD
		CONSTRAINT PK_tagId
		PRIMARY KEY (
			tagName
		);

/* Trail Thread */
CREATE TABLE thread (
	trailId raw(16) DEFAULT sys_guid() NOT NULL, /* 본trail 번호 */
	threadId raw(16) DEFAULT sys_guid() NOT NULL, /* trail 스레드 번호 */
	threadDate DATE DEFAULT SYSDATE NOT NULL /* 관계 생성시간 */
);

COMMENT ON TABLE thread IS 'Trail Thread';

COMMENT ON COLUMN thread.trailId IS '본trail 번호';

COMMENT ON COLUMN thread.threadId IS 'trail 스레드 번호';

COMMENT ON COLUMN thread.threadDate IS '관계 생성시간';

ALTER TABLE trail
	ADD
		CONSTRAINT FK_member_TO_trail
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE cmt
	ADD
		CONSTRAINT FK_trail_TO_cmt
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		);

ALTER TABLE cmt
	ADD
		CONSTRAINT FK_member_TO_cmt
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_adm_TO_notice
		FOREIGN KEY (
			admEmail
		)
		REFERENCES adm (
			admEmail
		);

ALTER TABLE tag
	ADD
		CONSTRAINT FK_trail_TO_tag
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		);

ALTER TABLE tag
	ADD
		CONSTRAINT FK_tagId_TO_tag
		FOREIGN KEY (
			tagName
		)
		REFERENCES tagId (
			tagName
		);

ALTER TABLE follow
	ADD
		CONSTRAINT FK_member_TO_follow
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE follow
	ADD
		CONSTRAINT FK_member_TO_follow2
		FOREIGN KEY (
			mid2
		)
		REFERENCES member (
			mid
		);

ALTER TABLE good
	ADD
		CONSTRAINT FK_member_TO_good
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE good
	ADD
		CONSTRAINT FK_trail_TO_good
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_member_TO_book
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_trail_TO_book
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		);

ALTER TABLE msg
	ADD
		CONSTRAINT FK_member_TO_msg
		FOREIGN KEY (
			rcvmid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE msg
	ADD
		CONSTRAINT FK_member_TO_msg2
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE thread
	ADD
		CONSTRAINT FK_trail_TO_thread
		FOREIGN KEY (
			threadId
		)
		REFERENCES trail (
			trailId
		);

ALTER TABLE thread
	ADD
		CONSTRAINT FK_trail_TO_thread2
		FOREIGN KEY (
			trailId
		)
		REFERENCES trail (
			trailId
		);
        
ALTER TABLE member
   ADD
      CONSTRAINT JSON_mbrMeta
      CHECK (memberMeta IS JSON);

ALTER TABLE trail
   ADD
      CONSTRAINT JSON_trail
      CHECK (trailJson IS JSON);

ALTER TABLE trail
   ADD
      CONSTRAINT JSON_trailMeta
      CHECK (trailMeta IS JSON);

ALTER TABLE tagid
   ADD
      CONSTRAINT JSON_tagMeta
      CHECK (tagMeta IS JSON);



COMMIT;