
import { groth16, Groth16Proof, PublicSignals, } from "snarkjs";
import path from "path";
import fs from "fs";
import { promisify } from "util";

const TMP_DIR = "tmp";
const ARTIFACTS_DIR = "src/artifacts";


/**
 * Generates the witness for the email circuit.
 * @param emailContent 
 * @returns { inputsPath: string; witnessPath: string }
 */
export async function generateProof(witnessPath: string, uuid?: string): Promise<{ proof: Groth16Proof; publicSignals: PublicSignals, calldata: string }> { 
    let zkeyFile = path.join(ARTIFACTS_DIR, "email_auth.zkey");
    let { proof, publicSignals } = await groth16.prove(zkeyFile, witnessPath);

    let calldata = await groth16.exportSolidityCallData(proof, publicSignals);


    let proofPath = path.join(TMP_DIR, uuid ? `proof-${uuid}.json` : "proof.json");
    await promisify(fs.writeFile)(proofPath, JSON.stringify(proof));

    let publicSignalsPath = path.join(TMP_DIR, uuid ? `public-signals-${uuid}.json` : "public-signals.json");
    await promisify(fs.writeFile)(publicSignalsPath, JSON.stringify(publicSignals));

    return {
        proof,
        publicSignals,
        calldata,
    };
}
