-- ======================================================================
-- ===   Sql Script for Database : cc51t
-- ===
-- === Build : 6
-- ======================================================================

CREATE TABLE dominio
  (
    id              int             auto_increment,
    nombre          varchar(63)     unique not null,
    fecha_creacion  timestamp(14),

    primary key(id)
  )
 TYPE = InnoDB;

-- ======================================================================

CREATE TABLE contacto
  (
    id                int            auto_increment,
    rut               varchar(10)    not null,
    nombre            varchar(200)   not null,
    email             varchar(200)   not null,
    direccion_calle   varchar(200),
    direccion_numero  varchar(15),
    region            varchar(200),
    comuna            varchar(200),
    telefono          varchar(20),
    giro              varchar(200),

    primary key(id)
  )
 TYPE = InnoDB;

-- ======================================================================

CREATE TABLE host
  (
    id           int            auto_increment,
    nombre_host  varchar(100)   not null,

    primary key(id)
  )
 TYPE = InnoDB;

-- ======================================================================

CREATE TABLE dominio_host
  (
    dominio  int,
    host     int,

    primary key(dominio,host),

    foreign key(dominio) references dominio(id),
    foreign key(host) references host(id)
  )
 TYPE = InnoDB;

-- ======================================================================

CREATE TABLE dominio_contacto
  (
    dominio   int,
    contacto  int,
    rol       char(1)   not null,

    primary key(dominio,contacto),

    foreign key(dominio) references dominio(id),
    foreign key(contacto) references contacto(id)
  )
 TYPE = InnoDB;

-- ======================================================================

