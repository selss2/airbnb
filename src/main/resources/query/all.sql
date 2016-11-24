-- review
DROP TABLE IF EXISTS review RESTRICT;
-- payment
DROP TABLE IF EXISTS payment RESTRICT;
-- Guide_Category
DROP TABLE IF EXISTS guide_category RESTRICT;
-- block
DROP TABLE IF EXISTS block RESTRICT;
-- address
DROP TABLE IF EXISTS address RESTRICT;
-- reservation
DROP TABLE IF EXISTS reservation RESTRICT;
-- houses
DROP TABLE IF EXISTS houses RESTRICT;
-- building
DROP TABLE IF EXISTS building RESTRICT;
-- member
DROP TABLE IF EXISTS member RESTRICT;

-- guide_view
DROP VIEW IF EXISTS Guide_view RESTRICT;
-- houses_view
DROP VIEW IF EXISTS houses_view RESTRICT;
-- resv_view
DROP VIEW IF EXISTS resv_view RESTRICT;


   
-- member
CREATE TABLE member (
   email      VARCHAR(50) NOT NULL, -- email
   pw         VARCHAR(30) NOT NULL, -- pw
   name       VARCHAR(20) NOT NULL, -- name
   phone      VARCHAR(15) NOT NULL, -- phone
   profileImg VARCHAR(40) NULL,     -- profileImg
   reg_date   DATE        NULL,     -- reg_date
   ssn        VARCHAR(15) NULL      -- ssn
   
)default character set utf8 collate utf8_general_ci;

-- member
ALTER TABLE member
   ADD CONSTRAINT PK_member -- member 기본키
      PRIMARY KEY (
         email -- email
      );
insert into member( email, pw, name, phone , profileImg, reg_date, ssn) values ('t@naver.com','1','테스터','01011111111','default.jpg','2016-12-18','111111');
insert into member( email, pw, name, phone , profileImg, reg_date, ssn) values ('admin','1','관리자','01011111112','default.jpg','2016-12-18','111112');


-- building
CREATE TABLE building (
   building_seq INT         NOT NULL, -- 집 유형(아파트,단독주택 등)_seq
   type         VARCHAR(20) NULL      -- 집 유형(아파트,단독주택 등)
   
)default character set utf8 collate utf8_general_ci;


-- building
ALTER TABLE building
   ADD CONSTRAINT PK_building -- building 기본키
      PRIMARY KEY (
         building_seq -- 집 유형(아파트,단독주택 등)_seq
      );

ALTER TABLE building
   MODIFY COLUMN building_seq INT NOT NULL AUTO_INCREMENT;


-- houses
CREATE TABLE houses (
   house_seq    INT          NOT NULL, -- house_seq
   room_type    VARCHAR(10)  NOT NULL, -- 방 유형
   guest_cnt    INT          NOT NULL, -- 손님수
   bed_cnt      INT          NULL,     -- 침대수
   bathroom_cnt INT          NULL,     -- 욕실 수
   picture      VARCHAR(40)  NULL,     -- picture
   explaination TEXT         NULL,     -- explaination
   title        VARCHAR(50)  NULL,     -- title
   other_rule   VARCHAR(100) NULL,     -- 입력하는 룰
   checkin_term INT          NULL,     -- 체크인 가능 날짜
   checkin_time VARCHAR(15)  NULL,     -- 체크인 가능 시간
   min_nights   INT          NULL,     -- 최소숙박가능 일수
   max_nights   INT          NULL,     -- max_nights
   price        INT          NULL,     -- price
   reg_date     DATE         NULL,     -- reg_date
   rules        VARCHAR(20)  NULL,     -- T/F로 입력하는 룰
   convenience  VARCHAR(30)  NULL,     -- 편의시설
   safety_fac   VARCHAR(20)  NULL,     -- 안전 시설
   space        VARCHAR(20)  NULL,     -- 공간(빨래방,공부방 etc..)
   email        VARCHAR(50)  NOT NULL, -- email
   building_seq INT          NULL      -- 집 유형(아파트,단독주택 등)_seq
   
)default character set utf8 collate utf8_general_ci;

-- houses
ALTER TABLE houses
   ADD CONSTRAINT PK_houses -- houses 기본키
      PRIMARY KEY (
         house_seq -- house_seq
      );

ALTER TABLE houses
   MODIFY COLUMN house_seq INT NOT NULL AUTO_INCREMENT;

