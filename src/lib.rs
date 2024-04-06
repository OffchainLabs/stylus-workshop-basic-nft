// Only run this as a WASM if the export-abi feature is not set.
#![cfg_attr(not(any(feature = "export-abi", test)), no_main)]
extern crate alloc;

// Modules and imports
mod erc721;

use alloy_primitives::{U256};
/// Import the Stylus SDK along with alloy primitive types for use in our program.
use stylus_sdk::{
    msg, prelude::*
};
use crate::erc721::{Erc721, Erc721Params};
use erc721::Erc721Error;

/// Initializes a custom, global allocator for Rust programs compiled to WASM.
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

struct StylusNFTParams;

/// Immutable definitions
impl Erc721Params for StylusNFTParams {
    const NAME: &'static str = "StylusNFT";
    const SYMBOL: &'static str = "SNFT";

    fn token_uri(token_id: U256) -> String {
        format!("{}{}{}", "https://my-nft-metadata.com/", token_id, ".json")
    }
}

// Define the entrypoint as a Solidity storage object. The sol_storage! macro
// will generate Rust-equivalent structs with all fields mapped to Solidity-equivalent
// storage slots and types.
sol_storage! {
    #[entrypoint]
    struct StylusNFT {
        #[borrow] // Allows erc721 to access MyToken's storage and make calls
        Erc721<StylusNFTParams> erc721;
    }
}

/// Represents the ways methods may fail.
pub enum StylusNFTError {
    Erc721Error(Erc721Error),
}

impl Into<Vec<u8>> for StylusNFTError {
    fn into(self) -> Vec<u8> {
        match self {
            Self::Erc721Error(err) => err.into(),
        }
    }
}

impl From<Erc721Error> for StylusNFTError {
    fn from(err: Erc721Error) -> Self {
        StylusNFTError::Erc721Error(err)
    }
}

// Result wrapper
type Result<T, E = StylusNFTError> = core::result::Result<T, E>;

#[external]
#[inherit(Erc721<StylusNFTParams>)]
impl StylusNFT {
    /// Mints an NFT
    pub fn mint(&mut self) -> Result<()> {
        let minter = msg::sender();
        self.erc721.mint(minter)?;
        Ok(())
    }

    /// Burns an NFT
    pub fn burn(&mut self, token_id: U256) -> Result<()> {
        // This function checks that msg::sender() owns the specified token_id
        self.erc721.burn(msg::sender(), token_id)?;
        Ok(())
    }
}
