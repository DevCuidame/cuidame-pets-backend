const pool = require("../../../utils/connection");
const PaymentBill = require("../model/paymentBill.model");

exports.createPaymentBill = async (health_insurance_id, relative_id, doctor_service_id) => {
  const query = 'INSERT INTO paymentbill (health_insurance_id, relative_id, doctor_service_id) VALUES ($1, $2, $3) RETURNING *';
  const values = [health_insurance_id, relative_id, doctor_service_id];
  const result = await pool.query(query, values);
  const { id } = result.rows[0];
  return new PaymentBill(id, health_insurance_id, relative_id, doctor_service_id);
};

exports.getPaymentBill = async (id) => {
  const query = 'SELECT * FROM paymentbill WHERE id = $1';
  const result = await pool.query(query, [id]);
  if (!result.rows.length) {
    return null;  
  }
  const { health_insurance_id, relative_id, doctor_service_id } = result.rows[0];
  return new PaymentBill(id, health_insurance_id, relative_id, doctor_service_id);
};

exports.getAllPaymentBills = async () => {
  const query = 'SELECT * FROM paymentbill';
  const result = await pool.query(query);
  if (!result.rows.length) {
    return null;  
  }
  return result.rows.map(row => {
    const { id, health_insurance_id, relative_id, doctor_service_id } = row;
    return new PaymentBill(id, health_insurance_id, relative_id, doctor_service_id);
  });
};

exports.updatePaymentBill = async (id, health_insurance_id, relative_id, doctor_service_id) => {
  const query = 'UPDATE paymentbill SET health_insurance_id = $1, relative_id = $2, doctor_service_id = $3 WHERE id = $4 RETURNING *';
  const values = [health_insurance_id, relative_id, doctor_service_id, id];
  const result = await pool.query(query, values);
  return new PaymentBill(id, health_insurance_id, relative_id, doctor_service_id);
};

exports.deletePaymentBill = async (id) => {
  const query = 'DELETE FROM paymentbill WHERE id = $1';
  await pool.query(query, [id]);
};