-- reservation
CREATE TABLE reservation (
   resv_seq      INT         NOT NULL, -- resv_seq
   checkin_date  DATETIME    NOT NULL, -- checkin_date
   checkout_date DATETIME    NOT NULL, -- checkout_date
   guest_cnt     INT         NOT NULL, -- guest_cnt
   house_seq     INT         NULL,     -- house_seq
   email         VARCHAR(50) NULL      -- email
   
)default character set utf8 collate utf8_general_ci;


-- reservation
ALTER TABLE reservation
   ADD CONSTRAINT PK_reservation -- reservation 기본키
      PRIMARY KEY (
         resv_seq -- resv_seq
      );

ALTER TABLE reservation
   MODIFY COLUMN resv_seq INT NOT NULL AUTO_INCREMENT;



-- address
CREATE TABLE address (
   address_seq INT          NOT NULL, -- 주소_seq
   country     VARCHAR(20)  NULL,     -- 국가
   state       VARCHAR(50)  NULL,     -- 주
   city        VARCHAR(50)  NULL,     -- 도시
   street      VARCHAR(100) NULL,     -- 가
   optional    VARCHAR(100) NULL,     -- 이하주소
   zip_code    VARCHAR(15)  NULL,     -- 우편번호
   latitude    VARCHAR(30)  NULL,     -- 위도
   longitude   VARCHAR(30)  NULL,     -- 경도
   house_seq   INT          NULL      -- house_seq
   
)default character set utf8 collate utf8_general_ci;

-- address
ALTER TABLE address
   ADD CONSTRAINT PK_address -- address 기본키
      PRIMARY KEY (
         address_seq -- 주소_seq
      );

ALTER TABLE address
   MODIFY COLUMN address_seq INT NOT NULL AUTO_INCREMENT;
   

-- block
CREATE TABLE block (
   block_seq  INT  NOT NULL, -- 이용 불가능 날짜 설정
   block_date DATE NULL,     -- block_date
   house_seq  INT  NULL      -- house_seq

)default character set utf8 collate utf8_general_ci;

-- block
ALTER TABLE block
   ADD CONSTRAINT PK_block -- block 기본키
      PRIMARY KEY (
         block_seq -- 이용 불가능 날짜 설정
      );

ALTER TABLE block
   MODIFY COLUMN block_seq INT NOT NULL AUTO_INCREMENT;


-- Guide_Category
CREATE TABLE guide_category (
     Guide_seq      INT         NOT NULL, -- 상위카테고리_seq
     place          VARCHAR(50) NOT NULL,     -- 도시위치
     Lat          VARCHAR(50) NOT NULL,
     Lng            VARCHAR(50) NOT NULL,
     Major_Category VARCHAR(20) NOT NULL,     -- Major_Category
     Minor_category VARCHAR(15)  NOT NULL, -- Minor_Category
     Host_Comment   VARCHAR(350) NULL,     -- Host_Comment
     email          VARCHAR(50) NOT NULL  -- email
    
)default character set utf8 collate utf8_general_ci;


ALTER TABLE guide_category
     ADD CONSTRAINT PK_guide_category -- Guide_seq 기본키
          PRIMARY KEY (
              Guide_seq -- 상위카테고리_seq
          );

ALTER TABLE guide_category
     MODIFY COLUMN Guide_seq INT NOT NULL AUTO_INCREMENT;

     ALTER TABLE guide_category
   ADD CONSTRAINT FK_member_TO_guide_category -- member -> guide_category
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      )
      ON DELETE CASCADE;
   

-- payment
CREATE TABLE payment (
   payment_seq  INT         NOT NULL, -- payment_seq
   card_num     VARCHAR(20) NOT NULL, -- card_num
   price        INT         NOT NULL, -- price
   payment_date DATE        NOT NULL, -- payment_date
   resv_seq     INT         NOT NULL  -- resv_seq
   
)default character set utf8 collate utf8_general_ci;

-- payment
ALTER TABLE payment
   ADD CONSTRAINT PK_payment -- payment 기본키
      PRIMARY KEY (
         payment_seq -- payment_seq
      );

ALTER TABLE payment
   MODIFY COLUMN payment_seq INT NOT NULL AUTO_INCREMENT;
   




-- review
CREATE TABLE review (
   review_seq INT         NOT NULL, -- review_seq
   gpa        INT         NULL,     -- gpa
   content    TEXT        NULL,     -- content
   reg_date   DATE        NULL,     -- reg_date
   house_seq  INT         NULL,     -- house_seq
   email      VARCHAR(50) NULL      -- email

)default character set utf8 collate utf8_general_ci;

