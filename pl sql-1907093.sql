--pl/sql variable declaration

--values from table to variables

set serveroutput on
declare 
id subscribers.sub_id%type;
name subscribers.sub_name%type;
age subscribers.sub_age%type;
begin
select sub_id,sub_name,sub_age into id,name,age from subscribers where sub_id=51; 
dbms_output.put_line('ID: '|| id || ' Name: '|| name || ' AGE: '|| age);		
end;
/

--Insert and set default value
delete from subscribers where sub_id = 51; 
set serveroutput on
declare 
id subscribers.sub_id%type:=51;
name subscribers.sub_name%type:='Aboni';
age subscribers.sub_age%type:=17;
category subscribers.sub_type%type:='child';

begin
insert into subscribers values(id,name,age,category);
end;
/


--Row type

--taken values from table and stored using rowtype 

set serveroutput on
declare 
subscribers_row subscribers%rowtype;
begin
select sub_id, sub_name, sub_age into subscribers_row.sub_id, subscribers_row.sub_name, subscribers_row.sub_age from subscribers where sub_id=51; 
dbms_output.put_line('ID: '|| subscribers_row.sub_id || ' Name: '|| subscribers_row.sub_name || ' age: '|| subscribers_row.sub_age);
end;
/


--cursor and row count

--using cursor and finding the total number of rows

set serveroutput on
declare 
cursor c is select * from subscribers;
sub_row subscribers%rowtype;
begin
open c;
fetch c into sub_row.sub_id, sub_row.sub_name, sub_row.sub_age,sub_row.sub_type;

while c%found loop
dbms_output.put_line('Id: '||sub_row.sub_id|| ' Name: '||sub_row.sub_name || ' Age: ' ||sub_row.sub_age);
dbms_output.put_line('Row count: '|| c%rowcount);
fetch c into sub_row.sub_id, sub_row.sub_name, sub_row.sub_age,sub_row.sub_type;
end loop;
close c;
end;
/


--FOR LOOP/WHILE LOOP/ARRAY with extend() function

--finding the title of the topics using loops and array with extend function

set serveroutput on
declare 
  counter number;
  t_title topic.title%type;
  TYPE topicARRAY IS VARRAY(10) OF topic.title%type; 
  A_NAME topicARRAY:=topicARRAY();
begin
  counter:=1;
  for x in 11..20  
  loop
    select title into t_title from topic where topic_id=x;
    A_NAME.EXTEND();
    A_NAME(counter):=t_title;
    counter:=counter+1;
  end loop;

  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/


--ARRAY without extend() function

--finding the title of the topics using loops and array without extend function


set serveroutput on
DECLARE 
   counter NUMBER := 1;
   t_title topic.title%type;
  TYPE topicARRAY IS VARRAY(10) OF topic.title%type; 
  A_NAME topicARRAY:=topicARRAY('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'); 
  
   -- VARRAY with a fixed size of 10 elements,initialized with some letters

BEGIN
   counter := 1;
   FOR x IN 11..20  
   LOOP
      select title into t_title from topic where topic_id=x;
      A_NAME(counter):=t_title;
      counter := counter + 1;
   END LOOP;

   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;
/


--if/else/
--counting the number of age type of subscribers

set serveroutput on
DECLARE 
   test1 number := 0;
   test2 number := 0;
   test3 number := 0;
   
   ageRange subscribers.sub_type%type;

BEGIN
   FOR x IN 51..60  
   LOOP
      select sub_type into ageRange from subscribers where sub_id=x;
      if ageRange='adult' 
        then
        test1 := test1 + 1;
      elsif ageRange='child'  
        then
        test2 := test2 + 1;
      elsif ageRange= 'senior citizen' then
        test3 := test3 + 1;
        end if;
   END LOOP;

   DBMS_OUTPUT.PUT_LINE('Adults are ' || test1); 
   DBMS_OUTPUT.PUT_LINE('Child  are ' || test2); 
   DBMS_OUTPUT.PUT_LINE('Senior citizen are ' || test3); 
  
   END;
/


--procedure

--subscribers having age greater than given age(only IN)

CREATE OR REPLACE PROCEDURE GreaterAge(
  given_age IN NUMBER
)
as
cursor c is select * from subscribers;
row subscribers%rowtype;

begin
open c;
fetch c into row.sub_id, row.sub_name, row.sub_age, row.sub_type;

while c%found loop
if row.sub_age >given_age then
dbms_output.put_line('Name: ' || row.sub_name || ' Age: ' || row.sub_age);
 fetch c into row.sub_id, row.sub_name, row.sub_age, row.sub_type;

else
fetch c into row.sub_id, row.sub_name, row.sub_age, row.sub_type;
end if;

end loop;

close c;
end;
/


set serveroutput on
declare 
given_age subscribers.sub_age%type:=20;
begin
GreaterAge(given_age);
end;
/  


--subscriber with the max age using procedure(OUT parameter only)

CREATE OR REPLACE PROCEDURE maxAge(
  op_age out subscribers.sub_age%type,
  op_name out subscribers.sub_name%type
)
as
begin
select max(sub_age) into op_age from subscribers;

select sub_name into op_name from subscribers where sub_age = op_age;
dbms_output.put_line('Name: ' || op_name || ' Age: ' || op_age);
end;
/ 


set serveroutput on
declare 
op_age  subscribers.sub_age%type;
 op_name  subscribers.sub_name%type;
begin
maxAge(op_age, op_name);
end;
/


--function

--returning the number of users having higher age than given (in out parameter is used)

set serveroutput on
create or replace function higher(var1 in out number) return number AS
begin
  select count(*) into var1 from subscribers where subscribers.sub_age> var1; 
   return var1;
end;
/

set serveroutput on
declare 
var1 number:= 20;
var2 number:=20;
begin
dbms_output.put_line('Subscribers older than ' || var2 ||' :'|| higher(var1));
end;
/





