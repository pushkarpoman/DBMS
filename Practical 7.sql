CREATE DATABASE library;
use library;

create table o_rollcall(
rollno int,
name varchar(90),
address varchar(90)); 

create table n_rollcall(
rollno int,
name varchar(90),
address varchar(90));

delimiter // 
create procedure n1(in rno1 int) 
begin 
declare rno2 int; 
declare exit_cond boolean; 
declare c1 cursor for select rollno from o_rollcall where rollno>rno1; 
declare continue handler for not found set exit_cond=TRUE; 
open c1; 
l1:loop 
	fetch c1 into rno2; 
    if not exists(select * from n_rollcall where rollno=rno2)then 
		insert into n_rollcall select * from o_rollcall where rollno=rno2; 
    end if; 
    if exit_cond then 
		close c1; 
	leave l1; 
    end if; 
end loop l1; 
end 
//
 
DELIMITER ;
insert into o_rollcall (rollno, name, address) values
(1, "Komal", "ABC"), 
(2, "rAJ", "PBC"), 
(3, "RUDRA", "pUNE"); 

insert into n_rollcall (rollno, name, address) values  
(1, "Komal", "ABC"),  
(4, "lina", "Nashik"), 
(5, "SHEETAL", "AALDI"); 

delimiter ; 
call n1(1); 
select * from o_rollcall;
select * from n_rollcall; 
