import zke from "@zk-email/sdk";
import * as fs from 'fs';
import * as path from 'path';

function log(str: string) {
  console.log(`[ZkEmail Prover] ${str}`);
}

export async function prove() {
  const zkemail = zke();

  log("Loading blueprint");
  const blueprint = await zkemail.getBlueprint("MCarlomagno/openzeppelin_recovery@v1");

  const emailFilePath = path.join(__dirname, 'fixtures', 'Recover.eml');
  const emailContent: string = fs.readFileSync(emailFilePath, 'utf-8');

  log("creating local prover");
  const prover = blueprint.createProver({ isLocal: false });

  log("proving");
  const proof = await prover.generateProof(emailContent);

  log("verifying");
  const verified = await blueprint.verifyProof(proof);

  log(`Proof is valid: ${verified}`);

  return verified;
}