-- review
ALTER TABLE review
   ADD CONSTRAINT PK_review -- review 기본키
      PRIMARY KEY (
         review_seq -- review_seq
      );

ALTER TABLE review
   MODIFY COLUMN review_seq INT NOT NULL AUTO_INCREMENT;

-- houses
ALTER TABLE houses
   ADD CONSTRAINT FK_member_TO_houses -- member -> houses
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      )
      ON DELETE CASCADE;

-- houses
ALTER TABLE houses
   ADD CONSTRAINT FK_building_TO_houses -- building -> houses
      FOREIGN KEY (
         building_seq -- 집 유형(아파트,단독주택 등)_seq
      )
      REFERENCES building ( -- building
         building_seq -- 집 유형(아파트,단독주택 등)_seq
      )
      ON DELETE CASCADE;

-- address
ALTER TABLE address
   ADD CONSTRAINT FK_houses_TO_address -- houses -> address
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      );

-- block
ALTER TABLE block
   ADD CONSTRAINT FK_houses_TO_block -- houses -> block
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      );

-- reservation
ALTER TABLE reservation
   ADD CONSTRAINT FK_houses_TO_reservation -- houses -> reservation
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      )
      ON DELETE SET NULL;

-- reservation
ALTER TABLE reservation
   ADD CONSTRAINT FK_member_TO_reservation -- member -> reservation
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      )
      ON DELETE SET NULL;

-- payment
ALTER TABLE payment
   ADD CONSTRAINT FK_reservation_TO_payment -- reservation -> payment
      FOREIGN KEY (
         resv_seq -- resv_seq
      )
      REFERENCES reservation ( -- reservation
         resv_seq -- resv_seq
      )
      ON DELETE CASCADE;


-- review
ALTER TABLE review
   ADD CONSTRAINT FK_houses_TO_review -- houses -> review
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      )
      ON DELETE CASCADE;

-- review
ALTER TABLE review
   ADD CONSTRAINT FK_member_TO_review -- member -> review
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      )
      ON DELETE CASCADE;
      
      

      
--view
CREATE OR REPLACE VIEW houses_view
AS
SELECT H.house_seq,room_type,guest_cnt,bed_cnt,bathroom_cnt,picture,explaination,title,other_rule,checkin_term,checkin_time,min_nights,max_nights,
      price,reg_date,rules,convenience,safety_fac,space,email,type,country,state,city,street,optional,zip_code,latitude,longitude
FROM houses H JOIN building B ON H.building_seq = B.building_seq JOIN address A ON H.house_seq = A.house_seq;
        
CREATE OR REPLACE VIEW Guide_view
AS
SELECT
     G.Place AS Place,
     G.Major_Category AS Major_Category,
     G.Minor_Category AS Minor_Category,
     G.Host_Comment AS Host_Comment,
     G.Lat AS Lat,
     G.Lng AS Lng
FROM guide_category G
WHERE G.Guide_seq;

CREATE OR REPLACE VIEW resv_view
as
SELECT r.resv_seq as resvSeq, checkin_date as checkinDate, checkout_date as checkoutDate,guest_cnt as guestCnt
  ,r.house_seq as houseSeq,email,payment_seq as paymentSeq, card_num as cardNum,price,payment_date as paymentDate, state
  FROM reservation r join address a on r.house_seq = a.house_seq join payment p on r.resv_seq = p.resv_seq; 
  
  /*
=============== META_GROUP ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-10-25
@UPDATE DATE: 2016-10-25
@DESC :procedure mysql Airbnb
=============== MEMBER ===============
*/
--- DEF_COUNT_MEMBER     
show procedure status;
DELIMITER //
DROP PROCEDURE IF EXISTS mcount //
CREATE PROCEDURE mcount()
BEGIN
SELECT COUNT(*) count FROM member;
END//
DELIMITER ;
--EXE_COUNT_MEMBER
call mcount();

---DEF LIST MEMBER 
DROP PROCEDURE IF EXISTS mlist ;
CREATE PROCEDURE mlist()
BEGIN
  SELECT
  m.email email,
  m.name name,
  m.phone phone,
  m.profileImg profileImg,
  m.reg_date regDate
  from member m order by reg_date desc;
   END;
--EXE_LIST_MEMBER
   call mlist();
   
---DEF CHART MEMBER  월별회원 가입수 
DROP PROCEDURE IF EXISTS mchart ;
CREATE PROCEDURE mchart()
begin
   SELECT DATE_FORMAT(reg_date,'%2016-%m') mchart_month, COUNT(*) mchart_count
      from   member
      GROUP BY mchart_month;
