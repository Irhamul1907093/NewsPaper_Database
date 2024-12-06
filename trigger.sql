create trigger try
after update on topic
referencing old as o new as n
for each row
begin
update news set topic_id = :n.topic_id where topic_id = :o.topic_id;
end;
/

create trigger try2
before delete on news
referencing old as o new as n
for each row
begin
update feedback set news_id = :n.news_id where news_id = :o.news_id;
end;
/