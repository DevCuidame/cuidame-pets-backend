const db = require("../../config/config");
const crypto = require("crypto");

const Authentication = {};

Authentication.hasAgreement = (code) => {
  const sql = `
  SELECT EXISTS (
    SELECT 1
    FROM codes
    WHERE code = $1 AND (agreement IS NOT NULL AND agreement != '')
  ) AS has_agreement,
agreement
FROM codes
WHERE code = $1;
    `;
  return db.oneOrNone(sql, code);
};

Authentication.getAuthPolicia = (numeroID, auth) => {
  const sql = `
    SELECT 
        * 
    FROM 
        dbpolicia
    WHERE
        cedula=$1 AND placa=$2  
    `;
  return db.oneOrNone(sql, [numeroID, auth]);
};

Authentication.getAuthBombero = (numeroID, auth) => {
  const sql = `
    SELECT 
        * 
    FROM 
        dbbomberos
    WHERE
        cedula=$1 AND registro_bomberos=$2
    `;
  return db.oneOrNone(sql, [numeroID, auth]);
};

Authentication.getAuthDefensaCivil = (numeroID, auth) => {
  const sql = `
    SELECT 
        * 
    FROM 
        dbdefensacivil
    WHERE
        cedula=$1 ADN registro_defensa_civil=$2
    `;
  return db.oneOrNone(sql, [numeroID, auth]);
};

Authentication.getAuthMedicina = (numeroID, auth) => {
  const sql = `
    SELECT 
        * 
    FROM 
        dbmedicina
    WHERE
        cedula=$1 AND registro_medico=$2
    `;
  return db.oneOrNone(sql, [numeroID, auth]);
};

Authentication.findByCode = (code) => {
  const sql = `
    SELECT 
        * 
    FROM 
        codes
    WHERE
        code=$1
    `;
  return db.oneOrNone(sql, code);
};

Authentication.findUserBand = (code) => {
  const sql = `
    SELECT 
        * 
    FROM 
        users
    WHERE
        code=$1
    `;
  return db.oneOrNone(sql, code);
};

Authentication.findPetBand = (code) => {
  const sql = `
    SELECT nombre
    FROM mascotas
    WHERE hashCode = 
    (SELECT hashCode FROM codes WHERE code = $1);
    `;
  return db.oneOrNone(sql, code);
};

Authentication.findPersonBand = (code) => {
  const sql = `
    SELECT nombre
    FROM pacientes
    WHERE code = 
    (SELECT hashcode FROM codes WHERE code = $1);
    `;
  return db.oneOrNone(sql, code);
};

Authentication.insertMed = (nombres, numeroID) => {
  const sql = `
    INSERT INTO
        ingreso_salud(
            nombres,
            numeroID,
            hora_ingreso
        )
    VALUES($1, $2, $3) RETURNING id
    `;
  return db.oneOrNone(sql, [nombres, numeroID, new Date()]);
};

module.exports = Authentication;
