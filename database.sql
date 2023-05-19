CREATE TABLE recaudacion (
    codRecaudacion SERIAL PRIMARY KEY NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	metodoPago VARCHAR(255) NOT NULL,
	importe INTEGER NOT NULL,
	dniResidente  INT,
    codAdministrador VARCHAR(255),          
    
     CONSTRAINT fk_administrador
      FOREIGN KEY(codAdministrador) 
	  REFERENCES administrador(codAdministrador),

     CONSTRAINT fk_residente
      FOREIGN KEY(dniResidente) 
	  REFERENCES residente(dniResidente)
);

CREATE TABLE administrador (
    codAdministrador VARCHAR(255) PRIMARY KEY NOT NULL,
    apellidosAdm VARCHAR(255) NOT NULL,
    nombreAdm VARCHAR(255) NOT NULL
);

CREATE TABLE residente (
    dniResidente INT PRIMARY KEY NOT NULL,
    apellidosRes VARCHAR(255) NOT NULL,
    nombreRes VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    celular VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO residente(dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (75688272,'Huaman Ramirez','Ana','Las Americas 210','987664889','anaHuaman@gmail.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (70104559, 'Gómez López', 'Juan', 'Calle Principal 123', '993564421', 'juangomez@hotmail.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (87654321, 'López García', 'María', 'Avenida Central 456', '993459879', 'marialopez@gmail.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (98765432, 'Pérez Lauterio', 'Pedro', 'Calle Secundaria 789', '994517891', 'pedroperez@outlook.es');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (76658912, 'Mendez Perez', 'Sara', 'Calle de la Rosa 789', '989101667', 'analorez@hotmail.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (73649113, 'García Cabrera', 'Carlos', 'Avenida del Sol 456', '986678102', 'carlosgarcia@outlook.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (75668910, 'Martínez Gonzales', 'Laura', 'Calle del Parque 321', '956511599', 'lauramartinez@outlook.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (79146750, 'Rodríguez Arias', 'Javier', 'Avenida Principal 987', '929112334', 'javierrodriguez@hotmail.com');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (86604372, 'Pilsa Ponce', 'Marci', 'Avenida Central 456', '996623312', 'marialopez@outlook.es');

INSERT INTO residente (dniResidente, apellidosRes, nombreRes, direccion, celular, email)
VALUES (78765421, 'Bartolo Domino', 'Nicolas', 'Calle Secundaria 789', '998676105', 'pedroperez@hotmail.com');

INSERT INTO administrador (codAdministrador, apellidosAdm, nombreAdm)
VALUES ('Ahuaman', 'Huaman', 'Allisson');

INSERT INTO administrador (codAdministrador, apellidosAdm, nombreAdm)
VALUES ('JTako', 'Tako', 'Jardel');

INSERT INTO administrador (codAdministrador, apellidosAdm, nombreAdm)
VALUES ('YAucca', 'Auccatoma', 'Yonatan');

INSERT INTO administrador (codAdministrador, apellidosAdm, nombreAdm)
VALUES ('MAnchah', 'Anchahua', 'Maricielo');