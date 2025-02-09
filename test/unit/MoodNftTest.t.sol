// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {Test, console} from "forge-std/Test.sol";

import {MoodNft} from "../../src/MoodNft.sol";



contract TestMoodNft is Test {
    MoodNft public moodNft;

    address USER = makeAddr("user");
    string public constant HAPPY_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZwogIHZpZXdCb3g9IjAgMCAyMDAgMjAwIgogIHdpZHRoPSI0MDAiCiAgaGVpZ2h0PSI0MDAiCiAgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIgo+CiAgPGNpcmNsZQogICAgY3g9IjEwMCIKICAgIGN5PSIxMDAiCiAgICBmaWxsPSJ5ZWxsb3ciCiAgICByPSI3OCIKICAgIHN0cm9rZT0iYmxhY2siCiAgICBzdHJva2Utd2lkdGg9IjMiCiAgLz4KICA8ZyBjbGFzcz0iZXllcyI+CiAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgIDxjaXJjbGUgY3g9IjEyNyIgY3k9IjgyIiByPSIxMiIgLz4KICA8L2c+CiAgPHBhdGgKICAgIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiCiAgICBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6IGJsYWNrOyBzdHJva2Utd2lkdGg6IDM7IgogIC8+Cjwvc3ZnPg==";
    string public constant SAD_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxjaXJjbGUgY3g9IjUwIiBjeT0iNTAiIHI9IjUwIiBmaWxsPSJncmV5IiAvPgogICAgPGNpcmNsZSBjeD0iMzUiIGN5PSIzNSIgcj0iNSIgZmlsbD0iYmxhY2siIC8+CiAgICA8Y2lyY2xlIGN4PSI2NSIgY3k9IjM1IiByPSI1IiBmaWxsPSJibGFjayIgLz4KICAgIDxwYXRoIGQ9Ik0gMzUgNjUgUSA1MCA4MCA2NSA2NSIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSI1IiBmaWxsPSJub25lIiAvPgo8L3N2Zz4=";

    function setUp() public {
        moodNft = new MoodNft(SAD_SVG_URI, HAPPY_SVG_URI);
    }

    function testViewTokenUri() external {
        vm.prank(USER);
        moodNft.minNft();
        console.log("The first imageUri is :", moodNft.tokenURI(0));

        console.log("The Second imageUri is :", moodNft.tokenURI(1));
    }
}
