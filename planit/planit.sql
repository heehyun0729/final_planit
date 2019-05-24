-- 계정 만들기(cmd)

sqlplus system/java1234

create user planit identified by admin1234;

grant resource, connect to planit;

conn planit/admin1234;





-- 테이블 생성(sqlplus)