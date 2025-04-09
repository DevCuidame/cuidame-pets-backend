const db = require("../config/config");

const Qr = {};

Qr.getAgreements = () => {
  const sql = `
    select agreement 
    from codes 
    where license = 'Health' 
    AND agreement IS NOT NULL 
    GROUP BY agreement;
      `;

  return db.manyOrNone(sql);
};

Qr.getPetAgreements = () => {
  const sql = `
    SELECT agreement
FROM codes
WHERE license = 'Pets'
  AND agreement IS NOT NULL
GROUP BY agreement
ORDER BY CASE
    WHEN agreement = 'Free' THEN 1
    WHEN agreement = 'Basic' THEN 2
    WHEN agreement = 'Premium' THEN 3
END;

      `;

  return db.manyOrNone(sql);
};

Qr.addQrCode = (code, hashcode, license, agreement) => {
  const sql = `
        INSERT INTO
            codes(
                code,
                hashcode,
                license,
                agreement,
                created_at
            )
        VALUES($1, $2, $3, $4, $5) RETURNING id
    `;
  return db.oneOrNone(sql, [code, hashcode, license, agreement, new Date()]);
};

Qr.findPacientByCode = (code) => {
  const sql = `
        SELECT
            nombre,
            code
        FROM
            pacientes
        WHERE
            code=$1
    `;
  return db.oneOrNone(sql, code);
};

Qr.findMascotaByCode = (hashcode) => {
  const sql = `
        SELECT
            nombre,
            hashcode as "code"
        FROM
            mascotas
        WHERE
            hashcode=$1
    `;
  return db.oneOrNone(sql, hashcode);
};

Qr.findByCode = (code) => {
  const sql = `
        SELECT
            id,
            hashcode,
            name,
            lastname,
            phone,
            email,
            notificationID
        FROM
            users
        WHERE
            hashcode = $1
    `;

  return db.oneOrNone(sql, code);
};

Qr.getByCode = (code) => {
  const sql = `
        SELECT
            a_cargo_id as id,
            code as hashcode,
            nombre as name,
            apellido as lastname,
            telefono as phone 
        FROM
            pacientes
        WHERE
            code = $1
    `;

  return db.oneOrNone(sql, code);
};

Qr.findPetByCode = (code) => {
  const sql = `
    SELECT
    m.hashcode,
    m.nombre,
    users.id,
    users.name,
    users.lastname,
    users.phone,
    users.email,
    users.notificationID
FROM
    mascotas m
JOIN users ON m.id_usuario = users.id
WHERE 
m.hashcode = $1`;

  return db.oneOrNone(sql, code);
};

Qr.findContacts = (idUsuario) => {
  const sql = `
    SELECT
  nombre1,
  telefono1,
  nombre2,
  telefono2,
  nombre3,
  telefono3
        FROM
            public.contactos
        WHERE
        id_usuario = $1
    `;
  return db.oneOrNone(sql, idUsuario);
};

Qr.getContacts = (idUsuario) => {
  const sql = `
    SELECT
            telefono1,
            telefono2,
            telefono3
        FROM
            public.contactos
        WHERE
            a_cargo_id = $1
    `;
  return db.oneOrNone(sql, idUsuario);
};

Qr.findUserContact = (id) => {
  const sql = `
  SELECT
  nombre1,
  telefono1,
  nombre2,
  telefono2,
  nombre3,
  telefono3
FROM
  contactos
WHERE
  id_usuario = $1
    `;
  return db.oneOrNone(sql, id);
};

module.exports = Qr;
