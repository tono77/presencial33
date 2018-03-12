Last login: Mon Mar 12 17:38:42 on console
~ % psql
psql (10.1, server 10.3)
Type "help" for help.


edgardo=# \d
Did not find any relations.
edgardo=# create database presencial33
edgardo-# ;
CREATE DATABASE
edgardo=# \c presencial33
psql (10.1, server 10.3)
You are now connected to database "presencial33" as user "edgardo".                                                             

##EJERCICIO 1                                                             
presencial33=# create table department(id SERIAL PRIMARY KEY, name VARCHAR(50), descr VARCHAR(100));
CREATE TABLE                                                             
presencial33=# create table worker(id VARCHAR(12) PRIMARY KEY, department_id SERIAL REFERENCES department (id), fullname VARCHAR(50));
CREATE TABLE
presencial33=# create table liquidacion (id SERIAL PRIMARY KEY, worker_id VARCHAR(12) REFERENCES worker (id), date DATE, monto FLOAT);
CREATE TABLE
presencial33=# \d
                   List of relations
 Schema |           Name           |   Type   |  Owner  
--------+--------------------------+----------+---------
 public | department               | table    | edgardo
 public | department_id_seq        | sequence | edgardo
 public | liquidacion              | table    | edgardo
 public | liquidacion_id_seq       | sequence | edgardo
 public | worker                   | table    | edgardo
 public | worker_department_id_seq | sequence | edgardo
(6 rows)

presencial33=# \d worker
presencial33=# \dt worker
         List of relations
 Schema |  Name  | Type  |  Owner  
--------+--------+-------+---------
 public | worker | table | edgardo
(1 row)


##EJERCICIO 2
presencial33=# create table curso (id SERIAL PRIMARY KEY, nivel VARCHAR(10), letra VARCHAR(1));
CREATE TABLE
presencial33=# create table alumno (rut VARCHAR(12) PRIMARY KEY, curso_id SERIAL REFERENCES curso (id), fullname VARCHAR(50));
CREATE TABLE
presencial33=# create table profesor (rut VARCHAR(12) PRIMARY KEY, fullname VARCHAR(50));
CREATE TABLE
presencial33=# create table prueba (id SERIAL PRIMARY KEY, profesor_rut VARCHAR(12) REFERENCES profesor (rut),titulo VARCHAR(100));
CREATE TABLE
presencial33=# create table calificacion (alumno_id VARCHAR(12) REFERENCES alumno (rut), prueba_id SERIAL REFERENCES prueba (id));
CREATE TABLE

##EJERCICIO 3
presencial33=# create table partido (id SERIAL PRIMARY KEY, name VARCHAR(50), descr VARCHAR(100));
CREATE TABLE
presencial33=# create table candidato (rut VARCHAR(12) PRIMARY KEY, partido_id SERIAL REFERENCES partido (id), fullname VARCHAR(100));
CREATE TABLE
presencial33=# create table mesa (id SERIAL PRIMARY KEY, local VARCHAR(50), numero INTEGER);
CREATE TABLE                                                             
presencial33=# create table voto (id SERIAL PRIMARY KEY, candidato_rut VARCHAR(12) REFERENCES candidato (rut), mesa_id SERIAL REFERENCES mesa (id), seleccion VARCHAR(3), objetado BOOLEAN);
CREATE TABLE


##EJERCICIO 4
presencial33=# create table categoria (id SERIAL PRIMARY KEY, descr VARCHAR(20));
CREATE TABLE
presencial33=# create table pelicula (id SERIAL PRIMARY KEY, categoria_id SERIAL REFERENCES categoria (id), titulo VARCHAR(50));
CREATE TABLE
presencial33=# create table tag (id SERIAL PRIMARY KEY, name VARCHAR(50));
CREATE TABLE
presencial33=# create table mov_tag (pelicula_id SERIAL REFERENCES pelicula (id), tag_id SERIAL REFERENCES tag (id), counter INTEGER);
CREATE TABLE


##EJERCICIO 5
presencial33=# create table cliente (rut VARCHAR(12) PRIMARY KEY, nombre VARCHAR(50));
CREATE TABLE
presencial33=# create table bodega (id SERIAL PRIMARY KEY, nombre VARCHAR(50));
CREATE TABLE
presencial33=# create table factura (id SERIAL PRIMARY KEY, descr VARCHAR(250));
CREATE TABLE
presencial33=# create table clt_fct (factura_id SERIAL REFERENCES factura (id), cliente_rut VARCHAR(12) REFERENCES cliente (rut), monto FLOAT);
CREATE TABLE
presencial33=# create table producto (id SERIAL PRIMARY KEY, bodega_id SERIAL REFERENCES bodega (id), name VARCHAR(50), valor INTEGER);
CREATE TABLE
presencial33=# create table fact_prod (factura_id SERIAL REFERENCES factura (id), producto_id SERIAL REFERENCES producto (id));
CREATE TABLE
