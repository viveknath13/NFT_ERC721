
# NFT Smart Contract Explanation

This is a simple NFT (Non-Fungible Token) smart contract written in Solidity. Let's break it down in simple terms:

1. The contract inherits from OpenZeppelin's `ERC721` contract which provides standard NFT functionality

2. State Variables
- `s_tokenCounter`: Keeps track of how many NFTs have been minted
- `s_tokenIdToUri`: A mapping that connects each NFT's ID to its metadata URI

3. Constructor
- Sets the NFT collection name as "BlueEye" 
- Sets the symbol as "BE"
- Initializes the token counter to 0

4. Main Functions

`mintToken(string memory tokenUri)`
- Allows anyone to mint a new NFT
- Takes a tokenUri parameter which points to the NFT's metadata
- Stores the URI in the mapping
- Mints the token to the caller's address
- Increments the token counter
`tokenURI(uint256 tokenId)`
- Returns the metadata URI for a specific token ID
- This function is required by the ERC721 standard
- Helps marketplaces display NFT information

## Simple Usage Example:
1. Deploy the contract
2. Call `mintToken` with a URI pointing to your NFT's metadata
3. The NFT will be minted to your address
4. You can view the token's URI using `tokenURI` function



# Deploy Script Explanation

The `DeployNft.s.sol` script is used to deploy our NFT contract. Here's how it works:

1. Script Setup
- Uses Foundry's `Script.sol` for deployment functionality
- Imports our `MyNft` contract from `NftCool.sol`

2. Deploy Contract
- The `run()` function is the main deployment function
- Returns a `MyNft` contract instance
- Will handle the deployment transaction
- Uses Foundry's cheat codes for deployment

3. Usage
- Run using Foundry's forge script command
- Will deploy the NFT contract with:
  - Name: "BlueEye"
  - Symbol: "BE"
  - Starting token counter: 0

4. After Deployment
- Contract will be ready to mint NFTs
- Anyone can call mintToken with their NFT metadata URI
- Each NFT will have a unique token ID starting from 0


# String Comparison in Solidity

In Solidity, there are several ways to compare strings:

1. Using keccak256 Hash
 
function compareStrings(string memory a, string memory b) public pure returns (bool) {
    return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
}


2. Using bytes comparison

function compareStrings(string memory a, string memory b) public pure returns (bool) {
    return bytes(a).length == bytes(b).length && 
           keccak256(bytes(a)) == keccak256(bytes(b));
}


Key Points:
- Direct string comparison (a == b) is not possible in Solidity
- keccak256 hash comparison is the most gas-efficient method
- Comparing bytes length first can save gas if strings are different lengths
- Both methods are case-sensitive



