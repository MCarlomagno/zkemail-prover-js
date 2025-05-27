

import express, { Request, Response } from 'express';
import { generateWitness } from './witness';
import { generateProof } from './prover';
import multer from 'multer';
import { v4 as uuidv4 } from 'uuid';
import { SMTPServer } from 'smtp-server';
import fs from 'fs';

const app = express();
const port = 3000;

// Configure multer for in-memory file storage
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

app.use(express.json());

app.post('/prove', upload.single('email'), async (req: Request, res: Response) => {
  if (!req.file) {
    res.status(400).json({ error: 'No email file uploaded. Please upload a file with field name \'emailFile\'.' });
    return;
  }

  const uuid = uuidv4();
  const emailContent = req.file.buffer.toString('utf-8');
  const accountCode = req.body.accountCode;

  console.log("generating witness... 👀");

  let { witnessPath } = await generateWitness(emailContent, accountCode, uuid);

  console.log("generating proof... 🧐");

  let { proof, publicSignals, calldata } = await generateProof(witnessPath, uuid);

  console.log("proof generated... 🎉");

  res.json({ message: "Proof generated", proof, publicSignals, proofCalldata: calldata, proofId: uuid });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

/**
 * SMTP server to receive emails
 */
let smtpServer = new SMTPServer({
  onAuth(auth, session, cb) {
    cb(null, { user: "user" });
  },
  authOptional: true,
  onData(stream, session, cb) {
    const write = fs.createWriteStream("./message.eml");
    stream.pipe(write);
    stream.on("end", () => cb());
  }
});

smtpServer.listen(port + 1, () => {
  console.log(`SMTP server running at http://localhost:${port + 1}`);
});
  