end;
--EXE_CHART_MEMBER
call mchart;
/*
=============== META_GROUP ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-10-25
@UPDATE DATE: 2016-10-25
@DESC :procedure mysql Airbnb
=============== HOUSES ===============
*/
--- houses housting count   
DELIMITER //
DROP PROCEDURE IF EXISTS hcount //
CREATE PROCEDURE hcount()
BEGIN
SELECT COUNT(*) count FROM houses ;
END//
DELIMITER ;
--EXE_COUNT_HOUSES
call hcount();

--- houses list 
DROP PROCEDURE IF EXISTS hlist ;
CREATE PROCEDURE hlist()
BEGIN
  SELECT
  h.house_seq houseSeq,
  h.room_type roomType,
  h.title title,
  h.max_nights maxNights,
  h.price price,
  h.email email,
  h.building_seq buildingSeq,
  h.reg_date regDate
  from houses h order by reg_date desc;
   END;
--EXE_LIST_HOUSES
   call hlist();
  /* --- houses chart list 월별회원 가입수 */
DROP PROCEDURE IF EXISTS hchart ;
CREATE PROCEDURE hchart()
begin
   SELECT DATE_FORMAT(reg_date,'%2016-%m') hchart_month, COUNT(*) hchart_count
      from   houses
      GROUP BY hchart_month;
end;
--EXE_CHART_HOUSES
call hchart;
/*
=============== META_GROUP ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-10-25
@UPDATE DATE: 2016-10-25
@DESC :procedure mysql Airbnb
=============== RESERVATION ===============
*/
--- reservation housing count 
DELIMITER //
DROP PROCEDURE IF EXISTS rcount //
CREATE PROCEDURE rcount()
BEGIN
SELECT COUNT(*) count FROM reservation ;
END//
DELIMITER ;
--EXE_COUNT_RESERVATION
call rcount();
--- reservation list 
DROP PROCEDURE IF EXISTS rlist ;
CREATE PROCEDURE rlist()
BEGIN
  SELECT
  r.resv_seq resvSeq,
  r.checkin_date checkinDate,
  r.checkout_date checkoutDate,
  r.guest_cnt guestCnt,
  r.house_seq houseSeq,
  r.email email 
  from reservation r order by checkin_date desc;
   END;
--EXE_LIST_RESERVATION
   call rlist();
--- reservation Rchart list 월별 예약 가입수 
DROP PROCEDURE IF EXISTS rchart ;
CREATE PROCEDURE rchart()
begin
   SELECT DATE_FORMAT(checkin_date,'%2016-%m') rchart_month, COUNT(*) rchart_count
      from   reservation
      GROUP BY rchart_month;
end;
--EXE_CHART_RESERVATION
call rchart;


