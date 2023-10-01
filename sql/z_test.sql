select *
from xc_user
where username = 'teacher';
select role_id
from xc_user_role
where user_id = '52';
select menu_id
from xc_permission
where role_id in (select role_id from xc_user_role where user_id = '52');
select *
from xc_menu
where id in
      (select menu_id from xc_permission where role_id in (select role_id from xc_user_role where user_id = '52'));