create table hotel
(
    hotel_id    serial
        constraint hotel_pk
            primary key,
    hotel_name  varchar(25),
    hotel_stars integer
        constraint hotel_hotel_stars_check
            check ((hotel_stars >= 1) AND (hotel_stars <= 5))
);

alter table hotel
    owner to postgres;

create table pet_owner
(
    owner_id   serial
        constraint pet_owner_pk
            primary key,
    owner_name varchar(15),
    owner_age  integer
        constraint pet_owner_owner_age_check
            check ((owner_age >= 1) AND (owner_age <= 110))
);

alter table pet_owner
    owner to postgres;

create table dog
(
    dog_id   serial
        constraint dog_pk
            primary key,
    owner_id integer
        constraint dog_pet_owner_owner_id_fk
            references pet_owner
            on delete cascade,
    dog_name varchar(15),
    dog_age  integer
        constraint dog_dog_age_check
            check ((dog_age >= 1) AND (dog_age <= 25))
);

alter table dog
    owner to postgres;

create table dog_room
(
    room_id         serial
        constraint dog_room_pk
            primary key,
    dog_id          integer
        constraint dog_room_dog_dog_id_fk
            references dog
            on delete cascade,
    hotel_id        integer
        constraint dog_room_hotel_hotel_id_fk
            references hotel
            on delete cascade,
    register_date   date,
    unregister_date date
);

alter table dog_room
    owner to postgres;

create table cat
(
    cat_id   serial
        constraint cat_pk
            primary key,
    owner_id integer
        constraint cat_pet_owner_owner_id_fk
            references pet_owner
            on delete cascade,
    cat_name varchar(15),
    cat_age  integer
        constraint cat_cat_age_check
            check ((cat_age >= 1) AND (cat_age <= 25))
);

alter table cat
    owner to postgres;

create table cat_room
(
    room_id         serial
        constraint cat_room_pk
            primary key,
    cat_id          integer
        constraint cat_room_cat_cat_id_fk
            references cat
            on delete cascade,
    hotel_id        integer
        constraint cat_room_hotel_hotel_id_fk
            references hotel
            on delete cascade,
    register_date   date,
    unregister_date date
);

alter table cat_room
    owner to postgres;


