
import fs from "fs";
import { promisify } from "util";
import { wtns } from "snarkjs";
import { with0xPrefix } from "./utils";
import path from "path";

const relayerUtils = require("@zk-email/relayer-utils");

const TMP_DIR = "tmp";
const ARTIFACTS_DIR = "src/artifacts";

/**
 * Searches the regex to extract the code from the email content.
 * @param emailContent 
 * @returns code
 */
function extractCode(emailContent: string): string {
    let regex = /Code\s+(?:=\r?\n)?((?:[0-9a-fA-F]{2}(?:=\r?\n)?){32})/;
    let match = emailContent.match(regex);
    if (!match) {
        throw new Error("No code found in email, expected format: Code <64 hex characters>");
    }
    return match[1].replace(/=\r?\n|=<br\s*\/?>/gi, '');
}

/**
 * Generates the witness for the email circuit.
 * @param emailContent 
 * @returns { inputsPath: string; witnessPath: string }
 */
export async function generateWitness(emailContent: string, uuid?: string): Promise<{ inputsPath: string; witnessPath: string }> {
    let emailCode = with0xPrefix(extractCode(emailContent));

    const inputs = await relayerUtils.genEmailCircuitInput(
        emailContent,
        emailCode,
        {
            maxHeaderLength: 1024,
            maxBodyLength: 1024,
            ignoreBodyHashCheck: false,
            shaPrecomputeSelector: '(<div id=3D"[^"]*zkemail[^"]*"[^>]*>)'
        }
    );

    let inputsPath = path.join(TMP_DIR, uuid ? `input-${uuid}.json` : "input.json");
    await promisify(fs.writeFile)(inputsPath, inputs);

    let witnessPath = path.join(TMP_DIR, uuid ? `witness-${uuid}.wtns` : "witness.wtns");
    let wasmPath = path.join(ARTIFACTS_DIR, "email_auth.wasm");
    await wtns.calculate(JSON.parse(inputs), wasmPath, witnessPath);

    return {
        inputsPath,
        witnessPath
    };
}

