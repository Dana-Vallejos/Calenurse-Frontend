const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Modelos ficticios para el ejemplo
let nurses = [
  { id: 1, name: "Enfermera 1", shiftPreference: "Mañana", preferredOffDays: ["Sábado", "Domingo"] },
  { id: 2, name: "Enfermera 2", shiftPreference: "Tarde", preferredOffDays: ["Lunes", "Martes"] },
  { id: 3, name: "Enfermera 3", shiftPreference: "Noche", preferredOffDays: ["Miércoles", "Jueves"] },
  { id: 4, name: "Enfermera 4", shiftPreference: "Mañana", preferredOffDays: ["Viernes", "Sábado"] },
  { id: 5, name: "Enfermera 5", shiftPreference: "Tarde", preferredOffDays: ["Domingo", "Lunes"] },
  { id: 6, name: "Enfermera 6", shiftPreference: "Noche", preferredOffDays: ["Martes", "Miércoles"] },
  { id: 7, name: "Enfermera 7", shiftPreference: "Mañana", preferredOffDays: ["Jueves", "Viernes"] },
  { id: 8, name: "Enfermera 8", shiftPreference: "Tarde", preferredOffDays: ["Sábado", "Domingo"] },
  { id: 9, name: "Enfermera 9", shiftPreference: "Noche", preferredOffDays: ["Lunes", "Martes"] }
];


let schedules = [
  // Domingo
  { date: "2023-11-19", shift: "Mañana", nurses: [1, 4, 7] },
  { date: "2023-11-19", shift: "Tarde", nurses: [2, 5, 8] },
  { date: "2023-11-19", shift: "Noche", nurses: [3, 6, 9] },
  // Lunes
  { date: "2023-11-20", shift: "Mañana", nurses: [2, 5, 8] },
  { date: "2023-11-20", shift: "Tarde", nurses: [3, 6, 9] },
  { date: "2023-11-20", shift: "Noche", nurses: [1, 4, 7] },
  // Martes
  { date: "2023-11-21", shift: "Mañana", nurses: [3, 6, 9] },
  { date: "2023-11-21", shift: "Tarde", nurses: [1, 4, 7] },
  { date: "2023-11-21", shift: "Noche", nurses: [2, 5, 8] },
  // Miércoles
  { date: "2023-11-22", shift: "Mañana", nurses: [1, 4, 7] },
  { date: "2023-11-22", shift: "Tarde", nurses: [2, 5, 8] },
  { date: "2023-11-22", shift: "Noche", nurses: [3, 6, 9] },
  // Jueves
  { date: "2023-11-23", shift: "Mañana", nurses: [2, 5, 8] },
  { date: "2023-11-23", shift: "Tarde", nurses: [3, 6, 9] },
  { date: "2023-11-23", shift: "Noche", nurses: [1, 4, 7] },
  // Viernes
  { date: "2023-11-24", shift: "Mañana", nurses: [3, 6, 9] },
  { date: "2023-11-24", shift: "Tarde", nurses: [1, 4, 7] },
  { date: "2023-11-24", shift: "Noche", nurses: [2, 5, 8] },
  // Sábado
  { date: "2023-11-25", shift: "Mañana", nurses: [1, 4, 7] },
  { date: "2023-11-25", shift: "Tarde", nurses: [2, 5, 8] },
  { date: "2023-11-25", shift: "Noche", nurses: [3, 6, 9] }
];


// GET: Obtener la lista de enfermeras
app.get('/nurses', (req, res) => {
  res.status(200).json(nurses);
});

// POST: Agregar una nueva enfermera
app.post('/nurses', (req, res) => {
  const newNurse = req.body; 
  nurses.push(newNurse);
  res.status(201).send('Nurse added');
});

// PUT: Actualizar datos de una enfermera
app.put('/nurses/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const updatedData = req.body;
  let found = false;

  nurses = nurses.map(nurse => {
    if (nurse.id === id) {
      found = true;
      return { ...nurse, ...updatedData };
    }
    return nurse;
  });

  if (found) {
    res.status(200).send('Nurse updated');
  } else {
    res.status(404).send('Nurse not found');
  }
});

// POST: Generar horario
app.post('/schedule', (req, res) => {
  // Lógica para generar horario
  // Esto puede ser complejo dependiendo de cómo quieras implementarlo
  schedules = generateSchedule(nurses); // Esta función debe ser definida
  res.status(201).json(schedules);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
