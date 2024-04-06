#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

# -------------- #
# Initial checks #
# -------------- #
if [ -z "$CONTRACT_ADDRESS" ] || [ -z "$TOKEN_ID" ]
then
    echo "CONTRACT_ADDRESS or TOKEN_ID is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x TOKEN_ID=0 getTokenUri.sh"
    exit 0
fi

# Get URI of token_id
echo "Get tokenUri of token $TOKEN_ID"
token_uri=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "tokenUri(uint256) (string)" $TOKEN_ID)
echo "Token URI: $token_uri"

# CONTRACT_ADDRESS= TOKEN_ID=0 ./scripts/getTokenUri.sh
