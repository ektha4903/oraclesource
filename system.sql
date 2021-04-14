select * from all_users;

-- hr 사용자의 계정을 풀고 비밀번호를 hr로 지정
ALTER USER hr IDENTIFIED BY hr account unlock;

--shop 생성(스키마 생성)
CREATE USER shop IDENTIFIED BY 12345;
--권한 부여
GRANT CONNECT,RESOURCE TO shop;