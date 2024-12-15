const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); 
const patientsRoute = require('C:/Users/ACER/Desktop/HospitalManagement/routes/appointments.js'); 
const doctorsRoute = require('C:/Users/ACER/Desktop/HospitalManagement/routes/doctors.js'); 
const treatmentsRoute = require('C:/Users/ACER/Desktop/HospitalManagement/routes/treatments.js'); 
const appointmentsRoute = require('C:/Users/ACER/Desktop/HospitalManagement/routes/appointments.js'); 
const pool = require('C:/Users/ACER/Desktop/HospitalManagement/index.js'); 

const app = express();
const PORT = process.env.PORT || 5500;


app.use(bodyParser.json());


app.use(cors());

//routes
app.use('/api/patients', patientsRoute);
app.use('/api/doctors', doctorsRoute);
app.use('/api/treatments', treatmentsRoute);
app.use('/api/appointments', appointmentsRoute);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
