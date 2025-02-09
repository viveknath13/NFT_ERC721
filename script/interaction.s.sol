// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MyNft} from "../src/NftCool.sol";

contract minBasicNft is Script {
    string constant NFT_IS = "ipfs://bafybeiexozgl2s6kumdz45jxnvvhdo4nsbspsin3yij62hmk5da4qyqvgq/?filename=nft.json";

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment("MyNft", block.chainid);
        mintNftOnContract(mostRecentDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MyNft(contractAddress).mintToken(NFT_IS);
        vm.stopBroadcast();
    }
}
