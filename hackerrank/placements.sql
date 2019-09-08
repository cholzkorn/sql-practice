SELECT students.name
FROM (Students
inner join friends on students.id = friends.id
inner join packages p1 on p1.id = students.id
inner join packages p2 on p2.id = friends.friend_id) 
WHERE p2.salary > p1.salary
ORDER BY p2.salary ASC;