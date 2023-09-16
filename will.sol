// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.20 and less than 0.9.0
pragma solidity ^0.8.13;

contract Will {
    address owner;
    uint256 fortune;
    bool isIncapacitated;
    uint256 lastInteractionBlock;

    constructor() payable {
        owner = msg.sender;
        fortune = msg.value;
        isIncapacitated = false;
        lastInteractionBlock = block.number;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier mustBeIncapacitated() {
        require(isIncapacitated == true);
        _;
    }

    address payable beneficiary;

    mapping(address => uint256) inheritance;

    function setInheritance(address payable wallet) public onlyOwner {
        beneficiary = wallet;
        inheritance[wallet] = address(this).balance;
    }

    function still_alive() public onlyOwner {
        lastInteractionBlock = block.number;
    }

    function payout() private mustBeIncapacitated {
        beneficiary.transfer(inheritance[beneficiary]);
    }

    function check_alive() public {
        if (block.number - lastInteractionBlock > 10 && !isIncapacitated) {
        isIncapacitated = true;
        payout();
        }
    }
}
