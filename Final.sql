/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     21/02/2021 2:01:23 p. m.                     */
/*==============================================================*/


alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__RELATIONS_FACTURA_;

alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__RELATIONS_PRODUCTO;

alter table DEUDA
   drop constraint FK_DEUDA_RELATIONS_CLIENTE;

alter table DEUDA
   drop constraint FK_DEUDA_RELATIONS_FACTURA_;

alter table FACTURA_VENTA
   drop constraint FK_FACTURA__RELATIONS_CLIENTE;

alter table HISTORICO_PRODUCTO
   drop constraint FK_HISTORIC_RELATIONS_PRODUCTO;

drop table CLIENTE cascade constraints;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_3_FK;

drop table DETALLE_FACTURA cascade constraints;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_1_FK;

drop table DEUDA cascade constraints;

drop index RELATIONSHIP_2_FK;

drop table FACTURA_VENTA cascade constraints;

drop index RELATIONSHIP_5_FK;

drop table HISTORICO_PRODUCTO cascade constraints;

drop table PRODUCTO cascade constraints;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CEDULA               VARCHAR2(10)         not null,
   NOMBRE               VARCHAR2(40)         not null,
   APELLIDO             VARCHAR2(40)         not null,
   CELULAR              VARCHAR2(12)         not null,
   DIRECCION            VARCHAR2(50)         not null,
   constraint PK_CLIENTE primary key (CEDULA)
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA 
(
   NO_FACTURA           NUMBER(5,0)          not null,
   ITEM                 NUMBER(3,0)          not null,
   COD_PRODUCTO         VARCHAR2(4)          not null,
   PRECIO_VENTA         NUMBER(5,0)          not null,
   CANTIDAD             NUMBER(3,0)          not null,
   TOTAL_ITEM           NUMBER(5,0)          not null,
   constraint PK_DETALLE_FACTURA primary key (NO_FACTURA, ITEM)
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on DETALLE_FACTURA (
   NO_FACTURA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on DETALLE_FACTURA (
   COD_PRODUCTO ASC
);

/*==============================================================*/
/* Table: DEUDA                                                 */
/*==============================================================*/
create table DEUDA 
(
   CONSEC               NUMBER(5)            not null,
   NO_FACTURA           NUMBER(5,0),
   CEDULA               VARCHAR2(10)         not null,
   FECHA                DATE                 not null,
   FIADO                NUMBER(5),
   ABONO                NUMBER(5),
   SALDO                NUMBER(5)            not null,
   constraint PK_DEUDA primary key (CONSEC)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on DEUDA (
   CEDULA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on DEUDA (
   NO_FACTURA ASC
);

/*==============================================================*/
/* Table: FACTURA_VENTA                                         */
/*==============================================================*/
create table FACTURA_VENTA 
(
   NO_FACTURA           NUMBER(5,0)          not null,
   CEDULA               VARCHAR2(10)         not null,
   FECHA_FACTURA        DATE                 not null,
   TOTAL_FACTURA        NUMBER(5)            not null,
   ABONO                NUMBER(5),
   constraint PK_FACTURA_VENTA primary key (NO_FACTURA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on FACTURA_VENTA (
   CEDULA ASC
);

/*==============================================================*/
/* Table: HISTORICO_PRODUCTO                                    */
/*==============================================================*/
create table HISTORICO_PRODUCTO 
(
   COD_PRODUCTO         VARCHAR2(4)          not null,
   ID_PRECIO            NUMBER(3)            not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_FIN            DATE,
   PRECIO               NUMBER(5)            not null,
   constraint PK_HISTORICO_PRODUCTO primary key (COD_PRODUCTO, ID_PRECIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on HISTORICO_PRODUCTO (
   COD_PRODUCTO ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   COD_PRODUCTO         VARCHAR2(4)          not null,
   NOM_PRODUCTO         VARCHAR2(30)         not null,
   constraint PK_PRODUCTO primary key (COD_PRODUCTO)
);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_FACTURA_ foreign key (NO_FACTURA)
      references FACTURA_VENTA (NO_FACTURA);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_PRODUCTO foreign key (COD_PRODUCTO)
      references PRODUCTO (COD_PRODUCTO);

alter table DEUDA
   add constraint FK_DEUDA_RELATIONS_CLIENTE foreign key (CEDULA)
      references CLIENTE (CEDULA);

alter table DEUDA
   add constraint FK_DEUDA_RELATIONS_FACTURA_ foreign key (NO_FACTURA)
      references FACTURA_VENTA (NO_FACTURA);

alter table FACTURA_VENTA
   add constraint FK_FACTURA__RELATIONS_CLIENTE foreign key (CEDULA)
      references CLIENTE (CEDULA);

alter table HISTORICO_PRODUCTO
   add constraint FK_HISTORIC_RELATIONS_PRODUCTO foreign key (COD_PRODUCTO)
      references PRODUCTO (COD_PRODUCTO);

