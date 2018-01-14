SELECT item.Description, family_member.F_name, family_member.L_name
FROM item
JOIN family_member
ON item.Item_owner = family_member.Family_id


SELECT room.Description , item.Description
FROM room
JOIN item
ON room.Room_owner = item.Item_owner;

SELECT house.addr , family_member.F_name , family_member.L_name
FROM house , family_member, house_of_fmbr
WHERE house.house_id = house_of_fmbr.House_id
GROUP BY family_member.L_name
ORDER BY family_member.Family_id;

SELECT item.Description , family_member.F_name , family_member.M_init , family_member.L_name
FROM item , family_member
WHERE item.Item_owner = family_member.Family_id AND family_member.Sex = 'F'
GROUP BY family_member.F_name
ORDER BY item.Description

SELECT family_member.Age , family_member.F_name , family_member.M_init , family_member.L_name
FROM family_member
GROUP BY family_member.Age
HAVING family_member.Age > '25'
