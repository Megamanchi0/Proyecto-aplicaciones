CREATE DATABASE DBTallerCarros;
GO
USE DBTallerCarros;
GO
CREATE TABLE Tipo_Vehiculo (
id_tipo_vehiculo int primary key identity(1,1) not null,
nombre varchar(50) not null
)

GO

CREATE TABLE Cliente (
documento int primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
telefono varchar(15) not null
)

GO

CREATE TABLE Cargo (
id_cargo int primary key identity(1,1) not null,
nombre varchar(80) not null,
descripcion varchar(200) not null
)

GO

CREATE TABLE Vehiculo (
id_vehiculo varchar(10) primary key not null,
id_tipo_vehiculo int not null,
documento_cliente int not null,
modelo varchar(80) not null

CONSTRAINT FK_VEHICULO_TIPO_VEHICULO FOREIGN KEY (id_tipo_vehiculo) REFERENCES Tipo_vehiculo(id_tipo_vehiculo),
CONSTRAINT FK_VEHICULO_CLIENTE FOREIGN KEY (documento_cliente) REFERENCES Cliente(documento)
)

GO

CREATE TABLE Empleado (
documento int primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
telefono varchar(15),
id_cargo int not null,
fecha_contratacion date not null

CONSTRAINT FK_EMPLEADO_CARGO FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo)
)

GO

CREATE TABLE Tipo_producto (
id_tipo_producto int primary key identity(1,1) not null,
nombre varchar(50) not null,
)

GO

CREATE TABLE Producto (
id_producto int primary key identity(1,1) not null,
nombre varchar(50) not null,
id_tipo_producto int not null,
descripcion varchar not null,
precio money not null

CONSTRAINT FK_PRODUCTO_TIPO_PRODUCTO FOREIGN KEY (id_tipo_producto) REFERENCES Tipo_producto(id_tipo_producto)
)

GO

CREATE TABLE Proveedor (
id_proveedor int primary key not null,
nombre varchar(50) not null,
telefono varchar(15) not null,
)

GO

CREATE TABLE Tipo_reparacion (
id_tipo_reparacion int primary key identity(1,1) not null,
nombre varchar(50) not null,
)

GO

CREATE TABLE Reparacion (
id_reparacion int primary key identity(1,1) not null,
id_tipo_reparacion int not null,
descripcion varchar(50) not null,
fecha_reparacion date not null,
costo_reparacion money not null,
id_vehiculo varchar(10) not null

CONSTRAINT FK_REPARACION_VEHICULO FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
CONSTRAINT FK_REPARACION_TIPO_REPARACION FOREIGN KEY (id_tipo_reparacion) REFERENCES Tipo_reparacion(id_tipo_reparacion)
)

GO

CREATE TABLE Servicio_adicional (
id_servicio_adicional int primary key identity(1,1) not null,
nombre varchar(50) not null,
descripcion varchar(200) not null,
precio money not null,
documento_empleado int not null

CONSTRAINT FK_SERVICIO_EMPLEADO FOREIGN KEY (documento_empleado) REFERENCES Empleado(documento)
)

GO

CREATE TABLE detalle_producto_proveedor (
id_proveedor int not null,
id_producto int not null

CONSTRAINT FK_DETALLE_PP_PROVEEDOR FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor),
CONSTRAINT FK_DETALLE_PP_PRODUCTO FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
)

GO

CREATE TABLE detalle_empleado_reparacion (
documento_empleado int not null,
id_reparacion int not null

CONSTRAINT FK_DETALLE_ER_EMPLEADO FOREIGN KEY (documento_empleado) REFERENCES Empleado(documento),
CONSTRAINT FK_DETALLE_PP_REPARACION FOREIGN KEY (id_reparacion) REFERENCES Reparacion(id_reparacion)
)

GO

CREATE TABLE Factura (
id_factura int primary key identity(1,1) not null,
documento_cliente int not null,
total money not null,
fecha date not null

CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY (documento_cliente) REFERENCES Cliente(documento)
)

GO

CREATE TABLE detalle_factura_producto (
id_factura int not null,
id_producto int not null,
cantidad int not null

CONSTRAINT FK_DETALLE_FACTURA_PRODUCTO FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
CONSTRAINT FK_DETALLE_PRODUCTO FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
)

GO

CREATE TABLE detalle_factura_servicio (
id_factura int not null,
id_servicio int not null,

CONSTRAINT FK_DETALLE_FACTURA_SERVICIO FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
CONSTRAINT FK_DETALLE_SERVICIO FOREIGN KEY (id_servicio) REFERENCES Servicio_adicional(id_servicio_adicional),
)

CREATE TABLE detalle_factura_reparacion (
id_factura int not null,
id_reaparacion int not null

CONSTRAINT FK_DETALLE_FACTURA_REPARACION FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
CONSTRAINT FK_DETALLE_REPARACION FOREIGN KEY (id_reaparacion) REFERENCES Reparacion(id_reparacion),
)
