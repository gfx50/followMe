select * from trail where TRAILID = 'D67226B731364662ACCDAE97EBF85300';

select * from trail where TRAILID = '58CB00123FDE43C6A339BBF6F33346BD';

update trail set trailjson = '{"trailUtc":"2023-09-04T06:34:01.980Z","trailId":"4531e3cb42a246fa9e13affa1e22188d","trailPhotos":[{"altitude":78.354,"originTime":"2023:09:04 09:20:06","originFileName":"20230904_092006.jpg","photoId":"t_b4a10d53e363494b86cb09e6d51d906e","latDec":51.491471,"lonDec":-0.118239},{"altitude":63.866,"originTime":"2023:09:04 09:20:20","originFileName":"20230904_092020.jpg","photoId":"t_bbe89c9972ca41e2980fb3f57a98edce","latDec":51.491080,"lonDec":-0.117381},{"altitude":73.385,"originTime":"2023:09:04 09:20:49","originFileName":"20230904_092049.jpg","photoId":"t_d7db12e23c354e1e890996a700200a95","latDec":51.491174,"lonDec":-0.115664},{"altitude":86.841,"originTime":"2023:09:04 09:21:05","originFileName":"20230904_092105.jpg","photoId":"t_eb0ee9c3aef84a2b885a42e0cef0c163","latDec":51.491441,"lonDec":-0.114516},{"altitude":90.214,"originTime":"2023:09:04 09:21:23","originFileName":"20230904_092123.jpg","photoId":"t_d84968fb483845eda2629bdffb1be404","latDec":51.490172,"lonDec":-0.117220}],"nonTrailPhotos":[],"mId":"36AE1E656FFB4B5FB9F01A77702A7B4C","trailType":"trail.0.5","title":"","body":{},"mapProvider":"Google"}';
commit;

select commentsid , trailid, comments.mid , commentscontent, commentstype, commentstime, commentsreportyn, nickname from comments join member on comments.mid = member.mid where trailid = '608B38CD83E3445EA1D0C47D764F066A';

select * from comments where commentsid = 'CF23E0C701774881B34A073CA34FEDBA';

select sysdate from dual;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS') FROM DUAL;

SELECT j.originFileName FROM trail,JSON_TABLE(trail.trailjson,'$.trailPhotos[*]'COLUMNS(originFileName PATH '$.originFileName')) j where trailId = '08694B5488FD490EBBA796A65C2D4FDA'
UNION
SELECT j.originFileName FROM trail,JSON_TABLE(trail.trailjson,'$.nonTrailPhotos[*]'COLUMNS(originFileName PATH '$.originFileName')) j where trailId = '08694B5488FD490EBBA796A65C2D4FDA';
insert into tagid values ('제발2', sysdate, default);
insert into tagid values ('다시2', sysdate, '{}');

insert into tagid (TAGNAME, TAGDATE) values ('한번', sysdate);

select * from member where birthdate = to_date('1904/04/28','YYYY/MM/dd');

update member set pwd = 'MQ==';