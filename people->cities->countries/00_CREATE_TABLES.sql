create table countries
(
    country_id   serial
        constraint countries_pk
            primary key,
    population   numeric(8, 2) not null,
    country_name varchar(17)   not null
);

alter table countries
    owner to postgres;

create table capitals
(
    capital_id serial
        constraint capitals_pk
            primary key,
    name       varchar(17)    not null,
    population numeric(17, 2) not null,
    country_id integer
        constraint capitals_countries_country_id_fk
            references countries
            on delete cascade
);

alter table capitals
    owner to postgres;

create unique index capitals_capital_id_uindex
    on capitals (capital_id);

create unique index capitals_name_uindex
    on capitals (name);

create unique index capitals_country_id_uindex
    on capitals (country_id);

create table cities
(
    id         serial
        constraint cities_pk
            primary key,
    name       varchar(22)           not null,
    country_id integer
        constraint cities_countries_country_id_fk
            references countries
            on delete cascade,
    population numeric(11, 2)        not null,
    is_capital boolean default false not null
);

alter table cities
    owner to postgres;

create unique index cities_name_uindex
    on cities (name);

create table people
(
    person_id serial
        constraint people_pk
            primary key,
    f_name    varchar(22) not null,
    s_name    varchar(22),
    city_id   integer
        constraint people_cities_id_fk
            references cities,
    phone_no  numeric
);

alter table people
    owner to postgres;

create unique index people_phone_no_uindex
    on people (phone_no);


