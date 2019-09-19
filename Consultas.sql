--Top 10 aerolineas con mayor cantidad de empleados
SELECT *
FROM Aerolinea
ORDER BY CantEmpleados DESC
LIMIT 10;

--Top 10 aeropuertos con mas aerolineas   
SELECT COUNT(A.IdAeropuerto) AS TopAeropuerto, A.Nombre, A.Codigo
FROM Aeropuerto A
INNER JOIN AerolineaAeropuerto AA ON AA.IdAeropuerto == A.IdAeropuerto
GROUP BY AA.IdAerolinea
ORDER BY TopAeropuerto DESC
LIMIT 10;

--Toda la información de un empleado del aeropuerto con el sueldo más alto.
SELECT *
FROM EmpleadoAeropuerto
INNER JOIN PuestoEmpleadoAeropuerto PEA ON EmpleadoAeropuerto.IdEmpleadoAeropuerto = PEA.IdEmpleadoAeropuerto
INNER JOIN Puesto P ON PEA.IdPuesto = P.IdPuesto
ORDER BY P.Sueldo DESC
LIMIT 1;

--Toda la información de un empleado de la aerolínea con el sueldo más alto.
SELECT *
FROM EmpleadoAerolinea
INNER JOIN PuestoEmpleadoAerolinea PEA ON EmpleadoAerolinea.IdEmpleadoAerolinea = PEA.IdEmpleadoAerolinea
INNER JOIN Puesto P ON PEA.IdPuesto = P.IdPuesto
ORDER BY P.Sueldo DESC
LIMIT 1;

--Promedio de salario para los aeropuertos con mayor número de empleados.
SELECT AVG(P.Sueldo) AS SueldoPromedio, EmpleadoAeropuerto.IdAeropuerto
FROM EmpleadoAeropuerto
INNER JOIN PuestoEmpleadoAeropuerto PEA ON EmpleadoAeropuerto.IdEmpleadoAeropuerto = PEA.IdEmpleadoAeropuerto
INNER JOIN Puesto P ON PEA.IdPuesto = P.IdPuesto
GROUP BY EmpleadoAeropuerto.IdAeropuerto
ORDER BY SueldoPromedio DESC ;

--Cantidad de aviones en una aerolínea que están en estado de reparación.
SELECT COUNT(*) AS CantidadAviones, IdAerolinea
FROM Avion
WHERE Estado = 'Reparacion'
GROUP BY IdAerolinea;

--Costo de reparación, modelo, fabricante y el código de un avión para una aerolínea perteneciente a un aeropuerto específico.
SELECT F.Costo, A.Modelo, A.Fabricante, A.Codigo, Aerolinea.IdAerolinea, Aeropuerto.IdAeropuerto
FROM Factura F
INNER JOIN Avion A ON F.IdAvion = A.IdAvion
INNER JOIN Aerolinea ON A.IdAerolinea = Aerolinea.IdAerolinea
INNER JOIN AerolineaAeropuerto AA ON Aerolinea.IdAerolinea = AA.IdAerolinea
INNER JOIN Aeropuerto ON AA.IdAeropuerto = Aeropuerto.IdAeropuerto
ORDER BY Aeropuerto.IdAeropuerto, A.IdAerolinea, F.Costo;

--Cantidad de aviones activos en un aeropuerto.
SELECT COUNT(*) AS CantidadAviones, Aeropuerto.IdAeropuerto
FROM Avion
INNER JOIN Aerolinea A ON Avion.IdAerolinea = A.IdAerolinea
INNER JOIN AerolineaAeropuerto AA ON A.IdAerolinea = AA.IdAerolinea
INNER JOIN Aeropuerto ON AA.IdAeropuerto = Aeropuerto.IdAeropuerto
WHERE Avion.Estado == 'Activo'
GROUP BY Aeropuerto.IdAeropuerto;

--Promedio de costo de reparación de los aviones para un aeropuerto específico.
SELECT AVG(F.Costo) AS CostoPromedio, Aeropuerto.IdAeropuerto
FROM Factura F
INNER JOIN Avion A ON F.IdAvion = A.IdAvion
INNER JOIN Aerolinea ON A.IdAerolinea = Aerolinea.IdAerolinea
INNER JOIN AerolineaAeropuerto AA ON Aerolinea.IdAerolinea = AA.IdAerolinea
INNER JOIN Aeropuerto ON AA.IdAeropuerto = Aeropuerto.IdAeropuerto
GROUP BY Aeropuerto.IdAeropuerto;

--Cantidad de aviones inactivos dentro de una bodega.
SELECT COUNT(*) AS CantidadAviones, Aeropuerto.IdAeropuerto
FROM Avion
INNER JOIN Aerolinea A ON Avion.IdAerolinea = A.IdAerolinea
INNER JOIN AerolineaAeropuerto AA ON A.IdAerolinea = AA.IdAerolinea
INNER JOIN Aeropuerto ON AA.IdAeropuerto = Aeropuerto.IdAeropuerto
WHERE Avion.Estado = 'Inactivo'
GROUP BY Aeropuerto.IdAeropuerto;

--Nombre de los fabricantes con la mayor cantidad de modelos.
SELECT Fabricante, COUNT(Modelo) AS CantidadModelos
FROM Avion
GROUP BY Fabricante
ORDER BY CantidadModelos DESC;

--Cantidad de aerolíneas que contienen la letra “A” en el nombre.
--De este resultado además deben de mostrar cuáles tienen más vuelos activos.
SELECT COUNT(A.Nombre) AS CantAerolineas
FROM Aerolinea A
WHERE A.Nombre LIKE '%A%' OR A.Nombre LIKE '%a%'
ORDER BY CantAerolineas DESC;

SELECT COUNT(V.IdVuelo) AS CantidadVuelos, Aerolinea.IdAerolinea
FROM Vuelo V
INNER JOIN ControlAvion CA ON V.IdVuelo = CA.IdVuelo
INNER JOIN Avion ON CA.IdAvion = Avion.IdAvion
INNER JOIN Aerolinea ON Avion.IdAerolinea = Aerolinea.IdAerolinea
WHERE V.Estado = 'Activo'
GROUP BY Aerolinea.IdAerolinea
ORDER BY CantidadVuelos DESC;

--Intervalo de horas con la mayor llegada de aviones para un aeropuerto.
SELECT CA.HoraLlegada, Count(V.IdVuelo) AS CantidadVuelos, A.IdAeropuerto
FROM Controlador
INNER JOIN ControladorControlAvion CCA ON Controlador.IdControlador = CCA.IdControlador
INNER JOIN ControlAvion CA ON CCA.IdControlAvion = CA.IdControlAvion
INNER JOIN Vuelo V ON CA.IdVuelo = V.IdVuelo
INNER JOIN Aeropuerto A ON Controlador.IdAeropuerto = A.IdAeropuerto
GROUP BY CA.HoraLlegada, A.IdAeropuerto;