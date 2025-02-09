// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {Script} from "forge-std/Script.sol";
import {MyNft} from "../src/NftCool.sol";

contract DeployNft is Script {
    function run() external returns (MyNft) {
        vm.startBroadcast();
        MyNft basicNft = new MyNft();
        vm.stopBroadcast();
        return basicNft;
    }
}
