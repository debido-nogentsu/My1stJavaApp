use mysql;

drop user if exists MyJavaApp@localhost;
flush privileges;
create user MyJavaApp@localhost identified by 'MyJavaApp';
GRANT ALL PRIVILEGES ON *.* TO MyJavaApp@localhost;
flush privileges;