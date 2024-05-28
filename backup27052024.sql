prompt PL/SQL Developer import file
prompt Created on ιεν ωπι 27 ξΰι 2024 by user
set feedback off
set define off
prompt Creating PROJECTS...
create table PROJECTS
(
  project_id   NUMBER not null,
  project_name VARCHAR2(100) not null,
  start_date   DATE not null,
  end_date     DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PROJECTS
  add primary key (PROJECT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating UNITS...
create table UNITS
(
  unit_id_   NUMBER not null,
  unit_name_ VARCHAR2(100),
  location_  VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table UNITS
  add primary key (UNIT_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLES_...
create table ROLES_
(
  role_id_          NUMBER not null,
  role_description_ VARCHAR2(1000),
  role_name         VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLES_
  add primary key (ROLE_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SALARIES...
create table SALARIES
(
  salary_id_    NUMBER not null,
  amount_       NUMBER not null,
  payment_date_ DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SALARIES
  add primary key (SALARY_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SOLDIERS...
create table SOLDIERS
(
  soldier_id_ NUMBER not null,
  first_name_ VARCHAR2(100),
  last_name_  VARCHAR2(100),
  birth_date_ DATE,
  rank_       VARCHAR2(100),
  unit_id_    NUMBER not null,
  salary_id_  NUMBER,
  role_id_    NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SOLDIERS
  add primary key (SOLDIER_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SOLDIERS
  add foreign key (SALARY_ID_)
  references SALARIES (SALARY_ID_);
alter table SOLDIERS
  add foreign key (UNIT_ID_)
  references UNITS (UNIT_ID_);
alter table SOLDIERS
  add foreign key (ROLE_ID_)
  references ROLES_ (ROLE_ID_);

prompt Creating HAVE...
create table HAVE
(
  soldier_id_ NUMBER not null,
  project_id  NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAVE
  add primary key (SOLDIER_ID_, PROJECT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAVE
  add foreign key (SOLDIER_ID_)
  references SOLDIERS (SOLDIER_ID_);
alter table HAVE
  add foreign key (PROJECT_ID)
  references PROJECTS (PROJECT_ID);

prompt Creating TRAININGS_...
create table TRAININGS_
(
  training_id_   NUMBER not null,
  training_name_ VARCHAR2(100) not null,
  start_date_    DATE not null,
  end_date_      DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRAININGS_
  add primary key (TRAINING_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PARTICIPANT...
create table PARTICIPANT
(
  soldier_id_  NUMBER not null,
  training_id_ NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPANT
  add primary key (SOLDIER_ID_, TRAINING_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPANT
  add foreign key (SOLDIER_ID_)
  references SOLDIERS (SOLDIER_ID_);
alter table PARTICIPANT
  add foreign key (TRAINING_ID_)
  references TRAININGS_ (TRAINING_ID_);

prompt Disabling triggers for PROJECTS...
alter table PROJECTS disable all triggers;
prompt Disabling triggers for UNITS...
alter table UNITS disable all triggers;
prompt Disabling triggers for ROLES_...
alter table ROLES_ disable all triggers;
prompt Disabling triggers for SALARIES...
alter table SALARIES disable all triggers;
prompt Disabling triggers for SOLDIERS...
alter table SOLDIERS disable all triggers;
prompt Disabling triggers for HAVE...
alter table HAVE disable all triggers;
prompt Disabling triggers for TRAININGS_...
alter table TRAININGS_ disable all triggers;
prompt Disabling triggers for PARTICIPANT...
alter table PARTICIPANT disable all triggers;
prompt Disabling foreign key constraints for SOLDIERS...
alter table SOLDIERS disable constraint SYS_C007246;
alter table SOLDIERS disable constraint SYS_C007247;
alter table SOLDIERS disable constraint SYS_C007248;
prompt Disabling foreign key constraints for HAVE...
alter table HAVE disable constraint SYS_C007257;
alter table HAVE disable constraint SYS_C007258;
prompt Disabling foreign key constraints for PARTICIPANT...
alter table PARTICIPANT disable constraint SYS_C007252;
alter table PARTICIPANT disable constraint SYS_C007253;
prompt Deleting PARTICIPANT...
delete from PARTICIPANT;
commit;
prompt Deleting TRAININGS_...
delete from TRAININGS_;
commit;
prompt Deleting HAVE...
delete from HAVE;
commit;
prompt Deleting SOLDIERS...
delete from SOLDIERS;
commit;
prompt Deleting SALARIES...
delete from SALARIES;
commit;
prompt Deleting ROLES_...
delete from ROLES_;
commit;
prompt Deleting UNITS...
delete from UNITS;
commit;
prompt Deleting PROJECTS...
delete from PROJECTS;
commit;
prompt Loading PROJECTS...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2000, 'Ra', to_date('09-08-2021', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2058, 'Ir', to_date('25-02-2022', 'dd-mm-yyyy'), to_date('26-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2116, 'Mo', to_date('01-01-2021', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2174, 'Ho', to_date('28-11-2021', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2232, 'Bk', to_date('30-05-2021', 'dd-mm-yyyy'), to_date('18-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2290, 'Be', to_date('29-10-2021', 'dd-mm-yyyy'), to_date('25-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2348, 'Mg', to_date('27-02-2021', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2406, 'Rn', to_date('30-11-2021', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2464, 'N', to_date('18-11-2021', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2522, 'Be', to_date('04-09-2021', 'dd-mm-yyyy'), to_date('26-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2580, 'Po', to_date('24-08-2021', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2638, 'Se', to_date('26-07-2021', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2696, 'Zn', to_date('24-02-2022', 'dd-mm-yyyy'), to_date('10-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2754, 'Co', to_date('16-04-2021', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2812, 'Rf', to_date('18-07-2021', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2870, 'Mg', to_date('20-11-2021', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2928, 'Sc', to_date('11-05-2021', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2986, 'Sm', to_date('02-02-2022', 'dd-mm-yyyy'), to_date('15-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3044, 'Li', to_date('15-05-2021', 'dd-mm-yyyy'), to_date('06-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3102, 'Pu', to_date('04-03-2022', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3160, 'V', to_date('23-03-2022', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3218, 'Sc', to_date('01-02-2021', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3276, 'Pm', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3334, 'P', to_date('31-03-2022', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3392, 'Hg', to_date('13-01-2021', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3450, 'Th', to_date('05-05-2022', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3508, 'Ho', to_date('09-02-2021', 'dd-mm-yyyy'), to_date('04-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3566, 'La', to_date('05-03-2021', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3624, 'H', to_date('20-03-2021', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3682, 'Sc', to_date('07-04-2022', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3740, 'Ho', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3798, 'Np', to_date('18-06-2021', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3856, 'Er', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3914, 'Ac', to_date('04-05-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3972, 'Ni', to_date('21-07-2021', 'dd-mm-yyyy'), to_date('21-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4030, 'La', to_date('20-06-2021', 'dd-mm-yyyy'), to_date('03-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4088, 'Yb', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('01-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4146, 'Ru', to_date('10-11-2021', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4204, 'Eu', to_date('16-05-2021', 'dd-mm-yyyy'), to_date('22-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4262, 'Cd', to_date('10-04-2021', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4320, 'V', to_date('23-04-2022', 'dd-mm-yyyy'), to_date('26-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4378, 'K', to_date('12-02-2021', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4436, 'Kr', to_date('17-12-2021', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4494, 'Pa', to_date('22-03-2021', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4552, 'Cm', to_date('18-03-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4610, 'Sn', to_date('07-01-2022', 'dd-mm-yyyy'), to_date('15-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4668, 'Eu', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4726, 'Br', to_date('02-03-2022', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4784, 'As', to_date('20-08-2021', 'dd-mm-yyyy'), to_date('12-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4842, 'Cs', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4900, 'Md', to_date('14-07-2021', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4958, 'Fr', to_date('26-05-2021', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5016, 'Ag', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5074, 'As', to_date('23-04-2022', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5132, 'Bk', to_date('16-08-2021', 'dd-mm-yyyy'), to_date('18-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5190, 'Na', to_date('04-02-2021', 'dd-mm-yyyy'), to_date('02-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5248, 'Tm', to_date('20-03-2022', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5306, 'Cu', to_date('14-10-2021', 'dd-mm-yyyy'), to_date('24-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5364, 'Be', to_date('02-12-2021', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5422, 'U', to_date('21-05-2021', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5480, 'As', to_date('21-03-2021', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5538, 'Er', to_date('24-12-2021', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5596, 'Lr', to_date('28-05-2021', 'dd-mm-yyyy'), to_date('03-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5654, 'Al', to_date('26-03-2021', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5712, 'Tb', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5770, 'Br', to_date('03-11-2021', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5828, 'Ge', to_date('05-01-2021', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5886, 'Tc', to_date('21-01-2021', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5944, 'Pd', to_date('14-04-2022', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6002, 'Fe', to_date('26-04-2022', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6060, 'K', to_date('10-05-2021', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6118, 'Hf', to_date('30-05-2021', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6176, 'S', to_date('28-10-2021', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6234, 'Ca', to_date('28-05-2022', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6292, 'Th', to_date('26-12-2021', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6350, 'W', to_date('21-03-2022', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6408, 'Al', to_date('16-09-2021', 'dd-mm-yyyy'), to_date('10-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6466, 'O', to_date('05-01-2022', 'dd-mm-yyyy'), to_date('22-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6524, 'U', to_date('30-06-2021', 'dd-mm-yyyy'), to_date('13-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6582, 'Te', to_date('26-10-2021', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6640, 'Hg', to_date('07-12-2021', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6698, 'Pb', to_date('23-11-2021', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6756, 'Es', to_date('27-04-2022', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6814, 'Au', to_date('25-05-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6872, 'In', to_date('21-06-2021', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6930, 'Cm', to_date('15-02-2021', 'dd-mm-yyyy'), to_date('14-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6988, 'As', to_date('08-01-2022', 'dd-mm-yyyy'), to_date('08-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7046, 'Y', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('15-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7104, 'Yb', to_date('28-11-2021', 'dd-mm-yyyy'), to_date('08-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7162, 'Th', to_date('17-05-2021', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7220, 'Lr', to_date('26-04-2022', 'dd-mm-yyyy'), to_date('20-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7278, 'Er', to_date('30-01-2022', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7336, 'Co', to_date('03-04-2021', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7394, 'Zr', to_date('03-04-2022', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7452, 'Ru', to_date('22-06-2021', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7510, 'Rn', to_date('21-06-2021', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7568, 'Ce', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('29-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7626, 'Pa', to_date('02-12-2021', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7684, 'Li', to_date('17-01-2022', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7742, 'Cd', to_date('09-07-2021', 'dd-mm-yyyy'), to_date('06-03-2023', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7800, 'Cl', to_date('01-06-2021', 'dd-mm-yyyy'), to_date('28-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7858, 'Pa', to_date('28-12-2021', 'dd-mm-yyyy'), to_date('04-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7916, 'Pd', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7974, 'Cl', to_date('06-06-2021', 'dd-mm-yyyy'), to_date('12-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8032, 'No', to_date('05-05-2022', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8090, 'Na', to_date('05-02-2022', 'dd-mm-yyyy'), to_date('07-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8148, 'Cu', to_date('19-04-2022', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8206, 'Zr', to_date('02-02-2021', 'dd-mm-yyyy'), to_date('13-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8264, 'Ar', to_date('05-03-2022', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8322, 'Sc', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8380, 'Np', to_date('13-01-2021', 'dd-mm-yyyy'), to_date('21-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8438, 'N', to_date('19-09-2021', 'dd-mm-yyyy'), to_date('08-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8496, 'Na', to_date('25-05-2022', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8554, 'Fr', to_date('16-02-2021', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8612, 'Y', to_date('26-05-2022', 'dd-mm-yyyy'), to_date('10-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8670, 'Ho', to_date('01-02-2021', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8728, 'Np', to_date('31-10-2021', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8786, 'Na', to_date('14-05-2021', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8844, 'Ag', to_date('25-12-2021', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8902, 'Cs', to_date('30-08-2021', 'dd-mm-yyyy'), to_date('10-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8960, 'H', to_date('21-06-2021', 'dd-mm-yyyy'), to_date('04-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9018, 'Es', to_date('02-03-2022', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9076, 'Lr', to_date('19-01-2022', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9134, 'Cu', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('19-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9192, 'Mg', to_date('24-01-2021', 'dd-mm-yyyy'), to_date('29-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9250, 'K', to_date('19-04-2022', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9308, 'Nb', to_date('21-03-2022', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9366, 'Zr', to_date('05-03-2022', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9424, 'Kr', to_date('13-05-2022', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9482, 'Ru', to_date('30-07-2021', 'dd-mm-yyyy'), to_date('18-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9540, 'I', to_date('10-06-2021', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9598, 'Li', to_date('09-08-2021', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9656, 'Rh', to_date('11-01-2022', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9714, 'Mo', to_date('31-12-2021', 'dd-mm-yyyy'), to_date('12-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9772, 'Ba', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9830, 'Lu', to_date('06-07-2021', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9888, 'Pa', to_date('20-02-2021', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9946, 'Np', to_date('27-03-2022', 'dd-mm-yyyy'), to_date('18-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10004, 'Sr', to_date('11-02-2021', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10062, 'N', to_date('07-06-2021', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10120, 'Ir', to_date('06-04-2022', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10178, 'Sm', to_date('01-02-2022', 'dd-mm-yyyy'), to_date('03-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10236, 'H', to_date('13-01-2021', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10294, 'P', to_date('10-09-2021', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10352, 'Ge', to_date('16-01-2022', 'dd-mm-yyyy'), to_date('08-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10410, 'Nb', to_date('29-07-2021', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10468, 'Rb', to_date('09-08-2021', 'dd-mm-yyyy'), to_date('30-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10526, 'Pm', to_date('27-02-2021', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10584, 'Sb', to_date('16-09-2021', 'dd-mm-yyyy'), to_date('24-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10642, 'K', to_date('15-02-2022', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10700, 'N', to_date('01-03-2021', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10758, 'Pb', to_date('19-08-2021', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10816, 'Ti', to_date('04-11-2021', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10874, 'Cs', to_date('01-04-2022', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10932, 'Kr', to_date('04-05-2021', 'dd-mm-yyyy'), to_date('20-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10990, 'Tc', to_date('23-05-2022', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11048, 'Tl', to_date('26-09-2021', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11106, 'Rh', to_date('11-07-2021', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11164, 'Pa', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11222, 'Re', to_date('25-04-2022', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11280, 'Nd', to_date('22-05-2021', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11338, 'Fe', to_date('04-10-2021', 'dd-mm-yyyy'), to_date('07-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11396, 'Fr', to_date('14-05-2021', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11454, 'Rb', to_date('12-03-2022', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11512, 'Ce', to_date('05-10-2021', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11570, 'Ca', to_date('14-07-2021', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11628, 'Ar', to_date('01-09-2021', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11686, 'V', to_date('06-07-2021', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11744, 'Sm', to_date('11-02-2022', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11802, 'Sc', to_date('18-11-2021', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11860, 'Ir', to_date('08-05-2021', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11918, 'Np', to_date('23-03-2021', 'dd-mm-yyyy'), to_date('22-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11976, 'Np', to_date('19-12-2021', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12034, 'Rh', to_date('10-09-2021', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12092, 'Cu', to_date('17-05-2022', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12150, 'Ag', to_date('17-12-2021', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12208, 'Zr', to_date('02-08-2021', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12266, 'Cd', to_date('19-04-2021', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12324, 'Ho', to_date('06-05-2022', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12382, 'Fr', to_date('24-05-2021', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12440, 'Md', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12498, 'W', to_date('31-12-2021', 'dd-mm-yyyy'), to_date('20-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12556, 'No', to_date('19-02-2022', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12614, 'Sc', to_date('09-01-2022', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12672, 'Nb', to_date('18-02-2022', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12730, 'Cs', to_date('17-05-2022', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12788, 'W', to_date('07-04-2022', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12846, 'Ir', to_date('29-06-2021', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12904, 'Ta', to_date('21-06-2021', 'dd-mm-yyyy'), to_date('28-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12962, 'Ne', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('16-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13020, 'Kr', to_date('26-05-2021', 'dd-mm-yyyy'), to_date('05-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13078, 'Cf', to_date('24-03-2021', 'dd-mm-yyyy'), to_date('17-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13136, 'Am', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13194, 'Tc', to_date('27-02-2021', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13252, 'Br', to_date('11-05-2022', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13310, 'N', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13368, 'Ho', to_date('13-09-2021', 'dd-mm-yyyy'), to_date('18-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13426, 'C', to_date('07-02-2022', 'dd-mm-yyyy'), to_date('23-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13484, 'Hg', to_date('12-08-2021', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13542, 'Ga', to_date('11-05-2022', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13600, 'No', to_date('14-09-2021', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13658, 'Nd', to_date('12-05-2021', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13716, 'Tm', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('09-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13774, 'Zr', to_date('18-04-2021', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13832, 'Ho', to_date('21-03-2021', 'dd-mm-yyyy'), to_date('09-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13890, 'Pt', to_date('09-01-2021', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13948, 'I', to_date('08-02-2021', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14006, 'In', to_date('11-09-2021', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14064, 'Lu', to_date('08-01-2022', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14122, 'Zr', to_date('21-09-2021', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14180, 'Kr', to_date('24-02-2021', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14238, 'Tm', to_date('20-04-2021', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14296, 'Lr', to_date('01-05-2022', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14354, 'Cf', to_date('20-11-2021', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14412, 'B', to_date('15-12-2021', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14470, 'Ba', to_date('21-02-2021', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14528, 'I', to_date('14-01-2021', 'dd-mm-yyyy'), to_date('18-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14586, 'Gd', to_date('24-09-2021', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14644, 'Na', to_date('26-09-2021', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14702, 'Ga', to_date('20-06-2021', 'dd-mm-yyyy'), to_date('04-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14760, 'Ce', to_date('20-03-2021', 'dd-mm-yyyy'), to_date('17-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14818, 'Cu', to_date('16-10-2021', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14876, 'No', to_date('07-02-2021', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14934, 'Am', to_date('12-06-2021', 'dd-mm-yyyy'), to_date('19-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14992, 'B', to_date('15-02-2021', 'dd-mm-yyyy'), to_date('23-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15050, 'Ho', to_date('28-10-2021', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15108, 'No', to_date('17-11-2021', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15166, 'Eu', to_date('14-03-2022', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15224, 'Ac', to_date('03-03-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15282, 'Md', to_date('22-11-2021', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15340, 'Md', to_date('25-04-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15398, 'Es', to_date('01-11-2021', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15456, 'At', to_date('24-07-2021', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15514, 'Ir', to_date('31-03-2022', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15572, 'Ne', to_date('16-09-2021', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15630, 'Es', to_date('30-01-2021', 'dd-mm-yyyy'), to_date('16-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15688, 'Be', to_date('15-04-2021', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15746, 'Gd', to_date('30-09-2021', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15804, 'Re', to_date('22-02-2021', 'dd-mm-yyyy'), to_date('29-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15862, 'At', to_date('07-11-2021', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15920, 'Y', to_date('26-10-2021', 'dd-mm-yyyy'), to_date('25-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15978, 'Cr', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('02-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16036, 'Er', to_date('10-05-2021', 'dd-mm-yyyy'), to_date('17-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16094, 'Sn', to_date('11-02-2021', 'dd-mm-yyyy'), to_date('24-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16152, 'Fm', to_date('06-08-2021', 'dd-mm-yyyy'), to_date('04-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16210, 'Cd', to_date('09-03-2022', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16268, 'Fe', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16326, 'Es', to_date('06-03-2021', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16384, 'Pt', to_date('21-01-2021', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16442, 'Cs', to_date('03-03-2022', 'dd-mm-yyyy'), to_date('15-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16500, 'Ce', to_date('11-05-2021', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16558, 'Cm', to_date('31-05-2021', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16616, 'At', to_date('11-11-2021', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16674, 'Sm', to_date('27-03-2021', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16732, 'Nd', to_date('16-03-2021', 'dd-mm-yyyy'), to_date('16-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16790, 'Nd', to_date('27-08-2021', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16848, 'P', to_date('19-04-2022', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16906, 'Eu', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16964, 'Ce', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17022, 'Ta', to_date('19-05-2021', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17080, 'Re', to_date('21-04-2021', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17138, 'In', to_date('24-05-2021', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17196, 'Am', to_date('18-01-2022', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17254, 'Hf', to_date('15-08-2021', 'dd-mm-yyyy'), to_date('21-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17312, 'Er', to_date('07-07-2021', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17370, 'Nb', to_date('25-09-2021', 'dd-mm-yyyy'), to_date('22-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17428, 'Ag', to_date('05-07-2021', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17486, 'Sm', to_date('13-06-2021', 'dd-mm-yyyy'), to_date('13-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17544, 'Ir', to_date('19-12-2021', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17602, 'In', to_date('02-07-2021', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17660, 'Nb', to_date('01-08-2021', 'dd-mm-yyyy'), to_date('03-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17718, 'Al', to_date('10-05-2022', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17776, 'Lr', to_date('20-02-2021', 'dd-mm-yyyy'), to_date('31-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17834, 'Tl', to_date('13-11-2021', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17892, 'Zr', to_date('28-10-2021', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17950, 'Lr', to_date('18-10-2021', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18008, 'Au', to_date('29-08-2021', 'dd-mm-yyyy'), to_date('08-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18066, 'Sb', to_date('16-05-2021', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18124, 'Sc', to_date('21-05-2022', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18182, 'Ca', to_date('08-03-2021', 'dd-mm-yyyy'), to_date('06-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18240, 'Po', to_date('16-06-2021', 'dd-mm-yyyy'), to_date('26-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18298, 'Sb', to_date('27-02-2021', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18356, 'H', to_date('12-10-2021', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18414, 'Ac', to_date('07-11-2021', 'dd-mm-yyyy'), to_date('12-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18472, 'Br', to_date('30-05-2021', 'dd-mm-yyyy'), to_date('07-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18530, 'Xe', to_date('20-04-2022', 'dd-mm-yyyy'), to_date('16-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18588, 'Bk', to_date('24-07-2021', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18646, 'Gd', to_date('23-04-2022', 'dd-mm-yyyy'), to_date('01-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18704, 'Ac', to_date('20-04-2022', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18762, 'Zr', to_date('13-01-2021', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18820, 'Br', to_date('29-01-2022', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18878, 'Zr', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18936, 'Ac', to_date('10-02-2022', 'dd-mm-yyyy'), to_date('03-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18994, 'Ir', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('29-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19052, 'Ca', to_date('06-01-2022', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19110, 'Cs', to_date('28-08-2021', 'dd-mm-yyyy'), to_date('08-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19168, 'Hf', to_date('18-05-2022', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19226, 'Sc', to_date('03-02-2021', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19284, 'Pb', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('16-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19342, 'Fm', to_date('16-11-2021', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19400, 'Fr', to_date('01-08-2021', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19458, 'Au', to_date('08-05-2022', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19516, 'Sc', to_date('01-05-2022', 'dd-mm-yyyy'), to_date('26-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19574, 'Te', to_date('04-02-2022', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19632, 'In', to_date('03-11-2021', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19690, 'Es', to_date('23-07-2021', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19748, 'Mo', to_date('08-03-2021', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19806, 'Fr', to_date('20-03-2022', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19864, 'Si', to_date('19-12-2021', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19922, 'Ho', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19980, 'Hg', to_date('16-11-2021', 'dd-mm-yyyy'), to_date('24-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20038, 'Nd', to_date('14-04-2021', 'dd-mm-yyyy'), to_date('03-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20096, 'Y', to_date('30-01-2021', 'dd-mm-yyyy'), to_date('25-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20154, 'Pr', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20212, 'As', to_date('21-04-2021', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20270, 'Pa', to_date('04-12-2021', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20328, 'Ga', to_date('09-01-2022', 'dd-mm-yyyy'), to_date('13-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20386, 'Pb', to_date('02-03-2021', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20444, 'Pt', to_date('06-06-2021', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20502, 'Pb', to_date('08-06-2021', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20560, 'I', to_date('18-05-2021', 'dd-mm-yyyy'), to_date('16-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20618, 'Ar', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20676, 'Li', to_date('11-02-2022', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20734, 'Cf', to_date('18-07-2021', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20792, 'Er', to_date('10-03-2021', 'dd-mm-yyyy'), to_date('16-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20850, 'Li', to_date('20-10-2021', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20908, 'Sn', to_date('13-02-2022', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20966, 'Fm', to_date('21-07-2021', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21024, 'K', to_date('26-09-2021', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21082, 'In', to_date('09-06-2021', 'dd-mm-yyyy'), to_date('11-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21140, 'Mg', to_date('11-08-2021', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21198, 'Pr', to_date('14-11-2021', 'dd-mm-yyyy'), to_date('01-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21256, 'Cm', to_date('17-03-2021', 'dd-mm-yyyy'), to_date('15-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21314, 'Pb', to_date('30-04-2022', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21372, 'Rb', to_date('17-04-2021', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21430, 'K', to_date('30-09-2021', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21488, 'Zn', to_date('03-11-2021', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21546, 'O', to_date('24-11-2021', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21604, 'Pb', to_date('13-01-2022', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21662, 'Zr', to_date('20-12-2021', 'dd-mm-yyyy'), to_date('16-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21720, 'Ru', to_date('13-03-2021', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21778, 'Ti', to_date('24-11-2021', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21836, 'W', to_date('14-03-2022', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21894, 'C', to_date('13-04-2021', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21952, 'Es', to_date('07-03-2021', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22010, 'Lr', to_date('21-03-2022', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22068, 'Bi', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22126, 'Ne', to_date('16-03-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22184, 'Am', to_date('28-07-2021', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22242, 'Ra', to_date('30-03-2021', 'dd-mm-yyyy'), to_date('06-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22300, 'Ba', to_date('16-04-2022', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22358, 'Hg', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('17-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22416, 'Mo', to_date('16-06-2021', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22474, 'Ac', to_date('24-06-2021', 'dd-mm-yyyy'), to_date('09-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22532, 'V', to_date('21-03-2022', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22590, 'La', to_date('08-01-2021', 'dd-mm-yyyy'), to_date('04-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22648, 'Rf', to_date('31-05-2021', 'dd-mm-yyyy'), to_date('30-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22706, 'Sm', to_date('02-03-2021', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22764, 'Fe', to_date('15-05-2022', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22822, 'Bi', to_date('30-12-2021', 'dd-mm-yyyy'), to_date('21-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22880, 'Pm', to_date('21-05-2022', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22938, 'Fm', to_date('26-04-2022', 'dd-mm-yyyy'), to_date('21-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22996, 'Cl', to_date('17-07-2021', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23054, 'As', to_date('13-05-2022', 'dd-mm-yyyy'), to_date('05-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23112, 'Ac', to_date('06-11-2021', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23170, 'Te', to_date('29-01-2021', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23228, 'Hf', to_date('31-05-2021', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23286, 'U', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23344, 'Ba', to_date('28-02-2022', 'dd-mm-yyyy'), to_date('31-10-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23402, 'Gd', to_date('04-06-2021', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23460, 'Cm', to_date('11-02-2021', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23518, 'Sc', to_date('19-05-2021', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23576, 'Cs', to_date('26-06-2021', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23634, 'Ta', to_date('21-11-2021', 'dd-mm-yyyy'), to_date('27-12-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23692, 'H', to_date('14-05-2022', 'dd-mm-yyyy'), to_date('18-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23750, 'Ru', to_date('17-01-2022', 'dd-mm-yyyy'), to_date('10-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23808, 'Er', to_date('04-03-2021', 'dd-mm-yyyy'), to_date('09-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23866, 'Gd', to_date('12-04-2021', 'dd-mm-yyyy'), to_date('26-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23924, 'Ra', to_date('09-08-2021', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23982, 'Al', to_date('16-11-2021', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24040, 'Al', to_date('01-02-2022', 'dd-mm-yyyy'), to_date('03-03-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24098, 'Y', to_date('04-12-2021', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24156, 'Se', to_date('20-03-2022', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24214, 'Lu', to_date('22-09-2021', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24272, 'Sc', to_date('12-12-2021', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24330, 'Nd', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('09-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24388, 'Ca', to_date('18-06-2021', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24446, 'Po', to_date('04-03-2022', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24504, 'Pr', to_date('23-01-2022', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24562, 'Tm', to_date('21-05-2021', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24620, 'Rb', to_date('26-06-2021', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24678, 'Bk', to_date('10-12-2021', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24736, 'Ac', to_date('28-01-2021', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24794, 'Xe', to_date('20-09-2021', 'dd-mm-yyyy'), to_date('26-09-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24852, 'Br', to_date('24-05-2022', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24910, 'Rf', to_date('30-06-2021', 'dd-mm-yyyy'), to_date('04-06-2022', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24968, 'S', to_date('18-08-2021', 'dd-mm-yyyy'), to_date('04-01-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (25026, 'Hg', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (25084, 'Zn', to_date('24-03-2022', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (25142, 'Pm', to_date('09-02-2021', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading UNITS...
insert into UNITS (unit_id_, unit_name_, location_)
values (260, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (261, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (262, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (263, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (264, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (265, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (266, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (267, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (268, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (269, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (270, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (271, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (272, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (273, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (274, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (275, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (276, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (277, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (278, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (279, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (280, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (281, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (282, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (283, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (284, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (285, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (286, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (287, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (288, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (289, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (290, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (291, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (292, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (293, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (294, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (295, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (296, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (297, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (298, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (299, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (300, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (301, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (302, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (303, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (304, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (305, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (306, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (307, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (308, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (309, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (310, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (311, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (312, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (313, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (314, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (315, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (316, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (317, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (318, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (319, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (320, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (321, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (322, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (323, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (324, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (325, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (326, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (327, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (328, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (329, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (330, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (331, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (332, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (333, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (334, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (335, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (336, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (337, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (338, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (339, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (340, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (341, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (342, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (343, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (344, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (345, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (346, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (347, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (348, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (349, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (350, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (351, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (352, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (353, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (354, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (355, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (356, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (357, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (358, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (359, 'Home Front Command', 'Modiin');
commit;
prompt 100 records committed...
insert into UNITS (unit_id_, unit_name_, location_)
values (360, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (361, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (362, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (363, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (364, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (365, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (366, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (367, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (368, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (369, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (370, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (371, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (372, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (373, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (374, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (375, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (376, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (377, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (378, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (379, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (380, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (381, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (382, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (383, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (384, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (385, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (386, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (387, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (388, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (389, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (390, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (391, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (392, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (393, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (394, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (395, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (396, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (397, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (398, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (399, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (400, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (119, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (120, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (121, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (122, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (123, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (124, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (125, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (126, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (127, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (128, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (129, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (130, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (131, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (132, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (133, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (134, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (135, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (136, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (137, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (138, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (139, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (140, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (141, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (142, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (143, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (144, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (145, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (146, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (147, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (148, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (149, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (150, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (151, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (152, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (153, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (154, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (155, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (156, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (157, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (158, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (159, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (160, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (161, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (162, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (163, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (164, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (165, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (166, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (167, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (168, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (169, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (170, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (171, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (172, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (173, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (174, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (175, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (176, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (177, 'Air Force', 'Nazareth');
commit;
prompt 200 records committed...
insert into UNITS (unit_id_, unit_name_, location_)
values (178, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (179, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (180, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (181, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (182, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (183, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (184, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (185, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (186, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (187, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (188, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (189, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (190, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (191, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (192, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (193, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (194, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (195, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (196, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (197, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (198, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (199, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (200, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (201, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (202, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (203, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (204, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (205, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (206, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (207, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (208, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (209, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (210, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (211, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (212, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (213, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (214, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (215, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (216, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (217, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (218, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (219, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (220, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (221, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (222, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (223, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (224, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (225, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (226, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (227, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (228, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (229, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (230, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (231, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (232, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (233, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (234, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (235, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (236, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (237, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (238, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (239, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (240, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (241, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (242, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (243, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (244, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (245, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (246, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (247, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (248, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (249, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (250, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (251, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (252, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (253, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (254, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (255, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (256, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (257, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (258, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (259, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (1, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (2, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (3, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (4, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (5, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (6, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (7, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (8, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (9, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (10, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (11, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (12, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (13, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (14, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (15, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (16, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (17, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (18, 'Intelligence', 'Dimona');
commit;
prompt 300 records committed...
insert into UNITS (unit_id_, unit_name_, location_)
values (19, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (20, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (21, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (22, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (23, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (24, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (25, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (26, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (27, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (28, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (29, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (30, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (31, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (32, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (33, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (34, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (35, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (36, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (37, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (38, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (39, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (40, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (41, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (42, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (43, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (44, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (45, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (46, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (47, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (48, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (49, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (50, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (51, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (52, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (53, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (54, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (55, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (56, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (57, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (58, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (59, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (60, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (61, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (62, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (63, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (64, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (65, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (66, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (67, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (68, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (69, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (70, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (71, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (72, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (73, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (74, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (75, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (76, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (77, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (78, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (79, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (80, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (81, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (82, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (83, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (84, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (85, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (86, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (87, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (88, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (89, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (90, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (91, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (92, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (93, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (94, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (95, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (96, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (97, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (98, 'Intelligence', 'Dimona');
insert into UNITS (unit_id_, unit_name_, location_)
values (99, 'Home Front Command', 'Modiin');
insert into UNITS (unit_id_, unit_name_, location_)
values (100, 'Medical Corps', 'Kfar Saba');
insert into UNITS (unit_id_, unit_name_, location_)
values (101, 'Golani', 'Tel Aviv');
insert into UNITS (unit_id_, unit_name_, location_)
values (102, 'Givati', 'Jerusalem');
insert into UNITS (unit_id_, unit_name_, location_)
values (103, 'Paratroopers', 'Haifa');
insert into UNITS (unit_id_, unit_name_, location_)
values (104, 'Artillery', 'Beersheba');
insert into UNITS (unit_id_, unit_name_, location_)
values (105, 'Armored', 'Eilat');
insert into UNITS (unit_id_, unit_name_, location_)
values (106, 'Navy', 'Ashdod');
insert into UNITS (unit_id_, unit_name_, location_)
values (107, 'Air Force', 'Netanya');
insert into UNITS (unit_id_, unit_name_, location_)
values (108, 'Intelligence', 'Hertzliya');
insert into UNITS (unit_id_, unit_name_, location_)
values (109, 'Home Front Command', 'Ra''anana');
insert into UNITS (unit_id_, unit_name_, location_)
values (110, 'Medical Corps', 'Petah Tikva');
insert into UNITS (unit_id_, unit_name_, location_)
values (111, 'Golani', 'Holon');
insert into UNITS (unit_id_, unit_name_, location_)
values (112, 'Givati', 'Bat Yam');
insert into UNITS (unit_id_, unit_name_, location_)
values (113, 'Paratroopers', 'Rishon LeZion');
insert into UNITS (unit_id_, unit_name_, location_)
values (114, 'Artillery', 'Ashkelon');
insert into UNITS (unit_id_, unit_name_, location_)
values (115, 'Armored', 'Kiryat Shmona');
insert into UNITS (unit_id_, unit_name_, location_)
values (116, 'Navy', 'Afula');
insert into UNITS (unit_id_, unit_name_, location_)
values (117, 'Air Force', 'Nazareth');
insert into UNITS (unit_id_, unit_name_, location_)
values (118, 'Intelligence', 'Dimona');
commit;
prompt 400 records loaded
prompt Loading ROLES_...
insert into ROLES_ (role_id_, role_description_, role_name)
values (96, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (97, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (98, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (99, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (100, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (101, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (102, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (103, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (104, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (105, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (106, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (107, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (108, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (109, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (110, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (111, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (112, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (113, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (114, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (115, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (116, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (117, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (118, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (119, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (120, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (121, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (122, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (123, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (124, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (125, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (126, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (127, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (128, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (129, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (130, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (131, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (132, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (133, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (134, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (135, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (136, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (137, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (138, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (139, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (49, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (50, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (51, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (52, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (53, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (54, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (55, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (56, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (57, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (58, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (59, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (60, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (61, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (62, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (63, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (64, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (65, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (66, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (67, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (68, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (69, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (70, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (71, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (72, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (73, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (74, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (75, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (76, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (77, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (78, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (79, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (80, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (81, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (82, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (83, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (84, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (85, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (86, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (87, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (88, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (89, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (90, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (91, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (92, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (93, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (94, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (95, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (34, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (35, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (36, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (37, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (38, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (39, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (40, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (41, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (42, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Field Engineer');
commit;
prompt 100 records committed...
insert into ROLES_ (role_id_, role_description_, role_name)
values (43, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (44, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (45, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (46, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (47, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (48, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (1, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (5, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (6, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (7, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (8, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (9, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (10, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (11, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (12, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (13, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (14, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (15, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (16, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (17, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (18, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (19, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (20, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (21, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (22, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (23, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (24, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (25, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (26, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (27, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (28, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (29, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (30, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (31, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (32, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (33, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (140, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (141, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (142, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (143, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (144, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (145, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (146, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (147, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (148, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (149, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (150, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (151, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (152, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (153, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (154, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (155, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (156, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (157, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (158, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (159, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (160, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (161, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (162, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (163, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (164, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (165, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (166, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (167, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (168, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (169, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (170, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (171, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (172, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (173, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (174, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (175, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (176, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (177, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (178, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (179, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (180, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (181, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (182, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (183, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (184, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (185, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (186, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (187, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Radioman');
insert into ROLES_ (role_id_, role_description_, role_name)
values (188, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (189, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (190, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (191, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (192, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (193, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (194, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (195, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (196, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (197, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (198, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (199, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (200, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Tank Commander');
commit;
prompt 200 records committed...
insert into ROLES_ (role_id_, role_description_, role_name)
values (201, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (202, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (203, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (204, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (205, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (206, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (207, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (208, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (209, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (210, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (211, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (212, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (213, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (214, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (215, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (216, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (217, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (218, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (219, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (220, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (221, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (222, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (223, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (224, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (225, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (226, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (227, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (228, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (229, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (230, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (231, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (232, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (233, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (234, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (235, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (236, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (237, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (238, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (239, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (240, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (241, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (242, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (243, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (244, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (245, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (246, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (247, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Radioman');
insert into ROLES_ (role_id_, role_description_, role_name)
values (248, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (249, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (250, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (251, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (252, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (253, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (254, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (255, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (256, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (257, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (258, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (259, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (260, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (261, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (262, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (263, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (264, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (265, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (266, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (267, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (268, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (269, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (270, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (271, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (272, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (273, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (274, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (275, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (276, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (277, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (278, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (279, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (280, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (281, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (282, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (283, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (284, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (285, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (286, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (287, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (288, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (289, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (290, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (291, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (292, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (293, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Radioman');
insert into ROLES_ (role_id_, role_description_, role_name)
values (294, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (295, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (296, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (297, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (298, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (299, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (300, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Field Mechanic');
commit;
prompt 300 records committed...
insert into ROLES_ (role_id_, role_description_, role_name)
values (301, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (302, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (303, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (304, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (305, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (306, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (307, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (308, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (309, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (310, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (311, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (312, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (313, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (314, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (315, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (316, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (317, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (318, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (319, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (320, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Air Force Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (321, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (322, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (323, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (324, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (325, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Naval Commando');
insert into ROLES_ (role_id_, role_description_, role_name)
values (326, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Reconnaissance Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (327, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (328, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (329, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (330, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (331, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (332, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Radioman');
insert into ROLES_ (role_id_, role_description_, role_name)
values (333, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (334, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (335, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (336, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Naval Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (337, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (338, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (339, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (340, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (341, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (342, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (343, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Combat Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (344, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (345, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Paratrooper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (346, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (347, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Military Police Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (348, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (349, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (350, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (351, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (352, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (353, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (354, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (355, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (356, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (357, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (358, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (359, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (360, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (361, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (362, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (363, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'Field Engineer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (364, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (365, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Cyber Defense Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (366, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Field Mechanic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (367, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Artillery Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (368, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (369, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (370, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Tank Commander');
insert into ROLES_ (role_id_, role_description_, role_name)
values (371, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (372, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (373, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (374, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Air Traffic Controller');
insert into ROLES_ (role_id_, role_description_, role_name)
values (375, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (376, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Training Instructo');
insert into ROLES_ (role_id_, role_description_, role_name)
values (377, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (378, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (379, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Combat Medic');
insert into ROLES_ (role_id_, role_description_, role_name)
values (380, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (381, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Explosive Ordnance Disposal Specialist');
insert into ROLES_ (role_id_, role_description_, role_name)
values (382, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (383, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (384, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Armored Corps Driver');
insert into ROLES_ (role_id_, role_description_, role_name)
values (385, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Field Intelligence Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (386, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Sniper');
insert into ROLES_ (role_id_, role_description_, role_name)
values (387, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (388, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Signal Corps Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (389, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Infantry Soldier');
insert into ROLES_ (role_id_, role_description_, role_name)
values (390, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (391, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Medical Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (392, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Military Intelligence Analyst');
insert into ROLES_ (role_id_, role_description_, role_name)
values (393, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Drone Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (394, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Artillery Forward Observer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (395, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Radioman');
insert into ROLES_ (role_id_, role_description_, role_name)
values (396, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Special Forces Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (397, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Logistics Officer');
insert into ROLES_ (role_id_, role_description_, role_name)
values (398, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Helicopter Pilot');
insert into ROLES_ (role_id_, role_description_, role_name)
values (399, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Search and Rescue Operator');
insert into ROLES_ (role_id_, role_description_, role_name)
values (400, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'Cyber Defense Specialist');
commit;
prompt 400 records loaded
prompt Loading SALARIES...
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10000, 9555, to_date('21-10-1993', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10050, 12879, to_date('27-10-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10100, 5541, to_date('27-03-1994', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10150, 6460, to_date('06-05-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10200, 4801, to_date('04-08-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10250, 11813, to_date('06-08-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10300, 7017, to_date('15-01-2021', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10350, 4805, to_date('03-06-2021', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10400, 9502, to_date('04-04-1981', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10450, 8486, to_date('02-01-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10500, 8850, to_date('12-03-2024', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10550, 3833, to_date('10-08-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10600, 7155, to_date('09-09-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10650, 4183, to_date('06-08-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10700, 10799, to_date('08-10-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10750, 4006, to_date('23-03-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10800, 12356, to_date('31-03-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10850, 12704, to_date('30-05-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10900, 8300, to_date('28-04-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (10950, 8455, to_date('16-10-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11000, 8202, to_date('11-08-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11050, 7869, to_date('11-06-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11100, 3567, to_date('06-06-1985', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11150, 11846, to_date('19-03-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11200, 6205, to_date('22-08-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11250, 8470, to_date('19-12-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11300, 9848, to_date('04-11-2018', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11350, 7279, to_date('08-03-1984', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11400, 9814, to_date('03-01-1975', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11450, 12092, to_date('24-05-1998', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11500, 9031, to_date('11-08-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11550, 11221, to_date('07-03-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11600, 10899, to_date('16-01-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11650, 6678, to_date('26-05-1975', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11700, 11883, to_date('02-04-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11750, 6972, to_date('30-03-1994', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11800, 9243, to_date('05-03-1998', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11850, 10081, to_date('18-10-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11900, 11921, to_date('04-09-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (11950, 5673, to_date('24-12-1974', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12000, 5293, to_date('13-10-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12050, 8241, to_date('10-06-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12100, 12064, to_date('19-02-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12150, 5936, to_date('28-02-1975', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12200, 5969, to_date('26-03-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12250, 10901, to_date('24-04-1982', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12300, 4633, to_date('04-03-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12350, 11315, to_date('23-04-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12400, 3738, to_date('08-07-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12450, 5960, to_date('28-10-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12500, 4214, to_date('02-10-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12550, 6115, to_date('01-07-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12600, 8539, to_date('09-07-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12650, 11456, to_date('14-09-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12700, 4026, to_date('14-08-1994', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12750, 8932, to_date('30-04-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12800, 13173, to_date('13-01-2005', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12850, 6286, to_date('28-06-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12900, 5058, to_date('01-11-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (12950, 4919, to_date('15-12-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13000, 11553, to_date('26-10-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13050, 8312, to_date('12-01-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13100, 8503, to_date('13-02-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13150, 5557, to_date('24-08-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13200, 10110, to_date('30-03-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13250, 11292, to_date('23-12-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13300, 11312, to_date('06-08-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13350, 7034, to_date('12-03-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13400, 12460, to_date('12-07-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13450, 9510, to_date('24-01-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13500, 4853, to_date('12-12-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13550, 6484, to_date('12-02-2018', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13600, 7179, to_date('03-08-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13650, 10579, to_date('04-06-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13700, 6527, to_date('25-09-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13750, 6390, to_date('01-11-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13800, 8444, to_date('12-04-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13850, 6581, to_date('21-06-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13900, 4948, to_date('18-12-1974', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (13950, 7184, to_date('12-11-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14000, 10222, to_date('03-11-2010', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14050, 13000, to_date('22-05-2003', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14100, 7730, to_date('13-08-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14150, 7926, to_date('20-08-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14200, 3273, to_date('08-12-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14250, 6267, to_date('29-10-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14300, 12780, to_date('14-03-2024', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14350, 5118, to_date('07-11-1994', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14400, 5223, to_date('23-11-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14450, 8721, to_date('11-08-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14500, 12560, to_date('10-09-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14550, 9556, to_date('01-12-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14600, 4179, to_date('22-12-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14650, 12477, to_date('23-10-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14700, 11398, to_date('28-01-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14750, 11557, to_date('06-02-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14800, 4962, to_date('24-12-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14850, 10892, to_date('01-04-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14900, 6113, to_date('20-11-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (14950, 4032, to_date('22-07-1999', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15000, 8805, to_date('02-12-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15050, 8261, to_date('13-03-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15100, 9554, to_date('28-07-1981', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15150, 3690, to_date('27-06-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15200, 6095, to_date('01-04-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15250, 7754, to_date('05-04-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15300, 7583, to_date('30-05-2021', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15350, 10668, to_date('21-12-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15400, 12043, to_date('17-09-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15450, 7423, to_date('02-09-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15500, 8741, to_date('12-11-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15550, 6103, to_date('14-07-2009', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15600, 5948, to_date('14-10-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15650, 4311, to_date('30-12-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15700, 7448, to_date('04-05-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15750, 7543, to_date('01-10-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15800, 12878, to_date('27-04-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15850, 6634, to_date('14-08-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15900, 10034, to_date('13-09-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (15950, 13030, to_date('10-01-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16000, 9360, to_date('12-03-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16050, 4297, to_date('29-10-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16100, 4164, to_date('02-11-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16150, 12977, to_date('07-01-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16200, 11275, to_date('07-05-2015', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16250, 7203, to_date('05-12-2018', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16300, 10983, to_date('08-08-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16350, 10126, to_date('25-05-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16400, 5670, to_date('09-01-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16450, 12037, to_date('19-09-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16500, 11008, to_date('20-07-2011', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16550, 7791, to_date('18-06-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16600, 5071, to_date('08-01-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16650, 6987, to_date('28-12-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16700, 12448, to_date('04-09-2010', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16750, 6183, to_date('06-12-1998', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16800, 5411, to_date('18-02-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16850, 4459, to_date('12-01-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16900, 13162, to_date('25-12-1993', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (16950, 6826, to_date('10-07-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17000, 6766, to_date('17-10-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17050, 12211, to_date('15-09-2021', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17100, 5544, to_date('15-03-2018', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17150, 5146, to_date('14-05-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17200, 7349, to_date('20-09-2015', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17250, 12576, to_date('12-12-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17300, 4408, to_date('05-05-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17350, 11058, to_date('16-10-1975', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17400, 10564, to_date('01-10-1984', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17450, 9479, to_date('20-06-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17500, 8334, to_date('22-08-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17550, 7974, to_date('20-04-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17600, 5321, to_date('09-02-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17650, 3928, to_date('27-03-2003', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17700, 3921, to_date('23-11-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17750, 9459, to_date('09-08-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17800, 9161, to_date('03-01-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17850, 7445, to_date('06-03-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17900, 12962, to_date('24-03-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (17950, 4558, to_date('18-05-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18000, 5032, to_date('11-12-2018', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18050, 3872, to_date('03-09-1996', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18100, 3404, to_date('07-08-1992', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18150, 10720, to_date('26-01-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18200, 10539, to_date('25-11-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18250, 8826, to_date('05-11-2021', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18300, 12399, to_date('12-10-1997', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18350, 5441, to_date('05-02-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18400, 10989, to_date('19-03-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18450, 7878, to_date('17-01-1974', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18500, 3780, to_date('12-04-1997', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18550, 5311, to_date('13-01-2014', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18600, 5004, to_date('20-10-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18650, 12267, to_date('22-12-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18700, 7283, to_date('11-09-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18750, 3876, to_date('30-05-1985', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18800, 3493, to_date('02-06-1977', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18850, 3304, to_date('03-05-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18900, 12089, to_date('06-11-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (18950, 7150, to_date('06-02-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19000, 11830, to_date('20-04-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19050, 4256, to_date('22-12-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19100, 12761, to_date('20-02-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19150, 7549, to_date('28-04-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19200, 5187, to_date('31-12-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19250, 11064, to_date('18-02-2024', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19300, 8517, to_date('15-04-2003', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19350, 5717, to_date('17-08-2004', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19400, 6494, to_date('06-06-1985', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19450, 10744, to_date('28-02-1993', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19500, 5624, to_date('13-11-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19550, 10587, to_date('23-11-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19600, 8286, to_date('30-11-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19650, 7883, to_date('08-01-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19700, 12948, to_date('11-11-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19750, 7718, to_date('21-09-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19800, 7124, to_date('08-06-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19850, 9454, to_date('14-12-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19900, 10756, to_date('22-10-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (19950, 5379, to_date('26-03-2004', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20000, 11273, to_date('23-01-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20050, 7776, to_date('19-10-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20100, 12196, to_date('02-12-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20150, 9106, to_date('02-04-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20200, 11682, to_date('15-03-2005', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20250, 11353, to_date('15-11-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20300, 8466, to_date('11-11-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20350, 4344, to_date('10-02-2024', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20400, 5838, to_date('15-06-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20450, 4202, to_date('18-06-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20500, 6653, to_date('22-06-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20550, 6888, to_date('12-01-1994', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20600, 4810, to_date('15-01-1974', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20650, 12763, to_date('19-02-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20700, 10984, to_date('10-07-2010', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20750, 11939, to_date('09-12-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20800, 3622, to_date('31-03-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20850, 11739, to_date('19-03-2024', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20900, 7175, to_date('26-03-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (20950, 10953, to_date('11-01-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21000, 4470, to_date('18-11-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21050, 7179, to_date('27-01-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21100, 9601, to_date('24-08-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21150, 6628, to_date('22-05-1982', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21200, 3256, to_date('28-11-1997', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21250, 8241, to_date('26-08-2011', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21300, 12072, to_date('05-10-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21350, 6122, to_date('02-03-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21400, 9082, to_date('18-04-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21450, 7035, to_date('08-07-1974', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21500, 11359, to_date('11-04-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21550, 12402, to_date('09-03-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21600, 7147, to_date('14-06-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21650, 6359, to_date('26-12-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21700, 3999, to_date('15-02-1992', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21750, 3779, to_date('11-07-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21800, 4364, to_date('22-06-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21850, 5766, to_date('30-12-1992', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21900, 6090, to_date('12-01-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (21950, 11087, to_date('06-07-1985', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22000, 8425, to_date('20-10-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22050, 5659, to_date('09-01-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22100, 6554, to_date('18-01-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22150, 3927, to_date('16-02-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22200, 9981, to_date('21-08-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22250, 9530, to_date('07-05-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22300, 13061, to_date('16-09-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22350, 3916, to_date('04-08-1982', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22400, 7730, to_date('22-03-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22450, 4429, to_date('05-03-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22500, 11507, to_date('08-05-2010', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22550, 7005, to_date('16-12-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22600, 6772, to_date('28-03-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22650, 9217, to_date('06-07-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22700, 8208, to_date('19-11-2006', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22750, 3440, to_date('28-11-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22800, 10106, to_date('05-02-1993', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22850, 11503, to_date('11-11-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22900, 5547, to_date('12-02-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (22950, 5806, to_date('20-07-2004', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23000, 3303, to_date('26-02-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23050, 12169, to_date('23-09-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23100, 10584, to_date('09-02-1981', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23150, 5549, to_date('03-01-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23200, 11936, to_date('02-10-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23250, 8322, to_date('25-11-2021', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23300, 6972, to_date('12-02-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23350, 7242, to_date('13-03-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23400, 12853, to_date('15-04-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23450, 4242, to_date('22-02-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23500, 9593, to_date('09-07-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23550, 11231, to_date('07-04-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23600, 7787, to_date('29-10-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23650, 10502, to_date('05-07-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23700, 12832, to_date('05-08-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23750, 4359, to_date('26-09-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23800, 10500, to_date('16-05-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23850, 11378, to_date('22-10-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23900, 11636, to_date('27-10-2004', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (23950, 8540, to_date('18-02-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24000, 7201, to_date('17-04-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24050, 9997, to_date('02-12-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24100, 5762, to_date('08-04-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24150, 8051, to_date('28-02-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24200, 9619, to_date('22-12-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24250, 11912, to_date('14-11-1992', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24300, 7148, to_date('03-07-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24350, 4317, to_date('15-09-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24400, 11684, to_date('03-04-2015', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24450, 6817, to_date('02-10-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24500, 10583, to_date('01-10-1982', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24550, 9131, to_date('15-08-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24600, 9020, to_date('05-09-1975', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24650, 8094, to_date('03-08-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24700, 7292, to_date('12-01-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24750, 6149, to_date('01-05-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24800, 11596, to_date('27-09-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24850, 10895, to_date('10-06-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24900, 11583, to_date('07-07-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (24950, 10039, to_date('02-06-1971', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25000, 9736, to_date('05-07-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25050, 8054, to_date('11-02-2010', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25100, 10994, to_date('07-11-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25150, 4336, to_date('06-01-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25200, 12891, to_date('26-11-1982', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25250, 4145, to_date('05-06-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25300, 9113, to_date('27-04-1981', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25350, 6813, to_date('01-01-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25400, 11917, to_date('23-04-2015', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25450, 7763, to_date('18-09-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25500, 11791, to_date('25-12-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25550, 3608, to_date('17-03-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25600, 4162, to_date('20-08-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25650, 11991, to_date('26-09-1985', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25700, 6527, to_date('09-08-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25750, 10856, to_date('26-12-2005', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25800, 11720, to_date('26-02-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25850, 12806, to_date('08-05-2014', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25900, 4663, to_date('24-03-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (25950, 5091, to_date('15-08-1994', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26000, 3278, to_date('11-12-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26050, 5716, to_date('25-10-1981', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26100, 7074, to_date('19-11-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26150, 10995, to_date('11-07-1971', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26200, 8147, to_date('11-12-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26250, 10388, to_date('16-04-1982', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26300, 12785, to_date('25-07-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26350, 8169, to_date('25-10-1977', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26400, 4524, to_date('12-10-1974', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26450, 3844, to_date('10-02-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26500, 10784, to_date('29-09-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26550, 5201, to_date('24-09-2020', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26600, 9890, to_date('01-06-2009', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26650, 11012, to_date('02-07-1992', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26700, 4805, to_date('01-10-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26750, 12357, to_date('03-01-1980', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26800, 5344, to_date('02-01-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26850, 4343, to_date('24-01-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26900, 11362, to_date('06-04-1984', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (26950, 12408, to_date('12-04-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27000, 12318, to_date('10-07-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27050, 10532, to_date('29-08-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27100, 11144, to_date('30-11-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27150, 9206, to_date('24-01-2004', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27200, 13181, to_date('14-08-2022', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27250, 6398, to_date('30-04-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27300, 12977, to_date('14-10-2012', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27350, 4720, to_date('29-07-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27400, 4318, to_date('27-08-1985', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27450, 11927, to_date('06-05-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27500, 11433, to_date('23-12-2004', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27550, 4079, to_date('08-02-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27600, 12514, to_date('20-07-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27650, 12273, to_date('14-12-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27700, 7256, to_date('27-09-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27750, 8784, to_date('16-03-1984', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27800, 4989, to_date('10-01-2008', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27850, 7264, to_date('06-06-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27900, 11001, to_date('29-10-1990', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (27950, 8062, to_date('21-04-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28000, 11507, to_date('06-11-1983', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28050, 9278, to_date('07-08-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28100, 9971, to_date('07-06-2023', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28150, 8152, to_date('08-09-2013', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28200, 10779, to_date('05-09-2015', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28250, 9413, to_date('21-04-1999', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28300, 7923, to_date('13-07-1981', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28350, 9977, to_date('17-04-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28400, 9040, to_date('13-09-2016', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28450, 11436, to_date('14-02-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28500, 8181, to_date('02-11-1992', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28550, 4847, to_date('03-07-1997', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28600, 12275, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28650, 4164, to_date('13-06-2009', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28700, 9804, to_date('26-09-1976', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28750, 8103, to_date('23-02-1970', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28800, 11507, to_date('01-06-1989', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28850, 11594, to_date('27-12-1979', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28900, 6871, to_date('06-06-2005', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (28950, 11284, to_date('19-11-1991', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29000, 10998, to_date('22-02-2001', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29050, 11793, to_date('27-08-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29100, 10771, to_date('22-06-1988', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29150, 12039, to_date('15-03-2019', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29200, 9803, to_date('07-06-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29250, 13145, to_date('10-11-1978', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29300, 5948, to_date('04-05-1986', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29350, 12323, to_date('19-03-2007', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29400, 6339, to_date('22-05-1995', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29450, 9322, to_date('23-10-2002', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29500, 8266, to_date('17-07-2010', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29550, 4767, to_date('11-06-1972', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29600, 6063, to_date('01-12-1973', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29650, 11989, to_date('16-03-2011', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29700, 7073, to_date('03-08-2017', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29750, 6947, to_date('18-08-2004', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29800, 12354, to_date('19-12-2000', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29850, 11994, to_date('26-04-1997', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29900, 9883, to_date('03-12-1987', 'dd-mm-yyyy'));
insert into SALARIES (salary_id_, amount_, payment_date_)
values (29950, 4223, to_date('30-11-2009', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading SOLDIERS...
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10000, 'Lizzy', 'Freeman', to_date('21-10-1970', 'dd-mm-yyyy'), 'Major General', 125, 11250, 32);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10058, 'Anthony', 'Davis', to_date('28-01-2003', 'dd-mm-yyyy'), 'Sergeant First Class', 35, 28100, 227);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10116, 'Tia', 'McCain', to_date('05-07-1973', 'dd-mm-yyyy'), 'Brigadier General', 206, 22250, 262);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10174, 'Johnette', 'Fogerty', to_date('03-08-1977', 'dd-mm-yyyy'), 'Major General', 285, 10000, 286);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10232, 'Mykelti', 'Conlee', to_date('26-04-1977', 'dd-mm-yyyy'), 'Colonel', 216, 17050, 154);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10290, 'Gina', 'Numan', to_date('21-05-1978', 'dd-mm-yyyy'), 'Colonel', 295, 24750, 254);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10348, 'Stewart', 'Biel', to_date('11-10-1986', 'dd-mm-yyyy'), 'Major', 124, 29750, 296);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10406, 'Rip', 'Stills', to_date('24-12-1970', 'dd-mm-yyyy'), 'Sergeant', 242, 19700, 105);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10464, 'Charlton', 'Tomlin', to_date('24-06-1985', 'dd-mm-yyyy'), 'Warrant Officer', 131, 21550, 186);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10522, 'Cameron', 'Leachman', to_date('07-08-1971', 'dd-mm-yyyy'), 'Captain', 354, 22900, 355);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10580, 'Treat', 'Krieger', to_date('01-02-1985', 'dd-mm-yyyy'), 'Corporal', 399, 11100, 256);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10638, 'Geraldine', 'Patton', to_date('29-01-1991', 'dd-mm-yyyy'), 'Brigadier General', 172, 16500, 9);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10696, 'Melanie', 'Garofalo', to_date('27-06-1971', 'dd-mm-yyyy'), 'Second Lieutenant', 55, 12450, 15);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10754, 'Elizabeth', 'Conway', to_date('26-11-1996', 'dd-mm-yyyy'), 'Sergeant First Class', 346, 27600, 280);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10812, 'Rutger', 'Epps', to_date('05-04-2003', 'dd-mm-yyyy'), 'General', 18, 11950, 326);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10870, 'Rhett', 'Peniston', to_date('23-08-1996', 'dd-mm-yyyy'), 'Sergeant First Class', 257, 23750, 210);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10928, 'Kurtwood', 'Gayle', to_date('01-01-2003', 'dd-mm-yyyy'), 'Sergeant Major', 51, 17300, 108);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (10986, 'Glen', 'Allan', to_date('20-02-1991', 'dd-mm-yyyy'), 'Second Lieutenant', 187, 11300, 291);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11044, 'Regina', 'Imperioli', to_date('23-10-1994', 'dd-mm-yyyy'), 'Staff Sergeant', 326, 21500, 21);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11102, 'Russell', 'Cooper', to_date('13-10-1982', 'dd-mm-yyyy'), 'Second Lieutenant', 124, 28350, 308);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11160, 'Javon', 'Begley', to_date('13-08-1983', 'dd-mm-yyyy'), 'Sergeant First Class', 174, 24200, 395);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11218, 'Mac', 'Cruz', to_date('30-04-1990', 'dd-mm-yyyy'), 'Major General', 293, 18800, 276);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11276, 'Corey', 'Eckhart', to_date('11-05-2003', 'dd-mm-yyyy'), 'Corporal', 289, 29250, 1);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11334, 'Edgar', 'Carrey', to_date('02-01-1970', 'dd-mm-yyyy'), 'Staff Sergeant', 224, 21500, 179);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11392, 'Jonny', 'Brock', to_date('05-05-1980', 'dd-mm-yyyy'), 'Second Lieutenant', 209, 26750, 256);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11450, 'Tal', 'Maxwell', to_date('06-01-1973', 'dd-mm-yyyy'), 'Corporal', 212, 12450, 84);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11508, 'Melba', 'Farina', to_date('25-04-1985', 'dd-mm-yyyy'), 'Lieutenant', 287, 14800, 355);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11566, 'Collective', 'De Almeida', to_date('21-05-1970', 'dd-mm-yyyy'), 'Major', 31, 25050, 245);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11624, 'Chaka', 'Albright', to_date('10-08-1983', 'dd-mm-yyyy'), 'Staff Sergeant', 175, 21300, 210);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11682, 'Vern', 'Underwood', to_date('28-11-2003', 'dd-mm-yyyy'), 'Second Lieutenant', 114, 10050, 353);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11740, 'Bebe', 'Dickinson', to_date('20-09-1996', 'dd-mm-yyyy'), 'Lieutenant', 348, 26850, 251);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11798, 'Carolyn', 'Bosco', to_date('12-08-1995', 'dd-mm-yyyy'), 'Staff Sergeant', 48, 29500, 86);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11856, 'Carl', 'Conroy', to_date('17-04-2002', 'dd-mm-yyyy'), 'Corporal', 159, 17100, 25);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11914, 'Mykelti', 'De Almeida', to_date('22-09-1968', 'dd-mm-yyyy'), 'Lieutenant Colonel', 158, 13750, 21);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (11972, 'Johnnie', 'Parm', to_date('05-09-1991', 'dd-mm-yyyy'), 'First Sergeant', 20, 13400, 274);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12030, 'Tara', 'Johnson', to_date('13-10-1976', 'dd-mm-yyyy'), 'Colonel', 304, 13050, 395);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12088, 'Carlos', 'Napolitano', to_date('15-10-1971', 'dd-mm-yyyy'), 'Corporal', 134, 22050, 37);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12146, 'Ron', 'Baldwin', to_date('09-03-2005', 'dd-mm-yyyy'), 'Colonel', 80, 12550, 399);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12204, 'Mae', 'McKellen', to_date('19-09-1965', 'dd-mm-yyyy'), 'Captain', 2, 29800, 138);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12262, 'Kate', 'Heron', to_date('20-03-1968', 'dd-mm-yyyy'), 'Private', 107, 18350, 238);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12320, 'Stellan', 'Hobson', to_date('07-02-1988', 'dd-mm-yyyy'), 'Warrant Officer', 123, 14150, 203);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12378, 'Brian', 'Polley', to_date('13-09-1998', 'dd-mm-yyyy'), 'Corporal', 221, 26250, 186);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12436, 'Kirk', 'Westerberg', to_date('27-12-1998', 'dd-mm-yyyy'), 'Major', 121, 15400, 100);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12494, 'Hilton', 'Randal', to_date('14-09-1992', 'dd-mm-yyyy'), 'Major General', 358, 25400, 20);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12552, 'Manu', 'Kier', to_date('28-07-1997', 'dd-mm-yyyy'), 'Lieutenant General', 350, 11900, 283);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12610, 'Maria', 'Greene', to_date('03-02-1965', 'dd-mm-yyyy'), 'Sergeant First Class', 139, 23450, 307);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12668, 'Rutger', 'Dushku', to_date('11-04-1969', 'dd-mm-yyyy'), 'Major', 384, 16400, 158);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12726, 'Aida', 'Dale', to_date('17-12-2002', 'dd-mm-yyyy'), 'General', 189, 28100, 313);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12784, 'Marina', 'Hawthorne', to_date('23-08-1967', 'dd-mm-yyyy'), 'Lieutenant', 357, 23300, 255);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12842, 'Balthazar', 'Oldman', to_date('30-04-1996', 'dd-mm-yyyy'), 'Brigadier General', 218, 11800, 357);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12900, 'Azucar', 'Hanks', to_date('29-12-1985', 'dd-mm-yyyy'), 'Lieutenant General', 288, 15800, 372);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (12958, 'George', 'Dreyfuss', to_date('09-02-1993', 'dd-mm-yyyy'), 'Master Sergeant', 212, 22750, 366);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13016, 'Vondie', 'Davis', to_date('15-09-1975', 'dd-mm-yyyy'), 'Chief Warrant Officer', 121, 17250, 182);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13074, 'Christina', 'Weiss', to_date('15-05-1972', 'dd-mm-yyyy'), 'Private', 229, 23100, 132);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13132, 'Machine', 'Farris', to_date('06-11-1982', 'dd-mm-yyyy'), 'Lieutenant', 113, 17150, 169);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13190, 'Roger', 'Drive', to_date('10-07-1976', 'dd-mm-yyyy'), 'Warrant Officer', 363, 25000, 222);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13248, 'Gran', 'Drive', to_date('28-02-1991', 'dd-mm-yyyy'), 'Second Lieutenant', 340, 26450, 26);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13306, 'Gerald', 'Devine', to_date('09-04-1990', 'dd-mm-yyyy'), 'Sergeant Major', 52, 20950, 224);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13364, 'Willem', 'McPherson', to_date('18-10-1991', 'dd-mm-yyyy'), 'Colonel', 392, 14000, 190);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13422, 'Vivica', 'Nicholas', to_date('05-06-1966', 'dd-mm-yyyy'), 'Lieutenant', 19, 15550, 90);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13480, 'Judd', 'Patrick', to_date('31-12-1996', 'dd-mm-yyyy'), 'Captain', 345, 15750, 16);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13538, 'Javon', 'Sylvian', to_date('12-05-1971', 'dd-mm-yyyy'), 'Corporal', 309, 24050, 168);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13596, 'Laurence', 'Rundgren', to_date('16-05-1966', 'dd-mm-yyyy'), 'Captain', 274, 20600, 338);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13654, 'Lennie', 'Garfunkel', to_date('09-12-1982', 'dd-mm-yyyy'), 'Second Lieutenant', 169, 19050, 289);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13712, 'Moe', 'Dourif', to_date('13-08-2000', 'dd-mm-yyyy'), 'Second Lieutenant', 184, 15400, 280);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13770, 'Clea', 'Holland', to_date('15-02-1992', 'dd-mm-yyyy'), 'Second Lieutenant', 319, 22600, 322);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13828, 'Mike', 'McGill', to_date('20-08-2000', 'dd-mm-yyyy'), 'Lieutenant', 373, 27300, 171);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13886, 'Bo', 'Crouch', to_date('29-07-1997', 'dd-mm-yyyy'), 'Lieutenant General', 323, 27600, 1);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (13944, 'Miles', 'Lachey', to_date('24-09-1985', 'dd-mm-yyyy'), 'First Sergeant', 345, 22700, 153);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14002, 'Lee', 'Kattan', to_date('06-01-1984', 'dd-mm-yyyy'), 'General', 125, 11050, 150);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14060, 'Christopher', 'Collie', to_date('20-04-1996', 'dd-mm-yyyy'), 'Corporal', 225, 24800, 317);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14118, 'Yolanda', 'Ribisi', to_date('03-05-1982', 'dd-mm-yyyy'), 'Sergeant Major', 134, 23350, 365);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14176, 'Kasey', 'Candy', to_date('15-07-1990', 'dd-mm-yyyy'), 'Brigadier General', 272, 21550, 49);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14234, 'Fiona', 'Salonga', to_date('22-05-1999', 'dd-mm-yyyy'), 'Second Lieutenant', 221, 24550, 106);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14292, 'Nicholas', 'Pollack', to_date('16-09-1972', 'dd-mm-yyyy'), 'Sergeant Major', 152, 10950, 43);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14350, 'Swoosie', 'Carradine', to_date('12-11-1994', 'dd-mm-yyyy'), 'Second Lieutenant', 230, 20750, 337);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14408, 'Dabney', 'Nelson', to_date('05-07-1974', 'dd-mm-yyyy'), 'Lieutenant', 122, 13750, 124);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14466, 'Desmond', 'Cale', to_date('14-04-1996', 'dd-mm-yyyy'), 'Sergeant', 290, 12300, 386);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14524, 'Tea', 'Pressly', to_date('06-10-1969', 'dd-mm-yyyy'), 'General', 231, 15350, 250);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14582, 'Liam', 'Warwick', to_date('08-06-1995', 'dd-mm-yyyy'), 'Lieutenant Colonel', 12, 14250, 261);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14640, 'Machine', 'Feliciano', to_date('15-06-1966', 'dd-mm-yyyy'), 'Lieutenant General', 328, 21350, 21);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14698, 'Christmas', 'Wayans', to_date('28-09-1990', 'dd-mm-yyyy'), 'Lieutenant', 21, 25350, 339);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14756, 'Tanya', 'David', to_date('22-01-1980', 'dd-mm-yyyy'), 'Major', 387, 24000, 54);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14814, 'Nikki', 'Tucci', to_date('09-08-2003', 'dd-mm-yyyy'), 'Major', 323, 20750, 161);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14872, 'Jaime', 'Smith', to_date('06-10-1971', 'dd-mm-yyyy'), 'Staff Sergeant', 26, 23800, 114);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14930, 'Jena', 'Scheider', to_date('24-10-2000', 'dd-mm-yyyy'), 'First Sergeant', 296, 21950, 11);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (14988, 'Gwyneth', 'Jordan', to_date('08-09-1987', 'dd-mm-yyyy'), 'First Sergeant', 117, 29900, 390);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15046, 'Mika', 'Ammons', to_date('13-11-1982', 'dd-mm-yyyy'), 'Chief Warrant Officer', 153, 13150, 310);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15104, 'Lisa', 'Thornton', to_date('03-12-1987', 'dd-mm-yyyy'), 'Warrant Officer', 295, 18850, 346);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15162, 'Leo', 'Hubbard', to_date('13-08-1995', 'dd-mm-yyyy'), 'Major', 13, 17700, 208);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15220, 'Cliff', 'Arden', to_date('14-07-1996', 'dd-mm-yyyy'), 'Chief Warrant Officer', 33, 22000, 215);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15278, 'Ian', 'Palminteri', to_date('16-08-1999', 'dd-mm-yyyy'), 'Master Sergeant', 279, 24650, 85);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15336, 'Ernest', 'Pfeiffer', to_date('10-10-1995', 'dd-mm-yyyy'), 'General', 265, 22250, 80);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15394, 'Geoff', 'Wheel', to_date('26-11-1990', 'dd-mm-yyyy'), 'Colonel', 249, 14100, 361);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15452, 'Julianna', 'Fichtner', to_date('25-01-1982', 'dd-mm-yyyy'), 'Colonel', 354, 28350, 155);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15510, 'Rhea', 'Holly', to_date('26-04-1983', 'dd-mm-yyyy'), 'Chief Warrant Officer', 393, 29300, 53);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15568, 'Isaiah', 'McGregor', to_date('30-01-1968', 'dd-mm-yyyy'), 'Lieutenant Colonel', 258, 23650, 63);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15626, 'Josh', 'Colman', to_date('09-02-1992', 'dd-mm-yyyy'), 'Second Lieutenant', 18, 22550, 365);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15684, 'Linda', 'Rockwell', to_date('28-10-1997', 'dd-mm-yyyy'), 'Private', 339, 15450, 158);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15742, 'Neneh', 'Neill', to_date('16-07-1982', 'dd-mm-yyyy'), 'Major General', 34, 29250, 316);
commit;
prompt 100 records committed...
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15800, 'Avenged', 'O''Sullivan', to_date('15-04-1988', 'dd-mm-yyyy'), 'Major General', 220, 24500, 100);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15858, 'Michael', 'Bentley', to_date('01-11-1987', 'dd-mm-yyyy'), 'General', 331, 27450, 285);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15916, 'Taylor', 'McCabe', to_date('03-04-1981', 'dd-mm-yyyy'), 'Lieutenant', 366, 29850, 204);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (15974, 'Kieran', 'Rauhofer', to_date('16-06-1977', 'dd-mm-yyyy'), 'Lieutenant', 71, 23800, 244);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16032, 'Malcolm', 'Cromwell', to_date('05-10-1967', 'dd-mm-yyyy'), 'Sergeant First Class', 177, 25650, 166);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16090, 'Harold', 'Nolte', to_date('10-03-2002', 'dd-mm-yyyy'), 'Brigadier General', 211, 15050, 297);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16148, 'Gino', 'Epps', to_date('03-07-2002', 'dd-mm-yyyy'), 'Sergeant Major', 72, 14650, 30);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16206, 'Eugene', 'Noseworthy', to_date('13-11-1999', 'dd-mm-yyyy'), 'Captain', 53, 20700, 30);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16264, 'Horace', 'Stuermer', to_date('21-08-1976', 'dd-mm-yyyy'), 'Lieutenant Colonel', 5, 19500, 338);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16322, 'Ellen', 'Pastore', to_date('02-07-1978', 'dd-mm-yyyy'), 'Chief Warrant Officer', 381, 22100, 165);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16380, 'Elle', 'Soda', to_date('26-04-1988', 'dd-mm-yyyy'), 'General', 57, 15650, 334);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16438, 'Donald', 'Kattan', to_date('21-09-1969', 'dd-mm-yyyy'), 'Lieutenant Colonel', 370, 15000, 192);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16496, 'Stephen', 'Cale', to_date('14-03-2000', 'dd-mm-yyyy'), 'Major', 248, 25750, 277);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16554, 'Meredith', 'Kahn', to_date('30-03-1974', 'dd-mm-yyyy'), 'Staff Sergeant', 62, 21250, 12);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16612, 'Carolyn', 'Damon', to_date('16-03-1972', 'dd-mm-yyyy'), 'Warrant Officer', 354, 20950, 400);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16670, 'Pierce', 'Rifkin', to_date('12-12-1978', 'dd-mm-yyyy'), 'Major', 340, 25600, 69);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16728, 'Bonnie', 'Phillippe', to_date('25-06-1992', 'dd-mm-yyyy'), 'Major', 240, 13850, 241);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16786, 'Connie', 'Craven', to_date('23-04-1968', 'dd-mm-yyyy'), 'Staff Sergeant', 10, 26550, 279);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16844, 'Nicky', 'Womack', to_date('18-06-2005', 'dd-mm-yyyy'), 'Master Sergeant', 175, 18400, 10);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16902, 'Philip', 'Shocked', to_date('13-11-2000', 'dd-mm-yyyy'), 'Staff Sergeant', 182, 25150, 16);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (16960, 'James', 'Nightingale', to_date('16-04-2002', 'dd-mm-yyyy'), 'Staff Sergeant', 300, 23000, 159);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17018, 'Katrin', 'Lauper', to_date('13-11-1985', 'dd-mm-yyyy'), 'Chief Warrant Officer', 218, 26400, 59);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17076, 'Brian', 'Cage', to_date('20-10-1980', 'dd-mm-yyyy'), 'Corporal', 339, 24150, 2);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17134, 'Edgar', 'Stanton', to_date('25-08-1981', 'dd-mm-yyyy'), 'Brigadier General', 163, 23200, 163);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17192, 'Hal', 'Coverdale', to_date('07-02-1993', 'dd-mm-yyyy'), 'Corporal', 48, 11850, 158);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17250, 'Nik', 'Washington', to_date('15-06-1985', 'dd-mm-yyyy'), 'Second Lieutenant', 32, 16950, 270);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17308, 'Diane', 'Napolitano', to_date('15-07-1999', 'dd-mm-yyyy'), 'Major', 290, 17700, 315);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17366, 'Lois', 'Roth', to_date('20-05-1968', 'dd-mm-yyyy'), 'Lieutenant General', 303, 28250, 233);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17424, 'Micky', 'Alexander', to_date('18-05-1972', 'dd-mm-yyyy'), 'Corporal', 198, 18050, 47);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17482, 'Campbell', 'Rickman', to_date('28-01-1988', 'dd-mm-yyyy'), 'Captain', 89, 14250, 269);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17540, 'Emmylou', 'Richter', to_date('13-09-1996', 'dd-mm-yyyy'), 'Major General', 103, 25950, 98);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17598, 'Chad', 'Hawn', to_date('10-12-1979', 'dd-mm-yyyy'), 'Corporal', 111, 18900, 281);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17656, 'Oded', 'Ferrer', to_date('26-03-1990', 'dd-mm-yyyy'), 'Chief Warrant Officer', 86, 12000, 184);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17714, 'Anne', 'Buffalo', to_date('16-06-1995', 'dd-mm-yyyy'), 'Lieutenant Colonel', 27, 26900, 161);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17772, 'Jean', 'Weber', to_date('19-07-1972', 'dd-mm-yyyy'), 'Master Sergeant', 400, 21800, 122);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17830, 'Eddie', 'Trejo', to_date('19-08-1992', 'dd-mm-yyyy'), 'Lieutenant Colonel', 346, 19100, 266);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17888, 'Nicholas', 'Devine', to_date('22-08-1987', 'dd-mm-yyyy'), 'Warrant Officer', 90, 12450, 202);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (17946, 'Anthony', 'McLachlan', to_date('17-09-1992', 'dd-mm-yyyy'), 'Lieutenant General', 382, 17900, 20);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18004, 'Sheena', 'Sampson', to_date('27-02-1975', 'dd-mm-yyyy'), 'General', 363, 10000, 262);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18062, 'Daryle', 'Burmester', to_date('22-03-1972', 'dd-mm-yyyy'), 'Sergeant Major', 69, 18800, 98);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18120, 'Freda', 'Utada', to_date('18-06-1976', 'dd-mm-yyyy'), 'Warrant Officer', 194, 19800, 231);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18178, 'Claude', 'Union', to_date('17-01-1972', 'dd-mm-yyyy'), 'Lieutenant Colonel', 25, 28600, 72);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18236, 'Tea', 'Ontiveros', to_date('18-04-1973', 'dd-mm-yyyy'), 'Sergeant Major', 166, 15700, 99);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18294, 'Forest', 'Martinez', to_date('08-12-1975', 'dd-mm-yyyy'), 'Major', 384, 23650, 281);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18352, 'Dionne', 'Thurman', to_date('18-01-1978', 'dd-mm-yyyy'), 'Lieutenant General', 63, 24600, 96);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18410, 'Barbara', 'Neuwirth', to_date('09-04-1965', 'dd-mm-yyyy'), 'Major General', 141, 21500, 32);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18468, 'Lisa', 'Perlman', to_date('26-08-1973', 'dd-mm-yyyy'), 'Captain', 224, 18050, 399);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18526, 'Vincent', 'Tucci', to_date('30-06-1989', 'dd-mm-yyyy'), 'Captain', 328, 25950, 197);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18584, 'Victoria', 'Robinson', to_date('23-03-1977', 'dd-mm-yyyy'), 'Chief Warrant Officer', 68, 16550, 121);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18642, 'Alan', 'Pollak', to_date('23-04-2001', 'dd-mm-yyyy'), 'Brigadier General', 316, 25900, 285);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18700, 'Brenda', 'Holy', to_date('19-01-1968', 'dd-mm-yyyy'), 'Staff Sergeant', 168, 15250, 134);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18758, 'Alfie', 'Torres', to_date('28-04-1994', 'dd-mm-yyyy'), 'General', 117, 10600, 346);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18816, 'Bette', 'McElhone', to_date('05-11-1994', 'dd-mm-yyyy'), 'Sergeant First Class', 37, 21900, 20);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18874, 'Darren', 'Darren', to_date('04-12-1996', 'dd-mm-yyyy'), 'Second Lieutenant', 324, 13550, 78);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18932, 'Christina', 'Benoit', to_date('17-05-2003', 'dd-mm-yyyy'), 'Lieutenant', 150, 12150, 181);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (18990, 'Laura', 'Richards', to_date('09-05-1991', 'dd-mm-yyyy'), 'Corporal', 206, 17400, 191);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19048, 'Miko', 'Yulin', to_date('23-04-1982', 'dd-mm-yyyy'), 'First Sergeant', 166, 24550, 106);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19106, 'Terence', 'Farrell', to_date('02-04-1968', 'dd-mm-yyyy'), 'Captain', 185, 17450, 15);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19164, 'Temuera', 'Kristofferson', to_date('08-04-1980', 'dd-mm-yyyy'), 'Colonel', 387, 27800, 184);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19222, 'Chi', 'Caine', to_date('23-03-2005', 'dd-mm-yyyy'), 'General', 360, 24350, 118);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19280, 'Cevin', 'Donelly', to_date('16-08-1989', 'dd-mm-yyyy'), 'General', 275, 28900, 310);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19338, 'Cyndi', 'Glenn', to_date('04-01-1977', 'dd-mm-yyyy'), 'Corporal', 296, 11200, 229);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19396, 'Tamala', 'Conway', to_date('28-09-1985', 'dd-mm-yyyy'), 'First Sergeant', 152, 23500, 307);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19454, 'Kevin', 'Matthau', to_date('04-10-1979', 'dd-mm-yyyy'), 'Sergeant', 209, 22750, 169);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19512, 'Morgan', 'Pfeiffer', to_date('24-12-2002', 'dd-mm-yyyy'), 'Master Sergeant', 30, 28750, 214);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19570, 'Julianna', 'Akins', to_date('07-07-1973', 'dd-mm-yyyy'), 'Major General', 374, 12200, 118);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19628, 'Mac', 'Rhys-Davies', to_date('02-06-1966', 'dd-mm-yyyy'), 'Sergeant', 311, 18950, 153);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19686, 'Gran', 'Michaels', to_date('21-11-1977', 'dd-mm-yyyy'), 'Lieutenant', 66, 19000, 251);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19744, 'Christine', 'Flack', to_date('10-12-2005', 'dd-mm-yyyy'), 'Lieutenant Colonel', 122, 12050, 213);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19802, 'Charlie', 'Gary', to_date('26-08-1995', 'dd-mm-yyyy'), 'Sergeant Major', 57, 16050, 20);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19860, 'Claude', 'Ward', to_date('12-12-1977', 'dd-mm-yyyy'), 'Colonel', 16, 27150, 396);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19918, 'Juliette', 'Foley', to_date('21-08-2002', 'dd-mm-yyyy'), 'Lieutenant Colonel', 105, 23800, 272);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (19976, 'Debby', 'Dawson', to_date('18-08-1967', 'dd-mm-yyyy'), 'Chief Warrant Officer', 36, 14150, 14);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20034, 'Nicolas', 'Glenn', to_date('27-07-2004', 'dd-mm-yyyy'), 'Staff Sergeant', 65, 15500, 117);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20092, 'Leonardo', 'Assante', to_date('22-10-2001', 'dd-mm-yyyy'), 'Chief Warrant Officer', 267, 25400, 390);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20150, 'Jackson', 'Goodall', to_date('22-08-1995', 'dd-mm-yyyy'), 'Lieutenant General', 59, 13700, 330);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20208, 'Saul', 'Morales', to_date('14-07-2004', 'dd-mm-yyyy'), 'Sergeant Major', 170, 20350, 362);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20266, 'Liv', 'Stanton', to_date('03-11-2000', 'dd-mm-yyyy'), 'First Sergeant', 187, 21050, 340);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20324, 'Bruce', 'Blackmore', to_date('17-08-1970', 'dd-mm-yyyy'), 'Lieutenant Colonel', 339, 23250, 299);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20382, 'Lea', 'Allan', to_date('05-05-1965', 'dd-mm-yyyy'), 'Lieutenant', 132, 15600, 385);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20440, 'Merrilee', 'Derringer', to_date('18-12-1988', 'dd-mm-yyyy'), 'Warrant Officer', 174, 19950, 18);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20498, 'Gailard', 'Brown', to_date('18-02-1968', 'dd-mm-yyyy'), 'Lieutenant', 391, 26750, 360);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20556, 'Ewan', 'Mortensen', to_date('20-07-1997', 'dd-mm-yyyy'), 'Private', 382, 14500, 19);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20614, 'Gabrielle', 'Darren', to_date('19-12-2001', 'dd-mm-yyyy'), 'Lieutenant', 307, 29300, 137);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20672, 'Maxine', 'Driver', to_date('14-01-1978', 'dd-mm-yyyy'), 'General', 244, 22600, 85);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20730, 'Rascal', 'Pleasence', to_date('10-10-1980', 'dd-mm-yyyy'), 'Lieutenant General', 318, 28500, 51);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20788, 'Ethan', 'McDowell', to_date('22-07-1995', 'dd-mm-yyyy'), 'Lieutenant General', 7, 24450, 36);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20846, 'Jeanne', 'Walken', to_date('22-10-1987', 'dd-mm-yyyy'), 'Private', 124, 28650, 365);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20904, 'Donna', 'Olyphant', to_date('05-11-1977', 'dd-mm-yyyy'), 'Captain', 245, 29650, 292);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (20962, 'Meredith', 'Benet', to_date('07-11-2001', 'dd-mm-yyyy'), 'Master Sergeant', 70, 27950, 95);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21020, 'Hex', 'Guzman', to_date('06-07-1973', 'dd-mm-yyyy'), 'Corporal', 359, 29400, 285);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21078, 'Coley', 'Herrmann', to_date('25-05-1969', 'dd-mm-yyyy'), 'Major', 312, 26250, 228);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21136, 'Wayne', 'Aykroyd', to_date('23-04-1986', 'dd-mm-yyyy'), 'Staff Sergeant', 14, 20500, 338);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21194, 'Jackson', 'Winslet', to_date('23-06-1974', 'dd-mm-yyyy'), 'Captain', 133, 19650, 126);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21252, 'Kyle', 'Pride', to_date('08-06-1969', 'dd-mm-yyyy'), 'Lieutenant', 82, 29350, 360);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21310, 'Mary Beth', 'Shue', to_date('30-08-1995', 'dd-mm-yyyy'), 'Master Sergeant', 164, 12400, 386);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21368, 'Marlon', 'Holiday', to_date('04-08-1997', 'dd-mm-yyyy'), 'First Sergeant', 290, 17500, 307);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21426, 'Lindsey', 'Foxx', to_date('18-06-1999', 'dd-mm-yyyy'), 'Sergeant Major', 367, 24100, 276);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21484, 'Laurence', 'Robards', to_date('16-05-1985', 'dd-mm-yyyy'), 'Lieutenant General', 88, 21100, 134);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21542, 'Temuera', 'Vai', to_date('10-03-1999', 'dd-mm-yyyy'), 'Major', 222, 23450, 251);
commit;
prompt 200 records committed...
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21600, 'Emerson', 'Trejo', to_date('29-04-1989', 'dd-mm-yyyy'), 'First Sergeant', 240, 18500, 261);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21658, 'Lesley', 'Vince', to_date('07-10-1992', 'dd-mm-yyyy'), 'Brigadier General', 88, 15250, 119);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21716, 'Neneh', 'Askew', to_date('09-09-1970', 'dd-mm-yyyy'), 'Warrant Officer', 127, 22700, 346);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21774, 'Coley', 'Broderick', to_date('15-01-1980', 'dd-mm-yyyy'), 'Lieutenant', 367, 19850, 214);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21832, 'Kim', 'Turturro', to_date('26-11-2005', 'dd-mm-yyyy'), 'Sergeant Major', 36, 11350, 7);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21890, 'Wang', 'Burrows', to_date('26-01-1989', 'dd-mm-yyyy'), 'Colonel', 179, 14150, 290);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (21948, 'Pamela', 'Metcalf', to_date('02-10-1992', 'dd-mm-yyyy'), 'Major General', 277, 26350, 9);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22006, 'Owen', 'Cocker', to_date('12-11-1982', 'dd-mm-yyyy'), 'Lieutenant', 280, 19000, 176);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22064, 'Eliza', 'De Almeida', to_date('10-08-1969', 'dd-mm-yyyy'), 'Warrant Officer', 226, 29300, 161);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22122, 'Tanya', 'Grier', to_date('28-07-1972', 'dd-mm-yyyy'), 'First Sergeant', 260, 27550, 154);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22180, 'Lucinda', 'Sharp', to_date('18-05-1965', 'dd-mm-yyyy'), 'Major General', 147, 21100, 2);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22238, 'Isaac', 'Craddock', to_date('02-04-1983', 'dd-mm-yyyy'), 'Lieutenant', 180, 13800, 202);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22296, 'Horace', 'Kirshner', to_date('03-05-1968', 'dd-mm-yyyy'), 'Lieutenant Colonel', 176, 11300, 101);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22354, 'Harris', 'Dean', to_date('18-11-1970', 'dd-mm-yyyy'), 'Captain', 44, 13700, 214);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22412, 'Franz', 'Scorsese', to_date('15-05-1996', 'dd-mm-yyyy'), 'Private', 309, 11800, 282);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22470, 'Joshua', 'Kinney', to_date('02-07-1973', 'dd-mm-yyyy'), 'First Sergeant', 185, 11500, 55);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22528, 'Barry', 'Nelligan', to_date('19-03-1975', 'dd-mm-yyyy'), 'Private', 316, 16200, 119);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22586, 'Harriet', 'Leguizamo', to_date('20-06-1969', 'dd-mm-yyyy'), 'Lieutenant Colonel', 119, 23400, 41);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22644, 'Terry', 'Armatrading', to_date('27-02-1966', 'dd-mm-yyyy'), 'First Sergeant', 161, 25900, 310);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22702, 'Garth', 'Allen', to_date('12-04-1974', 'dd-mm-yyyy'), 'Captain', 13, 13750, 12);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22760, 'Halle', 'Jackman', to_date('26-04-1974', 'dd-mm-yyyy'), 'Sergeant First Class', 269, 25200, 385);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22818, 'Temuera', 'Wine', to_date('01-03-1993', 'dd-mm-yyyy'), 'Chief Warrant Officer', 277, 28850, 192);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22876, 'Fionnula', 'Moorer', to_date('14-04-1993', 'dd-mm-yyyy'), 'Colonel', 124, 24800, 299);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22934, 'Red', 'Steiger', to_date('19-11-1995', 'dd-mm-yyyy'), 'Private', 382, 22900, 313);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (22992, 'Nastassja', 'Arden', to_date('23-04-2001', 'dd-mm-yyyy'), 'Lieutenant General', 202, 11300, 220);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23050, 'Alice', 'McKennitt', to_date('08-08-1973', 'dd-mm-yyyy'), 'Brigadier General', 27, 18700, 320);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23108, 'Franz', 'Collins', to_date('13-04-1968', 'dd-mm-yyyy'), 'Major General', 194, 21350, 289);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23166, 'Wally', 'Gaines', to_date('17-01-1983', 'dd-mm-yyyy'), 'Major', 393, 24650, 267);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23224, 'Shelby', 'Connick', to_date('05-10-1986', 'dd-mm-yyyy'), 'General', 64, 19950, 87);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23282, 'Night', 'Quaid', to_date('07-08-1974', 'dd-mm-yyyy'), 'Warrant Officer', 28, 21150, 137);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23340, 'Miranda', 'Brosnan', to_date('09-03-1996', 'dd-mm-yyyy'), 'Captain', 127, 29750, 60);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23398, 'Vin', 'Pressly', to_date('16-06-1992', 'dd-mm-yyyy'), 'Lieutenant General', 86, 22850, 150);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23456, 'Daryle', 'Atkins', to_date('27-04-1997', 'dd-mm-yyyy'), 'First Sergeant', 266, 10000, 12);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23514, 'Dustin', 'Sweeney', to_date('26-11-2004', 'dd-mm-yyyy'), 'Corporal', 60, 24000, 25);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23572, 'Hilary', 'Suchet', to_date('11-09-1990', 'dd-mm-yyyy'), 'Lieutenant', 299, 19800, 280);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23630, 'Kiefer', 'Foley', to_date('15-07-2001', 'dd-mm-yyyy'), 'Master Sergeant', 242, 26400, 319);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23688, 'Rachid', 'Statham', to_date('20-03-2004', 'dd-mm-yyyy'), 'General', 254, 29050, 234);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23746, 'Jarvis', 'Zellweger', to_date('06-11-1969', 'dd-mm-yyyy'), 'Private', 73, 23750, 164);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23804, 'Nik', 'Turturro', to_date('10-10-1993', 'dd-mm-yyyy'), 'General', 317, 11550, 115);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23862, 'Sam', 'Moorer', to_date('27-01-1987', 'dd-mm-yyyy'), 'Sergeant', 15, 13750, 83);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23920, 'Jodie', 'McIntosh', to_date('31-07-1999', 'dd-mm-yyyy'), 'Sergeant', 342, 21950, 389);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (23978, 'Gino', 'Emmerich', to_date('16-08-1995', 'dd-mm-yyyy'), 'Second Lieutenant', 153, 21500, 375);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24036, 'Teri', 'Lewis', to_date('02-03-1976', 'dd-mm-yyyy'), 'Sergeant First Class', 202, 12650, 265);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24094, 'Charlie', 'Carnes', to_date('20-09-1979', 'dd-mm-yyyy'), 'Second Lieutenant', 279, 25050, 150);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24152, 'Bret', 'Bridges', to_date('09-08-1979', 'dd-mm-yyyy'), 'Lieutenant General', 248, 16850, 47);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24210, 'Dianne', 'Bugnon', to_date('08-07-1976', 'dd-mm-yyyy'), 'Second Lieutenant', 115, 29250, 141);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24268, 'Javon', 'Lane', to_date('02-03-1975', 'dd-mm-yyyy'), 'Major', 249, 24450, 96);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24326, 'Edwin', 'Coughlan', to_date('27-07-1974', 'dd-mm-yyyy'), 'Sergeant', 261, 17650, 201);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24384, 'Derek', 'Copeland', to_date('11-08-1979', 'dd-mm-yyyy'), 'Warrant Officer', 303, 18000, 294);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24442, 'Elijah', 'Lynch', to_date('17-02-1993', 'dd-mm-yyyy'), 'Sergeant First Class', 377, 13250, 396);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24500, 'Aidan', 'Dorff', to_date('02-07-2001', 'dd-mm-yyyy'), 'Colonel', 167, 27950, 399);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24558, 'Roger', 'Mann', to_date('26-03-1998', 'dd-mm-yyyy'), 'Corporal', 353, 24850, 393);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24616, 'Harris', 'Everett', to_date('17-06-1987', 'dd-mm-yyyy'), 'Sergeant Major', 175, 18600, 165);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24674, 'Bernard', 'Hobson', to_date('28-05-1980', 'dd-mm-yyyy'), 'Major General', 229, 28300, 369);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24732, 'Bebe', 'Hong', to_date('18-05-1977', 'dd-mm-yyyy'), 'Warrant Officer', 209, 27800, 262);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24790, 'Kieran', 'Alda', to_date('21-02-1987', 'dd-mm-yyyy'), 'Warrant Officer', 80, 23750, 155);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24848, 'Chet', 'Shepherd', to_date('29-11-1981', 'dd-mm-yyyy'), 'Lieutenant', 76, 13750, 255);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24906, 'Sheena', 'Balin', to_date('10-02-1986', 'dd-mm-yyyy'), 'Colonel', 136, 20300, 52);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (24964, 'Heather', 'Hackman', to_date('22-10-1977', 'dd-mm-yyyy'), 'Major General', 295, 13800, 178);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25022, 'Rebecca', 'Postlethwaite', to_date('25-12-2002', 'dd-mm-yyyy'), 'Sergeant First Class', 296, 21750, 79);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25080, 'Hector', 'Vaughan', to_date('28-10-1983', 'dd-mm-yyyy'), 'Lieutenant Colonel', 306, 16850, 283);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25138, 'Catherine', 'Borgnine', to_date('11-01-1993', 'dd-mm-yyyy'), 'Colonel', 14, 19600, 185);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25196, 'Mekhi', 'Crewson', to_date('26-11-1991', 'dd-mm-yyyy'), 'Lieutenant', 31, 27900, 80);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25254, 'Kid', 'Mould', to_date('28-07-1968', 'dd-mm-yyyy'), 'Staff Sergeant', 10, 17800, 63);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25312, 'Alice', 'Bergen', to_date('16-05-1977', 'dd-mm-yyyy'), 'Lieutenant', 279, 28800, 342);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25370, 'Eric', 'Bassett', to_date('31-12-1968', 'dd-mm-yyyy'), 'Sergeant Major', 287, 13700, 123);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25428, 'Nicole', 'Warden', to_date('23-10-1988', 'dd-mm-yyyy'), 'Sergeant First Class', 242, 28250, 226);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25486, 'Val', 'Shand', to_date('18-06-2003', 'dd-mm-yyyy'), 'Chief Warrant Officer', 299, 18250, 111);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25544, 'Mary-Louise', 'Miller', to_date('19-08-1978', 'dd-mm-yyyy'), 'Lieutenant', 309, 14100, 25);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25602, 'Rod', 'Jackson', to_date('12-07-1999', 'dd-mm-yyyy'), 'Sergeant Major', 284, 11350, 92);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25660, 'Kris', 'Fender', to_date('17-04-1976', 'dd-mm-yyyy'), 'Major General', 317, 25650, 220);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25718, 'Rodney', 'Mewes', to_date('13-03-1989', 'dd-mm-yyyy'), 'Sergeant', 310, 12450, 350);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25776, 'Phil', 'McCoy', to_date('10-03-1965', 'dd-mm-yyyy'), 'Master Sergeant', 286, 22700, 145);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25834, 'Rhett', 'Neil', to_date('04-10-1998', 'dd-mm-yyyy'), 'Captain', 188, 16300, 387);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25892, 'Will', 'Sartain', to_date('10-04-1996', 'dd-mm-yyyy'), 'First Sergeant', 165, 15600, 305);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (25950, 'Bill', 'Adams', to_date('03-12-1996', 'dd-mm-yyyy'), 'Warrant Officer', 18, 19200, 63);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26008, 'Ewan', 'Steenburgen', to_date('03-09-2005', 'dd-mm-yyyy'), 'Colonel', 323, 21950, 239);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26066, 'Ryan', 'Tate', to_date('28-10-1980', 'dd-mm-yyyy'), 'First Sergeant', 75, 13600, 213);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26124, 'Corey', 'Love', to_date('06-11-1970', 'dd-mm-yyyy'), 'First Sergeant', 105, 11100, 387);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26182, 'Jaime', 'Meyer', to_date('10-10-1981', 'dd-mm-yyyy'), 'Colonel', 128, 18550, 104);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26240, 'Susan', 'Root', to_date('11-05-1995', 'dd-mm-yyyy'), 'Sergeant Major', 113, 27250, 385);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26298, 'Robby', 'Cale', to_date('27-12-1997', 'dd-mm-yyyy'), 'Lieutenant Colonel', 73, 15750, 142);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26356, 'Alex', 'Rhymes', to_date('12-06-1978', 'dd-mm-yyyy'), 'General', 88, 28750, 359);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26414, 'Neve', 'Davidtz', to_date('09-05-1987', 'dd-mm-yyyy'), 'Sergeant Major', 3, 29250, 298);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26472, 'Rawlins', 'Soda', to_date('27-02-1972', 'dd-mm-yyyy'), 'Lieutenant Colonel', 259, 26150, 315);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26530, 'Ricky', 'Graham', to_date('14-02-1969', 'dd-mm-yyyy'), 'Corporal', 179, 22150, 269);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26588, 'Shannyn', 'Richardson', to_date('02-05-1992', 'dd-mm-yyyy'), 'Sergeant First Class', 145, 23950, 165);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26646, 'Jeffery', 'McFerrin', to_date('27-01-1982', 'dd-mm-yyyy'), 'Colonel', 193, 18300, 366);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26704, 'Molly', 'Baez', to_date('06-10-1988', 'dd-mm-yyyy'), 'Colonel', 134, 14400, 146);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26762, 'Grant', 'Armatrading', to_date('19-04-2001', 'dd-mm-yyyy'), 'Brigadier General', 349, 29150, 246);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26820, 'Talvin', 'Drive', to_date('18-07-1968', 'dd-mm-yyyy'), 'Sergeant', 99, 17600, 173);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26878, 'Tramaine', 'Dafoe', to_date('10-04-1976', 'dd-mm-yyyy'), 'Staff Sergeant', 252, 11100, 220);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26936, 'Ramsey', 'Sevenfold', to_date('04-10-2002', 'dd-mm-yyyy'), 'Sergeant Major', 124, 28050, 330);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (26994, 'Thomas', 'Gilley', to_date('16-09-1972', 'dd-mm-yyyy'), 'Sergeant', 10, 13700, 283);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27052, 'Harold', 'Shand', to_date('26-10-1991', 'dd-mm-yyyy'), 'Sergeant', 206, 20100, 100);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27110, 'Kirk', 'Balk', to_date('10-05-1972', 'dd-mm-yyyy'), 'Lieutenant Colonel', 228, 19300, 335);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27168, 'Mika', 'Theron', to_date('19-10-1969', 'dd-mm-yyyy'), 'Brigadier General', 215, 21150, 129);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27226, 'Ray', 'Parsons', to_date('15-01-1984', 'dd-mm-yyyy'), 'First Sergeant', 217, 18550, 282);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27284, 'Mary-Louise', 'Dillane', to_date('20-05-1993', 'dd-mm-yyyy'), 'Chief Warrant Officer', 171, 24350, 64);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27342, 'Cathy', 'Laws', to_date('06-05-1966', 'dd-mm-yyyy'), 'Colonel', 289, 25350, 247);
commit;
prompt 300 records committed...
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27400, 'Treat', 'Hopkins', to_date('05-05-1966', 'dd-mm-yyyy'), 'Lieutenant General', 174, 22350, 18);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27458, 'Dean', 'Lillard', to_date('03-02-1975', 'dd-mm-yyyy'), 'Brigadier General', 183, 11800, 8);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27516, 'Adrien', 'Thornton', to_date('27-06-1999', 'dd-mm-yyyy'), 'Chief Warrant Officer', 11, 24900, 196);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27574, 'Celia', 'Duvall', to_date('14-08-1983', 'dd-mm-yyyy'), 'First Sergeant', 295, 29800, 105);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27632, 'Stevie', 'Withers', to_date('12-07-1973', 'dd-mm-yyyy'), 'Lieutenant', 283, 10250, 336);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27690, 'Nancy', 'Griffiths', to_date('25-04-1970', 'dd-mm-yyyy'), 'General', 21, 18000, 52);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27748, 'Oliver', 'Hatchet', to_date('30-12-1993', 'dd-mm-yyyy'), 'First Sergeant', 3, 24100, 191);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27806, 'Debi', 'Law', to_date('05-10-1977', 'dd-mm-yyyy'), 'Chief Warrant Officer', 368, 11400, 303);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27864, 'Chazz', 'Sampson', to_date('06-02-1989', 'dd-mm-yyyy'), 'Staff Sergeant', 89, 10950, 165);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27922, 'Stewart', 'Summer', to_date('31-05-1967', 'dd-mm-yyyy'), 'Lieutenant General', 25, 24750, 286);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (27980, 'Jack', 'Cagle', to_date('08-08-2005', 'dd-mm-yyyy'), 'Staff Sergeant', 191, 12200, 240);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28038, 'Machine', 'Rizzo', to_date('02-09-2005', 'dd-mm-yyyy'), 'General', 62, 15300, 327);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28096, 'Nanci', 'Rockwell', to_date('23-06-1996', 'dd-mm-yyyy'), 'Staff Sergeant', 310, 27250, 177);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28154, 'Hookah', 'Wainwright', to_date('30-04-1969', 'dd-mm-yyyy'), 'Colonel', 120, 11550, 189);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28212, 'Tramaine', 'McDonnell', to_date('04-05-1974', 'dd-mm-yyyy'), 'Lieutenant Colonel', 91, 12750, 98);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28270, 'Wes', 'Morales', to_date('06-07-1995', 'dd-mm-yyyy'), 'Brigadier General', 204, 29750, 48);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28328, 'Davey', 'Kramer', to_date('06-06-1986', 'dd-mm-yyyy'), 'Sergeant First Class', 374, 13250, 25);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28386, 'Boyd', 'Kattan', to_date('12-03-1973', 'dd-mm-yyyy'), 'Sergeant First Class', 14, 14250, 318);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28444, 'Marty', 'Kidman', to_date('23-06-1987', 'dd-mm-yyyy'), 'Sergeant Major', 70, 10100, 358);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28502, 'Aidan', 'Nicks', to_date('12-01-1992', 'dd-mm-yyyy'), 'Master Sergeant', 390, 16600, 392);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28560, 'Tobey', 'Cleary', to_date('08-12-1990', 'dd-mm-yyyy'), 'Major General', 127, 13850, 203);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28618, 'Keith', 'Cleese', to_date('14-01-1986', 'dd-mm-yyyy'), 'Second Lieutenant', 286, 22850, 306);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28676, 'Armand', 'Sinise', to_date('18-01-1968', 'dd-mm-yyyy'), 'Sergeant First Class', 26, 20350, 71);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28734, 'Bo', 'LaSalle', to_date('27-05-1970', 'dd-mm-yyyy'), 'Staff Sergeant', 22, 25550, 20);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28792, 'Elias', 'Cooper', to_date('12-03-1976', 'dd-mm-yyyy'), 'Corporal', 384, 12600, 371);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28850, 'Wade', 'Napolitano', to_date('28-05-1983', 'dd-mm-yyyy'), 'Lieutenant', 335, 15300, 77);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28908, 'Bebe', 'Bonham', to_date('02-07-2000', 'dd-mm-yyyy'), 'Sergeant First Class', 269, 12450, 184);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (28966, 'Suzi', 'Byrd', to_date('03-08-2000', 'dd-mm-yyyy'), 'Lieutenant', 54, 28600, 343);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29024, 'Veruca', 'Sobieski', to_date('24-10-1984', 'dd-mm-yyyy'), 'Captain', 265, 17500, 260);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29082, 'Tilda', 'Imbruglia', to_date('09-02-1983', 'dd-mm-yyyy'), 'Sergeant Major', 28, 15550, 252);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29140, 'Merrill', 'Greenwood', to_date('15-04-1987', 'dd-mm-yyyy'), 'Captain', 6, 10950, 333);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29198, 'Terry', 'Dunn', to_date('22-11-1996', 'dd-mm-yyyy'), 'Staff Sergeant', 343, 13100, 112);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29256, 'Moe', 'Dillon', to_date('07-09-1984', 'dd-mm-yyyy'), 'Staff Sergeant', 178, 18800, 157);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29314, 'Ben', 'Waite', to_date('27-10-1965', 'dd-mm-yyyy'), 'Staff Sergeant', 369, 27750, 229);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29372, 'Nicholas', 'Pride', to_date('22-04-2005', 'dd-mm-yyyy'), 'First Sergeant', 140, 17000, 269);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29430, 'Red', 'Anderson', to_date('01-03-1978', 'dd-mm-yyyy'), 'Sergeant Major', 381, 20900, 108);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29488, 'Woody', 'Lynskey', to_date('07-02-1999', 'dd-mm-yyyy'), 'Lieutenant General', 213, 17150, 75);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29546, 'Bernard', 'Dunaway', to_date('11-03-1999', 'dd-mm-yyyy'), 'General', 237, 25600, 115);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29604, 'Art', 'Bonham', to_date('23-08-1994', 'dd-mm-yyyy'), 'Lieutenant', 388, 28950, 53);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29662, 'Ethan', 'Spacey', to_date('26-10-1970', 'dd-mm-yyyy'), 'Brigadier General', 82, 22050, 166);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29720, 'Juice', 'Bloch', to_date('27-01-1996', 'dd-mm-yyyy'), 'Lieutenant Colonel', 187, 27350, 19);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29778, 'Vienna', 'Leary', to_date('16-09-1989', 'dd-mm-yyyy'), 'Corporal', 299, 18650, 395);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29836, 'Chuck', 'Reid', to_date('21-11-2004', 'dd-mm-yyyy'), 'Private', 24, 29650, 97);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29894, 'Joely', 'Jones', to_date('12-10-1967', 'dd-mm-yyyy'), 'Brigadier General', 218, 19350, 61);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (29952, 'Charles', 'Whitwam', to_date('20-11-1967', 'dd-mm-yyyy'), 'Colonel', 112, 25400, 258);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30010, 'King', 'Burmester', to_date('07-07-1972', 'dd-mm-yyyy'), 'Warrant Officer', 160, 24050, 127);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30068, 'Embeth', 'Hall', to_date('24-01-1980', 'dd-mm-yyyy'), 'Lieutenant General', 53, 11250, 184);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30126, 'Sona', 'Hudson', to_date('15-10-1997', 'dd-mm-yyyy'), 'Lieutenant Colonel', 177, 24400, 296);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30184, 'Judi', 'Dunaway', to_date('09-06-1986', 'dd-mm-yyyy'), 'General', 326, 14400, 192);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30242, 'Emilio', 'Allan', to_date('29-10-1973', 'dd-mm-yyyy'), 'Lieutenant', 48, 16100, 123);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30300, 'Austin', 'Curtis', to_date('16-11-1999', 'dd-mm-yyyy'), 'Private', 328, 14900, 344);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30358, 'Christine', 'King', to_date('28-10-2000', 'dd-mm-yyyy'), 'First Sergeant', 24, 28800, 108);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30416, 'Wesley', 'Paltrow', to_date('11-11-1988', 'dd-mm-yyyy'), 'Chief Warrant Officer', 265, 26750, 141);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30474, 'Stevie', 'Weiland', to_date('12-10-1966', 'dd-mm-yyyy'), 'Colonel', 98, 11650, 116);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30532, 'Allan', 'Crowe', to_date('18-11-1978', 'dd-mm-yyyy'), 'Lieutenant', 2, 26050, 129);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30590, 'King', 'Schneider', to_date('21-07-1994', 'dd-mm-yyyy'), 'Corporal', 349, 23200, 140);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30648, 'Raul', 'Maxwell', to_date('17-05-2001', 'dd-mm-yyyy'), 'Brigadier General', 109, 28300, 52);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30706, 'Alana', 'Dale', to_date('18-09-2000', 'dd-mm-yyyy'), 'First Sergeant', 338, 14250, 193);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30764, 'Collin', 'Hatosy', to_date('19-10-1966', 'dd-mm-yyyy'), 'Major', 239, 12700, 150);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30822, 'Judge', 'Ronstadt', to_date('06-01-2002', 'dd-mm-yyyy'), 'Sergeant', 286, 17250, 97);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30880, 'Mika', 'Pesci', to_date('10-07-2002', 'dd-mm-yyyy'), 'Lieutenant', 76, 12200, 28);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30938, 'Allison', 'Goodall', to_date('15-05-1979', 'dd-mm-yyyy'), 'Brigadier General', 228, 24500, 64);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (30996, 'Ray', 'Keeslar', to_date('25-11-1989', 'dd-mm-yyyy'), 'Captain', 177, 17600, 229);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31054, 'Grant', 'Abraham', to_date('23-01-2000', 'dd-mm-yyyy'), 'Lieutenant', 175, 22250, 227);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31112, 'Tommy', 'Reynolds', to_date('25-02-1990', 'dd-mm-yyyy'), 'First Sergeant', 207, 17350, 91);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31170, 'Buffy', 'Berenger', to_date('05-05-1967', 'dd-mm-yyyy'), 'Lieutenant General', 276, 29700, 252);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31228, 'Victor', 'McFadden', to_date('22-06-1982', 'dd-mm-yyyy'), 'Brigadier General', 52, 21350, 221);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31286, 'Charles', 'Llewelyn', to_date('13-02-1994', 'dd-mm-yyyy'), 'Lieutenant', 259, 21250, 351);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31344, 'Lonnie', 'Wilkinson', to_date('24-10-1965', 'dd-mm-yyyy'), 'Staff Sergeant', 12, 10100, 281);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31402, 'Linda', 'Atlas', to_date('21-11-1987', 'dd-mm-yyyy'), 'First Sergeant', 353, 10850, 202);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31460, 'Toshiro', 'Reeves', to_date('14-07-1998', 'dd-mm-yyyy'), 'General', 301, 17500, 72);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31518, 'Nicky', 'Rockwell', to_date('24-05-1966', 'dd-mm-yyyy'), 'General', 91, 16900, 278);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31576, 'Powers', 'Burton', to_date('02-06-1970', 'dd-mm-yyyy'), 'Master Sergeant', 220, 13550, 305);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31634, 'Jesus', 'Glover', to_date('28-12-1965', 'dd-mm-yyyy'), 'Major General', 262, 28950, 359);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31692, 'Ritchie', 'Eat World', to_date('06-06-2002', 'dd-mm-yyyy'), 'Sergeant First Class', 326, 26850, 153);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31750, 'Lizzy', 'DeLuise', to_date('18-07-1987', 'dd-mm-yyyy'), 'Lieutenant', 233, 12500, 332);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31808, 'Nicolas', 'Moraz', to_date('16-05-1987', 'dd-mm-yyyy'), 'Lieutenant', 196, 13200, 26);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31866, 'Rawlins', 'Brooke', to_date('29-12-1988', 'dd-mm-yyyy'), 'General', 168, 19450, 227);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31924, 'Anne', 'Gallant', to_date('04-01-1982', 'dd-mm-yyyy'), 'Warrant Officer', 353, 21900, 239);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (31982, 'Reese', 'Field', to_date('22-06-1972', 'dd-mm-yyyy'), 'Sergeant', 327, 26450, 27);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32040, 'Kelli', 'Vinton', to_date('28-06-1990', 'dd-mm-yyyy'), 'Warrant Officer', 280, 13050, 219);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32098, 'Andrea', 'Tyler', to_date('22-07-2001', 'dd-mm-yyyy'), 'Sergeant First Class', 230, 27100, 70);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32156, 'Mena', 'Kadison', to_date('22-05-1990', 'dd-mm-yyyy'), 'Major', 269, 18400, 385);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32214, 'Fiona', 'Mueller-Stahl', to_date('21-09-2005', 'dd-mm-yyyy'), 'Staff Sergeant', 126, 25550, 221);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32272, 'Fisher', 'Arquette', to_date('21-05-1973', 'dd-mm-yyyy'), 'Sergeant First Class', 12, 21850, 284);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32330, 'Merrilee', 'Schwarzenegger', to_date('17-07-1988', 'dd-mm-yyyy'), 'Captain', 68, 18850, 44);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32388, 'Amanda', 'Lennix', to_date('19-08-1978', 'dd-mm-yyyy'), 'Sergeant Major', 260, 15300, 258);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32446, 'Emmylou', 'Stiers', to_date('21-08-1999', 'dd-mm-yyyy'), 'Captain', 157, 27500, 172);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32504, 'Rita', 'Reeve', to_date('22-03-1971', 'dd-mm-yyyy'), 'First Sergeant', 76, 12350, 130);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32562, 'Louise', 'Keith', to_date('29-01-1988', 'dd-mm-yyyy'), 'General', 398, 18100, 241);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32620, 'Joaquin', 'Leachman', to_date('17-10-1988', 'dd-mm-yyyy'), 'First Sergeant', 144, 10000, 373);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32678, 'Bryan', 'Ponce', to_date('27-04-2000', 'dd-mm-yyyy'), 'Private', 1, 27200, 236);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32736, 'Harris', 'Palmieri', to_date('06-12-1972', 'dd-mm-yyyy'), 'Colonel', 352, 23800, 332);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32794, 'Jean-Claude', 'Spine', to_date('18-01-1984', 'dd-mm-yyyy'), 'Sergeant Major', 59, 28000, 28);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32852, 'Kurtwood', 'Flack', to_date('16-02-1975', 'dd-mm-yyyy'), 'Chief Warrant Officer', 16, 20250, 1);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32910, 'Oro', 'Newton', to_date('23-12-1965', 'dd-mm-yyyy'), 'Chief Warrant Officer', 277, 28750, 241);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (32968, 'Vin', 'Foley', to_date('13-05-2001', 'dd-mm-yyyy'), 'Brigadier General', 104, 21150, 375);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (33026, 'Jackson', 'Stormare', to_date('05-08-1983', 'dd-mm-yyyy'), 'Brigadier General', 165, 15950, 355);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (33084, 'Stockard', 'Chaplin', to_date('17-06-1966', 'dd-mm-yyyy'), 'Captain', 100, 28800, 193);
insert into SOLDIERS (soldier_id_, first_name_, last_name_, birth_date_, rank_, unit_id_, salary_id_, role_id_)
values (33142, 'Bridgette', 'Reubens', to_date('25-03-1984', 'dd-mm-yyyy'), 'Captain', 101, 26550, 56);
commit;
prompt 400 records loaded
prompt Loading HAVE...
insert into HAVE (soldier_id_, project_id)
values (10116, 15688);
insert into HAVE (soldier_id_, project_id)
values (10174, 3218);
insert into HAVE (soldier_id_, project_id)
values (10290, 7742);
insert into HAVE (soldier_id_, project_id)
values (10464, 6988);
insert into HAVE (soldier_id_, project_id)
values (10522, 4494);
insert into HAVE (soldier_id_, project_id)
values (10580, 23460);
insert into HAVE (soldier_id_, project_id)
values (10696, 2290);
insert into HAVE (soldier_id_, project_id)
values (10696, 14934);
insert into HAVE (soldier_id_, project_id)
values (10696, 15630);
insert into HAVE (soldier_id_, project_id)
values (10696, 19226);
insert into HAVE (soldier_id_, project_id)
values (10696, 20154);
insert into HAVE (soldier_id_, project_id)
values (10696, 24736);
insert into HAVE (soldier_id_, project_id)
values (10754, 14354);
insert into HAVE (soldier_id_, project_id)
values (10812, 5944);
insert into HAVE (soldier_id_, project_id)
values (10812, 10236);
insert into HAVE (soldier_id_, project_id)
values (10928, 17544);
insert into HAVE (soldier_id_, project_id)
values (11044, 9192);
insert into HAVE (soldier_id_, project_id)
values (11044, 22532);
insert into HAVE (soldier_id_, project_id)
values (11276, 14644);
insert into HAVE (soldier_id_, project_id)
values (11276, 24910);
insert into HAVE (soldier_id_, project_id)
values (11334, 8264);
insert into HAVE (soldier_id_, project_id)
values (11334, 21314);
insert into HAVE (soldier_id_, project_id)
values (11508, 8554);
insert into HAVE (soldier_id_, project_id)
values (11566, 17776);
insert into HAVE (soldier_id_, project_id)
values (11566, 19980);
insert into HAVE (soldier_id_, project_id)
values (11624, 3624);
insert into HAVE (soldier_id_, project_id)
values (11624, 12904);
insert into HAVE (soldier_id_, project_id)
values (11624, 16848);
insert into HAVE (soldier_id_, project_id)
values (11740, 4842);
insert into HAVE (soldier_id_, project_id)
values (11798, 2870);
insert into HAVE (soldier_id_, project_id)
values (11856, 3450);
insert into HAVE (soldier_id_, project_id)
values (11914, 24446);
insert into HAVE (soldier_id_, project_id)
values (11972, 23112);
insert into HAVE (soldier_id_, project_id)
values (12088, 24156);
insert into HAVE (soldier_id_, project_id)
values (12146, 6814);
insert into HAVE (soldier_id_, project_id)
values (12320, 24794);
insert into HAVE (soldier_id_, project_id)
values (12378, 11860);
insert into HAVE (soldier_id_, project_id)
values (12378, 16152);
insert into HAVE (soldier_id_, project_id)
values (12378, 23170);
insert into HAVE (soldier_id_, project_id)
values (12436, 14644);
insert into HAVE (soldier_id_, project_id)
values (12552, 17080);
insert into HAVE (soldier_id_, project_id)
values (12610, 10816);
insert into HAVE (soldier_id_, project_id)
values (12610, 21256);
insert into HAVE (soldier_id_, project_id)
values (12668, 3508);
insert into HAVE (soldier_id_, project_id)
values (12726, 24098);
insert into HAVE (soldier_id_, project_id)
values (12784, 2928);
insert into HAVE (soldier_id_, project_id)
values (12842, 22300);
insert into HAVE (soldier_id_, project_id)
values (13016, 22358);
insert into HAVE (soldier_id_, project_id)
values (13132, 5016);
insert into HAVE (soldier_id_, project_id)
values (13132, 22474);
insert into HAVE (soldier_id_, project_id)
values (13190, 2348);
insert into HAVE (soldier_id_, project_id)
values (13190, 14122);
insert into HAVE (soldier_id_, project_id)
values (13248, 7742);
insert into HAVE (soldier_id_, project_id)
values (13248, 17138);
insert into HAVE (soldier_id_, project_id)
values (13364, 21198);
insert into HAVE (soldier_id_, project_id)
values (13422, 15862);
insert into HAVE (soldier_id_, project_id)
values (13422, 16848);
insert into HAVE (soldier_id_, project_id)
values (13538, 19574);
insert into HAVE (soldier_id_, project_id)
values (13538, 22880);
insert into HAVE (soldier_id_, project_id)
values (13712, 16384);
insert into HAVE (soldier_id_, project_id)
values (13828, 2232);
insert into HAVE (soldier_id_, project_id)
values (13886, 17544);
insert into HAVE (soldier_id_, project_id)
values (13944, 7974);
insert into HAVE (soldier_id_, project_id)
values (13944, 15340);
insert into HAVE (soldier_id_, project_id)
values (14002, 10120);
insert into HAVE (soldier_id_, project_id)
values (14060, 5074);
insert into HAVE (soldier_id_, project_id)
values (14060, 14122);
insert into HAVE (soldier_id_, project_id)
values (14118, 2812);
insert into HAVE (soldier_id_, project_id)
values (14176, 20154);
insert into HAVE (soldier_id_, project_id)
values (14234, 24156);
insert into HAVE (soldier_id_, project_id)
values (14350, 20038);
insert into HAVE (soldier_id_, project_id)
values (14350, 20212);
insert into HAVE (soldier_id_, project_id)
values (14408, 8670);
insert into HAVE (soldier_id_, project_id)
values (14408, 14064);
insert into HAVE (soldier_id_, project_id)
values (14466, 7452);
insert into HAVE (soldier_id_, project_id)
values (14466, 10932);
insert into HAVE (soldier_id_, project_id)
values (14524, 3972);
insert into HAVE (soldier_id_, project_id)
values (14582, 22068);
insert into HAVE (soldier_id_, project_id)
values (14582, 24504);
insert into HAVE (soldier_id_, project_id)
values (14640, 7452);
insert into HAVE (soldier_id_, project_id)
values (14640, 17254);
insert into HAVE (soldier_id_, project_id)
values (14698, 16790);
insert into HAVE (soldier_id_, project_id)
values (14872, 6698);
insert into HAVE (soldier_id_, project_id)
values (15046, 2870);
insert into HAVE (soldier_id_, project_id)
values (15162, 6234);
insert into HAVE (soldier_id_, project_id)
values (15162, 22648);
insert into HAVE (soldier_id_, project_id)
values (15220, 6524);
insert into HAVE (soldier_id_, project_id)
values (15220, 22706);
insert into HAVE (soldier_id_, project_id)
values (15278, 6640);
insert into HAVE (soldier_id_, project_id)
values (15336, 14992);
insert into HAVE (soldier_id_, project_id)
values (15336, 18936);
insert into HAVE (soldier_id_, project_id)
values (15394, 13658);
insert into HAVE (soldier_id_, project_id)
values (15394, 20734);
insert into HAVE (soldier_id_, project_id)
values (15394, 23692);
insert into HAVE (soldier_id_, project_id)
values (15452, 4320);
insert into HAVE (soldier_id_, project_id)
values (15452, 9656);
insert into HAVE (soldier_id_, project_id)
values (15452, 24446);
insert into HAVE (soldier_id_, project_id)
values (15510, 11918);
insert into HAVE (soldier_id_, project_id)
values (15626, 14934);
insert into HAVE (soldier_id_, project_id)
values (15800, 10700);
commit;
prompt 100 records committed...
insert into HAVE (soldier_id_, project_id)
values (15800, 13252);
insert into HAVE (soldier_id_, project_id)
values (15858, 7104);
insert into HAVE (soldier_id_, project_id)
values (15858, 22648);
insert into HAVE (soldier_id_, project_id)
values (15916, 16500);
insert into HAVE (soldier_id_, project_id)
values (16032, 9192);
insert into HAVE (soldier_id_, project_id)
values (16032, 17950);
insert into HAVE (soldier_id_, project_id)
values (16090, 4262);
insert into HAVE (soldier_id_, project_id)
values (16090, 5190);
insert into HAVE (soldier_id_, project_id)
values (16090, 14122);
insert into HAVE (soldier_id_, project_id)
values (16090, 16558);
insert into HAVE (soldier_id_, project_id)
values (16380, 18762);
insert into HAVE (soldier_id_, project_id)
values (16438, 6060);
insert into HAVE (soldier_id_, project_id)
values (16612, 14644);
insert into HAVE (soldier_id_, project_id)
values (16670, 15572);
insert into HAVE (soldier_id_, project_id)
values (16728, 3102);
insert into HAVE (soldier_id_, project_id)
values (16728, 23402);
insert into HAVE (soldier_id_, project_id)
values (16786, 3044);
insert into HAVE (soldier_id_, project_id)
values (16786, 25026);
insert into HAVE (soldier_id_, project_id)
values (16844, 17660);
insert into HAVE (soldier_id_, project_id)
values (16844, 19690);
insert into HAVE (soldier_id_, project_id)
values (16844, 20560);
insert into HAVE (soldier_id_, project_id)
values (16844, 22648);
insert into HAVE (soldier_id_, project_id)
values (16844, 24562);
insert into HAVE (soldier_id_, project_id)
values (16902, 6698);
insert into HAVE (soldier_id_, project_id)
values (16902, 6756);
insert into HAVE (soldier_id_, project_id)
values (17018, 6814);
insert into HAVE (soldier_id_, project_id)
values (17018, 13600);
insert into HAVE (soldier_id_, project_id)
values (17076, 17370);
insert into HAVE (soldier_id_, project_id)
values (17192, 3798);
insert into HAVE (soldier_id_, project_id)
values (17540, 15862);
insert into HAVE (soldier_id_, project_id)
values (17598, 14238);
insert into HAVE (soldier_id_, project_id)
values (17656, 4146);
insert into HAVE (soldier_id_, project_id)
values (17830, 2348);
insert into HAVE (soldier_id_, project_id)
values (17830, 12034);
insert into HAVE (soldier_id_, project_id)
values (17830, 15862);
insert into HAVE (soldier_id_, project_id)
values (18004, 10584);
insert into HAVE (soldier_id_, project_id)
values (18004, 16036);
insert into HAVE (soldier_id_, project_id)
values (18062, 10990);
insert into HAVE (soldier_id_, project_id)
values (18120, 3450);
insert into HAVE (soldier_id_, project_id)
values (18120, 24678);
insert into HAVE (soldier_id_, project_id)
values (18178, 14470);
insert into HAVE (soldier_id_, project_id)
values (18294, 22764);
insert into HAVE (soldier_id_, project_id)
values (18410, 14006);
insert into HAVE (soldier_id_, project_id)
values (18468, 19342);
insert into HAVE (soldier_id_, project_id)
values (18526, 19342);
insert into HAVE (soldier_id_, project_id)
values (18526, 19632);
insert into HAVE (soldier_id_, project_id)
values (18526, 21720);
insert into HAVE (soldier_id_, project_id)
values (18642, 15688);
insert into HAVE (soldier_id_, project_id)
values (18700, 7568);
insert into HAVE (soldier_id_, project_id)
values (18758, 5422);
insert into HAVE (soldier_id_, project_id)
values (18874, 6176);
insert into HAVE (soldier_id_, project_id)
values (18874, 16442);
insert into HAVE (soldier_id_, project_id)
values (18932, 11280);
insert into HAVE (soldier_id_, project_id)
values (19106, 2348);
insert into HAVE (soldier_id_, project_id)
values (19106, 5538);
insert into HAVE (soldier_id_, project_id)
values (19106, 16848);
insert into HAVE (soldier_id_, project_id)
values (19222, 12092);
insert into HAVE (soldier_id_, project_id)
values (19396, 25026);
insert into HAVE (soldier_id_, project_id)
values (19454, 7916);
insert into HAVE (soldier_id_, project_id)
values (19454, 22242);
insert into HAVE (soldier_id_, project_id)
values (19570, 23518);
insert into HAVE (soldier_id_, project_id)
values (19686, 6756);
insert into HAVE (soldier_id_, project_id)
values (19686, 15398);
insert into HAVE (soldier_id_, project_id)
values (19686, 20908);
insert into HAVE (soldier_id_, project_id)
values (19802, 17950);
insert into HAVE (soldier_id_, project_id)
values (19976, 17254);
insert into HAVE (soldier_id_, project_id)
values (20034, 5422);
insert into HAVE (soldier_id_, project_id)
values (20208, 4320);
insert into HAVE (soldier_id_, project_id)
values (20208, 6698);
insert into HAVE (soldier_id_, project_id)
values (20266, 2928);
insert into HAVE (soldier_id_, project_id)
values (20266, 7626);
insert into HAVE (soldier_id_, project_id)
values (20266, 8206);
insert into HAVE (soldier_id_, project_id)
values (20266, 11860);
insert into HAVE (soldier_id_, project_id)
values (20266, 17080);
insert into HAVE (soldier_id_, project_id)
values (20382, 11454);
insert into HAVE (soldier_id_, project_id)
values (20382, 16210);
insert into HAVE (soldier_id_, project_id)
values (20440, 21024);
insert into HAVE (soldier_id_, project_id)
values (20498, 13252);
insert into HAVE (soldier_id_, project_id)
values (20498, 22590);
insert into HAVE (soldier_id_, project_id)
values (20556, 20676);
insert into HAVE (soldier_id_, project_id)
values (20614, 5886);
insert into HAVE (soldier_id_, project_id)
values (20788, 2696);
insert into HAVE (soldier_id_, project_id)
values (20788, 7858);
insert into HAVE (soldier_id_, project_id)
values (20788, 21372);
insert into HAVE (soldier_id_, project_id)
values (20846, 18124);
insert into HAVE (soldier_id_, project_id)
values (20846, 19690);
insert into HAVE (soldier_id_, project_id)
values (21020, 8670);
insert into HAVE (soldier_id_, project_id)
values (21252, 3740);
insert into HAVE (soldier_id_, project_id)
values (21252, 7800);
insert into HAVE (soldier_id_, project_id)
values (21252, 8960);
insert into HAVE (soldier_id_, project_id)
values (21310, 9540);
insert into HAVE (soldier_id_, project_id)
values (21368, 11048);
insert into HAVE (soldier_id_, project_id)
values (21484, 19806);
insert into HAVE (soldier_id_, project_id)
values (21600, 20270);
insert into HAVE (soldier_id_, project_id)
values (21658, 10004);
insert into HAVE (soldier_id_, project_id)
values (21716, 2754);
insert into HAVE (soldier_id_, project_id)
values (21832, 4436);
insert into HAVE (soldier_id_, project_id)
values (21832, 7858);
insert into HAVE (soldier_id_, project_id)
values (21890, 13832);
insert into HAVE (soldier_id_, project_id)
values (21948, 23982);
commit;
prompt 200 records committed...
insert into HAVE (soldier_id_, project_id)
values (22006, 20966);
insert into HAVE (soldier_id_, project_id)
values (22064, 17892);
insert into HAVE (soldier_id_, project_id)
values (22238, 3450);
insert into HAVE (soldier_id_, project_id)
values (22470, 17718);
insert into HAVE (soldier_id_, project_id)
values (22528, 9656);
insert into HAVE (soldier_id_, project_id)
values (22528, 14412);
insert into HAVE (soldier_id_, project_id)
values (22586, 4378);
insert into HAVE (soldier_id_, project_id)
values (22586, 5132);
insert into HAVE (soldier_id_, project_id)
values (22586, 22996);
insert into HAVE (soldier_id_, project_id)
values (22644, 4900);
insert into HAVE (soldier_id_, project_id)
values (22702, 8032);
insert into HAVE (soldier_id_, project_id)
values (22702, 18356);
insert into HAVE (soldier_id_, project_id)
values (22702, 21778);
insert into HAVE (soldier_id_, project_id)
values (22818, 11396);
insert into HAVE (soldier_id_, project_id)
values (22818, 12034);
insert into HAVE (soldier_id_, project_id)
values (22818, 22706);
insert into HAVE (soldier_id_, project_id)
values (22818, 23924);
insert into HAVE (soldier_id_, project_id)
values (22876, 8264);
insert into HAVE (soldier_id_, project_id)
values (22992, 2290);
insert into HAVE (soldier_id_, project_id)
values (22992, 8380);
insert into HAVE (soldier_id_, project_id)
values (23050, 5132);
insert into HAVE (soldier_id_, project_id)
values (23108, 17080);
insert into HAVE (soldier_id_, project_id)
values (23166, 24330);
insert into HAVE (soldier_id_, project_id)
values (23224, 4146);
insert into HAVE (soldier_id_, project_id)
values (23224, 5770);
insert into HAVE (soldier_id_, project_id)
values (23340, 8206);
insert into HAVE (soldier_id_, project_id)
values (23398, 12324);
insert into HAVE (soldier_id_, project_id)
values (23398, 17602);
insert into HAVE (soldier_id_, project_id)
values (23398, 18878);
insert into HAVE (soldier_id_, project_id)
values (23456, 15108);
insert into HAVE (soldier_id_, project_id)
values (23456, 20386);
insert into HAVE (soldier_id_, project_id)
values (23456, 23402);
insert into HAVE (soldier_id_, project_id)
values (23514, 7974);
insert into HAVE (soldier_id_, project_id)
values (23514, 11802);
insert into HAVE (soldier_id_, project_id)
values (23572, 20038);
insert into HAVE (soldier_id_, project_id)
values (23572, 20676);
insert into HAVE (soldier_id_, project_id)
values (23688, 16732);
insert into HAVE (soldier_id_, project_id)
values (23746, 8148);
insert into HAVE (soldier_id_, project_id)
values (23804, 4668);
insert into HAVE (soldier_id_, project_id)
values (23862, 23924);
insert into HAVE (soldier_id_, project_id)
values (23920, 5190);
insert into HAVE (soldier_id_, project_id)
values (23920, 10062);
insert into HAVE (soldier_id_, project_id)
values (24152, 4958);
insert into HAVE (soldier_id_, project_id)
values (24152, 23112);
insert into HAVE (soldier_id_, project_id)
values (24326, 8612);
insert into HAVE (soldier_id_, project_id)
values (24384, 15920);
insert into HAVE (soldier_id_, project_id)
values (24442, 2000);
insert into HAVE (soldier_id_, project_id)
values (24442, 6176);
insert into HAVE (soldier_id_, project_id)
values (24500, 24330);
insert into HAVE (soldier_id_, project_id)
values (24558, 17602);
insert into HAVE (soldier_id_, project_id)
values (24674, 7278);
insert into HAVE (soldier_id_, project_id)
values (24848, 2348);
insert into HAVE (soldier_id_, project_id)
values (24906, 4494);
insert into HAVE (soldier_id_, project_id)
values (24906, 7220);
insert into HAVE (soldier_id_, project_id)
values (24906, 24794);
insert into HAVE (soldier_id_, project_id)
values (25022, 3450);
insert into HAVE (soldier_id_, project_id)
values (25022, 13832);
insert into HAVE (soldier_id_, project_id)
values (25022, 19864);
insert into HAVE (soldier_id_, project_id)
values (25080, 24040);
insert into HAVE (soldier_id_, project_id)
values (25138, 24910);
insert into HAVE (soldier_id_, project_id)
values (25196, 8380);
insert into HAVE (soldier_id_, project_id)
values (25254, 4494);
insert into HAVE (soldier_id_, project_id)
values (25254, 6756);
insert into HAVE (soldier_id_, project_id)
values (25254, 19980);
insert into HAVE (soldier_id_, project_id)
values (25254, 24504);
insert into HAVE (soldier_id_, project_id)
values (25312, 14760);
insert into HAVE (soldier_id_, project_id)
values (25370, 7162);
insert into HAVE (soldier_id_, project_id)
values (25602, 12208);
insert into HAVE (soldier_id_, project_id)
values (25602, 14586);
insert into HAVE (soldier_id_, project_id)
values (25660, 4378);
insert into HAVE (soldier_id_, project_id)
values (25660, 15340);
insert into HAVE (soldier_id_, project_id)
values (25718, 22880);
insert into HAVE (soldier_id_, project_id)
values (25776, 5190);
insert into HAVE (soldier_id_, project_id)
values (25776, 8786);
insert into HAVE (soldier_id_, project_id)
values (25776, 23286);
insert into HAVE (soldier_id_, project_id)
values (25892, 8032);
insert into HAVE (soldier_id_, project_id)
values (26008, 8496);
insert into HAVE (soldier_id_, project_id)
values (26066, 24562);
insert into HAVE (soldier_id_, project_id)
values (26182, 5596);
insert into HAVE (soldier_id_, project_id)
values (26298, 6176);
insert into HAVE (soldier_id_, project_id)
values (26356, 5770);
insert into HAVE (soldier_id_, project_id)
values (26356, 5886);
insert into HAVE (soldier_id_, project_id)
values (26356, 6988);
insert into HAVE (soldier_id_, project_id)
values (26414, 9482);
insert into HAVE (soldier_id_, project_id)
values (26414, 24098);
insert into HAVE (soldier_id_, project_id)
values (26472, 4378);
insert into HAVE (soldier_id_, project_id)
values (26530, 17834);
insert into HAVE (soldier_id_, project_id)
values (26530, 19226);
insert into HAVE (soldier_id_, project_id)
values (26588, 12440);
insert into HAVE (soldier_id_, project_id)
values (26588, 13716);
insert into HAVE (soldier_id_, project_id)
values (26588, 24040);
insert into HAVE (soldier_id_, project_id)
values (26762, 13774);
insert into HAVE (soldier_id_, project_id)
values (26762, 24098);
insert into HAVE (soldier_id_, project_id)
values (26820, 4436);
insert into HAVE (soldier_id_, project_id)
values (26878, 23286);
insert into HAVE (soldier_id_, project_id)
values (26936, 21662);
insert into HAVE (soldier_id_, project_id)
values (26936, 23924);
insert into HAVE (soldier_id_, project_id)
values (26994, 16152);
insert into HAVE (soldier_id_, project_id)
values (26994, 18298);
insert into HAVE (soldier_id_, project_id)
values (27052, 9830);
commit;
prompt 300 records committed...
insert into HAVE (soldier_id_, project_id)
values (27226, 11802);
insert into HAVE (soldier_id_, project_id)
values (27226, 21546);
insert into HAVE (soldier_id_, project_id)
values (27284, 23170);
insert into HAVE (soldier_id_, project_id)
values (27458, 11222);
insert into HAVE (soldier_id_, project_id)
values (27516, 14934);
insert into HAVE (soldier_id_, project_id)
values (27574, 9424);
insert into HAVE (soldier_id_, project_id)
values (27632, 13774);
insert into HAVE (soldier_id_, project_id)
values (27690, 5422);
insert into HAVE (soldier_id_, project_id)
values (27690, 13194);
insert into HAVE (soldier_id_, project_id)
values (27690, 22300);
insert into HAVE (soldier_id_, project_id)
values (27748, 22010);
insert into HAVE (soldier_id_, project_id)
values (27806, 11918);
insert into HAVE (soldier_id_, project_id)
values (27806, 19516);
insert into HAVE (soldier_id_, project_id)
values (27864, 8902);
insert into HAVE (soldier_id_, project_id)
values (27980, 14064);
insert into HAVE (soldier_id_, project_id)
values (28038, 3566);
insert into HAVE (soldier_id_, project_id)
values (28154, 20444);
insert into HAVE (soldier_id_, project_id)
values (28270, 15862);
insert into HAVE (soldier_id_, project_id)
values (28328, 7742);
insert into HAVE (soldier_id_, project_id)
values (28328, 15456);
insert into HAVE (soldier_id_, project_id)
values (28386, 11628);
insert into HAVE (soldier_id_, project_id)
values (28444, 14934);
insert into HAVE (soldier_id_, project_id)
values (28966, 5132);
insert into HAVE (soldier_id_, project_id)
values (29024, 9888);
insert into HAVE (soldier_id_, project_id)
values (29140, 11860);
insert into HAVE (soldier_id_, project_id)
values (29140, 23866);
insert into HAVE (soldier_id_, project_id)
values (29198, 3740);
insert into HAVE (soldier_id_, project_id)
values (29198, 4842);
insert into HAVE (soldier_id_, project_id)
values (29256, 6466);
insert into HAVE (soldier_id_, project_id)
values (29314, 7916);
insert into HAVE (soldier_id_, project_id)
values (29314, 11222);
insert into HAVE (soldier_id_, project_id)
values (29372, 6466);
insert into HAVE (soldier_id_, project_id)
values (29488, 14296);
insert into HAVE (soldier_id_, project_id)
values (29546, 13542);
insert into HAVE (soldier_id_, project_id)
values (29604, 22648);
insert into HAVE (soldier_id_, project_id)
values (29662, 5132);
insert into HAVE (soldier_id_, project_id)
values (29662, 11338);
insert into HAVE (soldier_id_, project_id)
values (29720, 21894);
insert into HAVE (soldier_id_, project_id)
values (29836, 8902);
insert into HAVE (soldier_id_, project_id)
values (29894, 5132);
insert into HAVE (soldier_id_, project_id)
values (30010, 5770);
insert into HAVE (soldier_id_, project_id)
values (30126, 16384);
insert into HAVE (soldier_id_, project_id)
values (30184, 2232);
insert into HAVE (soldier_id_, project_id)
values (30242, 6350);
insert into HAVE (soldier_id_, project_id)
values (30242, 22590);
insert into HAVE (soldier_id_, project_id)
values (30300, 10120);
insert into HAVE (soldier_id_, project_id)
values (30300, 15456);
insert into HAVE (soldier_id_, project_id)
values (30300, 15572);
insert into HAVE (soldier_id_, project_id)
values (30300, 20386);
insert into HAVE (soldier_id_, project_id)
values (30416, 25026);
insert into HAVE (soldier_id_, project_id)
values (30474, 3450);
insert into HAVE (soldier_id_, project_id)
values (30474, 3508);
insert into HAVE (soldier_id_, project_id)
values (30474, 10178);
insert into HAVE (soldier_id_, project_id)
values (30532, 22184);
insert into HAVE (soldier_id_, project_id)
values (30648, 6930);
insert into HAVE (soldier_id_, project_id)
values (30648, 16268);
insert into HAVE (soldier_id_, project_id)
values (30706, 11280);
insert into HAVE (soldier_id_, project_id)
values (30764, 14354);
insert into HAVE (soldier_id_, project_id)
values (30822, 17370);
insert into HAVE (soldier_id_, project_id)
values (30880, 19110);
insert into HAVE (soldier_id_, project_id)
values (31170, 18588);
insert into HAVE (soldier_id_, project_id)
values (31170, 20038);
insert into HAVE (soldier_id_, project_id)
values (31286, 19168);
insert into HAVE (soldier_id_, project_id)
values (31286, 24272);
insert into HAVE (soldier_id_, project_id)
values (31402, 14702);
insert into HAVE (soldier_id_, project_id)
values (31576, 16152);
insert into HAVE (soldier_id_, project_id)
values (31634, 15282);
insert into HAVE (soldier_id_, project_id)
values (31750, 14180);
insert into HAVE (soldier_id_, project_id)
values (31866, 8148);
insert into HAVE (soldier_id_, project_id)
values (31866, 14296);
insert into HAVE (soldier_id_, project_id)
values (31924, 11628);
insert into HAVE (soldier_id_, project_id)
values (31924, 18472);
insert into HAVE (soldier_id_, project_id)
values (31924, 18936);
insert into HAVE (soldier_id_, project_id)
values (32040, 8206);
insert into HAVE (soldier_id_, project_id)
values (32040, 24446);
insert into HAVE (soldier_id_, project_id)
values (32098, 7104);
insert into HAVE (soldier_id_, project_id)
values (32156, 2406);
insert into HAVE (soldier_id_, project_id)
values (32214, 2870);
insert into HAVE (soldier_id_, project_id)
values (32214, 5248);
insert into HAVE (soldier_id_, project_id)
values (32214, 14644);
insert into HAVE (soldier_id_, project_id)
values (32272, 8032);
insert into HAVE (soldier_id_, project_id)
values (32388, 4552);
insert into HAVE (soldier_id_, project_id)
values (32388, 6988);
insert into HAVE (soldier_id_, project_id)
values (32388, 9424);
insert into HAVE (soldier_id_, project_id)
values (32446, 22822);
insert into HAVE (soldier_id_, project_id)
values (32504, 5770);
insert into HAVE (soldier_id_, project_id)
values (32562, 23054);
insert into HAVE (soldier_id_, project_id)
values (32620, 3276);
insert into HAVE (soldier_id_, project_id)
values (32620, 4436);
insert into HAVE (soldier_id_, project_id)
values (32678, 13136);
insert into HAVE (soldier_id_, project_id)
values (32678, 18936);
insert into HAVE (soldier_id_, project_id)
values (32736, 6234);
insert into HAVE (soldier_id_, project_id)
values (32794, 13252);
insert into HAVE (soldier_id_, project_id)
values (32852, 24330);
insert into HAVE (soldier_id_, project_id)
values (32910, 19458);
insert into HAVE (soldier_id_, project_id)
values (32968, 11396);
insert into HAVE (soldier_id_, project_id)
values (33084, 5364);
insert into HAVE (soldier_id_, project_id)
values (33084, 5480);
insert into HAVE (soldier_id_, project_id)
values (33084, 6002);
insert into HAVE (soldier_id_, project_id)
values (33142, 8032);
commit;
prompt 400 records loaded
prompt Loading TRAININGS_...
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (100, 'Complex Terrain Combat Training', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('02-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (113, 'Naval Warfare Training', to_date('19-04-2022', 'dd-mm-yyyy'), to_date('23-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (126, 'Chemical Warfare Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (139, 'Grenade Launcher Operation Training', to_date('05-03-2022', 'dd-mm-yyyy'), to_date('13-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (152, 'Medical Evacuation Training', to_date('25-01-2022', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (165, 'APC Operation Training', to_date('18-05-2022', 'dd-mm-yyyy'), to_date('08-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (178, 'Heat Condition Warfare Training', to_date('19-02-2022', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (191, 'Advanced Weapon Training', to_date('12-01-2022', 'dd-mm-yyyy'), to_date('02-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (204, 'Heat Condition Warfare Training', to_date('08-01-2022', 'dd-mm-yyyy'), to_date('07-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (217, 'Grenade Launcher Operation Training', to_date('22-01-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (230, 'APC Operation Training', to_date('19-04-2022', 'dd-mm-yyyy'), to_date('30-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (243, 'Anti-Terrorism Training', to_date('27-04-2022', 'dd-mm-yyyy'), to_date('28-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (256, 'Advanced Weapon Training', to_date('04-04-2022', 'dd-mm-yyyy'), to_date('22-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (269, 'Sniper Shooting Training', to_date('17-01-2022', 'dd-mm-yyyy'), to_date('11-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (282, 'Naval Warfare Training', to_date('10-04-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (295, 'Firefighting Training', to_date('13-03-2022', 'dd-mm-yyyy'), to_date('18-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (308, 'Krav Maga Training', to_date('23-04-2022', 'dd-mm-yyyy'), to_date('15-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (321, 'Naval Warfare Training', to_date('24-01-2022', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (334, 'Tank Operation Training', to_date('28-04-2022', 'dd-mm-yyyy'), to_date('18-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (347, 'Heavy Weapon Usage Training', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (360, 'Land Navigation Training', to_date('09-01-2022', 'dd-mm-yyyy'), to_date('27-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (373, 'Under Fire Rescue Training', to_date('20-01-2022', 'dd-mm-yyyy'), to_date('11-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (386, 'Heat Condition Warfare Training', to_date('09-01-2022', 'dd-mm-yyyy'), to_date('10-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (399, 'Combat Management Training', to_date('19-05-2022', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (412, 'Open Field Warfare Training', to_date('26-04-2022', 'dd-mm-yyyy'), to_date('12-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (425, 'Combat Fitness Training', to_date('17-04-2022', 'dd-mm-yyyy'), to_date('31-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (438, 'Chemical Warfare Training', to_date('25-04-2022', 'dd-mm-yyyy'), to_date('12-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (451, 'Rescue and Evacuation Training', to_date('04-05-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (464, 'Medical Evacuation Training', to_date('11-05-2022', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (477, 'APC Operation Training', to_date('02-02-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (490, 'Grenade Launcher Operation Training', to_date('25-05-2022', 'dd-mm-yyyy'), to_date('09-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (503, 'Tank Operation Training', to_date('14-03-2022', 'dd-mm-yyyy'), to_date('02-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (516, 'Communication and Signal Training', to_date('01-03-2022', 'dd-mm-yyyy'), to_date('19-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (529, 'Parachuting Training', to_date('07-05-2022', 'dd-mm-yyyy'), to_date('09-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (542, 'Firefighting Training', to_date('17-05-2022', 'dd-mm-yyyy'), to_date('22-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (555, 'Heavy Weapon Usage Training', to_date('07-05-2022', 'dd-mm-yyyy'), to_date('15-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (568, 'Tank Operation Training', to_date('19-01-2022', 'dd-mm-yyyy'), to_date('03-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (581, 'Heat Condition Warfare Training', to_date('21-05-2022', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (594, 'Reconnaissance and Defense Training', to_date('16-02-2022', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (607, 'Communication and Signal Training', to_date('14-04-2022', 'dd-mm-yyyy'), to_date('11-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (620, 'Combat Fitness Training', to_date('24-01-2022', 'dd-mm-yyyy'), to_date('02-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (633, 'Grenade Launcher Operation Training', to_date('22-04-2022', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (646, 'Reconnaissance and Defense Training', to_date('24-03-2022', 'dd-mm-yyyy'), to_date('19-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (659, 'Advanced Weapon Training', to_date('14-02-2022', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (672, 'Urban Warfare Training', to_date('07-01-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (685, 'Reconnaissance and Defense Training', to_date('12-04-2022', 'dd-mm-yyyy'), to_date('04-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (698, 'Medical Evacuation Training', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('30-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (711, 'Land Navigation Training', to_date('15-03-2022', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (724, 'Communication and Signal Training', to_date('02-03-2022', 'dd-mm-yyyy'), to_date('08-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (737, 'Observation and Defense Training', to_date('24-01-2022', 'dd-mm-yyyy'), to_date('01-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (750, 'Communication and Signal Training', to_date('22-01-2022', 'dd-mm-yyyy'), to_date('23-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (763, 'Chemical Warfare Training', to_date('16-02-2022', 'dd-mm-yyyy'), to_date('09-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (776, 'Reconnaissance and Defense Training', to_date('07-02-2022', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (789, 'Complex Terrain Combat Training', to_date('07-03-2022', 'dd-mm-yyyy'), to_date('15-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (802, 'Rescue and Evacuation Training', to_date('23-04-2022', 'dd-mm-yyyy'), to_date('13-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (815, 'APC Operation Training', to_date('11-05-2022', 'dd-mm-yyyy'), to_date('20-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (828, 'APC Operation Training', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (841, 'Rain Condition Warfare Training', to_date('14-01-2022', 'dd-mm-yyyy'), to_date('18-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (854, 'Chemical Warfare Training', to_date('27-02-2022', 'dd-mm-yyyy'), to_date('22-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (867, 'Rain Condition Warfare Training', to_date('15-01-2022', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (880, 'Parachuting Training', to_date('05-03-2022', 'dd-mm-yyyy'), to_date('27-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (893, 'Rain Condition Warfare Training', to_date('22-05-2022', 'dd-mm-yyyy'), to_date('06-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (906, 'Biological Warfare Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('06-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (919, 'Advanced Weapon Training', to_date('03-03-2022', 'dd-mm-yyyy'), to_date('28-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (932, 'Armored Vehicle Operation Training', to_date('08-04-2022', 'dd-mm-yyyy'), to_date('04-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (945, 'Tank Operation Training', to_date('02-05-2022', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (958, 'Biological Warfare Training', to_date('10-03-2022', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (971, 'Medical Evacuation Training', to_date('04-04-2022', 'dd-mm-yyyy'), to_date('07-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (984, 'Krav Maga Training', to_date('30-03-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (997, 'Land Navigation Training', to_date('14-01-2022', 'dd-mm-yyyy'), to_date('01-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1010, 'Open Field Warfare Training', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('14-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1023, 'Sniper Shooting Training', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('05-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1036, 'Heavy Weapon Usage Training', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('25-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1049, 'Firefighting Training', to_date('03-02-2022', 'dd-mm-yyyy'), to_date('25-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1062, 'Medical Evacuation Training', to_date('07-02-2022', 'dd-mm-yyyy'), to_date('20-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1075, 'Rescue and Evacuation Training', to_date('15-01-2022', 'dd-mm-yyyy'), to_date('02-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1088, 'Grenade Launcher Operation Training', to_date('25-05-2022', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1101, 'Heat Condition Warfare Training', to_date('05-04-2022', 'dd-mm-yyyy'), to_date('24-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1114, 'Naval Warfare Training', to_date('01-01-2022', 'dd-mm-yyyy'), to_date('06-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1127, 'Open Field Warfare Training', to_date('29-04-2022', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1140, 'Krav Maga Training', to_date('25-04-2022', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1153, 'Firefighting Training', to_date('08-03-2022', 'dd-mm-yyyy'), to_date('10-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1166, 'Biological Warfare Training', to_date('16-04-2022', 'dd-mm-yyyy'), to_date('26-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1179, 'Complex Terrain Combat Training', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1192, 'Medical Evacuation Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1205, 'Firefighting Training', to_date('12-02-2022', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1218, 'APC Operation Training', to_date('17-04-2022', 'dd-mm-yyyy'), to_date('29-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1231, 'Firefighting Training', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('01-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1244, 'Rescue and Evacuation Training', to_date('06-03-2022', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1257, 'Krav Maga Training', to_date('05-05-2022', 'dd-mm-yyyy'), to_date('02-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1270, 'Combat Fitness Training', to_date('29-01-2022', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1283, 'Rescue and Evacuation Training', to_date('05-02-2022', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1296, 'Complex Terrain Combat Training', to_date('15-01-2022', 'dd-mm-yyyy'), to_date('17-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1309, 'Armored Vehicle Operation Training', to_date('08-01-2022', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1322, 'Reconnaissance and Defense Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('17-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1335, 'Observation and Defense Training', to_date('10-05-2022', 'dd-mm-yyyy'), to_date('15-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1348, 'APC Operation Training', to_date('16-05-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1361, 'Open Field Warfare Training', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('08-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1374, 'Land Navigation Training', to_date('19-05-2022', 'dd-mm-yyyy'), to_date('18-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1387, 'Heavy Weapon Usage Training', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('26-12-2022', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1400, 'Firefighting Training', to_date('03-04-2022', 'dd-mm-yyyy'), to_date('08-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1413, 'Rescue and Evacuation Training', to_date('17-05-2022', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1426, 'Firefighting Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1439, 'Firefighting Training', to_date('04-02-2022', 'dd-mm-yyyy'), to_date('16-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1452, 'Under Fire Rescue Training', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('07-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1465, 'Collapsed Structure Rescue Training', to_date('25-02-2022', 'dd-mm-yyyy'), to_date('13-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1478, 'Firefighting Training', to_date('24-03-2022', 'dd-mm-yyyy'), to_date('01-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1491, 'Grenade Launcher Operation Training', to_date('26-03-2022', 'dd-mm-yyyy'), to_date('06-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1504, 'Anti-Terrorism Training', to_date('18-03-2022', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1517, 'Medical Evacuation Training', to_date('01-05-2022', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1530, 'Collapsed Structure Rescue Training', to_date('29-05-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1543, 'Advanced Weapon Training', to_date('06-04-2022', 'dd-mm-yyyy'), to_date('27-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1556, 'Advanced Weapon Training', to_date('01-04-2022', 'dd-mm-yyyy'), to_date('07-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1569, 'Tactical Driving Training', to_date('29-01-2022', 'dd-mm-yyyy'), to_date('01-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1582, 'Tank Operation Training', to_date('06-04-2022', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1595, 'Complex Terrain Combat Training', to_date('13-04-2022', 'dd-mm-yyyy'), to_date('13-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1608, 'Anti-Terrorism Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1621, 'APC Operation Training', to_date('19-05-2022', 'dd-mm-yyyy'), to_date('12-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1634, 'Heat Condition Warfare Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1647, 'Combat Fitness Training', to_date('24-05-2022', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1660, 'Krav Maga Training', to_date('10-02-2022', 'dd-mm-yyyy'), to_date('11-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1673, 'Chemical Warfare Training', to_date('31-03-2022', 'dd-mm-yyyy'), to_date('10-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1686, 'Anti-Terrorism Training', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1699, 'Armored Vehicle Operation Training', to_date('14-02-2022', 'dd-mm-yyyy'), to_date('08-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1712, 'Krav Maga Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1725, 'Land Navigation Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('05-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1738, 'Rain Condition Warfare Training', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('09-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1751, 'APC Operation Training', to_date('15-05-2022', 'dd-mm-yyyy'), to_date('28-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1764, 'Firefighting Training', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1777, 'Collapsed Structure Rescue Training', to_date('04-02-2022', 'dd-mm-yyyy'), to_date('16-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1790, 'Complex Terrain Combat Training', to_date('25-01-2022', 'dd-mm-yyyy'), to_date('27-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1803, 'APC Operation Training', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1816, 'Tank Operation Training', to_date('12-02-2022', 'dd-mm-yyyy'), to_date('20-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1829, 'Biological Warfare Training', to_date('16-05-2022', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1842, 'Tank Operation Training', to_date('12-01-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1855, 'Under Fire Rescue Training', to_date('03-05-2022', 'dd-mm-yyyy'), to_date('17-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1868, 'APC Operation Training', to_date('30-04-2022', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1881, 'Sniper Shooting Training', to_date('30-01-2022', 'dd-mm-yyyy'), to_date('03-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1894, 'Tactical Driving Training', to_date('27-03-2022', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1907, 'Firefighting Training', to_date('15-05-2022', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1920, 'Anti-Terrorism Training', to_date('18-02-2022', 'dd-mm-yyyy'), to_date('18-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1933, 'Grenade Launcher Operation Training', to_date('17-03-2022', 'dd-mm-yyyy'), to_date('22-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1946, 'Complex Terrain Combat Training', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('07-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1959, 'Firefighting Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1972, 'Advanced Weapon Training', to_date('10-03-2022', 'dd-mm-yyyy'), to_date('13-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1985, 'APC Operation Training', to_date('07-02-2022', 'dd-mm-yyyy'), to_date('13-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (1998, 'Grenade Launcher Operation Training', to_date('24-05-2022', 'dd-mm-yyyy'), to_date('16-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2011, 'Observation and Defense Training', to_date('22-04-2022', 'dd-mm-yyyy'), to_date('14-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2024, 'Communication and Signal Training', to_date('22-03-2022', 'dd-mm-yyyy'), to_date('13-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2037, 'Grenade Launcher Operation Training', to_date('31-03-2022', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2050, 'Observation and Defense Training', to_date('14-05-2022', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2063, 'Tactical Driving Training', to_date('07-05-2022', 'dd-mm-yyyy'), to_date('01-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2076, 'Urban Warfare Training', to_date('12-01-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2089, 'Rescue and Evacuation Training', to_date('08-02-2022', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2102, 'Under Fire Rescue Training', to_date('10-03-2022', 'dd-mm-yyyy'), to_date('21-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2115, 'Open Field Warfare Training', to_date('22-01-2022', 'dd-mm-yyyy'), to_date('04-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2128, 'Chemical Warfare Training', to_date('07-05-2022', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2141, 'Tank Operation Training', to_date('16-01-2022', 'dd-mm-yyyy'), to_date('04-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2154, 'Firefighting Training', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('21-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2167, 'Reconnaissance and Defense Training', to_date('04-04-2022', 'dd-mm-yyyy'), to_date('09-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2180, 'Rain Condition Warfare Training', to_date('26-04-2022', 'dd-mm-yyyy'), to_date('07-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2193, 'Tank Operation Training', to_date('18-05-2022', 'dd-mm-yyyy'), to_date('08-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2206, 'Tank Operation Training', to_date('14-05-2022', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2219, 'Rescue and Evacuation Training', to_date('26-01-2022', 'dd-mm-yyyy'), to_date('03-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2232, 'Biological Warfare Training', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('16-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2245, 'Firefighting Training', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('11-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2258, 'Anti-Terrorism Training', to_date('11-02-2022', 'dd-mm-yyyy'), to_date('17-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2271, 'Combat Fitness Training', to_date('06-01-2022', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2284, 'Sniper Shooting Training', to_date('13-02-2022', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2297, 'Under Fire Rescue Training', to_date('16-05-2022', 'dd-mm-yyyy'), to_date('28-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2310, 'Heavy Weapon Usage Training', to_date('05-05-2022', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2323, 'Communication and Signal Training', to_date('23-01-2022', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2336, 'Krav Maga Training', to_date('23-03-2022', 'dd-mm-yyyy'), to_date('25-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2349, 'Rain Condition Warfare Training', to_date('12-03-2022', 'dd-mm-yyyy'), to_date('11-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2362, 'Urban Warfare Training', to_date('21-01-2022', 'dd-mm-yyyy'), to_date('07-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2375, 'Anti-Terrorism Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('01-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2388, 'Chemical Warfare Training', to_date('01-04-2022', 'dd-mm-yyyy'), to_date('10-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2401, 'Collapsed Structure Rescue Training', to_date('01-02-2022', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2414, 'APC Operation Training', to_date('31-03-2022', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2427, 'Rescue and Evacuation Training', to_date('12-04-2022', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2440, 'Parachuting Training', to_date('14-02-2022', 'dd-mm-yyyy'), to_date('21-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2453, 'Sniper Shooting Training', to_date('12-03-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2466, 'Tactical Driving Training', to_date('15-04-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2479, 'Tank Operation Training', to_date('05-03-2022', 'dd-mm-yyyy'), to_date('27-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2492, 'Heavy Weapon Usage Training', to_date('21-01-2022', 'dd-mm-yyyy'), to_date('11-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2505, 'Heavy Weapon Usage Training', to_date('08-05-2022', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2518, 'Anti-Terrorism Training', to_date('08-03-2022', 'dd-mm-yyyy'), to_date('24-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2531, 'Land Navigation Training', to_date('13-03-2022', 'dd-mm-yyyy'), to_date('23-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2544, 'Firefighting Training', to_date('18-04-2022', 'dd-mm-yyyy'), to_date('06-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2557, 'Rescue and Evacuation Training', to_date('08-01-2022', 'dd-mm-yyyy'), to_date('16-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2570, 'Communication and Signal Training', to_date('25-02-2022', 'dd-mm-yyyy'), to_date('17-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2583, 'Grenade Launcher Operation Training', to_date('04-02-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2596, 'Reconnaissance and Defense Training', to_date('12-03-2022', 'dd-mm-yyyy'), to_date('16-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2609, 'Tank Operation Training', to_date('20-05-2022', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2622, 'Advanced Weapon Training', to_date('21-04-2022', 'dd-mm-yyyy'), to_date('18-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2635, 'Communication and Signal Training', to_date('10-01-2022', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2648, 'Grenade Launcher Operation Training', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('25-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2661, 'Medical Evacuation Training', to_date('23-01-2022', 'dd-mm-yyyy'), to_date('03-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2674, 'Heat Condition Warfare Training', to_date('08-04-2022', 'dd-mm-yyyy'), to_date('17-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2687, 'Rescue and Evacuation Training', to_date('23-01-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2700, 'Firefighting Training', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2713, 'Biological Warfare Training', to_date('18-05-2022', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2726, 'Chemical Warfare Training', to_date('04-02-2022', 'dd-mm-yyyy'), to_date('13-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2739, 'Observation and Defense Training', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('12-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2752, 'Rescue and Evacuation Training', to_date('06-05-2022', 'dd-mm-yyyy'), to_date('19-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2765, 'Urban Warfare Training', to_date('17-05-2022', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2778, 'Rain Condition Warfare Training', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2791, 'Anti-Terrorism Training', to_date('16-01-2022', 'dd-mm-yyyy'), to_date('19-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2804, 'Heat Condition Warfare Training', to_date('18-01-2022', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2817, 'Combat Fitness Training', to_date('20-02-2022', 'dd-mm-yyyy'), to_date('20-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2830, 'Tactical Driving Training', to_date('24-02-2022', 'dd-mm-yyyy'), to_date('11-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2843, 'Sniper Shooting Training', to_date('20-01-2022', 'dd-mm-yyyy'), to_date('27-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2856, 'Parachuting Training', to_date('15-02-2022', 'dd-mm-yyyy'), to_date('18-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2869, 'Tactical Driving Training', to_date('11-04-2022', 'dd-mm-yyyy'), to_date('02-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2882, 'Tank Operation Training', to_date('21-05-2022', 'dd-mm-yyyy'), to_date('13-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2895, 'Collapsed Structure Rescue Training', to_date('17-03-2022', 'dd-mm-yyyy'), to_date('18-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2908, 'Observation and Defense Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('25-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2921, 'Under Fire Rescue Training', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2934, 'Rain Condition Warfare Training', to_date('11-04-2022', 'dd-mm-yyyy'), to_date('13-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2947, 'Parachuting Training', to_date('06-05-2022', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2960, 'Heat Condition Warfare Training', to_date('19-02-2022', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2973, 'Chemical Warfare Training', to_date('24-02-2022', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2986, 'Parachuting Training', to_date('01-02-2022', 'dd-mm-yyyy'), to_date('30-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (2999, 'Medical Evacuation Training', to_date('29-05-2022', 'dd-mm-yyyy'), to_date('19-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3012, 'Chemical Warfare Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3025, 'Medical Evacuation Training', to_date('06-04-2022', 'dd-mm-yyyy'), to_date('16-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3038, 'Sniper Shooting Training', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3051, 'Grenade Launcher Operation Training', to_date('27-04-2022', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3064, 'Complex Terrain Combat Training', to_date('28-05-2022', 'dd-mm-yyyy'), to_date('26-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3077, 'Parachuting Training', to_date('25-01-2022', 'dd-mm-yyyy'), to_date('14-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3090, 'Under Fire Rescue Training', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3103, 'Rain Condition Warfare Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3116, 'Firefighting Training', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('09-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3129, 'Firefighting Training', to_date('08-05-2022', 'dd-mm-yyyy'), to_date('15-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3142, 'Combat Fitness Training', to_date('11-01-2022', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3155, 'Krav Maga Training', to_date('12-04-2022', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3168, 'Naval Warfare Training', to_date('02-03-2022', 'dd-mm-yyyy'), to_date('27-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3181, 'Anti-Terrorism Training', to_date('14-03-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3194, 'Armored Vehicle Operation Training', to_date('11-02-2022', 'dd-mm-yyyy'), to_date('25-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3207, 'Complex Terrain Combat Training', to_date('29-01-2022', 'dd-mm-yyyy'), to_date('05-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3220, 'Urban Warfare Training', to_date('02-05-2022', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3233, 'Rescue and Evacuation Training', to_date('02-04-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3246, 'Biological Warfare Training', to_date('26-05-2022', 'dd-mm-yyyy'), to_date('26-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3259, 'Collapsed Structure Rescue Training', to_date('10-01-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3272, 'APC Operation Training', to_date('06-03-2022', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3285, 'Biological Warfare Training', to_date('13-02-2022', 'dd-mm-yyyy'), to_date('17-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3298, 'Complex Terrain Combat Training', to_date('08-02-2022', 'dd-mm-yyyy'), to_date('12-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3311, 'Heavy Weapon Usage Training', to_date('15-03-2022', 'dd-mm-yyyy'), to_date('22-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3324, 'Heat Condition Warfare Training', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3337, 'Communication and Signal Training', to_date('22-01-2022', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3350, 'Complex Terrain Combat Training', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3363, 'Sniper Shooting Training', to_date('29-03-2022', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3376, 'Tactical Driving Training', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3389, 'Heat Condition Warfare Training', to_date('13-04-2022', 'dd-mm-yyyy'), to_date('07-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3402, 'Under Fire Rescue Training', to_date('13-05-2022', 'dd-mm-yyyy'), to_date('18-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3415, 'Naval Warfare Training', to_date('11-02-2022', 'dd-mm-yyyy'), to_date('07-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3428, 'Naval Warfare Training', to_date('08-05-2022', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3441, 'Biological Warfare Training', to_date('19-01-2022', 'dd-mm-yyyy'), to_date('26-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3454, 'Tank Operation Training', to_date('14-04-2022', 'dd-mm-yyyy'), to_date('15-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3467, 'Land Navigation Training', to_date('02-02-2022', 'dd-mm-yyyy'), to_date('08-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3480, 'Combat Fitness Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('21-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3493, 'Tactical Driving Training', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('28-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3506, 'Parachuting Training', to_date('18-02-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3519, 'Collapsed Structure Rescue Training', to_date('13-01-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3532, 'Reconnaissance and Defense Training', to_date('16-01-2022', 'dd-mm-yyyy'), to_date('18-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3545, 'Combat Fitness Training', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3558, 'Firefighting Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3571, 'Tactical Driving Training', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3584, 'Heavy Weapon Usage Training', to_date('18-05-2022', 'dd-mm-yyyy'), to_date('10-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3597, 'Open Field Warfare Training', to_date('14-02-2022', 'dd-mm-yyyy'), to_date('06-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3610, 'Combat Fitness Training', to_date('06-03-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3623, 'Collapsed Structure Rescue Training', to_date('06-02-2022', 'dd-mm-yyyy'), to_date('30-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3636, 'Complex Terrain Combat Training', to_date('12-02-2022', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3649, 'Land Navigation Training', to_date('18-04-2022', 'dd-mm-yyyy'), to_date('18-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3662, 'APC Operation Training', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3675, 'Advanced Weapon Training', to_date('25-04-2022', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3688, 'Combat Management Training', to_date('27-03-2022', 'dd-mm-yyyy'), to_date('21-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3701, 'Chemical Warfare Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3714, 'Open Field Warfare Training', to_date('06-03-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3727, 'Parachuting Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3740, 'Tank Operation Training', to_date('06-05-2022', 'dd-mm-yyyy'), to_date('08-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3753, 'Sniper Shooting Training', to_date('25-05-2022', 'dd-mm-yyyy'), to_date('20-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3766, 'Combat Management Training', to_date('30-01-2022', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3779, 'Complex Terrain Combat Training', to_date('14-05-2022', 'dd-mm-yyyy'), to_date('19-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3792, 'Medical Evacuation Training', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('23-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3805, 'Grenade Launcher Operation Training', to_date('15-01-2022', 'dd-mm-yyyy'), to_date('14-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3818, 'Grenade Launcher Operation Training', to_date('22-03-2022', 'dd-mm-yyyy'), to_date('13-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3831, 'Collapsed Structure Rescue Training', to_date('17-03-2022', 'dd-mm-yyyy'), to_date('04-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3844, 'Collapsed Structure Rescue Training', to_date('02-02-2022', 'dd-mm-yyyy'), to_date('09-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3857, 'Communication and Signal Training', to_date('26-01-2022', 'dd-mm-yyyy'), to_date('06-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3870, 'Medical Evacuation Training', to_date('15-03-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3883, 'Communication and Signal Training', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('13-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3896, 'Open Field Warfare Training', to_date('28-03-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3909, 'Advanced Weapon Training', to_date('16-03-2022', 'dd-mm-yyyy'), to_date('23-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3922, 'Open Field Warfare Training', to_date('14-04-2022', 'dd-mm-yyyy'), to_date('05-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3935, 'APC Operation Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('29-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3948, 'Biological Warfare Training', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('16-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3961, 'Rain Condition Warfare Training', to_date('21-05-2022', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3974, 'Open Field Warfare Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (3987, 'Rescue and Evacuation Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('27-09-2022', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4000, 'Communication and Signal Training', to_date('02-04-2022', 'dd-mm-yyyy'), to_date('22-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4013, 'Krav Maga Training', to_date('16-05-2022', 'dd-mm-yyyy'), to_date('16-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4026, 'Rescue and Evacuation Training', to_date('24-02-2022', 'dd-mm-yyyy'), to_date('09-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4039, 'Observation and Defense Training', to_date('28-05-2022', 'dd-mm-yyyy'), to_date('04-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4052, 'Chemical Warfare Training', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('27-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4065, 'Chemical Warfare Training', to_date('06-01-2022', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4078, 'Medical Evacuation Training', to_date('24-05-2022', 'dd-mm-yyyy'), to_date('07-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4091, 'Urban Warfare Training', to_date('09-05-2022', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4104, 'Sniper Shooting Training', to_date('03-04-2022', 'dd-mm-yyyy'), to_date('14-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4117, 'Biological Warfare Training', to_date('07-05-2022', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4130, 'Collapsed Structure Rescue Training', to_date('01-03-2022', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4143, 'Heavy Weapon Usage Training', to_date('07-04-2022', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4156, 'Anti-Terrorism Training', to_date('04-02-2022', 'dd-mm-yyyy'), to_date('28-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4169, 'Urban Warfare Training', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('16-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4182, 'Grenade Launcher Operation Training', to_date('22-01-2022', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4195, 'Medical Evacuation Training', to_date('28-04-2022', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4208, 'Land Navigation Training', to_date('03-01-2022', 'dd-mm-yyyy'), to_date('15-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4221, 'Medical Evacuation Training', to_date('21-01-2022', 'dd-mm-yyyy'), to_date('26-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4234, 'Rain Condition Warfare Training', to_date('20-05-2022', 'dd-mm-yyyy'), to_date('27-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4247, 'APC Operation Training', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4260, 'Sniper Shooting Training', to_date('06-03-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4273, 'Heavy Weapon Usage Training', to_date('08-02-2022', 'dd-mm-yyyy'), to_date('11-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4286, 'Combat Management Training', to_date('27-04-2022', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4299, 'Firefighting Training', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4312, 'Rescue and Evacuation Training', to_date('23-02-2022', 'dd-mm-yyyy'), to_date('13-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4325, 'Land Navigation Training', to_date('15-02-2022', 'dd-mm-yyyy'), to_date('06-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4338, 'Biological Warfare Training', to_date('24-02-2022', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4351, 'Grenade Launcher Operation Training', to_date('03-03-2022', 'dd-mm-yyyy'), to_date('06-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4364, 'Tactical Driving Training', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('03-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4377, 'Land Navigation Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4390, 'Sniper Shooting Training', to_date('28-05-2022', 'dd-mm-yyyy'), to_date('18-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4403, 'Krav Maga Training', to_date('01-03-2022', 'dd-mm-yyyy'), to_date('11-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4416, 'Complex Terrain Combat Training', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4429, 'Chemical Warfare Training', to_date('20-02-2022', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4442, 'Armored Vehicle Operation Training', to_date('04-03-2022', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4455, 'Grenade Launcher Operation Training', to_date('02-02-2022', 'dd-mm-yyyy'), to_date('14-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4468, 'Anti-Terrorism Training', to_date('21-04-2022', 'dd-mm-yyyy'), to_date('02-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4481, 'Urban Warfare Training', to_date('09-04-2022', 'dd-mm-yyyy'), to_date('14-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4494, 'Combat Management Training', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('29-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4507, 'APC Operation Training', to_date('13-02-2022', 'dd-mm-yyyy'), to_date('08-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4520, 'Anti-Terrorism Training', to_date('18-03-2022', 'dd-mm-yyyy'), to_date('28-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4533, 'Parachuting Training', to_date('18-04-2022', 'dd-mm-yyyy'), to_date('03-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4546, 'Chemical Warfare Training', to_date('03-02-2022', 'dd-mm-yyyy'), to_date('18-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4559, 'Rescue and Evacuation Training', to_date('15-03-2022', 'dd-mm-yyyy'), to_date('06-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4572, 'Medical Evacuation Training', to_date('22-02-2022', 'dd-mm-yyyy'), to_date('28-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4585, 'Anti-Terrorism Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('18-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4598, 'Combat Management Training', to_date('04-04-2022', 'dd-mm-yyyy'), to_date('19-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4611, 'APC Operation Training', to_date('17-01-2022', 'dd-mm-yyyy'), to_date('13-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4624, 'Collapsed Structure Rescue Training', to_date('31-03-2022', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4637, 'Biological Warfare Training', to_date('29-04-2022', 'dd-mm-yyyy'), to_date('07-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4650, 'Sniper Shooting Training', to_date('14-03-2022', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4663, 'Biological Warfare Training', to_date('15-05-2022', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4676, 'Krav Maga Training', to_date('06-02-2022', 'dd-mm-yyyy'), to_date('20-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4689, 'Firefighting Training', to_date('28-03-2022', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4702, 'Land Navigation Training', to_date('06-04-2022', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4715, 'Communication and Signal Training', to_date('11-03-2022', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4728, 'Under Fire Rescue Training', to_date('13-04-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4741, 'Observation and Defense Training', to_date('08-03-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4754, 'Collapsed Structure Rescue Training', to_date('19-04-2022', 'dd-mm-yyyy'), to_date('01-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4767, 'Open Field Warfare Training', to_date('07-03-2022', 'dd-mm-yyyy'), to_date('20-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4780, 'Rescue and Evacuation Training', to_date('10-04-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4793, 'Collapsed Structure Rescue Training', to_date('24-01-2022', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4806, 'Combat Fitness Training', to_date('17-02-2022', 'dd-mm-yyyy'), to_date('09-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4819, 'Sniper Shooting Training', to_date('14-02-2022', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4832, 'Communication and Signal Training', to_date('21-05-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4845, 'Reconnaissance and Defense Training', to_date('10-01-2022', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4858, 'Communication and Signal Training', to_date('28-03-2022', 'dd-mm-yyyy'), to_date('09-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4871, 'Biological Warfare Training', to_date('01-05-2022', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4884, 'Armored Vehicle Operation Training', to_date('20-04-2022', 'dd-mm-yyyy'), to_date('14-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4897, 'Combat Management Training', to_date('26-02-2022', 'dd-mm-yyyy'), to_date('12-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4910, 'Biological Warfare Training', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('30-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4923, 'Combat Fitness Training', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4936, 'Chemical Warfare Training', to_date('26-01-2022', 'dd-mm-yyyy'), to_date('09-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4949, 'Tank Operation Training', to_date('10-05-2022', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4962, 'Naval Warfare Training', to_date('16-01-2022', 'dd-mm-yyyy'), to_date('02-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4975, 'Naval Warfare Training', to_date('01-04-2022', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (4988, 'Reconnaissance and Defense Training', to_date('15-01-2022', 'dd-mm-yyyy'), to_date('21-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5001, 'Combat Fitness Training', to_date('08-02-2022', 'dd-mm-yyyy'), to_date('17-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5014, 'Sniper Shooting Training', to_date('24-05-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5027, 'Naval Warfare Training', to_date('19-03-2022', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5040, 'Reconnaissance and Defense Training', to_date('04-01-2022', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5053, 'Rescue and Evacuation Training', to_date('20-03-2022', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5066, 'Advanced Weapon Training', to_date('07-02-2022', 'dd-mm-yyyy'), to_date('15-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5079, 'Urban Warfare Training', to_date('18-02-2022', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5092, 'Naval Warfare Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5105, 'Rescue and Evacuation Training', to_date('06-01-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5118, 'Naval Warfare Training', to_date('05-01-2022', 'dd-mm-yyyy'), to_date('09-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5131, 'Open Field Warfare Training', to_date('13-01-2022', 'dd-mm-yyyy'), to_date('09-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5144, 'Heat Condition Warfare Training', to_date('24-04-2022', 'dd-mm-yyyy'), to_date('18-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5157, 'Krav Maga Training', to_date('05-01-2022', 'dd-mm-yyyy'), to_date('19-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5170, 'Chemical Warfare Training', to_date('16-02-2022', 'dd-mm-yyyy'), to_date('21-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5183, 'Collapsed Structure Rescue Training', to_date('27-01-2022', 'dd-mm-yyyy'), to_date('15-07-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5196, 'Medical Evacuation Training', to_date('29-05-2022', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5209, 'Urban Warfare Training', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5222, 'Advanced Weapon Training', to_date('04-03-2022', 'dd-mm-yyyy'), to_date('20-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5235, 'Chemical Warfare Training', to_date('26-03-2022', 'dd-mm-yyyy'), to_date('23-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5248, 'Armored Vehicle Operation Training', to_date('28-03-2022', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5261, 'Advanced Weapon Training', to_date('28-05-2022', 'dd-mm-yyyy'), to_date('15-11-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5274, 'Naval Warfare Training', to_date('11-03-2022', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'));
insert into TRAININGS_ (training_id_, training_name_, start_date_, end_date_)
values (5287, 'Parachuting Training', to_date('18-04-2022', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading PARTICIPANT...
insert into PARTICIPANT (soldier_id_, training_id_)
values (10000, 516);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10000, 2934);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10116, 2804);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10232, 1972);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10290, 724);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10290, 815);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10348, 2466);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10348, 4637);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10406, 1751);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10406, 3649);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10522, 1231);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10580, 4884);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10638, 4247);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10696, 1114);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10812, 2518);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10928, 1062);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10928, 4780);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10986, 1426);
insert into PARTICIPANT (soldier_id_, training_id_)
values (10986, 1543);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11218, 4897);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11334, 1647);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11508, 3844);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11624, 633);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11624, 5092);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11624, 5248);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11682, 4819);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11740, 1465);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11740, 3805);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11798, 360);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11798, 1855);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11798, 3064);
insert into PARTICIPANT (soldier_id_, training_id_)
values (11914, 464);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12146, 2401);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12146, 3597);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12146, 4624);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12146, 4897);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12204, 828);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12262, 4871);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12320, 815);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12320, 3129);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12378, 1127);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12378, 3025);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12436, 5209);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12494, 4182);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12552, 217);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12552, 2310);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12610, 4364);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12726, 1153);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12726, 1764);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12726, 2141);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12784, 2401);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12784, 2934);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12784, 4208);
insert into PARTICIPANT (soldier_id_, training_id_)
values (12958, 2908);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13016, 3506);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13074, 3636);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13074, 4429);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13074, 5248);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13190, 334);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13190, 1478);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13364, 2908);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13422, 3038);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13422, 5079);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13480, 3402);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13538, 126);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13538, 2726);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13596, 854);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13654, 2271);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13886, 3220);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13944, 1517);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13944, 3038);
insert into PARTICIPANT (soldier_id_, training_id_)
values (13944, 3376);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14060, 841);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14060, 4351);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14176, 984);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14234, 1478);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14234, 3688);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14234, 3922);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14350, 425);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14350, 867);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14408, 2128);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14524, 1244);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14524, 3558);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14582, 867);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14582, 4078);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14640, 2063);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14640, 3012);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14698, 334);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14698, 2401);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14698, 3311);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14814, 3246);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14872, 373);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14930, 1478);
insert into PARTICIPANT (soldier_id_, training_id_)
values (14988, 3649);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15046, 2674);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15046, 2765);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15046, 3714);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15162, 3493);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15220, 3051);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15278, 711);
commit;
prompt 100 records committed...
insert into PARTICIPANT (soldier_id_, training_id_)
values (15278, 2973);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15452, 3766);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15452, 4507);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15452, 5105);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15626, 256);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15626, 1218);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15626, 1946);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15626, 2063);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15742, 906);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15858, 3688);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15916, 2518);
insert into PARTICIPANT (soldier_id_, training_id_)
values (15974, 4221);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16148, 5105);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16322, 191);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16380, 451);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16380, 2375);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16380, 4468);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16496, 971);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16554, 2869);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16554, 2947);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16728, 711);
insert into PARTICIPANT (soldier_id_, training_id_)
values (16960, 4754);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17076, 4715);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17192, 2258);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17250, 1634);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17250, 4650);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17308, 1803);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17424, 4351);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17482, 308);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17482, 3857);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17714, 139);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17714, 3844);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17772, 2310);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17830, 334);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17830, 1101);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17830, 3779);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17888, 4702);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17946, 1556);
insert into PARTICIPANT (soldier_id_, training_id_)
values (17946, 4000);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18062, 2245);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18062, 3220);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18236, 1218);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18236, 1400);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18294, 1244);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18294, 1712);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18294, 2934);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18410, 2050);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18468, 3103);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18526, 1777);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18584, 5170);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18642, 4273);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18758, 3324);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18874, 295);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18874, 802);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18874, 4585);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18990, 2024);
insert into PARTICIPANT (soldier_id_, training_id_)
values (18990, 2284);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19048, 4780);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19106, 672);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19164, 737);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19338, 464);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19512, 3727);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19512, 3909);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19570, 1569);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19628, 1764);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19802, 4884);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19860, 2479);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19860, 4754);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19918, 854);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19918, 1829);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19918, 3870);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19918, 5105);
insert into PARTICIPANT (soldier_id_, training_id_)
values (19918, 5222);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20034, 4156);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20092, 126);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20208, 4702);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20324, 2999);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20324, 3558);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20382, 1569);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20440, 5183);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20556, 1244);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20556, 4364);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20614, 4455);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20730, 282);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20730, 1491);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20730, 4897);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20788, 1166);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20788, 3441);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20846, 2453);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20846, 2765);
insert into PARTICIPANT (soldier_id_, training_id_)
values (20962, 3532);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21020, 2440);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21136, 1972);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21136, 4078);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21136, 4585);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21252, 4767);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21310, 4975);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21310, 5287);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21484, 4806);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21658, 1153);
commit;
prompt 200 records committed...
insert into PARTICIPANT (soldier_id_, training_id_)
values (21774, 3649);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21832, 1075);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21890, 3207);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21948, 854);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21948, 880);
insert into PARTICIPANT (soldier_id_, training_id_)
values (21948, 4377);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22238, 282);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22296, 1504);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22354, 2479);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22412, 2752);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22470, 3441);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22470, 4832);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22644, 919);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22644, 1998);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22702, 2843);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22760, 282);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22818, 3103);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22818, 4559);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22818, 5274);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22876, 373);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22876, 4910);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22876, 4936);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22934, 347);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22992, 3350);
insert into PARTICIPANT (soldier_id_, training_id_)
values (22992, 4507);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23108, 3753);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23166, 3402);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23224, 828);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23282, 3246);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23340, 1257);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23340, 1920);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23572, 3038);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23630, 581);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23630, 3857);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23630, 4494);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23746, 1023);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23804, 2817);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23920, 4273);
insert into PARTICIPANT (soldier_id_, training_id_)
values (23978, 2661);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24036, 2453);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24094, 1101);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24094, 2713);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24152, 1049);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24152, 1933);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24210, 2427);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24210, 3519);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24268, 958);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24326, 581);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24326, 3116);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24326, 4299);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24326, 4832);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24384, 3155);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24384, 5287);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24616, 1543);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24616, 3935);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24906, 4117);
insert into PARTICIPANT (soldier_id_, training_id_)
values (24964, 1374);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25022, 1465);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25022, 2986);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25022, 4338);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25080, 3194);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25138, 1673);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25196, 4741);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25428, 1894);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25428, 2089);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25486, 4936);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25544, 2115);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25544, 3233);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25602, 4533);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25718, 1036);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25718, 3363);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25776, 867);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25834, 1049);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25834, 4000);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25834, 4403);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25892, 3103);
insert into PARTICIPANT (soldier_id_, training_id_)
values (25950, 763);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26008, 2180);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26008, 2778);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26008, 4624);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26124, 4507);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26240, 1270);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26240, 1933);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26298, 4845);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26298, 5183);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26472, 3610);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26530, 4026);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26588, 3064);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26646, 1218);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26762, 204);
insert into PARTICIPANT (soldier_id_, training_id_)
values (26936, 3662);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27052, 1556);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27110, 2336);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27168, 3181);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27342, 1985);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27400, 1530);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27458, 5053);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27574, 256);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27574, 3584);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27574, 4221);
commit;
prompt 300 records committed...
insert into PARTICIPANT (soldier_id_, training_id_)
values (27574, 5248);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27690, 1868);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27806, 646);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27806, 3467);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27864, 1764);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27922, 1309);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27980, 1062);
insert into PARTICIPANT (soldier_id_, training_id_)
values (27980, 3077);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28096, 2570);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28096, 5235);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28270, 2050);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28270, 3922);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28444, 5118);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28618, 2011);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28618, 3909);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28618, 4546);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28734, 100);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28734, 1881);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28792, 3909);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28908, 1205);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28908, 2063);
insert into PARTICIPANT (soldier_id_, training_id_)
values (28966, 3831);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29082, 4312);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29198, 2557);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29198, 3207);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29256, 945);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29314, 3714);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29430, 282);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29488, 997);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29488, 1686);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29546, 2115);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29546, 4182);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29546, 5222);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29662, 2115);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29778, 360);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29894, 1140);
insert into PARTICIPANT (soldier_id_, training_id_)
values (29894, 4468);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30010, 152);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30010, 581);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30010, 2037);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30010, 4260);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30068, 5131);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30126, 230);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30184, 1452);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30184, 1725);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30242, 2401);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30242, 3857);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30242, 5209);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30300, 152);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30358, 2674);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30358, 2726);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30416, 3610);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30416, 4195);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30474, 2687);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30532, 841);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30648, 2401);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30648, 5131);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30764, 1985);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30764, 3909);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30822, 529);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30822, 1530);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30880, 4507);
insert into PARTICIPANT (soldier_id_, training_id_)
values (30938, 2596);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31228, 2674);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31286, 672);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31286, 2453);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31402, 958);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31402, 3272);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31518, 1985);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31576, 1010);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31634, 4611);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31634, 4676);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31692, 1465);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31808, 880);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31808, 2349);
insert into PARTICIPANT (soldier_id_, training_id_)
values (31982, 2843);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32040, 347);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32040, 1010);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32098, 4364);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32272, 3766);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32272, 4260);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32388, 386);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32504, 2635);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32504, 2934);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32504, 3129);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32562, 4871);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32620, 2323);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32678, 1933);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32678, 2635);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32736, 3285);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32794, 698);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32852, 3337);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32910, 412);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32968, 2791);
insert into PARTICIPANT (soldier_id_, training_id_)
values (32968, 4286);
insert into PARTICIPANT (soldier_id_, training_id_)
values (33026, 1010);
insert into PARTICIPANT (soldier_id_, training_id_)
values (33026, 4780);
insert into PARTICIPANT (soldier_id_, training_id_)
values (33084, 1062);
insert into PARTICIPANT (soldier_id_, training_id_)
values (33084, 2583);
insert into PARTICIPANT (soldier_id_, training_id_)
values (33142, 3285);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for SOLDIERS...
alter table SOLDIERS enable constraint SYS_C007246;
alter table SOLDIERS enable constraint SYS_C007247;
alter table SOLDIERS enable constraint SYS_C007248;
prompt Enabling foreign key constraints for HAVE...
alter table HAVE enable constraint SYS_C007257;
alter table HAVE enable constraint SYS_C007258;
prompt Enabling foreign key constraints for PARTICIPANT...
alter table PARTICIPANT enable constraint SYS_C007252;
alter table PARTICIPANT enable constraint SYS_C007253;
prompt Enabling triggers for PROJECTS...
alter table PROJECTS enable all triggers;
prompt Enabling triggers for UNITS...
alter table UNITS enable all triggers;
prompt Enabling triggers for ROLES_...
alter table ROLES_ enable all triggers;
prompt Enabling triggers for SALARIES...
alter table SALARIES enable all triggers;
prompt Enabling triggers for SOLDIERS...
alter table SOLDIERS enable all triggers;
prompt Enabling triggers for HAVE...
alter table HAVE enable all triggers;
prompt Enabling triggers for TRAININGS_...
alter table TRAININGS_ enable all triggers;
prompt Enabling triggers for PARTICIPANT...
alter table PARTICIPANT enable all triggers;
set feedback on
set define on
prompt Done.
