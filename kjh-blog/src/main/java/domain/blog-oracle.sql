drop sequence seq_b201712015;

drop table b201712015;

create sequence seq_b201712015 increment by 1 start with 1;

create table b201712015 (
	id number(11) not null primary key,
	title	varchar2(50) not null,
	content	varchar2(200),
	filepath	varchar(30),
	blogger	varchar2(30),
	reg_date_time	date default SYSDATE
);

INSERT INTO b201712015(id, title, content, filepath, blogger) VALUES(seq_b201712015.nextval,'제목-1','블로그 내용-1','01.png','root@induk.ac.kr');
INSERT INTO b201712015(id, title, content, filepath, blogger) VALUES(seq_b201712015.nextval,'제목-2','블로그 내용-2','02.png','root@induk.ac.kr');
INSERT INTO b201712015(id, title, content, filepath, blogger) VALUES(seq_b201712015.nextval,'제목-3','블로그 내용-3','03.png','root@induk.ac.kr');
INSERT INTO b201712015(id, title, content, filepath, blogger) VALUES(seq_b201712015.nextval,'제목-4','블로그 내용-4','04.png','egyou@induk.ac.kr');
INSERT INTO b201712015(id, title, content, filepath, blogger) VALUES(seq_b201712015.nextval,'제목-5','블로그 내용-5','05.png','egyou@induk.ac.kr');
INSERT INTO b201712015(id, title, content, filepath, blogger) VALUES(seq_b201712015.nextval,'제목-6','블로그 내용-6','06.png','egyou@induk.ac.kr');

select * from b201712015;

update b201712015 set title='update제목', content='update 내용', filepath='ddochi.png' where id=48;

update b201712015 set title='update제목', content='update 내용', filepath='ddochi.png', 
reg_date_time=TO_TIMESTAMP('2019-11-11 11:11:00.0', 'YYYY-MM-DD HH24:MI:SS.FF3')  where id=47;

SELECT *
FROM
    (
        SELECT *
        FROM
            (
                SELECT ROWNUM AS id,title,content,filepath,blogger,reg_date_time
                FROM
                    (
                        SELECT *
                        FROM b201712015
                        ORDER BY id DESC
                    )
            )
        WHERE id >= 1 -- START NO
    )
WHERE ROWNUM <= 3; -- COUNT