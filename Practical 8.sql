 create database Lib;
 use Lib; 
 create table Library (rollno int, name varchar(50), nameofbook VARCHAR(50));
 create table Library_Audit (rollno int, name varchar(50), nameofbook VARCHAR(50));
 
delimiter // 

create trigger tr_ins77_Borrower 
before insert 
on Library 
for each row 
begin 
insert into Library_Audit values(new.rollno,new.name,new.nameofbook); 
end 
// 

delimiter ; 
insert into Library values(1, "Jenil", "Sherlock Holmes");
 
select * from Library; 
select * from Library_Audit;

delimiter // 
create trigger tr_del_Borrower 
before delete 
on Library 
for each row 
begin 
delete from Library_Audit where rollno=old.rollno; 
end 
//

delimiter ; 
delete from Library where rollno = 1; 

select * from Library; 
select * from Library_Audit;

insert into Library values(2, "Zaid", "Harappa");

delimiter // 
create trigger tr_up1_Borrower 
before update 
on Library 
for each row 
begin 
update Library_Audit set rollno=new.rollno where rollno=old.rollno; 
end 
// 

delimiter ; 
update Library set rollno = 1 where rollno = 2;

select * from Library; 
select * from Library_Audit;
