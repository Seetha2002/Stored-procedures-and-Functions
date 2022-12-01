--Example 1:
create or replace procedure addition(a in number, b in number,  c out number) as
begin
c:=a+b;
dbms_output.put_line(c);
end;
declare 
a number:=25;
b number:=40;
c number;
begin
addition(a,b,c);
end;

--Example 2:
create or replace procedure deptno(a in number, c out number) as
begin 
select deptno into c from emp1 where empno=a;
dbms_output.put_line(c);
end;
declare
a emp.empno%type:=&num;
c emp.deptno%type;
begin
deptno(a,c);
end;

--Example 3:
create or replace procedure edept(eno number) as
erecord emp%rowtype;
begin
select * into erecord from emp where empno=eno;
dbms_output.put_line('name : '|| erecord.ename || 'job : ' || erecord.job);
exception
when others then
dbms_output.put_line('No data');
end;
declare 
eno emp.empno%type:=&num;
begin
edept(eno);
end;

--Example 4:
create or replace procedure subtraction(a in number, b in number, c out number) as
begin
c:=a-b;
dbms_output.put_line(c);
end;
declare
num1 number:=&num1;
num2 number:=&num2;
res number;
begin
subtraction(num1,num2,res);
end;

