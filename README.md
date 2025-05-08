# zkemail-prover-js

A Node.js Express server to generate and verify proofs for emails using the ZK-Email SDK.

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