/*
=============== META_GROUP ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-10-25
@UPDATE DATE: 2016-10-25
@DESC :procedure mysql Airbnb
=============== GUIDE ===============
*/   
--DEF_COUNT_GUIDE
DELIMITER //
DROP PROCEDURE IF EXISTS gcount ;//
CREATE PROCEDURE gcount()
BEGIN
SELECT COUNT(*) count FROM Guide_view;
END//
DELIMITER ;
--EXE_COUNT_GUIDE
call gcount;
/* =================Booking=================== */
DROP PROCEDURE IF EXISTS sp_house_cnt;
CREATE PROCEDURE sp_house_cnt(
   IN in_country VARCHAR(30),
   IN in_state VARCHAR(200),
   IN in_city VARCHAR(200),
   IN in_street VARCHAR(200),
   IN in_checkin VARCHAR(30),
   IN in_checkout VARCHAR(30),
   IN in_nights INT,
   IN in_guestCnt INT,
   IN in_roomType INT,
   IN in_minprice INT,
   IN in_maxprice INT,
   IN in_bedCnt INT,
   IN in_bathroomCnt INT,
   IN in_convenience VARCHAR(30),
   IN in_safetyFac VARCHAR(30)
)
BEGIN
    SET @country = in_country;
    SET @state = in_state;
    SET @city = in_city;
    SET @street = in_street;
    SET @check_in = in_checkin;
    SET @check_out = in_checkout;
    SET @nights = in_nights;
    SET @guest_cnt = in_guestCnt;
    SET @room_type = in_roomType;
    SET @min_price = in_minprice;
    SET @max_price = in_maxprice;
    SET @bed_cnt = in_bedCnt;
    SET @bath_cnt = in_bathroomCnt;
    SET @conven = in_convenience;
    SET @safety_fac = in_safetyFac;
    SET @sql = 'SELECT count(*) as count FROM houses_view WHERE country = @country';
    IF (@state != "NONE") THEN
      SET @sql = CONCAT(@sql,' AND FIND_IN_SET(state,@state)');
    END IF;
    IF (@city != "NONE") THEN
      SET @SQL = CONCAT(@SQL,' AND FIND_IN_SET(city,@city)');
    END IF;
    IF (@street != "NONE") THEN
      SET @SQL = CONCAT(@SQL,'AND FIND_IN_SET(street,@street)');
    END IF;
    
    SET @SQL = CONCAT(@SQL,' AND DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL checkin_term DAY), "%Y/%m/%d") <= STR_TO_DATE(@CHECK_IN, "%Y/%m/%d")');
    SET @SQL = CONCAT(@SQL,' AND house_seq not in (SELECT house_seq FROM block WHERE block_date between STR_TO_DATE(@CHECK_IN, "%Y/%m/%d") AND STR_TO_DATE(@check_out, "%Y/%m/%d"))');
    SET @SQL = CONCAT(@SQL,' AND house_seq not in (SELECT house_seq FROM reservation WHERE STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s") BETWEEN checkin_date AND checkout_date');
    SET @SQL = CONCAT(@SQL,' OR STR_TO_DATE(@check_out, "%Y/%m/%d %H:%i:%s") BETWEEN checkin_date AND checkout_date');
    SET @SQL = CONCAT(@SQL,' OR (STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s") < checkin_date AND  STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s") > checkout_date))');
    SET @SQL = CONCAT(@SQL,' AND min_nights <= @nights and max_nights >= @nights');
    SET @SQL = CONCAT(@SQL,' AND guest_cnt >= @guest_cnt');
    
    IF in_roomType%2=1 THEN
      SET @SQL = CONCAT(@SQL,' AND (room_type = "집전체"');
      IF in_roomType=3 or in_roomType=7 THEN
        SET @SQL = CONCAT(@SQL,' OR room_type = "개인실"');
      END IF;
      IF in_roomType > 4 THEN
        SET @SQL = CONCAT(@SQL,' OR room_type = "다인실"');
      END IF;
      SET @SQL = CONCAT(@SQL,')');
    ELSE 
      IF in_roomType=2 THEN
        SET @SQL = CONCAT(@SQL,' AND room_type ="개인실"');
      END IF;
      IF in_roomType=4 THEN
        SET @SQL = CONCAT(@SQL,' AND room_type ="다인실"');
      END IF;
      IF in_roomType=6 THEN
        SET @SQL = CONCAT(@SQL,' AND (room_type ="개인실" OR room_type ="다인실")');
      END IF;
    END IF;
    
    IF (@min_price !=0 AND @max_price !=0) THEN
      SET @SQL = CONCAT(@SQL,' AND price*@nights BETWEEN @min_price AND @max_price');
    END IF;
    IF (@min_price=0 AND @max_price!=0) THEN
      SET @SQL = CONCAT(@SQL,' AND price*@nights <= @max_price');
    END IF;
     IF (@min_price!=0 AND @max_price=0) THEN
      SET @SQL = CONCAT(@SQL,' AND price*@nights >= @min_price');
    END IF;
    IF(@bed_cnt > 0) THEN
      SET @SQL = CONCAT(@SQL,' AND bed_cnt = @bed_cnt');
    END IF;
    IF(@bath_cnt > 0) THEN
      SET @SQL = CONCAT(@SQL,' AND bathroom_cnt = @bath_cnt');
    END IF;
    IF(@conven != NULL) THEN
      SET @SQL = CONCAT(@SQL,' AND convenience like @conven');
    END IF;
    IF(@safety_fac != NULL) THEN
      SET @SQL = CONCAT(@SQL,' AND safety_fac like @safety_fac');
    END IF;
    PREPARE stmt FROM @SQL;
    EXECUTE stmt;
    DEALLOCATE  PREPARE stmt;
END;

CALL sp_house_cnt('대한민국','NONE','강남구,','NONE','2016/11/04','2016/11/06',3,2,2,0,0,0,0,'T-_-_-_-_-_-_-_-_-_-_-_-_','T-_-_-_-_-_');


