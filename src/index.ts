

import express, { Request, Response } from 'express';
import multer from 'multer';
import zke from "@zk-email/sdk";

const app = express();
const port = 3000;

// Configure multer for in-memory file storage
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

app.use(express.json());

function log(str: string) {
  console.log(`[ZkEmail Prover] ${str}`);
}

function serializeCallData(callData: (bigint[] | bigint[][])[]): string {
  const flattened: bigint[] = [];

  for (const item of callData) {
    if (Array.isArray(item[0])) {
      for (const inner of item as bigint[][]) {
        flattened.push(...inner);
      }
    } else {
      flattened.push(...(item as bigint[]));
    }
  }

  const hexParts = flattened.map(bn => {
    const hex = bn.toString(16);
    return hex.length % 2 === 0 ? hex : '0' + hex;
  });

  return '0x' + hexParts.join('');
}

app.post('/prove', upload.single('email'), async (req: Request, res: Response) => {
  if (!req.file) {
    res.status(400).json({ error: 'No email file uploaded. Please upload a file with field name \'emailFile\'.' });
    return;
  }

  const emailContent = req.file.buffer.toString('utf-8');

  const zkemail = zke();

  log("Loading blueprint");
  const blueprint = await zkemail.getBlueprint("MCarlomagno/openzeppelin_recovery@v1");

  log("creating local prover");
  const prover = blueprint.createProver({ isLocal: false });

  log("proving");
  const proof = await prover.generateProof(emailContent);
  const callData = await proof.createCallData();

  log("verifying");
  const verified = await blueprint.verifyProof(proof);

  log(`Proof is valid: ${verified}`);

  res.json({ message: "Proof is generated and verified", verified, proof: serializeCallData(callData) });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});


