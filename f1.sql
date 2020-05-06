create trigger JelszoKarbantartas
on Vevo
for update, insert
as

update Vevo
set JelszoLejarat = DATEADD(year, 1, GETDATE())
from Vevo v
inner join inserted i on i.ID=v.ID
left join deleted d on d.ID=i.ID
where (Select COUNT(*) from deleted) = 0 or i.Jelszo != d.Jelszo