DROP PROCEDURE IF EXISTS sp_house_list;
CREATE PROCEDURE sp_house_list(
   IN in_country VARCHAR(30),
   IN in_state VARCHAR(200),
   IN in_city VARCHAR(200),
   IN in_street VARCHAR(200),
   IN in_checkin VARCHAR(30),
   IN in_checkout VARCHAR(30),
   IN in_nights INT,
   IN in_guestCnt INT,
   IN in_roomType INT,
   IN in_minprice INT,
   IN in_maxprice INT,
   IN in_bedCnt INT,
   IN in_bathroomCnt INT,
   IN in_convenience VARCHAR(30),
   IN in_safetyFac VARCHAR(30),
   IN in_start INT,
   IN in_end INT
)
BEGIN
  SET @country = in_country;
  SET @state = in_state;
  SET @city = in_city;
  SET @street = in_street;
  SET @CHECK_IN = in_checkin;
  SET @check_out = in_checkout;
  SET @nights = in_nights;
  SET @guest_cnt = in_guestCnt;
  SET @ROOM_TYPE = in_roomType;
  SET @min_price = in_minprice;
  SET @max_price = in_maxprice;
  SET @bed_cnt = in_bedCnt;
  SET @bath_cnt = in_bathroomCnt;
  SET @conven = in_convenience;
  SET @safety_fac = in_safetyFac;
  SET @START = in_start;
  SET @END = in_end;
    
  SET @SQL = 'SELECT @RNUM := @RNUM +1 AS ROWNUM,h.* FROM (';
  SET @SQL = CONCAT(@SQL,'SELECT house_seq,room_type,guest_cnt,bed_cnt,bathroom_cnt,picture,explaination,title,other_rule,checkin_term,checkin_time,min_nights,max_nights,');
  SET @SQL = CONCAT(@SQL,'price*@nights as price,reg_date,rules,convenience,safety_fac,space,email,type,country,state,city,street,optional,zip_code,latitude,longitude');
  SET @SQL = CONCAT(@SQL,' FROM houses_view WHERE country = @country');
  IF (@state != "NONE") THEN
    SET @SQL = CONCAT(@SQL,' AND FIND_IN_SET(state,@state)');
  END IF;
  IF (@city != "NONE") THEN
    SET @SQL = CONCAT(@SQL,' AND FIND_IN_SET(city,@city)');
  END IF;
  IF (@street != "NONE") THEN
    SET @SQL = CONCAT(@SQL,'AND FIND_IN_SET(street,@street)');
  END IF;
    
  SET @SQL = CONCAT(@SQL,' AND DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL checkin_term DAY), "%Y/%m/%d") <= STR_TO_DATE(@CHECK_IN, "%Y/%m/%d")');
  SET @SQL = CONCAT(@SQL,' AND house_seq not in (SELECT house_seq FROM block WHERE block_date between STR_TO_DATE(@CHECK_IN, "%Y/%m/%d") AND STR_TO_DATE(@check_out, "%Y/%m/%d"))');
  SET @SQL = CONCAT(@SQL,' AND house_seq not in (SELECT house_seq FROM reservation WHERE STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s") BETWEEN checkin_date AND checkout_date');
  SET @SQL = CONCAT(@SQL,' OR STR_TO_DATE(@check_out, "%Y/%m/%d %H:%i:%s") BETWEEN checkin_date AND checkout_date');
  SET @SQL = CONCAT(@SQL,' OR (STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s") < checkin_date AND  STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s") > checkout_date))');
  SET @SQL = CONCAT(@SQL,' AND min_nights <= @nights and max_nights >= @nights');
  SET @SQL = CONCAT(@SQL,' AND guest_cnt >= @guest_cnt');
    
  IF in_roomType%2=1 THEN
    SET @SQL = CONCAT(@SQL,' AND (room_type = "집전체"');
    IF in_roomType=3 or in_roomType=7 THEN
      SET @SQL = CONCAT(@SQL,' OR room_type = "개인실"');
    END IF;
    IF in_roomType > 4 THEN
      SET @SQL = CONCAT(@SQL,' OR room_type = "다인실"');
    END IF;
    SET @SQL = CONCAT(@SQL,')');
  ELSE 
    IF in_roomType=2 THEN
      SET @SQL = CONCAT(@SQL,' AND room_type ="개인실"');
    END IF;
    IF in_roomType=4 THEN
      SET @SQL = CONCAT(@SQL,' AND room_type ="다인실"');
    END IF;
    IF in_roomType=6 THEN
      SET @SQL = CONCAT(@SQL,' AND (room_type ="개인실" OR room_type ="다인실")');
    END IF;
  END IF;
    
  IF (@min_price !=0 AND @max_price !=0) THEN
    SET @SQL = CONCAT(@SQL,' AND price*@nights BETWEEN @min_price AND @max_price');
  END IF;
  IF (@min_price=0 AND @max_price!=0) THEN
    SET @SQL = CONCAT(@SQL,' AND price*@nights <= @max_price');
  END IF;
   IF (@min_price!=0 AND @max_price=0) THEN
    SET @SQL = CONCAT(@SQL,' AND price*@nights >= @min_price');
  END IF;
  IF(@bed_cnt > 0) THEN
    SET @SQL = CONCAT(@SQL,' AND bed_cnt = @bed_cnt');
  END IF;
  IF(@bath_cnt > 0) THEN
    SET @SQL = CONCAT(@SQL,' AND bathroom_cnt = @bath_cnt');
  END IF;
  IF(@conven != NULL) THEN
    SET @SQL = CONCAT(@SQL,' AND convenience like @conven');
  END IF;
  IF(@safety_fac != NULL) THEN
    SET @SQL = CONCAT(@SQL,' AND safety_fac like @safety_fac');
  END IF;
  SET @SQL = CONCAT(@SQL,') h, (SELECT @RNUM :=0 )R LIMIT ?,?');
  
  PREPARE stmt FROM @SQL;
  EXECUTE stmt USING @START,@END;
  DEALLOCATE  PREPARE stmt;
