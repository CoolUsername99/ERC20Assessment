// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract ERC20Assessment is ERC20 {
    address public owner;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    function decimals() public view virtual override returns (uint8) {
        return 3;
    }

    function mint(address account, uint256 amount) public {
        require(msg.sender == owner, "You are not the owner of the contract.");
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }

}

// owner:    0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// address1: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2