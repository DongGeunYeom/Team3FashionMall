select * from PRODUCT;

select * from PRODUCTATTACH;

delete from PRODUCTATTACH;

-- 인기순
select uuid, uploadpath, filename, p_a.p_code, p_price, p_name, p_sale, p_type
from productattach p_a left outer join product p on p_a.p_code = p.p_code
where t_amount > 0
order by p_sale;

/* 날짜 컬럼 추가 */
alter table product add reg_date date default sysdate;

CREATE TABLE  ProductAttach  (
     p_code     VARCHAR2(100)    NOT NULL,
     uuid   varchar2(100) NOT NULL,
     uploadpath varchar2(200) NOT NULL,
     filename     varchar2(200) NOT NULL
);


