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
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x TOKEN_ID=0 burn.sh"
    exit 0
fi

# Burn NFT
echo "Burning NFT..."
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY $CONTRACT_ADDRESS "burn(uint256)" $TOKEN_ID

# CONTRACT_ADDRESS= TOKEN_ID=0 ./scripts/burn.sh