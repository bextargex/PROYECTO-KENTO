INSERT INTO usuarios VALUES('Administrador','$2a$10$XzeFGfr4JXvjdWV6yNMXAOcYS5HPsIoubWjffoaIjmxYM1YNOwQ8u',1);
INSERT INTO usuarios VALUES('User','$2a$10$PmZyOCXiXG/jGFh/D6xmc.KzGdLShGB3TaRyDBgFZ0ssrwKTEhox2',1);

SELECT * FROM usuarios;
SELECT * FROM roles;

INSERT INTO roles Values(1,'ROLE_ADMIN');
INSERT INTO roles Values(1,'ROLE_USER');
INSERT INTO roles Values(2,'ROLE_USER');