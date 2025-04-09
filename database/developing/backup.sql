

CREATE TABLE IF NOT EXISTS public.alergias
(
    id bigint NOT NULL DEFAULT nextval('alergias_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    tipo_alergia character varying(100) COLLATE pg_catalog."default",
    descripcion character varying(1000) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT alergias_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.antecedentes
(
    id bigint NOT NULL DEFAULT nextval('antecedentes_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    tipo_antecedente character varying(50) COLLATE pg_catalog."default",
    descripcion_antecedente character varying(1000) COLLATE pg_catalog."default",
    fecha_antecedente date,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT antecedentes_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.appointmentbreakdown
(
    id integer NOT NULL DEFAULT nextval('appointmentbreakdown_id_seq'::regclass),
    user_id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_id integer NOT NULL,
    CONSTRAINT appointmentbreakdown_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.appointments
(
    id bigint NOT NULL DEFAULT nextval('appointments_id_seq'::regclass),
    user_id bigint NOT NULL,
    doctor_id bigint NOT NULL,
    calendly_event_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status character varying(50) COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT appointments_pkey PRIMARY KEY (id),
    CONSTRAINT appointments_calendly_event_id_key UNIQUE (calendly_event_id)
);

CREATE TABLE IF NOT EXISTS public.atecedentes_familiares
(
    id bigint NOT NULL DEFAULT nextval('atecedentes_familiares_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    tipo_antecedente character varying(50) COLLATE pg_catalog."default",
    parentesco character varying(100) COLLATE pg_catalog."default",
    descripcion_antecedente character varying(1000) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT atecedentes_familiares_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.bathroomhairdresser
(
    id bigint NOT NULL DEFAULT nextval('bathroomhairdresser_id_seq'::regclass),
    fullname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idtype character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idnumber character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_veterinarian character varying(20) COLLATE pg_catalog."default",
    occupation character varying(20) COLLATE pg_catalog."default",
    phone character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city_id bigint NOT NULL,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    calendy character varying(100) COLLATE pg_catalog."default" NOT NULL,
    price character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT bathroomhairdresser_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.blood_glucose
(
    id integer NOT NULL DEFAULT nextval('blood_glucose_id_seq'::regclass),
    patient_id integer NOT NULL,
    rate integer NOT NULL,
    date timestamp without time zone NOT NULL,
    CONSTRAINT blood_glucose_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.blood_oxygen
(
    id integer NOT NULL DEFAULT nextval('blood_oxygen_id_seq'::regclass),
    patient_id integer NOT NULL,
    rate integer NOT NULL,
    date timestamp without time zone NOT NULL,
    CONSTRAINT blood_oxygen_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.blood_pressure
(
    id integer NOT NULL DEFAULT nextval('blood_pressure_id_seq'::regclass),
    patient_id integer NOT NULL,
    systolic integer NOT NULL,
    diastolic integer NOT NULL,
    date timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT blood_pressure_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.bonds
(
    id integer NOT NULL DEFAULT nextval('bonds_id_seq'::regclass),
    health_insurance_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    price numeric(10, 2) NOT NULL,
    CONSTRAINT bonds_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.clinics_services
(
    id integer NOT NULL DEFAULT nextval('clinics_services_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT clinics_services_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.clinics_services_breakdown
(
    id integer NOT NULL DEFAULT nextval('clinics_services_breakdown_id_seq'::regclass),
    clinic_service_id integer,
    veterinary_clinic_id integer,
    status boolean NOT NULL,
    CONSTRAINT clinics_services_breakdown_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.codes
(
    id bigint NOT NULL DEFAULT nextval('codes_id_seq'::regclass),
    code character varying(100) COLLATE pg_catalog."default" NOT NULL,
    hashcode character varying(100) COLLATE pg_catalog."default" NOT NULL,
    license character varying(50) COLLATE pg_catalog."default" NOT NULL,
    agreement character varying(50) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    status character varying(20) COLLATE pg_catalog."default" DEFAULT 'inactive'::character varying,
    CONSTRAINT codes_pkey PRIMARY KEY (id),
    CONSTRAINT codes_code_key UNIQUE (code),
    CONSTRAINT codes_hashcode_key UNIQUE (hashcode)
);

CREATE TABLE IF NOT EXISTS public.company
(
    id integer NOT NULL DEFAULT nextval('company_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    address text COLLATE pg_catalog."default" NOT NULL,
    nit character varying(20) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    contact character varying(50) COLLATE pg_catalog."default" NOT NULL,
    city_id integer NOT NULL,
    CONSTRAINT company_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.condicion
(
    id bigint NOT NULL DEFAULT nextval('condicion_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    discapacidad character varying(100) COLLATE pg_catalog."default",
    embarazada character varying(10) COLLATE pg_catalog."default",
    cicatrices_descripcion character varying(1000) COLLATE pg_catalog."default",
    tatuajes_descripcion character varying(1000) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT condicion_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.contactos
(
    id bigint NOT NULL DEFAULT nextval('contactos_id_seq'::regclass),
    id_usuario bigint NOT NULL,
    nombre1 character varying(100) COLLATE pg_catalog."default",
    telefono1 character varying(50) COLLATE pg_catalog."default",
    nombre2 character varying(100) COLLATE pg_catalog."default",
    telefono2 character varying(50) COLLATE pg_catalog."default",
    nombre3 character varying(100) COLLATE pg_catalog."default",
    telefono3 character varying(50) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT contactos_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.contract
(
    id integer NOT NULL DEFAULT nextval('contract_id_seq'::regclass),
    health_insurance_id integer NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT contract_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.contractservices
(
    id integer NOT NULL DEFAULT nextval('contractservices_id_seq'::regclass),
    contract_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    price numeric(10, 2) NOT NULL,
    CONSTRAINT contractservices_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.dbbomberos
(
    id bigint NOT NULL DEFAULT nextval('dbbomberos_id_seq'::regclass),
    nombres character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellidos character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cedula character varying(100) COLLATE pg_catalog."default" NOT NULL,
    registro_bomberos character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dbbomberos_pkey PRIMARY KEY (id),
    CONSTRAINT dbbomberos_apellidos_key UNIQUE (apellidos),
    CONSTRAINT dbbomberos_cedula_key UNIQUE (cedula),
    CONSTRAINT dbbomberos_nombres_key UNIQUE (nombres),
    CONSTRAINT dbbomberos_registro_bomberos_key UNIQUE (registro_bomberos)
);

CREATE TABLE IF NOT EXISTS public.dbdefensacivil
(
    id bigint NOT NULL DEFAULT nextval('dbdefensacivil_id_seq'::regclass),
    nombres character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellidos character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cedula character varying(100) COLLATE pg_catalog."default" NOT NULL,
    registro_defensa_civil character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dbdefensacivil_pkey PRIMARY KEY (id),
    CONSTRAINT dbdefensacivil_apellidos_key UNIQUE (apellidos),
    CONSTRAINT dbdefensacivil_cedula_key UNIQUE (cedula),
    CONSTRAINT dbdefensacivil_nombres_key UNIQUE (nombres),
    CONSTRAINT dbdefensacivil_registro_defensa_civil_key UNIQUE (registro_defensa_civil)
);

CREATE TABLE IF NOT EXISTS public.dbmedicina
(
    id bigint NOT NULL DEFAULT nextval('dbmedicina_id_seq'::regclass),
    nombres character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellidos character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cedula character varying(100) COLLATE pg_catalog."default" NOT NULL,
    registro_medico character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dbmedicina_pkey PRIMARY KEY (id),
    CONSTRAINT dbmedicina_apellidos_key UNIQUE (apellidos),
    CONSTRAINT dbmedicina_cedula_key UNIQUE (cedula),
    CONSTRAINT dbmedicina_nombres_key UNIQUE (nombres),
    CONSTRAINT dbmedicina_registro_medico_key UNIQUE (registro_medico)
);

CREATE TABLE IF NOT EXISTS public.dbpolicia
(
    id bigint NOT NULL DEFAULT nextval('dbpolicia_id_seq'::regclass),
    nombres character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellidos character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cedula character varying(100) COLLATE pg_catalog."default" NOT NULL,
    placa character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dbpolicia_pkey PRIMARY KEY (id),
    CONSTRAINT dbpolicia_apellidos_key UNIQUE (apellidos),
    CONSTRAINT dbpolicia_cedula_key UNIQUE (cedula),
    CONSTRAINT dbpolicia_nombres_key UNIQUE (nombres),
    CONSTRAINT dbpolicia_placa_key UNIQUE (placa)
);

CREATE TABLE IF NOT EXISTS public.departments
(
    id bigint NOT NULL DEFAULT nextval('departments_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    code integer NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.diagnostic
(
    id integer NOT NULL DEFAULT nextval('diagnostic_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    diagnostic text COLLATE pg_catalog."default" NOT NULL,
    epicrisis text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT diagnostic_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.doctor
(
    id integer NOT NULL DEFAULT nextval('doctor_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identification_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identification_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    city_id integer NOT NULL,
    address text COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    medical_record text COLLATE pg_catalog."default" NOT NULL,
    medical_specialist text COLLATE pg_catalog."default" NOT NULL,
    landline_phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    note text COLLATE pg_catalog."default" NOT NULL,
    rating integer NOT NULL,
    pub_name character varying COLLATE pg_catalog."default",
    priv_name character varying COLLATE pg_catalog."default",
    file_bs64 text COLLATE pg_catalog."default",
    icon_bs64 text COLLATE pg_catalog."default",
    CONSTRAINT doctor_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.doctorrelative
(
    id integer NOT NULL DEFAULT nextval('doctorrelative_id_seq'::regclass),
    doctor_id integer NOT NULL,
    relative_id integer NOT NULL,
    service_id integer NOT NULL,
    CONSTRAINT doctorrelative_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.doctorservice
(
    id integer NOT NULL DEFAULT nextval('doctorservice_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    visit_price numeric(10, 2) NOT NULL,
    doctor_id integer NOT NULL,
    discount numeric(5, 2) NOT NULL,
    CONSTRAINT doctorservice_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.documents
(
    id integer NOT NULL DEFAULT nextval('documents_id_seq'::regclass),
    provider_id integer NOT NULL,
    pub_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    priv_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    file_bs64 text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT documents_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.emergencycontact
(
    id integer NOT NULL DEFAULT nextval('emergencycontact_id_seq'::regclass),
    relative_id integer NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT emergencycontact_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.enfermedades
(
    id bigint NOT NULL DEFAULT nextval('enfermedades_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    enfermedad character varying(200) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT enfermedades_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.establishment
(
    id integer NOT NULL DEFAULT nextval('establishment_id_seq'::regclass),
    provider_id integer NOT NULL,
    own boolean NOT NULL,
    full_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT establishment_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.familiarrecords
(
    id integer NOT NULL DEFAULT nextval('familiarrecords_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    relative text COLLATE pg_catalog."default" NOT NULL,
    diagnostic text COLLATE pg_catalog."default" NOT NULL,
    records text COLLATE pg_catalog."default" NOT NULL,
    hemorrhagic boolean NOT NULL,
    thrombotic boolean NOT NULL,
    oncological boolean NOT NULL,
    CONSTRAINT familiarrecords_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.gynecoobstetrics
(
    id integer NOT NULL DEFAULT nextval('gynecoobstetrics_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    births integer NOT NULL,
    abortions integer NOT NULL,
    cesarean integer NOT NULL,
    gestations integer NOT NULL,
    menstrual_cycles character varying(50) COLLATE pg_catalog."default" NOT NULL,
    family_planning character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT gynecoobstetrics_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.habits
(
    id integer NOT NULL DEFAULT nextval('habits_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    smoke boolean NOT NULL,
    liquor boolean NOT NULL,
    other text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT habits_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.healthinsurance
(
    id integer NOT NULL DEFAULT nextval('healthinsurance_id_seq'::regclass),
    company character varying(50) COLLATE pg_catalog."default" NOT NULL,
    address1 text COLLATE pg_catalog."default" NOT NULL,
    address2 text COLLATE pg_catalog."default" NOT NULL,
    city character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT healthinsurance_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.heart_rate
(
    id integer NOT NULL DEFAULT nextval('heart_rate_id_seq'::regclass),
    patient_id integer NOT NULL,
    rate integer NOT NULL,
    date timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT heart_rate_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.hotelnursery
(
    id bigint NOT NULL DEFAULT nextval('hotelnursery_id_seq'::regclass),
    fullname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idtype character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idnumber character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_veterinarian character varying(20) COLLATE pg_catalog."default",
    occupation character varying(20) COLLATE pg_catalog."default",
    phone character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city_id bigint NOT NULL,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    calendy character varying(100) COLLATE pg_catalog."default" NOT NULL,
    price character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT hotelnursery_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.ingreso_salud
(
    id bigint NOT NULL DEFAULT nextval('ingreso_salud_id_seq'::regclass),
    nombres character varying(80) COLLATE pg_catalog."default" NOT NULL,
    numeroid character varying(80) COLLATE pg_catalog."default" NOT NULL,
    hora_ingreso timestamp(0) without time zone NOT NULL,
    CONSTRAINT ingreso_salud_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.laboratory
(
    id integer NOT NULL DEFAULT nextval('laboratory_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    exam_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    exam character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    result text COLLATE pg_catalog."default" NOT NULL,
    pathology_report bytea NOT NULL,
    CONSTRAINT laboratory_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.legal_representative
(
    id integer NOT NULL DEFAULT nextval('legal_representative_id_seq'::regclass),
    provider_id integer NOT NULL,
    identification_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    identification_number character varying(255) COLLATE pg_catalog."default" NOT NULL,
    full_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT legal_representative_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.license
(
    id bigint NOT NULL DEFAULT nextval('license_id_seq'::regclass),
    code character varying(100) COLLATE pg_catalog."default" NOT NULL,
    agreement character varying(50) COLLATE pg_catalog."default" NOT NULL,
    discount numeric(10, 0) NOT NULL,
    price integer NOT NULL,
    total numeric(100, 0) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT license_pkey PRIMARY KEY (id),
    CONSTRAINT license_agreement_key UNIQUE (agreement),
    CONSTRAINT license_code_key UNIQUE (code),
    CONSTRAINT license_discount_key UNIQUE (discount),
    CONSTRAINT license_price_key UNIQUE (price),
    CONSTRAINT license_total_key UNIQUE (total)
);

CREATE TABLE IF NOT EXISTS public.mascotas
(
    id bigint NOT NULL DEFAULT nextval('mascotas_id_seq'::regclass),
    id_usuario bigint NOT NULL,
    hashcode character varying(80) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default" NOT NULL,
    especie character varying(50) COLLATE pg_catalog."default" NOT NULL,
    raza character varying(50) COLLATE pg_catalog."default" NOT NULL,
    peso character varying(50) COLLATE pg_catalog."default" NOT NULL,
    sexo character varying(50) COLLATE pg_catalog."default" NOT NULL,
    color character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fechanacimiento date NOT NULL,
    descripcion character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    seguro character varying(100) COLLATE pg_catalog."default" NOT NULL,
    estatura character varying(50) COLLATE pg_catalog."default" NOT NULL,
    temperamento character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nochip character varying(100) COLLATE pg_catalog."default",
    photourl character varying(100) COLLATE pg_catalog."default",
    photoname character varying(500) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone,
    petid character varying(50) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    castrated boolean,
    CONSTRAINT mascotas_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.medicalconsultation
(
    id integer NOT NULL DEFAULT nextval('medicalconsultation_id_seq'::regclass),
    relative_id integer NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    city_id integer NOT NULL,
    date date NOT NULL,
    reason text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT medicalconsultation_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.medicamentos
(
    id bigint NOT NULL DEFAULT nextval('medicamentos_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    medicamento character varying(100) COLLATE pg_catalog."default",
    laboratorio character varying(100) COLLATE pg_catalog."default",
    formula character varying(255) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT medicamentos_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.moderatorfee
(
    id integer NOT NULL DEFAULT nextval('moderatorfee_id_seq'::regclass),
    health_insurance_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    price integer NOT NULL,
    income_range character varying(50) COLLATE pg_catalog."default" NOT NULL,
    category character varying(50) COLLATE pg_catalog."default" NOT NULL,
    copayment numeric(10, 2) NOT NULL,
    CONSTRAINT moderatorfee_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.other_specialties
(
    id integer NOT NULL DEFAULT nextval('other_specialties_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    concept character varying(500) COLLATE pg_catalog."default" NOT NULL,
    result text COLLATE pg_catalog."default" NOT NULL,
    pathology_report bytea NOT NULL,
    CONSTRAINT other_specialties_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.pacientes
(
    id bigint NOT NULL DEFAULT nextval('pacientes_id_seq'::regclass),
    code character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(255) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(255) COLLATE pg_catalog."default" NOT NULL,
    tipoid character varying(80) COLLATE pg_catalog."default" NOT NULL,
    numeroid character varying(80) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(30) COLLATE pg_catalog."default" NOT NULL,
    fecha_nacimiento date,
    genero character varying(30) COLLATE pg_catalog."default" NOT NULL,
    ciudad character varying(50) COLLATE pg_catalog."default" NOT NULL,
    departamento character varying(50) COLLATE pg_catalog."default" NOT NULL,
    direccion character varying(255) COLLATE pg_catalog."default" NOT NULL,
    rh character varying(35) COLLATE pg_catalog."default" NOT NULL,
    eps character varying(50) COLLATE pg_catalog."default",
    prepagada character varying(50) COLLATE pg_catalog."default",
    arl character varying(50) COLLATE pg_catalog."default",
    seguro_funerario character varying(50) COLLATE pg_catalog."default",
    a_cargo_id bigint NOT NULL,
    image character varying(255) COLLATE pg_catalog."default",
    enterprise character varying(255) COLLATE pg_catalog."default",
    nit character varying(255) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    photourl character varying(255) COLLATE pg_catalog."default",
    imagebs64 text COLLATE pg_catalog."default",
    CONSTRAINT pacientes_pkey PRIMARY KEY (id),
    CONSTRAINT pacientes_code_key UNIQUE (code)
);

CREATE TABLE IF NOT EXISTS public.paymentbill
(
    id integer NOT NULL DEFAULT nextval('paymentbill_id_seq'::regclass),
    health_insurance_id integer NOT NULL,
    relative_id integer NOT NULL,
    doctor_service_id integer NOT NULL,
    CONSTRAINT paymentbill_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.personal_salud
(
    id bigint NOT NULL DEFAULT nextval('personal_salud_id_seq'::regclass),
    tipoid character varying(80) COLLATE pg_catalog."default" NOT NULL,
    numeroid character varying(80) COLLATE pg_catalog."default" NOT NULL,
    primer_nombre character varying(255) COLLATE pg_catalog."default" NOT NULL,
    primer_apellido character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT personal_salud_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.pertenencias
(
    id bigint NOT NULL DEFAULT nextval('pertenencias_id_seq'::regclass),
    id_user bigint NOT NULL,
    hashcode character varying(80) COLLATE pg_catalog."default" NOT NULL,
    objeto character varying(50) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(1000) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone,
    CONSTRAINT pertenencias_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.petsdiseasecondition
(
    id bigint NOT NULL DEFAULT nextval('petsdiseasecondition_id_seq'::regclass),
    pet_id bigint NOT NULL,
    typediseasecondition character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    diagnosticdate date NOT NULL,
    status character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT petsdiseasecondition_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.petstreatment
(
    id bigint NOT NULL DEFAULT nextval('petstreatment_id_seq'::regclass),
    pet_id bigint NOT NULL,
    typetreatment character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    status character varying(100) COLLATE pg_catalog."default" NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    frequency character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT petstreatment_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.petsvaccine
(
    id bigint NOT NULL DEFAULT nextval('petsvaccine_id_seq'::regclass),
    pet_id bigint NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    laboratory character varying(100) COLLATE pg_catalog."default" NOT NULL,
    startdate date NOT NULL,
    nextdate date,
    dose character varying(50) COLLATE pg_catalog."default" NOT NULL,
    photourl character varying(10000000) COLLATE pg_catalog."default",
    photoname character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT petsvaccine_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.petsveterinarian
(
    id bigint NOT NULL DEFAULT nextval('petsveterinarian_id_seq'::regclass),
    pet_id bigint NOT NULL,
    fullname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idtype character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idnumber character varying(100) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city_id bigint NOT NULL,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    calendy character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT petsveterinarian_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.population
(
    id integer NOT NULL DEFAULT nextval('population_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identification_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identification_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    gender character varying(10) COLLATE pg_catalog."default" NOT NULL,
    marital_status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    place_of_birth text COLLATE pg_catalog."default" NOT NULL,
    address text COLLATE pg_catalog."default" NOT NULL,
    category character varying(50) COLLATE pg_catalog."default" NOT NULL,
    regiment_type boolean NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    occupation character varying(50) COLLATE pg_catalog."default" NOT NULL,
    status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "position" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    contract_id integer NOT NULL,
    CONSTRAINT population_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.provider
(
    id integer NOT NULL DEFAULT nextval('provider_id_seq'::regclass),
    provider_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    identification_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    identification_number character varying(255) COLLATE pg_catalog."default" NOT NULL,
    full_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(255) COLLATE pg_catalog."default" NOT NULL,
    address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    city bigint NOT NULL,
    department character varying(255) COLLATE pg_catalog."default",
    photo_bs64 text COLLATE pg_catalog."default",
    pub_photo character varying(255) COLLATE pg_catalog."default",
    priv_photo character varying(255) COLLATE pg_catalog."default",
    status boolean NOT NULL,
    CONSTRAINT provider_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.provider_services
(
    id integer NOT NULL DEFAULT nextval('provider_services_id_seq'::regclass),
    provider_id integer NOT NULL,
    service_id integer NOT NULL,
    status boolean NOT NULL,
    CONSTRAINT provider_services_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.records
(
    id integer NOT NULL DEFAULT nextval('records_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT records_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.regimenttype
(
    id integer NOT NULL DEFAULT nextval('regimenttype_id_seq'::regclass),
    health_insurance_id integer NOT NULL,
    regiment_type boolean NOT NULL,
    category character varying(50) COLLATE pg_catalog."default" NOT NULL,
    max_value_event numeric(10, 2) NOT NULL,
    CONSTRAINT regimenttype_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.relative
(
    id integer NOT NULL DEFAULT nextval('relative_id_seq'::regclass),
    user_id bigint NOT NULL,
    doctor_id bigint NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identification_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identification_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    gender character varying(10) COLLATE pg_catalog."default" NOT NULL,
    marital_status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    place_of_birth text COLLATE pg_catalog."default" NOT NULL,
    city_id integer NOT NULL,
    address text COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    occupation character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "position" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    health_insurance_id integer NOT NULL,
    company_id integer NOT NULL,
    status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT relative_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.respiratory_rate
(
    id integer NOT NULL DEFAULT nextval('respiratory_rate_id_seq'::regclass),
    patient_id integer NOT NULL,
    rate integer NOT NULL,
    date timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT respiratory_rate_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.role
(
    id integer NOT NULL DEFAULT nextval('role_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    status boolean NOT NULL,
    CONSTRAINT role_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.services
(
    id integer NOT NULL DEFAULT nextval('services_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT services_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.sites
(
    id integer NOT NULL DEFAULT nextval('sites_id_seq'::regclass),
    address text COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    contact character varying(50) COLLATE pg_catalog."default" NOT NULL,
    city_id integer NOT NULL,
    company_id integer NOT NULL,
    CONSTRAINT sites_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.townships
(
    id bigint NOT NULL DEFAULT nextval('townships_id_seq'::regclass),
    department_id bigint NOT NULL,
    code character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT townships_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.userrole
(
    id integer NOT NULL DEFAULT nextval('userrole_id_seq'::regclass),
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT userrole_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    code character varying(100) COLLATE pg_catalog."default",
    hashcode character varying(200) COLLATE pg_catalog."default",
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    typeperson character varying(100) COLLATE pg_catalog."default",
    typeid character varying(100) COLLATE pg_catalog."default" NOT NULL,
    numberid character varying(80) COLLATE pg_catalog."default",
    address character varying(100) COLLATE pg_catalog."default",
    city_id bigint,
    phone character varying(80) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    parentesco character varying(100) COLLATE pg_catalog."default",
    notificationid character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    session_token character varying(255) COLLATE pg_catalog."default",
    verificado boolean NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    service character varying(20) COLLATE pg_catalog."default",
    pubname character varying(100) COLLATE pg_catalog."default",
    privname character varying(100) COLLATE pg_catalog."default",
    imagebs64 text COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_code_key UNIQUE (code),
    CONSTRAINT users_email_key UNIQUE (email),
    CONSTRAINT users_hashcode_key UNIQUE (hashcode),
    CONSTRAINT users_notificationid_key UNIQUE (notificationid)
);

CREATE TABLE IF NOT EXISTS public.vacunas
(
    id bigint NOT NULL DEFAULT nextval('vacunas_id_seq'::regclass),
    id_paciente bigint NOT NULL,
    vacuna character varying(100) COLLATE pg_catalog."default",
    updated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT vacunas_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.veterinarians
(
    id bigint NOT NULL DEFAULT nextval('veterinarians_id_seq'::regclass),
    fullname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idtype character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idnumber character varying(100) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city_id bigint NOT NULL,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    calendy character varying(100) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    price character varying(10) COLLATE pg_catalog."default",
    reg_veterinarian character varying(20) COLLATE pg_catalog."default",
    occupation character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT veterinarians_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.veterinary_clinics
(
    id integer NOT NULL DEFAULT nextval('veterinary_clinics_id_seq'::regclass),
    business_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    entity_type character varying(100) COLLATE pg_catalog."default" NOT NULL,
    priority character varying(100) COLLATE pg_catalog."default",
    strategy character varying(255) COLLATE pg_catalog."default",
    name_1 character varying(100) COLLATE pg_catalog."default",
    name_2 character varying(100) COLLATE pg_catalog."default",
    last_name_1 character varying(100) COLLATE pg_catalog."default",
    last_name_2 character varying(100) COLLATE pg_catalog."default",
    registration_date date,
    renewal_date date,
    vicinity character varying(255) COLLATE pg_catalog."default",
    township integer,
    phone_1 character varying(15) COLLATE pg_catalog."default",
    phone_2 character varying(15) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    ciiu_1 character varying(500) COLLATE pg_catalog."default",
    ciiu_2 character varying(500) COLLATE pg_catalog."default",
    ciiu_3 character varying(500) COLLATE pg_catalog."default",
    ciiu_4 character varying(500) COLLATE pg_catalog."default",
    activity character varying(500) COLLATE pg_catalog."default",
    company_size character varying(500) COLLATE pg_catalog."default",
    owner_name character varying(500) COLLATE pg_catalog."default",
    legal_representative_name character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT veterinary_clinics_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.vitalsignals
(
    id integer NOT NULL DEFAULT nextval('vitalsignals_id_seq'::regclass),
    medical_consult_id integer NOT NULL,
    weight numeric(5, 2) NOT NULL,
    size numeric(5, 2) NOT NULL,
    imc numeric(5, 2) NOT NULL,
    blood_pressure character varying(10) COLLATE pg_catalog."default" NOT NULL,
    heart_frequency integer NOT NULL,
    system character varying(50) COLLATE pg_catalog."default" NOT NULL,
    body_area character varying(50) COLLATE pg_catalog."default" NOT NULL,
    symptom text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT vitalsignals_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.wellnessspa
(
    id bigint NOT NULL DEFAULT nextval('wellnessspa_id_seq'::regclass),
    fullname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idtype character varying(100) COLLATE pg_catalog."default" NOT NULL,
    idnumber character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_veterinarian character varying(20) COLLATE pg_catalog."default",
    occupation character varying(20) COLLATE pg_catalog."default",
    phone character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city_id bigint NOT NULL,
    address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    calendy character varying(100) COLLATE pg_catalog."default" NOT NULL,
    price character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT wellnessspa_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.alergias
    ADD CONSTRAINT alergias_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.antecedentes
    ADD CONSTRAINT antecedentes_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.appointmentbreakdown
    ADD CONSTRAINT appointmentbreakdown_appointment_id_fkey FOREIGN KEY (appointment_id)
    REFERENCES public.appointments (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_appointmentbreakdown_appointment_id
    ON public.appointmentbreakdown(appointment_id);


ALTER TABLE IF EXISTS public.appointmentbreakdown
    ADD CONSTRAINT appointmentbreakdown_doctor_id_fkey FOREIGN KEY (doctor_id)
    REFERENCES public.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_appointmentbreakdown_doctor_id
    ON public.appointmentbreakdown(doctor_id);


ALTER TABLE IF EXISTS public.appointmentbreakdown
    ADD CONSTRAINT appointmentbreakdown_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_appointmentbreakdown_user_id
    ON public.appointmentbreakdown(user_id);


ALTER TABLE IF EXISTS public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id)
    REFERENCES public.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_appointments_doctor_id
    ON public.appointments(doctor_id);


ALTER TABLE IF EXISTS public.appointments
    ADD CONSTRAINT appointments_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_appointments_user_id
    ON public.appointments(user_id);


ALTER TABLE IF EXISTS public.atecedentes_familiares
    ADD CONSTRAINT atecedentes_familiares_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.bathroomhairdresser
    ADD CONSTRAINT bathroomhairdresser_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.blood_glucose
    ADD CONSTRAINT fk_patient FOREIGN KEY (patient_id)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.blood_oxygen
    ADD CONSTRAINT fk_patient FOREIGN KEY (patient_id)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.blood_pressure
    ADD CONSTRAINT blood_pressure_patient_id_fkey FOREIGN KEY (patient_id)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_blood_pressure_patient_id
    ON public.blood_pressure(patient_id);


ALTER TABLE IF EXISTS public.bonds
    ADD CONSTRAINT bonds_health_insurance_id_fkey FOREIGN KEY (health_insurance_id)
    REFERENCES public.healthinsurance (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_bonds_health_insurance_id
    ON public.bonds(health_insurance_id);


ALTER TABLE IF EXISTS public.clinics_services_breakdown
    ADD CONSTRAINT clinics_services_breakdown_clinic_service_id_fkey FOREIGN KEY (clinic_service_id)
    REFERENCES public.clinics_services (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.clinics_services_breakdown
    ADD CONSTRAINT clinics_services_breakdown_veterinary_clinic_id_fkey FOREIGN KEY (veterinary_clinic_id)
    REFERENCES public.veterinary_clinics (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.company
    ADD CONSTRAINT company_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_company_city_id
    ON public.company(city_id);


ALTER TABLE IF EXISTS public.condicion
    ADD CONSTRAINT condicion_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.contactos
    ADD CONSTRAINT contactos_id_usuario_fkey FOREIGN KEY (id_usuario)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.contract
    ADD CONSTRAINT contract_health_insurance_id_fkey FOREIGN KEY (health_insurance_id)
    REFERENCES public.healthinsurance (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_contract_health_insurance_id
    ON public.contract(health_insurance_id);


ALTER TABLE IF EXISTS public.contractservices
    ADD CONSTRAINT contractservices_contract_id_fkey FOREIGN KEY (contract_id)
    REFERENCES public.contract (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_contractservices_contract_id
    ON public.contractservices(contract_id);


ALTER TABLE IF EXISTS public.diagnostic
    ADD CONSTRAINT diagnostic_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_diagnostic_medical_consult_id
    ON public.diagnostic(medical_consult_id);


ALTER TABLE IF EXISTS public.doctor
    ADD CONSTRAINT doctor_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_doctor_city_id
    ON public.doctor(city_id);


ALTER TABLE IF EXISTS public.doctorrelative
    ADD CONSTRAINT doctorrelative_doctor_id_fkey FOREIGN KEY (doctor_id)
    REFERENCES public.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_doctorrelative_doctor_id
    ON public.doctorrelative(doctor_id);


ALTER TABLE IF EXISTS public.doctorrelative
    ADD CONSTRAINT doctorrelative_relative_id_fkey FOREIGN KEY (relative_id)
    REFERENCES public.relative (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_doctorrelative_relative_id
    ON public.doctorrelative(relative_id);


ALTER TABLE IF EXISTS public.doctorservice
    ADD CONSTRAINT doctorservice_doctor_id_fkey FOREIGN KEY (doctor_id)
    REFERENCES public.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_doctorservice_doctor_id
    ON public.doctorservice(doctor_id);


ALTER TABLE IF EXISTS public.documents
    ADD CONSTRAINT documents_provider_id_fkey FOREIGN KEY (provider_id)
    REFERENCES public.provider (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.emergencycontact
    ADD CONSTRAINT emergencycontact_relative_id_fkey FOREIGN KEY (relative_id)
    REFERENCES public.relative (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_emergencycontact_relative_id
    ON public.emergencycontact(relative_id);


ALTER TABLE IF EXISTS public.enfermedades
    ADD CONSTRAINT enfermedades_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.establishment
    ADD CONSTRAINT establishment_provider_id_fkey FOREIGN KEY (provider_id)
    REFERENCES public.provider (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.familiarrecords
    ADD CONSTRAINT familiarrecords_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_familiarrecords_medical_consult_id
    ON public.familiarrecords(medical_consult_id);


ALTER TABLE IF EXISTS public.gynecoobstetrics
    ADD CONSTRAINT gynecoobstetrics_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_gynecoobstetrics_medical_consult_id
    ON public.gynecoobstetrics(medical_consult_id);


ALTER TABLE IF EXISTS public.habits
    ADD CONSTRAINT habits_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_habits_medical_consult_id
    ON public.habits(medical_consult_id);


ALTER TABLE IF EXISTS public.heart_rate
    ADD CONSTRAINT heart_rate_patient_id_fkey FOREIGN KEY (patient_id)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_heart_rate_patient_id
    ON public.heart_rate(patient_id);


ALTER TABLE IF EXISTS public.hotelnursery
    ADD CONSTRAINT hotelnursery_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.laboratory
    ADD CONSTRAINT laboratory_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_laboratory_medical_consult_id
    ON public.laboratory(medical_consult_id);


ALTER TABLE IF EXISTS public.legal_representative
    ADD CONSTRAINT legal_representative_provider_id_fkey FOREIGN KEY (provider_id)
    REFERENCES public.provider (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.mascotas
    ADD CONSTRAINT mascotas_id_usuario_fkey FOREIGN KEY (id_usuario)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.medicalconsultation
    ADD CONSTRAINT medicalconsultation_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_medicalconsultation_city_id
    ON public.medicalconsultation(city_id);


ALTER TABLE IF EXISTS public.medicalconsultation
    ADD CONSTRAINT medicalconsultation_relative_id_fkey FOREIGN KEY (relative_id)
    REFERENCES public.relative (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_medicalconsultation_relative_id
    ON public.medicalconsultation(relative_id);


ALTER TABLE IF EXISTS public.medicamentos
    ADD CONSTRAINT medicamentos_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.moderatorfee
    ADD CONSTRAINT moderatorfee_health_insurance_id_fkey FOREIGN KEY (health_insurance_id)
    REFERENCES public.healthinsurance (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_moderatorfee_health_insurance_id
    ON public.moderatorfee(health_insurance_id);


ALTER TABLE IF EXISTS public.other_specialties
    ADD CONSTRAINT other_specialties_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_other_specialties_medical_consult_id
    ON public.other_specialties(medical_consult_id);


ALTER TABLE IF EXISTS public.pacientes
    ADD CONSTRAINT pacientes_a_cargo_id_fkey FOREIGN KEY (a_cargo_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.paymentbill
    ADD CONSTRAINT paymentbill_doctor_service_id_fkey FOREIGN KEY (doctor_service_id)
    REFERENCES public.doctorservice (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_paymentbill_doctor_service_id
    ON public.paymentbill(doctor_service_id);


ALTER TABLE IF EXISTS public.paymentbill
    ADD CONSTRAINT paymentbill_health_insurance_id_fkey FOREIGN KEY (health_insurance_id)
    REFERENCES public.healthinsurance (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_paymentbill_health_insurance_id
    ON public.paymentbill(health_insurance_id);


ALTER TABLE IF EXISTS public.paymentbill
    ADD CONSTRAINT paymentbill_relative_id_fkey FOREIGN KEY (relative_id)
    REFERENCES public.relative (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_paymentbill_relative_id
    ON public.paymentbill(relative_id);


ALTER TABLE IF EXISTS public.pertenencias
    ADD CONSTRAINT pertenencias_id_user_fkey FOREIGN KEY (id_user)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.petsdiseasecondition
    ADD CONSTRAINT petsdiseasecondition_pet_id_fkey FOREIGN KEY (pet_id)
    REFERENCES public.mascotas (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.petstreatment
    ADD CONSTRAINT petstreatment_pet_id_fkey FOREIGN KEY (pet_id)
    REFERENCES public.mascotas (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.petsvaccine
    ADD CONSTRAINT petsvaccine_pet_id_fkey FOREIGN KEY (pet_id)
    REFERENCES public.mascotas (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.petsveterinarian
    ADD CONSTRAINT petsveterinarian_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.petsveterinarian
    ADD CONSTRAINT petsveterinarian_pet_id_fkey FOREIGN KEY (pet_id)
    REFERENCES public.mascotas (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.population
    ADD CONSTRAINT population_contract_id_fkey FOREIGN KEY (contract_id)
    REFERENCES public.contract (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_population_contract_id
    ON public.population(contract_id);


ALTER TABLE IF EXISTS public.provider
    ADD CONSTRAINT provider_city_fkey FOREIGN KEY (city)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.provider_services
    ADD CONSTRAINT provider_services_provider_id_fkey FOREIGN KEY (provider_id)
    REFERENCES public.provider (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.provider_services
    ADD CONSTRAINT provider_services_service_id_fkey FOREIGN KEY (service_id)
    REFERENCES public.services (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.records
    ADD CONSTRAINT records_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_records_medical_consult_id
    ON public.records(medical_consult_id);


ALTER TABLE IF EXISTS public.regimenttype
    ADD CONSTRAINT regimenttype_health_insurance_id_fkey FOREIGN KEY (health_insurance_id)
    REFERENCES public.healthinsurance (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_regimenttype_health_insurance_id
    ON public.regimenttype(health_insurance_id);


ALTER TABLE IF EXISTS public.relative
    ADD CONSTRAINT relative_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_relative_city_id
    ON public.relative(city_id);


ALTER TABLE IF EXISTS public.relative
    ADD CONSTRAINT relative_company_id_fkey FOREIGN KEY (company_id)
    REFERENCES public.company (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_relative_company_id
    ON public.relative(company_id);


ALTER TABLE IF EXISTS public.relative
    ADD CONSTRAINT relative_doctor_id_fkey FOREIGN KEY (doctor_id)
    REFERENCES public.doctor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_relative_doctor_id
    ON public.relative(doctor_id);


ALTER TABLE IF EXISTS public.relative
    ADD CONSTRAINT relative_health_insurance_id_fkey FOREIGN KEY (health_insurance_id)
    REFERENCES public.healthinsurance (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_relative_health_insurance_id
    ON public.relative(health_insurance_id);


ALTER TABLE IF EXISTS public.relative
    ADD CONSTRAINT relative_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_relative_user_id
    ON public.relative(user_id);


ALTER TABLE IF EXISTS public.respiratory_rate
    ADD CONSTRAINT respiratory_rate_patient_id_fkey FOREIGN KEY (patient_id)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_respiratory_rate_patient_id
    ON public.respiratory_rate(patient_id);


ALTER TABLE IF EXISTS public.sites
    ADD CONSTRAINT sites_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS idx_sites_city_id
    ON public.sites(city_id);


ALTER TABLE IF EXISTS public.sites
    ADD CONSTRAINT sites_company_id_fkey FOREIGN KEY (company_id)
    REFERENCES public.company (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_sites_company_id
    ON public.sites(company_id);


ALTER TABLE IF EXISTS public.townships
    ADD CONSTRAINT townships_department_id_fkey FOREIGN KEY (department_id)
    REFERENCES public.departments (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.userrole
    ADD CONSTRAINT userrole_role_id_fkey FOREIGN KEY (role_id)
    REFERENCES public.role (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.userrole
    ADD CONSTRAINT userrole_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.users
    ADD CONSTRAINT users_code_fkey FOREIGN KEY (code)
    REFERENCES public.codes (code) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX IF NOT EXISTS users_code_key
    ON public.users(code);


ALTER TABLE IF EXISTS public.vacunas
    ADD CONSTRAINT vacunas_id_paciente_fkey FOREIGN KEY (id_paciente)
    REFERENCES public.pacientes (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.veterinarians
    ADD CONSTRAINT veterinarians_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.veterinary_clinics
    ADD CONSTRAINT veterinary_clinics_township_fkey FOREIGN KEY (township)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.vitalsignals
    ADD CONSTRAINT vitalsignals_medical_consult_id_fkey FOREIGN KEY (medical_consult_id)
    REFERENCES public.medicalconsultation (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS idx_vitalsignals_medical_consult_id
    ON public.vitalsignals(medical_consult_id);


ALTER TABLE IF EXISTS public.wellnessspa
    ADD CONSTRAINT wellnessspa_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.townships (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

