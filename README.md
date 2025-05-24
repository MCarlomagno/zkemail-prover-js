# Account recovery prover

A prover server using snarkjs to generate proofs for emails.

Emails supported:
- Accept guardian request.

## Prerequisites

In order to generate proofs, you need `circom` and `snarkjs` pre-installad to compile the circuit and generate the following artifacts

- `src/artifacts/email_auth.wasm`
- `src/artifacts/email_auth.r1cs`
- `src/artifacts/email_auth.zkey`

### Compile the circuit

You can generate the r1cs and wasm files using the following command from root:

```bash
circom --r1cs --wasm --c --sym --inspect src/circuits/email_auth.circom 
```

Then move them to `src/artifacts` and rename them to `email_auth.wasm` and `email_auth.r1cs`.

### Generating the zkey file

To generate the zkey file you need a trusted setup using powers of tau files. You can find more information in the [snarkjs documentation](https://github.com/iden3/snarkjs). Or just download a prepared one [here](https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final.ptau).

> ⚠️ Warning: The ptau setup should not be used in production.

Then you can generate the zkey file using the following command:

```bash
snarkjs zkey new src/artifacts/email_auth.wasm powersOfTau28_hez_final.ptau src/artifacts/email_auth.zkey
```

## Running the Server

To start the development server:

```bash
yarn && yarn start
```

## API Endpoint

### POST /prove

This endpoint accepts an email file (`.eml`) as form-data and returns a proof and verification status.

- **Request Type**: `multipart/form-data`
- **Form Field**: `email` (this field should contain the `.eml` file)

See example email in `fixtures/email_auth_test.eml`

**Example using cURL:**

```bash
curl -X POST -F "email=@fixtures/email_auth_test.eml" http://localhost:3000/prove
```

**Successful Response (200 OK):**

```json
{
  "message": "Proof generated",
  "verified": true,
  "proof": { "pi_a": "...", ... },
  "publicSignals": { ... },
  "proofId": "...",
  "calldata": "..."
}
```

## Verifying the proof

You can verify the proof on chain using the `verifyProof` function from the contract `src/contracts/Verifier.sol`

**Sepolia contract:**

https://sepolia.etherscan.io/address/0xB1a54F055C5b171bbE5C6b90efe53BF2f1593a03
