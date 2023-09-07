update member set profilepic = null; 
update member set pwd = '1';

commit;

select * from member where email = 'ab@ab.com';

select * from member where mid = '36AE1E656FFB4B5FB9F01A77702A7B4C';

select * from trail where mid = '36AE1E656FFB4B5FB9F01A77702A7B4C';

select * from member where email = 'ab@ab.com';

delete from trail where mid = '36AE1E656FFB4B5FB9F01A77702A7B4C' and trailcount > 0;

commit;

