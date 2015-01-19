create database redmine default character set utf8;
grant all on redmine.* to redmine@localhost identified by 'redmine';
flush privileges;
