CREATE TABLE empresa(
    id serial PRIMARY KEY,
    nombre text not null,
    estado number(1) not null
)

CREATE TABLE persona(
    id serial PRIMARY KEY,
    nombre text not null,
    estado integer(1) not null,
    empresa_id bigint unsigned,
    FOREIGN KEY (empresa_id) references empresa(id)
)

CREATE TABLE vehiculo(
    id serial PRIMARY KEY,
    tipo integer(1) not null,
    descripcion text,
    persona_id bigint unsigned,
    FOREIGN KEY (persona_id) references persona(id)
)

insert into empresa(nombre, estado) values ('quicky mart', 1);
insert into empresa(nombre, estado) values ('amazon', 0);
insert into empresa(nombre, estado) values ('microsoft', 2);

insert into persona(nombre, estado, empresa_id) values ('Apu',1,1);
insert into persona(nombre, estado, empresa_id) values ('Bill Gates',0,3);
insert into persona(nombre, estado, empresa_id) values ('Jeff Bezos',1,2);
insert into persona(nombre, estado, empresa_id) values ('Random person 1',1,3);

insert into vehiculo(tipo, descripcion, persona_id) values (0,'Auto de Apu en reparacion',1);
insert into vehiculo(tipo, descripcion, persona_id) values (1,'Auto de Bill Gates',2);
insert into vehiculo(tipo, descripcion, persona_id) values (1,'Auto de Jeff Bezos',3);
insert into vehiculo(tipo, descripcion, persona_id) values (2,'Auto de persona aleatoria',4);
insert into vehiculo(tipo, descripcion, persona_id) values (0,'Auto extra de Bill Gates',2);

CONSULTAS:

personas con vehiculo de tipo 1:

select e.nombre, p.nombre, v.descripcion, v.tipo
from persona p  
inner join vehiculo v on p.id = v.persona_id 
inner join empresa e on e.id = p.empresa_id 
where v.tipo = 1

todas las personas de la empresa id 3, cuyo estado persona sea 1

select p.id, p.nombre, p.estado 
from persona p  
inner join vehiculo v on p.id = v.persona_id 
inner join empresa e on e.id = p.empresa_id 
where e.id = 3 and p.estado = 1

todas las personas que tengan o no vehiculo a cargo, ordenadas por empresa_id y persona.nombre

select e.nombre, p.nombre, v.descripcion
from persona p  
inner join vehiculo v on p.id = v.persona_id 
inner join empresa e on e.id = p.empresa_id 
order by p.empresa_id, p.nombre