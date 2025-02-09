// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {DeployNft} from "../../script/DeployNft.s.sol";
import {MyNft} from "../../src/NftCool.sol";

contract TestNft is Test {
    address public USER = makeAddr("user");

    string constant NFT_IS = "ipfs://bafybeiexozgl2s6kumdz45jxnvvhdo4nsbspsin3yij62hmk5da4qyqvgq/?filename=nft.json";
    DeployNft public deployer;
    MyNft public basicNft;

    function setUp() public {
        deployer = new DeployNft();
        basicNft = deployer.run();
    }

    function testName() public view {
        string memory expectedName = "BlueEye";
        string memory actualName = basicNft.name();
        console.log(expectedName, actualName);

        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintToken(NFT_IS);
        assert(basicNft.balanceOf(USER) == 1);
        console.log(basicNft.balanceOf(USER), basicNft.tokenURI(0));

        assert(keccak256(abi.encodePacked(NFT_IS)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
