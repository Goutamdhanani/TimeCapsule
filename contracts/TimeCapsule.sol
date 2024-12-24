// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeCapsule {
    struct Capsule {
        address creator;
        string message;
        uint256 unlockTime;
    }

    mapping(uint256 => Capsule) public capsules;
    uint256 public capsuleCount;

    // Create a new capsule
    function createCapsule(string memory message, uint256 unlockTime) public {
        require(unlockTime > block.timestamp, "Unlock time must be in the future");
        capsules[capsuleCount] = Capsule(msg.sender, message, unlockTime);
        capsuleCount++;
    }

    // View capsule contents (only if unlocked)
    function viewCapsule(uint256 capsuleId) public view returns (string memory) {
        Capsule memory capsule = capsules[capsuleId];
        require(block.timestamp >= capsule.unlockTime, "Capsule is still locked");
        return capsule.message;
    }
}
