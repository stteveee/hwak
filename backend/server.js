const express = require('express');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
  res.json({ 
    message: 'HWAK API Running!',
    version: '1.0.0'
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log('HWAK Server started on port ' + PORT);
});
