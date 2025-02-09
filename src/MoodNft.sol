// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    error IsNotOwner();

    uint256 private s_tokenCounter;
    string private _happySvgImageUri;
    string private _sadSvgImageUri;

    enum Mood {
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenUriToMood;

    constructor(string memory happySvg, string memory sadSvg) ERC721("Mood Nft ", "MN") {
        s_tokenCounter = 0;
        _sadSvgImageUri = sadSvg;
        _happySvgImageUri = happySvg;
    }

    function flipMood(uint256 tokenId) public {
        if (!_isAuthorized(_ownerOf(tokenId), msg.sender, tokenId)) {
            revert IsNotOwner();
        }
        if (s_tokenUriToMood[tokenId] == Mood.HAPPY) {
            s_tokenUriToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenUriToMood[tokenId] = Mood.HAPPY;
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json/base64,";
    }

    function minNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenUriToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenUriToMood[tokenId] == Mood.HAPPY) {
            imageURI = _happySvgImageUri;
        } else {
            imageURI = _sadSvgImageUri;
        }

        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    abi.encodePacked(
                        '{"name: "',
                        name(),
                        '", description: "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": ',
                        imageURI,
                        '"}'
                    )
                )
            )
        );
    }
}
