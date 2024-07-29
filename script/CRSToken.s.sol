// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CRSToken} from "../src/CRSToken.sol";

contract CRSTokenScript is Script {
    CRSToken public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        token = new CRSToken();

        vm.stopBroadcast();
    }
}