END;

CALL sp_house_list('대한민국','NONE','강남구,','NONE','2016/11/04','2016/11/06',3,2,2,0,0,0,0,'T-_-_-_-_-_-_-_-_-_-_-_-_','T-_-_-_-_-_',0,5);

DROP PROCEDURE IF EXISTS sp_addr_list;
CREATE PROCEDURE sp_addr_list(
   IN in_country VARCHAR(30),
   IN in_state VARCHAR(200),
   IN in_city VARCHAR(200),
   IN in_street VARCHAR(200),
   IN in_addrDepth INT
)
BEGIN
  SET @country = in_country;
  SET @state = in_state;
  SET @city = in_city;
  SET @street = in_street;
  SET @addr_Depth= in_addrDepth;

  IF (@ADDR_DEPTH=1) THEN
    SET @SQL = 'SELECT DISTINCT state FROM address WHERE country = @country';
  ELSEIF(@ADDR_DEPTH=2) THEN
    SET @SQL = 'SELECT DISTINCT city FROM address WHERE FIND_IN_SET(state,@state)';
  ELSEIF(@ADDR_DEPTH=3) THEN
    SET @SQL = 'SELECT DISTINCT street FROM address WHERE FIND_IN_SET(city,@city)';
  ELSE
    SET @SQL ='SELECT DISTINCT street FROM address WHERE FIND_IN_SET(street,@street)';
  END IF;
  PREPARE stmt FROM @SQL;
  EXECUTE stmt;
  DEALLOCATE  PREPARE stmt;
END;

CALL sp_addr_list('대한민국','서울특별시','강남구,은평구','언주로 406',4);

DROP PROCEDURE IF EXISTS sp_insert_resv;
CREATE PROCEDURE sp_insert_resv(
  IN in_checkin VARCHAR(30),
  IN in_checkout VARCHAR(30),
  IN in_guest_cnt INT,
  IN in_house_seq INT,
  IN in_email VARCHAR(100),
  IN in_card_num VARCHAR(20),
  IN in_price INT
)
BEGIN
  SET @CHECK_IN = in_checkin;
  SET @check_out = in_checkout;
  SET @guest_cnt = in_guest_cnt;
  SET @house_seq = in_house_seq;
  SET @email = in_email;
  SET @card_num = in_card_num;
  SET @price = in_price;
  PREPARE stmt FROM 'INSERT INTO reservation(checkin_date,checkout_date,guest_cnt,house_seq,email) VALUES(STR_TO_DATE(@CHECK_IN, "%Y/%m/%d %H:%i:%s"), STR_TO_DATE(@check_out, "%Y/%m/%d %H:%i:%s"),@guest_cnt,@house_seq,@email)';
  EXECUTE stmt;
  PREPARE stmt FROM 'INSERT INTO payment(card_num,price,payment_date,resv_seq) VALUES(@card_num,@price,CURDATE(), LAST_INSERT_ID())';
  EXECUTE stmt;
  DEALLOCATE  PREPARE stmt;
END;

