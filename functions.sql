--1.digits
create or replace function digits(a in number) return number as
temp number;
x number:=0;
begin
temp:=a;
while(temp>0) loop
x:=x+1;
temp:=trunc(temp/10);
end loop;
return x;
end;

--2.armstrong
create or replace function arm(a in number, n in number) return varchar2 as
r number;
s number:=0;
t number:=a;
begin
while(t>0) loop
r:=mod(t,10);
s:=s+power(r,n);
t:=trunc(t/10);
end loop;
if(s=a) then
return 'True';
else
return 'False';
end if;
end;

set serveroutput on;
declare 
num1 number:=&num;
n number(4);
res varchar2(10);
begin
n:=digits(num1);
res:=arm(num1,n);
dbms_output.put_line(res);
end;

--3.job of emp
create or replace function emp_job(a in number) return varchar2 as
j varchar2(5);
begin
select job into j from emp1 where empno=a;
return j;
end;

declare 
no number(4):=&num;
j varchar2(5);
begin
dbms_output.put_line('The job of employee 7369 is '|| emp_job(7369));
end;

--4.swap
create or replace function swap(a in number, b in number) return varchar2 as
temp number;
a1 number:=a;
b1 number:=b;
begin
temp:=a1;
a1:=b1;
b1:=temp;
return 'After Swapping a is '||to_char(a1)|| ' and b is '||to_char(b1);
end;

declare
a number:=&num1;
b number:=&num2;
res varchar2(50);
begin
res:=swap(a,b);
dbms_output.put_line(res);
end;

--5.fibonacci
create or replace function fibonacci(n in number) return number as
n1 number:=n;
begin 
if n1<=1 then 
return n;
else
return (fibonacci(n-1) + fibonacci(n-2));
end if;
end;

declare 
n number:=&num;
begin 
for i in 1..n loop
dbms_output.put_line(fibonacci(i));
end loop;
end;

--6.rowtype
create or replace function details(a in number) return emp1.job%type as
rec emp1.job%type;
begin
select job into rec from emp1 where empno=a;
return rec;
end;
select details(7369) from dual;
