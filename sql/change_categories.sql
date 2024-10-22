use news;
alter table categories
add column cdescription text character set utf8mb4
after cname;

update categories
set cdescription = 'Các tin về giáo dục - nghề nghiệp, tuyển sinh, du học'
where categoryID =1;
update categories
set cdescription = 'Các tin về chính trị, giao thông, đời sống'
where categoryID =2;
update categories
set cdescription = 'Các tin về tài chính, tiêu dùng, doanh nghiệp, chứng khoán'
where categoryID =3;
update categories
set cdescription = 'Các tin về tài chính, tiêu dùng, doanh nghiệp, chứng khoán'
where categoryID =3;
update categories
set cdescription = 'Các tin về các môn thể thao: Bóng đá, tennis,cầu lông,...'
where categoryID =4;
update categories
set cdescription = 'Các tin về sức khoẻ, tư vấn sức khoẻ, dịch vụ y tế'
where categoryID =5;
update categories
set cdescription = 'Các tin về thời tiết, khí hậu'
where categoryID =6;