CALL sp_insert_resv('2016/12/02 15:00:00','2016/12/05 10:00:00',2,1,'t@naver.com','1111-2222-3333-4444',150000);

DROP PROCEDURE IF EXISTS sp_delete_resv;
CREATE PROCEDURE sp_delete_resv(
  IN in_resv_seq INT  
)
BEGIN
  DELETE FROM payment WHERE resv_seq = in_resv_seq;
  DELETE FROM reservation WHERE resv_seq = in_resv_seq;
END;

CALL sp_delete_resv(15);

DROP PROCEDURE IF EXISTS sp_find_host;
CREATE PROCEDURE sp_find_host(
  IN in_house_seq INT
)
BEGIN
  SELECT email,pw,name,phone,profileImg,reg_date as regDate,ssn
  FROM member 
  WHERE email = (SELECT email FROM houses WHERE house_seq = in_house_seq);
END;

CALL sp_find_host(12);

DROP PROCEDURE IF EXISTS sp_find_resv;
CREATE PROCEDURE sp_find_resv(
  IN in_resv_seq INT
)
BEGIN
  SELECT * FROM resv_view WHERE resvSeq = in_resv_seq;
END;

call sp_find_resv(14);

DROP PROCEDURE IF EXISTS G_insert;
CREATE PROCEDURE G_insert(
   IN gin_Guide_seq      INT ,
    IN gin_place          VARCHAR(50),
    IN gin_Lat          VARCHAR(50),
    IN gin_Lng            VARCHAR(50),
    IN gin_Major_Category VARCHAR(20),
    IN gin_Minor_category VARCHAR(15),
    IN gin_Host_Comment   VARCHAR(350),
    IN gin_email          VARCHAR(50)
    )
    BEGIN
  SET @guide_seq = gin_Guide_seq;
  SET @place = gin_place;
  SET @Lat = gin_Lat;
  SET @Lng = gin_Lng;
  SET @Major_Category = gin_Major_Category;
  SET @Minor_Category = gin_Minor_category;
  SET @Host_Comment = gin_Host_Comment;
  SET @email = gin_email;
  PREPARE stmt FROM 'INSERT INTO guide_category(guide_seq,place,Lat,Lng,Major_Category,Minor_Category,Host_Comment,email)
 VALUES(@guide_seq,@place,@Lat,@Lng,@Major_Category,@Minor_Category,@Host_Comment,@email)';
  EXECUTE stmt;
  DEALLOCATE  PREPARE stmt;
END;

INSERT INTO BUILDING (TYPE) VALUES('아파트'); 
INSERT INTO BUILDING (TYPE) VALUES('단독주택'); 
INSERT INTO BUILDING (TYPE) VALUES('게스트하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('층 전체'); 
INSERT INTO BUILDING (TYPE) VALUES('B&B'); 
INSERT INTO BUILDING (TYPE) VALUES('아파트(콘도미니엄)'); 
INSERT INTO BUILDING (TYPE) VALUES('통나무집'); 
INSERT INTO BUILDING (TYPE) VALUES('별장/타운하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('로프트'); 
INSERT INTO BUILDING (TYPE) VALUES('타운하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('방갈로'); 
INSERT INTO BUILDING (TYPE) VALUES('성'); 
INSERT INTO BUILDING (TYPE) VALUES('기숙사'); 
INSERT INTO BUILDING (TYPE) VALUES('트리하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('배'); 
INSERT INTO BUILDING (TYPE) VALUES('비행기'); 
INSERT INTO BUILDING (TYPE) VALUES('캠핑카'); 
INSERT INTO BUILDING (TYPE) VALUES('이글루'); 
INSERT INTO BUILDING (TYPE) VALUES('등대'); 
INSERT INTO BUILDING (TYPE) VALUES('유르트(Yurt)'); 
INSERT INTO BUILDING (TYPE) VALUES('티피(Tipi)'); 
INSERT INTO BUILDING (TYPE) VALUES('동굴'); 
INSERT INTO BUILDING (TYPE) VALUES('섬'); 
INSERT INTO BUILDING (TYPE) VALUES('샬레(Chalet)'); 
INSERT INTO BUILDING (TYPE) VALUES('흙집'); 
INSERT INTO BUILDING (TYPE) VALUES('오두막'); 
INSERT INTO BUILDING (TYPE) VALUES('기차'); 
INSERT INTO BUILDING (TYPE) VALUES('텐트'); 
INSERT INTO BUILDING (TYPE) VALUES('기타'); 

select * from member;