# zkemail-prover-js

A Node.js server to generate and verify proofs for emails using the ZK-Email SDK. 

Uses [MCarlomagno/openzeppelin_recovery](https://registry.zk.email/b861470a-e2df-4283-bbc6-5db1d6d4d274) blueprint.
Which requires:
- The sender must have a valid OpenZeppelin domain.
- The subject must be "Recover".

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

**Example using cURL:**

```bash
curl -X POST -F "email=@/path/to/your/email.eml" http://localhost:3000/prove
```

**Successful Response (200 OK):**

```json
{
  "message": "Proof is generated and verified",
  "verified": true,
  "proof": "0x..."
}
```


