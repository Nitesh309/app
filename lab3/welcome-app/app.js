const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h1>🚀 Welcome to the Node.js App on Docker Multi-Stage Build!</h1>');
});

app.listen(PORT, () => {
  console.log(`App running on http://localhost:${PORT}`);
});
