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
const regimentTypeRouter = require("../cuidameDoc/healthInsurance/routes/regimentType.router");

//Role
const roleRouter = require("../cuidameDoc/role/routes/role.router");
const userRoleRouter = require("../cuidameDoc/role/routes/userRole.router");

const doctorRatingRouter = require("../cuidameDoc/doctor/routes/doctorRating.router");

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
  router.use("/regimenttype", regimentTypeRouter);

  //Role
  router.use("/role", roleRouter);
  router.use("/userrole", userRoleRouter);

}

module.exports = routerApi;
