#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

# -------------- #
# Initial checks #
# -------------- #
if [ -z "$CONTRACT_ADDRESS" ]
then
    echo "CONTRACT_ADDRESS or ADDRESS is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x getBalance.sh"
    exit 0
fi

# Get balance
echo "Get balance of account"
balance=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $ADDRESS)
echo "NFT balance: $balance"

# CONTRACT_ADDRESS= ./scripts/getBalance.sh
