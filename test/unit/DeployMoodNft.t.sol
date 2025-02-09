// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import{Test, console } from "forge-std/Test.sol";
import{DeployMoodNft} from "../../script/DeployMoodNft.s.sol";



contract DeployMoodNftTest is Test{
    DeployMoodNft public deployer;


    function setUp() public {
        deployer = new DeployMoodNft();



    }


    function testConvertSvgToUri()public view {
       
       
       
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIyMDAiIHk9IjI1MCIgZmlsbD0iZ3JlZW4iPkhpISBZb3UgZGVjb2RlZCB0aGlzIXtCbHVlIEV5ZXMgfTwvdGV4dD48L3N2Zz4=";
            console.log(expectedUri);
 string memory svg='<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="200" y="250" fill="green">Hi! You decoded this!{Blue Eyes }</text></svg>';    string memory actualUri = deployer.SvgToImageUri(svg);
    console.log(actualUri);


    assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    


    }


}