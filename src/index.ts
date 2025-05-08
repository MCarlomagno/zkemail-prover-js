
import express from 'express';
import { prove } from './prove';

const app = express();
const port = 3000; // or any port you want

app.get('/prove', async (req, res) => {
  let verified = await prove();
  res.send(`Proof is generated and verified: ${verified}`);
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});


