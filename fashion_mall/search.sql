select filename,p_code from PRODUCTATTACH
where rowid in (select max(rowid) from PRODUCTATTACH group by p_code);


-----------------------------------------------
select p_name,p_price,p_content,p_type,p.reg_date,(select filename,p_code from PRODUCTATTACH
where rowid in (select max(rowid) from PRODUCTATTACH group by p_code)) from product p
left outer join productattach a on p.p_code = a.p_code;


