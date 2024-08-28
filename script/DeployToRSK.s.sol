// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {RuneToken} from "../src/RuneToken.sol";

contract DeployToRSK is Script {
    function run() external {
        // Ensure the RPC URL is set
        string memory rpcUrl = vm.envString("ROOTSTOCK_RPC_URL");
        vm.createSelectFork(rpcUrl);

        // Load the private key from the environment variable
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting with the private key (the sender is derived from this key)
        vm.startBroadcast(privateKey);

        // Deploy the contract
        address initialOwner = vm.addr(privateKey); // Use the address derived from the private key as the initial owner
        RuneToken runeToken = new RuneToken(initialOwner);

        // Log the deployed contract address
        console.log(
            "Deployed RuneToken contract at address:",
            address(runeToken)
        );

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
