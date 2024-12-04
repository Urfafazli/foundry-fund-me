// SPDX-License-Idetifier

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Anything before a startBroadcast is not a real tx. Its gonna simmulate this in a simulated environment
        HelperConfig helperConfig = new HelperConfig();

        // We wrapped it up in a paranthesis because we are returning a struct
        // (address ethUsdPriceFeed) = helperConfig.activeNetworkConfig();

        // But since we are just having a single address it would do just fine without a bracket too
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        // Create a Mock Contract
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
