CREATE TABLE Aerolinea(
    IdAerolinea INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Codigo TEXT NOT NULL,
    Nombre TEXT NOT NULL,
    CantEmpleados INTEGER NOT NULL
);

CREATE TABLE Aeropuerto(
    IdAeropuerto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    NumTelefono TEXT NOT NULL,
    Localizacion TEXT NOT NULL,
    Horario TEXT NOT NULL,
    Codigo TEXT NOT NULL
);

CREATE TABLE AerolineaAeropuerto(
    IdAerolinea INTEGER NOT NULL,
    IdAeropuerto INTEGER NOT NULL,
    FOREIGN KEY (IdAeropuerto) REFERENCES Aeropuerto(IdAeropuerto),
    FOREIGN KEY (IdAerolinea) REFERENCES  Aerolinea(IdAerolinea)
);

CREATE TABLE Vuelo(
    IdVuelo INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    NumVuelo TEXT NOT NULL,
    Destino TEXT NOT NULL,
    Origen TEXT NOT NULL,
    FechaSalida DATE NOT NULL,
    HoraSalida TIME NOT NULL,
    FechaLlegada DATE NOT NULL,
    HoraLlegada TIME NOT NULL,
    Precio INTEGER NOT NULL,
    Estado TEXT NOT NULL,
    IdAeropuerto INTEGER NOT NULL,
    FOREIGN KEY(IdAeropuerto) REFERENCES Aeropuerto(IdAeropuerto)
);

CREATE TABLE Avion(
    IdAvion INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdAerolinea INTEGER NOT NULL,
    Codigo TEXT NOT NULL,
    Modelo TEXT NOT NULL,
    CapTripulacion INTEGER NOT NULL,
    CapItinerario INTEGER NOT NULL,
    Fabricante TEXT NOT NULL,
    Estado TEXT NOT NULL,
    FOREIGN KEY(IdAerolinea) REFERENCES Aerolinea(IdAerolinea)
);

CREATE TABLE Factura(
    IdFactura INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Repuestos TEXT NOT NULL,
    Costo INTEGER NOT NULL,
    FechaLlegada DATE NOT NULL,
    HoraLlegada TIME NOT NULL,
    FechaSalida DATE NOT NULL,
    HoraSalida TIME NOT NULL,
    Danos TEXT NOT NULL,
    IdAvion INTEGER NOT NULL,
    FOREIGN KEY(IdAvion) REFERENCES Avion(IdAvion)
);

CREATE TABLE EmpleadoAerolinea(
    IdEmpleadoAerolinea INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Codigo TEXT NOT NULL,
    Nombre TEXT NOT NULL,
    Apellidos TEXT NOT NULL,
    Cedula TEXT NOT NULL,
    CuentaBanco TEXT NOT NULL,
    Horario TEXT NOT NULL,
    IdAerolinea INTEGER NOT NULL,
    FOREIGN KEY (IdAerolinea) REFERENCES Aerolinea(IdAerolinea)
);

CREATE TABLE EmpleadoAeropuerto(
    IdEmpleadoAeropuerto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Codigo TEXT NOT NULL,
    Nombre TEXT NOT NULL,
    Apellidos TEXT NOT NULL,
    Cedula TEXT NOT NULL,
    CuentaBanco TEXT NOT NULL,
    Direccion TEXT NOT NULL,
    IdAeropuerto INTEGER NOT NULL,
    FOREIGN KEY (IdAeropuerto) REFERENCES Aeropuerto(IdAeropuerto)
);

CREATE TABLE Puesto(
    IdPuesto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Sueldo INTEGER NOT NULL
);

CREATE TABLE PuestoEmpleadoAerolinea(
    IdPuesto INTEGER NOT NULL,
    IdEmpleadoAerolinea INTEGER NOT NULL,
    FOREIGN KEY (IdPuesto) REFERENCES Puesto(IdPuesto),
    FOREIGN KEY (IdEmpleadoAerolinea) REFERENCES  EmpleadoAerolinea(IdEmpleadoAerolinea)
);

CREATE TABLE PuestoEmpleadoAeropuerto(
    IdPuesto INTEGER NOT NULL,
    IdEmpleadoAeropuerto INTEGER NOT NULL,
    FOREIGN KEY (IdPuesto) REFERENCES Puesto(IdPuesto),
    FOREIGN KEY (IdEmpleadoAeropuerto) REFERENCES  EmpleadoAeropuerto(IdEmpleadoAeropuerto)
);

CREATE TABLE Pasajero(
    IdPasajero INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdVuelo INTEGER NOT NULL,
    NumVuelo TEXT NOT NULL,
    CantEquipaje INTEGER NOT NULL,
    CodPasajero TEXT NOT NULL,
    Nombre TEXT NOT NULL,
    Apellidos TEXT NOT NULL,
    InfoPasaporte TEXT NOT NULL,
    FOREIGN KEY (IdVuelo) REFERENCES Vuelo(IdVuelo)
);

CREATE TABLE NumTelefono(
    IdNumTelefono INTEGER PRIMARY KEY AUTOINCREMENT,
    Numero TEXT NOT NULL,
    IdPasajero INTEGER NOT NULL,
    FOREIGN KEY (IdPasajero) REFERENCES Pasajero(IdPasajero)
);

CREATE TABLE Equipaje(
    IdEquipaje INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CodPasajero TEXT NOT NULL,
    Peso TEXT NOT NULL,
    IdPasajero INTEGER NOT NULL,
    FOREIGN KEY (IdPasajero) REFERENCES Pasajero(IdPasajero)
);

CREATE TABLE Controlador(
    IdControlador INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdAeropuerto INTEGER NOT NULL,
    FOREIGN KEY (IdAeropuerto) REFERENCES Aeropuerto(IdAeropuerto)
);

CREATE TABLE ControlAvion(
    IdControlAvion INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdAvion INTEGER NOT NULL,
    IdVuelo INTEGER NOT NULL,
    CodigoAvion TEXT NOT NULL,
    CodigoComunicacion TEXT NOT NULL,
    Vuelo TEXT NOT NULL,
    HoraLlegada TIME NOT NULL,
    PosicionActual TEXT NOT NULL,
    FOREIGN KEY (IdAvion) REFERENCES Avion(IdAvion),
    FOREIGN KEY (IdVuelo) REFERENCES Vuelo(IdVuelo)
);

CREATE TABLE ControladorControlAvion(
    IdControlador INTEGER NOT NULL,
    IdControlAvion INTEGER NOT NULL,
    FOREIGN KEY (IdControlador) REFERENCES Controlador(IdControlador),
    FOREIGN KEY (IdControlAvion) REFERENCES ControlAvion(IdControlAvion)
);



