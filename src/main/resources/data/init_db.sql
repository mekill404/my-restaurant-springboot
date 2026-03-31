CREATE ROLE product_manager_user WITH LOGIN PASSWORD '';

CREATE DATABASE product_management_db 
    WITH 
    OWNER = product_manager_user
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    CONNECTION LIMIT = 100
    ALLOW_CONNECTIONS = true;
  
GRANT ALL ON SCHEMA public TO product_manager_user;
