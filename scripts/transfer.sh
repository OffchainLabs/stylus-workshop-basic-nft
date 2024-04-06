#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

# -------------- #
# Initial checks #
# -------------- #
if [ -z "$CONTRACT_ADDRESS" ] || [ -z "$TOKEN_ID" ] || [ -z "$RECEIVER" ]
then
    echo "CONTRACT_ADDRESS, TOKEN_ID or RECEIVER is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x TOKEN_ID=0 RECEIVER=0x transfer.sh"
    exit 0
fi

# Transfering NFT
echo "Transfering NFT..."
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY $CONTRACT_ADDRESS "transferFrom(address,address,uint256)" $ADDRESS $RECEIVER $TOKEN_ID

# CONTRACT_ADDRESS= TOKEN_ID=0 RECEIVER=0x ./scripts/burn.sh