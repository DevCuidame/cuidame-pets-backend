const express = require("express");
const wompiRouter = require("./wompi/Wompi.router");
const providerRouter = require("./providers/provider.routes");
const serviceRouter = require("./providers/service.routes");
const documentRouter = require("./providers/document.routes");
const legalRepRouter = require("./providers/lega_rep.router");
const establishmentRouter = require("./providers/establishment.router");
const clinicsRouter = require("./veterinary_clinics/veterinary_clinics.routes");
const whatsappRouter = require("./whatsapp/whatsapp.routes");
const calendlyRoutes = require("../utils/calendly/calendly");
const appointmentRouter = require("../cuidameDoc/appointment/routes/apointment.router");
const doctorRouter = require("../cuidameDoc/doctor/routes/doctor.router");
const doctorServiceRouter = require("../cuidameDoc/doctor/routes/doctorService.router");

//HealthInsurance
const bondsRouter = require("../cuidameDoc/healthInsurance/routes/bonds.router");
const contractRouter = require("../cuidameDoc/healthInsurance/routes/contract.router");
const contractServicesRouter = require("../cuidameDoc/healthInsurance/routes/contractServices.router");
const moderatorFeeRouter = require("../cuidameDoc/healthInsurance/routes/moderatorFee.router");
const paymentBillRouter = require("../cuidameDoc/healthInsurance/routes/paymentBill.router");
const populationRouter = require("../cuidameDoc/healthInsurance/routes/population.router");
const regimentTypeRouter = require("../cuidameDoc/healthInsurance/routes/regimentType.router");

// Medical Consultation
const diagnosticRouter = require("../cuidameDoc/medicalConsultation/routes/diagnostic.router");
const familarRecordsRouter = require("../cuidameDoc/medicalConsultation/routes/familarRecords.router");
const gynecoObstetricsRouter = require("../cuidameDoc/medicalConsultation/routes/gynecoObstetrics.router");
const habitsRouter = require("../cuidameDoc/medicalConsultation/routes/habits.router");
const laboratoryRouter = require("../cuidameDoc/medicalConsultation/routes/laboratory.router");
const medicalConsultationRouter = require("../cuidameDoc/medicalConsultation/routes/medicalConsultation.router");
const otherSpecialtiesRouter = require("../cuidameDoc/medicalConsultation/routes/otherSpecialties.router");
const recordsRouter = require("../cuidameDoc/medicalConsultation/routes/records.router");
const vitalSignalsRouter = require("../cuidameDoc/medicalConsultation/routes/vitalSignals.router");

//Relative
const companyRouter = require("../cuidameDoc/relative/routes/company.router");
const emergencyContactRouter = require("../cuidameDoc/relative/routes/emergencyContact.router");
const healthInsuranceRouter = require("../cuidameDoc/relative/routes/healthInsurance.router");
const relativeRouter = require("../cuidameDoc/relative/routes/relative.router");
const sitesRouter = require("../cuidameDoc/relative/routes/sites.router");

//Role
const roleRouter = require("../cuidameDoc/role/routes/role.router");
const userRoleRouter = require("../cuidameDoc/role/routes/userRole.router");

const doctorRatingRouter = require("../cuidameDoc/doctor/routes/doctorRating.router");

const bloodPressureRoutes = require("../Cuidame/patient/routes/bloodPressure.routes");
const bloodGlucoseRoutes = require("../Cuidame/patient/routes/bloodGlucose.routes");
const bloodOxygenRoutes = require("../Cuidame/patient/routes/bloodOxygen.routes");
const respiratoryRateRoutes = require("../Cuidame/patient/routes/respiratoryRate.routes");
const heartRateRoutes = require("./../Cuidame/patient/routes/hearthRate.routes");

// Relative Routes
const allergyRoutes = require("../Cuidame/patient/routes/relative/allergy.routes")
const antecendentRoutes = require("../Cuidame/patient/routes/relative/antecedent.routes")
const conditionRoutes = require("../Cuidame/patient/routes/relative/condition.routes")
const medicamentRoutes = require("../Cuidame/patient/routes/relative/medicament.routes")
const diseaseRoutes = require("../Cuidame/patient/routes/relative/disease.routes")
const relativeRoutes = require("../Cuidame/patient/routes/relative/relative.routes")
const relativesAntecedentRoutes = require("../Cuidame/patient/routes/relative/relativesAntecedent.routes")
const vaccineRoutes = require("../Cuidame/patient/routes/relative/vaccine.routes")

function routerApi(app) {
  const router = express.Router();
  app.use("/api", router);
  router.use("/wompi", wompiRouter);
  router.use("/provider", providerRouter);
  router.use("/document", documentRouter);
  router.use("/service", serviceRouter);
  router.use("/clinics", clinicsRouter);
  router.use("/legalrep", legalRepRouter);
  router.use("/establishment", establishmentRouter);
  router.use("/auth", whatsappRouter);
  router.use("/calendly", calendlyRoutes);

  //appointments
  router.use("/appointments", appointmentRouter);

  //Doctor
  router.use("/doctor", doctorRouter);
  router.use("/doctorservice", doctorServiceRouter);
  router.use("/doctorRating", doctorRatingRouter);

  //HealthInsurance
  router.use("/bonds", bondsRouter);
  router.use("/contract", contractRouter);
  router.use("/contractservice", contractServicesRouter);
  router.use("/moderatorfee", moderatorFeeRouter);
  router.use("/paymentbill", paymentBillRouter);
  router.use("/population", populationRouter);
  router.use("/regimenttype", regimentTypeRouter);

  // Medical Consultation
  router.use("/diagnostic", diagnosticRouter);
  router.use("/familarrecords", familarRecordsRouter);
  router.use("/gynecoobstetrics", gynecoObstetricsRouter);
  router.use("/habits", habitsRouter);
  router.use("/laboratory", laboratoryRouter);
  router.use("/medicalconsultation", medicalConsultationRouter);
  router.use("/otherspecialties", otherSpecialtiesRouter);
  router.use("/records", recordsRouter);
  router.use("/vitalsignals", vitalSignalsRouter);

  //Relative
  router.use("/company", companyRouter);
  router.use("/emergencycontact", emergencyContactRouter);
  router.use("/healthinsurance", healthInsuranceRouter);
  router.use("/relative", relativeRouter);
  router.use("/sites", sitesRouter);

  //Role
  router.use("/role", roleRouter);
  router.use("/userrole", userRoleRouter);

  //Patient Metrics

  router.use("/blood-pressure", bloodPressureRoutes);
  router.use("/blood-glucose", bloodGlucoseRoutes);
  router.use("/blood-oxygen", bloodOxygenRoutes);
  router.use("/respiratory-rate", respiratoryRateRoutes);
  router.use("/heart-rate", heartRateRoutes);

  // Relative Routes
  router.use("/disease", diseaseRoutes);
  router.use("/condition", conditionRoutes);
  router.use("/allergy", allergyRoutes);
  router.use("/antecedent", antecendentRoutes);
  router.use("/medicament", medicamentRoutes);
  router.use("/relative-cuidame", relativeRoutes);
  router.use("/relative-antecedent", relativesAntecedentRoutes);
  router.use("/vaccine", vaccineRoutes);



}

module.exports = routerApi;
